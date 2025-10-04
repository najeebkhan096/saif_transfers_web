import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/fare.dart';

/// Service class for managing fares in Firestore
class FareService {
  /// Reference to the 'fares' collection in Firestore
  final CollectionReference<Fare> _fareCollection =
  FirebaseFirestore.instance.collection('fares').withConverter<Fare>(
    fromFirestore: (snapshots, _) => Fare.fromFirestore(snapshots),
    toFirestore: (fare, _) => fare.toMap(),
  );

  /// Create a new fare (only if not already existing by name)
  Future<void> addFare(Fare fare) async {
    try {
      print('[FareService] Adding fare: ${fare.name}');

      // 🔎 Check if fare with same name already exists
      final query = await _fareCollection
          .where('name', isEqualTo: fare.name)
          .limit(1)
          .get();

      if (query.docs.isNotEmpty) {
        print('[FareService] Fare already exists: ${fare.name}');
        throw Exception("Fare '${fare.name}' already exists.");
      }

      // If not found → Add new
      await _fareCollection.add(fare);
      print('[FareService] Fare added successfully: ${fare.name}');
    } catch (e) {
      print('[FareService] Failed to add fare: $e');
      throw Exception("Failed to add fare: $e");
    }
  }

  /// Update an existing fare by ID
  Future<void> updateFare(Fare fare) async {
    try {
      print('[FareService] Updating fare: ${fare.id}');
      await _fareCollection.doc(fare.id).set(fare);
      print('[FareService] Fare updated successfully: ${fare.id}');
    } catch (e) {
      print('[FareService] Failed to update fare: $e');
      throw Exception("Failed to update fare: $e");
    }
  }

  /// Delete a fare by ID
  Future<void> deleteFare(String id) async {
    try {
      print('[FareService] Deleting fare: $id');
      await _fareCollection.doc(id).delete();
      print('[FareService] Fare deleted successfully: $id');
    } catch (e) {
      print('[FareService] Failed to delete fare: $e');
      throw Exception("Failed to delete fare: $e");
    }
  }

  /// Get a single fare by ID
  Future<Fare?> getFareById(String id) async {
    try {
      print('[FareService] Fetching fare by ID: $id');
      final doc = await _fareCollection.doc(id).get();
      final fare = doc.data();
      print('[FareService] Fetched fare: ${fare?.name}');
      return fare;
    } catch (e) {
      print('[FareService] Failed to fetch fare: $e');
      throw Exception("Failed to fetch fare: $e");
    }
  }

  /// Get all fares
  /// Stream all fares in real-time
  Stream<List<Fare>> streamAllFares() {
    return _fareCollection.snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }


  /// Toggle fare active status
  Future<void> setFareActive(String id, bool isActive) async {
    try {
      print('[FareService] Setting fare active status: $id => $isActive');
      await _fareCollection.doc(id).update({'isActive': isActive});
      print('[FareService] Updated active status successfully: $id');
    } catch (e) {
      print('[FareService] Failed to update fare status: $e');
      throw Exception("Failed to update fare status: $e");
    }
  }
}
