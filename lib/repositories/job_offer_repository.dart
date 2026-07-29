import '../models/job_offer.dart';

abstract class JobOfferRepository {
  Future<List<JobOfferModel>> fetchOffers();
  Future<void> createOffer(JobOfferModel offer);
  Future<void> updateOffer(JobOfferModel offer);
  Future<void> deleteOffer(String id);
}

class FirebaseJobOfferRepository implements JobOfferRepository {
  @override
  Future<List<JobOfferModel>> fetchOffers() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const <JobOfferModel>[];
  }

  @override
  Future<void> createOffer(JobOfferModel offer) async {
    await Future.delayed(const Duration(milliseconds: 600));
  }

  @override
  Future<void> updateOffer(JobOfferModel offer) async {
    await Future.delayed(const Duration(milliseconds: 600));
  }

  @override
  Future<void> deleteOffer(String id) async {
    await Future.delayed(const Duration(milliseconds: 600));
  }
}
