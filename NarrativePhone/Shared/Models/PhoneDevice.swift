import Foundation

struct PhoneDevice: Codable {
    let id: Int
    let userId: Int
    let phoneDeviceId: String
    let phoneDeviceDescription: String
    let createdAt: Date
    let available: Bool
    let deleted: Bool
}
