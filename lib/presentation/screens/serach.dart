import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  static const String routeName = '/search-city';

  final _formKey = GlobalKey<FormState>();
  String? _city;
  

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.of(context).pop(_city); // sharni qaytaradi
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a city',
                  hintText: 'Enter a city',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please, enter a city";
                  } else if (value.length < 3) {
                    return 'Please, enter at least 3 character';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _city = newValue!;
                },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () => _submit(context), // shahar qaytarib saqlaydi
               child: const Text('GET WEATHER'))
            ],
          ),
        ),
      ),
    );
  }
}
