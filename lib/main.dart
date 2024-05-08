import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Service App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'proj.png', // Replace 'assets/logo.png' with your image asset path
              width: 100, // Adjust width as needed
              height: 100, // Adjust height as needed
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(userName: 'something')),
                );
              },
              child: Text('Go to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $userName'),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BusDetailsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.all(16),
                    minimumSize: Size(150, 150), // Adjusted size here
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_bus, size: 100), // Adjusted size here
                      SizedBox(height: 10),
                      Text('BUS DETAILS', textAlign: TextAlign.center),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BusTimingsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.all(16),
                    minimumSize: Size(150, 150), // Adjusted size here
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.schedule, size: 60), // Adjusted size here
                      SizedBox(height: 10),
                      Text('BUS TIMINGS', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrackBusPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.all(16),
                    minimumSize: Size(150, 150), // Adjusted size here
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, size: 60), // Adjusted size here
                      SizedBox(height: 10),
                      Text('TRACK BUS', textAlign: TextAlign.center),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    padding: EdgeInsets.all(16),
                    minimumSize: Size(150, 150), // Adjusted size here
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.exit_to_app, size: 60), // Adjusted size here
                      SizedBox(height: 10),
                      Text('EXIT', textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              child: Text('Open Chatbot'),
            ),
          ],
        ),
      ),
    );
  }
}

class BusDetailsPage extends StatelessWidget {
  // Dummy list of buses for demonstration
  final List<String> buses = [
    'Bus 1 -515A- Details ',
    'Bus 2 -79- Details',
    'Bus 3 -81- Details',
    // Add more bus details as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Details'),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: buses.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _navigateToBusDetail(context, buses[index]);
            },
            child: Card(
              child: ListTile(
                title: Text(buses[index]),
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToBusDetail(BuildContext context, String busDetail) {
    // Navigate to the bus detail screen passing the bus detail as an argument
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BusDetailScreen(busDetail: busDetail),
      ),
    );
  }
}

class BusDetailScreen extends StatelessWidget {
  final String busDetail;

  const BusDetailScreen({Key? key, required this.busDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BUS DETAILSS'),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          busDetail,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class BusTimingsPage extends StatelessWidget {
  final List<String> busTimings = [
    '7:00 AM - 515A Tambaram',
    '9:00 AM - 515B Kilambakam',
    '11:00 AM - 515 VIT CHENNAI',
    '1:00 PM - 79 Kanchipuram',
    '3:00 PM - 81 Chengalpattu',
    '5:00 PM - 519 Tambaram',
    '7:00 PM - 519B Kilambakam',
    '9:00 PM - 519 VIT CHENNAI',
    '11:00 PM - 79A Kanchipuram',
    '1:00 AM - 81A Chengalpattu',
    '3:00 AM - 515C Tambaram',
    '5:00 AM - 515D Kilambakam',
    '7:00 AM - 515E VIT CHENNAI',
    '9:00 AM - 79B Kanchipuram',
    '11:00 AM - 81B Chengalpattu',
    '9:00 AM - 515A Tambaram',
    '11:00 AM - 515B Kilambakam',
    '1:00 PM - 515 VIT CHENNAI',
    '3:00 PM - 79 Kanchipuram',
    '5:00 PM - 81 Chengalpattu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Timings'),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView.builder(
          itemCount: busTimings.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                busTimings[index],
                style: TextStyle(fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TrackBusPage extends StatelessWidget {
  final List<Map<String, String>> busDetails = [
    {'busNumber': '515A Tambaram', 'trackUrl': 'https://example.com/track/515A'},
    {'busNumber': '515B Kilambakam', 'trackUrl': 'https://example.com/track/515B'},
    {'busNumber': '515 VIT CHENNAI', 'trackUrl': 'https://example.com/track/515'},
    {'busNumber': '79 Kanchipuram', 'trackUrl': 'https://example.com/track/79'},
    {'busNumber': '81 Chengalpattu', 'trackUrl': 'https://example.com/track/81'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Bus'),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: busDetails.length,
        itemBuilder: (context, index) {
          final bus = busDetails[index];
          return buildBusTrackCard(bus['busNumber']!, bus['trackUrl']!);
        },
      ),
    );
  }

  Widget buildBusTrackCard(String busNumber, String trackUrl) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: ListTile(
        title: Text(busNumber),
        leading: Icon(Icons.directions_bus),
        trailing: ElevatedButton(
          onPressed: () {
            // Placeholder action for tracking button
            print('Tracking $busNumber at $trackUrl');
          },
          child: Text('Track'),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _chatMessages = [];

  void _handleMessage(String message) {
    setState(() {
      _chatMessages.add('User: $message');
      // Respond to user messages based on keywords
      if (message.contains('bus details')) {
        _chatMessages.add('Chatbot: Here are the bus details...'
            '        Bus 1 -515A - Details- 9AM at Tambaram to Kilambakam ,Bus 2 -79 - Details 10AM from TAMBARAM to Kanchipuram ,Bus 3 - 89  - Details 11AM Tambaram to Chengalpattu ');

        // Add logic to fetch and display bus details
      } else if (message.contains('bus timings from tambaram')) {
        _chatMessages.add('Chatbot: Here are the bus timings.from TAMBARAM..');
        _chatMessages.addAll([
          '7:00 AM - 515A Tambaram',

          '5:00 PM - 519 Tambaram',

          '3:00 AM - 515C Tambaram',


          '9:00 AM - 515A Tambaram',

        ]);
      }
      else if (message.contains('bus timings from kilambakam')) {
        _chatMessages.add('Chatbot: Here are the bus timings...from Kilambakam');
        _chatMessages.addAll([

          '9:00 AM - 515B Kilambakam',

          '7:00 PM - 519B Kilambakam',

          '5:00 AM - 515D Kilambakam',

          '11:00 AM - 515B Kilambakam',

        ]);


      // Add logic to fetch and display bus timings
      }
      else if (message.contains('bus timings from VIT CHENNAI')) {
        _chatMessages.add('Chatbot: Here are the bus timings...from VIT CHENNAI ');
        _chatMessages.addAll([

          '11:00 AM - 515 VIT CHENNAI',

          '9:00 PM - 519 VIT CHENNAI',

          '7:00 AM - 515E VIT CHENNAI',

          '1:00 PM - 515 VIT CHENNAI',

        ]);
      }
      else {
        _chatMessages.add('Chatbot: Sorry, I don\'t understand.');
      }
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_chatMessages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Ask a question...'),
                    onSubmitted: _handleMessage,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _handleMessage(_controller.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isEmailValid = false;
  String _emailErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' KNOW UR BUS !!!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        elevation: 0,
      ),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(60, 60),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                Icons.bus_alert,
                size: 50,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sign in to continue.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 50,
              ),
              inputForm("Email", _emailController),
              SizedBox(
                height: 15,
              ),
              inputForm("Password", _passwordController, isPassword: true),
              SizedBox(
                height: 15,
              ),
              Center(
                child: GestureDetector(
                  onTap: _navigateToForgotPassword,
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New User? "),
                  GestureDetector(
                    onTap: _navigateToSignUp,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget inputForm(String title, TextEditingController controller, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: title == "Email"
                ? Border.all(
              width: 0.5,
              color: controller.text.isEmpty
                  ? Colors.grey
                  : _isEmailValid
                  ? Colors.green
                  : Colors.lightBlue,
            )
                : Border.all(width: 0.5, color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                errorText: title == "Email" ? _emailErrorMessage : null,
              ),
              onChanged: (value) {
                if (title == "Email") {
                  setState(() {
                    _isEmailValid = _validateEmail(value);
                    if (!_isEmailValid) {
                      _emailErrorMessage = 'ENTER VALID EMAIL ID';
                    } else {
                      _emailErrorMessage = '';
                    }
                  });
                }
              },
            ),
          ),
        )
      ],
    );
  }

  bool _validateEmail(String value) {
    // Check if email contains '@' symbol
    if (!value.contains('@')) {
      return false;
    }

    // Check if email ends with either 'gmail.com' or '.co.in'
    if (!value.endsWith('gmail.com') && !value.endsWith('.co.in')) {
      return false;
    }

    return true;
  }

  void _handleLogin() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Perform validation checks
    if (email.isNotEmpty && password.isNotEmpty && _isEmailValid) {
      // Perform login logic here
      // For demonstration, let's print the email and password
      print('Email: $email');
      print('Password: $password');

      // Navigate to the home screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage(userName: email)), // Passing email as the userName
      );
    } else {
      // Display an error message or handle invalid input
      print('Please enter a valid email and password');
    }
  }

  void _navigateToSignUp() {
    // Navigate to the sign-up screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  void _navigateToForgotPassword() {
    // Navigate to the forgot password screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isEmailValid = false;
  String _emailErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _emailErrorMessage.isNotEmpty ? _emailErrorMessage : null,
              ),
              onChanged: (value) {
                setState(() {
                  _isEmailValid = _validateEmail(value);
                  if (!_isEmailValid) {
                    _emailErrorMessage = 'ENTER VALID EMAIL ID';
                  } else {
                    _emailErrorMessage = '';
                  }
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleSignUp,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignUp() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Perform validation checks
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty && _isEmailValid) {
      if (password == confirmPassword) {
        // Perform sign-up logic here
        // For demonstration, let's print the user details
        print('Name: $name');
        print('Email: $email');
        print('Password: $password');

        // Navigate to the home screen after successful sign-up
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage(userName: email)), // Passing email as the userName
        );
      } else {
        // Display an error message if passwords don't match
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Passwords do not match.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      // Display an error message or handle invalid input
      print('Please fill all fields');
    }
  }

  bool _validateEmail(String value) {
    // Check if email contains '@' symbol
    if (!value.contains('@')) {
      return false;
    }

    // Check if email ends with either 'gmail.com' or '.co.in'
    if (!value.endsWith('gmail.com') && !value.endsWith('.co.in')) {
      return false;
    }

    return true;
  }
}

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false;
  String _emailErrorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _emailErrorMessage.isNotEmpty ? _emailErrorMessage : null,
              ),
              onChanged: (value) {
                setState(() {
                  _isEmailValid = _validateEmail(value);
                  if (!_isEmailValid) {
                    _emailErrorMessage = 'ENTER VALID EMAIL ID';
                  } else {
                    _emailErrorMessage = '';
                  }
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;

                // Perform validation checks
                if (email.isNotEmpty && _isEmailValid) {
                  // Perform password reset logic here
                  // For demonstration, let's print the email
                  print('Email: $email');

                  // Show a confirmation message
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Password Reset'),
                      content: Text('The link to reset your password has been sent to $email.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Display an error message or handle invalid input
                  print('Please enter a valid email');
                }
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateEmail(String value) {
    // Check if email contains '@' symbol
    if (!value.contains('@')) {
      return false;
    }

    // Check if email ends with either 'gmail.com' or '.co.in'
    if (!value.endsWith('gmail.com') && !value.endsWith('.co.in')) {
      return false;
    }

    return true;
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}