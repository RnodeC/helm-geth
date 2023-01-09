{{- define "lighthouse.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "lighthouse.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default "lighthouse" .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Create image name that is used in the statefulset
*/}}
{{- define "lighthouse.image" -}}
{{- printf "%s:%s" .Values.image.repository .Values.image.tag -}}
{{- end -}}

{{/*
Lookup jwt value from geth secret in this cluster, if one wasn't provided
*/}}
{{- define "lighthouse.jwt" -}}
{{- $jwt := "faketoken" -}}
{{- $beacon := default dict .beacon -}}
{{- if $beacon.execution_endpoint -}}
{{- $jwt = $beacon.execution_endpoint.jwt -}}
{{- end -}}
{{ $jwt | b64enc | quote }}
{{- end -}}

{{/*
Create execution endpoint string from provided host and port values
*/}}
{{- define "lighthouse.execution-endpoint" -}}
{{- $host := .execution_endpoint.host -}}
{{- $port := .execution_endpoint.port -}}
{{- printf "http://%s:%c" $host $port -}}
{{- end -}}
