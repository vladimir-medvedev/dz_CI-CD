terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}


provider "yandex" {
  token     = var.yandex_cloud_token
  #token     = "y0_AgAAAAA7bTP_AATuwQAAAADwuzxL4YksizVKRMGzhNCijZ2cyUZKKYI"
  cloud_id  = "P9-PFNhiz9b4STN6tpvA"
  folder_id = "b1gsorovfokba2962964"
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "lan1" {
  name = "lan1"
}

resource "yandex_compute_instance" "web-1" {
  name = "web-1"
  platform_id = "standard-v3"
  zone = "ru-central1-a"
  
  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8a28k7fnc9u68s45g5"
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = false
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
  scheduling_policy {
    preemptible = true
}
}

resource "yandex_compute_instance" "web-2" {
  name = "web-2"
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
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-2.id
    nat       = false
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
  scheduling_policy {
    preemptible = true
}
}

