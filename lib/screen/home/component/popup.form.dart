import 'package:flutter/material.dart';

class PopupForm extends StatefulWidget {
  const PopupForm({super.key, required this.onCreate});

  final void Function(String title, String description) onCreate;

  @override
  State<PopupForm> createState() => _PopupFormState();
}

class _PopupFormState extends State<PopupForm> {
  // Controllers for text fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    // Clean up controllers when widget is disposed
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // Handle form submission here (e.g., save data, close dialog)
    String title = _titleController.text;
    String description = _descriptionController.text;

    // You can process or store the title and description here
    widget.onCreate(title, description);

    // Close the dialog
    Navigator.of(context).pop();
  }

  void _closeForm() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = [
      IconButton(
        onPressed: _submitForm,
        icon: const Icon(Icons.save),
        color: Colors.deepOrange,
      ),
      IconButton(
        onPressed: _closeForm,
        icon: const Icon(Icons.cancel),
      ),
    ];

    final List<Widget> fields = [
      TextField(
        controller: _titleController,
        decoration: const InputDecoration(labelText: 'Title'),
      ),
      TextField(
        controller: _descriptionController,
        decoration: const InputDecoration(labelText: 'Description'),
      ),
    ];

    return AlertDialog(
      title: const Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: fields,
      ),
      actions: actions,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
