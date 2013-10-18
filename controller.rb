class Controller

  def initialize
    @deck = nil
    @active_card = nil
    @view = View.new
  end


  def load_deck
    # @deck = Deck.new
    @deck = Deck.load_deck(csv_filename)
  end

  def pick_card
    @active_card = @deck.pick_card
    @view.display_definition(@active_card)
    answer = @view.prompt
    # if answer = false
    #   return false
    # end
    until @active_card.term == answer
      @view.incorrect
      @view.prompt
    end
    @view.correct

    # Returns a card object.
  end

  def correct?(viewer)
    @active_card.term == @view.answer
  end

  # def get_answer
  #   @view.prompt
  # end

end

class View
  def initialize
    @answer =nil
    puts_to_user(welcome)
  end

  def welcome
    "Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition.  Ready?  Go!"
  end

  def puts_to_user(string)
    puts string
  end

  def display_definition(active_card)
    puts "Definition"
    puts active_card.definition
  end

  def correct
    puts "Correct!"
  end

  def incorrect
    puts "Incorrect! Try again."
  end


  def prompt
    puts "\n\nGuess: "
    @answer = gets.chomp.downcase!
    # if @answer = ""
    #   return false
    # else
    #   @answer
    # end

  end

end


class Card
  def initialize(args = {})
    @term = term
    @definition = definition
  end
end

new_game = Controller.new()
new_game.load_deck
new_game.pick_card #until false??
