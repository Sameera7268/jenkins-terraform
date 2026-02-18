module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.15.1"
 name = local.name  
  subnet_ids = module.vpc.private_subnets
  cluster_version = "1.29"
  enable_irsa = true
 


  vpc_id = module.vpc.vpc_id

  
 eks_managed_node_groups = {

    node_group = {
      instance_types =["t3.small"]  
      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }

}

