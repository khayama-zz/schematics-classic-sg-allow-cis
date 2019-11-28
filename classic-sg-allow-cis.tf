data "external" "cis_ips" {
  program = ["bash", "get_cis_ips.sh"]
}

output "cis_ipv4_cidrs" {
  value = "${ length( data.external.cis_ips.result ) }"
}

output "cis_ipv4_cidrs_2" {
  value = "${ lookup( data.external.cis_ips.result, 2 ) }"
}
