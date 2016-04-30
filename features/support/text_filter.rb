class TextFilter
  def fill_with(value, field)
    Capybara.fill_in field, with: value
  end
end
class GenreFilter < TextFilter; end
