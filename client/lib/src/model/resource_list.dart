class ResourceList<T> {
  ResourceList(this.resources);

  final List<T> resources;

  @override
  String toString() => '$resources';
}
