# Application Coordinator

This is learn project for applying coordinators approach in your iOS Apps. Help get rid of MVC (Massive)

## Original

Big thanks to Andrey Panov of his original coordinators project. 
https://github.com/AndreyPanov/ApplicationCoordinator

## Installation

1. Download current latest version from 'master' branch
2. Learn the structure of sample project. Try to create something for you, using this simple algorithm


## Guidelines for creating ApplicationCoordinator

First we start with Coordinator protocol. Declare at least one method - start()

Create base class [BaseCoordinator] for all coordinators which will inherited by. It should adopt Coordinators protocol.

Add two methods for storing and removing dependencies of another coordinators

Create application coordinator, that will be root coordinator. In this example it has tabbar as output (items and settings), also provide it with coordinators factory
	
For a tabbar configure several blocks, that will be fired on certain events. For example, didLoad event of tab selection event. Normally each block should receive flow object, e.g. navigation controller. You can create coordinator from any place you want
	
After that create factory protocols for coordinators and provide implementation at least for one children coordinator of base type [ItemCoordinator], and use it in application coordinator

Deal with the Router. It is neat class for push / present / pop / dismiss

2 protocols for each view controller

factory for controllers

output for each flow

factory for controllers

wrap it all out

Initialiaze application coordinator from AppDelegate. Prefer using lazy initialization

## Stack technologies

- ObjC 
- Architecture: MVC (with coordinators)

## Tests

Currently tests are not used.

## License

Example project for learning using coordinators.

