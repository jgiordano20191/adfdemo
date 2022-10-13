# ADF Automated Release

End to end deployment of ADF with logging.

(in process, deploy done: 10/11/2022, 10/12/2022
 final: 10/13/2022)

# TECH

- Terraform
- ARM
- Datafactory
- Log Analytics
- Blob
- Azure Key Vault

# FLOW

A. ADF deploy using terraform


B. Workflows to automate deployments:
- ADF links different services, but artifacts created are in JSON and deployed in an ARM template
- User makes changes to their privage branches
- Users must create a pull request to make the changes
- Github workflow(actions) build triggered every time a new commmit is made to master.  This generates an ARM template as an artifact (after validation).
  Replacing the manual publish step.
- The workflow is configured to create new release and deply the arm template each time a new build available

Two Branches:

- adf-dev
- adf-prod


 # DIAGRAM
 

