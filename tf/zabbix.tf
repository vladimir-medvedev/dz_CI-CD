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
      image_id = "fd8a28k7fnc9u68s45g5"
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-2.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta1.txt")}"
  }
  scheduling_policy {
    preemptible = true
}
}
