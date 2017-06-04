class MusicViewController < ApplicationController
  @albums = ''
  @lineNumber = 1
  def albumSort
    @lineNumber = 1
    @albums = Music.order('album')
  end

  def bandSort
    @lineNumber = 1
    @albums = Music.order('band')
  end

  def songSort
    @lineNumber = 1
    @albums = Music.order('song')
  end

  def genreSort
    @lineNumber = 1
    @albums = Music.order('genre')
  end

  def releaseSort
    @lineNumber = 1
    @albums = Music.order('release')
  end
end
