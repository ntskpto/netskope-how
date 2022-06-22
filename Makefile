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
	terraform workspace select $$workspace \
	&& terraform apply
destroy: all
	@read -p "Enter Workspace Name: " workspace; \
	terraform workspace select $$workspace \
	&& terraform destroy -auto-approve -var 'student_instance_count=15'

apply_ubuntu:
	@read -p "Enter Workspace Name: " workspace; \
	terraform workspace select $$workspace \
	&& terraform apply -var ubuntu_publisher=true -var csw_publisher=false

	