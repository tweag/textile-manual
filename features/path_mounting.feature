Feature: Path mounting
  Scenario: Extension mounted at /manual
    Given the textile Server is running at "manual_at_path"
    When I go to "/manual"
    Then I should see "is a simple text markup language"
    When I click on the getting started link
    Then I should be on /manual/writing-paragraph-text
    When I click "Phrase modifiers" in the TOC
    Then I should be on /manual/phrase-modifiers
    When I click "Writing Paragraph Text" in the TOC
    Then I should be on /manual/writing-paragraph-text
    When I click "Introduction" in the TOC
    Then I should be on /manual
    And I should see "is a simple text markup language"

  Scenario: Extension mounted at root
    Given the textile Server is running at "manual_at_root"
    When I go to "/"
    Then I should see "is a simple text markup language"
    When I click on the getting started link
    Then I should be on /writing-paragraph-text
    When I click "Phrase modifiers" in the TOC
    Then I should be on /phrase-modifiers
    When I click "Writing Paragraph Text" in the TOC
    Then I should be on /writing-paragraph-text
    When I click "Introduction" in the TOC
    Then I should be on /
    And I should see "is a simple text markup language"
