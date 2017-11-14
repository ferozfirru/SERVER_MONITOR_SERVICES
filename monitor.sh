#ferscript

#Run http server on specified Port in the current directory 

python -m SimpleHTTPServer 8000 > /dev/null 2&>1&

while true;
do
mysql="$(/bin/systemctl is-active  mysqld)"
apache="$(/bin/systemctl is-active  httpd)"
redis="$(/bin/systemctl is-active  redis)"
nginx="$(/bin/systemctl is-active  nginx)"
cron="$(/bin/systemctl is-active  crond)"

dit="$(/usr/bin/df -h / 2>/dev/null | tail -1 | awk '{print $2}')"
diu="$(/usr/bin/df -h / 2>/dev/null | tail -1 | awk '{print $3}')"
dia="$(/usr/bin/df -h / 2>/dev/null | tail -1 | awk '{print $4}')"
dip="$(/usr/bin/df -h / 2>/dev/null | tail -1 | awk '{print $5}')"


domain1="$(/usr/bin/curl -k --connect-timeout 2 -o /dev/null --silent --head --write-out '%{http_code}' "https://www.domain1.com")"
domain2="$(/usr/bin/curl -k --connect-timeout 2 -o /dev/null --silent --head --write-out '%{http_code}' "https://www.domain2.com")"
domain3="$(/usr/bin/curl -k --connect-timeout 2 -o /dev/null --silent --head --write-out '%{http_code}' "https://www.domain3.com")"

#echo "$mysql - $apache - $redis - $nginx - $cron - $dt"

dt="$(date)"

printf '{"mysql":"%s","apache":"%s","nginx":"%s","redis":"%s","cron":"%s","dit":"%s","diu":"%s","dia":"%s","dip":"%s","sites":{"domain1":{"code":"%s"},"domain2":{"code":"%s"},"domain3":{"code":"%s"}},"date":"%s"} \n' "$mysql" "$apache" "$nginx" "$redis" "$cron" "$dit" "$diu" "$dia" "$dip" "$domain1" "$domain2" "$domain3" "$dt" > status.json

sleep 5; // wait for 5 seconds for this infinte loop
done

#now we can call url like http://127.0.0.1:8000 --->this will output the above json output
#ex:
#{"mysql":"active","apache":"active","nginx":"active","redis":"active","cron":"active","dit":"100G","diu":"50G","dia":"50G","dip":"50%","sites":{"domain1":{"code":"200"},"domain2":{"code":"404"},"domain3":{"code":"301"}},"date":"Thu Nov 23 10:00:00 IST 2010"} 
