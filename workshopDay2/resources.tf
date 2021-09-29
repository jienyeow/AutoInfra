variable do_token {
    type = string
    sensitive = true
}

variable do_image {
    type = string
    default = "ubuntu-21-04-x64"
}

variable do_region {
    type = string
    default = "sgp1"
}

variable do_size {
    type = string
    default = "s-1vcpu-2gb"
}

data "digitalocean_ssh_key" "my_sshkey" {
  name = "jien-docker2"
}


resource digitalocean_droplet myserver {
    name = "myserver"
    region = var.do_region
    size = var.do_size
    image = var.do_image
    ssh_keys = [data.digitalocean_ssh_key.my_sshkey.id]
    monitoring = true
}

output "droplet_ip_address" {
  value = digitalocean_droplet.myserver.ipv4_address
}
