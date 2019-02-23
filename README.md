# AdventureWorksDW_Teradata
A port of the originally published by Microsoft [AdventureWorksDW](https://github.com/dnoeth/AdventureWorksDW_Teradata) demo database to Teradata.

## Prerequisites

 1. BTEQ must be installed on your client
 2. The load user needs the **CREATE DATABASE** right in the target database.
  
## Installing AdventureWorksDW using a Windows client

 1. Download AdventureWorksDW_Teradata.zip and extract the zip file to a folder, e.g. *C:\Samples\AdventureWorksDW_Teradata*.
 2. Modify the file **\_logon.txt** to match your target system. Optionally modify the database name.
 
 3. Open a *cmd* (or *PowerShell*) window, change to the folder and run the file **\_install.btq** using bteq:
```
cd C:\Samples\AdventureWorksDW_Teradata
bteq < _install.btq > _install.log
```

## Installing AdventureWorksDW using a Windows client

 1. Download AdventureWorksDW_Teradata.zip and extract the zip file to a folder, e.g. *~/Samples/AdventureWorksDW_Teradata*.
 2. Modify the file **\_logon.txt** to match your target system. Optionally modify the database name.
 
 3. Open a *terminal* window, change to the folder and modify the data in three csv files from Windows to Linux path syntax:
```
cd ~/Samples/AdventureWorksDW_Teradata
sed -i 's/\\/\//' DimEmployee.csv
sed -i 's/\\/\//' DimProduct.csv
sed -i 's/\\/\//' DimSalesTerritory.csv
```
 4. Then run the file **\_install.btq** using bteq:
```
bteq < _install.btq > _install.log
```
### Checking for successful installation

If the install is running without errors you will see this message repeated 30 times: 
```
 *** WARNING: OUT OF DATA.
```

Otherwise check the **\_install.log** for errors
