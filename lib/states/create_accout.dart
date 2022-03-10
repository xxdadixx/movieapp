import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/utility/app_constant.dart';
import 'package:movie_app/utility/app_dialog.dart';
import 'package:movie_app/widgets/show_image.dart';
import 'package:movie_app/widgets/show_progress.dart';
import 'package:movie_app/widgets/show_title.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateaAccountState();
}

class _CreateaAccountState extends State<CreateAccount> {
  bool statusRedEye = true;
  String avatar = '';
  File? file;
  double? lat, lng;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: [
          buildCreateNewAccount(),
        ],
        title: Text('Sign Up'),
        backgroundColor: AppConstant.primary,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitle('General Information'),
                buildName(size),
                buildEmail(size),
                buildTitle('Basic information'),
                buildAvatar(size),
                buildUserID(size),
                buildPassword(size),
                buildPhonenumber(size),
                buildAddress(size),
                buildTitle('Show your location coordinates'),
                buildMap(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildCreateNewAccount() {
    return IconButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          if (buildName == null) {
          } else {
            print('Process Insert to Database');
            uploadPictureAndInsertData();
          }
        }
      },
      icon: Icon(Icons.cloud_upload),
    );
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: AppConstant().h3Style(),
              labelText: 'Enter your name and lastname',
              prefixIcon: Icon(
                Icons.info_outline,
                color: AppConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildEmail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: AppConstant().h3Style(),
              labelText: 'Enter your email',
              prefixIcon: Icon(
                Icons.mail_outline,
                color: AppConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAddress(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            controller: addressController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your address';
              } else {}
            },
            maxLines: 2,
            decoration: InputDecoration(
              hintText: 'Enter you address',
              helperStyle: AppConstant().h3Style(),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: Icon(
                  Icons.home_outlined,
                  color: AppConstant.dark,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPhonenumber(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: AppConstant().h3Style(),
              labelText: 'Enter your phone number',
              prefixIcon: Icon(
                Icons.phone_outlined,
                color: AppConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUserID(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            controller: userController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your user id';
              } else {}
            },
            decoration: InputDecoration(
              labelStyle: AppConstant().h3Style(),
              labelText: 'Enter your user id',
              prefixIcon: Icon(
                Icons.account_circle_outlined,
                color: AppConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              } else {}
            },
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(
                        Icons.remove_red_eye,
                        color: AppConstant.dark,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppConstant.dark,
                      ),
              ),
              labelStyle: AppConstant().h3Style(),
              labelText: 'Enter your password',
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: AppConstant.dark,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.dark),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () => chooseImage(ImageSource.camera),
          icon: Icon(Icons.add_a_photo),
          color: AppConstant.dark,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: file == null
              ? ShowImage(path: AppConstant.avatar)
              : Image.file(file!),
        ),
        IconButton(
          onPressed: () => chooseImage(ImageSource.gallery),
          icon: Icon(Icons.add_photo_alternate),
          color: AppConstant.dark,
        ),
      ],
    );
  }

  Set<Marker> setMarker() => <Marker>[
        Marker(
          markerId: MarkerId('id'),
          position: LatLng(lat!, lng!),
          infoWindow: InfoWindow(
              title: 'Your current location',
              snippet: 'Lat = $lat, lng = $lng'),
        ),
      ].toSet();

  Widget buildMap() => Container(
        width: double.infinity,
        height: 300,
        child: lat == null
            ? ShowProgress()
            : GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat!, lng!),
                  zoom: 16,
                ),
                onMapCreated: (contrller) {},
                markers: setMarker(),
              ),
      );

  Future<Null> uploadPictureAndInsertData() async {
    String email = emailController.text;
    String name = nameController.text;
    String address = addressController.text;
    String phone = phoneController.text;
    String user = userController.text;
    String password = passwordController.text;
    print(
        '## name = $name, email = $email, address = $address, phone = $phone, user = $user, password = $password');
    String path =
        '${AppConstant.domain}/movieapp/getUserWhereUser.php?isAdd=true&user=$user';
    await Dio().get(path).then((value) async {
      print('## value = $value');
      if (value.toString() == 'null') {
        print('## user OK');

        if (file == null) {
          //no picture
          processInsertMySQL(
            email: email,
            name: name,
            address: address,
            phone: phone,
            user: user,
            password: password,
          );
        } else {
          //have picture
          print('## process upload');
          String apiSaveAvatar =
              '${AppConstant.domain}/movieapp/saveAvatar.php';
          int i = Random().nextInt(100000);
          String nameAvatar = 'avatar$i.jpg';
          Map<String, dynamic> map = Map();
          map['file'] =
              await MultipartFile.fromFile(file!.path, filename: nameAvatar);
          FormData data = FormData.fromMap(
            map,
          );
          await Dio().post(apiSaveAvatar, data: data).then((value) {
            avatar = '/movieapp/avatar/$nameAvatar';
            processInsertMySQL(
              email: email,
              name: name,
              address: address,
              phone: phone,
              user: user,
              password: password,
            );
          });
        }
      } else {
        AppDiaLog()
            .normalDialog(context, 'User False?', 'Please use another user id');
      }
    });
  }

  Future<Null> processInsertMySQL(
      {String? email,
      String? name,
      String? address,
      String? phone,
      String? user,
      String? password}) async {
    print('## process work and avatar = $avatar');
    String apiInsertUser =
        '${AppConstant.domain}/movieapp/insertUser.php?isAdd=true&name=$name&email=$email&avatar=$avatar&user=$user&password=$password&phone=$phone&address=$address&lat=$lat&lng=$lng';
    await Dio().get(apiInsertUser).then((value) => {
          if (value.toString() == 'true')
            {Navigator.pop(context)}
          else
            {
              AppDiaLog().normalDialog(
                  context, 'Create new user false', 'Please try again')
            }
        });
  }

  Future<Null> findLatLng() async {
    print('findLatLan ==> Work');
    Position? position = await findPosition();
    setState(() {
      lat = position!.latitude;
      lng = position.longitude;
      print('lat = $lat, lng=$lng');
    });
  }

  Future<Position?> findPosition() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

  Future<Null> chooseImage(ImageSource source) async {
    try {
      var result = await ImagePicker()
          .getImage(source: source, maxWidth: 800, maxHeight: 800);
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {}
  }

  Future<Null> checkPermission() async {
    bool locationService;
    LocationPermission locationPermission;

    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print('Service Location Open');

      locationPermission = await Geolocator.checkPermission();
      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if (locationPermission == LocationPermission.deniedForever) {
          AppDiaLog().alertLocationService(
              context,
              'Location sharing is not allowed',
              'Please turn on location service');
        } else {
          ///
          findLatLng();
        }
      } else {
        if (locationPermission == LocationPermission.deniedForever) {
          AppDiaLog().alertLocationService(
              context,
              'Location sharing is not allowed',
              'Please turn on location service');
        } else {
          ///
          findLatLng();
        }
      }
    } else {
      print('Service Location Close');
      AppDiaLog().alertLocationService(context, 'Location service is close',
          'Please turn on location service');
    }
  }

  Container buildTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: AppConstant().h2Style(),
      ),
    );
  }
}
