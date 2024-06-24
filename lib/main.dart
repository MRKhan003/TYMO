import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tyamo/Controller/userController/user_controller.dart';
import 'package:tyamo/Views/Auth/SplashScreen/splash.dart';
import 'package:tyamo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Tyamo());
}

class Tyamo extends StatelessWidget {
  const Tyamo({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => user_controller(),
        ),
      ],
      child: ResponsiveSizer(
        builder: (Context, Orientation, ScreenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Tyamo',
            //home: LogIn(),
            //home: Registration(),
            //home: PasswordReset(),
            //home: ProfileSetup(),
            //home: FriendInvitaion(),
            //home: InviteFriend(),
            //home: HomePage(),
            //home: MyDashboard(),
            //home: myProfile(),
            //home: myProfileSeter(),
            //home: myDeviceinfo(),
            //home: userActivity(),
            //home: myGallery(),
            //home: SplashAnimator(),
            home: splashScreen(),
          );
        },
      ),
    );
  }
}
