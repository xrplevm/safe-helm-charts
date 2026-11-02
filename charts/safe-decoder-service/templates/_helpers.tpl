{{/*
Expand the name of the chart.
*/}}
{{- define "safe-decoder-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "safe-decoder-service.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name for redis
*/}}
{{- define "safe-decoder-service.redis.fullname" -}}
{{- if index .Values "safe-decoder-service-redis" "fullnameOverride" }}
{{- index .Values "safe-decoder-service-redis" "fullnameOverride" | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $suffix := "safe-decoder-service-redis" }}
{{- printf "%s-%s" .Release.Name $suffix | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name for postgresql
*/}}
{{- define "safe-decoder-service.postgresql.fullname" -}}
{{- if index .Values "safe-decoder-service-postgresql" "fullnameOverride" }}
{{- index .Values "safe-decoder-service-postgresql" "fullnameOverride" | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $suffix := "safe-decoder-service-postgresql" }}
{{- printf "%s-%s" .Release.Name $suffix | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
