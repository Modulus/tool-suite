from flask import Flask, jsonify
from core.file_import import import_yml
app = Flask(__name__)


@app.route('/')
def hello_world():
    import os
    root_path = os.path.dirname(__file__)
    yml_file = os.path.join(root_path, "tools-list.yml")
    result = import_yml(yml_file)

    return jsonify(result)


if __name__ == '__main__':
    app.run()
