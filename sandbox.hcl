resource "network" "public" {
  subnet = "10.0.5.0/24"
}

resource "network" "private" {
  subnet = "10.0.6.0/24"
}

# Static IP on public network
resource "container" "server" {
  image {
    name = "alpine"
  }

  network {
    id         = resource.network.public.meta.id
    ip_address = "10.0.5.10"
  }
}

# Static IP on public, verifies cross-container connectivity
resource "container" "client" {
  image {
    name = "alpine"
  }

  network {
    id         = resource.network.public.meta.id
    ip_address = "10.0.5.20"
  }
}

# Dynamic IP, verifies IPAM allocation
resource "container" "dynamic" {
  image {
    name = "alpine"
  }

  network {
    id = resource.network.public.meta.id
  }
}

# Multi-homed: both networks, verifies multi-network attachment
resource "container" "multihome" {
  image {
    name = "alpine"
  }

  network {
    id         = resource.network.public.meta.id
    ip_address = "10.0.5.30"
  }

  network {
    id         = resource.network.private.meta.id
    ip_address = "10.0.6.30"
  }
}

resource "terminal" "server" {
  target = resource.container.server
  shell  = "/bin/sh"
}

resource "terminal" "client" {
  target = resource.container.client
  shell  = "/bin/sh"
}

resource "terminal" "multihome" {
  target = resource.container.multihome
  shell  = "/bin/sh"
}
