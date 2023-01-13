library(dplyr)


# FILES


here <- function(...) {
    if (rstudioapi::isAvailable()) {
        home <- dirname(rstudioapi::getSourceEditorContext()$path)
    } else {
        home <- commandArgs() %>%
            tibble::enframe(name = NULL) %>%
            tidyr::separate(value, c("key", "value"), "=", fill = "right") %>%
            filter(key == "--file") %>%
            pull(value) %>%
            gsub("\\\\", "/", .) %>%
            gsub("/[^/]+?$", "", .)
    }
    paste(home, ..., sep = "/")
}


# DATA-FRAMES


clean_names <- function(x) {
    names(x) <- names(x) %>%
        gsub("[^0-9A-Za-z]+", "_", .) %>%
        trimws("both", "_") %>%
        gsub("^(\\d)", "x\\1", .) %>%
        tolower()

    x
}


# GAMMA DISTRIBUTION


gamma_shape <- function(x) {
    mean(x) ^ 2 / var(x)
}

gamma_scale <- function(x) {
    var(x) / mean(x)
}

gamma_norm <- function(x) {
    pgamma(x, gamma_shape(x), scale = gamma_scale(x))
}
