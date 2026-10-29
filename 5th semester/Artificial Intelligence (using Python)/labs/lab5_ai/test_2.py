
class Planes:
    valid_prefix = ["wing", "jets", "avio", "aero"]

    def __init__(self, flight_code: str, verify_code: int) -> None:
        self.flight_code = flight_code
        self.verify_code = verify_code

    def is_valid(self) -> Optional[str]:
        if len(self.flight_code) != 6:
            return "Format incorect"

        if self.flight_code[0:4] not in Planes.valid_prefix:
            return "prefix necunoscut"
        if self.flight_code[4:6].isdigit() == False:
            return "format incorect"

        verify_sum = 0
        for i in range(0, 4):
            verify_sum += ord(self.flight_code[i]) - ord('a')
        for i in range(4, 6):
            verify_sum += int(self.flight_code[i]) * 2

        if verify_sum != self.verify_code:
            return "numar de verificare gresit"

        return None

    def __str__(self) -> str:
        return f"Plane [{self.flight_code}, {self.verify_code}]"



if __name__ == '__main__':

    planes = []
    f = open("planes.txt", "r")
    for line in f:
        codes = line.split()
        planes.append(Planes(codes[0], int(codes[1]) ) )

    print(planes[2])

    out_file = open("unauthorized.txt", "w")

    for plane in planes:
        if plane.is_valid() != None:
            out_file.write(plane.__str__() + 
                           " - " + plane.is_valid() + "\n")

    out_file.close()