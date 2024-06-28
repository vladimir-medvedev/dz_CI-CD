resource "yandex_alb_http_router" "netology-router" {
  name          = "netology-router"
#  labels        = {
#    tf-label    = "tf-label-value"
#    empty-label = ""
#  }
} 

resource "yandex_alb_virtual_host" "diplom-virtual-host" {
  name                    = "diplom-virtual-host"
  http_router_id          = yandex_alb_http_router.netology-router.id
  route {
    name                  = "diplom-route"
    http_route {
      http_route_action {
        backend_group_id  = "ds7psobol0difet2b7i6"
        timeout           = "60s"
      }
    }
  }
#  route_options {
#    security_profile_id   = "<идентификатор_профиля_безопасности>"
#  }
}
