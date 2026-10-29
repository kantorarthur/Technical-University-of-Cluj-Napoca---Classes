
def flat_list(l: list[list]) -> list:
    ret_list = [val for col in l for val in col]
    return ret_list

if __name__ == '__main__':

    l1 = [[1, 2], [3, 4]]
    l2 = flat_list(l1)

    print(l2[2])