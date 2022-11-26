import 'package:flutter/cupertino.dart';
import 'package:hive_super_peer/models/developer.dart';
import 'package:hive_super_peer/page/page_mixin/scaffold_mixin.dart';

class DeveloperDetailPage extends StatefulWidget {
  final Developer developer;
  const DeveloperDetailPage({
    Key? key,
    required this.developer,
  }) : super(key: key);

  @override
  State<DeveloperDetailPage> createState() => _DeveloperDetailPageState();
}

class _DeveloperDetailPageState extends State<DeveloperDetailPage>
    with ScaffoldMixin {
  @override
  void initState() {
    super.initState();
    appBarTitle = widget.developer.name;
  }

  @override
  Widget body() {
    return ListView(
      children: [
        _title(),
        _height(),
        _weight(),
      ],
    );
  }

  Widget _title() {
    return Text(widget.developer.name);
  }

  Widget _height() {
    return Text(widget.developer.height.toString());
  }

  Widget _weight() {
    return Text(widget.developer.height.toString());
  }

  @override
  Widget? floatingActionButton() {
    return null;
  }
}
