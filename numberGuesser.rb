@playing = true
@number_of_guesses = 1
@lower = 0
@higher = 100
@guess = 50
puts `clear`
puts "What is your name?"
@name = gets.chomp
puts `clear`
puts "Hello #{@name}, guess a number between 1 and 100"

def start_game
    @playing = true
    @number_of_guesses = 1
    @lower = 0
    @higher = 100
    @guess = 50
end

def end_game
    @playing = false
    puts `clear`
    puts "I guessed your number in #{@number_of_guesses} tries"
    puts "Do you want to play again? (Y/n)"
    play_again = gets.upcase
    puts `clear`
    if play_again == "Y\n" || play_again =="\n"
        puts "Hello again #{@name}, guess a number between 1 and 100"
        start_game
    end
end


def is_lower
    @lower = @guess
     @guess = ((@higher + @guess) / 2).round
end

def is_higher
    @higher = @guess
    @guess = ((@lower + @guess) / 2).round
end

start_game

while @playing
    puts "thinking..."
    sleep 2
    puts `clear`
    puts "Is your number #{@guess}? (Y/n)"
    is_correct = gets.upcase
    puts `clear`
    if is_correct =="Y\n" or is_correct =="\n"
        end_game
    else
        @number_of_guesses +=1
        puts "Was my guess higher or lower than your number?(l/h)" 
        response = gets.chomp.upcase
        puts `clear`
        if response == "L"
            is_lower
        elsif response == "H"
            is_higher
        end                      
    end
end
