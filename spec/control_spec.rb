require File.dirname(__FILE__) + "/../control.rb"

describe Control do
  
  it "should create the specified number of missiles on creation" do
    control = Control.new(9)
    control.missiles.size.should == 9
  end
  
  it "should return the number of missiles in it's arsenal that are armed" do
    control = Control.new(9)
    control.missiles[0].arm!
    control.missiles[2].arm!
    control.missiles[4].arm!
    control.armed_missiles.size.should == 3
  end
  
  describe "#fire!" do
    
    before(:each) do
      @control = Control.new(9)
    end
    
    it "should select an armed missile and fire it at the target" do
      @control.missiles[7].arm!
      @control.missiles[7].should_receive(:fire!).with("Bieber")
      @control.fire!("Bieber")
    end
    
    it "should arm the next unarmed missile if no missiles are already armed" do
      @control.missiles.any? { |m| m.armed? }.should be_false
      #@control.missiles[0].should_receive(:arm!)
      @control.missiles[0].should_receive(:fire!).with("Bieber")
      @control.fire!("Bieber")
      @control.missiles[0].should be_armed
    end
    
  end
  
  describe "#kill_everything!" do
    
    before(:each) do
      @control = Control.new(9)
    end
    
    it "should arm all missiles and fire them" do
      #@control.missiles.each { |m| m.should_receive(:arm!) }
      @control.missiles.each { |m| m.should_receive(:fire!) }
      @control.kill_everything!
      @control.missiles.select { |m| m.armed? }.size.should == 9
    end
    
  end
  
end
