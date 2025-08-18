# terraform-google-lumi-workbench-instance
Terraform module for creating workbench instance for Lumi Team

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >=  5.10 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | >=  5.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >=  5.10 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | >=  5.10 |


## Resources

| Name | Type |
|------|------|
| [google_workbench_instance.instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workbench_instance) | resource |


## Modules
Terraform Google workbench instance module

This Repository is for Creating workbench instance in Lumi project(s)

## Usage

**Workbench instance creation with minimal values**

Create a file ("workbench-instance.tf"), Use the following Code to call this Module and pass the required inputs accordingly
```

module "workbench" {
  source = "./modules/workbench"

  instance_name = "a-notebook-tfe-test-1"
  machine_type  = "e2-medium"
  zone          = "us-central1-a"
  instance_owners = ["oscarpulido@oscarpulido.com"]
  service_accounts = {
    email = "<SA>"
  }
  network_interfaces = {
    subnet = "projects/<PROJECT>/regions/us-central1/subnetworks/<SUBNET>"
  }
  project_labels = var.labels
  project_id     = "<PROJECT>"

  boot_disk = {
    disk_size_gb    = 150
    disk_type       = "PD_STANDARD"
    disk_encryption = "CMEK"
    
  }
  tags = ["tag1", "tag2"]
  
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accelerator_configs"></a> [accelerator\_configs](#input\_accelerator\_configs) | The hardware accelerators used on this instance. | <pre>object({<br>    type       = optional(string)<br>    core_count = optional(number)<br>  })</pre> | `null` | no |
| <a name="input_additional_labels"></a> [additional\_labels](#input\_additional\_labels) | additional labels. | `map(string)` | `null` | no |
| <a name="input_boot_disk"></a> [boot\_disk](#input\_boot\_disk) | Definition of a custom Compute Engine virtual machine image for starting a workbench instance with the environment installed directly on the VM. | <pre>object({<br>    disk_size_gb    = optional(number)<br>    disk_type       = optional(string)<br>    disk_encryption = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_crypto_key"></a> [crypto\_key](#input\_crypto\_key) | Google Cloud KMS key name to encrypt this disk. | `string` | `null` | no |
| <a name="input_data_disks"></a> [data\_disks](#input\_data\_disks) | Data disks attached to the VM instance. Currently supports only one data disk. | <pre>object({<br>    disk_size_gb    = optional(number)<br>    disk_type       = optional(string)<br>    disk_encryption = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_disable_proxy_access"></a> [disable\_proxy\_access](#input\_disable\_proxy\_access) | If true, the workbench instance will not register with the proxy. | `bool` | `true` | no |
| <a name="input_disable_public_ip"></a> [disable\_public\_ip](#input\_disable\_public\_ip) | If true, no external IP will be assigned to this VM instance. | `bool` | `true` | no |
| <a name="input_enable_ip_forwarding"></a> [enable\_ip\_forwarding](#input\_enable\_ip\_forwarding) | Flag to enable ip forwarding or not, default false/off | `bool` | `false` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of this workbench instance. | `string` | n/a | yes |
| <a name="input_instance_owners"></a> [instance\_owners](#input\_instance\_owners) | The owner of this instance after creation | `list(string)` | n/a | yes |
| <a name="input_key_ring"></a> [key\_ring](#input\_key\_ring) | Google Cloud KMS keyring name to encrypt this disk. | `string` | `null` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The machine type of the VM instance. | `string` | n/a | yes |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Custom metadata to apply to this instance. | `map(string)` | `null` | no |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | The network interfaces for the VM. Supports only one interface. | <pre>object({<br>    network  = optional(number)<br>    subnet   = optional(string)<br>    nic_type = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | `string` | n/a | yes |
| <a name="input_project_labels"></a> [project\_labels](#input\_project\_labels) | Project labels with user-defined metadata to apply to this resource. | `map(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The name of the region for the kms key of the instance. | `string` | `null` | no |
| <a name="input_service_accounts"></a> [service\_accounts](#input\_service\_accounts) | The service account that serves as an identity for the VM instance. | <pre>object({<br>    email  = optional(string)<br>    scopes = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The Compute Engine tags to add to instance | `list(string)` | n/a | yes |
| <a name="input_vm_image"></a> [vm\_image](#input\_vm\_image) | Definition of a custom Compute Engine virtual machine image for starting a workbench instance with the environment installed directly on the VM. | <pre>object({<br>    project = optional(string)<br>    name    = optional(string)<br>    family  = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The name of the zone for the instance. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_create_time"></a> [create\_time](#output\_create\_time) | The time the instance was created. |
| <a name="output_egress_public_ip"></a> [egress\_public\_ip](#output\_egress\_public\_ip) | Public Egress IP |
| <a name="output_ingress_private_ip"></a> [ingress\_private\_ip](#output\_ingress\_private\_ip) | Private Ingress IP |
| <a name="output_ingress_public_ip"></a> [ingress\_public\_ip](#output\_ingress\_public\_ip) | Public Ingress IP |
| <a name="output_looker_id"></a> [looker\_id](#output\_looker\_id) | an identifier for the resource |
| <a name="output_looker_uri"></a> [looker\_uri](#output\_looker\_uri) | Looker instance URI which can be used to access the Looker Instance UI. |
| <a name="output_looker_version"></a> [looker\_version](#output\_looker\_version) | The Looker version that the instance is using. |
| <a name="output_update_time"></a> [update\_time](#output\_update\_time) | The time the instance was updated. |