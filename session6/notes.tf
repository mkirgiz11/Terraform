# ########### NOTES #############

# # old way - Count meta argument
# module "bucket" {
#     count = length(var.bucket_names)
#     source = "./publish_bucket"
#     name = element(var.bucket_names, count.index)
# }

# variable "bucket names" {
#     type = list 
#     default = ["bucket1, bucket2, bucket3"]
# }

# # For each meta argument
# module "bucket" {
#     for_each = var.bucket_names
#     source = "./publish_bucket"
#     name = each.key
# }

# variable "bucket names" {
#     type = list 
#     default = ["bucket1, bucket2, bucket3"]
# }

# Count - Meta Argument - Based on count value - Resources provisioning are identical
# For_each - Meta Argument - Based on set of input values - Resources change between the diff instances
# For - Expression - Based on set of input values - Transform a value
