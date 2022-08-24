import 'package:get/get.dart';
import 'package:plants_odc/features/authentication/data/repositories/firebase_repositories_impl.dart';
import 'package:plants_odc/features/authentication/domain/usecases/sign_in_with_google.dart';
import 'package:plants_odc/features/authentication/domain/usecases/sign_up.dart';
import 'package:plants_odc/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:plants_odc/features/forum/data/repositories/forum_repository_impl.dart';
import 'package:plants_odc/features/forum/domain/usecases/get_all_forums.dart';
import '../../features/authentication/data/datasources/firebase_remote_data_source_impl.dart';
import '../../features/authentication/domain/usecases/sign_in.dart';
import '../../features/forum/data/datasources/forum_remote_data_source_impl.dart';
import '../../features/forum/domain/usecases/get_my_forums.dart';
import '../../features/forum/domain/usecases/post_forums.dart';
import '../../features/forum/presentation/controller/forum_controller.dart';
import '../../features/home/data/datasources/home_remote_data_source_impl.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/usecases/get_plants.dart';
import '../../features/home/domain/usecases/get_products.dart';
import '../../features/home/domain/usecases/get_seeds.dart';
import '../../features/home/domain/usecases/get_tools.dart';
import '../../features/home/presentation/controller/home_controller.dart';
import '../../features/profile/data/datasources/profile_remote_data_source_impl.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/usecases/get_user_data.dart';
import '../../features/profile/presentation/controller/profile_controller.dart';

class AllBinding extends Bindings{
  @override
  void dependencies() {

    // Auth
    FirebaseRemoteDataSourceImpl remoteDataSource=FirebaseRemoteDataSourceImpl.getInstance();
    FirebaseRepositoriesImpl impl=FirebaseRepositoriesImpl(remoteDataSource: remoteDataSource);
    SignUpUseCase signUp=SignUpUseCase(repository: impl );
    SignInUseCase signIn=SignInUseCase(repository:impl);
    SignInWithGoogleUseCase google=SignInWithGoogleUseCase(repository: impl);
    Get.lazyPut<AuthController>(() => AuthController(signUp: signUp,signIn: signIn,google: google));

    // Home
    HomeRemoteDataSourceImpl datasources=HomeRemoteDataSourceImpl.getInstance();
    HomeRepositoryImpl homeImpl=HomeRepositoryImpl(dataSource: datasources);
    GetPlantsUseCase plantsUseCase=GetPlantsUseCase(home: homeImpl);
    GetToolsUseCase toolsUseCase=GetToolsUseCase(home: homeImpl);
    GetSeedsUseCase seedsUseCase=GetSeedsUseCase(home: homeImpl);
    GetProductsUseCase productsUseCase=GetProductsUseCase(home: homeImpl);
    Get.lazyPut(() => HomeController(seedsusecase: seedsUseCase, toolsusecase: toolsUseCase, plantsusecase: plantsUseCase,productsusecase: productsUseCase));

    // Profile
    ProfileRemoteDataSourceImpl dataSources=ProfileRemoteDataSourceImpl.getInstance();
    ProfileRepositoryImpl profileImpl=ProfileRepositoryImpl(impl:  dataSources);
    GetUserDataUseCase profileUseCase=GetUserDataUseCase(profile:  profileImpl);
    Get.lazyPut(() => ProfileController(profileusercase:profileUseCase ));


    // Forum
    ForumRemoteDataSourceImpl forumDataSources=ForumRemoteDataSourceImpl.getInstance();
    ForumRepositoryImpl forumImpl=ForumRepositoryImpl(remoteDataSource:  forumDataSources);
    GetAllForumsUseCase getAllForumsUseCase=GetAllForumsUseCase(repository: forumImpl);
    GetMyForumsUseCase getMyForumsUseCase=GetMyForumsUseCase(repository: forumImpl);
    PostForumsUseCase postForumsUseCase=PostForumsUseCase(repository: forumImpl);
    Get.lazyPut(() => ForumController(getallforum: getAllForumsUseCase,getmyforum: getMyForumsUseCase,postforum: postForumsUseCase));
  }

}