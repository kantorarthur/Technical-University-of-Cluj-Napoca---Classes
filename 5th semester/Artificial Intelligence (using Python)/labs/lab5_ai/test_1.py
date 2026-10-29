
def ex_b(robots: list[list]) -> None:

    scored_robots = [ (name, (missions + bonus * 0.5) / (errors + 1) )
                      for name, missions, errors, bonus in robots]
    scored_robots.sort(key = lambda score: score[1])
    for name, score in scored_robots:
        print(name, score)

def ex_c(temps: dict[str, list[float]]) -> dict[str, float]:
    avg_dict = {}
    for city, temps in temps.items():
        avg_dict[city] = sum(temps) / len(temps)
    return avg_dict



if __name__ == '__main__':

    #ex a
    files = ["main.py", "utils.py", "date.txt"]
    for file in files:
        print(file)

    #ex b
    robots = [("R2", 8, 1, 4), ("Atlas", 6, 0, 2), ("Nova", 9, 3, 6), ("Bolt", 5, 2, 0)]
    ex_b(robots)

    #ex c
    temps = {"Cluj": [20, 22, 18], "Roma": [25, 27, 26], "Oslo": [5, 7]}
    print(ex_c(temps))