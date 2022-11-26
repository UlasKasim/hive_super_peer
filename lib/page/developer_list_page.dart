import 'package:flutter/material.dart';
import 'package:hive_super_peer/page/page_mixin/developer_mixin.dart';
import 'package:hive_super_peer/page/page_mixin/scaffold_mixin.dart';
import 'package:hive_super_peer/widgets/developer_card.dart';

class DeveloperListPage extends StatefulWidget {
  const DeveloperListPage({super.key});

  @override
  State<DeveloperListPage> createState() => _DeveloperListPageState();
}

class _DeveloperListPageState extends State<DeveloperListPage>
    with ScaffoldMixin, DeveloperMixin {
  @override
  void initState() {
    super.initState();
    appBarTitle = 'Developer List';
  }

  @override
  Widget body() {
    return ListView.builder(
      itemCount: developerList.length,
      itemBuilder: (context, index) => DeveloperCard(
        developer: developerList[index],
      ),
    );
  }

  @override
  Widget? floatingActionButton() {
    return Row(
      children: [
        const Spacer(),
        CircleAvatar(
          backgroundColor: Theme.of(context).errorColor,
          child: IconButton(
            onPressed: onClearAllPressed,
            icon: const Icon(Icons.delete_forever),
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: IconButton(
            onPressed: onAddPressed,
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
