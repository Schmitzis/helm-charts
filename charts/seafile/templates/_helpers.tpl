{{- define "seafile.resname" -}}
{{- if $.Values.resname -}}
{{- $.Values.resname | trunc 48 | trimSuffix "-" -}}
{{- else -}}
{{- $.Release.Name | trunc 48 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "seafile.name" -}}
{{- default $.Chart.Name $.Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "seafile.chart" -}}
{{- printf "%s-%s" $.Chart.Name $.Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{ define "seafile.labels" }}
app: {{ template "seafile.name" $ }}
chart: {{ template "seafile.chart" $ }}
release: {{ $.Release.Name }}
heritage: {{ $.Release.Service }}
{{- end -}}

{{ define "seafile.labels-selector" }}
app: {{ template "seafile.name" $ }}
release: {{ $.Release.Name }}
{{- end -}}

{{- define "seafile.pvcname" -}}
{{- if .Values.pvc.name -}}
{{- .Values.pvc.name -}}
{{- else -}}
{{- template "seafile.resname" . -}}-data
{{- end -}}
{{- end -}}
