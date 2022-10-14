# ADF Automated Release

End to end deployment of ADF with logging.

Put on hold, no cloud to finish poc; looks like they may have monday

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

NOTE:  working to get test cloud available so will retest once that is available
 # DIAGRAM
 Architecture diagram below

