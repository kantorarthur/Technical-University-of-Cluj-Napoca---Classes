import sqlite3
import csv

with sqlite3.connect('car.db') as conn: 
    conn.autocommit = True 
    cursor = conn.cursor() 
    # Create the table (if it doesn't exist)
    cursor.execute('''
    CREATE TABLE IF NOT EXISTS car (
        ID INTEGER PRIMARY KEY ,
        CAR_MAKER  TEXT NOT NULL, 
        CAR_MODEL  TEXT NOT NULL, 
        COLOR  TEXT NOT NULL, 
        TYPE  TEXT NOT NULL)'''
    )
 # Read the CSV file and insert data in batches
    batch_size = 1000
    data = []
    with open('cars.csv', 'r') as file:
        csv_reader = csv.reader(file)
        next(csv_reader)  # Skip header row
        for row in csv_reader:
            data.append((int(row[0]), row[1], row[2], row[3], row[4]))
        if len(data) == batch_size:
            cursor.executemany('''INSERT INTO car (id, 
                car_maker, car_model, color, type) VALUES (?, ?, ?, ?, ?)''', data)
            data = []
            conn.commit()
    # Insert any remaining data
    if data:
        cursor.executemany('''INSERT INTO car (id, 
            car_maker, car_model, color, type) VALUES (?, ?, ?, ?, ?)''', data)
    conn.commit()

print("Records inserted........") 
conn.close()    
