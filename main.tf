terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

variable "yandex_cloud_token" {
  type        = string
  description = "y0_AgAAAAA7bTP_AATuwQAAAADwuzxL4YksizVKRMGzhNCijZ2cyUZKKYI"
}

provider "yandex" {
  token     = "y0_AgAAAAA7bTP_AATuwQAAAADwuzxL4YksizVKRMGzhNCijZ2cyUZKKYI"
  cloud_id  = "P9-PFNhiz9b4STN6tpvA"
  folder_id = "b1gsorovfokba2962964"
#  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "diplom1" {
  name = "diplom1"
  platform_id = "standard-v3"
  zone = "ru-central1-a"
  
  resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts7j40q5b9rpjr"
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
  scheduling_policy {
    preemptible = true
}
}

resource "yandex_compute_instance" "diplom2" {
  name = "diplom2"
  platform_id = "standard-v3"
  zone = "ru-central1-b"
  
 resources {
    cores  = 2
    memory = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts7j40q5b9rpjr"
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-2.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
  scheduling_policy {
    preemptible = true
}
}

data "yandex_alb_target_group" "netology" {
  target_group_id = "ds7hutdsveic7l6a84cf"
}

data "yandex_alb_backend_group" "backend-netology" {
  backend_group_id = "ds7psobol0difet2b7i6"
}

data "yandex_alb_http_router" "netology-router" {
  http_router_id = "ds79jjtab0gm9mbvj2dq"
}

output "tf-router-name" {
  value = data.yandex_alb_http_router.netology-router.name
}

output "backend_group" {
  value = data.yandex_alb_backend_group.backend-netology.http_backend
}

output "target_group" {
  value = data.yandex_alb_target_group.netology.target
}  

#resource "yandex_vpc_network" "network-1" {
 # name = "network1"
#}

#resource "yandex_vpc_subnet" "subnet-1" {
 # name           = "subnet1"
  #zone           = "ru-central1-a"
  #network_id     = yandex_vpc_network.network-1.id
  #v4_cidr_blocks = ["192.168.10.0/24"]
#}

#output "internal_ip_address_vm_1" {
 # value = yandex_compute_instance.vm-1.network_interface.0.ip_address
#}
#output "external_ip_address_vm_1" {
#  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
#}
