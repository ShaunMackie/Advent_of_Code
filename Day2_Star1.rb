=begin

#Problem

- an Intcode program is a list of integers separated by commas
- to run one, start by looking at the first integer(index 0) - here you will find an opcode - either 1, 2, or 99
- the opcode - either 1, 2, or 99 - indicates what to do
  - 99 means the program is finished and should immediately halt.
  - 1 means add together the numbers read from two positions and store the result in the third position
    - the 3 integers immediately after the opcode tell you these three positions 
      - the first two inidicate the positions from which you should read the input values
      - the third inidicates the position at which the output should be stored. 
  - 2 means the same as 1, except we multiply the 2 numbers together(instead of adding)
- once you've finished processing an opcode, move ahead 4 places from the opcode (index 0) and repeat.
- repeat the proceess until you encounter the opcode 99, in which case you stop the program.

#Input

- an array of integers

#Output

- either an array of integers, or a list of integers(how to format?)

#Examples

opcode([1,0,0,0,99]) == [2,0,0,0,99]
opcode([2,3,0,3,99]) == [2,3,0,6,99]
opcode([2,4,4,5,99,0]) == [2,4,4,5,99,9801] 
opcode([1,1,1,4,99,5,6,0,99]) == [30,1,1,4,2,5,6,0,99]

# Rules + Questions

- 1 means to add, 2 means to multiply, 99 means to exit the program
- index 0 is the first opcode(1, 2, or 99)
- index 1 and 2 are the positions of the numbers that should be added together or multiplied
- index 3 is the position that the result of adding or multiplying should be stored - replace the existing integer
- skip ahead 4 index positons - to index 5, 9, 13 etc - to find the next sequence(starting with an opcode)
- exit the program whenever the current opcode index has a value of 99
- before running the program, replace position 1 with the value 12 and replace position 2 with the value 2.
- return the value left at position 0

#Algorithm 

- create an Intcode program(as described above)
- return the result of running the Intcode program on the given input(s)

# Implementation Notes 

- before running the program, replace the value at index 1 with the integer 12
  - and replace the value at index 2 with the integer 2
- init variable results and assign a copy of the given array
- init a variable counter and assign a value of 0
- init a variable current_number to store the value of adding the two numbers togeher - assign a value of zero
- init a loop
- break out of the loop if the integer at array counter is 99
- using a conditional
  - if the integer at index counter of the array is 1
    - add the two numbers from the appropriate indexes together and ressign the value at the appropriate index to this number
  - if the integer at index counter of the array is 2
    - repeat 2nd step except multiply
  - after either adding or multiplying, add 4 to the value of counter

- return the results array
- input the integer found at index 0 into the site


=end

def opcode(array)
  results = array.dup
  counter = 0
  current_number = 0

  loop do
    break if results[counter] == 99
    if results[counter] == 1
      current_number = results[results[counter + 1]] + results[results[counter + 2]]
      results[results[counter + 3]] = current_number
    elsif results[counter] == 2
      current_number = results[results[counter + 1]] * results[results[counter + 2]]
      results[results[counter + 3]] = current_number
    end
    counter += 4
  end
  results
end

# p opcode([1,0,0,0,99]) == [2,0,0,0,99]
# p opcode([2,3,0,3,99]) == [2,3,0,6,99]
# p opcode([2,4,4,5,99,0]) == [2,4,4,5,99,9801] 
# p opcode([1,1,1,4,99,5,6,0,99]) == [30,1,1,4,2,5,6,0,99]
p opcode([1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,19,5,23,1,23,9,27,2,27,6,31,1,31,6,35,2,35,9,39,1,6,39,43,2,10,43,47,1,47,9,51,1,51,6,55,1,55,6,59,2,59,10,63,1,6,63,67,2,6,67,71,1,71,5,75,2,13,75,79,1,10,79,83,1,5,83,87,2,87,10,91,1,5,91,95,2,95,6,99,1,99,6,103,2,103,6,107,2,107,9,111,1,111,5,115,1,115,6,119,2,6,119,123,1,5,123,127,1,127,13,131,1,2,131,135,1,135,10,0,99,2,14,0,0])
