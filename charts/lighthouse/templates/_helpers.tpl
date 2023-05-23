{{- define "lighthouse.labels" -}}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ .Chart.Name }}
{{- end -}}


{{/*
Create the name of the service account to use
*/}}
{{- define "lighthouse.serviceAccountName" -}}
lighthouse
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
{{- with .Values.lighthouse -}}
{{- if and .beacon .beacon.executionEndpoint .beacon.executionEndpoint.jwt -}}
{{- $jwt = .beacon.executionEndpoint.jwt -}}
{{- end -}}
{{- end -}}
{{ $jwt | b64enc | quote }}
{{- end -}}
