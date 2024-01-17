
resource "aws_ssm_parameter" "vpn_sg_id" {
  name  = "/${var.project_name}/${var.environment}/vpn_sg_id"
  type  = "String"
  value = module.vpn.sg_id
  #overwrite = var.overwrite
}

#To store the mongodb sg id and then we can fetch the id using data store

resource "aws_ssm_parameter" "mongodb_sg_id" {
  name  = "/${var.project_name}/${var.environment}/mongodb_sg_id"
  type  = "String"
  value = module.mongodb.sg_id
  #overwrite = var.overwrite
}