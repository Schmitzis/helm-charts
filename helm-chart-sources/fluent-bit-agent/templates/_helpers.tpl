{{- define "fluent-bit-agent.resname" -}}
{{- if $.Values.resname -}}
{{- $.Values.resname | trunc 48 | trimSuffix "-" -}}
{{- else -}}
{{- $.Release.Name | trunc 48 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "fluent-bit-agent.name" -}}
{{- default $.Chart.Name $.Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Create chart name and version as used by the chart label. */}}
{{- define "fluent-bit-agent.chart" -}}
{{- printf "%s-%s" $.Chart.Name $.Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{ define "fluent-bit-agent.labels" }}
app: {{ template "fluent-bit-agent.name" $ }}
chart: {{ template "fluent-bit-agent.chart" $ }}
release: {{ $.Release.Name }}
heritage: {{ $.Release.Service }}
{{- end -}}

{{ define "fluent-bit-agent.labels-selector" }}
app: {{ template "fluent-bit-agent.name" $ }}
release: {{ $.Release.Name }}
{{- end -}}
