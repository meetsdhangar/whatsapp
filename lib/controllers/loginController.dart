import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp/model/chatuserModel.dart';
import 'package:whatsapp/screens/addnewuser.dart';

import 'package:whatsapp/screens/homeScreen.dart';
import 'package:whatsapp/screens/loginScreen.dart';

import 'package:whatsapp/screens/otpScreen.dart';
import 'package:image/image.dart' as img;

class Logincontroller extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  RxString verId = ''.obs;
  Rx<ChatUser?> loginuser = Rx<ChatUser?>(null);

  Future<bool> checkuser() async {
    return (await firestore
            .collection('users')
            .doc('${auth.currentUser?.phoneNumber}')
            .get())
        .exists;
  }

  checkuserlogin() {
    var user = auth.currentUser;
    if (user == null) {
      Get.offAll(() => login());
    } else {
      //Get.offAll(() => chatpage());
      getUsersData().then((value) => Get.offAll(() => HomeScreen()));
    }
  }

  userlogout() {
    auth.signOut();
    updateActiveStatus(false);
    Get.offAll(() => login());
  }

  verifyphonenumber(contrycode, mobilenumber, context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "${contrycode + mobilenumber}",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid Mobile number")));
        } else {
          print('error');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        verId.value = verificationId;
      },
      timeout: const Duration(seconds: 120),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => otp(),
        ),
        (route) => false);
  }

  verifyotp(code) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verId.value, smsCode: code);
      await auth
          .signInWithCredential(credential)
          .then((auth) => checkuser().then((check) {
                if (check == true) {
                  getUsersData()
                      .then((value) => Get.offAll(() => HomeScreen()));
                  // Get.to(() => HomeScreen());
                } else {
                  Get.to(() => AddNewUserScreen());
                }
              }));
    } catch (e) {
      log(e.toString());
    }
  }

  RxString selectedProfile = ''.obs;
  pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      selectedProfile.value = image.path;
      return image.path;
    }
  }

  // if image not selected add asset default image
  Future<File> assetImageToFile(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    var bytes = data.buffer.asUint8List();
    img.Image? image = img.decodeImage(Uint8List.fromList(bytes));
    int quality = 90;
    img.Image compressedImage = img.copyResize(image!,
        width: image.width,
        height: image.height,
        interpolation: img.Interpolation.linear);
    List<int> compressedBytes =
        img.encodeJpg(compressedImage, quality: quality);
    File file = File('${(await getTemporaryDirectory()).path}/temp_image.jpg');
    await file.writeAsBytes(compressedBytes);

    return file;
  }

  Future<String> storeDataInStorage(String ref, File myfile) async {
    print(myfile);
    UploadTask task = storage.ref().child(ref).putFile(myfile);
    TaskSnapshot taskSnapshot = await task;
    String url = await taskSnapshot.ref.getDownloadURL();
    print(url);
    return url;
  }

  Future<String> uploadImageToFirebase(File imageFile) async {
    String fileName = 'image1';
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/$fileName');
    UploadTask uploadTask = storageReference.putFile(imageFile);

    await uploadTask.whenComplete(() => print('Image uploaded'));

    String imageUrl = await storageReference.getDownloadURL();
    return imageUrl;
  }

  addnewuser(String name, File myfile) async {
    print(myfile.path);
    await storeDataInStorage(
            'profieImages/${auth.currentUser?.phoneNumber.toString()}', myfile)
        .then((url) {
      final time = DateTime.now().millisecondsSinceEpoch.toString();
      final user = ChatUser(
          isActive: false,
          lastSeen: time,
          phone: '${auth.currentUser?.phoneNumber}',
          profile: url,
          about: 'Hey there, I am using whatsapp',
          name: name,
          createdAt: time,
          id: '${auth.currentUser?.phoneNumber}');

      loginuser.value = user;

      firestore
          .collection('users')
          .doc('${auth.currentUser?.phoneNumber}')
          .set(user.toMap())
          .then((value) => Get.offAll(HomeScreen()));
      selectedProfile.value = '';
    });
  }

  Future<bool> getUsersData() async {
    await firestore
        .collection('users')
        .doc('${auth.currentUser?.phoneNumber}')
        .get()
        .then((DocumentSnapshot snapshot) => loginuser.value = ChatUser(
            isActive: snapshot['is_active'],
            lastSeen: snapshot['last_seen'],
            phone: snapshot['phone'],
            profile: snapshot['profile'],
            about: snapshot['about'],
            name: snapshot['name'],
            createdAt: snapshot['created_at'],
            id: snapshot['id']));

    return true;
  }

  updateUserData(String username, String userabout, String image) async {
    var time = DateTime.now().millisecondsSinceEpoch.toString();

    await firestore
        .collection('users')
        .doc('${auth.currentUser?.phoneNumber}')
        .update({'name': username, 'about': userabout, 'profile': image}).then(
            (value) {
      getUsersData().then((value) {
        Get.back();
        selectedProfile.value = '';
      });
    });
  }

  updateActiveStatus(status) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    await firestore
        .collection('users')
        .doc(loginuser.value?.id)
        .update({'is_active': status, 'last_seen': time});
  }

  giveSpecificUser() {
    firestore.collection('users').doc('${auth.currentUser?.phoneNumber}').get();
  }
}
