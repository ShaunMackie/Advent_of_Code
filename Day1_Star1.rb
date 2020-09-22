=begin

#Problem

- you need measures from fifty stars
- collect stars by solving puzzles
- two puzzles will be avaialbe on each day in the Advent calendar
- the 2nd puzzle will unlock after you complete the first puzzle
- each puzzle grants one star, so 25 days * 2 stars per day = 50 stars

- fuel required to launch a given module is based on it's mass
- take it's mass, divide by three, round down, and substract two
- add all the final numbers together


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
- add each number's total together to get the answer

#Algorithm 

- for each number in the array:
  - divide the number by 3
  - round down
  - subtract 2
- add all the totals together

# Implementation Notes 
- initialize a results variable and assign an empty array
- iterate over the array of integers
- preform the math calculation on each integer
- store the result in results
- return the sum of results

=end

def find_fuel(array)
  results = []

  array.each do |num|
    results << (num / 3 - 2)
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
113158,
]

find_fuel([118997])
find_fuel(array)