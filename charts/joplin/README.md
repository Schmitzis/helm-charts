# joplin-server

## Values

**Important**: When deploying an application Helm chart you can add more values from our common library chart [here](https://github.com/k8s-at-home/library-charts/tree/main/charts/stable/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://github.com/laurent22/joplin) for more details. |
| env.APP_BASE_URL | string | `"https://joplin.domain"` | joplin-server base URL |
| env.APP_PORT | int | `22300` | joplin-server listening port (same as Service port) |
| env.DB_CLIENT | string | `nil` | Use pg for postgres |
| env.POSTGRES_DATABASE | string | `nil` | Postgres DB name |
| env.POSTGRES_HOST | string | `nil` | Postgres DB Host |
| env.POSTGRES_PASSWORD | string | `nil` | Postgres DB password |
| env.POSTGRES_PORT | string | `nil` | Postgres DB port |
| env.POSTGRES_USER | string | `nil` | Postgres DB Username |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"joplin/server"` | image repository |
| image.tag | string | `"2.1.2"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| postgresql | object | See values.yaml | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) |
| service | object | See values.yaml | Configures service settings for the chart. |

