resource "layout" "single_panel" {
  column {
    panel {
      tab {
        target = resource.terminal.server
        title  = "server"
      }
      tab {
        target = resource.terminal.client
        title  = "client"
      }
      tab {
        target = resource.terminal.multihome
        title  = "multihome"
      }
    }
  }
}
