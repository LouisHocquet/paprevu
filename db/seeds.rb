# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'

puts "=== Cleaning database... ==="

Activity.destroy_all
puts "#{Activity.count} activity left"

Discovery.destroy_all
puts "#{Discovery.count} discovery left"

puts "=== Database clean! ==="

puts "=== Adding activities... ==="

params_run = {
  name: "Run & Connect : Soirée Running à la Citadelle de Lille",
  description: "Envie de bouger tout en tissant de nouveaux liens ? Rejoins notre sortie running en soirée à
  la majestueuse Citadelle de Lille ! Profite d’un cadre exceptionnel où le sport et la convivialité s’entremêlent.
  Que tu sois un coureur aguerri ou un débutant enthousiaste, cette expérience est faite pour toi. Tu pourras te
  dépenser dans une ambiance détendue, tout en échangeant avec des personnes qui partagent ta passion.
  À la fin de la course, un moment de détente est prévu pour partager des anecdotes et des rires.
  Rejoins-nous et transforme ta soirée en un moment sportif et social inoubliable !"
}
activity_run = Activity.new(params_run)
activity_run.photo.attach(
  io: URI.open('https://runners.ouest-france.fr/wp-content/uploads/2015/03/Group_running.jpg'),
  filename: 'run_citadelle.jpeg'
  )
activity_run.save

params_museum = {
  name: "Date au Musée des Beaux Arts : Quand l’Art Fait son Show",
  description: "Les gens pensent que les musées sont ringards ? Peut-être, mais tu lui feras croire que tu as de l’esprit !
  Pour un premier date qui sort de l’ordinaire, pourquoi ne pas troquer le traditionnel verre en terrasse contre une virée
  culturelle au musée ? Promenez-vous entre les œuvres, échangez vos impressions (même si vous ne comprenez pas tout),
  et laissez l’art faire parler vos cœurs. C’est l’occasion parfaite pour montrer que tu as du goût… ou au moins que tu
  sais bien lire les petites plaques explicatives. Un moment à deux qui allie découverte, rires complices et peut-être
  même un brin de romantisme sous le regard bienveillant des maîtres de la peinture !"
}
activity_museum = Activity.new(params_museum)
activity_museum.photo.attach(
  io: URI.open('https://www.panaprium.com/cdn/shop/articles/pexels-zakaria-boumliha-3835726.jpg?v=1679877966'),
  filename: 'museum_beaux_arts.jpeg'
  )
activity_museum.save

params_comedy_club = {
  name: "Comedy Club à Lille : Rires & Rencontres",
  description: "Envie de rencontrer de nouvelles têtes tout en vous bidonnant ? Rejoignez-nous pour une soirée au Comedy Club
  de Lille avec un petit groupe de 4 à 5 personnes prêtes à partager des éclats de rire. Oubliez les awkward silences des
  premières rencontres, ici l’ambiance est à la décontraction totale. Les humoristes s’occupent de l’animation, et vous,
  de profiter de ce moment fun et convivial. C’est l’occasion idéale de créer des liens autour d’un bon fou rire et de
  repartir avec de nouvelles amitiés (et peut-être même quelques blagues à ressortir). Rire ensemble, c’est la meilleure
  façon de briser la glace !"
}
activity_comedy_club = Activity.new(params_comedy_club)
activity_comedy_club.photo.attach(io: URI.open(
  'https://lh3.googleusercontent.com/p/AF1QipO6ymaFoqDuIcGsjWqWf-1w9mb5MJtYhLxdTK1W=s1360-w1360-h1020-rw'),
  filename: 'comedy_club_le_bazar.jpeg'
  )
activity_comedy_club.save

puts "#{Activity.count} activities created 👌"
