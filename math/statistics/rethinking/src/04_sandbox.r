library(rethinking)

source("tools/lib.r")


# SETUP


# rstan parameters
options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)

# load data
data(Howell1)

# make it a bit prettier
howell <- Howell1 %>%
    as_tibble()


# DAG


# H -> W
# S -> W
# S -> H


# Sythesizing People


# 1 is F
# 2 is M
sim_HW <- function(S, b, a) {
    N <- length(S)
    H <- ifelse(S == 1, 150, 160) + rnorm(N, 0, 5)
    W <- a[S] + b[S] * H + rnorm(N, 0, 5)
    data.frame(S, H, W)
}

S <- rbern(100) + 1
df <- sim_HW(S, c(0.5, 0.6), c(0, 0))


# VISUALIZATION


# looking at Howell data, height by weight with sexes
with(howell, {
    pdf(here("../data/pdf/howell_sex_scatter.pdf"), 9, 6)
    op <- par(mar = c(5.5, 5, 3, 1.5))

    # parameters
    color <- ifelse(male, 4, 2)
    shape <- ifelse(male, 2, 1)
    ticks <- do.call(c, lapply(10 ^ (0:9), function(i) i * (1:9)))

    # start plot
    plot(height, weight, type = "n",
         main = "Howell !Kung Demographics",
         xlab = "Height (cm)", ylab = "Weight (kg)")

    # axis lines
    abline(h = ticks, v = ticks, col = "grey80")

    # scatter plot
    points(height, weight, pch = shape, col = color)

    # legend for sex
    legend(min(height), max(weight), c("Male", "Female"),
           pch = shape, col = color, bg = "white")

    par(op)
    dev.off()
})

# height differences between sexes
with(subset(howell, age >= 20), {
    pdf(here("../data/pdf/howell_sex_box.pdf"), 9, 6)
    op <- par(mar = c(5.5, 5, 3, 1.5))

    boxplot(height ~ male, horizontal = TRUE,
            col = c(2, 4),
            main = "Howell !Kung Demographics (over 20 y.o.)")

    par(op)
    dev.off()
})

# 1234
# 5145
