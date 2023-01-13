import itertools


# FUNCTIONS


comb = itertools.combinations_with_replacement
prod = itertools.product


# SCRIPT


if __name__ == "__main__":
    # what path did we get?
    path = tuple("WLWWWLWLW")

    # define possible globes
    globes = tuple(comb("LW", 4))

    # for each globe
    for globe in globes:
        # find all possible paths of same length
        paths = tuple(prod(globe, repeat=len(path)))
        
        # count the equivalent ones
        equal = paths.count(path)

        # print out
        print("".join(globe), equal, len(paths))
