
def front3(front: str) -> str:
    
    ret_str = ''
    if len(front) < 3:
        for i in range(0, 3):
            ret_str += front
        return ret_str

    append_string = ''
    for i in range(0, 3):
        append_string += front[i]
    for i in range(0, 3):
        ret_str += append_string
    return ret_str
        


if __name__ == '__main__':

    ex = 'ab'
    prt_str = front3(ex)
    print(prt_str)



