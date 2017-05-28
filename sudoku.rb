#!/usr/bin/ruby

class Sudoku
 
	starting_board = Array.new(81)

    def initialize(starting_board)
    	@starting_board = starting_board
    end
    
    def solved?	

    	for i in 0..@starting_board.length-1 do

    		row = Array.new(9)
    		if @starting_board[i][0] == nil
    			@starting_board[i][0] = 0
    		end
    		column = @starting_board.map{|a| a[i]}
    		square = Array.new(9)

			for j in 0..@starting_board.length-1 do	

				row[j] = @starting_board[i][j]	
				square[j] = @starting_board[(i/3)*3 + j/3][i*3%9 +j%3];

			end

			if !(validate?(column) && validate?(row) && validate?(square))
				return false
			end			

		end

		return true
    end

    def validate?(check)
    	i = 0
    	check.sort!
    	for i in check do
    		if(check[i-1] != i) 
    			return false
    		end		
    	end
		return true
    end
    
    def set(x,y,number)
    	if x<1 || x>9 || y<1 || y> 9
    		"enter valid data"
    	end
    	@starting_board[x-1][y-1] = 2
    end
    
    def print

		for i in 0..@starting_board.length-1 do
			for j in 0..@starting_board.length-1 do	
				if @starting_board[i][j] == 0
					@starting_board[i][j] = nil
				end		
				STDOUT.print @starting_board[i][j]
				STDOUT.print " "
				STDOUT.flush
				if j==2 || j==5
					STDOUT.print "| "
					STDOUT.flush
				end
			end
			if i == 2 || i==5
				puts
				puts "---------------------"
			else
				puts
			end			
		end		
    end

end