require 'spec_helper'

# Required by serverspec
set :backend, :exec

describe 'tomcat::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'starts tomcat' do
    expect(service("tomcat")).to be_running
  end

  it "is listening on port 8080" do
    expect(port(8080)).to be_listening
  end
  
end
