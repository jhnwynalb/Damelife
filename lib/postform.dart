import 'package:flutter/material.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key});

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  String _audience = 'Public';
  final TextEditingController _postController = TextEditingController();

  dynamic _backgroundFill = Colors.grey.shade200;
  Color _textColor = Colors.black;

  final List<dynamic> _backgroundOptions = [
    Colors.white,
    const Color.fromARGB(255, 182, 182, 182),
    const Color.fromARGB(255, 82, 82, 82),
    const Color.fromARGB(255, 33, 33, 33),
    Colors.black,
    const Color.fromARGB(255, 187, 252, 178),
    const Color.fromARGB(255, 37, 82, 48),
    const Color.fromARGB(255, 1, 135, 1),
    const Color.fromARGB(255, 0, 64, 1),
    const Color.fromARGB(255, 0, 44, 7),
    const LinearGradient(
      colors: [
        Color.fromARGB(255, 1, 135, 1),
        Color.fromARGB(255, 0, 64, 1),
        Color.fromARGB(255, 0, 34, 5),
      ],
    ),
    const LinearGradient(
      colors: [
        Color.fromARGB(255, 182, 182, 182),
        Color.fromARGB(255, 82, 82, 82),
        Color.fromARGB(255, 33, 33, 33),
      ],
    ),
  ];

  final List<Color> _textColorOptions = [
    Colors.black,
    Colors.white,
  ];

  bool _showBackgroundColorPicker = false;
  bool _showTextColorPicker = false;

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Create Post',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 8),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 1, 135, 1),
                      Color.fromARGB(255, 0, 64, 1),
                      Color.fromARGB(255, 0, 34, 5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    print('Audience: $_audience');
                    print('Content: ${_postController.text}');
                    print('Background color: $_backgroundFill');
                    print('Text color: $_textColor');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: const Text(
                    'Post',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Juan Dela Cruz',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 120,
                            height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _audience,
                                isExpanded: true,
                                dropdownColor: Colors.white,
                                icon: const Icon(Icons.arrow_drop_down, size: 20, color: Colors.black),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Public',
                                    child: Row(
                                      children: [
                                        Icon(Icons.public, size: 18, color: Colors.black),
                                        SizedBox(width: 6),
                                        Text('Public', style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Friends',
                                    child: Row(
                                      children: [
                                        Icon(Icons.group, size: 18, color: Colors.black),
                                        SizedBox(width: 6),
                                        Text('Friends', style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Only Me',
                                    child: Row(
                                      children: [
                                        Icon(Icons.lock, size: 18, color: Colors.black),
                                        SizedBox(width: 6),
                                        Text('Only Me', style: TextStyle(fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                ],
                                onChanged: (val) {
                                  if (val != null) {
                                    setState(() => _audience = val);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Post Input
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: _backgroundFill is Color ? _backgroundFill : null,
                  gradient: _backgroundFill is LinearGradient ? _backgroundFill : null,
                ),
                child: TextField(
                  controller: _postController,
                  maxLines: 12,
                  minLines: 12,
                  decoration: const InputDecoration(
                    hintText: "Write something to post...",
                    hintStyle: TextStyle(fontSize: 16, color: Colors.black54),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.all(16),
                  ),
                  style: TextStyle(fontSize: 20, color: _textColor),
                ),
              ),

              const SizedBox(height: 30),
              const Divider(height: 20, thickness: 1),

              // Background Color Picker
              _buildToggleRow(
                icon: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 1, 135, 1),
                      Color.fromARGB(255, 0, 64, 1),
                      Color.fromARGB(255, 0, 34, 5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Icon(Icons.palette, color: Colors.white),
                ),
                label: 'Background Color',
                isExpanded: _showBackgroundColorPicker,
                onTap: () {
                  setState(() {
                    _showBackgroundColorPicker = !_showBackgroundColorPicker;
                    if (_showBackgroundColorPicker) _showTextColorPicker = false;
                  });
                },
              ),
              if (_showBackgroundColorPicker)
                _buildColorPickerRow(_backgroundOptions, (option) {
                  setState(() {
                    _backgroundFill = option;
                    _showBackgroundColorPicker = false;
                  });
                }),

              const Divider(height: 20, thickness: 1),

              // Text Color Picker
              _buildToggleRow(
                icon: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 50, 100, 255),
                      Color.fromARGB(255, 0, 80, 200),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Icon(Icons.format_color_text, color: Colors.white),
                ),
                label: 'Text Color',
                isExpanded: _showTextColorPicker,
                onTap: () {
                  setState(() {
                    _showTextColorPicker = !_showTextColorPicker;
                    if (_showTextColorPicker) _showBackgroundColorPicker = false;
                  });
                },
              ),
              if (_showTextColorPicker)
                _buildColorPickerRow(_textColorOptions, (color) {
                  if ((_backgroundFill == Colors.white && color == Colors.white) ||
                      (_backgroundFill == Colors.black && color == Colors.black)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Selected text color may be hard to read.")),
                    );
                  }

                  setState(() {
                    _textColor = color;
                    _showTextColorPicker = false;
                  });
                }),

              const Divider(thickness: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleRow({
    required Widget icon,
    required String label,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 78, 78, 78),
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorPickerRow(List options, void Function(dynamic) onSelect) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: options.map((option) {
            return GestureDetector(
              onTap: () => onSelect(option),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: option is Color ? option : null,
                  gradient: option is LinearGradient ? option : null,
                  border: Border.all(color: Colors.black12),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
