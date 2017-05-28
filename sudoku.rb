#!/usr/bin/ruby

class Sudoku
 
	starting_board = Array.new(81)
	@@size

    def initialize(starting_board)
    	@starting_board = starting_board
    end
    
    def solved?	

    	for i in 0..@starting_board.length-1 

    		# changing every nil to zero for sorting purposes
    		if @starting_board[i][0] == nil
    			@starting_board[i][0] = 0
    		end

    		# creating arrays for every row, column and square

    		column = @starting_board.map{|a| a[i]}

    		length = column.length
    		@@size = Math.sqrt(column.length).to_i

    		row = Array.new(@@size)
    		
    		square = Array.new(@@size)

			for j in 0..@starting_board.length-1 do	

				row[j] = @starting_board[i][j]	
				square[j] = @starting_board[(i/@@size)*@@size + j/@@size][i*@@size%length+j%@@size];

			end

			#validating every column row and array if one of them is wrong returning false			
			if !(validate?(column) && validate?(row) && validate?(square))
				return false
			end			

		end

		return true 
    end

    #sorting and checking if numbers are not repeating 
    def validate?(array)
    	i = 1
    	array.sort!
    	for i in array do
    		if(array[i-1] != i) 
    			return false
    		end		
    	end
		return true
    end
    
    def set(x,y,number)
    	if x<1 || x>@@size*@@size || y<1 || y> @@size*@@size
    		puts "enter valid data"
    	else
    	@starting_board[y-1][x-1] = number
    	end
    end
    
    def print
		for i in 0..@starting_board.length-1 do
			for j in 0..@starting_board.length-1 do	
				if @starting_board[i][j] == 0
					@starting_board[i][j] = nil
				end	
				if @starting_board[i][j] == nil
					STDOUT.print " "
					STDOUT.flush
				end
				STDOUT.print @starting_board[i][j]
				STDOUT.print " "
				STDOUT.flush

				for q in 1..@@size-1
					if j == q*@@size-1 
						STDOUT.print "| "
						STDOUT.flush
					end
				end
			end

			for q in 1..@@size-1
				if i == q*@@size-1 
					puts
					STDOUT.print "---------------------"
					STDOUT.flush
				end
			end
			puts
		end		
    end
end