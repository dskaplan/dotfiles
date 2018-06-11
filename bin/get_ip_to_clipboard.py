#!/usr/bin/env python3
import requests
import clipboard

output = requests.get('https://httpbin.org/ip')
clipboard.copy(output.json()['origin'])

print('{} - copied'.format(output.json()['origin']))
