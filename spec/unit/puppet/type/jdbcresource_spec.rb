require 'spec_helper'

describe Puppet::Type.type(:jdbcresource) do

  before :each do
    described_class.stubs(:defaultprovider).returns providerclass
  end

  let :providerclass do
    described_class.provide(:fake_jdbcresource_provider) { mk_resource_methods }
  end

  it "should have :name as it's namevar" do
    described_class.key_attributes.should == [:name]
  end

  describe "when validating attributes" do
    [:name, :connectionpool, :portbase, :asadminuser, :passwordfile, :user].each do |param|
      it "should have a #{param} parameter" do
        described_class.attrtype(param).should == :param
      end
    end
  end
  
end