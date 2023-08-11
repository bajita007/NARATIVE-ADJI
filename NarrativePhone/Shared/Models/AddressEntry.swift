import Foundation

// Contact
struct AddressEntry: Codable {
    let id: Int
    let addressCategoryId: Int
    let name: String
    let narrativePhoneId: String
    let nbAuthorId: String?
    let nbOrganizationId: Int
    let description: String?
    let iconImgPath: String?
    let favourite: Bool
}
