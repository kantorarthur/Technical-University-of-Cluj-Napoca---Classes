
def consecutive(l1: list, l2: list) -> bool:
    
    if len(l1) < 3 or len(l2) < 3:
        return False
    
    for i in range( 0, len(l1) ):
        for j in range( 0, len(l2) ):
            if l1[i] == l2[j]:
                cnt = 1
                j2 = j + 1
                i2 = i + 1
                while i2 < len(l1) and j2 < len(l2):
                    if l1[i2] != l2[j2]:
                        break
                    cnt += 1
                    if cnt == 3:
                        return True
                    j2 += 1
                    i2 += 1
    return False

if __name__ == '__main__':
    l1 = [1, 10, 9, 10, 8]
    l2 = [10, 9, 10, 7, 6]
    print(consecutive(l1, l2))
    l3 = [8, 10, 9, 7, 6]
    print(consecutive(l1, l3))
