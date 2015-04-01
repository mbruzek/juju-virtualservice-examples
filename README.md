Juju Virtual Services Endpoint Examples
=======================================

To create a virtual service from the Juju the command line, you need to describe the relation endpoint.

    relation:interface={"field1": "value1", "field2", "value2"}

The field names and values should match the values required by the relation hook.

It can be cumbersome on the command line so a file can also be specified on the
deploy subcommand.

    juju deploy virtual:name --endpoints-file=virtual_endpoints.json

Both JSON and YAML are accepted formats for the virtual services endpoint files.

The key `private-address` is implicit in every relation, so that key and value should
always exist in the relation definition.

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
    juju deploy virtual:mysql --endpoints-file=mysql_endpoint.yaml
    juju add-relation wordpress mysql
