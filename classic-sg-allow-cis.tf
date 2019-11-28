data "external" "cis_ipv4_cidrs" {
  program = ["bash", "get_cis_ipv4_cidrs.sh"]
}

data "external" "cis_ipv6_cidrs" {
  program = ["bash", "get_cis_ipv6_cidrs.sh"]
}

output "test1" {
  value = "${ length( data.external.cis_ipv4_cidrs.result ) }"
}

output "test2" {
  value = "${ lookup( data.external.cis_ipv4_cidrs.result, 2 ) }"
}

output "test3" {
  value = "${ length( data.external.cis_ipv6_cidrs.result ) }"
}

output "test4" {
  value = "${ lookup( data.external.cis_ipv6_cidrs.result, 2 ) }"
}
