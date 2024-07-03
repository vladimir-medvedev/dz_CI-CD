resource "yandex_vpc_security_group" "external-sg" {
  name        = "external-sg"
  description = "external-sg"
  network_id  = yandex_vpc_network.lan1.id

  ingress {
    protocol       = "TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
}
  
 resource "yandex_vpc_security_group" "internal-sg" {
  name        = "internal-sg"
  description = "internal-sg"
  network_id  = yandex_vpc_network.lan1.id

  ingress {
    protocol       = "TCP"
    v4_cidr_blocks = ["192.168.20.254/32"]
    port           = 22
  }
  egress {
    protocol          = "TCP"
    predefined_target = "self_security_group"
    port           = 22
  }
}  

resource yandex_vpc_security_group web {
  name        = "web"
  description = "web"
  network_id  = yandex_vpc_network.lan1.id
  
  ingress {
    description    = "Allow SSH"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["192.168.20.0/24"]
  }
  ingress {
    description    = "Allow HTTP"
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description    = "Allow HTTPS"
    protocol       = "TCP"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description    = "Allow Zabbix-agent"
    protocol       = "TCP"
    port           = 10050
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description    = "Allow Filebeat"
    protocol       = "TCP"
    port           = 5044
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    description    = "Permit ANY"
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource yandex_vpc_security_group zabbix {
  name        = "zabbix"
  description = "zabbix"
  network_id  = yandex_vpc_network.lan1.id
  
  ingress {
    description    = "Allow SSH"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["192.168.20.0/24"]
  }
  ingress {
    description    = "Allow HTTP"
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description    = "Allow HTTPS"
    protocol       = "TCP"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "Allow Zabbix-agent"
    protocol       = "TCP"
    port           = 10050
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    description    = "Permit ANY"
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource yandex_vpc_security_group ELK {
  name        = "ELK"
  description = "ELK"
  network_id  = yandex_vpc_network.lan1.id
  
  ingress {
    description    = "Allow SSH"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["192.168.20.0/24"]
  }
  ingress {
    description    = "Allow HTTP"
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description    = "Allow HTTPS"
    protocol       = "TCP"
    port           = 443
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description    = "Allow Elasticsearch"
    protocol       = "TCP"
    port           = 9200
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description    = "Allow Kibana"
    protocol       = "TCP"
    port           = 5601
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description    = "Allow Filebeat"
    protocol       = "TCP"
    port           = 5044
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    description    = "Permit ANY"
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  
}
