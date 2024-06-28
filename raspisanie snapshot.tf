resource "yandex_compute_snapshot_schedule" "netology" {
  name = "netology"

  schedule_policy {
    expression = "0 0 ? * *"
  }

  snapshot_count = 3

  snapshot_spec {
    description = "for diplom"  
  }

  disk_ids = ["epd664tdjjh5r3lo7pqr", "epd8k72os8f1gshfu4j0", "epda3ldu8on36l261mji", "epdicangmm0dlhurau40", "epdntakjiaoi619c6265", "fhmamisl3gn7ghpar7mn"]
}
