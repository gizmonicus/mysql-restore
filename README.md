# mysql-restore
Docker file for creating a container specifically to restore MySQL backups.

# Usage
You must use a .tar.gz backup of files from /var/lib/mysql in order for this to work. This container will extract these data files to the working directory of a new MySQL image where you can call tools like mysqldump to extract all or part of the database.

## Run the image
```docker run --rm -it -v /path/to/backup.tar.gz:/mnt/backup.tar.gz gizmonicus/mysql-restore:centos6```

## Execute commands inside the container
* First, get the container's ID using `docker ps`
* Copy the container ID from the output of this command. For this example, let's assume the ID is `deadbeefcafe`
* If you would like to run queries interactively, you can run mysql directly like this

    ```docker exec -it deadbeefcafe mysql -u root -p```

* Maybe you need just to dump the entire database so it can be restored somewhere else

    ```docker exec -it deadbeefcafe mysqldump -u root -p databasename > dumpfile.sql``` 
    
* Or perhaps you just want two tables

    ```docker exec -it deadbeefcafe mysqldump -u root -p databasename table1 table2 > dumpfile.sql```
