icinga2
=======
Icinga2 Master


# Core

## Icinga2 / Icingaweb2 Users + Credentials 


| Key 							 	| Type   | Default 			  	  | Description 									   		|
|-----------------------------------|--------|------------------------|---------------------------------------------------------|
| icinga2.auth.cmdApiUser 			| string | `"root"` 			  | Icinga2 API Admin Password 								|
| icinga2.auth.cmdApiPass 			| string | `"ChangeMe123"` 		  | Icinga2 API Admin Username 								|
| icinga2.auth.agentDeployUser 		| string | `"ansible"` 			  | Icinga2 API Agent Password 								|
| icinga2.auth.agentDeployPass 		| string | `"ChangeMe123"` 		  | Icinga2 API Agent Username 								|
| icinga2.auth.apiHACheckUser 		| string | `"ha-api"` 			  | Icinga2 API HA-Check Username 	 					    |
| icinga2.auth.apiHACheckPass 		| string | `"ChangeMe123"` 		  | Icinga2 API HA-Check Password 					   		|
| icinga2.auth.apiPromUser 			| string | `"prometheus"` 		  | Icinga2 API Prometheus Username 					    |
| icinga2.auth.apiPromPass 			| string | `"ChangeMe123"` 		  | Icinga2 API Prometheus Password 					    |
| icinga2.auth.webDirectorUser 		| string | `"director"` 		  | Icinga2 API Director username 							|
| icinga2.auth.webDirectorPass 		| string | `"ChangeMe123"` 		  | Icinga2 API Director Password 							|
| icinga2.auth.webRootUser 			| string | `"icinga"` 			  | Icingaweb2 Username, if not LDAP						|
| icinga2.auth.webRootPass 			| string | `"ChangeMe123"` 		  | Icingaweb2 Password, if not LDAP						|


## Master 1 / 2


| Key 							 	| Type   | Default 			  	  | Description 									   		|
|-----------------------------------|--------|------------------------|---------------------------------------------------------|
| icinga2.master.externalPort 		| string | `"5665"` 			  | Expose Icinga2 Masters at specified Port 				|
| icinga2.master.imagePullPolicy 	| string | `"IfNotPresent"` 	  | Always / IfNotPresent / Never 							|
| icinga2.master.imagePullSecret 	| string | `""` 				  | Image Pull Secret for private Registry 					|
| icinga2.master.repository 		| string | `"registry.gitlab.com/olemisea/icinga2"` | Docker Registry to use 				|
| icinga2.master.tag 				| string | `"stable-2.11.4-master"`| Icinga2 Master Image Tag to use 						|
| icinga2.master.ticketSalt 		| string | `"ChangeMe123"`		  | Icinga2 Ticket Salt  									|
| icinga2.master1.hostname 		 	| string | `"master-1.test.com"`  | Master1 Hostname 										|
| icinga2.master1.CanonicalName 	| string | `"master-1"` 		  | Master1 pretty Name for Notications 					|
| icinga2.master1.initContainers 	| list 	 | `[]` 				  | Kubernetes additional Init Containers like DynDNS		|
| icinga2.master1.nodeAffinity 		| list 	 | `[]` 				  | https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity |
| icinga2.master1.pvc.storageClass 	| string | `"default"` 			  | PVC Storage Class 										|
| icinga2.master1.pvc.size 			| string | `"10Gi"` 			  | PVC Storage Size 										|
| icinga2.master2.hostname 		 	| string | `"master-1.test.com"`  | Master2 Hostname 										|
| icinga2.master2.CanonicalName 	| string | `"master-1"` 		  | Master2 pretty Name for Notications 					|
| icinga2.master2.initContainers 	| list 	 | `[]` 				  | Kubernetes additional Init Containers like DynDNS		|
| icinga2.master2.nodeAffinity 		| list 	 | `[]` 				  | https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity |
| icinga2.master2.pvc.storageClass 	| string | `"default"` 			  | PVC Storage Class 										|
| icinga2.master2.pvc.size 			| string | `"10Gi"` 			  | PVC Storage Size 										|


## Icingaweb2

| Key 							 	| Type   | Default 			  	  | Description 									   		|
|-----------------------------------|--------|------------------------|---------------------------------------------------------|
| icinga2.k8sClusterDomain 		 	| string | `"svc.cluster.local"`  | Kubernetes Cluster domain to append for Dnsmasq    		|
| icinga2.nodeLocalDnsIp 		 	| string | `"169.254.20.10"` 	  | Set to ClusterDNS Address ( CoreDNS / NodelocalDNS 		|
| icinga2.web.certManagerIssuer  	| string | `""` 				  | CertManager Issuer for dynamically created certificate 	|
| icinga2.web.hostname           	| string | `"icinga2.fqdm.de"`    | FQDN under which Icingaweb2 will be exposed				|
| icinga2.web.imagePullPolicy    	| string | `"IfNotPresent"` 	  | Always / IfNotPresent / Never 							|
| icinga2.web.imagePullSecret    	| string | `""` 				  | Image Pull Secret for private Registry 					|
| icinga2.web.initContainers     	| list   | `[]` 				  | Kubernetes additional Init Containers like DynDNS		|
| icinga2.web.repository         	| string | `"registry.gitlab.com/olemisea/icingaweb2"` | Docker Registriy to use 			|
| icinga2.web.tag                	| string | `"2.8.0"` 			  | Icingaweb2 Image Tag to use 							|
| icinga2.web.tlsSecret          	| string | `""` 				  | Provide Existing Certificate to skip dynamic issuer  	|
| icinga2.web.waitForMasterUptime 	| int    | `65` 				  | Wait for Icinga2 API to stabilize before start  		|


## Mysql

| Key 							 	| Type   | Default 			  	  | Description 									   		|
|-----------------------------------|--------|------------------------|---------------------------------------------------------|
| icinga2.mysql.host 				| string | `"icinga2-mysql"` 	  | MySQL Hostname  										|
| icinga2.mysql.port 				| string | `"3306"` 			  | MySQL Port 												|
| icinga2.mysql.rootUser 			| string | `"root"` 			  | MySQL Root Username 									|
| icinga2.mysql.rootPass 			| string | `"ChangeMe12345"` 	  | MySQL Root Password 									|
| icinga2.mysql.ic2DbPrefix 		| string | `"icinga2_"` 		  | DbPrefix for auto created DBs 							|
| icinga2.mysql.ic2UserPass 		| string | `"ChangeMe123"` 		  | Password for auto created DBs 							|
| icinga2.mysql.ic2UserPrefix 		| string | `"icinga2_"` 		  | UserPrefix for auto created Mysql users   				|

## SMTP


| Key 							 	| Type   | Default 			  	  | Description 									   		|
|-----------------------------------|--------|------------------------|---------------------------------------------------------|
| icinga2.msmtp.relayServer 		| string | `""` 				  | SMTP Service to send Notifications                      |
| icinga2.msmtp.smtpAuthPass 		| string | `""` 				  | SMTP Password 											|
| icinga2.msmtp.smtpAuthUser 		| string | `""` 				  |  |
| icinga2.msmtp.accName 			| string | `""` 				  | AccountName to use within msmtp 						|
| icinga2.msmtp.recvRoot 			| string | `""` 				  | Set default recipient for mails                   		|
| icinga2.msmtp.relayUseStartTLS 	| string | `""` 				  | Wether to use StartTLS or not ( true / false )		    | 
| icinga2.msmtp.rewriteDomain 		| string | `""` 				  | Rewrite Mailsending domain if needed (e.g. Mailgun /SES)|
| icinga2.msmtp.senderEmail 		| string | `""` 				  | Rewrite Mailsender if needed (e.g. Mailgun /SES)		|


# Sidecars

## Grafana

| Key 							 	| Type   | Default 			  	  | Description 									   		|
|-----------------------------------|--------|------------------------|---------------------------------------------------------|
| icinga2.grafana.host 				| string | `""` 				  | Grafana Service Name /  internal URL 	 				|
| icinga2.grafana.port 				| string | `"80"` 				  | Grafana Service Port 		  							|
| icinga2.grafana.publicUrl 		| string | `""` 				  | Grafana Public URL to use when clicking Diagrams 		|
| icinga2.grafana.publicProtocol 	| string | `"https"` 			  | Grafana Public URL Protocol 							|
| icinga2.grafana.authentication 	| string | `"token"` 			  | Authentication mechanism: basic / token 				|
| icinga2.grafana.authenticationPassword | string | `""` 			  | If authentication == Basic: Username for Grafana 		|
| icinga2.grafana.authenticationUsername | string | `""` 			  | If authentication == Basic: Password for Grafana 		|
| icinga2.grafana.token 			| string | `""` 				  | If authentication == Token: Token for Grafana 			|
| icinga2.grafana.dashboardUid 		| string | `"Y07mGBtmk"` 		  | Icinga2 Dashboard UID (must be imported before!) 		|

## InfluxDB

| Key 							 	| Type   | Default 			  	  | Description 									   		|
|-----------------------------------|--------|------------------------|---------------------------------------------------------|
| icinga2.influxdb.enable 			| bool   | `true` 				  | Wether to enable InfluxDB or not 						|
| icinga2.influxdb.adminUser 		| string | `"root"` 			  | Username for InfluxDB Admin 							|
| icinga2.influxdb.adminPass 	 	| string | `"ChangeMe123"` 	  	  | Pasword for InfluxDB Admin 								|
| icinga2.influxdb.db 				| string | `"icinga2"` 			  | DB name to use 											|
| icinga2.influxdb.imagePullPolicy 	| string | `"IfNotPresent"` 	  | https://kubernetes.io/docs/concepts/configuration/overview/#container-images |
| icinga2.influxdb.imagePullSecret 	| string | `""` 	  			  | Image Pull Secret for private Registry 					|
| icinga2.influxdb.user 			| string | `"icinga2"` 			  | username for InfluxDB Icinga2							|
| icinga2.influxdb.pass 			| string | `"ChangeMe123"` 		  | Pasword for InfluxDB Icinga2							|
| icinga2.influxdb.port 			| string | `"8086"` 			  | InfluxDB Port 											|
| icinga2.influxdb.pvc.size 		| string | `"10Gi"` 			  | PVC Size 												|
| icinga2.influxdb.pvc.storageClass | string | `"default"` 			  | https://kubernetes.io/docs/concepts/storage/storage-classes/ |
| icinga2.influxdb.repository 		| string | `"influxdb"` 		  | Docker Registry to use 									|
| icinga2.influxdb.tag 				| string | `"1.7"` 				  | InfluxDB Image Tag to use 								|



