variable user_name {}

variable tenant_name {}

variable password {}

variable ssh_key_file {}

variable count {
	default = 3
}

variable auth_url {
	default = "https://auth.cloud.ovh.net/v2.0/"
}

variable region { default = "GRA3" }
variable net_public { default = "Ext-Net" }
variable net_priv { default = "VLAN" }
variable ssh_user_name { default = "ubuntu" }
variable pool { default = "public" }
variable image { default = "Ubuntu 14.04" }

variable flavor {
	# default = "sp-30-ssd"
	default = "s1-2"
}
