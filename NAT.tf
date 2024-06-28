data "yandex_vpc_network" "lan1" {
  folder_id = "b1gsorovfokba2962964"
  name      = "lan1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  folder_id      = "b1gsorovfokba2962964"
  name           = "subnet-1"
  v4_cidr_blocks = ["192.168.10.0/24"]
  zone           = "ru-central1-a"
  network_id     = data.yandex_vpc_network.lan1.id
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_subnet" "subnet-2" {
  folder_id      = "b1gsorovfokba2962964"
  name           = "subnet-2"
  v4_cidr_blocks = ["192.168.20.0/24"]
  zone           = "ru-central1-b"
  network_id     = data.yandex_vpc_network.lan1.id
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_gateway" "nat-gateway" {
  folder_id      = "b1gsorovfokba2962964"
  name = "nat-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  folder_id      = "b1gsorovfokba2962964"
  name       = "route-table"
  network_id = "enp3kf1i4bepemkjri5m"

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat-gateway.id
  }
}

