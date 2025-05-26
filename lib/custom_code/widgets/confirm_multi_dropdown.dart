// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ConfirmMultiDropdown extends StatefulWidget {
  const ConfirmMultiDropdown({
    Key? key,
    required this.options,
    required this.onConfirm,
    required this.initialValues,
    this.hintText = 'Select options',
  }) : super(key: key);

  final List<String> options;
  final List<String> initialValues;
  final Function(List<String>) onConfirm;
  final String hintText;

  @override
  _ConfirmMultiDropdownState createState() => _ConfirmMultiDropdownState();
}

class _ConfirmMultiDropdownState extends State<ConfirmMultiDropdown> {
  late List<String> selectedValues;

  @override
  void initState() {
    super.initState();
    selectedValues = List.from(widget.initialValues);
  }

  void _showDropdownDialog() async {
    List<String> tempSelection = List.from(selectedValues);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(widget.hintText),
          content: SingleChildScrollView(
            child: Column(
              children: widget.options.map((option) {
                return CheckboxListTile(
                  title: Text(option),
                  value: tempSelection.contains(option),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        tempSelection.add(option);
                      } else {
                        tempSelection.remove(option);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  selectedValues = tempSelection;
                });
                widget.onConfirm(selectedValues);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayText =
        selectedValues.isEmpty ? widget.hintText : selectedValues.join(', ');

    return GestureDetector(
      onTap: _showDropdownDialog,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black26),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                displayText,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
