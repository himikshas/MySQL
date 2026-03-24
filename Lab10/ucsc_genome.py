#!/usr/bin/env python3

import json

with open ("ucscGenome.json", "r") as f:
    json_data = json.load(f)
    print(f'json_data = {json_data}')

    for key,value in json_data.items():
        print(f'key : {key}')
        print(f'value : {value}')

    for key,value in value.items():
        print(f'key : {key}')
        print(f'value : {value}')

