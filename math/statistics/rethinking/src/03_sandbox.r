source("tools/lib.r")


# FUNCTIONS


coin <- function(n = 1) {
    2 * rbinom(n, 1, 1 / 2) - 1
}


# NORMAL DISTRIBUTION


# population size and number of steps
n <- 1e4
m <- 1e2

# all start at zero
people <- rep(0, n)

# step out
for (step in 1:m)
    people <- people + coin(n)

# since we land on even numbers
people <- people / 2

# plot out
if (FALSE) {
    png(here("../data/03_gauss.png"), 640, 640)
    op <- par(mar = c(0, 0, 0, 0))
    hist(people, breaks = min(people):max(people),
         axes = FALSE, main = NA, col = 1)
    par(op)
    dev.off()
}
