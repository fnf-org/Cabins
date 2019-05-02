module InstantHelper
  # Returns a formatted string containing the specified instant
  def instant_string(instant_name)
    i = Instant.find_by(name: instant_name)
    i.instant.strftime("%a %-d %b %Y %T %Z") if i
  end

  def instant_passed(instant_name)
    i = Instant.find_by(name: instant_name)
    now = DateTime.now.utc
    logger.debug "instant time: #{i.instant.nil? ? [nil] : i.instant.utc} now: #{now}"
    i.instant.nil? ? false : now > i.instant.utc
  end
end
