import Fluent
import struct Foundation.UUID

/// Property wrappers interact poorly with `Sendable` checking, causing a warning for the `@ID` property
/// It is recommended you write your model with sendability checking on and then suppress the warning
/// afterwards with `@unchecked Sendable`.
final class Product: Model, @unchecked Sendable {
    static let schema = "todos"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "title")
    var title: String
    
    @Field(key: "image")
    var image: String

    init() { }

    init(id: UUID? = nil, title: String, image: String) {
        self.id = id
        self.title = title
        self.image = image
    }
    
    func toDTO() -> TodoDTO {
        .init(
            id: self.id,
            title: self.$title.value ?? "",
            image: self.$image.value ?? ""
        )
    }
}
