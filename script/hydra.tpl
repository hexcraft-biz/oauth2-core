## ORY Hydra Configuration
# Ref: https://www.ory.sh/hydra/docs/reference/configuration

serve:
  public:
    cors:
      enabled: true
  cookies:
    same_site_mode: Lax

dsn: ${OAUTH2_CORE_DSN}

oidc:
  subject_identifiers:
    supported_types:
      - public
      - pairwise
    pairwise:
      salt: ${OAUTH2_CORE_SALT}

urls:
  login: ${OAUTH2_CORE_URLS_LOGIN}
  consent: ${OAUTH2_CORE_URLS_CONSENT}
  logout: ${OAUTH2_CORE_URLS_LOGOUT}
  error: ${OAUTH2_CORE_URLS_ERROR}
  post_logout_redirect: ${OAUTH2_CORE_URLS_POST_LOGOUT_REDIRECT}
  self:
    public: ${OAUTH2_CORE_URLS_SELF_PUBLIC}
    issuer: ${OAUTH2_CORE_URLS_SELF_ISSUER}

ttl:
  access_token: 1h
  refresh_token: 1h
  id_token: 1h
  auth_code: 1h

oauth2:
  expose_internal_errors: true

pkce:
  enforced_for_public_clients: true

secrets:
  cookie:
    - ${OAUTH2_CORE_SECRETS_COOKIE}
  system:
    - ${OAUTH2_CORE_SECRETS_SYSTEM}

log:
  leak_sensitive_values: true
  format: json
  level: debug
