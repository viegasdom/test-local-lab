resource "layout" "single_panel" {
  column {
    instructions {
    }
  }

  column {
    tab "server" {
      target = resource.terminal.server
      active = true
    }
    tab "client" {
      target = resource.terminal.client
    }
    tab "multihome" {
      target = resource.terminal.multihome
    }
    tab "dynamic" {
      target = resource.terminal.dynamic
    }
    tab "isolated" {
      target = resource.terminal.isolated
    }
    tab "private_only" {
      target = resource.terminal.private_only
    }
  }
}
