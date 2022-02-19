{{- define "icinga2.resname" -}}
{{- if $.Values.resname -}}
{{- $.Values.resname | trunc 48 | trimSuffix "-" -}}
{{- else -}}
{{- $.Release.Name | trunc 48 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "icinga2.name" -}}
{{- default $.Chart.Name $.Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "icinga2.chart" -}}
{{- printf "%s-%s" $.Chart.Name $.Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{ define "icinga2.labels" }}
app: {{ template "icinga2.name" $ }}
chart: {{ template "icinga2.chart" $ }}
release: {{ $.Release.Name }}
heritage: {{ $.Release.Service }}
{{- end -}}

{{ define "icinga2.labels-selector" }}
app: {{ template "icinga2.name" $ }}
release: {{ $.Release.Name }}
{{- end -}}
