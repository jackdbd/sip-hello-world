# SIP Hello World

This repo shows how to take an existing C++ library, and make it available as Python extension module.

Such extension modules are often called bindings for the library.

:warning: :construction_worker: WORK IN PROGRESS :building_construction: :construction:


## Installation

Create a python 3.6 virtual environment with pipenv.

```sh
pipenv --python 3.6
```

Activate the virtual environment.

```sh
workon <YOUR-VIRTUALENV-NAME>
```

Download and configure a [private copy of SIP](http://pyqt.sourceforge.net/Docs/sip4/installation.html#configuring-a-private-copy-of-the-sip-module).

```sh
source install_sip.sh
```

Check that SIP is installed in the virtual environment.

```sh
pip list
```

You should see these packages.

```sh
Package    Version
---------- -------
pip        18.1   
setuptools 40.5.0 
wheel      0.32.2 
word-sip   4.19.13
```

In your virtualenv `site-packages` (e.g. `cd .virtualenvs/<YOUR-VIRTUALENV-NAME>/lib/python3.6/site-packages`) you should see `word_sip-4.19.13.dist-info`.


## Wrapping a C library with SIP

```sh
cd hello_c
python configure.py --pyi
cd generated
make
make install
```


## Wrapping a C++ library with SIP

```sh
cd word_cpp
python configure.py --pyi
cd generated
make
make install
```

Test that the compilation is working.

```sh
gcc src/main.c src/year_utils.c
./a.out 1984
```
