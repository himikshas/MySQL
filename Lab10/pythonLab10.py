#!/usr/bin/env python3

import mysql.connector


"""Create and return database connection"""
def get_connection():

    with open("password.txt", "r") as file:
        pswd = file.read().strip()

    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password=pswd,
        database="ensembl_local"
    )

    return mydb

""" a. List details of a specific stable_id - say 'ENSG00000159023' from the gene table"""
def display_stable_id():

    mydb = get_connection()
    cursor = mydb.cursor()

    query = " SELECT * FROM gene WHERE stable_id like 'ENSG00000012048' "
    cursor.execute(query)
    
    result = cursor.fetchall()
    
    print("\nDetails of the stable_id ' ENSG00000012048 ' of BRCA1 gene are :", result)

    cursor.close()
    mydb.close()

def display_transcripts():
    mydb = get_connection()
    cursor = mydb.cursor()

    query = " select * from transcript t join gene g on t.gene_id = g.gene_id where g.stable_id = 'ENSG00000012048' limit 5 "
    cursor.execute(query)

    result = cursor.fetchall()
    print ("=" * 300)
    print("Transcripts of BRCA1 gene are :", result)

    cursor.close()
    mydb.close()

def display_genes():
    mydb = get_connection()
    cursor = mydb.cursor()
    
    query = ("select * from gene g join seq_region s on g.seq_region_id = s.seq_region_id where s.name = '1'  limit 10 " )

    cursor.execute(query)
    result = cursor.fetchall()

    print("=" * 300)
    print("Genes of chr1 gene are :", result)
    cursor.close()
    mydb.close()


def main():

    display_stable_id()
    display_transcripts()
    display_genes()

if __name__ == "__main__":
    main()

