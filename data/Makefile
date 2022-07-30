MYVAR := $(shell cat workspaces.tf | awk '{for (i=1;i<=NF;i++) if ($$i == "name") {print $$3}}' workspaces.tf)
all:
	@echo "WORKSPACES AVAILABLE"
	@echo $(MYVAR)

apply: all
	@read -p "Enter Workspace Name: " workspace; \
	terraform init -backend-config="access_key={$TF_VAR_access_key}" -backend-config="secret_key=${TF_VAR_secret_key" -backend-config="region=${TF_VAR_aws_region}\
	&& terraform workspace select $$workspace \
	&& terraform apply  -var token=""
destroy: all
	@read -p "Enter Workspace Name: " workspace; \
	terraform workspace select $$workspace \
	&& terraform destroy -auto-approve -var student_instance_count=15   -var token=""

apply_ubuntu: all
	@read -p "Enter Workspace Name: " workspace; \
    terraform init -backend-config="access_key={$TF_VAR_access_key}" -backend-config="secret_key=${TF_VAR_secret_key" -backend-config="region=${TF_VAR_aws_region}\
	&& terraform workspace select $$workspace \
	&& terraform apply -var ubuntu_publisher=true -var csw_publisher=false 
