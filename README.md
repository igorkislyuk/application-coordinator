# Application Coordinator

This is learn project for applying coordinators approach in your iOS Apps. Help get rid of MVC (Massive)

## Original

Big thanks to Andrey Panov of his original coordinators project. 
https://github.com/AndreyPanov/ApplicationCoordinator

## Installation

1. Download current latest version from 'master' branch
2. Learn the structure of sample project. Try to create something for you, using this simple algorithm

##unreleased

storyboards -> set things up (router, protocols)


2 ouputs - per controlers and per coordinator both in protocols

remember about view controller id

## TLDR

Here is short ideas that you should keep in mind, to create beautiful project.

- You should have at least one coordinator.


## Guidelines for creating ApplicationCoordinator

First we start with `Coordinator` protocol. Declare at least one method - `start`

Create base class `BaseCoordinator` for all coordinators which will inherited by. It should adopt `Coordinator` protocol.

Add two methods for storing and removing dependencies of another coordinators: `addDependency:` & `removeDependency:`

Create application coordinator, that will be root coordinator. In this example it has tabbar as output (items and settings), also provide it with coordinators factory
	
For a tabbar configure several blocks, that will be fired on certain events. For example, didLoad event of tab selection event. Normally each block should receive flow object, e.g. navigation controller.
	
After that create factory protocols for coordinators and provide implementation at least for one children coordinator `ItemCoordinator`, and use it in application coordinator

Deal with the `Router`. It is neat class for push / present / pop / dismiss

Create 2 protocols for each view controller, like `FlowControllerInput` & `FlowControllerOutput`

Than you should deal with the factory for controllers. Normally , you should create protocol for each factory implementation and depends on it. Keeping things simple, we adopt one factory implementation for all factory controllers protocols.

Than you should create output for each controller in the flow. E.g. `ItemListOutput` for `ItemListViewController`

After that you can freely initialiaze application coordinator from AppDelegate. Prefer using lazy initialization.

## Problem section

The one problem I faced it method call order. When we use pure xib-files, and create window manually, we faced with wrong order of methods: viewDidLoad of tabbar controller called earlier than simple start method in ApplicationCoordinator. So after switch to storyboard, problem simply gone. Otherwise, we can't call start method of root coordinator earlier, because we should init coordinator with init-ed controller. It's a bit sophisticated, I'm sorry, just maybe don't know some stuff...

## TODO

- write it here, what needs to be done.

## Stack technologies

- ObjC 
- Architecture: MVC (with coordinators)

## Tests

Currently tests are not used.

## License

Totally free. Example project for learning using coordinators.

