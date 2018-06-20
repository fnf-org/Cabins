module TiersHelper
  def tier_count(t)
    return User.where(tier: t.id).count
  end
end
