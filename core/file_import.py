__author__ = 'Johska'

import yaml

def import_yml(file_path):
    with open(file_path) as stream:
        data = yaml.load(stream)
        return data
