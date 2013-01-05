require 'test_helper'

class TestMatlock < MiniTest::Unit::TestCase
  def setup
    @matlock = Matlock.new()
  end
  
  ######################################
  # Extract Names
  ######################################

  def test_extract_names
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
end
