import Foundation
import SwiftData

@Model
class Data: Identifiable{
    var id:String
    var name : String
    
    init(id: String, name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
