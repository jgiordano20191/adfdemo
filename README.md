# ADF Automated Release

End to end deployment of ADF with logging.

# Tech

- Terraform
- ARM
- Datafactory
- Log Analytics

# FLOW

- User makes changes to their privage branches
- Users must create a pull request to make the changes
- Github workflow(actions) build triggered every time a new commmit is made to master.  This generates an ARM template as an artifact (after validation).
  Replacing the manual publish step.
- The workflow is configured to create new release and deply the arm template each time a new build available.

 # Diagram
 

