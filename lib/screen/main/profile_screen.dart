import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taba/screen/login/login_screen.dart';

import '../../../modules/orb/components/components.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  createState() => _ProfileScreen();
}

class _ProfileScreen extends ConsumerState<ProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return OrbScaffold(

//     );
//   }

// }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY PAGE'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              // 프로필 사진을 넣으세요. 예시로 placeholder 이미지를 사용했습니다.
            ),
            SizedBox(height: 10),
            Text(
              'leo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('프로필 편집'),
              onTap: () {
                // 프로필 편집 기능을 구현하세요.
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('설정'),
              onTap: () {
                // 설정 페이지로 이동하는 기능을 구현하세요.
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('로그아웃'),
              onTap: () {
                // 로그아웃 기능
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
