import numpy as np


def game_core_v0(number):
    '''The function takes the number (created by random) and return the number of attempts.
       First set the number to the middle of the range [0..100].
       Compare numbers: suggested by function and created by random.
       Reduce the range at each iteration, set the new number to the middle of the new range.'''
    count = 0
    lower = 1
    upper = 101
    predict = (upper - lower) / 2
    while (count < 100 and predict != number):
        count+=1
        if predict > number: 
            upper = predict # set the upper range limit to the suggested number on the previous iteration
        elif predict < number: 
            lower = predict # set the lower range limit to the suggested number on the previous iteration
        predict = lower + int((upper - lower)/2) # set the suggested number to the middle of the new range
    return(count) # exit if suggested number = created by number

def score_game(game_core):
    '''Run the function 1000 times'''
    count_ls = []
    np.random.seed(1)  # fix RANDOM SEED, to reproduce the experiment
    random_array = np.random.randint(1,101, size=(1000)) # array with 1000 random numbers
    for number in random_array:
        count_ls.append(game_core(number))
    score = int(np.mean(count_ls)) # mean values of attempts after 1000 runs
    print(f"The algorithm guesses the number in {score} attempts on average")
    return(score)

print(score_game(game_core_v0))