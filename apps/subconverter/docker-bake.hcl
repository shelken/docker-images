target "docker-metadata-action" {}

variable "APP" {
  default = "subconverter"
}

variable "VERSION" {
  default = "v1.6.0"
}

variable "SOURCE" {
  default = "https://github.com/asdlokj1qpi233/subconverter"
}

group "default" {
  targets = ["image-local"]
}

target "image" {
  inherits = ["docker-metadata-action"]
  args = {
    VERSION = "${VERSION}"
  }
  labels = {
    "org.opencontainers.image.source" = "${SOURCE}"
  }
}

target "image-local" {
  inherits = ["image"]
  output = ["type=docker"]
  tags = ["${APP}:${VERSION}"]
}

target "image-all" {
  inherits = ["image"]
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]
}
