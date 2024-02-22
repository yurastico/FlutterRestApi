
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:study_rest/model/repo_unique.dart';
import 'package:study_rest/rest/rest_client.dart';

class UniqueController extends GetxController with StateMixin<RepoUnique> { 
  final RestClient _apiProvider = Get.find<RestClient>();

  void getRepoUnique(String user,String repo) { 
    change(null,status: RxStatus.loading());
    _apiProvider.getRepoUnique(user, repo).then((response) { 
      change(response,status: RxStatus.success());
    },onError: (error) { 
      change(null,status: RxStatus.error(error.toString()));
    });
  }



}