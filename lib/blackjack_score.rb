# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

# Create a method called `blackjack_score(hand)`. This method:

# - Takes in one array (`hand`) of card values (example: `[2, 7, 8]` is a hand of three cards)
# - Returns an integer that is the hand's calculated score. These scoring rules follow all of the Blackjack scoring rules above. This is the most important core functionality.
# - Must raise an `ArgumentError` if the hand is a bust (what does a "bust" mean in this scenario?)
# - Must raise an `ArgumentError` if the hand contains non-cards (what does a "non-card" mean in this scenario?)
# - Must raise an `ArgumentError` if the hand contains more than five cards

def blackjack_score(hand)
  raise ArgumentError if hand.length > 5

  score = 0

  hand.each do |card|
    raise ArgumentError unless VALID_CARDS.include?(card)

    if card == 'Jack' || card == 'Queen' || card == 'King'
      score += 10
    elsif card == 'Ace'
      (score + 11) >= 21 ? score += 1 : score += 11
    else
      score += card
    end

    raise ArgumentError if score > 21
    return "You won Blackjack!" if score == 21
  end

  return score
end