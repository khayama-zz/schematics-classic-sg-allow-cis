resource "ibm_function_action" "apply_cis_ips" {
  name = "apply_cis_ips"

  exec = {
    kind = "khayama/ibmcloud-cli"
    image = "${file("apply_cis_ips.sh")}"
  }
}
