# python-CICD-fastapi-basic
<i>python-fastapi-basic-CICD

FastAPI is a modern, fast (high-performance), web framework for building APIs with Python 3.8+ based on standard Python type hints.

The key features are:

- Fast: Very high performance, on par with NodeJS and Go (thanks to Starlette and Pydantic). One of the fastest Python frameworks available.
- Fast to code: Increase the speed to develop features by about 200% to 300%. *
- Fewer bugs: Reduce about 40% of human (developer) induced errors. *
- Intuitive: Great editor support. Completion everywhere. Less time debugging.
- Easy: Designed to be easy to use and learn. Less time reading docs.
- Short: Minimize code duplication. Multiple features from each parameter declaration. Fewer bugs.
- Robust: Get production-ready code. With automatic interactive documentation.
- Standards-based: Based on (and fully compatible with) the open standards for APIs: OpenAPI (previously known as Swagger) and JSON Schema.


### Install Poerty
```
https://python-poetry.org/docs/?ref=dylancastillo.co#installing-with-the-official-installer
```

### Using Python Virtual Environment
```bash
python -m venv .venv
source .venv/bin/activate
```

### Using Poetry: Create the virtual environment in the same directory as the project and install the dependencies:
```bash
poetry config virtualenvs.in-project true
poetry init
poetry add fastapi
poetry add uvicorn
poetry add pytz
```


### Pytest
- Go to virtual enviroment using `source .venv/bin/activate`
- Run this command manually: `poetry run py.test -v --junitxml=test-reports/junit/pytest.xml --cov-report html --cov tests/` or `./pytest.sh`
```bash
➜  python-CICD-fastapi-basic git:(master) ✗ ./pytest.sh
================================================ test session starts ================================================
platform darwin -- Python 3.9.7, pytest-7.0.1, pluggy-0.13.1 -- /Users/euiyoung.hwang/opt/anaconda3/bin/python
cachedir: .pytest_cache
rootdir: /Users/euiyoung.hwang/ES/Python_Workspace/python-CICD-fastapi-basic/tests, configfile: pytest.ini
plugins: anyio-3.6.1, mock-3.6.1, cov-4.0.0
collected 1 item                                                                                                    

tests/test_api.py::test_api PASSED                                                                            [100%]

================================================= 1 passed in 0.05s =================================================
➜  python-CICD-fastapi-basic git:(master) ✗ source .venv/bin/activate
(.venv) ➜  python-CICD-fastapi-basic git:(master) ✗ ./pytest.sh              
================================================ test session starts ================================================
platform darwin -- Python 3.9.7, pytest-7.0.1, pluggy-0.13.1 -- /Users/euiyoung.hwang/opt/anaconda3/bin/python
cachedir: .pytest_cache
rootdir: /Users/euiyoung.hwang/ES/Python_Workspace/python-CICD-fastapi-basic/tests, configfile: pytest.ini
plugins: anyio-3.6.1, mock-3.6.1, cov-4.0.0
collected 1 item                                                                                                    

tests/test_api.py::test_api PASSED                                                                            [100%]

================================================= 1 passed in 0.12s =================================================
(.venv) ➜  python-CICD-fastapi-basic git:(master) ✗ 
```


### CI/CD Environment
- CircleCI (`./circleci/config.yml`): CircleCI is a continuous integration and continuous delivery platform that helps software teams work smarter, faster. With CircleCI, every commit kicks off a new job in our platform, and code is built, tested, and deployed. 
- Github Actions (`./.github/workflows/build-and-test.yml`) : GitHub Actions is a continuous integration and continuous delivery (CI/CD) platform that allows you to automate your build, test, and deployment pipeline. You can create workflows that build and test every pull request to your repository, or deploy merged pull requests to production.