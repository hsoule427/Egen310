### Developer README   
This app was developed using the Processing3 framework for the frontend UI, and the Arduino programming langauage for the back-end logic implemented on the the microprocessor.

## Wireless Connection
Our frontend (Processing3 gui) communicates with our backend (Arduino) via a wireless Bluetooth connection. To connect these two components, we use the Serial library, which functions with both the Processing3 framework and the Arduino programming language.

To establish connection, you must specify which 'port' the Bluetooth module is referenced by with the `Serial.list()` function.

## GUI Programming
The Processsing3 framework provides a very intuitive and straightforward framework for building user interfaces. Called ControlP5; you may view it's documentation here: http://www.sojamo.de/libraries/controlP5/. All GUI specifications must be done in the `setup()` function. Builing a GUI is a simple as specifying your window dimension with the `size()` function. Buttons, textboxes, and other elements are added with specific `add()` functions provided by the ControlP5 framework.
