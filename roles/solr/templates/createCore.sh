#!/bin/bash
docker exec -it --user=solr {{solr_process_name}} bin/solr create_core -c {{solr_collection_name}}
