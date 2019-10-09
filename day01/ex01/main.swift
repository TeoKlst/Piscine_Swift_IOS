var card1 = Card(Color: Color.Hearts, Value: Value.King)

print(card1.description)

var card2 = Card(Color: Color.Spades, Value: Value.Queen)

print(card2.description)

print(card1 == card2)

print(card1.isEqual(card2))

var card3 = Card(Color: Color.Spades, Value: Value.Queen)

print(card3.description)

print(card3 == card2)

print(card3.isEqual(card2))