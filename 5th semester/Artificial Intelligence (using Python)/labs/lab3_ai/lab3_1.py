import math


def softmax(x):
    numerator = 0
    return_vec = []
    for cur_el in x:
        numerator += math.exp(cur_el)
    for cur_el in x:
        return_vec.append(math.exp(cur_el) / numerator)
    return return_vec

x = [-0.4, 0, 0.2, 0.2, 0.4]

print(softmax(x))
