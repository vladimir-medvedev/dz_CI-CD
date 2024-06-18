resource "yandex_alb_backend_group" "backend-netology" {
  name                     = "backend-netology"
  #session_affinity {
   # connection {
   #   source_ip = <режим_привязки_сессий_по_IP-адресу>
  #  }
 # }

  http_backend {
    name                   = "diplom-netology"
    weight                 = 1
    port                   = 80
    target_group_ids       = ["ds7hutdsveic7l6a84cf"]
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

