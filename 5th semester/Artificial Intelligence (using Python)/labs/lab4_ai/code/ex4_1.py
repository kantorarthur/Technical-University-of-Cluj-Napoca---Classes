
def print_names(students: list[list]) -> None:

    grades = sorted(grade for _, grade in students)
    lowest = grades[0]
    second_lowest = 300000

    for grade in grades:
        if grade != lowest:
            second_lowest = grade
            break
    second_lowest_students = sorted(name for name, grade in students
                                            if grade == second_lowest)
    print(second_lowest_students)
            
if __name__ == '__main__':
    students = [ ['Alex', 30], ['Maria', 30], ['Irina', 35], ['Edu', 25]
                ,['Aab', 30] ]

    print_names(students)

