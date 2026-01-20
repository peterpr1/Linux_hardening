#!/bin/sh


PATH=$PATH:/bin:/usr/bin:/root/bin:/sbin:/usr/sbin

DATE=`date +%Y-%m-%d`
REPORT=/srv/AIDE/Reports/aide-$DATE.txt
aideDB=/srv/AIDE/aide.db.gz
aideDBnew=/srv/AIDE/aide.db.new.gz


if [ -f $aideDB ]; then
    /usr/sbin/aide --check > $REPORT
    /usr/sbin/aide --update
    rm -f $aideDB
    mv $aideDBnew $aideDB
fi

find /srv/AIDE/Reports -type f -mtime +90 -exec rm -rf {} \;
exit 0

