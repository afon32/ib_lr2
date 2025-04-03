import 'package:flutter_ib/auth/registration/data/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/registration.dart';
import './state.dart';

final registrationFutureProvider =
    FutureProvider.autoDispose<void>((ref) async {
  final formState = ref.watch(registrationFormProvider);
  final registrationService = ref.read(registrationRepositoryProvider);
  await registrationService.register(formState);
});

final registrationServiceProvider = Provider.autoDispose((ref) {
  return RegistrationService.instance;
});

class RegistrationService {
  RegistrationService._();

  static final RegistrationService instance = RegistrationService._();

  Future<String> register(RegistrationData data) async =>
      await RegistrationRepository.instance.register(data);
}
