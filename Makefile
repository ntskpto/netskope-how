all:
	@echo "WORKSPACES AVAILABLE:"
	@echo "marcus"
	@echo "phil"
	@echo "rainer"
	@echo "eugen"
	@echo "georg"
	@echo "patrick"

apply: all
	@read -p "Enter Workspace Name: " workspace; \
	terraform init \
	&& terraform workspace select $$workspace \
	&& terraform apply -var-file="terraform.tfvars" -var token=""
destroy: all
	@read -p "Enter Workspace Name: " workspace; \
	terraform workspace select $$workspace \
	&& terraform destroy -auto-approve -var student_instance_count=15 -var-file="terraform.tfvars"

apply_ubuntu: all
	@read -p "Enter Workspace Name: " workspace; \
	terraform init \
	&& terraform workspace select $$workspace \
	&& terraform apply -var ubuntu_publisher=true -var csw_publisher=false -var-file="terraform.tfvars" -var token=""
