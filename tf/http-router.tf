resource "yandex_alb_http_router" "netology-router" {
  name          = "netology-router"
} 

resource "yandex_alb_virtual_host" "diplom-virtual-host" {
  name                    = "diplom-virtual-host"
  http_router_id          = yandex_alb_http_router.netology-router.id
  route {
    name                  = "diplom-route"
    http_route {
      http_route_action {
        backend_group_id  = yandex_alb_backend_group.backend-netology.id
        timeout           = "60s"
      }
    }
  }
}
