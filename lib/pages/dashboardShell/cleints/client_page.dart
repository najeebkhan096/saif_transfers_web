import 'package:flutter/material.dart';
import '../../../theme/theme_helper.dart';
import '../../../../model/client.dart';
import '../../../widgets/custom_button.dart';
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
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClientsHeaderRow(
              title: 'Clients list',
              onSearchChanged: (query) {
                print("Searching for $query");
              },
              dropdownValue: 'All driver',
              onDropdownChanged: (value) {
                print("Dropdown changed to $value");
              },
              dropdownItems: const ['All driver', 'Active', 'Created'],
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 50),
            ClientFooter(
              totalUsers: 256,
              activeDrivers: 120,
              currentPage: 1,
              totalPages: 10,
              onPrevious: () {
                print("Previous page");
              },
              onNext: () {
                print("Next page");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ClientsHeaderRow extends StatelessWidget {
  final String title;
  final ValueChanged<String> onSearchChanged;
  final String dropdownValue;
  final ValueChanged<String?> onDropdownChanged;
  final List<String> dropdownItems;

  const ClientsHeaderRow({
    super.key,
    required this.title,
    required this.onSearchChanged,
    required this.dropdownValue,
    required this.onDropdownChanged,
    required this.dropdownItems,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 650,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
          SizedBox(width: 20),

          // Search Field
          SizedBox(
            width: 280,
            child: TextField(
              onChanged: onSearchChanged,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Search by Name',
                suffixIcon: const Icon(
                  Icons.search,
                  size: 18,
                  color: Color(0xFF94A3B8),
                ),
                hintStyle: const TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(color: Color(0xFF3B82F6)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClientFooter extends StatelessWidget {
  final int totalUsers;
  final int activeDrivers;
  final int currentPage;
  final int totalPages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const ClientFooter({
    super.key,
    required this.totalUsers,
    required this.activeDrivers,
    required this.currentPage,
    required this.totalPages,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 900,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: const Color(0xFFE2E8F0), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side info
          Row(
            children: [
              Text(
                "Total: $totalUsers Users",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF475569),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                "Active Clients: $activeDrivers",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF475569),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          // Right side pagination
          Row(
            children: [
              Text(
                "Page $currentPage of $totalPages",
                style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
              ),
              const SizedBox(width: 12),
              _paginationButton(
                icon: Icons.chevron_left,
                onTap: onPrevious,
                isDisabled: currentPage == 1,
              ),
              CustomButton(text: currentPage.toString(), width: 40, height: 40),
              const SizedBox(width: 8),
              _paginationButton(
                icon: Icons.chevron_right,
                onTap: onNext,
                isDisabled: currentPage == totalPages,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paginationButton({
    required IconData icon,
    required VoidCallback onTap,
    bool isDisabled = false,
  }) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDisabled ? const Color(0xFFF1F5F9) : Colors.white,
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Icon(
          icon,
          size: 20,
          color: isDisabled ? const Color(0xFF94A3B8) : const Color(0xFF0F172A),
        ),
      ),
    );
  }
}
