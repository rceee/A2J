require 'spec_helper'

describe Item do
  it "can be instantiated" do
    Item.new.should be_an_instance_of(Item)
  end

  it "can be saved successfully" do
    Item.create.should be_persisted
  end
end
