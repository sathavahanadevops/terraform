resource "aws_instance" "Docker_Host" {
  ami                         = "ami-05fa00d4c63e32376"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.medium"
  key_name                    = "linuxnew"
  subnet_id                   = "subnet-060372cf8cd26124f"
  vpc_security_group_ids      = ["sg-08faf759e7e05c47f"]
  associate_public_ip_address = true
  user_data                   = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install git -y
    sudo yum install docker -y
    sudo usermod -a -G docker ec2-user
    sudo yum install python3-pip
    sudo systemctl enable docker.service
    sudo systemctl start docker.service
    EOF
  tags = {
    Name = "Docker_Host"
  }
}

resource "aws_instance" "Jenkins_Master" {
  ami                         = "ami-05fa00d4c63e32376"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.medium"
  key_name                    = "linuxnew"
  subnet_id                   = "subnet-060372cf8cd26124f"
  vpc_security_group_ids      = ["sg-08faf759e7e05c47f"]
  associate_public_ip_address = true
  user_data                   = <<-EOF
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
ami                         = "ami-05fa00d4c63e32376"
availability_zone           = "us-east-1a"
instance_type               = "t2.medium"
key_name                    = "linuxnew"
subnet_id                   = "subnet-060372cf8cd26124f"
vpc_security_group_ids      = ["sg-08faf759e7e05c47f"]
associate_public_ip_address = true
user_data                   = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum upgrade -y
sudo amazon-linux-extras install java-openjdk11 -
sudo yum install libnsl.so.1 -y
sudo yum install libaio.i686 -y
sudo yum install libaio1 libaio-dev -y
sudo yum install libaio -y
sudo yum install libnsl.so.1*64* -y
sudo yum list libaio -y
sudo yum update -y 
sudo yum install xorg-x11-xauth xterm -y
sudo yum install xorg-x11-utils -y
sudo yum install xeyes -y
sudo yum install glibc-devel -y
sudo yum install libnsl -y
sudo yum install bc -y
sudo yum install binutils -y
sudo yum install elfutils-libelf -y
sudo yum install elfutils-libelf-devel -y
sudo yum install fontconfig-devel -y
sudo yum install glibc -y
sudo yum install glibc-devel -y
sudo yum install ksh -y
sudo yum install libaio -y
sudo yum install libaio-devel -y
sudo yum install libXrender -y
sudo yum install libX11 -y
sudo yum install libXau -y
sudo yum install libXi -y
sudo yum install libXtst -y
sudo yum install libgcc -y
sudo yum install libnsl -y
sudo yum install librdmacm -y
sudo yum install libstdc++ -y
sudo yum install ++-devel -y
sudo yum install libxcb -y
sudo yum install libibverbs -y
sudo yum install make -y
sudo yum install policycoreutils -y
sudo yum install policycoreutils-python-utils -y
sudo yum install smartmontools -y
sudo yum install sysstat -y
sudo yum install git -y
sudo yum install docker -y
sudo usermod -a -G docker ec2-user
sudo yum install python3-pip
sudo systemctl enable docker.service
sudo systemctl start docker.service
EOF
  tags = {
    Name = "Jenkins_slave"
  }
}

resource "aws_instance" "Ansible_tower" {
  ami                         = "ami-05fa00d4c63e32376"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.medium"
  key_name                    = "linuxnew"
  subnet_id                   = "subnet-060372cf8cd26124f"
  vpc_security_group_ids      = ["sg-08faf759e7e05c47f"]
  associate_public_ip_address = true
  tags = {
    Name = "Ansible_tower"
  }
}

resource "aws_instance" "k8_management" {
  ami                         = "ami-05fa00d4c63e32376"
  availability_zone           = "us-east-1a"
  instance_type               = "t2.medium"
  key_name                    = "linuxnew"
  subnet_id                   = "subnet-060372cf8cd26124f"
  vpc_security_group_ids      = ["sg-08faf759e7e05c47f"]
  associate_public_ip_address = true
  tags = {
    Name = "k8_management"
  }
}
