import Foundation

struct PhoneCallAttendee {
    let id: Int
    let phone_call_id: Int
    let narrative_phone_id: String
    let device_id: String?
    let respound_at: Date?
    let hang_uped_at: Date?
    let reject: Bool?
    let reject_message: String?
}
