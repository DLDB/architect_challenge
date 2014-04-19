class Airport
  
  DEFAULT_CAPACITY = 10

  def initialize(options = {})
    @capacity = options.fetch(:capacity, capacity)
    planes
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def planes
    @planes ||= []
  end

  def full?
    planes.count >= capacity
  end

  def park(plane)
    return 'Please land before you try and park. Dumbass.' if plane.flying_status == :flying
    planes << plane
  end

  def launch!
    plane = planes.pop
    plane.takeoff!
  end

  def check_permission_to_land(plane)
    return 'Permission Denied: Airport Full!' if full?
    plane.permission_to_land=(true)
  end
  

end