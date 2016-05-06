class Robot

 
  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon

  MAX_HEALTH = 100
  MIN_HEALTH = 0
  
  def initialize
    @x_position = 0
    @y_position = 0
    @items = []
    @health = 100
    @attack_power = 5
    @equipped_weapon = nil
  end

  def position
    x = @x_position
    y = @y_position
    @position = [x, y]
  end

  def move_left
    @x_position -= 1
  end

  def move_right
    @x_position += 1
 end

  def move_up
    @y_position += 1
  end

  def move_down
    @y_position -= 1
  end

  def pick_up(item)
    if item.weight + items_weight <= 250
     if item.is_a? Weapon
        @equipped_weapon = item
   else
        @items << item
      end
    end
  end

  def items_weight
    total_weight = 0
    @items.each do |item|
    total_weight = total_weight + items_weight
  end
  total_weight
    # @items.inject(0) do |sum, item|
    #   sum += item.weight
    # end
  end

  def wound(scratch)
    scratch > @health ? @health = MIN_HEALTH : @health = @health - scratch
    # if scratch > @health
    #   @health = 0
    # else
    #    @health -= scratch
    # end
  end

  def heal(mechanic)
    # if @health + mechanic > 100
    # @health = 100
    # else
    #  @health += mechanic
    # end
    @health + mechanic > MAX_HEALTH ? @health = MAX_HEALTH : @health = @health + mechanic
  end

  def attack(bad_robot)
      if equipped_weapon.nil?
      bad_robot.wound(@attack_power)
    else
      @equipped_weapon.hit(bad_robot)
    end
  end




end