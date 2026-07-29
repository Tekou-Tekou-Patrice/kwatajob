import 'package:flutter/foundation.dart';

import '../models/job_offer.dart';
import '../repositories/job_offer_repository.dart';

class JobOfferProvider extends ChangeNotifier {
  JobOfferProvider({JobOfferRepository? repository}) : _repository = repository ?? FirebaseJobOfferRepository();

  final JobOfferRepository _repository;
  bool _isLoading = false;
  String? _errorMessage;
  List<JobOfferModel> _offers = const <JobOfferModel>[];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<JobOfferModel> get offers => _offers;

  Future<void> loadOffers() async {
    _setLoading(true);
    try {
      _offers = await _repository.fetchOffers();
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> createOffer(JobOfferModel offer) async {
    _setLoading(true);
    try {
      await _repository.createOffer(offer);
      await loadOffers();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateOffer(JobOfferModel offer) async {
    _setLoading(true);
    try {
      await _repository.updateOffer(offer);
      await loadOffers();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteOffer(String id) async {
    _setLoading(true);
    try {
      await _repository.deleteOffer(id);
      await loadOffers();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
