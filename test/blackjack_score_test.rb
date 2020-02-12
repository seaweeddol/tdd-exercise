require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it 'facecards have values calculated correctly' do
    hand = ['King', 'Queen', 'Jack']
    
    hand.each do |card|
      score = blackjack_score([card])
      expect(score).must_equal 10
    end
  end

  it 'calculates aces as 11 where it does not go over 21' do
    score = blackjack_score([2, 3, 'Ace'])

    expect(score).must_equal 16
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    score = blackjack_score([10, 3, 'Ace'])

    expect(score).must_equal 14
  end

  it 'raises an ArgumentError for invalid cards' do
    expect{blackjack_score(['banana', 54, 5])}.must_raise ArgumentError
  end

  it 'raises an ArgumentError for scores over 21' do
    expect{blackjack_score(['King', 6, 8, 3])}.must_raise ArgumentError
  end

  it 'raises an ArgumentError for hands larger than 5' do
    expect{blackjack_score(['King', 6, 8, 3, 'Ace', 'Queen', 10])}.must_raise ArgumentError
  end

end
