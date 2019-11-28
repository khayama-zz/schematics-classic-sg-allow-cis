data "external" "cis_ipv4_cidrs" {
  program = ["bash", "get_cis_ipv4_cidrs.sh"]
}

data "external" "cis_ipv6_cidrs" {
  program = ["bash", "get_cis_ipv6_cidrs.sh"]
}

resource "ibm_security_group" "sg1" {
    name = "allow_cis_ips"
    description = "Allow all HTTP/HTTPS ingress traffic from IBM Cloud Internet Services"
}

resource "ibm_security_group_rule" "allow_ipv4_port_80" {
    count = "${length(data.external.cis_ipv4_cidrs.result)}"
    remote_ip = "${lookup(data.external.cis_ipv4_cidrs.result, count.index)}"
    direction = "ingress"
    ether_type = "IPv4"
    port_range_min = 80
    port_range_max = 80
    protocol = "tcp"
    security_group_id = "${ibm_security_group.sg1.id}"
}
