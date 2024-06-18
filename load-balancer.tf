resource "yandex_alb_load_balancer" "balancer" {
  name        = "balancer"
  network_id  = "enp0uigoiduvbugmt6qs"
  #security_group_ids = ["<список_идентификаторов_групп_безопасности>"]

  allocation_policy {
    location {
      zone_id   = "ru-central1-b"
      subnet_id = "e2lptoc7b28g6dk9lkb0" 
    }
  }

  listener {
    name = "obrabotchik"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [ 80 ]
    }
    http {
      handler {
        http_router_id = "ds79jjtab0gm9mbvj2dq"
      }
    }
  }

  #log_options {
  #  log_group_id = "<идентификатор_лог-группы>"
  #  discard_rule {
  #    http_codes          = ["<HTTP-код>"]
  #    http_code_intervals = ["<класс_HTTP-кодов>"]
  #    grpc_codes          = ["<gRPC-код>"]
  #    discard_percent     = <доля_отбрасываемых_логов>
  #  }
 # }
}
