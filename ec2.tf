resource "aws_instance" "Testing" {
    ami = "ami-05fa00d4c63e32376"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    key_name = "linuxnew"
    subnet_id = "subnet-060372cf8cd26124f"
    vpc_security_group_ids = ["sg-08faf759e7e05c47f"]
    associate_public_ip_address = true
    tags = {
        Name = "Testing"
    }
}

resource "aws_instance" "Jenkins_Master" {
    ami = "ami-05fa00d4c63e32376"
    availability_zone = "us-east-1a"
    instance_type = "t2.medium"
    key_name = "linuxnew"
    subnet_id = "subnet-060372cf8cd26124f"
    vpc_security_group_ids = ["sg-08faf759e7e05c47f"]
    associate_public_ip_address = true
    user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
    sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    sudo yum upgrade -y
    sudo amazon-linux-extras install java-openjdk11 -y
    sudo yum install jenkins -y
    sudo systemctl enable jenkins
    sudo systemctl start jenkins
    EOF
    tags = {
        Name = "Jenkins_Master"
    }
}

resource "aws_instance" "Jenkins_slave" {
    ami = "ami-05fa00d4c63e32376"
    availability_zone = "us-east-1a"
    instance_type = "t2.medium"
    key_name = "linuxnew"
    subnet_id = "subnet-060372cf8cd26124f"
    vpc_security_group_ids = ["sg-08faf759e7e05c47f"]
    associate_public_ip_address = true
    user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum upgrade -y
    sudo amazon-linux-extras install java-openjdk11 -y
    EOF
    tags = {
        Name = "Jenkins_slave"
    }
}

resource "aws_instance" "Ansible_tower" {
    ami = "ami-05fa00d4c63e32376"
    availability_zone = "us-east-1a"
    instance_type = "t2.medium"
    key_name = "linuxnew"
    subnet_id = "subnet-060372cf8cd26124f"
    vpc_security_group_ids = ["sg-08faf759e7e05c47f"]
    associate_public_ip_address = true
    tags = {
        Name = "Ansible_tower"
    }
}

resource "aws_instance" "k8_management" {
    ami = "ami-05fa00d4c63e32376"
    availability_zone = "us-east-1a"
    instance_type = "t2.medium"
    key_name = "linuxnew"
    subnet_id = "subnet-060372cf8cd26124f"
    vpc_security_group_ids = ["sg-08faf759e7e05c47f"]
    associate_public_ip_address = true	
    tags = {
        Name = "k8_management"
    }
}