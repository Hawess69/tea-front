import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../data/repositories/feed_repository.dart';
import '../../providers/repositories_provider.dart';
import '../../providers/feed_provider.dart';

final createFeedPostProvider =
    StateNotifierProvider.autoDispose<CreateFeedPostNotifier, AsyncValue<void>>(
        (ref) => CreateFeedPostNotifier(ref.watch(feedRepositoryProvider)));

class CreateFeedPostNotifier extends StateNotifier<AsyncValue<void>> {
  final FeedRepository _repository;

  CreateFeedPostNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> createPost({
    required String title,
    required String body,
    String? imagePath,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _repository.createFeedPost(
        title: title,
        body: body,
        imagePath: imagePath,
      );
      state = const AsyncValue.data(null);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}

class CreateFeedPostScreen extends ConsumerStatefulWidget {
  const CreateFeedPostScreen({super.key});

  @override
  ConsumerState<CreateFeedPostScreen> createState() => _CreateFeedPostScreenState();
}

class _CreateFeedPostScreenState extends ConsumerState<CreateFeedPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
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

  Future<void> _submitPost() async {
    if (_formKey.currentState!.validate()) {
      await ref.read(createFeedPostProvider.notifier).createPost(
            title: _titleController.text.trim(),
            body: _bodyController.text.trim(),
            imagePath: _selectedImage?.path,
          );

      if (mounted) {
        final state = ref.read(createFeedPostProvider);
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
          // Post created successfully - invalidate the feed posts list to refresh
          ref.invalidate(feedPostsProvider(page: 1, perPage: 20));
          if (context.mounted) {
            context.pop();
          }
        }
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(createFeedPostProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Feed Post'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title *',
                  hintText: 'Enter post title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required';
                  }
                  if (value.length < 5 || value.length > 200) {
                    return 'Title must be between 5 and 200 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _bodyController,
                decoration: const InputDecoration(
                  labelText: 'Content *',
                  hintText: 'Share your thoughts...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 8,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Content is required';
                  }
                  if (value.length < 10 || value.length > 5000) {
                    return 'Content must be between 10 and 5000 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
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

