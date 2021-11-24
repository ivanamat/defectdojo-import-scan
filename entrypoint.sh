#!/bin/bash
set -e

ARGS=''

if [[ -z "$INPUT_TOKEN" ]]
then
    echo "ERROR: Yoy must provide a valid token!"
    exit 1
fi

if [[ -z "$INPUT_DEFECTDOJO_URL" ]]
then
    echo "ERROR: You must provide a valid defectdojo url included import-scan endpoint. Example: https://defectdojo.domain.com/api/v2/import-scan/"
    exit 1
fi

if [[ ! -z "$INPUT_SCAN_DATE" ]]
then
    ARGS+="-F 'scan_date=$INPUT_SCAN_DATE' "
fi
  
if [[ ! -z "$INPUT_MINIMUM_SEVERITY" ]]
then
    ARGS+="-F 'minimum_severity=$INPUT_MINIMUM_SEVERITY' "
fi

if [[ ! -z "$INPUT_ACTIVE" ]]
then
    ARGS+="-F 'active=$INPUT_ACTIVE' "
fi
  
if [[ ! -z "$INPUT_VERIFIED" ]]
then
    ARGS+="-F 'verified=$INPUT_VERIFIED' "
fi

if [[ ! -z "$INPUT_SCAN_TYPE" ]]
then
    ARGS+="-F 'scan_type=\"$INPUT_SCAN_TYPE\"' "
fi

if [[ ! -z "$INPUT_ENDPOINT_TO_ADD" ]]
then
    ARGS+="-F 'endpoint_to_add=$INPUT_ENDPOINT_TO_ADD' "
fi

if [[ ! -z "$INPUT_ENGAGEMENT" ]]
then
    ARGS+="-F 'engagement=$INPUT_ENGAGEMENT' "
fi

if [[ ! -z "$INPUT_LEAD" ]]
then
    ARGS+="-F 'lead=$INPUT_LEAD' "
fi

if [[ ! -z "$INPUT_TAGS" ]]
then
    ARGS+="-F 'tags=$INPUT_TAGS' "
fi  
  
if [[ ! -z "$INPUT_CLOSE_OLD_FINDINGS" ]]
then
    ARGS+="-F 'close_old_findings=$INPUT_CLOSE_OLD_FINDINGS' "
fi  

if [[ ! -z "$INPUT_PUSH_TO_JIRA" ]]
then
    ARGS+="-F 'push_to_jira=$INPUT_PUSH_TO_JIRA' "
fi  

if [[ ! -z "$INPUT_ENVIRONMENT" ]]
then
    ARGS+="-F 'environment=$INPUT_ENVIRONMENT' "
fi  
  
if [[ ! -z "$INPUT_VERSION" ]]
then
    ARGS+="-F 'version=$INPUT_VERSION' "
fi  
  
if [[ ! -z "$INPUT_BUILD_ID" ]]
then
    ARGS+="-F 'build_id=$INPUT_BUILD_ID' "
fi

if [[ ! -z "$INPUT_BRANCH_TAG" ]]
then
    ARGS+="-F 'branch_tag=$INPUT_BRANCH_TAG' "
fi

if [[ ! -z "$INPUT_COMMIT_HASH" ]]
then
    ARGS+="-F 'commit_hash=$INPUT_COMMIT_HASH' "
fi
  
if [[ ! -z "$INPUT_COMMIT_HASH" ]]
then
    ARGS+="-F 'sonarqube_config=$INPUT_COMMIT_HASH' "
fi
  
if [[ ! -z "$INPUT_COBALTIO_CONFIG" ]]
then
    ARGS+="-F 'cobaltio_config=$INPUT_COBALTIO_CONFIG' "
fi
  
if [[ ! -z "$INPUT_GROUP_BY" ]]
then
    ARGS+="-F 'group_by=$INPUT_GROUP_BY' "
fi
  
if [[ ! -z "$INPUT_FILE" ]]
then
    ARGS+="-F 'file=@\"$INPUT_FILE\"' "
fi

response=$(echo $ARGS | xargs curl -X POST "$INPUT_DEFECTDOJO_URL$INPUT_DEFECTDOJO_ENDPOINT" -H "Authorization: Token $INPUT_TOKEN" -H "accept: application/json" -H  "Content-Type: multipart/form-data")
echo "::set-output name=response::$( echo $response)"

