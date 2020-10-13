=begin

#Problem

- Intcode programs are given as a list of integers
- these values are used as the initial state for the computer's memory
- when you run an Intcode program, make sure to start by initializing memory to the program's values.
- a position in memory is called an address - for example, the first value in memory is at address 0
  - this makes me think that they're referring to index positions. Since it starts at 0

Opcodes, such as 1, 2, and 99 mark the beginning of an instruction.
- the values used immediately after an opcode are called the instruction's parameters.
- For example, in the instruction 1, 2, 3, 4 - 1 is the opcode; 2, 3, and 4 are the parameters
- so a block, in this case, is 4. The first integer is an instruction, and the 3 that follow are parameters
- the opcode 99 only contains 1 instruction, because it has no parameters becuase it stops the program

- The address of the current instruction is called the instruction pointer
  - reasonably confident that the instruction pointer is a single index number/position,
  - because a position in memory is called an address and the first value in memory is at address 0
  - so an address is another way of saying an index position. 
  - and so the instruction pointer is an index position, since it's an address

- After an instruction finishes, the instruction pointer increases by the number of values in the instruction
  - Until we add more instrcutions, this is always 4 for the add and multiply instructions
  - so the instruction pointer starts at 0, and increases by 4.
  - that still seems to match indexes, since the address of the current instruction, the construciton pointer,
    starts at 0, then it would be 4, 8, 12, etc etc
- Reasonably confident that this is true - the instruction pointer moves from it's current index position to 4 positions ahead

- The goal is to determine what pair of inputs produces the output 19690720
- the inputs should still be provided to the program by replacing the values at addresses 1 and 2
- in this program, the vlaue places in address 1 is called the noun, the value in address 2 is called the verb
- each of the two inputs will be between 0 and 99 inclusive

- in other words, we need to come up with two integers that we place at the 2nd and 3rd index positions
- in other words, two integers that go in index position 1 and 2

- Once the program is halted(I assume by the 99 code) it's output is avaiable at addresss 0 - the instruction pointer?
  - what output are they speaking of? 
- each time you try a pair of inputs, make sure you first reset the computer's memory to the value in the program
  - reset your puzzle input - still don't understand what this means
  - in other words, don't reuse memory from a previous attempt - memory is...the given list of integers,
    which are used as the initial state for the computer's memory? 
  - still having a hard time understanding what they mean by 'output' as well as reseting the memory
  
- Find the input noun and verb that cause the program to produce the output 1960720.
- this sounds like we need to find two numbers between 0 and 99 to place in the 2nd and 3rd index position so 
that the given number, 19690720 is assigned to the first index position (0)
- What is 100 * noun + verb? FOr example, if noun = 12 and verb = 2, the answer would be 1202

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
p opcode([1,52,96,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,19,5,23,1,23,9,27,2,27,6,31,1,31,6,35,2,35,9,39,1,6,39,43,2,10,43,47,1,47,9,51,1,51,6,55,1,55,6,59,2,59,10,63,1,6,63,67,2,6,67,71,1,71,5,75,2,13,75,79,1,10,79,83,1,5,83,87,2,87,10,91,1,5,91,95,2,95,6,99,1,99,6,103,2,103,6,107,2,107,9,111,1,111,5,115,1,115,6,119,2,6,119,123,1,5,123,127,1,127,13,131,1,2,131,135,1,135,10,0,99,2,14,0,0])
#p opcode([1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,19,5,23,1,23,9,27,2,27,6,31,1,31,6,35,2,35,9,39,1,6,39,43,2,10,43,47,1,47,9,51,1,51,6,55,1,55,6,59,2,59,10,63,1,6,63,67,2,6,67,71,1,71,5,75,2,13,75,79,1,10,79,83,1,5,83,87,2,87,10,91,1,5,91,95,2,95,6,99,1,99,6,103,2,103,6,107,2,107,9,111,1,111,5,115,1,115,6,119,2,6,119,123,1,5,123,127,1,127,13,131,1,2,131,135,1,135,10,0,99,2,14,0,0])

#This felt a bit like cheating, since I figured it out by manually swapping numbers to find the answer
#was very difficult to understand the problem
#I wasn't sure I understood it correctly, so I was manually messing with the input, and found the answer
#so I didn't actually write any code for this problem. I would have probably used a double loop and broke out
#when the output gave me the correct answer