import 'package:community_app/config/colors.dart';

import 'package:flutter/material.dart';

import 'reuse/button_class.dart';

class DetailAppBar extends StatefulWidget {
  final ScrollController scrollController;
  const DetailAppBar({super.key, required this.scrollController});

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  bool isAppBarCollapsed = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (widget.scrollController.hasClients) {
      setState(() {
        isAppBarCollapsed = widget.scrollController.offset >= 240;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: primaryColor,
      expandedHeight: 300,
      pinned: true,
      snap: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
          expandedTitleScale: 1.5,
          titlePadding: const EdgeInsets.only(left: 48, bottom: 20, top: 25),
          centerTitle: false,
          title: isAppBarCollapsed
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: CircleAvatar(
                          radius: 30,
                          foregroundImage: Image.asset(
                            'assets/images/bg.png',
                            fit: BoxFit.contain,
                          ).image,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The weeknd',
                          style: TextStyle(
                            color: headingColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Community • +11K Members',
                          style: TextStyle(
                            color: headingColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The weeknd',
                          style: TextStyle(
                            color: headingColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Community • +11K Members',
                          style: TextStyle(
                            color: headingColor,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: SizedBox(
                        width: 28,
                        height: 28,
                        child: IconButton.outlined(
                          iconSize: 12,
                          onPressed: () {},
                          icon: const Icon(Icons.share_outlined),
                          color: Colors.white,
                          style: const ButtonStyle(
                            side: MaterialStatePropertyAll(
                                BorderSide(color: Colors.white)),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          background: Image.asset(
            'assets/images/bg.png',
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
          stretchModes: const [
            StretchMode.blurBackground,
            StretchMode.zoomBackground,
            StretchMode.fadeTitle
          ]),
      leading: IconButton(
        color: Colors.white,
        onPressed: () {},
        tooltip: 'Back',
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [
        isAppBarCollapsed
            ? IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      showDragHandle: true,
                      enableDrag: true,
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ButtonIcon(
                                colorValue: 0,
                                iconFile: Icons.link,
                                iconName: "Invite",
                              ),
                              ButtonIcon(
                                colorValue: 0,
                                iconFile: Icons.person_add_alt_1_sharp,
                                iconName: "Add Member",
                              ),
                              ButtonIcon(
                                colorValue: 0,
                                iconFile: Icons.groups_3,
                                iconName: "Add Group",
                              ),
                            ],
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.more_vert),
                color: Colors.white,
              )
            : Container()
      ],
    );
  }
}
