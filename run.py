from obmovies.factory import create_app

import os
import configparser


config = configparser.ConfigParser()
config.read(os.path.abspath(os.path.join(".ini")))

if __name__ == "__main__":
    app = create_app()
    app.config['DEBUG'] = True
    app.config['MOVIES_DB_URI'] = config['PROD']['MOVIES_DB_URI']
    app.config['MOVIES_NS'] = config['PROD']['MOVIES_NS']
    app.config['SECRET_KEY'] = config['PROD']['SECRET_KEY']

    app.run(host="0.0.0.0")
