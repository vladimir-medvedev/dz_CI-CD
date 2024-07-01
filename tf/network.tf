resource "yandex_vpc_network" "lan1" {
  name = "lan1"
}

#resource "yandex_vpc_subnet" "subnet-1" {
#  name           = "subnet1"
#  zone           = "ru-central1-a"
#  network_id     = yandex_vpc_network.lan1.id
#  v4_cidr_blocks = ["192.168.10.0/24"]
#}

#resource "yandex_vpc_subnet" "subnet-2" {
#  name           = "subnet-2"
#  zone           = "ru-central1-b"
#  network_id     = yandex_vpc_network.lan1.id
#  v4_cidr_blocks = ["192.168.20.0/24"]
#}
