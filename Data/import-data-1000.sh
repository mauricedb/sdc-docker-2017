#!/bin/bash

#wait for the SQL Server to come up
#sleep 10s

sqlcmd -U sa -P Password1 -i CreateDB.sql
sqlcmd -U sa -P Password1 -i People-1000.sql
