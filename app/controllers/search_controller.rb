class SearchController < ApplicationController
  def search
    @results = 0
    if !params[:musicSearch].nil?
      @results = 1
      @searchinput = params[:musicSearch]
      @searchcriteria = "%" + @searchinput + "%"
      @music = Music.where("album || band || genre || release || song like ?", @searchcriteria)
    end
  end
end
