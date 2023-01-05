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
p <- seq(0, 1, 0.25)

# counts the number of paths per globe, produce probabilities
ways <- sapply(p, function(q) (q * 4)^W * ((1 - q) * 4)^L)
prob <- ways / sum(ways)

# table
df <- data.frame(p, ways, prob)
df

{
    pdf("plot.pdf")
    barplot(df$prob, names.arg = round(df$prob, 2))
    dev.off()
}
