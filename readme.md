<h2> Netskope Cloud Security Workshop automation through Terraform Workspaces </h2>

  IAM credentials and environmental access will be provided by the DACH netskope team / Phil Rumi
  
These scripts contains custom AMIs
**1. Install Packet Managers**

  

```

MacOS - Install HomeBrew via /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Windows - https://chocolatey.org/install

```


**2. install packages:**

- awscli
- make
- terraform
  
**3. modify aws credentials file**
   
Create (or edit) the ~/.aws/credentials file and insert the following AWS profile

    [csw-profile]
    aws_access_key_id = <Access  Key>
    aws_secret_access_key = <Secret  Key>


**4. create a terraform.tfvars file with your aws credentials and put it in the working directory of the terraform scripts**

```
aws_access_key = "XXXX"
aws_secret_key = "XXXX"
aws_profile  = "csw-profile"
```

   
This terraform module creates Netskope Hands On Lab Environment with predefined custom student images that contain neccessary configuration parameters for the lab

terraform works with so called workspaces, so you can switch into individual "working environments". One can create multiple lab environments in different workingspaces at the same time.

Every workspace creates a DNS subzone of sselab.eu in the initials of the individual instructor

  
terraform.state will be saved on remote S3 buckets with versioning, encryption enabled in DynamoDB

  

**to start the environment**

  

    make apply

  

After running the command you will receive outputs of the created ressources containing the DNS names to access the ressources

**to destroy the environment**

  

    make destroy

  
**estimated infrastructure monthly cost* with 2 student PCs* 340 / 730 hours * 5 hours = **2,30 $ per Workshop**


**Public DNS access:**

- Publisher SSH: publisher.<workspace>.sselab.eu
- Master Instructor RDP: master.<workspace>.sselab.eu
- Guacamole HTTPS: guacamole.<workspace>.sselab.eu
- Student RDP: studentXX.<workspace>.sselab.eu


```
➜  terraform_workspaces_netskope_csw git:(main) ✗ infracost breakdown --path plan.json
Detected Terraform plan JSON file at plan.json
  ✔ Extracting only cost-related params from terraform
  ✔ Retrieving cloud prices to calculate costs

Project: PhilRumi/netskope-csw/plan.json

 Name                                                      Monthly Qty  Unit                  Monthly Cost

 aws_eip.guacamole_instance_eip
 └─ IP address (if unused)                                         730  hours                        $3.65

 aws_eip.master_instance_eip
 └─ IP address (if unused)                                         730  hours                        $3.65

 aws_eip.publisher_eip[0]
 └─ IP address (if unused)                                         730  hours                        $3.65

 aws_eip.student_eip[0]
 └─ IP address (if unused)                                         730  hours                        $3.65

 aws_eip.student_eip[1]
 └─ IP address (if unused)                                         730  hours                        $3.65

 aws_instance.guacamole_instance
 ├─ Instance usage (Linux/UNIX, on-demand, t3.large)               730  hours                       $70.08
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                            8  GB                           $0.95

 aws_instance.master_instance
 ├─ Instance usage (Linux/UNIX, on-demand, t3.large)               730  hours                       $70.08
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                            8  GB                           $0.95

 aws_instance.publisher_instance[0]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.small)               730  hours                       $17.52
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                            8  GB                           $0.95

 aws_instance.student_instance[0]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.large)               730  hours                       $70.08
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                            8  GB                           $0.95

 aws_instance.student_instance[1]
 ├─ Instance usage (Linux/UNIX, on-demand, t3.large)               730  hours                       $70.08
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                            8  GB                           $0.95

 aws_instance.webserver_instance
 ├─ Instance usage (Linux/UNIX, on-demand, t3.small)               730  hours                       $17.52
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                            8  GB                           $0.95

 aws_route53_record.aws_sub_zone_ns
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_record.guacamole_private_record
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_record.guacamole_public_record
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_record.master_private_record
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_record.master_public_record
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_record.publisher_private_records[0]
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_record.publisher_public_records[0]
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_record.student_private_records[0]
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_record.student_private_records[1]
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_record.student_public_records[0]
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_record.student_public_records[1]
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_record.webserver_private_record
 ├─ Standard queries (first 1B)                       Monthly cost depends on usage: $0.40 per 1M queries
 ├─ Latency based routing queries (first 1B)          Monthly cost depends on usage: $0.60 per 1M queries
 └─ Geo DNS queries (first 1B)                        Monthly cost depends on usage: $0.70 per 1M queries

 aws_route53_zone.aws_sub_zone
 └─ Hosted zone                                                      1  months                       $0.50

 aws_route53_zone.private_zone
 └─ Hosted zone                                                      1  months                       $0.50

 OVERALL TOTAL                                                                                     $340.32
──────────────────────────────────
37 cloud resources were detected:
```

