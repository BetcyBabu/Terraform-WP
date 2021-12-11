# Terraform-Wordpress

Here I am creating a WordPress website with a database on a private subnet. This will create a bastion server with public access on port 22, a web server with SSH access from Bastion, public HTTP / HTTPS access, and a database server with MySQL access from the web server, SSH access from Bastion.

The database server will have a pre-installed MySQL server, create a database, and the database user for WordPress.
The web server will be preinstalled with WordPress and wp-config.php will automatically fill db name, username, and db host (MYSQL Server Private IP Address).




