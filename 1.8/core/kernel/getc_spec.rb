require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/classes'

describe "Kernel#getc" do
  it "is a private method" do
    Kernel.private_instance_methods.should include("getc")
  end
end

describe "Kernel.getc" do
  it "needs to be reviewed for spec completeness"
end
