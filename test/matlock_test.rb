require 'test_helper'

class TestMatlock < MiniTest::Unit::TestCase
  def setup
    @matlock = Matlock.new()
  end
  
  ######################################
  # Extract Names
  ######################################

  def test_simple_name_extraction
    html = <<-BLOCK
      <html>
        <body>
          <p>Once upon a time there was a linebacker named Jeremy Wilson who played with Jenny Smith who played with the Denver Broncos.</p>
        </body>
      </html>
    BLOCK
    
    names = @matlock.extract_names(html)
    assert_equal ["Jeremy Wilson", "Jenny Smith"], names
  end

  def test_name_extraction_with_hyphenated_last_name
    html = "My friend, Delloreen Ennis-London, is an awesome person."
    names = @matlock.extract_names(html)
    assert_equal ["Delloreen Ennis-London"], names
  end

  def test_name_underscored_names
    html = "This name Wally_Bullingotn_Practice_Complex should not work."
    names = @matlock.extract_names(html)
    assert_equal [], names
  end
end
