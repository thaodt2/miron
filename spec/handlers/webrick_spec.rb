require 'spec_helper'
require 'webrick'

describe Miron::Handler::WEBrick do
  describe 'In general' do
    it 'inherits from WEBrick::HTTPServlet::AbstractServlet' do
      expect(Miron::Handler::WEBrick.superclass).to eq(WEBrick::HTTPServlet::AbstractServlet)
    end

    it 'responds to self.run' do
      expect(Miron::Handler::WEBrick).to respond_to(:run)
    end
  end

  describe 'Handler' do
    sample_webrick_app
    response = get

    it 'returns the correct HTTP body' do
      expect(response.body).to eq('hi')
    end

    it 'returns the correct HTTP cookies' do
      expect(response.headers['set-cookie']).to eq('HELLO=HELLO')
    end

    it 'returns the correct HTTP headers' do
      expect(response.headers['hello']).to eq('HELLO')
    end

    it 'returns the correct HTTP status' do
      expect(response.code.to_i).to eq(200)
    end
  end
end
