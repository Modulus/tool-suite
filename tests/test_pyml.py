__author__ = 'Modulus'
from core.file_import import import_yml
import unittest
import os


class TestPyml(unittest.TestCase):

    def setUp(self):
        self.expected = {'wikis': {'links': [{'url': 'https://myawesome.wiki.com/project1', 'label': 'Project1'}, {'url': 'https://myawesome.wiki.com/project2', 'label': 'Project2'}, {'url': 'http://someobscuretool.com', 'label': 'Obscure crap'}, {'url': 'http://somecooltool.com', 'label': 'Cool tool'}]}, 'repos': {'links': [{'url': 'git@github.com:Modulus/Repo1.git', 'label': 'Repo1'}, {'url': 'git@github.com:Modulus/Repo2.git', 'label': 'Repo2'}]}, 'header': 'Evry tools', 'tools': {'links': [{'url': 'http://someobscuretool.com', 'label': 'Obscure crap'}, {'url': 'http://somecooltool.com', 'label': 'Oooooh shiny!!!'}]}}

    def test_file_import_hasfile_is_not_none(self):
        root_path = os.path.dirname(__file__)
        yml_file = os.path.join(root_path, "tools-list.yml")
        result = import_yml(yml_file)

        self.assertIsNotNone(result)

    def test_file_import_hasfile_is_expected_list(self):
        root_path = os.path.dirname(__file__)
        yml_file = os.path.join(root_path, "tools-list.yml")
        result = import_yml(yml_file)

        self.assertEqual(self.expected, result)

