/**
 * Copyright 2018 Google LLC
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

provider "google" {
  version = "~> 2.0"
}

module "healthcare" {
  source = "../../"

  name = "example-dataset"
  project = var.project
  location = "us-central1"
  iam_members = [
    { role = "roles/healthcare.datasetAdmin", member = "group:example-dataset-admins@example.com" },
  ]
  dicom_stores = [
    {
      name = "example-dicom-a"
    },
    {
      name = "example-dicom-b"
      iam_members = [
          { role = "roles/healthcare.dicomEditor", member = "serviceAccount:example-dicom-b-uploader@example-project.gserviceaccount.com" },
      ]
    }
  ]
}
