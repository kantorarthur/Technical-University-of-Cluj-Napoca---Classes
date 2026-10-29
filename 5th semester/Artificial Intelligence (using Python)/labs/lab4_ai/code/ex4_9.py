

if __name__ == '__main__':

    mapp = {}

    inn = input()

    for i in inn:
        for word in i.split():
            mapp[word] = word
    for m in mapp:
        print(m)

    
    