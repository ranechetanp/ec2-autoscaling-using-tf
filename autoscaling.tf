resource "aws_launch_template" "e2-instance" {
  name_prefix   = "e2-instance"
  image_id      = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"
  vpc_security_group_ids =    [aws_security_group.demo.id]
}

resource "aws_autoscaling_group" "dev-autoscaling" {
#  availability_zones = ["us-east-1"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  vpc_zone_identifier       = [aws_subnet.public.id]
  
  launch_template {
    id      = aws_launch_template.e2-instance.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
  
}
