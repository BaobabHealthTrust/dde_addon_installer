dde_addon_installer
===================
This is a tool that has been developed for use with DDE2 to modify existing
Rails 2.3.5 applications to be compatible with DDE2 which runs on rails 2.1.1.

Usage
=====
To use the application:

1. Make sure the machine has Ruby installed
2. Clone the application from github to an independent folder for use as a tool
3. Run the command:
  
      ./setup.rb {PATH} {install | uninstall}
      
      where
        { PATH }:       is the target Rails 2.3.5 application to link to DDE2;
        { install }:    is the option to choose when installing the additions;
        { uninstall }:  is the option for removing the changes that were effected 
                      and restore to original form. This step assumes all files 
                      created by the installer are not tampered with.
                      
Happy DDE2ing!
