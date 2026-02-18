module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"
  cluster_name = local.name  
  subnet_ids = module.vpc.private_subnets
  enable_irsa = true

  vpc_id = module.vpc.vpc_id

    eks_managed_node_group_defaults = {
        ami_type ="AL2_x86_64"
        instance_types = ["t3.medium"]
        vpc_security_group_ids =[aws_security_group.sg.id]

    }
 eks_managed_node_groups = {

    node_group = {
      min_size     = 2
      max_size     = 6
      desired_size = 2
    }
  }

}

