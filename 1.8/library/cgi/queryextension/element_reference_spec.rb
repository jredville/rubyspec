require File.dirname(__FILE__) + '/../../../spec_helper'
require 'cgi'

describe "CGI::QueryExtension#[]" do
  before(:each) do
    ENV['REQUEST_METHOD'], @old_request_method = "GET", ENV['REQUEST_METHOD']
    ENV['QUERY_STRING'], @old_query_string = "one=a&two=b&two=c", ENV['QUERY_STRING']
    @cgi = CGI.new
  end
  
  after(:each) do
    ENV['REQUEST_METHOD'] = @old_request_method
    ENV['QUERY_STRING']   = @old_query_string
  end
  
  it "it returns the value for the parameter with the given key" do
    @cgi["one"].should == "a"
  end
  
  it "only returns the first value for parameters with multiple values" do
    @cgi["two"].should == "b"
  end
  
  it "returns a String that was extended with CGI::QueryExtension::Value" do
    @cgi["one"].should be_kind_of(String)
    @cgi["one"].should be_kind_of(CGI::QueryExtension::Value)
  end

  it "sets the other values in the returned value" do
    @cgi["one"].to_a.should == ["a"]
    @cgi["two"].to_a.should == ["b", "c"]
  end
end
