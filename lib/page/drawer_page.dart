import 'package:flutter/material.dart';
import 'package:open_git/bean/user_bean.dart';
import 'package:open_git/localizations/app_localizations.dart';
import 'package:open_git/manager/login_manager.dart';
import 'package:open_git/route/navigator_util.dart';

class DrawerPage extends StatelessWidget {
  final String name, email, headUrl;

  DrawerPage({this.name, this.email, this.headUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(name),
            accountEmail: new Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: new NetworkImage(this.headUrl),
            ),
            onDetailsPressed: () {
              UserBean userBean = LoginManager.instance.getUserBean();
              NavigatorUtil.goUserProfile(context, userBean);
            },
          ),
          new ListTile(
            title: new Text(AppLocalizations.of(context).currentlocal.trend),
            leading: new Icon(Icons.trending_up, color: Colors.grey),
            onTap: () {
              NavigatorUtil.goReposTrending(context, "all");
            },
          ),
          new ListTile(
            title: new Text(AppLocalizations.of(context).currentlocal.bookmark),
            leading: new Icon(Icons.bookmark, color: Colors.grey),
            onTap: () {
              NavigatorUtil.goBookMark(context);
            },
          ),
          new ListTile(
            title: new Text(AppLocalizations.of(context).currentlocal.setting),
            leading: new Icon(Icons.settings, color: Colors.grey),
            onTap: () {
              NavigatorUtil.goSetting(context);
            },
          ),
          new ListTile(
            title: new Text(AppLocalizations.of(context).currentlocal.about),
            leading: new Icon(Icons.info, color: Colors.grey),
            onTap: () {
              NavigatorUtil.goAppInfo(context);
            },
          ),
          new ListTile(
            title: new Text(AppLocalizations.of(context).currentlocal.share),
            leading: new Icon(Icons.share, color: Colors.grey),
            onTap: () {
              NavigatorUtil.goShare(context);
            },
          ),
          new ListTile(
            title: new Text(AppLocalizations.of(context).currentlocal.logout),
            leading: new Icon(Icons.power_settings_new, color: Colors.grey),
            onTap: () {
              NavigatorUtil.goLogout(context);
            },
          ),
        ],
      ),
    );
  }
}
