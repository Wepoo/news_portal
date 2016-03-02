class FeedsController < ApplicationController
  def index
    url = "http://feedjira.com/blog/feed.xml"
    @feed = Feedjira::Feed.fetch_and_parse url
    @entries = @feed.entries
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end
end
