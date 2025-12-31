## ZPM IS SET TO MY REGISTER MUST CHANGE
## THINGS TO DO

# pxw-dev
A set of tools for displaying, analysing and cross-referencing Objectscript code.

## Development 
Below are instructions to get pull the repo and install.

### Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

### Installation

Clone/git pull the repo into any local directory

```
gh repo clone pxw-paul/pxw-dev
```

Open the terminal in this directory and call the command to build and run InterSystems IRIS in container:
*Note: Users running containers on a Linux CLI, should use "docker compose" instead of "docker-compose"*
*See [Install the Compose plugin](https://docs.docker.com/compose/install/linux/)*

```
docker-compose up -d
```

## Getting Started

Open web browser for URL: 
```
http://localhost:52775/csp/irisapp/PXW.Tools.Index.cls
```

This is the home page of all the tools available on the web front end. 

![Home + Namespace Code](/docs/pics/home.png)

* Home -- show the main home page.
* (+) -- show the main home page in a new tab.
* Namespace -- click on this to change the namespace the tools are linked to.
* Code -- input a search pattern to find code. EG PXW*.CLS to find all classes for this set of tools.

### Home ( and + )
This shows a list of all the tools that are available to the web front end. 

Running the home page will cause the tools to start cross referencing all code on the system. To see it progress find the "Xref Build" tool and click the "Submit" button. The initial build will take a while. It is loading every program and analysing them to create the Xref database.

You do not have to wait while it does that, you can start to explore code but some of the features will not be available until the build has completed.

### Namespace
The tools could be installed in any namespace but it is designed so that you have a central tools server which can connect to any other Iris server and namespace using the Atelier services.

When first installed there will be only one namespace available. It has the internal name of "LOCAL_USER", and points to the "IRISAPP" namespace on the local host. 

The PXW tools Namespace concept and setup requires its own document.

### Code
In the Code prompt you can search for code. You can use wildcards to search. EG. Searching for PXW*.cls will find all code for this project.

Click on program name to display the program using one of the [code display tools](#code-display-tools).



## Summary of tools

Below is a short summary of each tool that has a link on the home page. The name is the name of the class that runs to display the tool.

There are two types of tools:
1. Tools that are likely to be called from the home page directly.
2. Tools that are used to display code and would be unlikely be called from the home page directly.

### Tools

#### Change Namespace
Use this tool to switch namespace to another.

#### Change Style
This tool is used to change the style of the pages. There are a couple of styles provided. 

#### Parser Test
A development tool for testing parsing of code.

#### SQL Show Plan

This is a new version of the SQL Show Plan in the System Management Portal.

Enter the SQL to be checked in the text area. Click Show Plan.

On the left hand side the SQL is formatted and displayed with any views it uses embedded directly into the SQL.

On the right hand side a formatted version of the SQL Query Plan is displayed. 

![Show Plan](/docs/pics/ShowPlan.png)


#### Settings
Displays the various settings controlling how code is fetched and displayed. The settings cannot be modified here, the data should be updated by an install program.

#### Xref Search
This tool is the user interface to the Cross Reference data. 

The cross reference data what makes this tool useful. It attempts to cross reference all properties if they are used in ObjectScript or SQL views, query methods or embedded sql. 

There are limitations, it is not 100% accurate. Some of these limitations are:
* In some SQL it struggles to work out the table a field belongs to, particularly if table aliases are not used.
* In ObjectScript it can be hard to work out exactly what class a property or method belongs to. For example where a method formal spec is not accurate, or where a #dim is not right. 
* Macros are another problem that are hard to deal with.

However the accuracy is enough to make this very useful. The class display tool will show some of this data within the class. The data can also be displayed in VSCode using a [CodeLens extension](https://github.com/pxw-paul/pxw-vscode-webpack).

#### Xref Build
This tool is used to request a build of the Xref data. Normally data is only built when a class has been changed since the last build. Use the Force option to force a build of the data.

The Xref data needs to be built often so that it keeps up to date. Loading the home page will kick off a build if there has not been a build today. It might be a good idea to schedule a build regularly on a system that is regularly being updated - eg hourly.

#### Xref Build Problems
During the Xref build every class is loaded, parsed and analysed. If there are any errors these will appear on this tool. There will be errors, the parser is not yet perfect and also there are some bits of code that are unusual (strange use of $$$Macros etc).

### Code Display Tools

#### Class
This is the main page for displaying class code. 

It has a few unique features when displaying code compared with tools such as VSCode and Studio.

![Class Code](/docs/pics/ClassDisplay.png)

The above shows:
* How many times the class has been referenced. This includes all properties and method calls etc.
* How many times the class has been extened.
* How many times the parameters have been overridden.
* How many times the parameters and properties have been used. This number includes the override count.

It will also show:
* If the parameter/property is an override of the superclass.

Embedded languages are also parsed and displayed so that there is a clear separation from the main language.

![Embedded Languages](/docs/pics/EmbeddedLanguage.png)

* SQL has a different background colour. 
* SQL code is analysed and you can click on fields to go directly to the definition.
* HTML is embedded with a different background colour.

Note - The formatting is carried over from the original text and wrapped in an HTML block, which means it is spaced out a bit strangely after the first line. This is something I will fix one day.


#### Include

This page display Include files (.INC). This will also display the number of times each macro is used.


#### Routine

This page displays .INT code.



