NAME
    template - A template project

WTF?
    You may use this project in order to build your own Debian package for
    your own project. This has been tested with Debian GNU/Linux Squeeze and
    Debian GNU/Linux Wheezy.

    Feel free to modify any aspects. This project is just an empty example
    template.

    Follow these steps:

  Install required packages
    Run the following:

        sudo aptitude install lintian devscripts dpkg-dev make perl

    Todo: Ensure this are the correct packages. In order to test that I
    would have to setup a blank Debian system.

  Compile the project
    Go to the to level directory and run

        make

    To test run

        ./bin/template

    It should print out the version number of the project.

  Create a Debian package
    Go to the to level directory and run

        make deb

    It will create the files like:

        ../template_0.0.0.0_all.deb
        ../template_0.0.0.0.dsc
        ../template_0.0.0.0_amd64.changes
        ../template_0.0.0.0.tar.gz

    It should create a debian package in ../. Check and install it, e.g:

        lintian --pedantic ../template_0.0.0.0_all.deb 
        sudo dpkg -i ../template_0.0.0.0_all.deb

    Run

        dpkg -L template

    to see whats in there. You can now run

        /usr/bin/template

    or for example

        man template

  Read the Makefile
    Read the Makefile in order to understand what's going on.

Customize
    Now, since you understood everything feel free to customize everything
    the way you want it. E.g.:

        Don't use POD for documentation but LaTeX

        Compile a C program

        Include a ./lib dir, add it to the 'install' Makefile rule

        etc etc.

    You should also consider the following:

  Manual page
    This template is using POD for creating manual pages. Edit
    ./docs/template.pod and run

        make documentation

    in order to build ./docs/template.1. The page will be included in the
    resulting debian package automatically. You can review the page with

        man ./docs/template.1

  Renaming template into your project name
    Rename all files which have *template* included into your own new
    package name. You can do that with:

        PROJECTNAME=yourproject
        find . -name \*template\* | 
        while read template; do git mv $template ${template/template/$PROJECTNAME}; done

    Search all content and rename *template* into your own new package name.
    You can do that with:

        grep -R template . | grep -v .git | 
        cut -d: -f1 | uniq | xargs sed -i "s/template/$PROJECTNAME/g"

  Updating ./debian
    Edit the following files accordingly to your new project (e.g. with
    vim):

        vim ./debian/{control,copyright,README}

  Update changelog
    Go to the to level directory and run

        dch -i

