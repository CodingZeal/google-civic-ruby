module Requests
  def stub_request_for(method, fixture, path)
    stub_request(method, "https://www.googleapis.com/civicinfo/v1/#{path}").to_return(status: 200, body: Fixtures.load_fixture(fixture), headers: {})
  end
end
