import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({
    Key? key,
  }) : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  int _columnCount = 2;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${_scrollController.hasClients ? _scrollController.position.pixels.toInt().toString() : 0} pixels'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'grid_on',
              onPressed: () {
                if (_columnCount < 3) {
                  setState(() {
                    _columnCount++;
                  });
                }
              },
              child: Icon(
                Icons.grid_on,
                color: Colors.white,
              )),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
              heroTag: 'grid_off',
              onPressed: () {
                if (_columnCount > 2) {
                  setState(() {
                    _columnCount--;
                  });
                }
              },
              child: Icon(
                Icons.grid_off,
                color: Colors.white,
              )),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
              heroTag: 'arrow_upward',
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: Duration(milliseconds: 600),
                  curve: Curves.easeInQuint,
                );
              },
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              )),
        ],
      ),
      body: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _columnCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => Container(
            color: Colors.black,
            child: Center(
                child: Text(index.toString(),
                    style: TextStyle(
                      fontSize: 42,
                      color: Colors.white,
                    )))),
      ),
    );
  }
}
