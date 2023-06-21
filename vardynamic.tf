variable "ebs_block_devices" {
  type = map(object({
    device_name           = string
    volume_type           = string
    volume_size           = number
    delete_on_termination = bool
  }))
  default = {
    "ebs-1" = {
      device_name           = "/dev/sdf"
      volume_type           = "gp2"
      volume_size           = 100
      delete_on_termination = true
    },
    "ebs-2" = {
      device_name           = "/dev/sdg"
      volume_type           = "gp2"
      volume_size           = 50
      delete_on_termination = false
    }
  }
}
