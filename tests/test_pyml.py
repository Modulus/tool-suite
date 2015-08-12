__author__ = 'Modulus'


class TestPyml:
    def test_pyml(self):
        import yaml
        import os
        root_path = os.path.dirname(__file__)
        yml_file = os.path.join(root_path, "tools-list.yml")
        with open(yml_file) as stream:
            print(yaml.load(stream))
