class Game
    attr_accessor :human_player, :enemies
  
    def initialize(name)
      @human_player = HumanPlayer.new(name)
      @enemies = [Player.new("Josiane"), Player.new("José")]
    end
  
    def kill_player(player)
      @enemies.delete(player)
    end
  
    def still_ongoing?
      @human_player.life_points.positive? && !@enemies.empty?
    end
  
    def show_players
      @human_player.show_state
      puts "Ennemis :"
      @enemies.each do |enemy|
        puts "- #{enemy.show_state}"
      end
    end
  
    def menu
      puts "\nQuelle action veux-tu effectuer ?"
      puts "a - Chercher une meilleure arme"
      puts "s - Chercher à se soigner"
      puts "Attaquer un joueur en vue :"
      @enemies.each_with_index do |enemy, index|
        puts "#{index} - #{enemy.show_state}"
      end
      print "> "
    end
  
    def enemies_attack
      @enemies.each do |enemy|
        enemy.attacks(@human_player) if enemy.life_points.positive?
      end
    end
  end
  