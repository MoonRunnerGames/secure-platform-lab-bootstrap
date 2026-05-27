# secure-platform-lab-bootstrap
Bootstrap for creating the storage account that will hold the state files for all envs.

## Bootstrap vs Infra
The bootstrap layer creates the foundational Azure resources required before the Terraform pipeline can run. This includes resource groups, the remote state storage account, managed identity, federated identity credentials, and RBAC assignments.

The infra layer uses the bootstrap-created backend and deploys normal application/platform resources through GitHub Actions using workload identity federation.

This separation avoids circular dependencies where Terraform would need a state backend before it can create the backend itself.