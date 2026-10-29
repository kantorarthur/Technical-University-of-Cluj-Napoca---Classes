



if __name__ == '__main__':

    counts = {}

    with open("ex4_4.txt", "r") as f:
        for line in f:
            for word in line.split():
                counts[word] = counts.get(word, 0) + 1


    for word, freq in counts.items():
        print("Cuvant:{} ; frecventa: {} ".format(word, freq))
    


