provider "aws" {
  region     = "us-west-2"
 
}


resource "aws_instance" "myec2" {
   ami = "ami-0cea098ed2ac54925 "
   instance_type = "t2.micro"
   key_name = "mykeypair"

   connection {
   type     = "ssh"
   user     = "ec2-user"
   private_key = file("./mykeypair.pem")
   host     = self.public_ip
    }

 provisioner "remote-exec" {
   inline = [
     "sudo amazon-linux-extras install -y nginx1",
     "sudo systemctl start nginx"
   ]
 }
}
