import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  List<dynamic> _contacts = [];

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  void _loadContacts() async {
    try {
        var contacts = await _apiService.getContacts();
        setState(() {
            _contacts = contacts;
        });
    } catch (e) {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                title: Text('Error'),
                content: Text('Failed to load contacts: $e'),
                actions: <Widget>[
                    TextButton(
                        onPressed: () {
                            Navigator.of(ctx).pop();
                        },
                        child: Text('Okay'),
                    )
                ],
            ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Contacts'),
        ),
        body: ListView.builder(
            itemCount: _contacts.length,
            itemBuilder: (ctx, i) => ListTile(
                title: Text(_contacts[i]['name']),
                subtitle: Text(_contacts[i]['email']),
            ),
        ),
    );
  }
}
