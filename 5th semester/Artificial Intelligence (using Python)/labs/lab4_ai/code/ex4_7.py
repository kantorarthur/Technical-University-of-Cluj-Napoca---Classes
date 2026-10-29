
def zip_and_print(a: list, b: list) -> None:
    for l1, l2 in zip(a, b):
        print(l1, l2)

if __name__ == '__main__':
    
    l1 = [1, 2, 3]
    l2 = ["a", "b", "a"]
    zip_and_print(l1, l2)
