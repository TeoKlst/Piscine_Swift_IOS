import Foundation

class Deck: NSObject {
    static let allSpades:[Card]    = Value.allValues.map({Card(Color:Color.Spades, Value:$0)})
    static let allDiamonds:[Card]  = Value.allValues.map({Card(Color:Color.Diamonds, Value:$0)})
    static let allHearts:[Card]    = Value.allValues.map({Card(Color:Color.Hearts, Value:$0)})
    static let allClubs:[Card]     = Value.allValues.map({Card(Color:Color.Clubs, Value:$0)})

    static let allCards            = allSpades + allDiamonds + allHearts + allClubs

    var  cards:[Card]    = allCards
    var  discards:[Card] = []
    var  out:[Card]      = []

    init(mixed: Bool) {
        self.cards = Deck.allCards
        if mixed == false {
            self.cards.shuffle()
        }
    }

    override var description: String {
        return (self.cards.description)
    }

    func draw() -> Card? {
        let first : Card?
        first = self.cards.first
        self.out.append(first!)
        self.cards.remove(at: 0)
        return first
    }

    func fold(c: Card) {
        var i = 0
        for drawncards in self.out {
            if c == drawncards {
                self.discards.append(drawncards)
                self.out.remove(at:i)
            }
            i+=1
        }
    }
}

extension Array {
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        //How many times it's shuffled
        for _ in 0..<20
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}