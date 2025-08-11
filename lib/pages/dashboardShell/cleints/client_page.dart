import 'package:flutter/material.dart';
import '../../../theme/theme_helper.dart';
import '../../../../model/client.dart';
import 'elements/clients_row.dart';
import 'elements/clients_tab_header.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  final Set<int> selectedClients = {};

  final List<ClientModel> clients = const [
    ClientModel(
      name: "Sierra Ferguson",
      phone: "+998 (99) 436-46-15",
      avatar:
          "https://corsproxy.io/?https://www.punjabkesari.com/wp-content/uploads/2025/07/aneet-padda-26.webp",
      totalRides: "120",
      totalFinished: "118",
      homeLocation: "Tashkent, Uzbekistan",
      workLocation: "Munich, Germany",
    ),
    ClientModel(
      name: "Aneta padda",
      phone: "+1 (555) 234-5678",
      avatar:
          "https://corsproxy.io/?https://pbs.twimg.com/media/GwOH6kVakAAt66Y?format=jpg&name=large",
      totalRides: "95",
      totalFinished: "90",
      homeLocation: "New York, USA",
      workLocation: "Berlin, Germany",
    ),
    ClientModel(
      name: "Sierra Ferguson",
      phone: "+998 (99) 436-46-15",
      avatar:
          "https://corsproxy.io/?https://www.punjabkesari.com/wp-content/uploads/2025/07/aneet-padda-26.webp",
      totalRides: "120",
      totalFinished: "118",
      homeLocation: "Tashkent, Uzbekistan",
      workLocation: "Munich, Germany",
    ),
    ClientModel(
      name: "Aneta padda",
      phone: "+1 (555) 234-5678",
      avatar:
          "https://corsproxy.io/?https://pbs.twimg.com/media/GwOH6kVakAAt66Y?format=jpg&name=large",
      totalRides: "95",
      totalFinished: "90",
      homeLocation: "New York, USA",
      workLocation: "Berlin, Germany",
    ),
    ClientModel(
      name: "Sierra Ferguson",
      phone: "+998 (99) 436-46-15",
      avatar:
          "https://corsproxy.io/?https://www.punjabkesari.com/wp-content/uploads/2025/07/aneet-padda-26.webp",
      totalRides: "120",
      totalFinished: "118",
      homeLocation: "Tashkent, Uzbekistan",
      workLocation: "Munich, Germany",
    ),
    ClientModel(
      name: "Aneta padda",
      phone: "+1 (555) 234-5678",
      avatar:
          "https://corsproxy.io/?https://pbs.twimg.com/media/GwOH6kVakAAt66Y?format=jpg&name=large",
      totalRides: "95",
      totalFinished: "90",
      homeLocation: "New York, USA",
      workLocation: "Berlin, Germany",
    ),
    ClientModel(
      name: "Sierra Ferguson",
      phone: "+998 (99) 436-46-15",
      avatar:
          "https://corsproxy.io/?https://www.punjabkesari.com/wp-content/uploads/2025/07/aneet-padda-26.webp",
      totalRides: "120",
      totalFinished: "118",
      homeLocation: "Tashkent, Uzbekistan",
      workLocation: "Munich, Germany",
    ),
    ClientModel(
      name: "Aneta padda",
      phone: "+1 (555) 234-5678",
      avatar:
          "https://corsproxy.io/?https://pbs.twimg.com/media/GwOH6kVakAAt66Y?format=jpg&name=large",
      totalRides: "95",
      totalFinished: "90",
      homeLocation: "New York, USA",
      workLocation: "Berlin, Germany",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: appTheme.whiteCustom,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ClientsTableHeader(),
            const SizedBox(height: 10),
            Column(
              children: List.generate(clients.length, (index) {
                return ClientRow(
                  client: clients[index],
                  isSelected: selectedClients.contains(index),
                  onSelected: (value) {
                    setState(() {
                      value
                          ? selectedClients.add(index)
                          : selectedClients.remove(index);
                    });
                  },
                  onEdit: () =>
                      debugPrint("Edit client: ${clients[index].name}"),
                  onDelete: () =>
                      debugPrint("Delete client: ${clients[index].name}"),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
