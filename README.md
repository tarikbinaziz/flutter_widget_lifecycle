# flutter_lifecycle

A new Flutter project.

## Getting Started

1. Main Entry Point: MyApp
Purpose: The main function is the entry point of the Flutter application. It initializes the app by calling runApp, which takes a widget (in this case, MyApp) and makes it the root of the widget tree.

# statefull widget
1. Constructor:
Parameters: It takes initialCount as a required parameter.
Key: Key? key allows Flutter to identify this widget in the widget tree for efficient updates.
super(key: key): Calls the superclass constructor with the key, which is important for widget identification.

2. createState Method: This method returns an instance of _MyCounterWidgetState, which contains the mutable state for this widget.When the Framework is instructed to build a StatefulWidget, it immediately calls createState()

3. mounted is true: When createState creates your state class, a buildContext is assigned to that state. buildContext is the place in the widget tree in which this widget is placed. All widgets have a bool this.mounted property. It is turned true when the buildContext is assigned. It is an error to call setState when a widget is unmounted.

4. initState(): This is the first method called when the widget is created (after the class constructor, of course.) initState is called once and only once. It must call super.initState().

5. didChangeDependencies(): This method is called immediately after initState on the first time the widget is built.
6. build(): This method is called often. It is required, and it must return a Widget.
7. didUpdateWidget(Widget oldWidget): If the parent widget changes and has to rebuild this widget (because it needs to give it different data), but it's being rebuilt with the same runtimeType, then this method is called. This is because Flutter is re-using the state, which is long-lived. In this case, you may want to initialize some data again, as you would in initState.
8. setState(): This method is called often from the framework itself and from the developer. It's used to notify the framework that data has changed.
9. deactivate(): deactivate() is called when the State object is removed from the tree, but it might be reinserted before the current frame change is finished. This method exists because State objects can be moved from one point in a tree to another.
10. dispose(): dispose() is called when the State object is removed, which is permanent. This method is where you should unsubscribe and cancel all animations, streams, etc.
11. mounted is false: The state object can never remount, and an error will be thrown if setState is called.


# Summary of Lifecycle
Initialization (initState): Set up initial values.
Dependency Changes (didChangeDependencies): Respond to changes in dependencies.
Configuration Updates (didUpdateWidget): Handle updates based on parent changes.
UI Building (build): Render the UI based on the current state.
Temporary Removal (deactivate): Handle tasks when the widget is removed temporarily.
Permanent Removal (dispose): Clean up resources when the widget is permanently removed.