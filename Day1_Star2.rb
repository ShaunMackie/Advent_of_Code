=begin

#Problem

- you need measures from fifty stars
- collect stars by solving puzzles
- two puzzles will be avaialbe on each day in the Advent calendar
- the 2nd puzzle will unlock after you complete the first puzzle
- each puzzle grants one star, so 25 days * 2 stars per day = 50 stars

- fuel required to launch a given module is based on it's mass
- take it's mass, divide by three, round down, and substract two
- fuel also requires fuel, and that fuel requires fuel, and so on.
- any mass that would require negative fuel should instead be treated as if it requires zero fuel

- for each module mass, calculate it's fuel and add it to the total
- then treat the fuel amount you just calculated as the input mass and repeat the process
- continue until the fuel requirement is zero or negative
- add all of the fuel requirement numbers together
- then add every total fuel requirement together


#Input

- an array of integers

#Output

- an integer

#Examples

# Rules + Questions

- take each number in the array
- divide it by 3
- round down
- subtract by 2
- store this number
- repeat the process on the stored number
- continue until you reach a negative number or zero
- sum all the numbers together
- repeat this process on every number
- sum all the totals together to get the answer

#Algorithm 

- for each number in the given array:
  - divide the number by 3
  - round down
  - subtract 2
- store the resulting number(stored number)
- repeat the above-process on the stored number
- repeat until the last stored number is zero or negative
- sum all the stored numbers

# Implementation Notes 
- initialize a results variable and assign an empty array
- initialize a current_total variable and assign a value of zero
- initialize a current_number variable and assign a value of zero

- iterate over the array of integers
- assign current_number to num
- initialize a loop
  - preform the math calculation on each integer
  - reassign current_number to the result of the math calculation
  - break out of the loop if the current_number is zero or negative
  - add the number to the value of current_total
- store the value of current_total in results
- reassign current_number to zero
- reassign current_total to zero

- return the sum of results

=end
require 'pry'
def fuel_of_fuel(array)
  results = []
  current_total = 0
  current_number = 0

  array.each do |num|
    current_number = num
    loop do
      #binding.pry
      current_number = current_number / 3 - 2
      break if current_number <= 0
      current_total += current_number
    end
    results << current_total
    current_total = 0
    current_total = 0
  end
  p results.sum
end



array = [
118997,
63756,
124972,
141795,
111429,
53536,
50522,
143985,
62669,
77518,
60164,
72698,
123145,
57693,
87138,
82831,
53289,
60110,
115660,
51217,
117781,
81556,
103963,
89000,
109330,
100487,
136562,
145020,
140554,
102425,
93333,
75265,
55764,
70093,
73800,
81349,
141055,
56441,
141696,
89544,
106152,
98674,
100882,
137932,
88008,
149027,
92767,
113740,
79971,
85741,
126630,
75626,
125042,
69237,
147069,
60786,
63751,
144363,
81873,
107230,
90789,
81655,
144004,
74536,
126675,
147470,
123359,
68081,
136423,
94629,
58263,
122420,
143933,
148528,
129120,
78391,
74289,
106795,
143640,
59108,
64462,
78216,
56113,
64708,
82372,
115231,
74229,
130979,
83590,
76666,
93156,
138450,
71077,
128048,
65476,
85804,
145692,
106836,
70016,
113158
]

fuel_of_fuel(array)