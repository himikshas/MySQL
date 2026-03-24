#!/usr/bin/env python3

""" Write a Python program using the mysql.connector package. Create a connection to your local
server (take the password if needed from a text file). Use the connector.cursor() object to query
for the student names and display them."""

import mysql.connector
#print(mysql.connector.__version__)


with open ("password.txt", "r") as file:
    pswd = file.read().strip()


mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password=pswd,
    database="library"
)

cursor = mydb.cursor()

query = "SELECT Student_Name FROM Student"
cursor.execute(query)

result = cursor.fetchall()

print("Student Name :")
for row in result:
    print(row[0])

cursor.close()
mydb.close()
