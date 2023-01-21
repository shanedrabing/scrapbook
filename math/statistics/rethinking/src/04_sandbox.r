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
