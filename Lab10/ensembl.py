#!/usr/bin/env python3

import mysql.connector
import cgi

print("Content-type: text/html\n")

# ----------- Read user input -----------
form = cgi.FieldStorage()

stable_id = form.getvalue("stable_id")
gene_name = form.getvalue("gene_name")
chromosome = form.getvalue("chromosome")
action = form.getvalue("action")


# ----------- DB Connection -----------
def get_connection():
    with open("password.txt", "r") as file:
        pswd = file.read().strip()

    return mysql.connector.connect(
        host="localhost",
        user="root",
        password=pswd,
        database="ensembl_local"
    )


# ----------- 1. Stable ID Details -----------
def display_stable_id(stable_id):
    mydb = get_connection()
    cursor = mydb.cursor()

    query = "SELECT * FROM gene WHERE stable_id = %s"
    cursor.execute(query, (stable_id,))

    result = cursor.fetchall()

    print("<h3>Stable ID Details</h3>")
    for row in result:
        print(row, "<br>")

    cursor.close()
    mydb.close()


# ----------- 2. Transcripts -----------
def display_transcripts(gene_name):
    mydb = get_connection()
    cursor = mydb.cursor()

    query = """
    SELECT t.* 
    FROM transcript t 
    JOIN gene g ON t.gene_id = g.gene_id 
    WHERE g.stable_id = %s
    LIMIT 5
    """

    cursor.execute(query, (gene_name,))
    result = cursor.fetchall()

    print("<h3>Transcripts</h3>")
    for row in result:
        print(row, "<br>")

    cursor.close()
    mydb.close()


# ----------- 3. Genes in Chromosome -----------
def display_genes(chromosome):
    mydb = get_connection()
    cursor = mydb.cursor()

    query = """
    SELECT g.* 
    FROM gene g 
    JOIN seq_region s ON g.seq_region_id = s.seq_region_id 
    WHERE s.name = %s
    LIMIT 10
    """

    cursor.execute(query, (chromosome,))
    result = cursor.fetchall()

    print("<h3>Genes in Chromosome</h3>")
    for row in result:
        print(row, "<br>")

    cursor.close()
    mydb.close()


# ----------- Main Controller -----------
if action == "stable" and stable_id:
    display_stable_id(stable_id)

elif action == "transcripts" and gene_name:
    display_transcripts(gene_name)

elif action == "genes" and chromosome:
    display_genes(chromosome)

else:
    print("<h3>Please provide valid input!</h3>")