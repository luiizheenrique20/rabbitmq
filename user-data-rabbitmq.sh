#!/bin/bash

apt update -y

#dpkg-reconfigure tzdata

apt-get install tree jq python -y 

export aws_access_key="xxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
export aws_secret_key="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

bash <(curl -s http://automation.credibilit.com/base_bootstrap.sh)
apt-get install rabbitmq-server tree jq -y

# Habilitar console e user admin.
rabbitmq-plugins enable rabbitmq_management
#rabbitmq-plugins enable rabbitmqadmin
rabbitmqctl add_user rabittmqadmin s3r4s4
rabbitmqctl set_user_tags rabittmqadmin administrator
rabbitmqctl set_permissions -p / rabittmqadmin ".*" ".*" ".*"

# Discover the region and instance id
META_DATA_URL='http://169.254.169.254/latest'
REGION_URL=$(curl $META_DATA_URL/dynamic/instance-identity/document)
LOCAL_HOSTNAME=$(curl $META_DATA_URL/meta-data/local-hostname)
REGION=$(curl $REGION_URL | jq '.region' -r)
LOCAL_IPV4=$(curl $META_DATA_URL/meta-data/local-ipv4)

echo "$LOCAL_IPV4 $LOCAL_HOSTNAME" >> /etc/hosts

### Colocar em cluster
# Editar o arquivo /etc/rabbitmq/rabbitmq-env.conf

### Alterar o /etc/hosts das mÃ¡quinas.

#NODE_IP_ADDRESS=10.128.101.139

## Defaults to 5672.
#NODE_PORT=5672

# Copiar o conteudo de /var/lib/rabbitmq/.erlang.cookie do node1 para o outro node2.

# Restartar o rabbit via systemctl

# Startar o node1 e deixar o node2 stopado.
# $ rabbitmqctl stop_app no node2

# Fazer o join cluster no node2:
# $ rabbitmqctl join_cluster rabbit@ip-10-128-101-109

# Startar o node2
# $ rabbitmqctl start_app

################## Remover o node do cluster ############## GMUD SERASA
# Stopar o node 2
# $ rabbitmqctl stop_app no node2

# Remover node do cluster 
# $ rabbitmqctl forget_cluster_node rabbit@node2

# Subir a mÃ¡quina nova

# Alterar o /etc/hosts e o /etc/rabbitmq/rabbitmq-server.conf

# Restartar o rabbit via systemctl

# Copiar o conteudo de /var/lib/rabbitmq/.erlang.cookie do node1 para o outro node2.

# Restartar o rabbit via systemctl

# $ rabbitmqctl stop_app no node2

## Fazer o join cluster na mÃ¡quina nova

# $ rabbitmqctl join_cluster rabbit@ip-10-128-101-139

# Startar o node2
# $ rabbitmqctl start_app
