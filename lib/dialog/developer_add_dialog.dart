import 'package:flutter/material.dart';
import 'package:hive_super_peer/hive/hive_service.dart';

import '../models/developer.dart';

Future<void> showDeveloperDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (ctx) {
        return const DeveloperAddDialog();
      });
}

class DeveloperAddDialog extends StatefulWidget {
  const DeveloperAddDialog({super.key});

  @override
  State<DeveloperAddDialog> createState() => _DeveloperAddDialogState();
}

class _DeveloperAddDialogState extends State<DeveloperAddDialog> {
  Developer developer = Developer.initial();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        'Developer Ekle',
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          children: [
            _textField(
              labelText: 'Name',
              onChanged: (p0) => developer.name = p0,
            ),
            _textField(
              labelText: 'Height',
              onChanged: (p0) => developer.height = double.tryParse(p0) ?? 0,
            ),
            _textField(
              labelText: 'Weight',
              onChanged: (p0) => developer.weight = double.tryParse(p0) ?? 0,
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: _saveDeveloper,
          child: const Text('Kaydet'),
        ),
      ],
    );
  }

  Widget _textField({
    required String labelText,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      onChanged: onChanged,
    );
  }

  void _saveDeveloper() async {
    NavigatorState navigatorState = Navigator.of(context);
    await HiveService<Developer>()
        .setData(key: developer.hashCode.toString(), data: developer);
    navigatorState.pop();
  }
}
