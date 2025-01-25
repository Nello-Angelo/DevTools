resource "kubernetes_csi_driver" "csi_driver" {
  for_each = { for key in var.kubernetes_csi_driver : key.name => key }

  metadata {
    name          = each.value.name
    labels        = each.value.labels
    annotations   = each.value.annotations
    generate_name = each.value.generate_name
  }

  spec {
    attach_required        = each.value.attach_required
    pod_info_on_mount      = each.value.pod_info_on_mount
    volume_lifecycle_modes = each.value.volume_lifecycle_modes
  }
}
