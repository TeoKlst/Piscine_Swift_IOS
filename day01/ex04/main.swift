var deck = Deck(mixed: false)
var x: Card?

print("ORDERED DECK:\n\(deck)\n")

x = deck.draw()

print ("DRAWN CARD:\(x!)")

x = deck.draw()

print ("DRAWN CARD:\(x!)\n")

print("ORDERED DECK:\n\(deck)\n")

print ("CARDS IN OUT:\n\(deck.out)\n")

print ("CARDS IN FOLD:\n\(deck.discards)\n")

deck.fold(c: deck.out[0])

print ("FOLD 1 CARD\n")

print ("CARDS IN OUT:\n\(deck.out)\n")

print ("CARDS IN FOLD:\n\(deck.discards)\n")