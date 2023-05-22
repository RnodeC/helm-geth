{{- define "geth.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "geth.serviceAccountName" -}}
geth
{{- end -}}

{{/*
Create image name that is used in the statefulset
*/}}
{{- define "geth.image" -}}
{{- printf "%s:%s" .Values.image.repository .Values.image.tag -}}
{{- end -}}

{{/*
Returns a random 32 byte hex string to be used as the common geth jwt token, if one wasn't provided
*/}}
{{- define "geth.jwt" -}}
{{- $jwt := "" -}}
{{- if .Values.geth.jwt -}}
{{- $jwt = .Values.geth.jwt -}}
{{- else -}}
{{- $jwt = randAlphaNum 32 | sha256sum -}}
{{- end -}}
{{ $jwt | b64enc | quote }}
{{- end -}}
