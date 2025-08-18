/**
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "instance_id" {
  description = "an identifier for the resource"
  value       = google_workbench_instance.instance.id
}
output "proxy_uri" {
  description = "The proxy endpoint that is used to access the Jupyter notebook."
  value       = google_workbench_instance.instance.proxy_uri
}
output "creator" {
  description = "Email address of entity that sent original CreateInstance request."
  value       = google_workbench_instance.instance.creator
}
output "state" {
  description = "The state of this instance."
  value       = google_workbench_instance.instance.state
}
output "upgrade_history" {
  description = "The upgrade history of this instance."
  value       = google_workbench_instance.instance.upgrade_history
}
output "health_state" {
  description = "Instance health_state."
  value       = google_workbench_instance.instance.health_state
}
output "health_info" {
  description = "Additional information about instance health."
  value       = google_workbench_instance.instance.health_info
}
output "create_time" {
  description = "An RFC3339 timestamp in UTC time."
  value       = google_workbench_instance.instance.create_time
}
output "update_time" {
  description = "An RFC3339 timestamp in UTC time."
  value       = google_workbench_instance.instance.update_time
}