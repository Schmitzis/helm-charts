{{/*
Expand the name of the chart.
*/}}
{{- define "hedgedoc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "hedgedoc.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "hedgedoc.shortName" -}}
{{- $name := include "hedgedoc.fullname" . }}
{{- printf "%s" $name | trunc 50 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hedgedoc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "hedgedoc.labels" -}}
app.kubernetes.io/name: {{ include "hedgedoc.name" . }}
helm.sh/chart: {{ include "hedgedoc.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ default .Chart.AppVersion .Values.image.tag }}
{{- end -}}


{{/*
Return the docker image
*/}}
{{- define "hedgedoc.image" -}}
{{- $registryName := default "nabo.hedgedoc.dev" .Values.image.registry -}}
{{- $repositoryName := default "hackmdio/hackmd" .Values.image.repository -}}
{{- $tag := default .Chart.AppVersion .Values.image.tag -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{/*
Return the CodiMD domain
*/}}
{{- define "hedgedoc.domain" -}}
{{- $domain := default .Values.hedgedoc.connection.domain .Values.ingress.hostname -}}
{{- printf "%s" $domain -}}
{{- end -}}

{{/*
Embedded PostgreSQL service name
*/}}
{{- define "hedgedoc.postgresql-svc" -}}
{{- if .Values.postgresql.fullnameOverride -}}
  {{- .Values.postgresql.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
  {{- $name := default "postgresql" .Values.postgresql.nameOverride -}}
  {{- if contains $name .Release.Name -}}
    {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
  {{- end -}}
{{- end -}}
{{- end -}}


{{/*
Embedded MariaDB service name
*/}}
{{- define "hedgedoc.mariadb-svc" -}}
{{- if .Values.mariadb.fullnameOverride -}}
  {{- .Values.mariadb.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
  {{- $name := default "mariadb" .Values.mariadb.nameOverride -}}
  {{- if contains $name .Release.Name -}}
    {{- .Release.Name | trunc 63 | trimSuffix "-" -}}
  {{- else -}}
    {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
  {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for deployment.
*/}}
{{- define "hedgedoc.deployment.apiVersion" -}}
{{- if semverCompare "<1.14-0" .Capabilities.KubeVersion.GitVersion -}}
{{- print "extensions/v1beta1" -}}
{{- else -}}
{{- print "apps/v1" -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper Storage Class
*/}}
{{- define "hedgedoc.storageClass" -}}
{{/*
Helm 2.11 supports the assignment of a value to a variable defined in a different scope,
but Helm 2.9 and 2.10 does not support it, so we need to implement this if-else logic.
*/}}
{{- if .Values.global -}}
  {{- if .Values.global.storageClass -}}
    {{- if (eq "-" .Values.global.storageClass) -}}
      {{- printf "storageClassName: \"\"" -}}
    {{- else }}
      {{- printf "storageClassName: %s" .Values.global.storageClass -}}
    {{- end -}}
  {{- end -}}
{{- else if .Values.storageClass -}}
  {{- if (eq "-" .Values.storageClass) -}}
    {{- printf "storageClassName: \"\"" -}}
  {{- else }}
    {{- printf "storageClassName: %s" .Values.storageClass -}}
  {{- end -}}
{{- else if .Values.hedgedoc.imageStorePersistentVolume.storageClass -}}
  {{- if (eq "-" .Values.hedgedoc.imageStorePersistentVolume.storageClass) -}}
    {{- printf "storageClassName: \"\"" -}}
  {{- else }}
    {{- printf "storageClassName: %s" .Values.hedgedoc.imageStorePersistentVolume.storageClass -}}
  {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Return need create image secret
*/}}
{{- define "hedgedoc.needImageSecret" -}}
{{- $imgur := false -}}
{{- $s3 := false -}}
{{- $minio := false -}}
{{- $azure := false -}}
{{- if .Values.hedgedoc.imageUpload.imgur -}}
  {{- if .Values.hedgedoc.imageUpload.imgur.clientId -}}
    {{- $imgur = true -}}
  {{- end -}}
{{- end -}}
{{- if .Values.hedgedoc.imageUpload.s3 -}}
  {{- if .Values.hedgedoc.imageUpload.s3.accessKeyId -}}
    {{- $s3 = true -}}
  {{- end -}}
{{- end -}}
{{- if .Values.hedgedoc.imageUpload.minio -}}
  {{- if .Values.hedgedoc.imageUpload.minio.accessKey -}}
    {{- $minio = true -}}
  {{- end -}}
{{- end -}}
{{- if .Values.hedgedoc.imageUpload.azure -}}
  {{- if .Values.hedgedoc.imageUpload.azure.connectionString -}}
    {{- $azure = true -}}
  {{- end -}}
{{- end -}}
{{- $needImage := (or $imgur (or $s3 (or $minio $azure))) -}}
{{- print $needImage -}}
{{- end -}}