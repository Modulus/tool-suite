__author__ = 'Modulus'
from core.file_import import import_yml
import unittest
import os


class TestPyml(unittest.TestCase):

    def setUp(self):
        self.expected = {'repos':
                             {'links':
                                  [
                                      'git@github.com:Modulus/Repo1.git',
                                      'git@github.com:Modulus/Repo2.git'
                                  ]
                             },
                         'wikis': {
                             'links':
                                       [
                                           'https://myawesome.wiki.com/project1',
                                           'https://myawesome.wiki.com/project2',
                                           'git@github.com:Modulus/Repo1.git',
                                           'git@github.com:Modulus/Repo2.git',
                                           'http://someobscuretool.com',
                                           'http://somecooltool.com'
                                       ]
                         },
                         'tools': {'links':
                                       [
                                           'http://someobscuretool.com',
                                           'http://somecooltool.com'
                                       ]
                         },
                         'header': 'Evry tools'
        }

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

