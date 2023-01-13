library(dplyr)


# FUNCTIONS


die <- function(n) {
    function(...) sample(1:n, 1)
}

fork <- function(n, k) {
    do.call(expand.grid, rep(list(1:n), k)) %>%
        as.matrix() %>%
        unname()
}


# SCRIPT


# mapping
key <- c("W", "L", "L", "L")

# roll one possiblity
roll <- die(4)
path <- replicate(3, roll())
path <- c("W", "L", "W")

# possible paths
mat_repr <- fork(4, 3) %>%
    apply(2, function(x) key[x])

# how often do we see our actual path?
equal <- mat_repr %>%
    apply(1, identical, path)


# PRINT OUT


cat("We rolled...  ", path, "\n", sep = "")
cat("Likelihood... ", 100 * mean(equal), "%\n", sep = "")
print(equal %>% table() %>% unlist())


# CODE SAMPLE


# define sample
samp <- unlist(strsplit("WLWWWLWLW", NULL))

# count W and L
W <- sum(samp == "W")
L <- sum(samp == "L")

# globes
p <- seq(0, 1, 0.05)

# counts the number of paths per globe, produce probabilities
ways <- sapply(p, function(q) (q * 4)^W * ((1 - q) * 4)^L)
prob <- ways / sum(ways)

# table
df <- data.frame(p, ways, prob)
df

{
    pdf("plot.pdf", 9, 7)
    op <- par(mar = c(5, 4, 2, 1))

    barplot(df$prob, names.arg = round(df$prob, 2),
            ylim = c(0, 1), las = 2, col = 1)

    par(op)
    dev.off()
}


# GENERATIVE SIMULATION


sim_globe <- function(p, N) {
    sample(c("W", "L"), N, TRUE, c(p, 1 - p))
}

make_bars <- function(p, k = 20) {
    n <- round(p * k)
    paste(c(rep("#", n), rep(" ", k - n)), sep = "", collapse = "")
}

compute_posterior <- function(samp, poss = seq(0, 1, 0.25)) {
    # count W and L
    W <- sum(samp == "W")
    L <- sum(samp == "L")

    # counts the number of paths per globe, produce probabilities
    ways <- sapply(poss, function(q) (q * 4)^W * ((1 - q) * 4)^L)
    post <- ways / sum(ways)

    # graphical bars
    bars <- sapply(post, make_bars)

    # return out
    data.frame(poss, ways, post = round(post, 3), bars)
}

samp <- sim_globe(0.7, 10)
compute_posterior(samp)
samp


# INFINITE POSSIBILTIES


# beta distribution
d_beta <- function(p, W, L) {
    fct <- factorial
    nrm <- fct(W + L + 1) / (fct(W) * fct(L))
    nrm * (p ^ W) * ((1 - p) ^ L)
}

{
    svg("plot.svg", 7, 5)
    op <- par(mar = c(5, 4.5, 1, 1))

    x <- seq(0, 1, 0.01)
    y <- dbeta(x, 6, 4)

    plot(x, y, type = "l", lwd = 3, xlab = "p", ylab = "Density")

    par(op)
    dev.off()
}


# EXAMPLE SUMMARY


post_samp <- rbeta(1e4, 6, 4)

{
    pdf("plot.pdf", 7, 5)
    op <- par(mar = c(4.5, 4.5, 2.5, 1.5))

    plot(density(post_samp, adjust = 0.1),
         main = "Sampled Beta Distribution",
         xlab = "p", ylab = "Density")
    curve(dbeta(x, 6, 4), add = TRUE, col = 2)

    par(op)
    dev.off()
}

pred_post <- sapply(post_samp, function(p) sum(sim_globe(p, 10) == "W"))
tbl <- table(pred_post)

{
    pdf("plot.pdf", 7, 5)
    barplot(tbl)
    dev.off()
}
