project_name = "terraform-2-tier"

region = "us-east-1"
 vpc_cidr = "10.0.0.0/10"
 #public  sub netgateway
 pub_sub_1a_cidr = "10.0.1.0/16"
 pub_sub_1b_cidr = "10.0.2.0/24"
 #publc server for web server
 pri_sub-pri_sub_3a_cidr = "10.0.3.0/24"
 pri_sub-pri_sub_4b_cidr = "10.0.4.0/24"
 #for datbase server
 pri_sub_5a_cidr = "10.0.5.0/24"
 pri_sub_6b_cidr = "10.0.6.0/24"

 db_username = "admin"
 db_password = "password"
 certificate_domain_name ="anydomainname"
 additional_domain_name = "anydomainame"
 