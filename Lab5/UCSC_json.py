#!/usr/bin/env python3

import json
import urllib.request
# import urllib.parse

# Creds = "/home/ibab/Applications/DB_Design/Lab5/proxy_creds.txt"
# proxy = "192.168.1.61:3128"
#
# #reads the credential file
# with open (Creds, "r") as f:
#     username = f.readline().strip()
#     password = f.readline().strip()
#
# #URLEncoding (for special characters)
# user = urllib.parse.quote(username, safe="")
# pwd = urllib.parse.quote(password, safe="")
#
# #Setup proxy auth
# proxy_url = f"http://{user}:{pwd}@{proxy}"
#
# proxy_handler = urllib.request.ProxyHandler({
#     "http": proxy_url,
#     "https": proxy_url})
#
# opener = urllib.request.build_opener(proxy_handler)
# urllib.request.install_opener(opener)

#Test
API_URL = "https://api.genome.ucsc.edu/list/ucscGenomes"
OUT_FILE = "/var/www/data/ucscGenome.json"

try:
    #Fetch JSOn from the API
    with urllib.request.urlopen(API_URL) as response:
        raw = response.read().decode("utf-8")
        data = json.loads(raw)
        print(data)

    with open(OUT_FILE, "w") as f:
        json.dump(data, f, indent=2)

    print("Saved UCSC genome list to", OUT_FILE)

except Exception as e:
    print(e)
        
# try:
#     print("Connecting to API...")
#
#     with urllib.request.urlopen(API_URL) as response:
#         print("Connected, reading data...")
#         raw = response.read().decode("utf-8")
#         print("Raw received")
#         data = json.loads(raw)
#
#         print("Parsed JSON OK")
#
#     with open(OUT_FILE, "w") as f:
#         json.dump(data, f, indent=2)
#
#     print("Saved UCSC genome list to", OUT_FILE)
#
# except Exception as e:
#     print("ERROR:", e)


