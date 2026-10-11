variable "kibana_security_exception_lists" {
  description = <<EOT
Map of kibana_security_exception_lists, attributes below
Required:
    - description
    - name
    - type
Optional:
    - list_id
    - meta
    - namespace_type
    - os_types
    - space_id
    - tags
    - timeouts
    - kibana_connection (block):
        - api_key (optional)
        - bearer_token (optional)
        - ca_certs (optional)
        - endpoints (optional)
        - insecure (optional)
        - password (optional)
        - username (optional)
EOT

  type = map(object({
    description    = string
    name           = string
    type           = string
    list_id        = optional(string)
    meta           = optional(string)
    namespace_type = optional(string)
    os_types       = optional(set(string))
    space_id       = optional(string)
    tags           = optional(set(string))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
    kibana_connection = optional(list(object({
      api_key      = optional(string)
      bearer_token = optional(string)
      ca_certs     = optional(list(string))
      endpoints    = optional(list(string))
      insecure     = optional(bool)
      password     = optional(string)
      username     = optional(string)
    })))
  }))
}

