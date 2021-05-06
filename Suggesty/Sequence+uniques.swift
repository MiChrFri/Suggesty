extension Sequence where Element: Hashable {
  func uniques() -> [Element] {
    var seen = Set<Element>()
    return filter {
      if seen.contains($0) {
        return false
      }
      seen.insert($0)
      return true
    }
  }
}
