import 'package:get_it/get_it.dart';
import 'package:restaurants/core/services/auth_services.dart';
import 'package:restaurants/core/services/stor_services.dart';
import 'package:restaurants/core/services/supabase/data_stor_services_impl.dart';
import 'package:restaurants/core/services/supabase/supabase_auth_services_impl.dart';
import 'package:restaurants/features/auth/data/repo/auth_repo_impl.dart';
import 'package:restaurants/features/auth/domain/repo/auth_repo.dart';
import 'package:restaurants/features/home/data/repo/home_repo_impl.dart';
import 'package:restaurants/features/home/domain/repo/home_repo.dart';
import 'package:restaurants/features/restaurant_details/data/repo/menu_repo_impl.dart';
import 'package:restaurants/features/restaurant_details/domain/repo/menu_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthServices>(SupabaseAuthServicesImpl());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(authServices: getIt.get<AuthServices>()),
  );

  getIt.registerSingleton<StorServices>(StorServicesImpl());

  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(services: getIt.get<StorServices>()),
  );

  getIt.registerSingleton<MeunRepo>(
    MeunRepoImpl(services: getIt.get<StorServices>()),
  );
}
