import 'package:flutter/material.dart';

class PopupForm extends StatefulWidget {
  const PopupForm({super.key, required this.onCreate});

  final void Function(String title, String description) onCreate;

  @override
  State<PopupForm> createState() => _PopupFormState();
}

class _PopupFormState extends State<PopupForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      // Add a simple validation to check if fields are not empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });

      String title = _titleController.text;
      String description = _descriptionController.text;

      widget.onCreate(title, description);

      Navigator.of(context).pop();
    });
  }

  void _closeForm() {
    Navigator.of(context).pop();
  }

  Widget _buildSaveButtonContent() {
    if (_isLoading) {
      return Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.only(right: 15),
        child: const CircularProgressIndicator(
          color: Colors.deepOrange,
        ),
      );
    }

    return IconButton(
      onPressed: _submitForm,
      icon: const Icon(Icons.save),
      color: Colors.deepOrange,
    );
  }

  List<Widget> _buildFormFields() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
          key: const Key('title_field'),
          controller: _titleController,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextField(
          key: const Key('description_field'),
          controller: _descriptionController,
          decoration: const InputDecoration(labelText: 'Description'),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildFormFields(),
      ),
      actions: [
        _buildSaveButtonContent(),
        IconButton(
          onPressed: _closeForm,
          icon: const Icon(Icons.cancel),
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
