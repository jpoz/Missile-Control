require File.dirname(__FILE__) + "/../missile.rb"

describe Missile do

  it "should be unarmed on initialization" do
    missile = Missile.new
    missile.armed?.should be_false
  end
  
  it "should have the status of unused on initialization" do
    missile = Missile.new
    missile.status.should == :unused
  end
  
  it "should be armed if called to be" do
    missile = Missile.new
    missile.arm!
    missile.armed?.should be_true
  end
  
  it "should disarm itself if called to" do
    missile = Missile.new
    missile.arm!
    missile.armed?.should be_true
    missile.disarm!
    missile.armed?.should be_false
  end
  
  describe "#fire!" do
    
    before(:each) do
      @missile = Missile.new
    end
    
    it "should require a target" do
      lambda {
        @missile.fire!(nil)
      }.should raise_error(Missile::MissingTarget)
    end
    
    it "should be armed to be fired" do
      @missile.disarm!
      lambda {
        @missile.fire!("Portland")
      }.should raise_error(Missile::Unarmed)
    end
    
    describe "with an armed missile" do
      
      before(:each) do
        @missile.arm!
      end
      
      it "should let us know what happened to the target" do
        result = @missile.fire!("Bieber")
        result.should == "You have killed Bieber!"
      end
      
      it "should have a location after being fired" do
        @missile.fire!("Bieber")
        @missile.location.should == "Grave site of Bieber!"
      end
      
      it "should have a status of blownup after being fired" do
        @missile.fire!("Bieber")
        @missile.status == :blownup
      end
      
      
    end
    
    
  end

end