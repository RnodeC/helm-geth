{{- define "berachain.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "berachain.serviceAccountName" -}}
berachain
{{- end -}}

{{/*
Create image name that is used in the statefulset
*/}}
{{- define "berachain.image" -}}
{{- printf "%s:%s" .Values.image.repository .Values.image.tag -}}
{{- end -}}
