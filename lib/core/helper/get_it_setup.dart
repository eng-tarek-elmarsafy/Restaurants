import 'package:get_it/get_it.dart';
import 'package:restaurants/core/services/auth_services.dart';
import 'package:restaurants/core/services/supabase/supabase_auth_services_impl.dart';
import 'package:restaurants/features/auth/data/repo/auth_repo_impl.dart';
import 'package:restaurants/features/auth/domain/repo/auth_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthServices>(SupabaseAuthServicesImpl());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(authServices: getIt.get<AuthServices>()),
  );
}
