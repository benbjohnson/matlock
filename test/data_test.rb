require 'test_helper'

class TestData < MiniTest::Unit::TestCase
  def setup
    @matlock = Matlock.new()
  end
  
  ######################################
  # Names
  ######################################

  def test_is_surname
    assert Matlock::Data.surname?("Johnson")
    assert Matlock::Data.surname?("Smith")
    assert Matlock::Data.surname?("Ennis-London")
    assert !Matlock::Data.surname?("Crabapple")
  end

  def test_is_first_name
    assert Matlock::Data.first_name?("Ben")
    assert Matlock::Data.first_name?("Jennifer")
    assert !Matlock::Data.first_name?("Smith")
  end

  def test_is_male_name
    assert Matlock::Data.male_name?("John")
    assert Matlock::Data.male_name?("Jacob")
    assert !Matlock::Data.male_name?("Jennifer")
  end

  def test_is_female_name
    assert Matlock::Data.female_name?("Jennifer")
    assert Matlock::Data.female_name?("Susan")
    assert !Matlock::Data.female_name?("Mike")
  end

  ######################################
  # Remove Common Words from Name Data
  ######################################

  def test_no_common_words_in_name_files
    Matlock::Data.common_words.keys.each do |word|
      assert Matlock::Data.surnames[word].nil?, "Common word found in surnames: #{word}"
      assert Matlock::Data.male_names[word].nil?, "Common word found in males names: #{word}"
      assert Matlock::Data.female_names[word].nil?, "Common word found in female names: #{word}"
    end
  end
end
