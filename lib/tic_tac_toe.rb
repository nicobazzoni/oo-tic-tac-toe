class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " " ]
    end
    
    
    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]
 
    

    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end




   def input_to_index(player_input)
    player_input.to_i - 1
    end

    def move( i, curr_user = "X")
        @board[i] = curr_user
    end
    
    
        
    def position_taken?(index)
          if @board[index] == "" || @board[index] == " " || @board[index] == nil
            return false
          else
            return true 
          end
        end



    def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
    end
    
    def turn_count
        turn = 0
        @board.each do |index|
        if index == "X" || index == "O"
        turn += 1
        end
        end
        return turn
    end

    def current_player
            
             n_turns = turn_count
            if n_turns % 2 == 0
            player = "X"
            else
            player = "O"
            end
            return player
    end
            
    def turn
        puts puts "Please choose a number 1-9:"
        user_input = gets.chomp
        index = input_to_index(user_input)
        if valid_move?(index)
           token = current_player
           move(index,token)
         display_board
        else
            turn
        end
    end

    def won?
        
        WIN_COMBINATIONS.each {|win_combo|
        index_0 = win_combo[0]
        index_1 = win_combo[1]
        index_2 = win_combo[2]
        
        position_1 = @board[index_0]
        position_2 = @board[index_1]
        position_3 = @board[index_2]
        
        if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
        
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
        end
        }
        return false
    end
        
    def full?
        @board.all? {|i| i == "X" || i == "O"}
end
    def draw?
     if !won? && full?
      true
      else
     false
    end
     end
    
     def over?
        if won? || draw?
            true
        else
            false
        end 
    end

    def winner 
        i = []
        i = won?
        if i == false
            nil
        elsif @board[i[0]] == "X"
            "X"
        else
            "O"
        end
        
    end
    
    def play
        until over? 
         turn
        end
        
        if won?
            puts "Congratulations #{winner}!"
          elsif draw?
            puts "Cat's Game!"
          
        end
    end
    
    @TicTacToe
    
end