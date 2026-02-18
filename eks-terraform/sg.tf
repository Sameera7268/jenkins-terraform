resource "aws_security_group" "sg" {
    name = local.name
    vpc_id = module.vpc.vpc_id

}

resource "aws_security_group_rule" "sgr" {
        type = "ingress"
        from_port = 0
        to_port = 0
        protocol = "-1"
        security_group_id = aws_security_group.sg.id
        source_security_group_id = module.eks.cluster_primary_security_group_id
   
}

resource "aws_security_group_rule" "sgegress" {
        type = "egress"
        from_port = 0
        to_port = 0
        protocol = "-1"
        security_group_id = aws_security_group.sg.id
        cidr_blocks = ["0.0.0.0/0"]
   
}