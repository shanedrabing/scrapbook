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


# VISUALIZATION


# looking at Howell data, height by weight with sexes
with(howell, {
    pdf(here("../data/pdf/howell_sex.pdf"), 9, 6)
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

# 1234
# 5145
