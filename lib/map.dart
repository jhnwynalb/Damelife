import 'package:flutter/material.dart';
import 'menu_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class Building {
  final int id;
  final String name;
  final String imagePath;
  final List<String> rooms;
  final String subtitle;
  final List<String> fac;
  Building({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.rooms,
    required this.fac,
    required this.subtitle,
  });
}

class _MapPageState extends State<MapPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<Building> _buildings = [
    Building(
      id: 25,
      name: "OMER BUILDING",
      imagePath: 'assets/omer.jpg',
      rooms: ['1002', '1004', '1006', '1008', '1010', '2002', '2004', '2006', '2008', '2010'],
      fac: ["Smart Laboratory", "EE/ECE/CPE Laboratory", "CE Laboratory", "Biology Laboratory", "Chemistry Laboratory, CEAC Guidance Center"],
      subtitle: "Bro. Louis Omer Dupres Hall",
    ),
    Building(
      id: 28,
      name: "TESTON BUILDING",
      imagePath: 'assets/teston.jpg',
      rooms: ['1001', '1003', '1005', '1007', '1009', '2001', '2003','2005', '2007', '2009'],
      fac: ["Physics Laboratory", "CE Laboratory", "Computer Laboratory", "Drafting Studio", "Architects Studio"],
      subtitle: "Bro. Joseph Damian Teston Hall",
    ),
    Building(
      id: 18,
      name: "DUMONT BUILDING",
      imagePath: 'assets/dumont.jpg',
      rooms: ["Dumont 01","Dumont 02", "Dumont 03", "Dumont 04", "Dumont 05", "Dumont 06",],
      fac: ["CBA Faculty", "CBA Guidance Center", "PEC Office", "QUAPS Office", "Psychology Laboratory"],
      subtitle: "Bro. Herbert Daniel Dumont Hall",
    ),
    Building(
      id: 17,
      name: "DOHERTY BUILDING",
      imagePath: 'assets/doherty.jpg',
      rooms: ["110","112", "114", "116", "118", "120","122", "210","212", "214", "216", "218", "220","220"],
      fac: ["Criminology Laboratory", "Medtech Demo Rooms", "Nursing Demo Rooms"],
      subtitle: "Bro. James Maurus Doherty Hall",
    ),
    Building(
      id: 11,
      name: "SLR BUILDING",
      imagePath: 'assets/slr.jpg',
      rooms: ["SLR 01", "SLR 02", "SLR 03", "SLR 04"],
      fac: ["AVR 1", "AVR 2", "Nursing Faculty", "Mini Hospital", "Moth Court", "Law School Faculty",],
      subtitle: "San Lorenzo Ruiz Hall",
    ),
      Building(
      id: 1,
      name: "Main School Entrance",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 2,
      name: "Kobe Building",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 3,
      name: "Dianostic Laboratory",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 4,
      name: "Marian Commercial Building",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 5,
      name: "Chaplain Office",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 6,
      name: "St. Marcellin Champagnat Chapel",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 7,
      name: "CMRE Building",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 8,
      name: "GATE-3(EXIT)",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 9,
      name: "SLR POWERHOUSE Generator Set",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 10,
      name: "ADMINISTRATION Building",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 12,
      name: "BRO. RENATO B. CRUZ HALL",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 13,
      name: "UNIVERSITY CANTEEN",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 14,
      name: "MArist Brother's Convent",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 15,
      name: "MArist House Parking Area",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 16,
      name: "MDFI Commercial Building",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 19,
      name: "HM KITCHEN LAB",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 20,
      name: "NDMU MINI HOTEL",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 21,
      name: "CANTEN 4 & 5",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 22,
      name: "COLLEGE OF BUSINESS & ADMINISTRATION LOUNGE",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 23,
      name: "ROTC OFFICE",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 24,
      name: "SOIL LABORATORY",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 26,
      name: "SAINT MARCELLIN CHAMPAGNAT HALL",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 27,
      name: "COLLEGE OF ENGINEERING FACULTY LOUNGE",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 29,
      name: "PHYSICAL PLANT OFFICE",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 30,
      name: "PHYSICAL PLANT WORKING AREA",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 31,
      name: "PHYSICAL PLANT PAINTING WORKING AREA",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 32,
      name: "DRIVING ROOM",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 33,
      name: "POWER HOUSE GENNERATOR SET",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 34,
      name: "GARAGE",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 35,
      name: "TECHNICAL-VOCATIONAL LABORATORY",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 36,
      name: "CHAPAGNAT COMMUNITY COLLEGE",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 37,
      name: "UNIVERSITY GYMNASIUM",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 38,
      name: "KIOSK",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 39,
      name: "UNIVERSITY LIBRARY",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 40,
      name: "CANTEEN 1,2 & 3",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 41,
      name: "COMFORT ROOM MALE & FEMALE",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 42,
      name: "BRO.XAVIER CREEGAN HALL",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 43,
      name: "GAHD OFFICE/PSYCH LAB",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
    Building(
      id: 44,
      name: "OND SISTER'S CONVENT",
      imagePath: 'assets/nophoto.jpg',
      rooms: [],
      fac: [],
      subtitle: "",
    ),
  ];

  Building? _selectedBuilding;
  bool _showDetails = false;
  List<Building> _filteredSuggestions = [];

  void _searchBuilding(String query) {
    final match = _buildings.firstWhere(
      (b) => b.name.toLowerCase() == query.toLowerCase(),
      orElse: () => Building(id: -1, name: '', imagePath: '', rooms: [], subtitle: "", fac: []),
    );

    if (match.id != -1) {
      setState(() {
        _selectedBuilding = match;
        _showDetails = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Row(
            children: [
              if (match.imagePath.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    match.imagePath,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Found: ${match.name}',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Row(
            children: [
              Image.asset(
                'assets/warning.png',
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Building not found: "$query"',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _onSearchChanged(String input) {
    setState(() {
      if (input.isNotEmpty) {
        _filteredSuggestions = _buildings
            .where((b) => b.name.toLowerCase().contains(input.toLowerCase()))
            .toList();
      } else {
        _filteredSuggestions.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const menu())),
            icon: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(31, 0, 0, 0),),
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 2))],
            ),
          ),
          toolbarHeight: 50,
          title: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Colors.green, Color.fromARGB(255, 0, 53, 9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Text(
              'Campus Map',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Interactive Map
          Positioned.fill(
            top: 80,
            child: InteractiveViewer(
              panEnabled: true,
              boundaryMargin: const EdgeInsets.all(80),
              minScale: 1.5,
              maxScale: 3,
              child: Center(
                child: Image.asset('assets/ndmu_map.jpg', fit: BoxFit.contain),
              ),
            ),
          ),

          // Search Bar
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                border: Border.all(color: Colors.green[900]!, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                onSubmitted: _searchBuilding,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.location_pin, color: Colors.grey),
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),

          // Suggestion List
          if (_filteredSuggestions.isNotEmpty)
            Positioned(
              top: 75,
              left: 10,
              right: 10,
              child: Container(
                constraints: const BoxConstraints(maxHeight: 200),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
                ),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: _filteredSuggestions.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final b = _filteredSuggestions[index];
                    return ListTile(
                      leading: const Icon(Icons.history, color: Colors.grey),
                      title: Text(b.name, style: const TextStyle(fontSize: 16)),
                      subtitle: const Text('NDMU Campus', style: TextStyle(color: Colors.grey)),
                      onTap: () {
                        _searchController.text = b.name;
                        _searchBuilding(b.name);
                        setState(() => _filteredSuggestions.clear());
                      },
                    );
                  },
                ),
              ),
            ),

          // Draggable Bottom Sheet for Building Details
          if (_showDetails && _selectedBuilding != null)
            Positioned.fill(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: DraggableScrollableSheet(
                  initialChildSize: 0.45,
                  minChildSize: 0.3,
                  maxChildSize: 0.9,
                  builder: (context, scrollController) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 5,
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              controller: scrollController,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (bounds) => const LinearGradient(
                                        colors: [Color(0xFF018701), Color(0xFF004001), Color(0xFF002205)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ).createShader(bounds),
                                      child: const Icon(Icons.location_pin, size: 30, color: Colors.white),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '${_selectedBuilding!.id}.',
                                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      _selectedBuilding!.name,
                                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _selectedBuilding!.subtitle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Divider(height: 40, thickness: 1),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    _selectedBuilding!.imagePath,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 15),

                                const Text(
                                  "Rooms:",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Wrap(
                                  spacing: 10,
                                  children: _selectedBuilding!.rooms.map(
                                    (room) => Chip(
                                      label: Text(
                                        room,
                                        style: TextStyle(color: Colors.green[900]),
                                      ),
                                      backgroundColor: Colors.grey[200],
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ).toList(),
                                ),

                                const SizedBox(height: 20),

                                const Text(
                                  "Facilities:",
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Wrap(
                                  spacing: 10,
                                  children: _selectedBuilding!.fac.map(
                                    (facility) => Chip(
                                      label: Text(
                                        facility,
                                        style: TextStyle(color: Colors.green[900]),
                                      ),
                                      backgroundColor: Colors.green[50],
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ).toList(),
                                ),

                                const SizedBox(height: 80), // Spacer for button
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.green[900],
                                side: BorderSide(color: Colors.green[900]!),
                              ),
                              onPressed: () => setState(() => _showDetails = false),
                              child: const Text("Close"),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
