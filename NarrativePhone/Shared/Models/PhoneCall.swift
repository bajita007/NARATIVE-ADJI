import Foundation

struct PhoneCall {
    let id: Int
    let owner_narrative_phone_id: String
    let owner_device_id: String?
    let triggered_at: Date
    let call_end_at: Date?
    let zoom_meeting_url: String
    let callback_url:String
}
