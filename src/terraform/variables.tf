variable "project_name" {
  default = "broadcast"
}

variable "handler_file_name" {
  default = "lambda_function_payload"
}

variable "function_code_output_path" {
  default = "../target/lambda_function_payload.zip"
}

variable "function_code_src_path" {
  default = "../backend/lambda_function_payload.js"
}

variable "frontend_src_path" {
  default = "../frontend"
}

variable "routes" {
  default = ["PUT /v1/items", "GET /v1/items"]
}

variable "domain_name" {
  default     = "rachelwoody.com"
  description = "Also doubles as the name of the bucket without the www. prefix."
}

variable "api_domain_name" {
  default = "api.rachelwoody.com"
}

variable "www_domain_name" {
  default = "www.rachelwoody.com"
}