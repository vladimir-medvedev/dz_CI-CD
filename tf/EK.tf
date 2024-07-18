resource "yandex_compute_instance" "elasticsearch" {
  name = "elasticsearch"
  platform_id = "standard-v3"
  zone = "ru-central1-b"
  
 resources {
    cores  = 2
    memory = 6
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8ncabquaiv1n49h9in"
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-2.id
    ip_address   = "192.168.20.21"
    nat       = false
    security_group_ids = [yandex_vpc_security_group.EK.id]
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
  scheduling_policy {
    preemptible = true
}
}

resource "yandex_compute_instance" "kibana" {
  name = "kibana"
  platform_id = "standard-v3"
  zone = "ru-central1-b"
  
 resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8ncabquaiv1n49h9in"
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.bastion-external.id
    ip_address   = "192.168.30.9"
    nat       = true
    security_group_ids = [yandex_vpc_security_group.EK.id]
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
  scheduling_policy {
    preemptible = true
}
}
