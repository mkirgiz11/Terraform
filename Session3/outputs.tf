# output "main_instance_public_ip1" {
#     value = aws_instance.web[0].public_ip   #first_label.second_label.attribute, Reference to resource
#     description = "This prints the public ip of the instance"
# }
# output "main_instance_public_ip2" {
#     value = aws_instance.web[1].public_ip   #first_label.second_label.attribute, Reference to resource
#     description = "This prints the public ip of the instance"
# }
# output "main_instance_public_ip3" {
#     value = aws_instance.web[2].public_ip   #first_label.second_label.attribute, Reference to resource
#     description = "This prints the public ip of the instance"
# }
output "main_instance_public_ip" {
    value = aws_instance.web[*].public_ip   #count.index
    description = "This prints the public ip of the instance"
}
#count = meta argument
# indices = plural of index(indexes)
# index = reference to the places where they occur
# 