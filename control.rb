class Control

  attr_accessor :missiles

  def initialize size
    @missiles = []
    size.times do
      @missiles << Missile.new
    end
  end

  def armed_missiles
    @missiles.select { |missile| missile.armed? }
  end

  def unarmed_missiles
    @missiles.select { |missile| !missile.armed? }
  end

  def arm_next_missile
    unarmed_missiles.first.arm!
  end

  def fire! target
    self.arm_next_missile if armed_missiles.empty?
    armed_missiles.first.fire! target
  end

  def kill_everything!
    @missiles.each do |missile|
      missile.arm!
      missile.fire! "Bieber"
    end
  end


end
