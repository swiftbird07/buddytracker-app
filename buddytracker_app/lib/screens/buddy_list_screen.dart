// screens/buddy_list_screen.dart
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'package:logger/logger.dart';
import '../generated/l10n.dart';

// This screen displays a list of buddies with their status
class BuddyListScreen extends StatefulWidget {
  const BuddyListScreen({super.key});

  @override
  _BuddyListScreenState createState() => _BuddyListScreenState();
}

class _BuddyListScreenState extends State<BuddyListScreen> {
  ApiService api_service = ApiService();
  List<Map<String, dynamic>> buddies = [];
  List<Map<String, dynamic>> filteredBuddies = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  String errorMessage = '';
  var logger = Logger(
    printer: PrettyPrinter()
  );
  final s = S();

  @override
  void initState() {
    super.initState();
    fetchBuddies();
    searchController.addListener(() {
      filterBuddies();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchBuddies() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      var buddies = await api_service.getBuddiesWithStatus();
      // Check if 0 buddies are returned
      if (buddies.isEmpty) {
        setState(() {
          isLoading = false;
          errorMessage = s.noBuddiesFoundList;
        });
        return;
      }
      setState(() {
        this.buddies = buddies;
        this.filteredBuddies = buddies;
        isLoading = false;
      });
    } catch (e) {
      logger.e('$e');
      setState(() {
        isLoading = false;
        errorMessage = s.errorApiConnection;
      });
    }
  }

  void filterBuddies() {
    List<Map<String, dynamic>> temp = [];
    for (var buddy in buddies) {
      if (buddy['name'].toLowerCase().contains(searchController.text.toLowerCase()) ||
          buddy['status'].toLowerCase().contains(searchController.text.toLowerCase())) {
        temp.add(buddy);
      }
    }
    setState(() {
      filteredBuddies = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buddy List'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              fillColor: Colors.white,
              filled: true,
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchBuddies,
          ),
        ],
      ),
      body: isLoading
        ? const Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
        ? Center(
          child: Padding(
          padding: const EdgeInsets.all(20.0),  // Adds padding around the error message
          child: Text(
          errorMessage,
          style: const TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,  // Optional: To center-align the text
          ),
          )
          )
      : ListView.builder(
        itemCount: filteredBuddies.length,
        itemBuilder: (context, index) {
          var buddy = filteredBuddies[index];
          List<dynamic> activities = buddy['activities'] ?? ["No activities"];

          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            shadowColor: Colors.grey[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: buddy['avatar'] != null && buddy['avatar'].isNotEmpty
                            ? AssetImage(buddy['avatar'])
                            : null,
                        child: buddy['avatar'] == null || buddy['avatar'].isEmpty
                            ? Text(
                          buddy['name'][0],
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        )
                            : null,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          buddy['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 20,
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      buddy['status'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    height: 20,
                    thickness: 1,
                    color: Colors.grey[300],
                  ),
                  Wrap(
                    spacing: 8.0, // Gap between each chip
                    children: activities.map<Widget>((activity) {
                      return Chip(
                        label: Text(activity),
                        shape: StadiumBorder(),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}