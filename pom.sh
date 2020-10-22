GROUP_ID=bash
ARTIFACT_ID=sh-logger
VERSION=v1.4.0

declare -A REPOSITORY=( \
	[host]="shpmcenter.com" \
	[port]=443 \
);

declare -A DEPENDENCIES=(
	[sh-pm]=v3.2.3 
);

SSO_API_AUTHENTICATION_URL=https://shpmcenter.com/sso/rest/api/sso/authentication
