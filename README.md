# ADF Automated Release

End to end deployment of ADF with logging.

# TECH

- Terraform
- ARM
- Datafactory
- Log Analytics
- Blob
- Azure Key Vault

# FLOW

A. ADF deploy using terraform
B. Workflows to auomate deployments:
- User makes changes to their privage branches
- Users must create a pull request to make the changes
- Github workflow(actions) build triggered every time a new commmit is made to master.  This generates an ARM template as an artifact (after validation).
  Replacing the manual publish step.
- The workflow is configured to create new release and deply the arm template each time a new build available.

Note:  this works best with github or Azure devops from testing this.

 # DIAGRAM
 

