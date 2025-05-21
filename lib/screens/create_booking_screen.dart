import 'package:flutter/material.dart';

class CreateBookingScreen extends StatefulWidget {
  const CreateBookingScreen({super.key});

  @override
  State<CreateBookingScreen> createState() => _CreateBookingScreenState();
}

class _CreateBookingScreenState extends State<CreateBookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _roomController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _roomController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _submitBooking() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // Simulate network request
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return; // ✅ Fix context usage after async

    setState(() => _isLoading = false);

    if (!mounted) return; // ✅ Fix context usage again

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Booking created successfully!')),
    );

    Navigator.pop(context); // ✅ Safe use after mounted check
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Booking')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _roomController,
                decoration: const InputDecoration(labelText: 'Room Name'),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Enter room name'
                            : null,
              ),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date (YYYY-MM-DD)',
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Enter date' : null,
              ),
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(labelText: 'Time (HH:MM)'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Enter time' : null,
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                    onPressed: _submitBooking,
                    child: const Text('Submit Booking'),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
