#!/bin/bash
#Monitoramento Filas JMS
#Autor: Rafael Benites Gil

JBOSS_CLI="/app/fluig/jboss/bin/jboss-cli.sh"
IP_JBOSS="172.16.102.224"
PORTA_JBOSS="9999"
JAVA_HOME="/app/fluig/jdk-64/"
PATH=$JAVA_HOME/bin:$PATH
export PATH JAVA_HOME
case $1 in
		-a)
			fila="TOTVSTechAsyncQueue"
		;;
		-d)
			fila="FluigDeployQueue"
		;;
		-e)
			fila="ECMNotificationQueue"	
		;;
		-h)
			fila="TOTVSTechDeployQueue "
		;;
		-i)
			fila="TOTVSTechIntegrationRegisterQueue"
		;;
		-m)
			fila="FluigMailQueue"
		;;
		-p)
			fila="TOTVSTechocialPostDeliveryQueue"
		;;
		-s)
			fila="TOTVSTechSocialQueue"
		;;
		-t)
			fila="FluigThumbnail"
		;;
		
		*)
				echo "+================================================================================+";
                echo "#script Monitoramento Filas JMS Fluig                                            #";
                echo "+================================================================================+";
                echo "________________________________________________________________________________"
                echo "# OPCOES:                                                                      #";
                echo "--------------------------------------------------------------------------------"
                echo "| -a : Exibe status da fila TOTVSTechAsyncQueue                                |"
                echo "| -c : Exibe status da fila PortalCloudNotifyQueue                             |"
				echo "| -d : Exibe status da fila FluigDeployQueue                                   |"
				echo "| -e : Exibe status da fila ECMNotificationQueue                               |"
				echo "| -h : Exibe status da fila TOTVSTechDeployQueue                               |"
				echo "| -i : Exibe status da fila TOTVSTechIntegrationRegisterQueue                  |"
				echo "| -m : Exibe status da fila FluigMailQueue                                     |"
				echo "| -p : Exibe status da fila TOTVSTechocialPostDeliveryQueue                    |"
				echo "| -s : Exibe status da fila TOTVSTechSocialQueue                               |"
				echo "| -t : Exibe status da fila FluigThumbnail                                     |"
				echo "+==============================================================================+"
			exit;
		;;
esac
			
retorno=$(sh $JBOSS_CLI --connect --controller=$IP_JBOSS:$PORTA_JBOSS --commands="/subsystem=messaging/hornetq-server=default/jms-queue=$fila:read-resource(include-runtime=true)" | grep -i message-count | grep -o "[0-9]*")
#echo "Fila: $fila , Mensagens: $retorno"
echo $retorno