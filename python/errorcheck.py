#!/usr/bin/env python

import json
from sys import stdin

DATA = json.loads(stdin.read())

if DATA['assert'].lower() == 'true':
    print(
        json.dumps({
            'value': 'Assertion Passed'
        })
    )
else:
    raise Exception(DATA['error_message'])
