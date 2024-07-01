resource "yandex_vpc_security_group" "external-sg" {
  name        = "external-sg"
  description = "external-sg"
  network_id  = yandex_vpc_subnet.bastion-external.id

  ingress {
    protocol       = "TCP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
}
  
 resource "yandex_vpc_security_group" "internal-sg" {
  name        = "internal-sg"
  description = "internal-sg"
  network_id  = yandex_vpc_subnet.subnet-2.id

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
