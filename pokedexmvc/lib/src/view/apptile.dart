import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexmvc/src/view/uihelper.dart';

class AppTile extends StatefulWidget {
  const AppTile({super.key});

  @override
  State<AppTile> createState() => _AppTileState();
}

class _AppTileState extends State<AppTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pokedex',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                )),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Image(
                  image: const AssetImage('images/pokeball.png'),
                  width: 100.w,
                  height: 100.w,
                  fit: BoxFit.cover))
        ],
      ),
    );
  }
}
