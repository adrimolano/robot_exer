class BoxOfBolts < item


def initialize
  @name = "Box of Bolts"
  @weight = 25
end

  def feed(robot)
    robot.heal(20)
  end

end
