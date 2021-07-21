# Inventory Management Database System
This is an inventory management database backend for the tracking of unique, non-replenishable, items through the small-scale internet resale and market arbitrage process associated with small online businesses who have outgrown the functionality of spreadsheets.

## Table of Contents


## Project Description
The original contract was to create a product that filled a very large gap in the market of inventory management software. Most inventory management software available assumes either manufacturing supplies used to create inventory or that a company just restocks varibale amounts of the exact or very similar items. These softwares are not often easy to use by businesses that specialize in the sale or resale of individual unique inventory items (such as online resellers, pawn shops, consignment stores, upcyclers, and others).

The main method of getting around the lack of suitable software for these businesses is often to rely on spreadsheets or pen & paper systems. Both of these options have severe limitations for data-informed business management as well as making both insurance and tax reporting more difficult and less beneficial (example: many business insurance providers want to know the total estimated sale value of all current inventory for coverage adjustments, and there are some potential IRS advantages for being able to leverage corporation-style asset tracking even as a sole-proprietership).

This project is a generalization of the database I designed for that customer during my freelance work mostly in 2019-2021.

The original database was built in SQLite to operate on a single device with the vast majority of data input, output, user, and database controls handled through a GAMBAS interface (GAMBAS the programming language, not the food) in a purely Linux environment.

This redo for my portfolio forgoes the vast proprietary interface and seeks to translate a generalization of the database structure to SQL Server in order to highlight my abilities to develop a database from scratch for population by a client company.

When complete, this project will also include a companion database dictionary.

### Project Completion Needs
- [ ] Adjust the identity on some tables to account for not null but awaiting input statuses in foreign key references like the original project did
- [ ] Add code to initialize any necessary information in tables
- [ ] Build the database dictionary
- [ ] Set up a sample dataset to show how it works
- [ ] Fill out Installation section of readme
- [ ] Fill out Instructions section of readme
- [ ] Fill out License section of readme
- [ ] Fill out Test Cases & Examples section of readme
- [ ] Fill out Table of Contents section of readme (if file is too long, else delete that section)
- [x] Push project to GitHub (requires setting up new GitHub repository)
- [ ] Attach project to portfolio page

### Future Plans
These would need to be parsed into actual achieveable goal-steps before starting them.
- [ ] Setup database creation and initialization code so that databse can be named whatever the user wants
- [ ] Get permission from previous client to add in the views and process control tables that really allow this database to work as intended
- [ ] Redo the old-project interface to work with this database (preferably in a less OS-dependent language)
- [ ] Setup connection allowances for supply management system, accounting system, physical asset and equipment management system, and various reporting tools
- [ ] Add in allowances for also tracking traditional-type inventory as well


### Technology Used & Why
* MS SQL Server
* MS SQL Server Management Studio (Transact-SQL only, no point & click allowed)

SQL Server was chosen for this project due to its breadth of use in industry.


## Installation (how to get it)


## Instructions (how to use it)


## Credits
* Project Originator: Gerald L. Mitchell [Link to GitHub Portfolio](https://github.com/gmitchell1982)

## License
Currently, all rights are reserved by Gerald L. Mitchell. If I can get proper permissions to move forward from previous clients, the license may change in the future.

## How To Contribute
As a portfolio piece, this project has no current need for contribution.

## Test Cases & Examples

