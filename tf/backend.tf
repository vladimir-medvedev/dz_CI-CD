resource "yandex_alb_backend_group" "backend-netology" {
  name                     = "backend-netology"
  

  http_backend {
    name                   = "diplom-netology"
    weight                 = 1
    port                   = 80
    target_group_ids       = [yandex_alb_target_group.netology.id]
    load_balancing_config {
      panic_threshold      = 90
    }    
    healthcheck {
      timeout              = "10s"
      interval             = "2s"
      healthy_threshold    = 10
      unhealthy_threshold  = 15 
      http_healthcheck {
        path               = "/"
      }
    }
  }
}

