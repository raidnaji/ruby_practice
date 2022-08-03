require "test_helper"

class LinkTest < ActiveSupport::TestCase
  test "invalid link" do
    # @links = Link.all
    @link = User.first.links.new
    assert_not @link.save
  end
end
