{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "seafile.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "seafile.fullname" -}}
{{- $name := .Chart.Name -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "seafile.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "seafile.labels" -}}
app.kubernetes.io/name: {{ include "seafile.name" . }}
helm.sh/chart: {{ include "seafile.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* Resolve container image */}}
{{- define "seafile.image" -}}
    {{- if .Values.seafile.configs.image -}}
        {{- printf "%s" .Values.seafile.configs.image }}
    {{- else -}}
        {{- printf "seafileltd/seafile-pro-mc:%s-latest" .Chart.AppVersion }}
    {{- end }}
{{- end }}

{{/* Whether to create/mount the seafile-data PVC */}}
{{- define "seafile.seafileDataVolume.enabled" -}}
    {{- $config := .Values.seafile.configs.seafileDataVolume -}}
    {{- if or
        (not $config)
        (eq ($config.disablePVC | default false) false)
    -}}
        {{- printf "true" }}
    {{- else -}}
        {{- printf "false" }}
    {{- end }}
{{- end }}

{{/* PVC storage size */}}
{{- define "seafile.seafileDataVolume.storage" -}}
    {{- if and (.Values.seafile.configs.seafileDataVolume) (.Values.seafile.configs.seafileDataVolume.storage) -}}
        {{- printf "%s" .Values.seafile.configs.seafileDataVolume.storage }}
    {{- else -}}
        {{- printf "10Gi" }}
    {{- end }}
{{- end }}

{{/* PVC claim name (existing or default) */}}
{{- define "seafile.seafileDataVolume.claimName" -}}
    {{- $config := .Values.seafile.configs.seafileDataVolume -}}
    {{- if and $config $config.existingClaim -}}
        {{- printf "%s" $config.existingClaim }}
    {{- else -}}
        {{- printf "seafile-data" }}
    {{- end }}
{{- end }}
