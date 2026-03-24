#!/usr/bin/env python3

""" Write a Python program using the mysql.connector package. Create a connection to your local
server (take the password if needed from a text file). Use the connector.cursor() object to query
for the student names and display them."""

""" Write another method in the python program that would display the list of students who are
defaulters (not returned their library books as on date)."""

import mysql.connector


"""Create and return database connection"""
def get_connection():

    with open("password.txt", "r") as file:
        pswd = file.read().strip()

    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password=pswd,
        database="library"
    )

    return mydb


"""Display all student names"""
def display_all_students():
    

    mydb = get_connection()
    cursor = mydb.cursor()

    query = "SELECT Student_Name FROM Student"
    cursor.execute(query)

    result = cursor.fetchall()

    print("\nList of All Students:")
    for row in result:
        print(row[0])

    cursor.close()
    mydb.close()


"""Display students who have not returned books"""
def display_defaulters():
    

    mydb = get_connection()
    cursor = mydb.cursor()

    query = """
        SELECT Student.Student_Name
        FROM Student
        INNER JOIN Book_issues
        ON Student.StudentID = Book_issues.StudentID
        INNER JOIN Books
        ON Books.BookID = Book_issues.BookID
        WHERE Book_issues.Returned_book = 0
    """

    cursor.execute(query)
    result = cursor.fetchall()

    print("\nList of Defaulters:")
    for row in result:
        print(row[0])

    cursor.close()
    mydb.close()


# Main Program
if __name__ == "__main__":
    display_all_students()
    display_defaulters()
