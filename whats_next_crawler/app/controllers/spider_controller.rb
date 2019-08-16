class SpiderController < ApplicationController
  def get
    url = params[:url]

    spider.catch(url: url)

    response.status  = 200
    response.message = "OK"
  end
end
