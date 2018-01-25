resource "openstack_compute_keypair_v2" "user_key" {
	name = "terraform-consul"
	public_key = "${file("${var.ssh_key_file}.pub")}"
}

resource "openstack_compute_instance_v2" "consul" {
	count = "${var.count}"
	name = "${format("consul-%02d", count.index + 1)}"
	image_name = "${var.image}"
	flavor_name = "${var.flavor}"
	key_pair = "${openstack_compute_keypair_v2.user_key.name}"
	network = [
		{ name = "${var.net_public}" },
		{ name = "${var.net_priv}" }
	]
	region = "${var.region}"

	provisioner "remote-exec" {
		script = "scripts/install_requirements.sh"
		connection { user = "ubuntu" }
	}
}

resource "openstack_compute_instance_v2" "consul-client" {
	name = "consul-client"
	image_name = "${var.image}"
	flavor_name = "${var.flavor}"
	key_pair = "${openstack_compute_keypair_v2.user_key.name}"
	network = [
		{ name = "${var.net_public}" },
		{ name = "${var.net_priv}" }
	]
	region = "${var.region}"

	provisioner "remote-exec" {
		script = "scripts/install_requirements.sh"
		connection { user = "ubuntu" }
	}
}
