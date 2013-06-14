require 'goliath/test_helper'
require 'spec_helper'

describe GfmService do
  
  it 'should return an error for requests other than POSTs' do
    with_api(GfmService) do |a|
      get_request { |c|
        c.response_header.status.should == 405
        c.response.should == "{\"error\":\"Only POST requests please\"}"
      }
    end
  end

  it 'should warn user to send data as body rather than query params' do
    pending
  end

  context 'JSON input format' do

    it 'should throw error if text option is not provided' do
      pending
    end

    it 'should return a gfm format string by default' do
      with_api(GfmService) do |a|
        request = { :text => "Hello world **cool** and #1!" }
        response = "<p>Hello world <strong>cool</strong> and #1!</p>"
        post_request({:body => request}) { |c|
          c.response.should == response
        }
      end
    end

    it 'should return a normal markdown format if specified' do
      pending
    end
  end

end
