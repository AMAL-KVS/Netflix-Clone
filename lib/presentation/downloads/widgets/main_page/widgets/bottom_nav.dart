import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifire = ValueNotifier(0);

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifire,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
            onTap: (index) {
              indexChangeNotifire.value = index;
            },
            currentIndex: newIndex,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: 'New & Hot'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.emoji_emotions,
                  ),
                  label: 'Fast Laughs'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Downloads')
            ]);
      },
    );
  }
}
