class Missile

  attr_accessor :status
  attr_accessor :location

  def initialize
    @is_armed = false
    @status = :unused
  end

  def armed?
    @is_armed
  end

  def arm!
    @is_armed = true
  end

  def disarm!
    @is_armed = false
  end

  def fire! target
    raise MissingTarget if target.nil? || target == ""
    raise Unarmed unless armed?

    @status = :blownup
    @location = "Grave site of #{target}!"
    "You have killed #{target}!"
  end

  class MissingTarget < Exception
  end

  class Unarmed < Exception
  end
end
