import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../data/repositories/men_posts_repository.dart';
import '../../providers/repositories_provider.dart';
import '../../providers/men_posts_provider.dart';
import '../../../core/utils/validators.dart';

final createMenPostProvider =
    StateNotifierProvider.autoDispose<CreateMenPostNotifier, AsyncValue<void>>(
        (ref) => CreateMenPostNotifier(ref.watch(menPostsRepositoryProvider)));

class CreateMenPostNotifier extends StateNotifier<AsyncValue<void>> {
  final MenPostsRepository _repository;

  CreateMenPostNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> createPost({
    required String fullName,
    required String city,
    required String caption,
    List<String>? tags,
    String? imagePath,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _repository.createMenPost(
        fullName: fullName,
        city: city,
        caption: caption,
        tags: tags,
        imagePath: imagePath,
      );
      state = const AsyncValue.data(null);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}

class CreateMenPostScreen extends ConsumerStatefulWidget {
  const CreateMenPostScreen({super.key});

  @override
  ConsumerState<CreateMenPostScreen> createState() => _CreateMenPostScreenState();
}

class _CreateMenPostScreenState extends ConsumerState<CreateMenPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _cityController = TextEditingController();
  final _captionController = TextEditingController();
  final _tagsController = TextEditingController();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _checkForContactInfo() {
    final caption = _captionController.text;
    final phoneRegex = RegExp(r'\b\d{3}[-.]?\d{3}[-.]?\d{4}\b');
    final emailRegex = RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
    
    if (phoneRegex.hasMatch(caption) || emailRegex.hasMatch(caption)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Warning'),
          content: const Text('We detected potential contact information in your caption. Please remove it for safety.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  Future<void> _submitPost() async {
    if (_formKey.currentState!.validate()) {
      _checkForContactInfo();
      
      final tags = _tagsController.text.trim().isEmpty
          ? <String>[]
          : _tagsController.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();

      await ref.read(createMenPostProvider.notifier).createPost(
            fullName: _fullNameController.text.trim(),
            city: _cityController.text.trim(),
            caption: _captionController.text.trim(),
            tags: tags,
            imagePath: _selectedImage?.path,
          );

      if (mounted) {
        final state = ref.read(createMenPostProvider);
        if (state.hasError) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error.toString(),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        } else if (state.hasValue && !state.isLoading) {
          // Post created successfully - invalidate the men posts list to refresh
          ref.invalidate(menPostsProvider(page: 1, perPage: 20));
          if (context.mounted) {
            context.pop();
          }
        }
      }
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _cityController.dispose();
    _captionController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(createMenPostProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Men Post'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name *',
                  hintText: 'Enter full name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => Validators.validateMenPostName(value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: 'City *',
                  hintText: 'Enter city',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => Validators.validateCity(value),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tagsController,
                decoration: const InputDecoration(
                  labelText: 'Tags (comma-separated)',
                  hintText: 'gym, instagram, dating app',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _captionController,
                decoration: const InputDecoration(
                  labelText: 'Caption/Story *',
                  hintText: 'Share your experience...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) => Validators.validateCaption(value),
              ),
              const SizedBox(height: 16),
              // Image picker
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _selectedImage == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.image, size: 48),
                            const SizedBox(height: 8),
                            ElevatedButton.icon(
                              onPressed: _pickImage,
                              icon: const Icon(Icons.add_photo_alternate),
                              label: const Text('Add Photo'),
                            ),
                          ],
                        ),
                      )
                    : Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  _selectedImage = null;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: asyncState.isLoading ? null : _submitPost,
                child: asyncState.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

