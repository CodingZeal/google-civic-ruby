module Requests
  def stub_request_for(fixture, path)
    stub_request(:get, "https://www.googleapis.com/civicinfo/v1/#{path}").to_return(status: 200, body: Fixtures.load_fixture(fixture), headers: {})
  end
end