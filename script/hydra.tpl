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
  dynamic_client_registration:
    default_scope:
      - openid
      - offline
      - offline_access
    enabled: false
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
    admin: ${OAUTH2_CORE_URLS_SELF_ADMIN}
    issuer: ${OAUTH2_CORE_URLS_SELF_PUBLIC}

webfinger:
  oidc_discovery:
    supported_claims:
      - email
      - email_verified
      - phone_number
      - phone_number_verified
      - profile
    supported_scope:
      - email
      - offline_access
      - openid
      - phone
      - profile
    userinfo_url: ${OAUTH2_CORE_URLS_SELF_PUBLIC}/userinfo
    auth_url: ${OAUTH2_CORE_URLS_SELF_PUBLIC}/oauth2/auth
    token_url: ${OAUTH2_CORE_URLS_SELF_PUBLIC}/oauth2/token
    jwks_url: ${OAUTH2_CORE_URLS_SELF_PUBLIC}/.well-known/jwks.json

secrets:
  cookie:
    - ${OAUTH2_CORE_SECRETS_COOKIE}
  system:
    - ${OAUTH2_CORE_SECRETS_SYSTEM}

strategies:
  access_token: ${OAUTH2_STRATEGIES_ACCESS_TOKEN}
  jwt:
    scope_claim: string
  scope: exact

ttl:
  access_token: ${OAUTH2_TTL_ACCESS_TOKEN}
  refresh_token: ${OAUTH2_TTL_REFRESH_TOKEN}
  id_token: ${OAUTH2_TTL_ID_TOKEN}
  auth_code: ${OAUTH2_TTL_AUTH_CODE}
  login_consent_request: ${OAUTH2_TTL_LOGIN_CONSENT_REQUESET}

oauth2:
  hashers:
    bcrypt:
      cost: 4
  session:
    encrypt_at_rest: true
  pkce:
    enforced_for_public_clients: ${OAUTH2_PKCE_ENFORCED_FOR_PUBLIC_CLIENTS}
    enforced: ${OAUTH2_PKCE_ENFORCED}
  expose_internal_errors: true

log:
  leak_sensitive_values: true
  format: json
  level: debug
