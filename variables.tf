variable "user_name" {
    type = string
    default = "admin"
}

variable "user_pwd" {
    type = string
    default = "C1sco12345"
}

variable "apic_url" {
    default = "https://10.106.236.61"

}
variable "tenant_name" {
    type = string
    default = "saukotha5"
}

variable "tenant_description" {
    type = string
    default = "using terraform"
}

variable "vrf_name" {
    type = string
    default = "vrf"
}

variable "bd100_name" {
    type = string
    default = "bd100"
}
variable "bd200_name" {
    type = string
    default = "bd200"
}
variable "bd200_description" {
    type = string
    default = "using terraform"
}
variable "bd100_description" {
    type = string
    default = "using terraform"
}
