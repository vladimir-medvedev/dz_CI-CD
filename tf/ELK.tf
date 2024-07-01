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
      image_id = "fd8a28k7fnc9u68s45g5"
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-2.id
    nat       = false
  }

  metadata = {
    user-data = "${file("./meta2.txt")}"
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
      image_id = "fd8a28k7fnc9u68s45g5"
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-2.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta_kibana.txt")}"
  }
  scheduling_policy {
    preemptible = true
}
}
