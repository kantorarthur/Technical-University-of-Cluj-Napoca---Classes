

class Truck:

    def __init__(self, numar_inmatriculare: str, cod: int) -> None:
        self.numar_inmatriculare = numar_inmatriculare
        self.cod = cod

    def __str__(self) -> str:
        return self.numar_inmatriculare + f" {self.cod}"



if __name__ == '__main__':

    trucks = list[Truck]

    with open("trucks.txt", "r") as file:
        for line in file:
            parts = line.split()
            trucks = [Truck(parts[i], parts[i + 1]) for i in range(0, len(parts), 2)]
    print(trucks[0].cod)

    file = open("unauthorized.txt", "w")
    file.write(f"{trucks[0]} \n")
    file.write(f"{trucks[1]} ")
    file.close()

    strr = 'a'
    print(1 + ord(strr))