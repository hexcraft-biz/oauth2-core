## ORY Hydra Configuration
# Ref: https://www.ory.sh/hydra/docs/reference/configuration

serve:
  public:
    cors:
      enabled: true
  cookies:
    same_site_mode: Lax

dsn: ${oauth2_core_dsn}

oidc:
  subject_identifiers:
    supported_types:
      - public
      - pairwise
    pairwise:
      salt: ${oauth2_core_salt}

urls:
  login: ${oauth2_core_urls_login}
  consent: ${oauth2_core_urls_consent}
  logout: ${oauth2_core_urls_logout}
  error: ${oauth2_core_urls_error}
  post_logout_redirect: ${oauth2_core_urls_post_logout_redirect}
  self:
    public: ${oauth2_core_urls_self_public}
    issuer: ${oauth2_core_urls_self_issuer}

ttl:
  access_token: 1h
  refresh_token: 1h
  id_token: 1h
  auth_code: 1h

oauth2:
  expose_internal_errors: true

secrets:
  cookie:
    - ${oauth2_core_secrets_cookie}
  system:
    - ${oauth2_core_secrets_system}

log:
  leak_sensitive_values: true
  format: json
  level: debug
