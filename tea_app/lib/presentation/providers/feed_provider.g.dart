// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedPostsHash() => r'7966d972f4373d63ecee04db17302aa864de7afe';

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

/// See also [feedPosts].
@ProviderFor(feedPosts)
const feedPostsProvider = FeedPostsFamily();

/// See also [feedPosts].
class FeedPostsFamily extends Family<AsyncValue<FeedPostsResponse>> {
  /// See also [feedPosts].
  const FeedPostsFamily();

  /// See also [feedPosts].
  FeedPostsProvider call({
    int page = 1,
    int perPage = 20,
    String sort = 'trending',
  }) {
    return FeedPostsProvider(
      page: page,
      perPage: perPage,
      sort: sort,
    );
  }

  @override
  FeedPostsProvider getProviderOverride(
    covariant FeedPostsProvider provider,
  ) {
    return call(
      page: provider.page,
      perPage: provider.perPage,
      sort: provider.sort,
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
  String? get name => r'feedPostsProvider';
}

/// See also [feedPosts].
class FeedPostsProvider extends AutoDisposeFutureProvider<FeedPostsResponse> {
  /// See also [feedPosts].
  FeedPostsProvider({
    int page = 1,
    int perPage = 20,
    String sort = 'trending',
  }) : this._internal(
          (ref) => feedPosts(
            ref as FeedPostsRef,
            page: page,
            perPage: perPage,
            sort: sort,
          ),
          from: feedPostsProvider,
          name: r'feedPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedPostsHash,
          dependencies: FeedPostsFamily._dependencies,
          allTransitiveDependencies: FeedPostsFamily._allTransitiveDependencies,
          page: page,
          perPage: perPage,
          sort: sort,
        );

  FeedPostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.perPage,
    required this.sort,
  }) : super.internal();

  final int page;
  final int perPage;
  final String sort;

  @override
  Override overrideWith(
    FutureOr<FeedPostsResponse> Function(FeedPostsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FeedPostsProvider._internal(
        (ref) => create(ref as FeedPostsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        perPage: perPage,
        sort: sort,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FeedPostsResponse> createElement() {
    return _FeedPostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedPostsProvider &&
        other.page == page &&
        other.perPage == perPage &&
        other.sort == sort;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);
    hash = _SystemHash.combine(hash, sort.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FeedPostsRef on AutoDisposeFutureProviderRef<FeedPostsResponse> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `perPage` of this provider.
  int get perPage;

  /// The parameter `sort` of this provider.
  String get sort;
}

class _FeedPostsProviderElement
    extends AutoDisposeFutureProviderElement<FeedPostsResponse>
    with FeedPostsRef {
  _FeedPostsProviderElement(super.provider);

  @override
  int get page => (origin as FeedPostsProvider).page;
  @override
  int get perPage => (origin as FeedPostsProvider).perPage;
  @override
  String get sort => (origin as FeedPostsProvider).sort;
}

String _$feedPostHash() => r'7ca1424b41eeca517f03c69594507edca427bd75';

/// See also [feedPost].
@ProviderFor(feedPost)
const feedPostProvider = FeedPostFamily();

/// See also [feedPost].
class FeedPostFamily extends Family<AsyncValue<FeedPost>> {
  /// See also [feedPost].
  const FeedPostFamily();

  /// See also [feedPost].
  FeedPostProvider call(
    int id,
  ) {
    return FeedPostProvider(
      id,
    );
  }

  @override
  FeedPostProvider getProviderOverride(
    covariant FeedPostProvider provider,
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
  String? get name => r'feedPostProvider';
}

/// See also [feedPost].
class FeedPostProvider extends AutoDisposeFutureProvider<FeedPost> {
  /// See also [feedPost].
  FeedPostProvider(
    int id,
  ) : this._internal(
          (ref) => feedPost(
            ref as FeedPostRef,
            id,
          ),
          from: feedPostProvider,
          name: r'feedPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedPostHash,
          dependencies: FeedPostFamily._dependencies,
          allTransitiveDependencies: FeedPostFamily._allTransitiveDependencies,
          id: id,
        );

  FeedPostProvider._internal(
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
    FutureOr<FeedPost> Function(FeedPostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FeedPostProvider._internal(
        (ref) => create(ref as FeedPostRef),
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
  AutoDisposeFutureProviderElement<FeedPost> createElement() {
    return _FeedPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedPostProvider && other.id == id;
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
mixin FeedPostRef on AutoDisposeFutureProviderRef<FeedPost> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FeedPostProviderElement
    extends AutoDisposeFutureProviderElement<FeedPost> with FeedPostRef {
  _FeedPostProviderElement(super.provider);

  @override
  int get id => (origin as FeedPostProvider).id;
}

String _$feedPostCommentsHash() => r'e9ea39eed6780a86e21a83213e317855643d7bc9';

/// See also [feedPostComments].
@ProviderFor(feedPostComments)
const feedPostCommentsProvider = FeedPostCommentsFamily();

/// See also [feedPostComments].
class FeedPostCommentsFamily extends Family<AsyncValue<CommentsResponse>> {
  /// See also [feedPostComments].
  const FeedPostCommentsFamily();

  /// See also [feedPostComments].
  FeedPostCommentsProvider call(
    int postId, {
    int page = 1,
  }) {
    return FeedPostCommentsProvider(
      postId,
      page: page,
    );
  }

  @override
  FeedPostCommentsProvider getProviderOverride(
    covariant FeedPostCommentsProvider provider,
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
  String? get name => r'feedPostCommentsProvider';
}

/// See also [feedPostComments].
class FeedPostCommentsProvider
    extends AutoDisposeFutureProvider<CommentsResponse> {
  /// See also [feedPostComments].
  FeedPostCommentsProvider(
    int postId, {
    int page = 1,
  }) : this._internal(
          (ref) => feedPostComments(
            ref as FeedPostCommentsRef,
            postId,
            page: page,
          ),
          from: feedPostCommentsProvider,
          name: r'feedPostCommentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedPostCommentsHash,
          dependencies: FeedPostCommentsFamily._dependencies,
          allTransitiveDependencies:
              FeedPostCommentsFamily._allTransitiveDependencies,
          postId: postId,
          page: page,
        );

  FeedPostCommentsProvider._internal(
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
    FutureOr<CommentsResponse> Function(FeedPostCommentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FeedPostCommentsProvider._internal(
        (ref) => create(ref as FeedPostCommentsRef),
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
    return _FeedPostCommentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedPostCommentsProvider &&
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
mixin FeedPostCommentsRef on AutoDisposeFutureProviderRef<CommentsResponse> {
  /// The parameter `postId` of this provider.
  int get postId;

  /// The parameter `page` of this provider.
  int get page;
}

class _FeedPostCommentsProviderElement
    extends AutoDisposeFutureProviderElement<CommentsResponse>
    with FeedPostCommentsRef {
  _FeedPostCommentsProviderElement(super.provider);

  @override
  int get postId => (origin as FeedPostCommentsProvider).postId;
  @override
  int get page => (origin as FeedPostCommentsProvider).page;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
