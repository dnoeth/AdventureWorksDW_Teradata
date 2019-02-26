# AdventureWorksDW_Teradata
A port of Microsoft's [AdventureWorksDW](https://github.com/Microsoft/sql-server-samples/tree/master/samples/databases/adventure-works/data-warehouse-install-script) demo database to Teradata.

## Prerequisites

 1. Either `BTEQ` must be installed on your client or `ARC` must be installed on the Teradata system (for *TDExpress*).

 2. The load user needs the `CREATE DATABASE` right in the target database.
  
## Option 1: Restoring AdventureWorksDW to a TDExpress

 1. Download both [AWDWrestore.arc](https://github.com/dnoeth/AdventureWorksDW_Teradata/blob/master/AWDWrestore.arc) and [AWDWARC](https://github.com/dnoeth/AdventureWorksDW_Teradata/blob/master/AWDWARC) files and copy it to a folder on your TDExpress, e.g. `/tmp`

 2. Logon to the Teradata system and create a database:
 
```
 CREATE DATABASE AdventureWorksDW AS PERM = 500e+06;
```

 3. Modify the file `AWDWrestore.arc` to match your target system.
 
 4. Open a *terminal* window and run 
 
```
cd /tmp
arcmain < AWDWrestore.arc 
```

There will be warning message:
```
02/26/2019 05:09:29  *** Warning ARC1256:Cross release data restore requires 
                     that one of the following Teradata SQL conversion scripts 
                     be run to complete the restore: post_data_restore.
```
which can be ignored as no conversion is needed.
  
## Option 2: Installing AdventureWorksDW using BTEQ

### Installing AdventureWorksDW using a Windows client

 1. Download [AdventureWorksDW_Teradata.zip](https://github.com/dnoeth/AdventureWorksDW_Teradata/releases/download/v1.0/AdventureWorksDW_Teradata.zip) and extract the zip file to a folder, e.g. `C:\Samples\AdventureWorksDW_Teradata`.
 2. Modify the file `_logon.txt` to match your target system. Optionally modify the database name.
 
 3. Open a *cmd* (or *PowerShell*) window, change to the folder and run the file `_install.btq` using bteq:
```
cd C:\Samples\AdventureWorksDW_Teradata
bteq < _install.btq > _install.log
```

### Installing AdventureWorksDW using a Linux client

 1. Download [AdventureWorksDW_Teradata.zip](https://github.com/dnoeth/AdventureWorksDW_Teradata/releases/download/v1.0/AdventureWorksDW_Teradata.zip) and extract the zip file to a folder, e.g. `~/Samples/AdventureWorksDW_Teradata`.
 2. Modify the file `_logon.txt` to match your target system. Optionally modify the database name.
 
 3. Open a *terminal* window, change to the folder and modify the data in three csv files from Windows to Linux path syntax:
```
cd ~/Samples/AdventureWorksDW_Teradata
sed -i 's/\\/\//' DimEmployee.csv
sed -i 's/\\/\//' DimProduct.csv
sed -i 's/\\/\//' DimSalesTerritory.csv
```
 4. Then run the file `_install.btq` using bteq:
```
bteq < _install.btq > _install.log
```
#### Checking for successful installation

If the install is running without errors you will see this message repeated 30 times: 
```
 *** WARNING: OUT OF DATA.
```

Otherwise check the `_install.log` for errors

### Reinstalling AdventureWorksDW

Before re-running the install script the database must be dropped or all objects removed
```
DROP DATABASE AdventureWorksDW;
or
DELETE DATABASE AdventureWorksDW;
```

When the database is not dropped the script will return an error, but still run successfully:
```
*** Failure 5612 A user, database, role, or zone with the specified name already exists.
```
