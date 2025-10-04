import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../enum/service_type.dart';
import '../../../../model/fare.dart';
import '../../../../services/fare_service.dart';

class FareManagementPage extends StatefulWidget {
  const FareManagementPage({super.key});

  @override
  State<FareManagementPage> createState() => _FareManagementPageState();
}

class _FareManagementPageState extends State<FareManagementPage> {
  final FareService _fareService = FareService();
  Key _listKey = UniqueKey(); // Key for FutureBuilder to force rebuild

  /// Refresh the fare list
  void _refreshFares() {
    setState(() {
      _listKey = UniqueKey();
    });
  }

  /// Show dialog to add or edit fare
  Future<void> _showFareDialog({Fare? fare}) async {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: fare?.name ?? '');
    final baseFareController = TextEditingController(
      text: fare?.baseFare.toString() ?? '',
    );
    final perKmController = TextEditingController(
      text: fare?.perKm.toString() ?? '',
    );
    final perMinuteController = TextEditingController(
      text: fare?.perMinute.toString() ?? '',
    );
    final minFareController = TextEditingController(
      text: fare?.minFare.toString() ?? '',
    );
    final cancellationController = TextEditingController(
      text: fare?.cancellationFee.toString() ?? '',
    );
    bool isActive = fare?.isActive ?? true;
    ServiceType? selectedType = fare != null
        ? ServiceType.values.firstWhere(
            (e) => e.displayName == fare.name,
            orElse: () => ServiceType.business,
          )
        : ServiceType.business;

    await showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(
            fare == null ? 'Add Fare' : 'Edit Fare',
            style: GoogleFonts.dmSans(fontWeight: FontWeight.bold),
          ),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Service Type Dropdown
                  DropdownButtonFormField<ServiceType>(
                    value: selectedType,
                    items: ServiceType.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.displayName),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => setDialogState(() => selectedType = v),
                    decoration: const InputDecoration(
                      labelText: 'Service Type',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: baseFareController,
                    decoration: const InputDecoration(labelText: 'Base Fare'),
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Base fare required' : null,
                  ),
                  TextFormField(
                    controller: perKmController,
                    decoration: const InputDecoration(labelText: 'Per Km'),
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Per Km required' : null,
                  ),
                  TextFormField(
                    controller: perMinuteController,
                    decoration: const InputDecoration(labelText: 'Per Minute'),
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Per Minute required' : null,
                  ),
                  TextFormField(
                    controller: minFareController,
                    decoration: const InputDecoration(labelText: 'Min Fare'),
                    keyboardType: TextInputType.number,
                    validator: (v) =>
                        v == null || v.isEmpty ? 'Min Fare required' : null,
                  ),
                  TextFormField(
                    controller: cancellationController,
                    decoration: const InputDecoration(
                      labelText: 'Cancellation Fee',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (v) => v == null || v.isEmpty
                        ? 'Cancellation Fee required'
                        : null,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text('Active:'),
                      Switch(
                        value: isActive,
                        onChanged: (v) => setDialogState(() => isActive = v),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (!_formKey.currentState!.validate()) return;

                final newFare = Fare(
                  id: fare?.id ?? '',
                  name: selectedType!.displayName,
                  baseFare: double.parse(baseFareController.text),
                  perKm: double.parse(perKmController.text),
                  perMinute: double.parse(perMinuteController.text),
                  minFare: double.parse(minFareController.text),
                  cancellationFee: double.parse(cancellationController.text),
                  isActive: isActive,
                  photoUrl: fare?.photoUrl,
                  createdAt: fare?.createdAt,
                );

                try {
                  if (fare == null) {
                    await _fareService.addFare(newFare);
                    if (!mounted) return;
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Fare '${newFare.name}' added successfully",
                        ),
                      ),
                    );
                  } else {
                    await _fareService.updateFare(newFare);
                    if (!mounted) return;
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Fare '${newFare.name}' updated successfully",
                        ),
                      ),
                    );
                  }
                } catch (e) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        e.toString().replaceFirst("Exception: ", ""),
                      ),
                    ),
                  );
                }
              },
              child: Text(fare == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }

  /// Confirm deletion
  Future<void> _confirmDelete(Fare fare) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Confirm Delete'),
            content: Text('Are you sure you want to delete ${fare.name}?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete'),
              ),
            ],
          ),
        ) ??
        false;

    if (confirmed) {
      await _fareService.deleteFare(fare.id);
      if (!mounted) return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Add New Fare button
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton.icon(
              onPressed: () => _showFareDialog(),
              icon: const Icon(Icons.add),
              label: const Text('Add New Fare'),
            ),
          ),
        ),
        StreamBuilder<List<Fare>>(
          stream: _fareService.streamAllFares(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final fares = snapshot.data ?? [];
            if (fares.isEmpty) {
              return const Center(child: Text('No fares added yet.'));
            }

            return Container(
              height: 500,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                itemCount: fares.length,
                itemBuilder: (context, index) {
                  final fare = fares[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      leading: fare.photoUrl != null
                          ? Image.network(
                              fare.photoUrl!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.local_taxi, size: 40),
                      title: Text(fare.name),
                      subtitle: Text(
                        'Base: \$${fare.baseFare} | Per Km: \$${fare.perKm} | Per Min: \$${fare.perMinute}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Switch(
                            value: fare.isActive,
                            onChanged: (v) async {
                              await _fareService.setFareActive(fare.id, v);
                              // No need to call _refreshFares() anymore
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _showFareDialog(fare: fare),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _confirmDelete(fare),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
