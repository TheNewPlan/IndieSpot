require 'test_helper'

class MusicViewControllerTest < ActionDispatch::IntegrationTest
  test "should get albumSort" do
    get music_view_albumSort_url
    assert_response :success
  end

  test "should get bandSort" do
    get music_view_bandSort_url
    assert_response :success
  end

  test "should get songSort" do
    get music_view_songSort_url
    assert_response :success
  end

  test "should get genreSort" do
    get music_view_genreSort_url
    assert_response :success
  end

  test "should get releaseSort" do
    get music_view_releaseSort_url
    assert_response :success
  end

end
