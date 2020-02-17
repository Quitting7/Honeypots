#!/usr/bin/env python3
from sys import argv
from time import sleep
from os import path
import json    
import requests

if len(argv) < 3:
	print("usage: ./virustotal.py <file> <api-key> <fetch-only>"); exit(1)

if len(argv) < 4:
	#---------- ANALYZE -----------#
	url='https://www.virustotal.com/vtapi/v2/file/scan'

	params = {'apikey': '<apikey>'}

	files = {'file': (path.basename(argv[1]), open(argv[1], 'rb'))}

	response = requests.post(url, files=files, params={'apikey':argv[2] })

	print(response.json())

	#wait = 10
	#print("Sleeping for {} seconds before fetching report...".format(wait))
	#sleep(wait)

elif len(argv) >= 4:
	#---------- GET Report ------------#
	url = 'https://www.virustotal.com/vtapi/v2/file/report'
	response = requests.get(url, params={ 'apikey': argv[2], 'resource': path.basename(argv[1])  }  )

	obj = response.json()
	
	if "scan_data" in obj.keys():

		#---------- FORMATTING ----------#
		wanted_top_fields = [ "scan_date", "resource", "total", "positives" ]

		#with open(argv[1],"r") as infile:
		#    data = infile.read()
		#obj = json.loads(data)

		pruned_obj = {}

		for field in wanted_top_fields:
			pruned_obj[field] = obj[field]

		pruned_obj["results"] = []

		for field in obj["scans"]:
			if obj["scans"][field]["result"]:
				pruned_obj["results"].append(obj["scans"][field]["result"])

		print(pruned_obj)
	else:
		print('{ "error": "Insufficent response from server"}'); exit(1)
