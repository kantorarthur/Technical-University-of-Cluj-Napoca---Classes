

def ex1(tasks: list) -> None:
    for task in tasks:
        print(task)

def ex2(players: list[list]) -> list[list]:
    ret_list = [(name, (score + assists) / (deaths + 1)) for name, score, assists, deaths in players]
    return sorted(ret_list, key = lambda _: ret_list[1], reverse = True)

def ex3(apps: list[list]) -> dict:

    apps_dict = [{app_name, time / len(apps)} for app_name, time in apps]
    return apps_dict
    

if __name__ == '__main__':

    #ex1
    tasks = [3, 56, 2]
    ex1(tasks)

    #ex2
    players = [["alex", 3, 10, 1], ["marean", 1, 1, 1]]
    print(ex2(players))

    #ex3
    apps = [["poe", 10], ["boc", 11]]
    print(ex3(apps))

    #ex4
    
    inn = input()
    words = inn.split()

    print([w for w in words if len(w) >= 5])

    