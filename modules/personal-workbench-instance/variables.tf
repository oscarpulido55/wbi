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

variable "instance_name" {
  description = "The name of this workbench instance."
  type        = string
}
variable "zone" {
  description = "The name of the zone for the instance."
  type        = string
}
variable "region" {
  description = "The name of the region for the kms key of the instance."
  type        = string
  default     = null
}
variable "instance_owners" {
  description = "The owner of this instance after creation"
  type        = list(string)
}
variable "disable_proxy_access" {
  description = "If true, the workbench instance will not register with the proxy."
  type        = bool
  default     = false
}
variable "machine_type" {
  description = "The machine type of the VM instance."
  type        = string
}
variable "additional_labels" {
  description = "additional labels."
  type        = map(string)
  default     = null
}
variable "disable_public_ip" {
  description = "If true, no external IP will be assigned to this VM instance."
  type        = bool
  default     = true
}
variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}
variable "tags" {
  description = "The Compute Engine tags to add to instance"
  type        = list(string)
}
variable "metadata" {
  description = "Custom metadata to apply to this instance."
  type        = map(string)
  default     = null
}
variable "enable_ip_forwarding" {
  description = "Flag to enable ip forwarding or not, default false/off"
  type        = bool
  default     = false
}
variable "accelerator_configs" {
  description = "The hardware accelerators used on this instance."
  type = object({
    type       = optional(string)
    core_count = optional(number)
  })
  default = null
}
variable "service_accounts" {
  description = "The service account that serves as an identity for the VM instance."
  type = object({
    email  = optional(string)
    scopes = optional(list(string))
  })
  default = null
}
variable "vm_image" {
  description = "Definition of a custom Compute Engine virtual machine image for starting a workbench instance with the environment installed directly on the VM."
  type = object({
    project = optional(string)
    name    = optional(string)
    family  = optional(string)
  })
  default = null
}
variable "boot_disk" {
  description = "Definition of a custom Compute Engine virtual machine image for starting a workbench instance with the environment installed directly on the VM."
  type = object({
    disk_size_gb    = optional(number)
    disk_type       = optional(string)
    disk_encryption = optional(string)
  })
  default = null
}
variable "data_disks" {
  description = "Data disks attached to the VM instance. Currently supports only one data disk."
  type = object({
    disk_size_gb    = optional(number)
    disk_type       = optional(string)
    disk_encryption = optional(string)
  })
  default = null
}
variable "network_interfaces" {
  description = "The network interfaces for the VM. Supports only one interface."
  type = object({
    network  = optional(number)
    subnet   = optional(string)
    nic_type = optional(string)
  })
  default = null
}