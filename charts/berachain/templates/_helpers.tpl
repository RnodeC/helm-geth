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

{{/*
Returns a random 32 byte hex string to be used as the common berachain jwt token, if one wasn't provided
*/}}
{{- define "berachain.jwt" -}}
{{- $jwt := "" -}}
{{- if .Values.berachain.jwt -}}
{{- $jwt = .Values.berachain.jwt -}}
{{- else -}}
{{- $jwt = randAlphaNum 32 | sha256sum -}}
{{- end -}}
{{ $jwt | b64enc | quote }}
{{- end -}}
