resource "yandex_compute_snapshot_schedule" "netology" {
  name = "netology"

  schedule_policy {
    expression = "0 0 ? * *"
  }

  snapshot_count = 3

  snapshot_spec {
    description = "for diplom"  
  }

  disk_ids = [yandex_compute_instance.web-1.boot_disk.0.disk_id, yandex_compute_instance.web-2.boot_disk.0.disk_id, yandex_compute_instance.elasticsearch.boot_disk.0.disk_id, yandex_compute_instance.kibana.boot_disk.0.disk_id, yandex_compute_instance.zabbix.boot_disk.0.disk_id, yandex_compute_instance.bastion-host.boot_disk.0.disk_id]
}
