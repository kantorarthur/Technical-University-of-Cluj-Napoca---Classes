import sqlite3
import csv

with sqlite3.connect('titanic.db') as conn: 
    conn.autocommit = True 
    cursor = conn.cursor() 
    # Create the table (if it doesn't exist)
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS titanic (
        PassengerId integer primary key ,
        Survived integer ,
        PClass integer ,
        Name text ,
        Sex text ,
        Age real ,
        SibSp integer ,
        Parch integer ,
        Ticket	text ,
        Fare real ,
        Cabin	text ,
        Embarked text)'''
    )

    with open('titanic.csv', 'r') as file:
        csv_reader = csv.reader(file)
        next(csv_reader)  # Skip header row
        data = [(int(row[0]), int(row[1]), int(row[2]), row[3], row[4], row[5], int(row[6]), int(row[7]), row[8], float(row[9]), row[10], row[11]) \
                for row in csv_reader]
        cursor.executemany('''INSERT INTO titanic (
            PassengerId, Survived, PClass, Name, Sex, Age,
            SibSp, Parch, Ticket, Fare, Cabin , Embarked ) 
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)''', data)
        conn.commit()

print("Records inserted........") 
conn.commit()
conn.close()