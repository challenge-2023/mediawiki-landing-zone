module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  #for_each                         = local.vpc_config
  #create_vpc                       = each.value.create_vpc
  name                              = join("-", [var.cust_id, "vpc"])
  cidr                             = var.cidr_block
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  #enable_dns_hostnames             = each.value.enable_dns_hostnames
  #enable_dns_support               = each.value.enable_dns_support
  #enable_dhcp_options              = each.value.enable_dhcp_options
  #dhcp_options_domain_name         = each.value.dhcp_options_domain_name
  #dhcp_options_domain_name_servers = each.value.dhcp_options_domain_name_servers
  #dhcp_optionset_name              = each.value.dhcp_optionset_name
  #instance_tenancy                 = each.value.instance_tenancy
  #vpc_tags                         = ["customer=var."]
  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    customer = var.cust_id
    Environment = "dev"
    "kubernetes.io/role/elb" = "1"
    ## Tag required for public subnet
  }
}
