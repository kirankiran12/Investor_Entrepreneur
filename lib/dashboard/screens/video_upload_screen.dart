import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:investorentrepreneur/widget/custom_elevated_button.dart';
import 'package:investorentrepreneur/widget/custom_textformfield.dart';

class VideoUploadScreen extends StatefulWidget {
  const VideoUploadScreen({super.key});

  @override
  _VideoUploadScreenState createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends State<VideoUploadScreen> {
  String? _videoPath;
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _tagsController = TextEditingController();
  final String _category = 'Education'; // Default category

  Future<void> _pickUpVideo() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if(result != null){
      setState(() {
        _videoPath = result.files.single.path;
      });
    }
  }

  void _uploadVideo(){
    if(_videoPath == null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select a video to upload.')));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Video'),
        actions: [
          IconButton(
            icon: Icon(Icons.upload),
            onPressed: _uploadVideo,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video Upload Section
              GestureDetector(
                onTap: (){
                  _pickUpVideo();
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _videoPath == null
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.video_library, size: 50, color: Colors.grey),
                        SizedBox(height: 10),
                        Text('Tap to upload video', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  )
                      : Center(
                    child: Icon(Icons.check_circle, size: 50, color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Video Details Section
              CustomTextFormField(
                controller: _titleController,
                labelText: 'Title',
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                controller: _descController,
                labelText: 'Description',
                maxLines: 3,
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                controller: _tagsController,
                labelText: 'Tags (comma separated)',
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _category,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withValues(alpha: (0.3 * 255).toDouble())),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withValues(alpha: (0.3 * 255).toDouble())),
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withValues(alpha: (0.3 * 255).toDouble())),
                    )
                ),
                items: ['Education', 'Entertainment', 'Sports', 'Technology'].map((category){
                  return DropdownMenuItem(
                    value: category,
                      child: Text(category));
                }).toList(),
                onChanged: (value) {

                },
              ),
              SizedBox(height: 20),
              CustomElevatedButton(
                  onPressed: (){
                    _uploadVideo();
                  },
                  borderRadius: 6,
                  text: 'Upload Video'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
