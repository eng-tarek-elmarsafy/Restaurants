import 'package:get_it/get_it.dart';
import '../services/auth_services.dart';
import '../services/stor_services.dart';
import '../services/storag_services.dart';
import '../services/supabase/data_stor_services_impl.dart';
import '../services/supabase/delete_file.dart';
import '../services/supabase/storag_services_impl.dart';
import '../services/supabase/supabase_auth_services_impl.dart';
import '../services/supabase/upload_file.dart';
import '../services/supabase/upload_file_impl.dart';
import '../../features/acconut/data/repo/account_repo_impl.dart';
import '../../features/acconut/domain/repo/account_repo.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/domain/repo/auth_repo.dart';
import '../../features/cart/data/repo/order_repo_impl.dart';
import '../../features/cart/domain/repo/order_repo.dart';
import '../../features/history/data/repo/history_repo_impl.dart';
import '../../features/history/domain/repo/history_repo.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/domain/repo/home_repo.dart';
import '../../features/restaurant_details/data/repo/menu_repo_impl.dart';
import '../../features/restaurant_details/data/repo/rating_repo_impl.dart';
import '../../features/restaurant_details/domain/repo/menu_repo.dart';
import '../../features/restaurant_details/domain/repo/rating_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthServices>(SupabaseAuthServicesImpl());
  getIt.registerSingleton<StoragServices>(StoragServicesImpl());
  getIt.registerSingleton<DeleteFile>(
    DeleteFileImpl(supabase: getIt.get<StoragServices>()),
  );

  getIt.registerSingleton<StorServices>(StorServicesImpl());
  getIt.registerSingleton<UploadFile>(
    UploadFileImpl(uploadFileServices: UploadFileServices()),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      getIt.get<StorServices>(),
      authServices: getIt.get<AuthServices>(),
    ),
  );

  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(services: getIt.get<StorServices>()),
  );

  getIt.registerSingleton<MeunRepo>(
    MeunRepoImpl(services: getIt.get<StorServices>()),
  );
  getIt.registerSingleton<RatingRepo>(
    RatingRepoImpl(services: getIt.get<StorServices>()),
  );
  getIt.registerSingleton<AccountRepo>(
    AccountRepoImpl(authServices: getIt.get<AuthServices>()),
  );
  getIt.registerSingleton<OrderRepo>(
    OrderRepoImpl(storServices: getIt.get<StorServices>()),
  );
  getIt.registerSingleton<HistoryRepo>(
    HistoryRepoImpl(storServices: getIt.get<StorServices>()),
  );
}
