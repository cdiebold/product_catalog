defmodule ProductCatalog.HomePageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  test "presense of nsn product banner" do
    navigate_to("/")
    assert page_source() =~ "NSN Parts"
  end

  test "presence of browse button on product banner" do
      navigate_to("/")
      browse_button = find_element(:css, ".custom-btn") |> visible_text()
      assert browse_button == "BROWSE"
  end
  test "can navigate to the products page by clicking the browse button"
end
