resource "lab" "main" {
  title       = "Webhook Test Lab - Sync Test 5"
  description = "Outline the lab's learning objectives, topics, and prerequisites."

  layout = resource.layout.single_panel

  settings {
    theme = "modern-dark"

    timelimit {
      duration   = "120m"
      show_timer = true
    }

    idle {
      enabled      = true
      timeout      = "5m"
      show_warning = true
    }

    controls {
      show_stop = true
    }
  }
}
