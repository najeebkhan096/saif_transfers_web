import 'package:flutter/material.dart';
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
      avatar: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/1.jpg",
    ),
    DriverModel(
      firstName: "Sarah",
      lastName: "Khan",
      birthDate: "1992-10-25",
      state: "Texas",
      homeLocation: "Houston, TX",
      workLocation: "Dallas, TX",
      avatar: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/2.jpg",
    ),
    DriverModel(
      firstName: "Mark",
      lastName: "Smith",
      birthDate: "1985-02-08",
      state: "New York",
      homeLocation: "Buffalo, NY",
      workLocation: "New York City, NY",
      avatar: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/3.jpg",
    ),
    DriverModel(
      firstName: "Emily",
      lastName: "Johnson",
      birthDate: "1990-07-14",
      state: "Florida",
      homeLocation: "Orlando, FL",
      workLocation: "Miami, FL",
      avatar: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/4.jpg",
    ),
    DriverModel(
      firstName: "Ali",
      lastName: "Raza",
      birthDate: "1987-03-19",
      state: "Illinois",
      homeLocation: "Chicago, IL",
      workLocation: "Springfield, IL",
      avatar: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/5.jpg",
    ),
    DriverModel(
      firstName: "Jessica",
      lastName: "Williams",
      birthDate: "1994-11-30",
      state: "Arizona",
      homeLocation: "Phoenix, AZ",
      workLocation: "Tucson, AZ",
      avatar: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/6.jpg",
    ),
    DriverModel(
      firstName: "Omar",
      lastName: "Khalid",
      birthDate: "1983-09-05",
      state: "Nevada",
      homeLocation: "Las Vegas, NV",
      workLocation: "Reno, NV",
      avatar: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/7.jpg",
    ),
    DriverModel(
      firstName: "Hina",
      lastName: "Malik",
      birthDate: "1991-04-22",
      state: "Washington",
      homeLocation: "Seattle, WA",
      workLocation: "Spokane, WA",
      avatar: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/8.jpg",
    ),
    DriverModel(
      firstName: "David",
      lastName: "Brown",
      birthDate: "1986-12-18",
      state: "Colorado",
      homeLocation: "Denver, CO",
      workLocation: "Boulder, CO",
      avatar: "https://corsproxy.io/?https://randomuser.me/api/portraits/men/9.jpg",
    ),
    DriverModel(
      firstName: "Aisha",
      lastName: "Yousaf",
      birthDate: "1993-06-09",
      state: "Oregon",
      homeLocation: "Portland, OR",
      workLocation: "Eugene, OR",
      avatar: "https://corsproxy.io/?https://randomuser.me/api/portraits/women/10.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      color: appTheme.whiteCustom,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child:  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    onDelete: () =>
                        debugPrint("Delete driver: ${drivers[index].firstName}"),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
