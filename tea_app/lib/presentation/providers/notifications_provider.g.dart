// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationsHash() => r'5fb56a1cc49e86ac12f1fc759ef6b03129d9eb7a';

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

/// See also [notifications].
@ProviderFor(notifications)
const notificationsProvider = NotificationsFamily();

/// See also [notifications].
class NotificationsFamily extends Family<AsyncValue<NotificationsResponse>> {
  /// See also [notifications].
  const NotificationsFamily();

  /// See also [notifications].
  NotificationsProvider call({
    int page = 1,
    int perPage = 20,
  }) {
    return NotificationsProvider(
      page: page,
      perPage: perPage,
    );
  }

  @override
  NotificationsProvider getProviderOverride(
    covariant NotificationsProvider provider,
  ) {
    return call(
      page: provider.page,
      perPage: provider.perPage,
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
  String? get name => r'notificationsProvider';
}

/// See also [notifications].
class NotificationsProvider
    extends AutoDisposeFutureProvider<NotificationsResponse> {
  /// See also [notifications].
  NotificationsProvider({
    int page = 1,
    int perPage = 20,
  }) : this._internal(
          (ref) => notifications(
            ref as NotificationsRef,
            page: page,
            perPage: perPage,
          ),
          from: notificationsProvider,
          name: r'notificationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$notificationsHash,
          dependencies: NotificationsFamily._dependencies,
          allTransitiveDependencies:
              NotificationsFamily._allTransitiveDependencies,
          page: page,
          perPage: perPage,
        );

  NotificationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.perPage,
  }) : super.internal();

  final int page;
  final int perPage;

  @override
  Override overrideWith(
    FutureOr<NotificationsResponse> Function(NotificationsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NotificationsProvider._internal(
        (ref) => create(ref as NotificationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        perPage: perPage,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<NotificationsResponse> createElement() {
    return _NotificationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationsProvider &&
        other.page == page &&
        other.perPage == perPage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NotificationsRef on AutoDisposeFutureProviderRef<NotificationsResponse> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `perPage` of this provider.
  int get perPage;
}

class _NotificationsProviderElement
    extends AutoDisposeFutureProviderElement<NotificationsResponse>
    with NotificationsRef {
  _NotificationsProviderElement(super.provider);

  @override
  int get page => (origin as NotificationsProvider).page;
  @override
  int get perPage => (origin as NotificationsProvider).perPage;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
