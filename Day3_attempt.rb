=begin

#Problem

- two wires are connected to a central port and extend outward on a grid
- you trace the path each wire takes as it leaves the central port, one wire per line of text (your puzzle input)

- the wires twist and turn, but the two wires occasionally cross paths
- to fix the circuit, you need to find the intersection point closest to the central port

- use the Manhattan distance for this measurement(use an online calculator)

- although the wires cross right at the central port where they both start, ignore this crossing point
- also ignore when a wire crosses with itself - seems like we're only concerned with where the two wires cross
  with each other and not at the central point where they both start.

- For example, if the first wire's path is R8, U5, L5, D3, then starting from the central port, it goes:
  right 8, up 5, left 5, down 3

  if the second wire's path is U7, R6, D4, L4 then it goes up 7, right 6, down 4, and left 4

  These wires cross at two locations: the closest one to the central port is up 3 and right 3 = 6

  A few more examples:
  
    R75,D30,R83,U83,L12,D49,R71,U7,L72
    U62,R66,U55,R34,D71,R55,D58,R83 = distance 159

    R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
    U98,R91,D20,R16,D67,R40,U7,R15,U6,R7 = distance 135

    Our goal is to calculate the Manhattan distance from the central port to the closest intersection

- I have no idea what sort of data structure to use here
- either a hash or an array?
- we're looking for common points?
- could we +/- all the up and down and left and right to find some sort of middle point that matches?
    - this one, as opposed to the last one, I feel like I completely understand the problem, but I hvae no idea how to code a solution
    - I could draw this all out on a piece of paper and come up with the correct answer, which really makes me confident that I understand the problem
    - but I have no guesses as of yet as to how to code it up
    - my mind keeps coming to using + and - for left and right and up and down
      - then finding where we hit on similar numbers
      - could we code something up where right is positive and left is negative, same for up being positive and down being negative
      - do up/down and left/right separately
        - do that for both inputs
        - output an array for up/down and left/right for each input
        - then check to see what the first number that up/down and left/right has in common with each other?

    I'm gonna take a stab at doing this manually with the shortest example. If that works, I can code a solution

R75,D30,R83,U83,L12,D49,R71,U7,L72 = + 145, 11
U62,R66,U55,R34,D71,R55,D58,R83 238, -12

= distance 159

#Input

#Output

#Examples

# Rules + Questions

#Algorithm 

# Implementation Notes 

=end


