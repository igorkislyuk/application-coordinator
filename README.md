# Application Coordinator

This is learn project for applying coordinators approach in your iOS Apps. Help get rid of MVC (Massive)

## Original

Big thanks to Andrey Panov of his original coordinators project. Check it out for Swift version
https://github.com/AndreyPanov/ApplicationCoordinator

## Installation

1. Download current latest version from 'master' branch
2. Learn the structure of sample project. 
3. Create something for you, using this simple instructions provided below

## Guidelines for creating ApplicationCoordinator

You should start with designing logic of your application, and get simple scratch for MVP (Minimal Valuable Product). Split your scratch into different flows. Than, create a storyboard (why not xibs? this problem described below in Problem Section) for each flow and prototype controllers there

[Optional] Here you should provide neat wrappers for extracting viewControllers from storyboard (e.g. `UIViewController + Storyboard`, do not forget to assign StoryboardID to each ViewController if you are using this wrapper), `Router` for sweet navigation, factories, both for controllers and coordinators. You can see this stuff below in project

After that, you start with `Coordinator` protocol. Declare at least one method - `start`
Create base class (e.g. `BaseCoordinator`) for all coordinators which will inherited by. It should adopt `Coordinator` protocol. Add two methods for storing and removing dependencies of another coordinators: `addDependency:` & `removeDependency:`

Create application coordinator, that will be root coordinator. In this example it has tabbar as output (e.g. `Items` and `Settings`). For tabbar configure several blocks, that will be fired on certain events. E.g. `didLoad` event of tab selection event. Normally each block should receive flow object, e.g. `UINavigationController`
	
Create factory protocols for coordinators and provide implementation (e.g. keeping things simple you can use only one implementation for all protocols) at least for one children coordinator `ItemCoordinator`, and use it in application coordinator. Than each coordinator should related on protocols with several blocks. E.g. often will be used simple `finishFlow` empty block as property

Create 2 protocols for each viewController, like `FlowControllerInput` & `FlowControllerOutput`. Output means what you return from controller, and input means what will be populated as input (keeping things simple you will use only outputs in this project). Than you should deal with the factory for controllers. Normally, you should create protocol for each factory implementation and depends on it

Coordinators should deal with viewControllers from their `start` method and configure it there

After that you can initialiaze (prefer using lazy initialization) application coordinator from AppDelegate. It should configure related coordinators.

That's all. Now you're familiar with Coordinators pattern

## Problem section

The one problem I faced it method call order. When we use pure xib-files, and create window manually, we faced with wrong order of methods: viewDidLoad of tabbar controller called earlier than simple start method in ApplicationCoordinator. So after switch to storyboard, problem simply gone. Otherwise, we can't call start method of root coordinator earlier, because we should init coordinator with init-ed controller. It's a bit sophisticated, I'm sorry, just maybe don't know some stuff...

This could be related to Lazy View loading from storyboards, instead of nib. If you know, what can cause problem, please contact me.

## TODO

- write it here, what needs to be done.

## Stack technologies

- ObjC 
- Architecture: MVC (with coordinators)

## Tests

Currently tests are not used.

## License

Totally free. Example project for learning using coordinators.

