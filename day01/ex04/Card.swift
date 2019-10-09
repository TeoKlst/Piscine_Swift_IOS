import Foundation

class Card: NSObject {

    var color: Color
    var value: Value

    override var description: String {
        let descrip:String = "\(self.value) of \(self.color)"
        return descrip
    }

    init(Color color:Color, Value value:Value) {
        self.color = color
        self.value = value
    }

    override func isEqual(_ object: Any?) -> Bool {
        if let obj = object as? Card {
            return (obj.color == self.color && obj.value == self.value)
        } else {
            return false
        }
    }
}