module MoviesHelper
  def countries
    CS.countries.map { |country| country[1] }
  end

  def rates
    (1..10)
  end
end
