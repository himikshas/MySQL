#!/usr/bin/env python3

""" Write another method in the python program that would display the list of students who are
defaulters (not returned their library books as on date)."""

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

query = """select Student.Student_Name
     from Student
     inner join Book_issues
     on Student.StudentID = Book_issues.StudentID 
     inner join Books 
     on Books.BookID = Book_issues.BookID
     where Book_issues.Returned_book = 0"""

cursor.execute(query)

result = cursor.fetchall()

print("Student Name :")
for row in result:
    print(row[0])

cursor.close()
mydb.close()