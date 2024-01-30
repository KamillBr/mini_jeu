# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/game'
require_relative 'lib/player'


# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.


player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "état des joueurs :"
player1.show_state
player2.show_state
puts "\nPhase d'attaque :"

# Boucle du combat jusqu'à ce qu'un joueur n'ait plus de vie
while player1.life_points > 0 && player2.life_points > 0

  player1.attacks(player2)
  
  # Vérif si encore point de vie
  break if player2.life_points <= 0

  player2.attacks(player1)

  # état des joueurs après chaque tour
  puts "\nVoici l'état des joueurs :"
  player1.show_state
  player2.show_state

  # Vérifions si encore point de vie
  break if player1.life_points <= 0
end

# résultat du combat
puts "\nLe combat est terminé !"

# résultat fin
if player1.life_points <= 0 && player2.life_points <= 0
  puts "Match nul !"
elsif player1.life_points <= 0
  puts "José gagne !"
else
  puts "Josiane gagne !"
end
