# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Flat.destroy_all
flats_attributes = [
 {
   title:        "Combi 1987",
   description:  "Un super VW 1987 avec lequel on fait le tour de France",
   city:         "Paris",
   price:        "50"
 },
 {
   title:        "Wagon 2013",
   description:  "Le top de la modernité",
   city:         "Souston",
   price:        "90"
 },
 {
   title:        "Véhicule 1965",
   description:  "Un modèle vintage",
   city:         "Paris",
   price:        "80"
 },
 {
   title:        "Mon Van",
   description:  "Modèle 2001",
   city:         "Marseille",
   price:        "60"
 },
 {
   title:        "Super Combi",
   description:  "Combi 1995 à louer",
   city:         "Lyon",
   price:        "40"
 }
]
flats_attributes.each { |params| Flat.create!(params) }
=======
Flat.destroy_all
flats_attributes = [
  {
    title:        "Combi 1987",
    description:  "Un super VW 1987 avec lequel on fait le tour de France",
    city:         "Paris",
    price:        "50"
  },
  {
    title:        "Wagon 2013",
    description:  "Le top de la modernité",
    city:         "Souston",
    price:        "90"
  },
  {
    title:        "Véhicule 1965",
    description:  "Un modèle vintage",
    city:         "Bordeaux",
    price:        "80"
  },
  {
    title:        "Mon Van",
    description:  "Modèle 2001",
    city:         "Marseille",
    price:        "60"
  },
  {
    title:        "Super Combi",
    description:  "Combi 1995 à louer",
    city:         "Lyon",
    price:        "40"
  }
]
flats_attributes.each { |params| Flat.create!(params) }