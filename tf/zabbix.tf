resource "yandex_compute_instance" "zabbix" {
  name = "zabbix"
  platform_id = "standard-v3"
  zone = "ru-central1-b"
  
 resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8ncabquaiv1n49h9in"
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.bastion-external.id
    nat       = true
    ip_address = "192.168.30.21"
    security_group_ids = [yandex_vpc_security_group.zabbix.id]
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
  scheduling_policy {
    preemptible = true
}
}
