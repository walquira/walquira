[Forwarded from Ricardo]
#####################################################INICIO#######################################################
##INSTALAR E ATIVAR O DOCKER

yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce docker-ce-cli containerd.io
systemctl enable docker.service
systemctl start docker

##INICIANDO E CONFIGURANDO CLUSTER
#EXECUTAR NO NÓ 1 DO CLUSTER
docker swarm init

#PARA ADIÇÃO DE MAIS NOS GERENCIADOR
docker swarm join-token manager

#PARA ADICÇÃO DE NOS WHE APENAS EXECUTA OS CONTAINERS
docker swarm join-token worker

#PEGAR O RETORNO DO COMANDO E EXECUTAR NOS DEMAIS NÓS

##DEPLOY PORAINER
curl -L https://downloads.portainer.io/portainer-agent-stack.yml -o /tmp/portainer.yml
docker stack deploy --compose-file /tmp/portainer.yml portainer-pcobcs02

#CONFIGURAR SENHA DO USUARIO ADMIN

#######################################################FIM########################################################TEMP_BASE_LOG_GERAL
