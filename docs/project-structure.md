## Project Structure

### Basic Structure
* terraform
* envs
  * _share
    * main.tf
    * outputs.tf
    * variables.tf
    * versions.tf
  * main
    * (symlink to _share/*.tf)
    * main.custom.tf
    * terraform.tfvars
  * (other-env)
    * …
  * modules
    * azure
      * netwowrk
      * webapps
      * …
* (docker)
  * …
* (ansible)
  * …
* doc
  * (documents)
* README.md
* .alexrc.yml
* .gitignore
* .vscode/settings.json
* …