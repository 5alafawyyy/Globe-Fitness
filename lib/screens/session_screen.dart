import 'package:flutter/material.dart';
import 'package:pluralsight_course_1/data/session.dart';
import 'package:pluralsight_course_1/data/sp_helper.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List<Session> sessions = [];
  final TextEditingController descController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final SPHelper helper = SPHelper();

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Your Training Sessions',
        ),
      ),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSessionDialog(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      // bottomNavigationBar: const MenuBottomNav(),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: ((BuildContext context) {
        return AlertDialog(
          title: Text(
            'Insert Training Session',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                  ),
                ),
                TextField(
                  controller: durationController,
                  decoration: const InputDecoration(
                    hintText: 'Duration',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                descController.text = '';
                durationController.text = '';
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: saveSession,
              child: const Text('Save'),
            ),
          ],
        );
      }),
      barrierDismissible: false,
    );
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    int id = helper.getCounter() + 1;
    Session newSession = Session(
      id,
      today,
      descController.text,
      int.tryParse(durationController.text) ?? 0,
    );
    helper.writeSession(newSession).then((_) {
      updateScreen();
      helper.setCounter();
    });
    descController.text = '';
    durationController.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    for (var session in sessions) {
      tiles.add(
        Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {
            helper.deleteSession(session.id).then(
                  (_) => updateScreen(),
                );
          },
          child: ListTile(
            title: Text(
              session.description,
            ),
            subtitle: Text(
              '${session.date} - duration: ${session.duration} min',
            ),
          ),
        ),
      );
    }
    return tiles;
  }

  void updateScreen() {
    sessions = helper.getSessions();
    setState(() {});
  }
}
