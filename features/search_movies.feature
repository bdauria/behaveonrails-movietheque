Feature: Search movies
  In order to select a movie
  As a user
  I want to be able to search
  Background:
    Given the following movies:
      | name                              | genre  | country        | rate |
      | Fight Club                        | Drama  | United States  | 8    |
      | Lock, Stock & Two Smoking Barrels | Comedy | United Kingdom | 9    |
      | City of God                       | Drama  | Brazil         | 7    |
    Given I am on the search page

  Scenario: without filters
    Then I should see the following movie results:
      | name                              |
      | Lock, Stock & Two Smoking Barrels |
      | Fight Club                        |
      | City of God                       |

  Scenario: with a genre filter
    When I search with the following filters:
      | genre |
      | Drama |
    Then I should see the following movie results:
      | name        |
      | Fight Club  |
      | City of God |

  Scenario: with a country filter
    When I search with the following filters:
      | country       |
      | United States |
    Then I should see the following movie results:
      | name       |
      | Fight Club |

  Scenario: with genre and rate filters
    When I search with the following filters:
      | genre | rate |
      | Drama | 8    |
    Then I should see the following movie results:
      | name       |
      | Fight Club |

