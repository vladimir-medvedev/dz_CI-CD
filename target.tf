resource "yandex_alb_target_group" "netology" {
  name           = "netology"

  target {
    subnet_id    = "e9b1120d0k8i4m1nm7h9"
    ip_address   = "192.168.10.15"
  }

  target {
    subnet_id    = "e2lmv72g7uvgocknu92u"
    ip_address   = "192.168.20.9"
  }
  
}
