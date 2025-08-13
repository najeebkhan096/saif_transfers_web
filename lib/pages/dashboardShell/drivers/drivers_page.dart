import 'package:flutter/material.dart';
import 'package:saif_transfers_web/core/utils/images.dart';
import 'package:saif_transfers_web/widgets/custom_button.dart';
import 'package:saif_transfers_web/widgets/custom_image_view.dart';
import '../../../theme/theme_helper.dart';
import '../../../../model/driver.dart';
import 'elements/driver_row.dart';
import 'elements/drivers_tab_header.dart';

class DriversPage extends StatefulWidget {
  const DriversPage({super.key});

  @override
  State<DriversPage> createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  final Set<int> selectedDrivers = {};

  final List<DriverModel> drivers = [
    DriverModel(
      firstName: "John",
      lastName: "Doe",
      birthDate: "1988-05-12",
      state: "California",
      homeLocation: "Los Angeles, CA",
      workLocation: "San Francisco, CA",
      avatar:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/1.jpg",
    ),
    DriverModel(
      firstName: "Sarah",
      lastName: "Khan",
      birthDate: "1992-10-25",
      state: "Texas",
      homeLocation: "Houston, TX",
      workLocation: "Dallas, TX",
      avatar:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/2.jpg",
    ),
    DriverModel(
      firstName: "Mark",
      lastName: "Smith",
      birthDate: "1985-02-08",
      state: "New York",
      homeLocation: "Buffalo, NY",
      workLocation: "New York City, NY",
      avatar:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/3.jpg",
    ),
    DriverModel(
      firstName: "Emily",
      lastName: "Johnson",
      birthDate: "1990-07-14",
      state: "Florida",
      homeLocation: "Orlando, FL",
      workLocation: "Miami, FL",
      avatar:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/4.jpg",
    ),
    DriverModel(
      firstName: "Ali",
      lastName: "Raza",
      birthDate: "1987-03-19",
      state: "Illinois",
      homeLocation: "Chicago, IL",
      workLocation: "Springfield, IL",
      avatar:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/5.jpg",
    ),
    DriverModel(
      firstName: "Jessica",
      lastName: "Williams",
      birthDate: "1994-11-30",
      state: "Arizona",
      homeLocation: "Phoenix, AZ",
      workLocation: "Tucson, AZ",
      avatar:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/6.jpg",
    ),
    DriverModel(
      firstName: "Omar",
      lastName: "Khalid",
      birthDate: "1983-09-05",
      state: "Nevada",
      homeLocation: "Las Vegas, NV",
      workLocation: "Reno, NV",
      avatar:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/7.jpg",
    ),
    DriverModel(
      firstName: "Hina",
      lastName: "Malik",
      birthDate: "1991-04-22",
      state: "Washington",
      homeLocation: "Seattle, WA",
      workLocation: "Spokane, WA",
      avatar:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/8.jpg",
    ),
    DriverModel(
      firstName: "David",
      lastName: "Brown",
      birthDate: "1986-12-18",
      state: "Colorado",
      homeLocation: "Denver, CO",
      workLocation: "Boulder, CO",
      avatar:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/men/9.jpg",
    ),
    DriverModel(
      firstName: "Aisha",
      lastName: "Yousaf",
      birthDate: "1993-06-09",
      state: "Oregon",
      homeLocation: "Portland, OR",
      workLocation: "Eugene, OR",
      avatar:
          "https://corsproxy.io/?https://randomuser.me/api/portraits/women/10.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appTheme.whiteCustom,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DriversHeaderRow(
                title: 'Drivers list',
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
              const DriversTableHeader(),
              const SizedBox(height: 10),
              Column(
                children: List.generate(drivers.length, (index) {
                  return DriverRow(
                    driver: drivers[index],
                    isSelected: selectedDrivers.contains(index),
                    onSelected: (value) {
                      setState(() {
                        value
                            ? selectedDrivers.add(index)
                            : selectedDrivers.remove(index);
                      });
                    },
                    onEdit: () =>
                        debugPrint("Edit driver: ${drivers[index].firstName}"),
                    onDelete: () => debugPrint(
                      "Delete driver: ${drivers[index].firstName}",
                    ),
                  );
                }),
              ),
              const SizedBox(height: 50),
              DriversFooter(
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
      ),
    );
  }
}

class DriversHeaderRow extends StatelessWidget {
  final String title;
  final ValueChanged<String> onSearchChanged;
  final String dropdownValue;
  final ValueChanged<String?> onDropdownChanged;
  final List<String> dropdownItems;

  const DriversHeaderRow({
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
                prefixIcon: const Icon(
                  Icons.search,
                  size: 18,
                  color: Color(0xFF94A3B8),
                ),
                hintStyle: const TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF3B82F6)),
                ),
              ),
            ),
          ),
          Spacer(),

          // Dropdown
          Row(
            children: [
              CustomImageView(imagePath: ImageConstants.live),
              SizedBox(width: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  color: Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    style: const TextStyle(
                      color: Color(0xFF0F172A),
                      fontSize: 14,
                    ),
                    onChanged: onDropdownChanged,
                    items: dropdownItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DriversFooter extends StatelessWidget {
  final int totalUsers;
  final int activeDrivers;
  final int currentPage;
  final int totalPages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const DriversFooter({
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
                "Active Drivers: $activeDrivers",
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
              CustomButton(text: currentPage.toString(),width: 40,height: 40,),
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
