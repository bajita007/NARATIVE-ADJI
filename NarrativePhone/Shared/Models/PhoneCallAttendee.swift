import Foundation

struct PhoneCallAttendee: Codable {
    let id: Int
    let phoneCallId: Int
    let narrativePhoneId: String
    let deviceId: String?
    let respoundAt: Date?
    let hangUpedAt: Date?
    let reject: Bool?
    let rejectMessage: String?
}
