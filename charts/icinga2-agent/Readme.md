icinga2-agent
=============

## Chart Values

| Key                                  | Type   | Default      | Description                 |
|--------------------------------------|--------|--------------|-----------------------------|
| config.agent.hostDistribution        | string | `""`         | Host OS if not autodetected    |
| config.agent.hostDistributionVersion | string | `""`         | OS Version if not autodetected |
| config.agent.instanceType            | string | `"cloud"`    | Override Instance Type         |
| config.agent.networkInterface        | string | `"eth0"`     | Default Network Interface      |
| config.agent.push                    | int    | `0`          | Icinga2 Push or Pull?          |
| config.agent.rootDevice              | string | `""`         | Rootdevice containing "/"      |
| config.agent.boot_partition          | string | `""`         | mount hosts "/boot" inside container |
| config.agent.gluster_partition       | string | `""`         | mount hosts "/mnt/gluster" inside container |
| config.director.user                 | string | `"director"` | Icinga2 Director API Username  |
| config.director.pass                 | string | `"pass"`     | Icinga2 Director API Password  |
| config.director.uri                  | string | `"https://icinga2.fqdm.de/icinga/director"`|  |
| config.master.ip                     | string | `"master1.icinga2.example.com"` | Master 1 Hostname |
| config.master.ip2                    | string | `""`         | Master 2 Hostname              |
| config.master.port                   | int    | `5665`       | Icinga2 Master Port            |
| imagePullPolicy                      | string | `"IfNotPresent"` | Always / IfNotPresent / Never |
| imagePullSecret                      | string | `""`         | Secret for private Docker Registrx  |
| repository                           | string | `"registry.gitlab.com/olemisea/icinga2-agent-docker"` | Docker repository |
| resources.limits.cpu                 | string | `"300m"`     | K8S CPU Limits  |
| resources.limits.memory              | string | `"500Mi"`    | K8S MEM Limits  |
| resources.requests.cpu               | string | `"200m"`     | K8S CPU Requests  |
| resources.requests.memory            | string | `"200Mi"`    | K8S MEM Requests  |
| tag                                  | string | `"debian-0.4.10"` | Default Docker Image Tag  |
