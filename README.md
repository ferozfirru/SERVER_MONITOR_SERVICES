# Monitor.sh

###### this script will create a standalone http servers listening on port 8000(any given) 
###### simply call this url like http://127.0.0.1:8000/status.json
###### this will give Monitoring output in JSON format

**Ex:**
> {"mysql":"active","apache":"active","nginx":"active","redis":"active","cron":"active","dit":"100G","diu":"50G","dia":"50G","dip":"50%","sites":{"domain1":{"code":"200"},"domain2":{"code":"404"},"domain3":{"code":"301"}},"date":"Thu Nov 23 10:00:00 IST 2010"} 
