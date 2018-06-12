module InstantHelper
  # Returns a formatted string containing the specified instant
  def instant_string(instant_name)
    i = Instant.find_by(name: instant_name)
    return i.instant.strftime("%a %-d %b %Y %T %Z") if i
  end
end
