let cardSpades:[Card] = Deck.allSpades
let cardHearts:[Card] = Deck.allHearts
let cardClubs:[Card] = Deck.allClubs
let cardDiamonds:[Card] = Deck.allDiamonds

let cardDeck:[Card] = Deck.allCards
var cardDeckShuffled:[Card] = Deck.allCards

print("ORDERED DECK:\n\(cardDeck)\n")

cardDeckShuffled.shuffle()
print("SHUFFLED DECK:\n\(cardDeckShuffled)\n")