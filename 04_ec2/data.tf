
data "aws_ami" "centos8"{    #When ever the ami_id changes we will get the latest id.
    owners = ["973714476881"]
    most_recent      = true

    filter {
        name   = "name"
        values = ["Centos-8-DevOps-Practice"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

#The security group id is stored in paramterstore and now we are fetching it using data store
data "aws_ssm_parameter" "mongodb_sg_id" { #resource name in parameter.tf file 
    name = "/${var.project_name}/${var.environment}/mongodb_sg_id"
}

data "aws_ssm_parameter" "database_subnet_ids" { 
    name = "/${var.project_name}/${var.environment}/database_subnet_ids"
}

