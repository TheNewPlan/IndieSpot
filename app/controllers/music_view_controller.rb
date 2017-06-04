class MusicViewController < ApplicationController
  @musics = ''
  @lineNumber = 1

  def albumSort
    @lineNumber = 1
    @musics = Music.order("lower(album)")
  end

  def bandSort
    @lineNumber = 1
    @musics = Music.order("lower(band)")
  end

  def songSort
    @lineNumber = 1
    @musics = Music.order("lower(song)")
  end

  def genreSort
    @lineNumber = 1
    @musics = Music.order('genre')
  end

  def releaseSort
    @lineNumber = 1
    @musics = Music.order('release')
  end
end
