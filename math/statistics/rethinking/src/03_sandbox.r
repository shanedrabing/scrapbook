library(rethinking)

source("tools/lib.r")

options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)


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


# LINEAR REGRESSION


# read in
howell <- "tools/data/howell.csv" %>%
    readr::read_delim()

# W, weight
# H, height
# U, unobserved

# W = f(H)
# W = f(H, U)

# W_i = \beta * H_i + U_i
# U_i ~ Normal(0, \sigma)
# H_i ~ Uniform(130, 170)

sim_weight <- function(height, slope, sigma) {
    error <- rnorm(length(height), 0, sigma)
    weight <- slope * height + error
    return(weight)
}

# parameters
n <- 200
min_cm <- 130
max_cm <- 170
slope <- 35 / 40
sigma <- 5

# simulation
height <- runif(n, min_cm, max_cm)
weight <- sim_weight(height, slope, sigma) - 90

# formulate priors
params <- alist(W ~ dnorm(mu, sigma),
                mu <- a + b * H,
                a ~ dnorm(0, 10),
                b ~ dunif(0, 1),
                sigma ~ dunif(0, 10))

# quadratic approximation
fit <- quap(params, data = list(W = weight, H = height))

# examine the approximation
fit
summary(fit)

# for out slice of data
weight <- sim_weight(height, fit@coef["b"], fit@coef["sigma"]) + fit@coef["a"]


# PROFIT


# lst = list(W = howell$weight, H = howell$height)
# fit <- quap(params, lst)
# weight <- sim_weight(howell$height, fit@coef["b"], fit@coef["sigma"]) + fit@coef["a"]


# VISUALIZATION


{
    png(here("../data/03_estimator.png"), 640, 480)
    op <- par(mar = c(5, 4.5, 2.5, 1.5))

    plot(howell$height, howell$weight, col = "grey", pch = 1,
         main = "Bayesian Estimator",
         xlab = "Height (cm)", ylab = "Weight (kg)")
    points(height, weight, col = 2, pch = 16)

    par(op)
    dev.off()
}
