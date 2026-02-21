module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.0.0"

  cluster_name    = "voting-app-cluster"
  cluster_version = "1.30"

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.private_subnets

  # Allows you to run kubectl commands from your local machine
  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    standard_node_group = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t3.small"] 
      capacity_type  = "ON_DEMAND"
    }
  }
}