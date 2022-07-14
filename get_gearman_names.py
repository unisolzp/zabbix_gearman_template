import sys
import os
import json

WORKERS = os.popen('gearadmin --status | awk \'{print $1}\' | head -n-1').read()
WORKERS_LIST = []

LINES = WORKERS.splitlines()
for LINE in LINES:
    WORKERS_LIST.append({"{#GEARMAN_NAME}": LINE})

JSON = json.dumps(WORKERS_LIST)

print(JSON)