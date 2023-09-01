import 'package:bhagvad_gita_copy/modal/gita_modal.dart';
import 'package:bhagvad_gita_copy/modal/slok_modal.dart';
import 'package:bhagvad_gita_copy/utils/api_helper.dart';
import 'package:get/get.dart';

class Gitacontroller extends GetxController
{
  RxList<Gitamodal> adhaylist=<Gitamodal>[].obs;
  RxList<Slokmodal> sloklist=<Slokmodal>[].obs;
  RxInt pageindex =0.obs;
  Future<List<Gitamodal>> load_Adhayapi()
  async {
    return await Apihelper.api.gita_Adhay_Api();
  }

  Future<void> load_Slok(String id)
  async {
    sloklist.value=await Apihelper.api.gita_Slok_Api("$id");
  }
}