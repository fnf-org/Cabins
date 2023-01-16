class Accommodation 
  include Mongoid::Document
  belongs_to :accommodation_type
  belongs_to :building
  has_many :reservation

  validates :occupancy, presence: true, numericality: :integer, allow_blank: false
  validates :quantity, presence: true, numericality: :integer, allow_blank: false
  validates :price, presence: true, numericality: :decimal, allow_blank: false

  def self.search(params, is_admin=false)
    rv = where(nil)
    if (params[:kitchen].eql?('1'))
      rv = where('accommodations.kitchen = ?', true)
    end

    if (params[:bathroom].eql?('1'))
      rv = rv.where('accommodations.bathroom = ?', true)
    end

    if (params[:air_conditioning].eql?('1'))
      rv = rv.where('accommodations.air_conditioning = ?', true)
    end

    if params[:search]
      parm = "%#{params[:search]}%"
      rv = rv.where('accommodations.label LIKE ? OR accommodations.description LIKE ? OR b.label LIKE ?',
          parm, parm, parm).joins("LEFT OUTER JOIN buildings b ON b.id=accommodations.building_id")
    end

    if (params[:only_show_available].eql?('1'))
      holdWhereClause = is_admin ? '' : 'accommodations.hold=0 AND '
      rv = rv.where("#{holdWhereClause} (accommodations.quantity > r.reserved_count OR r.reserved_count IS NULL)")
        .joins("LEFT OUTER JOIN (SELECT accommodation_id, SUM(quantity) AS reserved_count FROM reservations GROUP BY accommodation_id) "\
        "r ON r.accommodation_id=accommodations.id")
    end

    rv
  end

  def self.filter_holds(admin)
    if !admin
      return where('accommodations.hold != true')
    end

    where(nil)
  end

  def get_label
    if (self.building.building_type.label.eql?('Cabin') || self.building.building_type.label.eql?('Lodge'))
      return "#{self.label}"
    end

    self.label
  end

end
