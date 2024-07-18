resource "yandex_alb_load_balancer" "balancer" {
  name        = "balancer"
  network_id  = yandex_vpc_network.lan1.id

  allocation_policy {
    location {
      zone_id   = "ru-central1-b"
      subnet_id = yandex_vpc_subnet.subnet-2.id
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
        http_router_id = yandex_alb_http_router.netology-router.id
      }
    }
  }

 
}
