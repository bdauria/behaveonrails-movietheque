Given(/^the following movies:$/) do |movies_table|
  movies_table.hashes.each do |movie_hash|
    Movie.create(movie_hash)
  end
end

Given(/^I am on the search page$/) do
  visit movies_path
end

When(/^I search with "([^"]*)" in genre filter$/) do |genre|
  fill_in 'genre-filter', with: genre
  click_on 'Search'
end

When(/^I search with "([^"]*)" in country filter$/) do |country|
  select country, from: 'country-filter'
  click_on 'Search'
end

Then(/^I should see the following movie results:$/) do |movies_table|
  expected_names = movies_table.hashes.collect { |m| m['name'] }
  within('table[name=movie-results]') do
    collected_names = all('td[name=movie-name]').collect(&:text)
    expect(collected_names).to eq(expected_names)
  end
end

When(/^I search with the following filters:$/) do |filters_table|
  filters = filters_table.hashes.first
  filters.keys.each do |key|
    filter_object = "#{key.camelcase}Filter".constantize.new
    filter_object.fill_with(filters[key], "#{key}-filter")
  end
  click_on 'Search'
end
