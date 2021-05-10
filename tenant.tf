terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "0.5.4"
    }
  }
}


provider "aci" {

 username = ""
 password = ""
 url = ""

}

resource "aci_tenant" "tenant" {
 name = "saukotha"
 description = "Using Terraform"
}

resource "aci_vrf" "vrf" {
  tenant_dn = "${aci_tenant.tenant.id}"
  name = "vrf1"
}

resource "aci_bridge_domain" "bd" {
  tenant_dn = "${aci_tenant.tenant.id}"
  name = "bd1"
  description = "using terraform"
}

resource "aci_subnet" "subnet" {
  parent_dn = "${aci_bridge_domain.bd.id}"
  description = "using terraform"
  ip = "10.0.3.28/29"
  scope = ["shared"]

}
