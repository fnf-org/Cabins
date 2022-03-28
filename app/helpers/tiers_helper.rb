module TiersHelper
  def tier_count(t)
    return User.where(tier: t.id).count
  end

  def duration(difference)
    ActiveSupport::Duration
      .build(difference)
      .parts
      .except(:seconds)
      .reduce('') { |output, (key, val)| output += "#{val}#{key.to_s.first} " }
      .strip
  end
end
