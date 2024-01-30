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

# Demande le prénom de l'utilisateur
puts "Quel est ton prénom ?"
print "> "
user_name = gets.chomp

# Initialise le jeu avec le personnage de l'utilisateur et ses ennemis
my_game = Game.new(user_name)

# Combat
while my_game.still_ongoing?
  my_game.show_players
  my_game.menu
  user_choice = gets.chomp.downcase
  case user_choice
  when 'a', 's', '0', '1'
    my_game.menu_choice(user_choice)
    my_game.enemies_attack
  when 'q'
    break
  else
    puts "Choix invalide. Réessaie."
  end

  puts "\nAppuie sur Entrée pour continuer..."
  gets.chomp
end

# Fin du jeu
my_game.end