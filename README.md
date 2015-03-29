Juju Virtual Services Endpoint Examples
=======================================

To create a virtual service in Juju you need to describe the relation endpoint.

    relation:interface={"field1": "value1", "field2", "value2"}

The field names and values should match the values required by the relation hook.

Usage Example
-------------

Here is an example of running a docker container with MySQL and creating a relation from a Juju deployed wordpress instance.

Deploy the docker container and get the IP address for the docker0 interface.

    ./mysql.docker.sh
    ifconfig
   
Update the mysql.endpoint with the docker0 interface and bootstrap Juju.

    juju bootstrap local --upload-tools

Now you can deploy your wordpress and relate the docker mysql container.

    juju deploy wordpress
    juju deploy virtual:mysql --endpoint-file=mysql.endpoint
    juju add-relation wordpress mysql

