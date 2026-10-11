resource "elasticstack_kibana_security_exception_list" "kibana_security_exception_lists" {
  for_each = var.kibana_security_exception_lists

  description    = each.value.description
  name           = each.value.name
  type           = each.value.type
  list_id        = each.value.list_id
  meta           = each.value.meta
  namespace_type = each.value.namespace_type
  os_types       = each.value.os_types
  space_id       = each.value.space_id
  tags           = each.value.tags
  timeouts       = each.value.timeouts

  dynamic "kibana_connection" {
    for_each = each.value.kibana_connection != null ? each.value.kibana_connection : []
    content {
      api_key      = kibana_connection.value.api_key
      bearer_token = kibana_connection.value.bearer_token
      ca_certs     = kibana_connection.value.ca_certs
      endpoints    = kibana_connection.value.endpoints
      insecure     = kibana_connection.value.insecure
      password     = kibana_connection.value.password
      username     = kibana_connection.value.username
    }
  }
}

