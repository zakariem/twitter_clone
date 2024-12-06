import 'package:appwrite/appwrite.dart';
import 'package:appwrite_toturial/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appwriteClientProvider = Provider((ref) {
  Client client = Client();
  return client
      .setEndpoint(AppwriteConstants.endPoint)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(status: true);
});

final appwriteAccountProvider =
    Provider((ref) => Account(ref.watch(appwriteClientProvider)));
