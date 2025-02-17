import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:investorentrepreneur/screen/massage/zoom_meeting.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String image;

  const ChatScreen({super.key, required this.name, required this.image});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = [
    {
      'isSender': 'true',
      'message': 'Hey! How are you?',
      'time': '2:30 PM',
      'image': 'assets/images/profile.jpeg',
    },
    {
      'isSender': 'false',
      'message': 'I am good! How about you?',
      'time': '2:31 PM',
      'image': 'assets/images/profileimage2.jpeg',
    },
  ];
  void _showInviteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    '14 April,friday',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Meeting Invite',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Date: ${DateTime.now().toLocal().toString().split(' ')[0]}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Time: 7:00 AM - 9:00 AM EST',
                    style: const TextStyle(fontSize: 14),
                  ),
                   const SizedBox(height: 5),
                  Text(
                    'Type: Zoom Meeting',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Join with Meeting Link:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Paste meeting link here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Accept Invite',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: const BorderSide(color: Colors.grey),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Reject Invite',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  final TextEditingController _messageController = TextEditingController();

  FlutterSoundRecorder? _audioRecorder;
  FlutterSoundPlayer? _audioPlayer;
  bool _isRecording = false;
  bool _isPlaying = false;
  String? _currentAudioPath;

  @override
  void initState() {
    super.initState();
    _audioRecorder = FlutterSoundRecorder();
    _audioPlayer = FlutterSoundPlayer();
    _initializeRecorder();
    _initializePlayer();
  }

  Future<void> _initializeRecorder() async {
    try {
      final microphonePermission = await Permission.microphone.request();
      final storagePermission = await Permission.storage.request();

      if (microphonePermission.isGranted && storagePermission.isGranted) {
        await _audioRecorder!.openRecorder();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Microphone and storage permissions are required!')),
        );
      }
    } catch (e) {
      debugPrint('Error initializing recorder: $e');
    }
  }

  Future<void> _initializePlayer() async {
    try {
      await _audioPlayer!.openPlayer();
    } catch (e) {
      debugPrint('Error initializing player: $e');
    }
  }

  @override
  void dispose() {
    if (_audioRecorder != null) {
      _audioRecorder!.closeRecorder();
    }
    if (_audioPlayer != null) {
      _audioPlayer!.closePlayer();
    }
    _audioRecorder = null;
    _audioPlayer = null;
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    if (_audioRecorder == null || _audioRecorder!.isRecording) return;

    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/audio_message.aac';

      await _audioRecorder!.startRecorder(
        toFile: filePath,
        codec: Codec.aacADTS,
      );

      setState(() {
        _isRecording = true;
        _currentAudioPath = filePath;
      });
      debugPrint('Recording started: $filePath');
    } catch (e) {
      debugPrint('Error starting recorder: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error starting recorder: $e')),
      );
    }
  }

  Future<void> _stopRecording() async {
    if (_audioRecorder == null || !_audioRecorder!.isRecording) return;

    try {
      final filePath = await _audioRecorder!.stopRecorder();

      setState(() {
        _isRecording = false;
        if (filePath != null) {
          _messages.add({
            'isSender': 'true',
            'message': 'Audio Message',
            'time': TimeOfDay.now().format(context),
            'image': 'assets/images/profile.jpeg',
            'audio': filePath,
          });
          debugPrint('Recording stopped: $filePath');
        }
      });
    } catch (e) {
      debugPrint('Error stopping recorder: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error stopping recorder: $e')),
      );
    }
  }

  Future<void> _playAudio(String filePath) async {
    if (_audioPlayer == null || _isPlaying) return;

    try {
      await _audioPlayer!.startPlayer(
        fromURI: filePath,
        codec: Codec.aacADTS,
        whenFinished: () {
          setState(() {
            _isPlaying = false;
          });
        },
      );

      setState(() {
        _isPlaying = true;
      });
    } catch (e) {
      debugPrint('Error playing audio: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error playing audio: $e')),
      );
    }
  }

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'isSender': 'true',
          'message': _messageController.text.trim(),
          'time': TimeOfDay.now().format(context),
          'image': 'assets/images/profile.jpeg',
        });
        _messageController.clear();
      });
    }
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          IconButton(
            color: Colors.blue,
            icon: const Icon(Icons.add, color: Colors.grey),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Type a message....',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: _sendMessage,
          ),
          GestureDetector(
            onLongPress: _startRecording,
            onLongPressUp: _stopRecording,
            child: Icon(
              _isRecording ? Icons.stop : Icons.keyboard_voice,
              color: _isRecording ? Colors.red : Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(Map<String, String> message, bool isSender) {
    final image = message['image'] ?? 'assets/images/default_profile.png';
    final msg = message['message'] ?? '';
    final time = message['time'] ?? '';
    final audioPath = message['audio'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment:
            isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSender)
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(image),
            ),
          if (!isSender) const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                 GestureDetector(
                  onTap: isSender ? _showInviteDialog : null,
                child: Row(
                  mainAxisAlignment: isSender
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    Text(
                      isSender ? 'You' : widget.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      time,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                  ) ),
                const SizedBox(height: 5),
                if (audioPath != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: isSender ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _playAudio(audioPath);
                          },
                          child: Icon(
                            _isPlaying ? Icons.pause_circle : Icons.play_circle,
                            size: 30,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          //  child: VoiceProgressBar(),
                          child: LinearProgressIndicator(
                            value: _isPlaying ? 0.5 : 0.0,
                            color: Colors.blue,
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _isPlaying ? "0:15" : "0:00",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: isSender ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      msg,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
              ],
            ),
          ),
          if (isSender) const SizedBox(width: 10),
          if (isSender)
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(image),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, screenWidth),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isSender = message['isSender'] == 'true';
                  return _buildMessageTile(message, isSender);
                },
              ),
            ),
            _buildInputField(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double screenWidth) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(widget.image),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Last online 5 min ago',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              _showBottomSheet(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.video_call, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.videocam, color: Colors.blue),
                title: const Text("Zoom Meeting"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateZoomMeeting()),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.video_call, color: Colors.green),
                title: const Text("FaceTime"),
                onTap: () {},
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.phone, color: Colors.orange),
                title: const Text("Dial-In Zoom Meeting"),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
