import 'package:flutter/material.dart';
import 'package:hive_super_peer/models/developer.dart';
import 'package:hive_super_peer/page/developer_detail_page.dart';

class DeveloperCard extends StatelessWidget {
  final Developer developer;
  const DeveloperCard({
    Key? key,
    required this.developer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: _title(context),
        children: [
          _info(context, 'Height:', developer.height.toString()),
          _info(context, 'Weight:', developer.weight.toString()),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(developer.name),
        IconButton(
            onPressed: () => _goDeveloperDetail(context),
            icon: const Icon(
              Icons.info,
              color: Colors.grey,
            )),
      ],
    );
  }

  Widget _info(BuildContext context, String title, String data) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(text: title, style: const TextStyle(color: Colors.black)),
            TextSpan(text: data, style: const TextStyle(color: Colors.black)),
          ]),
        ),
      ],
    );
  }

  void _goDeveloperDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DeveloperDetailPage(developer: developer),
      ),
    );
  }
}
