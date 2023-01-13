# Load the lpSolve library
library(lpSolve)

# Define the objective function
obj <- c(-1, -1)

# Define the constraints
con <- matrix(c(200, 300, 1, 1, 1, 0,
                1, 1, 0, 0, 0, 1), ncol = 6, byrow = TRUE)

# Define the right-hand side values for the constraints
rhs <- c(1000, 14)

# Define the direction of the constraints ("<=" in this case)
dir <- c("<=", "<=")

# Solve the linear programming problem using the simplex method
sol <- lp("max", obj, con, dir, rhs, all.int = TRUE)

# Print the optimal solution
print(sol)

# Others
sol$solution
