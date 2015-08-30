require "support/helper"

class ProcessorTest < MiniTest::Test
  def setup
    @view_store = :test
    Pakyow::App.stage(:test)
  end

  def test_md_view_is_processed
    v = Pakyow.app.presenter.store.composer('/')
    assert_equal "<h1>this should be a header</h1>", v.container(:default).to_html.strip
  end

  def test_markdown_view_is_processed
    v = Pakyow.app.presenter.store.composer('/sub')
    assert_equal "<p><em>em</em></p>", v.container(:default).to_html.strip
  end
end
