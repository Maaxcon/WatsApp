import 'package:flutter/material.dart';
import '../tabs/chat_tab.dart';
import '../tabs/status_tab.dart';
import '../tabs/calls_tab.dart';
import '../utils/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: ColorConstants.colorPrimaryDark,
              title: const Text('WhatsApp', style: TextStyle(color: ColorConstants.colorWhite)),
              pinned: true,
              floating: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.search, color: ColorConstants.colorWhite),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: ColorConstants.colorWhite),
                  onPressed: () {},
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: ColorConstants.colorWhite,
                labelColor: ColorConstants.colorWhite,
                unselectedLabelColor: Colors.white70,
                tabs: const [
                  Tab(text: 'CHATS'),
                  Tab(text: 'STATUS'),
                  Tab(text: 'CALLS'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            ChatTab(),
            StatusTab(),
            CallsTab(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    if (_tabController.index == 0) {
      return FloatingActionButton(
        backgroundColor: ColorConstants.colorAccent,
        onPressed: () {},
        child: const Icon(Icons.message, color: ColorConstants.colorWhite),
      );
    } else if (_tabController.index == 1) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            backgroundColor: ColorConstants.colorE4E6EB,
            onPressed: () {},
            child: const Icon(Icons.edit, color: ColorConstants.colorBlack),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            backgroundColor: ColorConstants.colorAccent,
            onPressed: () {},
            child: const Icon(Icons.camera_alt, color: ColorConstants.colorWhite),
          ),
        ],
      );
    } else {
      return FloatingActionButton(
        backgroundColor: ColorConstants.colorAccent,
        onPressed: () {},
        child: const Icon(Icons.add_call, color: ColorConstants.colorWhite),
      );
    }
  }
}