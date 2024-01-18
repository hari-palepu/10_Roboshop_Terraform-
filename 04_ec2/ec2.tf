
#Creating mongodb instance 
module "mongodb" {
  source                 = "terraform-aws-modules/ec2-instance/aws"  #open source module from internet
  ami                    = data.aws_ami.centos8.id
  name                   = "${local.ec2_name}-mongodb"
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.mongodb_sg_id.value]
  subnet_id              = local.database_subnet_id

  tags = merge(
    var.common_tags,
    {
        component        = "mongodb"
    },
    {
        Name             = "${local.ec2_name}-mongodb"
    }
  )
}

module "redis" {
  source  = "terraform-aws-modules/ec2-instance/aws"  #open source module from internet
  ami = data.aws_ami.centos8.id
  name = "${local.ec2_name}-redis"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.redis_sg_id.value]
  subnet_id              = local.database_subnet_id

  tags = merge(
    var.common_tags,
    {
        component = "redis"
    },
    {
        Name = "${local.ec2_name}-redis"
    }
  )
}

module "mysql" {
  source                 = "terraform-aws-modules/ec2-instance/aws"  
  ami                    = data.aws_ami.centos8.id
  name                   = "${local.ec2_name}-mysql"
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.mysql_sg_id.value]
  subnet_id              = local.database_subnet_id

  tags = merge(
    var.common_tags,
    {
        component = "mysql"
    },
    {
        Name      = "${local.ec2_name}-mysql"
    }
  )
}

module "rabbitmq" {
  source                 = "terraform-aws-modules/ec2-instance/aws"  
  ami                    = data.aws_ami.centos8.id
  name                   = "${local.ec2_name}-rabbitmq"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.rabbitmq_sg_id.value]
  subnet_id              = local.database_subnet_id

  tags = merge(
    var.common_tags,
    {
        component = "rabbitmq"
    },
    {
        Name      = "${local.ec2_name}-rabbitmq"
    }
  )
}

module "catalogue" {
  source                 = "terraform-aws-modules/ec2-instance/aws"  
  ami                    = data.aws_ami.centos8.id
  name                   = "${local.ec2_name}-catalogue"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.catalogue_sg_id.value]
  subnet_id              = local.private_subnet_id

  tags = merge(
    var.common_tags,
    {
        component = "catalogue"
    },
    {
        Name      = "${local.ec2_name}-catalogue"
    }
  )
}

module "user" {
  source                 = "terraform-aws-modules/ec2-instance/aws"  
  ami                    = data.aws_ami.centos8.id
  name                   = "${local.ec2_name}-user"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.user_sg_id.value]
  subnet_id              = local.private_subnet_id

  tags = merge(
    var.common_tags,
    {
        component = "user"
    },
    {
        Name      = "${local.ec2_name}-user"
    }
  )
}

module "cart" {
  source                 = "terraform-aws-modules/ec2-instance/aws"  
  ami                    = data.aws_ami.centos8.id
  name                   = "${local.ec2_name}-cart"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.cart_sg_id.value]
  subnet_id              = local.private_subnet_id

  tags = merge(
    var.common_tags,
    {
        component = "cart"
    },
    {
        Name      = "${local.ec2_name}-cart"
    }
  )
}


module "payment" {
  source                 = "terraform-aws-modules/ec2-instance/aws"  
  ami                    = data.aws_ami.centos8.id
  name                   = "${local.ec2_name}-payment"
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.payment_sg_id.value]
  subnet_id              = local.private_subnet_id

  tags = merge(
    var.common_tags,
    {
        component = "payment"
    },
    {
        Name      = "${local.ec2_name}-payment"
    }
  )
}

module "shipping" {
  source                 = "terraform-aws-modules/ec2-instance/aws"  
  ami                    = data.aws_ami.centos8.id
  name                   = "${local.ec2_name}-shipping"
  instance_type          = "t3.small"
  vpc_security_group_ids = [data.aws_ssm_parameter.shipping_sg_id.value]
  subnet_id              = local.private_subnet_id

  tags = merge(
    var.common_tags,
    {
        component = "shipping"
    },
    {
        Name      = "${local.ec2_name}-shipping"
    }
  )
}

module "web" {
  source                 = "terraform-aws-modules/ec2-instance/aws"  
  ami                    = data.aws_ami.centos8.id
  name                   = "${local.ec2_name}-web"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.web_sg_id.value]
  subnet_id              = local.public_subnet_id

  tags = merge(
    var.common_tags,
    {
        component = "web"
    },
    {
        Name      = "${local.ec2_name}-web"
    }
  )
}