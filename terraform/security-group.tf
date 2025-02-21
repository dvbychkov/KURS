resource "yandex_vpc_security_group" "in_sg" {
  name        = "Test security group1"
  description = "Description for security group"
  network_id  = yandex_vpc_network.network-1.id

  egress {
    protocol       = "ANY"
    description    = "any"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-http"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-https"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-nodeexporter"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 9100
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-nodeexporter"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 9200
  }
  ingress {
    protocol       = "TCP"
    description    = "prometheus"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 9090
  }
  ingress {
    protocol       = "TCP"
    description    = "internal-promtheus-nginxlog-exporter"
    v4_cidr_blocks = ["10.128.0.0/24", "10.129.0.0/24"]
    port           = 4040
  }
  ingress {
    protocol       = "TCP"
    description    = "SSH"
    v4_cidr_blocks = ["10.128.0.0/24", "10.129.0.0/24"]
    port           = 22
  }
  ingress {
    protocol       = "ICMP"
    description    = "ICMP"
    v4_cidr_blocks = ["10.128.0.0/24", "10.129.0.0/24"]
  }
}

resource "yandex_vpc_security_group" "out_sg" {
  name        = "Outer security group"
  description = "Description for security group"
  network_id  = yandex_vpc_network.network-1.id

  egress {
    protocol       = "ANY"
    description    = "any"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-http"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-https"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  }
  ingress {
    protocol       = "TCP"
    description    = "SSH"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
  ingress {
    protocol       = "TCP"
    description    = "Grafana"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 3000
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-elasticsearch"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 9200
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-elasticsearch2"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 9300
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-elasticsearch3"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 5601
  }
  ingress {
    protocol       = "TCP"
    description    = "ext-elasticsearch4"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 5044
  }
  ingress {
    protocol       = "ICMP"
    description    = "ICMP"
    v4_cidr_blocks = ["10.128.0.0/24", "10.129.0.0/24"]
  }
}

resource "yandex_vpc_security_group" "bastion_sg" {
  name        = "Bastion security group"
  description = "Description for security group"
  network_id  = yandex_vpc_network.network-1.id

  egress {
    protocol       = "ANY"
    description    = "any"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol       = "ANY"
    description    = "any"
    v4_cidr_blocks = ["10.128.0.0/24", "10.129.0.0/24"]
  }
  ingress {
    protocol       = "TCP"
    description    = "SSH"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
}