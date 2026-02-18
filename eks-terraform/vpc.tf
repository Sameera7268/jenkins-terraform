module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"
  name = local.name
  cidr = local.cidr
  azs = local.azs
  public_subnets = local.public_subnets
  private_subnets=local.private_subnets
  enable_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support =  true

  
    public_subnet_tags ={
    "kubernetes.io/cluster/elb"=1
    }

    private_subnet_tags ={
         "kubernetes.io/cluster/internal-elb"=1
    }
  
}