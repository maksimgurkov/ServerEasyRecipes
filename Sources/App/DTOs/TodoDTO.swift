import Fluent
import Vapor

struct TodoDTO: Content {
    var id: UUID?
    var title: String
    var image: String
    
    func toModel() -> Product {
        let model = Product()
        
        model.id = self.id
        model.title = self.title
        model.image = self.image
        
        return model
    }
}
