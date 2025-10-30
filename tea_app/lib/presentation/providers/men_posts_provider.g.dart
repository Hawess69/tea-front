// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'men_posts_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$menPostsHash() => r'efb176ac12dd04a9b0177c98fce6e2dd9c85a25a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [menPosts].
@ProviderFor(menPosts)
const menPostsProvider = MenPostsFamily();

/// See also [menPosts].
class MenPostsFamily extends Family<AsyncValue<MenPostsResponse>> {
  /// See also [menPosts].
  const MenPostsFamily();

  /// See also [menPosts].
  MenPostsProvider call({
    int page = 1,
    int perPage = 20,
    String? city,
    String? tags,
    String? searchName,
  }) {
    return MenPostsProvider(
      page: page,
      perPage: perPage,
      city: city,
      tags: tags,
      searchName: searchName,
    );
  }

  @override
  MenPostsProvider getProviderOverride(
    covariant MenPostsProvider provider,
  ) {
    return call(
      page: provider.page,
      perPage: provider.perPage,
      city: provider.city,
      tags: provider.tags,
      searchName: provider.searchName,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'menPostsProvider';
}

/// See also [menPosts].
class MenPostsProvider extends AutoDisposeFutureProvider<MenPostsResponse> {
  /// See also [menPosts].
  MenPostsProvider({
    int page = 1,
    int perPage = 20,
    String? city,
    String? tags,
    String? searchName,
  }) : this._internal(
          (ref) => menPosts(
            ref as MenPostsRef,
            page: page,
            perPage: perPage,
            city: city,
            tags: tags,
            searchName: searchName,
          ),
          from: menPostsProvider,
          name: r'menPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$menPostsHash,
          dependencies: MenPostsFamily._dependencies,
          allTransitiveDependencies: MenPostsFamily._allTransitiveDependencies,
          page: page,
          perPage: perPage,
          city: city,
          tags: tags,
          searchName: searchName,
        );

  MenPostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.perPage,
    required this.city,
    required this.tags,
    required this.searchName,
  }) : super.internal();

  final int page;
  final int perPage;
  final String? city;
  final String? tags;
  final String? searchName;

  @override
  Override overrideWith(
    FutureOr<MenPostsResponse> Function(MenPostsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MenPostsProvider._internal(
        (ref) => create(ref as MenPostsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        perPage: perPage,
        city: city,
        tags: tags,
        searchName: searchName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MenPostsResponse> createElement() {
    return _MenPostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MenPostsProvider &&
        other.page == page &&
        other.perPage == perPage &&
        other.city == city &&
        other.tags == tags &&
        other.searchName == searchName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);
    hash = _SystemHash.combine(hash, city.hashCode);
    hash = _SystemHash.combine(hash, tags.hashCode);
    hash = _SystemHash.combine(hash, searchName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MenPostsRef on AutoDisposeFutureProviderRef<MenPostsResponse> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `perPage` of this provider.
  int get perPage;

  /// The parameter `city` of this provider.
  String? get city;

  /// The parameter `tags` of this provider.
  String? get tags;

  /// The parameter `searchName` of this provider.
  String? get searchName;
}

class _MenPostsProviderElement
    extends AutoDisposeFutureProviderElement<MenPostsResponse>
    with MenPostsRef {
  _MenPostsProviderElement(super.provider);

  @override
  int get page => (origin as MenPostsProvider).page;
  @override
  int get perPage => (origin as MenPostsProvider).perPage;
  @override
  String? get city => (origin as MenPostsProvider).city;
  @override
  String? get tags => (origin as MenPostsProvider).tags;
  @override
  String? get searchName => (origin as MenPostsProvider).searchName;
}

String _$menPostHash() => r'c34d34d5d694a31c91615a7ea8cfd5dea1954a19';

/// See also [menPost].
@ProviderFor(menPost)
const menPostProvider = MenPostFamily();

/// See also [menPost].
class MenPostFamily extends Family<AsyncValue<MenPost>> {
  /// See also [menPost].
  const MenPostFamily();

  /// See also [menPost].
  MenPostProvider call(
    int id,
  ) {
    return MenPostProvider(
      id,
    );
  }

  @override
  MenPostProvider getProviderOverride(
    covariant MenPostProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'menPostProvider';
}

/// See also [menPost].
class MenPostProvider extends AutoDisposeFutureProvider<MenPost> {
  /// See also [menPost].
  MenPostProvider(
    int id,
  ) : this._internal(
          (ref) => menPost(
            ref as MenPostRef,
            id,
          ),
          from: menPostProvider,
          name: r'menPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$menPostHash,
          dependencies: MenPostFamily._dependencies,
          allTransitiveDependencies: MenPostFamily._allTransitiveDependencies,
          id: id,
        );

  MenPostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<MenPost> Function(MenPostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MenPostProvider._internal(
        (ref) => create(ref as MenPostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MenPost> createElement() {
    return _MenPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MenPostProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MenPostRef on AutoDisposeFutureProviderRef<MenPost> {
  /// The parameter `id` of this provider.
  int get id;
}

class _MenPostProviderElement extends AutoDisposeFutureProviderElement<MenPost>
    with MenPostRef {
  _MenPostProviderElement(super.provider);

  @override
  int get id => (origin as MenPostProvider).id;
}

String _$menPostCommentsHash() => r'22ef92c844c62af2c864149a7860c72df98e0077';

/// See also [menPostComments].
@ProviderFor(menPostComments)
const menPostCommentsProvider = MenPostCommentsFamily();

/// See also [menPostComments].
class MenPostCommentsFamily extends Family<AsyncValue<CommentsResponse>> {
  /// See also [menPostComments].
  const MenPostCommentsFamily();

  /// See also [menPostComments].
  MenPostCommentsProvider call(
    int postId, {
    int page = 1,
  }) {
    return MenPostCommentsProvider(
      postId,
      page: page,
    );
  }

  @override
  MenPostCommentsProvider getProviderOverride(
    covariant MenPostCommentsProvider provider,
  ) {
    return call(
      provider.postId,
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'menPostCommentsProvider';
}

/// See also [menPostComments].
class MenPostCommentsProvider
    extends AutoDisposeFutureProvider<CommentsResponse> {
  /// See also [menPostComments].
  MenPostCommentsProvider(
    int postId, {
    int page = 1,
  }) : this._internal(
          (ref) => menPostComments(
            ref as MenPostCommentsRef,
            postId,
            page: page,
          ),
          from: menPostCommentsProvider,
          name: r'menPostCommentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$menPostCommentsHash,
          dependencies: MenPostCommentsFamily._dependencies,
          allTransitiveDependencies:
              MenPostCommentsFamily._allTransitiveDependencies,
          postId: postId,
          page: page,
        );

  MenPostCommentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
    required this.page,
  }) : super.internal();

  final int postId;
  final int page;

  @override
  Override overrideWith(
    FutureOr<CommentsResponse> Function(MenPostCommentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MenPostCommentsProvider._internal(
        (ref) => create(ref as MenPostCommentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CommentsResponse> createElement() {
    return _MenPostCommentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MenPostCommentsProvider &&
        other.postId == postId &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MenPostCommentsRef on AutoDisposeFutureProviderRef<CommentsResponse> {
  /// The parameter `postId` of this provider.
  int get postId;

  /// The parameter `page` of this provider.
  int get page;
}

class _MenPostCommentsProviderElement
    extends AutoDisposeFutureProviderElement<CommentsResponse>
    with MenPostCommentsRef {
  _MenPostCommentsProviderElement(super.provider);

  @override
  int get postId => (origin as MenPostCommentsProvider).postId;
  @override
  int get page => (origin as MenPostCommentsProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
