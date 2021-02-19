# Provision a compute instance in GCP
This Terraform configuration provisions a compute instance in Google Cloud Platform.

## Details
By default, this configuration provisions a compute instance from image debian-cloud/debian-8 with machine type n1-standard-1 in the us-east1-b zone of the us-east1 region. But the image, type, zone, and region can all be set with variables.

Note that you need to set provide your GCP credentials in the GOOGLE_CREDENTIALS environment variable.
