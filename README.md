# TDD Exercise

In this exercise you will write a method and set of tests in TDD fashion which calculates a hand's BlackJack score.

This activity can be completed individually or with a neighbor.

## About BlackJack

In the card BlackJack each card has a value.
-  Number cards (2-10) carry the card's numeric value.
-  Face cards on the other hand ("Jack", "Queen", "King") have a value of 10.
-  Aces (1) can have a value of either 1 or 11, whichever will get the hand closest to 21 without going over.

For example if I had a 3, a King, and an Ace, my BlackJack score is 14 (3 + 10 + 1).  If I have an Ace, and a Jack then my score is 21 (11 + 10).

A hand, an array of Card values, must be between 2 and 5 items inclusive.

When a hand's score is greater than 21, the hand is a **bust** and the player automatically loses.

## Part 0: Understanding the Requirements

With our understanding of Blackjack the game, these are our requirements:

Create a method called `blackjack_score(hand)`. This method:

- Takes in one array (`hand`) of card values (example: `[2, 7, 8]` is a hand of three cards)
- Returns an integer that is the hand's calculated score. These scoring rules follow all of the Blackjack scoring rules above. This is the most important core functionality.
- Must raise an `ArgumentError` if the hand is a bust (what does a "bust" mean in this scenario?)
- Must raise an `ArgumentError` if the hand contains non-cards (what does a "non-card" mean in this scenario?)
- Must raise an `ArgumentError` if the hand contains more than five cards

## Part 1: Identifying Edge & Nominal Cases

### Come up with the Test Cases

Based on your understanding of all of the requirements for `blackjack_score(hand)` listed above, list three or more test cases needed. For each test case, name:

- A value for `hand`
- An expected value/outcome for the method `blackjack_score(hand)` to produce
- Which requirement the test case is validating

### Compare your Test Cases To Ours

Open up the file `test/blackjack_score_test.rb` and read through our test names (or the names of tests inbetween `it` and `do`).

Compare these test names to the test cases you came up with.

Did our test suite include any test cases you didn't come up with? What did they cover that you didn't anticipate? Did you have as many tests on the core functionality of the scoring rules (namely, the rules around scoring aces?)?

What test cases are **missing** from our test suite?

### Identifying Edge & Nominal Cases

Looking at our test suite and our test case names, answer:

1. Which test cases seem to test the obvious core functionality of the method, and are **nominal test cases**?
2. Which test cases seem to test the non-obvious requirements of the method, and are **edge test cases**?

<details>
  
  <summary>Check your answers with ours afterwards!</summary>
  
  Because the core functionality and primary responsibility of the `blackjack_score` method is to calculate a score, we could consider these as the nominal cases:
  
  - "can calculate the score for a pair of number cards"
  - "facecards have values calculated correctly"
  - "calculates aces as 11 where it does not go over 21"
  - "calculates aces as 1, if an 11 would cause the score to go over 21"
  
  Because it is a non-obvious scenario to imagine the `blackjack_score` method with a different input besides the hand, from our existing test suite, we could consider these as the edge cases:
  
  - "raises an ArgumentError for invalid cards"
  - "raises an ArgumentError for scores over 21"
  
  However, if your answers don't align perfectly with ours, that's okay; nobody will ever be graded on their ability to label nominal vs. edge case. The important thing is to think of the obvious and non-obvious test cases as a habit.
  
</details>

## Part 2: TDD the Implementation of `blackjack_score`

Let's test-drive the implementation of the `blackjack_score` method!

Let's aim to finish two test cases of this method.

### it "can calculate the score for a pair of number cards"

Look at the test `"can calculate the score for a pair of number cards"` in `test/blackjack_score_test.rb`.

Reading the pre-existing code, first identify:
- What is the value for `hand` (Arange)
- What is the expected value/outcome for the method `blackjack_score(hand)` to produce (Assert)
- Which requirement the test case is validating

Then, translate your notes into the Ruby code that will be your **Assert** step. Use the Minitest Matchers table below.

<details>
  
  <summary>Then check your Assert step with ours</summary>
  
  If the expected value is `7`, then one line we can write can be `expect(score).must_equal 7`
  
</details>

<br>

Once you have an Assert step written in the test, run the tests and watch it go RED.

Now, switch to `lib/blackjack_score.rb`, and implement enough code that will make the test pass, or go GREEN.

After that, high five your neighbor.

### it "facecards have values calculated correctly"

Look at the test `"facecards have values calculated correctly"` in `test/blackjack_score_test.rb`.

First, identify:
- Which requirement the test case is validating
- What is a specific value for `hand` that you can pick for this test case (Arange)
- What is the expected value/outcome for the method `blackjack_score(hand)` to produce (Assert)

Are you having trouble coming up with a specific value for `hand`? That's because there are a lot of things that `hand` could be! **If this test case name is too vague, consider:**

- Splitting this test into smaller tests. Consider renaming the test to "the facecard "King" is calculated correctly," and creating three more for the other face cards besides "King."
- Adding a loop to this test. Did you know that you can have an `each` loop in a test? You can even put your Assert step inside of a loop.

Second, create the pseudocode for the Arrange-Act-Assert of this test. Once you have that, check-in with a neighbor.

Third, translate your pseudocode for this test into Ruby code. Then check-in with a neighbor.

Finally, proceed with the Red-Green-Refactor cycle!

## Copy and Paste Reference of Minitest Matchers

For your convenience, here's a table of Minitest Matchers to use in the **Assert** step of each test.

## List of Minitest Matchers

|   Matcher	|   Example	|   What it does	|   	Negation |
|---	|---	|---	|---	|
|   `must_equal`	|   `expect(obj1).must_equal obj2`	|   The test succeeds if the object equals the given object.  It fails otherwise.	|   	`wont_equal` |
|   `must_be`	|   `expect(num).must_be :>, 5`	|   It lets you compare the given object to another using a given operator.  In this example num must be greater than 5.	|  `wont_be`  |
|   `must_be_empty`	|   `expect(list).must_be_empty`	|   The test passes if the given collection is empty.	|  `wont_be_empty` |
|   `must_be_instance_of`	|   `expect(@bill).must_be_instance_of Bill`	|   The test passes if the object is an instance of the given class.	|  `wont_be_instance_of`  |
|   `must_be_kind_of`	|   `expect(list).must_be_kind_of Enumerable`	|   The test fails if the object is not a kind of the argument.	| `wont_be_kind_of`  |
|   `must_be_nil`	|   `expect(list).must_be_nil`	|   The test fails if the given object is not nil.	|  `wont_be_nil`   |
|   `must_be_same_as`	|   `expect(list).must_be_same_as another_list`	|   The test fails if the object is not the same as the given argument.	|    `wont_be_same_as`  |
|   `must_be_silent`	|   `expect { obj1.do_something }.must_be_silent`	|   The test fails if the given block outputs something to the terminal (like using puts etc).  	|  `wont_be_silent`   |
|   `must_be_close_to`	|   	`expect(Math::PI, (22.0 / 7.0)).must_be_close_to 0.01` |  In the documentation's example: `expect(Math::PI, (22.0 / 7.0)).must_be_within_delta 0.01`, this expectation will pass because 22.0/7 - Math::PI == 0.001264..., which is less than the allowed delta of 0.01.	|  `wont_be_close_to`  |
|   `must_include`	|   `expect(list).must_include 31`	|   The test fails if the collection does not contain the given value.	|  `wont_include`  |
|   `must_match`	|   `expect(name).must_match /silly/`	|   The test fails if the object doesn't match the given regular expression.	|  `wont_match`  |
|   `must_output`	|   `expect { obj.do_something }.must_output "something"	`|   The test fails if the given block does not output the given value.	|
|   `must_respond_to`	|   `expect(bill).must_respond_to :tax`	|   The test fails if the object does not respond to the given method name.  	|  `wont_respond_to`  |
|   `must_raise`	|   `expect { obj1.do_something }.must_raise NoMethodError`	|   The test fails if the given block does not raise the given exception.	|    |
|   `must_throw` |   	`expect { obj1.do_something }.must_throw Exception` |   	Similar to `must_raise`  You can probably safely ignore this, but you can see [here](http://stackoverflow.com/questions/51021/what-is-the-difference-between-raising-exceptions-vs-throwing-exceptions-in-ruby) for an explanation on the differences between raise and throw..  | `wont_throw`  |

## Conclusion

Feel free to keep going on this exercise, but only the first two test cases need to follow the Red-Green-Refactor pattern
