require_relative "../time_easer"
require_relative "../adapters/mite"
require "minitest/autorun"

class TestTimeEase < Minitest::Test
  def setup
    input   = TimeEase::Input.new("10:00", "16:00", "12-25-2016", "RS Sprint6, GoodTravel(1.5)")
    @parser = TimeEase::Parser.new(input)
  end

  def test_parse
    parsed = @parser.parse
    mite_body = TimeEase::Adapter::Mite.new(parsed).body
    expected = [
      {
        time_entry: {
          date_at:    "2016-12-25",
          minutes:    270,
          project_id: 234,
          service_id: 1
        }
      },
      {
        time_entry: {
          date_at:    "2016-12-25",
          minutes:    90,
          project_id: 123,
          service_id: nil
        }
      }
    ]
    assert_equal expected, mite_body
  end
end
