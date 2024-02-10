from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware
from config.log_config import create_log
from injector import ES_HOST
import requests
import json

logger = create_log()

app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


''' http://localhost:7777/docs '''

@app.get("/", tags=['API'],  
         status_code=200,
         description="Default GET API", 
         summary="Return Json")
async def info():
    logger.info('root')
    return {"name": "python-CICD-sample-fast-api", "version": "1.0.0"}



@app.get("/es", tags=['API'],  
         status_code=200,
         description="Default GET API", 
         summary="Return Json")
async def get_es_info():
    logger.info(f"get_es_info hosts -> {ES_HOST}")
    response = requests.get(f"{ES_HOST}/_cat/plugins?format=json")
    logger.info(json.dumps(response.json(), indent=2))
    return response.json()


@app.get("/test", tags=['API'],  
         status_code=200,
         description="Default GET Param API", 
         summary="Return GET Param Json")
async def root_with_arg(id):
    logger.info('root_with_arg - {}'.format(id))
    return {"message": "Hello World [{}]".format(id)}


@app.get("/test/{id}", tags=['API'],  
         status_code=200,
         description="Default GET with Body API", 
         summary="Return GET with Body Json")
async def root_with_param(id):
    logger.info('root_with_arg - {}'.format(id))
    return {"message": "Hello World [{}]".format(id)}


# router
# app.include_router(es_search_controller.app, tags=["Search"], )