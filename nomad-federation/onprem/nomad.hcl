nomad_cluster "onprem" {
  version = "v0.11.0"

  nodes = 1 // default

  network {
    name = "network.onprem"
    ip_address = "10.5.0.100"
  }

  network {
    name = "network.wan"
    ip_address = "192.168.5.100"
  }

  volume {
      source = "./nomad_config/server.hcl"
      destination = "/etc/nomad.d/server.hcl"
  }

  volume {
      source = "./consul_config"
      destination = "/config"
  }

  image {
      name = "consul:1.7.2"
  }

  image {
      name = "nicholasjackson/fake-service:v0.9.0"
  }

  image {
      name = "nicholasjackson/consul-envoy:v1.7.2-v0.14.1"
  }
}