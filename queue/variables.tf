variable "tags" {
  description = "Map of tags to apply to every resource"
  type        = map(string)
  default     = { "project" : "pulse-queue-demo" }
}

variable "allow_raw_messages" {
  description = "Set to true to allow raw (i.e. non-json) message dilivery"
  type        = bool
  default     = true
}