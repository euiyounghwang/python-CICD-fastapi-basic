
from config.log_config import create_log
from elasticsearch import Elasticsearch
from dotenv import load_dotenv
import yaml
import json
import os

def read_config_yaml():
    with open('./config.yaml', 'r') as f:
        doc = yaml.load(f, Loader=yaml.FullLoader)
        
    logger.info(json.dumps(doc, indent=2))
    
    return doc

def get_headers():
    ''' Elasticsearch Header '''
    return {'Content-type': 'application/json', 'Connection': 'close'}


load_dotenv()
    
# Initialize & Inject with only one instance
logger = create_log()
doc = read_config_yaml()

ES_HOST = os.getenv("ES_HOST", doc['app']['es']['es_host'])
es_client = Elasticsearch(hosts= ES_HOST,
                          headers=get_headers(),
                          verify_certs=False,
                          timeout=600
)