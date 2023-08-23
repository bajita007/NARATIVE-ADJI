import SwiftUI
import MobileRTC
import AVFoundation

struct StartCallService: UIViewControllerRepresentable {
    @Binding var meetingNumber: String
    @Binding var passCode: String
    
    private let delegate: MobileRTCMeetingServiceDelegate
    
    init(delegate: MobileRTCMeetingServiceDelegate, zoomMeetingNumber: Binding<String>, zoomPasscode: Binding<String>) {
        self._meetingNumber = zoomMeetingNumber
        self._passCode = zoomPasscode
        
        self.delegate = delegate
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        print("making the view controller")
        let newVC = UIViewController()
        newVC.view.tag = 83838383

        return newVC
    }
    
    func updateUIViewController(_ taskViewController: UIViewController, context: Context) {
        askPermissionsForCameraFeed()
        print("check video permissions")
    }
    
    func askPermissionsForCameraFeed() {
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                //access granted
                getMainWindowToShareWithAppDelegate()
            } else {
                print("Failed")
            }
        }
    }
    
    func getMainWindowToShareWithAppDelegate() {
        DispatchQueue.main.async {
            let scene = UIApplication.shared.connectedScenes.first
            let windowSceneDelegate = scene?.delegate as? UIWindowSceneDelegate
            let window = (windowSceneDelegate?.window)!
            UIApplication.shared.delegate = AppDelegate.Shared
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.window = window
            print("finding window to provide to zoom sdk")
            joinMeeting(meetingNumber: meetingNumber, meetingPassword: passCode)
        }
    }

    func joinMeeting(meetingNumber: String, meetingPassword: String) {
        // Obtain the MobileRTCMeetingService from the Zoom SDK, this service can start meetings, join meetings, leave meetings, etc.
        if let meetingService = MobileRTC.shared().getMeetingService() {
            // Create a MobileRTCMeetingJoinParam to provide the MobileRTCMeetingService with the necessary info to join a meeting.
            // In this case, we will only need to provide a meeting number and password.
            // 2. Set the ViewContoller to be the MobileRTCMeetingServiceDelegate
            meetingService.delegate = delegate
            let joinMeetingParameters = MobileRTCMeetingJoinParam()
            joinMeetingParameters.meetingNumber = meetingNumber
            joinMeetingParameters.password = meetingPassword
            
            // Call the joinMeeting function in MobileRTCMeetingService. The Zoom SDK will handle the UI for you, unless told otherwise.
            // If the meeting number and meeting password are valid, the user will be put into the meeting. A waiting room UI will be presented or the meeting UI will be presented.
            DispatchQueue.main.async {
                meetingService.joinMeeting(with: joinMeetingParameters)
            }
        }
    }
}


extension StartCallService {
    class Delegate: NSObject, MobileRTCMeetingServiceDelegate {
        func onMeetingError(_ error: MobileRTCMeetError, message: String?) {
            switch error {
            case .passwordError:
                print("Could not join or start meeting because the meeting password was incorrect.")
            case .success:
                print("onMeetingError : MobileRTCMeetError_Success")
            default:
                print("Could not join or start meeting with MobileRTCMeetError: \(error) \(message ?? "")")
            }
        }
        
        func onMeetingEndedReason(_ reason: MobileRTCMeetingEndReason) {
            print("Join meeting end reason.")
        }
        
        // Is called when the user joins a meeting.
        func onJoinMeetingConfirmed() {
            print("Join meeting confirmed.")
        }
        
        // Is called upon meeting state changes.
        func onMeetingStateChange(_ state: MobileRTCMeetingState) {
            print("onMeetingStateChange")
            switch state {
            case .connecting:
                print("Connecting")
            case .disconnecting:
                print("disconnecting")
            case .ended:
                print("ended")
            case .failed:
                print("failed")
            case .idle:
                print("idle")
            case .inMeeting:
                print("in meeting")
            case .inWaitingRoom:
                print("in waiting room")
            case .joinBO:
                print("join bo")
            case .leaveBO:
                print("leave bo")
            case .locked:
                print("locked")
            case .reconnecting:
                print("reconnecting")
            case .unknow:
                print("unknown")
            case .unlocked:
                print("unlocked")
                //           case .waitingExternalSessionKey:
                //               print("waiting external session key")
            case .waitingForHost:
                print("waiting for host")
            case .webinarDePromote:
                print("de promote")
            case .webinarPromote:
                print("promote")
            default:
                print("bad things happened")
            }
        }
    }
}
