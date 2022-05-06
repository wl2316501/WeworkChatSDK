variable "version" {
  default = ""
}

variable "repo" {
  default = "chinayin/weworkchat-sdk"
}

variable "registry" {
  default = "docker.io"
}

variable "repository" {
  default = "${registry}/${repo}"
}

function "platforms" {
  params = []
  result = ["linux/amd64"]
}

target "_all_platforms" {
  platforms = platforms()
}

group "default" {
  targets = ["jdk8"]
}

target "jdk8" {
  inherits = ["_all_platforms"]
  context  = "."
  tags     = [
    "${repository}:latest",
    "${repository}:${version}",
  ]
}
