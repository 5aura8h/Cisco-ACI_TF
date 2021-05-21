terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "0.6.0"
    }
  }
 
}

provider "aci" {
 username = "${var.user_name}"
 #private_key = "userabc.key"
# cert_name = "userabc.crt"
 password = "${var.user_pwd}"
 url = "${var.apic_url}"
 insecure = true

}

resource "aci_tenant" "tenant" {
 name = "${var.tenant_name}"
 description = "${var.tenant_description}"
}

resource "aci_vrf" "vrf" {
  tenant_dn = "${aci_tenant.tenant.id}"
   name = "${var.vrf_name}"
}

resource "aci_bridge_domain" "bd100" {
  tenant_dn = "${aci_tenant.tenant.id}"
  description = "${var.bd100_description}"
  name = "${var.bd100_name}"
  relation_fv_rs_ctx = "${aci_vrf.vrf.id}"

}

resource "aci_bridge_domain" "bd200" {
  tenant_dn = "${aci_tenant.tenant.id}"
  description = "${var.bd200_description}"
  name = "${var.bd200_name}"
  relation_fv_rs_ctx = "${aci_vrf.vrf.id}"
}
