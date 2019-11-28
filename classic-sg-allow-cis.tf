data "http" "cis_ips" {
  url = "https://api.cis.cloud.ibm.com/v1/ips"

  # Optional request headers
  request_headers {
    "Accept" = "application/json"
  }
}

output "cis_ips_key" {
  value = "${jsondecode(data.http.cis_ips.body)["result"]}"
}
