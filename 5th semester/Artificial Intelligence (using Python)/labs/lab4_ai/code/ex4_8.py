
class GeometricForm:
    def __init__(self, x: float, y: float) -> None:
        self.x = x
        self.y = y
    def getArea() -> str:
        return "..."
    def getPerimater(x: float, y: float) -> str:
        return "..."

class Rectangle(GeometricForm):

    def __init__(self, x: float, y: float) -> None:
        super().__init__(x, y)

    def getArea(self) -> float:
        return self.x * self.y

class Circle(GeometricForm):

    def __init__(self, x: float, y: float):
        super().__init__(x, y)

    def getPerimater(self) -> float:
        return 2


if __name__ == '__main__':

    rect = Rectangle(3, 2.5)
    print("Rect: {}".format(rect.getArea()))

    circ = Circle(3, 2.5)
    print("Circ: {}".format(circ.getPerimater()))
