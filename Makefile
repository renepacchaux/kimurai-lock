crawl: 
	kimurai start resume && cat results.json | jq | in2csv -f json | csvlook
