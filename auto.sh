#/bin/bash

#cd /home/paras/Desktop/final/AFE-API

for api_name in $(find $directory -type f -name "*.json" -exec basename \{} .json \;)
do
	echo "$api_name"
	echo "========="
	mongoimport --db afe_api_development --collection ${api_name} --drop --file ${api_name}.json --jsonArray
	rails g scaffold ${api_name} 
done

#cd -