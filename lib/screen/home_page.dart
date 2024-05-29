import 'package:community_app/config/members.dart';
import 'package:community_app/widgets/reuse/member_details.dart';
import 'package:flutter/material.dart';

import '../widgets/detail_app_bar.dart';
import '../widgets/detail_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  bool isAppBarStretched = false;
  bool isSearchOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          DetailAppBar(
            scrollController: _scrollController,
          ),
          SliverVisibility(
              sliver: const DetailScreen(), visible: !isSearchOpen),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: isSearchOpen
                ? SizedBox(
                    height: 60,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              textAlign: TextAlign.start,
                              controller: textEditingController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(top: 2, left: 20),
                                fillColor:
                                    const Color.fromARGB(255, 233, 233, 235),
                                hintText: 'Search Member',
                                hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isSearchOpen = false;
                                textEditingController.clear();
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 26.0, right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Members',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Center(
                          child: IconButton(
                            iconSize: 22,
                            onPressed: () {
                              setState(() {
                                _scrollController.jumpTo(250.0);
                                //_collapseAppBar();
                                isSearchOpen = !isSearchOpen;
                              });
                            },
                            icon: const Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (members[index]['name']
                    .toLowerCase()
                    .contains(textEditingController.text.toLowerCase())) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: MemberDetails(idValue: index),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
              childCount: members.length,
            ),
          ),
        ],
      ),
    );
  }
}
