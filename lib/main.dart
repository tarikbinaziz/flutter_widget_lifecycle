import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lifecycle Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyCounterWidget(initialCount: 0),
    );
  }
}

class MyCounterWidget extends StatefulWidget {
  final int initialCount;

  // Constructor
  const MyCounterWidget({super.key, required this.initialCount});

  @override
  _MyCounterWidgetState createState() => _MyCounterWidgetState();
}

class _MyCounterWidgetState extends State<MyCounterWidget> {
  int _counter = 0;

  // Mounted property
  bool get isMounted => mounted;

  @override
  void initState() {
    super.initState();
    // Initialize the counter with the initial value
    _counter = widget.initialCount;
    print("initState: Counter initialized to $_counter");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // This is called when dependencies change, such as inherited widgets
    print("didChangeDependencies: Widget dependencies changed");
  }

  @override
  void didUpdateWidget(MyCounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the initialCount has changed, update the counter
    if (oldWidget.initialCount != widget.initialCount) {
      setState(() {
        _counter = widget.initialCount; // Update state with new value
      });
      print("didUpdateWidget: Counter updated to $_counter");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build: Widget built with counter value: $_counter");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lifecycle Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter: $_counter", style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Increment counter and trigger a rebuild
                setState(() {
                  _counter++;
                });
                print("setState: Counter incremented to $_counter");
              },
              child: const Text("Increment"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Reset to the initial count (simulating a parent widget update)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyCounterWidget(initialCount: _counter),
                  ),
                );
              },
              child: const Text("Reset to Current Count"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    // Clean up before temporary removal
    print("deactivate: Widget is being removed temporarily");
  }

  @override
  void dispose() {
    // Clean up resources here if needed
    print("dispose: Widget disposed");
    super.dispose();
  }
}


/*
Breakdown of Each Component
MyApp: The main entry point of the Flutter application. It creates the MaterialApp and sets the home to MyCounterWidget.

MyCounterWidget (Stateful Widget):

Constructor: Receives initialCount as a parameter and passes it to the state.
createState: Creates the state for this widget, returning an instance of _MyCounterWidgetState.
_MyCounterWidgetState (State Class):

mounted: You can check this property to see if the widget is currently in the widget tree.
initState: Called once when the widget is created. Initializes _counter with initialCount.
didChangeDependencies: Called when the widget is inserted into the widget tree or when its dependencies change. It can be used to respond to changes in inherited widgets.
didUpdateWidget: Called whenever the widget is rebuilt with a new configuration. It checks if the initialCount has changed and updates _counter if necessary.
build: The UI is built here based on the current value of _counter. It contains two buttons: one to increment the counter and another to reset it to the current count by navigating to a new instance of MyCounterWidget.
setState: Used to notify the framework that the internal state of the widget has changed, prompting a rebuild.
deactivate: Called when the widget is removed temporarily. Useful for cleanup before the widget is removed.
dispose: Called when the widget is permanently removed from the widget tree. Here, you would clean up any resources (not used in this example).
*/