resource "yandex_vpc_address" "bastion_addr" {
  name = "bastion_addr"
  external_ipv4_address  {
    zone_id = "ru-central1-b"
  }
}
  
resource "yandex_compute_instance" "bastion-host" {
  name = "bastion-host"
  platform_id = "standard-v3"
  zone = "ru-central1-b"
  
  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd83cs14lgj2gbodspbq"
      size = 10
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.bastion-external.id
    nat            = true
    nat_ip_address = yandex_vpc_address.bastion_addr.external_ipv4_address[0].address
    security_group_ids = [yandex_vpc_security_group.external-sg.id, yandex_vpc_security_group.internal-sg.id]
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
  scheduling_policy {
    preemptible = true
}
}
