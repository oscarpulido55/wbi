# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
locals {
  region_split = split("-", var.zone)
  region       = var.region == null ? ("${local.region_split[0]}-${local.region_split[1]}") : var.region
  metadata = { "notebook-disable-root" = "false",
    "notebook-disable-downloads" = "false",
    "notebook-disable-terminal"  = "false"
  }
}
resource "google_workbench_instance" "instance" {
  name                 = var.instance_name
  location             = var.zone
  instance_owners      = var.instance_owners
  disable_proxy_access = var.disable_proxy_access
  project              = var.project_id
  timeouts {
    create = "1h30m"
    update = "2h"
    delete = "20m"
  }
  #disk_encryption = "CMEK"
  #kms_key = "projects/test-perms-prj/locations/us-central1/keyRings/test1/cryptoKeys/test1/cryptoKeyVersions/1"
  gce_setup {
    machine_type         = var.machine_type
    disable_public_ip    = var.disable_public_ip
    tags                 = var.tags
    metadata             = merge(local.metadata, var.metadata)
    enable_ip_forwarding = var.enable_ip_forwarding
    dynamic "accelerator_configs" {
      for_each = var.accelerator_configs[*]
      content {
        type       = accelerator_configs.value.type
        core_count = accelerator_configs.value.core_count
      }
    }
    dynamic "service_accounts" {
      for_each = var.service_accounts[*]
      content {
        email  = service_accounts.value.email
        scopes = service_accounts.value.scopes
      }
    }
    dynamic "vm_image" {
      for_each = var.vm_image[*]
      content {
        project = vm_image.value.project
        name    = vm_image.value.name
        family  = vm_image.value.family
      }
    }
    dynamic "boot_disk" {
      for_each = var.boot_disk[*]
      content {
        disk_size_gb    = boot_disk.value.disk_size_gb
        disk_type       = boot_disk.value.disk_type
        disk_encryption = boot_disk.value.disk_encryption
      }
    }

#      container_image {
#        repository = "gcr.io/<PROJECT>/test-notebook"
#        tag        = "latest"
#      }

    dynamic "data_disks" {
      for_each = var.data_disks[*]
      content {
        disk_size_gb    = data_disks.value.disk_size_gb
        disk_type       = data_disks.value.disk_type
        disk_encryption = data_disks.value.disk_encryption
      }
    }
    dynamic "network_interfaces" {
      for_each = var.network_interfaces[*]
      content {
        network  = network_interfaces.value.network
        subnet   = network_interfaces.value.subnet
        nic_type = network_interfaces.value.nic_type
      }
    }
  }
}