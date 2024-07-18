resource "yandex_alb_target_group" "netology" {
  name           = "netology"

  target {
    subnet_id    = yandex_vpc_subnet.subnet-1.id
    ip_address   = "192.168.10.15"
  }

  target {
    subnet_id    = yandex_vpc_subnet.subnet-2.id
    ip_address   = "192.168.20.9"
  }
  
}
