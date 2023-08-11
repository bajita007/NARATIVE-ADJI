import Foundation

struct PhoneCall: Codable {
    let id: Int
    let ownerNarrativePhoneId: String
    let ownerDeviceId: String?
    let triggeredAt: Date
    let callEndAt: Date?
    let zoomMeetingUrl: String
    let callbackUrl:String
}
