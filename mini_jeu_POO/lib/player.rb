
class Player
    attr_accessor :name, :life_points
  
    def initialize(name)
      @name = name
      @life_points = 10
    end
  
    def show_state
      puts "#{@name} a #{@life_points} points de vie"
    end
  
    def gets_damage(damage)
      @life_points -= damage
  
      if @life_points <= 0
        puts "\nle joueur #{@name} a été tué !"
        @life_points = 0
      end
    end
  
    def compute_damage
      rand(1..6)
    end
  
    def attacks(other_player)
      puts "\n#{@name} attaque #{other_player.name}"
      damage = compute_damage
      other_player.gets_damage(damage)
      puts "\nil lui inflige #{damage} points de dommages"
    end
  end
  


  class HumanPlayer < Player
    attr_accessor :weapon_level
  
    def initialize(name)
      super(name)
      @life_points = 100
      @weapon_level = 1
    end
  
    def show_state
      "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end
  
    def compute_damage
      rand(1..6) * @weapon_level
    end
  
    def search_weapon
      new_weapon_level = rand(1..6)
      puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
  
      if new_weapon_level > @weapon_level
        @weapon_level = new_weapon_level
        puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
      else
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      end
    end
  
    def search_health_pack
      dice_roll = rand(1..6)
  
      case dice_roll
      when 1
        "Tu n'as rien trouvé..."
      when 2..5
        heal_points = [50, 100 - @life_points].min
        @life_points += heal_points
        "Bravo, tu as trouvé un pack de +#{heal_points} points de vie !"
      when 6
        heal_points = [80, 100 - @life_points].min
        @life_points += heal_points
        "Waow, tu as trouvé un pack de +#{heal_points} points de vie !"
      end
    end
  end