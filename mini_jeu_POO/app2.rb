# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.


puts "------------------------------------------------"
puts "| Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
puts "| Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

# Initialisation
puts "Quel est ton prénom ?"
print "> "
user = HumanPlayer.new(gets.chomp)

# Initialisation IA
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

# Combat
while user.life_points.positive? && (player1.life_points.positive? || player2.life_points.positive?)
  puts user.show_state
  puts "\nQuelle action veux-tu effectuer ?"
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher à se soigner"
  puts "Attaquer un joueur en vue :"
  puts "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state}"

  print "> "
  choice = gets.chomp.downcase

  case choice
  when 'a'
    user.search_weapon
  when 's'
    puts user.search_health_pack
  when '0'
    user.attacks(player1)
  when '1'
    user.attacks(player2)
  else
    puts "Choix invalide. Réessaie."
  end

  puts "Les autres joueurs t'attaquent !"
  enemies.each do |enemy|
    enemy.attacks(user) if enemy.life_points.positive?
  end
end

# Fin du jeu
puts "\nLa partie est finie !"
if user.life_points.positive?
  puts "BRAVO ! TU AS GAGNÉ !"
else
  puts "Loser ! Tu as perdu !"
end