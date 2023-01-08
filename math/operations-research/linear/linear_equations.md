# Linear Equations in OR

Linear equations are equations that have the form of a linear function, which
is a function of the form f(x) = ax + b, where a and b are constants. Linear
equations are often used in operations research to model relationships between
variables, and they can be used to represent a wide range of problems and
phenomena.

In operations research, linear equations are often used to represent
constraints and objectives in optimization problems. For example, in a linear
programming problem, the constraints and the objective function are often
represented as linear equations. Linear equations are also used to represent
networks in network optimization problems, where the variables in the equations
represent the flow of goods or resources through the network.

Linear equations are often used in operations research because they are
relatively simple to work with, and they can be solved using a variety of
techniques, including algebraic methods and optimization algorithms. Linear
equations are also useful because they can capture a wide range of
relationships between variables, and they can be extended to more complex
models by adding additional terms or variables.

## Example Problem

Suppose you are trying to plan a vacation and you have a budget of $1000. You
have two options for destinations: a beach resort and a mountain resort. The
beach resort costs $200 per night, and the mountain resort costs $300 per
night. You also have a limited number of vacation days, and you want to
maximize the number of days you can stay at each resort.

Formulate this problem as a linear programming problem, and then solve it using
the simplex algorithm.

To formulate this problem as a linear programming problem, you can start by
defining the decision variables. Let x be the number of days you stay at the
beach resort, and let y be the number of days you stay at the mountain resort.

Next, you can define the constraints for the problem. The budget constraint is
given by the equation 200x + 300y ≤ 1000, which states that the total cost of
the vacation cannot exceed $1000. The number of vacation days is also limited,
so you can add a constraint that limits the total number of days you can stay
at the resorts. For example, you might set a constraint that limits the total
number of days to 14, in which case you can add the constraint x + y ≤ 14.

Finally, you can define the objective function for the problem. In this case,
the objective is to maximize the number of days you can stay at the resorts, so
you can set the objective function as the sum of x and y: maximize x + y.

To solve this problem using the simplex algorithm, you can start by converting
the linear programming problem into standard form. This involves adding slack
variables to the constraints and turning the objective function into a linear
equation by multiplying it by -1. Then, you can use the simplex algorithm to
find the optimal solution to the problem.

### Solution

The linear programming problem can be written as follows:

Maximize x + y

Subject to: 200x + 300y ≤ 1000 x + y ≤ 14 x, y ≥ 0

To solve this problem using the simplex algorithm, we can start by converting
it into standard form. This involves adding slack variables s1 and s2 to the
constraints and turning the objective function into a linear equation by
multiplying it by -1:

Minimize -x - y

Subject to: 200x + 300y + s1 = 1000 x + y + s2 = 14 x, y, s1, s2 ≥ 0

Next, we can set up the initial simplex tableau as follows:

|        | x   | y   | s1  | s2  | $f_0$ |
| ------ | --- | --- | --- | --- | ----- |
| -$f_0$ | -1  | -1  | 0   | 0   | 0     |
| s1     | 200 | 300 | 1   | 0   | 1000  |
| s2     | 1   | 1   | 0   | 1   | 14    |

We can then use the simplex algorithm to find the optimal solution to the
problem. The first step is to select a pivot column, which is the column
corresponding to the most negative value in the $f_0$ row. In this case, the
pivot column is x, since -1 is the most negative value.

Next, we need to select a pivot row, which is the row corresponding to the
smallest positive ratio of the right-hand side value to the pivot element in
the pivot column. In this case, the pivot row is s1, since 200/1 = 200 is the
smallest positive ratio.

The next step is to pivot on the selected pivot element (1 in the s1 row and x
column) to obtain the following simplex tableau:

|        | x   | y    | s1  | s2  | $f_0$ |
| ------ | --- | ---- | --- | --- | ----- |
| -$f_0$ | 0   | -1/2 | 1/2 | 0   | 0     |
| s1     | 1   | 3/2  | 1/2 | 0   | 1000  |
| s2     | 1   | 1    | 0   | 1   | 14    |

We can then repeat the process of selecting a pivot column and a pivot row, and
pivoting on the selected pivot element. In this case, the pivot column is s2
and the pivot row is s2, so we pivot on the element 1 in the s2 row and s2
column:

|        | x   | y   | s1  | s2  | $f_0$ |
| ------ | --- | --- | --- | --- | ----- |
| -$f_0$ | 0   | -1  | 1/2 | 1/2 | 0     |
| s1     | 1   | 3/2 | 1/2 | 0   | 1000  |
| s2     | 0   | 0   | 0   | 1   | 7     |

At this point, the problem is solved and the optimal solution is x = 0, y = 7,
s1 = 0, and s2 = 0. This means that the optimal number of days to stay at the
beach resort is 0, and the optimal number of days to stay at the mountain
resort is 7. The total cost of the vacation is 300 * 7 = $2100, which is within
the budget of $1000.
