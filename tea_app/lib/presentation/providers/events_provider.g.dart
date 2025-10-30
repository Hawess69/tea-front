// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventsHash() => r'62de6cbbbbe62c59fae78b60b95e2cd4498b03d1';

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

/// See also [events].
@ProviderFor(events)
const eventsProvider = EventsFamily();

/// See also [events].
class EventsFamily extends Family<AsyncValue<EventsResponse>> {
  /// See also [events].
  const EventsFamily();

  /// See also [events].
  EventsProvider call({
    int page = 1,
    int perPage = 20,
    bool upcoming = true,
  }) {
    return EventsProvider(
      page: page,
      perPage: perPage,
      upcoming: upcoming,
    );
  }

  @override
  EventsProvider getProviderOverride(
    covariant EventsProvider provider,
  ) {
    return call(
      page: provider.page,
      perPage: provider.perPage,
      upcoming: provider.upcoming,
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
  String? get name => r'eventsProvider';
}

/// See also [events].
class EventsProvider extends AutoDisposeFutureProvider<EventsResponse> {
  /// See also [events].
  EventsProvider({
    int page = 1,
    int perPage = 20,
    bool upcoming = true,
  }) : this._internal(
          (ref) => events(
            ref as EventsRef,
            page: page,
            perPage: perPage,
            upcoming: upcoming,
          ),
          from: eventsProvider,
          name: r'eventsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventsHash,
          dependencies: EventsFamily._dependencies,
          allTransitiveDependencies: EventsFamily._allTransitiveDependencies,
          page: page,
          perPage: perPage,
          upcoming: upcoming,
        );

  EventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
    required this.perPage,
    required this.upcoming,
  }) : super.internal();

  final int page;
  final int perPage;
  final bool upcoming;

  @override
  Override overrideWith(
    FutureOr<EventsResponse> Function(EventsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EventsProvider._internal(
        (ref) => create(ref as EventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
        perPage: perPage,
        upcoming: upcoming,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<EventsResponse> createElement() {
    return _EventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EventsProvider &&
        other.page == page &&
        other.perPage == perPage &&
        other.upcoming == upcoming;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);
    hash = _SystemHash.combine(hash, perPage.hashCode);
    hash = _SystemHash.combine(hash, upcoming.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EventsRef on AutoDisposeFutureProviderRef<EventsResponse> {
  /// The parameter `page` of this provider.
  int get page;

  /// The parameter `perPage` of this provider.
  int get perPage;

  /// The parameter `upcoming` of this provider.
  bool get upcoming;
}

class _EventsProviderElement
    extends AutoDisposeFutureProviderElement<EventsResponse> with EventsRef {
  _EventsProviderElement(super.provider);

  @override
  int get page => (origin as EventsProvider).page;
  @override
  int get perPage => (origin as EventsProvider).perPage;
  @override
  bool get upcoming => (origin as EventsProvider).upcoming;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
