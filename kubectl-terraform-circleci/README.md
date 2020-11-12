# kubectl-terraform-circleci
Used in our CircleCI pipelines for applying the Kubernetes manifests and generating our infrastructure using terraform.

## Changelog

### 0.9

The 0.9 tag includes Terraform 0.13, which has changed the way third-party provider plugins are [discovered and consumed](https://www.terraform.io/upgrade-guides/0-13.html#new-filesystem-layout-for-local-copies-of-providers). As such the explicit inclusion of the uptimerobot and pingdom plugins has been removed from this image.

Required plugins should be defined explicitly in the Terraform manifests they're used in. e.g

```
terraform {
  required_providers {
    uptimerobot = {
      source = "louy/uptimerobot"
      version = "0.5.1"
    }
  }
}
```
