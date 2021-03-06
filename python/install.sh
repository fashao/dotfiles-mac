#!/bin/sh

#　http://pypi.douban.com/
#　http://pypi.hustunique.com/
#　http://pypi.sdutlinux.org/
# http://pypi.mirrors.ustc.edu.cn/
# pip install web.py -i http://pypi.douban.com/simple
# /simple

plugins=(
    virtualenv
    utils
    dbgp
    pep8
    pyflakes
    isort
    requests
    db
    #a statusline plugin for vim, and provides statuslines and prompts for several other applications
    powerline-status
    #automatically formats Python code to conform to the PEP 8
    autopep8
    #PyFlakes\pep8\Ned Batchelder’s McCabe script
    flake8
    #Pythonic command line arguments parser
    docopt
    #World Timezone Definitions for Python
    pytz
    #backport of the new features
    unittest2
    markdown
    six
    scrapy
    Pillow
)

pip install --upgrade pip

# pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# pyenv install 3.5.0

pip install ${plugins[@]}
