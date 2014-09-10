class SitesController < ApplicationController
  def new
  end

  def create
  require 'open-uri'
  p 'penis'
    url = params.require(:site)[:url]
	  site = Site.create(url: url)
	  LinksWorker.perform_async(site.id)
	  redirect_to site_path(site)
  end

  def show
  end
end
