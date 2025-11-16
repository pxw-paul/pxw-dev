## ZPM IS SET TO MY REGISTER MUST CHANGE

 
# pxw-dev
A set of tools for displaying, analysing and cross-referencing Objectscript code.

## Development 
Below are instructions to get pull the repo and install.

### Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

### Installation

Clone/git pull the repo into any local directory

```
$ gh repo clone pxw-paul/pxw-dev
```

Open the terminal in this directory and call the command to build and run InterSystems IRIS in container:
*Note: Users running containers on a Linux CLI, should use "docker compose" instead of "docker-compose"*
*See [Install the Compose plugin](https://docs.docker.com/compose/install/linux/)*

```
$ docker-compose up -d
```

To open IRIS Terminal do:

```
$ docker-compose exec iris iris session iris -U IRISAPP
IRISAPP>
```
## Getting Started

Link to 
```
http..
```

This is the home page of all the tools available on the web front end. 

* Home -- show the main home page.
* Namespace -- click on this to change the namespace the tools are linked to.
* (+) -- show the main home page in a new tab.
* Code -- input a search pattern to find code. EG PXW*.CLS to find all classes for this set of tools.

### Home
This shows a list of all the tools that are available to the web front end. 

Running the home page will cause the tools to start cross referencing all code on the system. To see it progress find the "Xref Build" tool and click the "Submit" button. The initial build will take a while. It is loading every program and analysing them to create the Xref database.

You do not have to wait while it does that you can start to explore code but some of the features will not be available until the build has completed.

### Namespace
The tools could be installed in any namespace but it is designed so that you have a central tools server which can connect to any other Iris server and namespace using the Atelier services.

### Code
In the Code prompt you can search for code. You can use wildcards to search. EG. Searching for PXW*.cls will find all code for this project.

Click on program name to display the program.

It has a few unique features when displaying code compared with tools such as VSCode and Studio:
* Embedded languages -- these are displayed slightly differently to the way an editor displays them, to make them stand out a little more.
* SQL -- all sql code is analysed and you can click on fields to go directly to the definition.
* Links to cross reference -- On each method or property is a link to see all references to it.
* Overrides -- Shows if the method is an override of a superclass method.

### Xref
As the code is analysed it is saved into a database: PXW_Xref.Data.




