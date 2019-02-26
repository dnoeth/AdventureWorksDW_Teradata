logon mysystem/myuser,mypassword;
copy data tables (adventureworksdw) (from (adventureworksdw), replace creator), release lock, file = AWDWARC;
logoff;
