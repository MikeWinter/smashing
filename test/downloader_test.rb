require 'test_helper'

class DownloaderTest < Minitest::Test
  def test_get_json_requests_and_parses_content
    endpoint = 'http://somehost.com/file.json'
    response = '{ "name": "value" }'
    stub_request(:get, endpoint).to_return(body: response)
    JSON.stubs(:parse).with(response).once

    Dashing::Downloader.get_json(endpoint)
  end

  def test_get_json_raises_on_bad_request
    stub_request(:get, 'http://dead-host.com/').to_return(status: 404)

    assert_raises(OpenURI::HTTPError) do
      Dashing::Downloader.get_json('http://dead-host.com/')
    end
  end

  def test_load_gist_attempts_to_get_the_gist
    Dashing::Downloader.stubs(:get_json).once
    Dashing::Downloader.get_gist(123)
  end
end
