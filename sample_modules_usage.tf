module "workbench" {
  source = "CHANGEME"

  instance_name = "a-notebook-tfe-test-17"
  machine_type  = "e2-medium"
  zone          = "us-central1-a"
  instance_owners = ["admin@oscarpulido.altostrat.com"]


  #vm_image = {
  #  project = "<PROJECT>"
  #  name = "custom-workbench-instance-image"
  #}
  network_interfaces = {
    subnet = "projects/<PROJECT>/regions/us-central1/subnetworks/default"
  }

  project_id     = "<PROJECT>"
  metadata = {
    "disable-mixer" =  "false"
    #"post-startup-script" = "gs://sample_transactions_sales/inits.sh"
    #"post-startup-script-behavior"= "run_every_start"
  }
  boot_disk = {
    disk_size_gb    = 150
    disk_type       = "PD_STANDARD"
  }
  data_disks = {
    disk_size_gb    = 80
    disk_type       = "PD_STANDARD"
  }
  tags = ["tag1", "tag2"]
}