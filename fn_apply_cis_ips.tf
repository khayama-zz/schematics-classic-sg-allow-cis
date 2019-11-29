resource "ibm_function_action" "apply_cis_ips" {
  name = "apply_cis_ips"

  exec = {
    kind = "khayama/ibmcloud-cli"
    image = "${file("apply_cis_ips.sh")}"
  }
  
  user_defined_parameters = <<EOF
        [
    {
        "key":"IBMCLOUD_API_KEY",
        "value":""
    },
    {
        "key":"WORKSPACE_ID",
        "value":"khayama-classic-sg-allow-cis-b3c0d072-955c-4d"
    }
        ]
        EOF
}
