class ListFilter
  def fill_with(value, field)
    Capybara.find(:select, field).first(:option, value).select_option
  end
end

class CountryFilter < ListFilter; end
class RateFilter < ListFilter; end
