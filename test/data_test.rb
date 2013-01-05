require 'test_helper'

class TestData < MiniTest::Unit::TestCase
  def setup
    @matlock = Matlock.new()
  end
  
  ######################################
  # Name Files
  ######################################

  def test_name_file_countss
    assert_equal 87646, Matlock::Data.surnames.length
    assert_equal 5064, Matlock::Data.first_names.length
    assert_equal 1183, Matlock::Data.male_names.length
    assert_equal 4202, Matlock::Data.female_names.length
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
