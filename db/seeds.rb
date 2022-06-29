# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Sembrar tabla Product
# =============================================================================
#
Output.destroy_all
Log.destroy_all

Input.destroy_all
#
Input.create!(
    in_0: 1,
    in_1: "hola",
    in_2: 2
)
Input.create!(
    in_0: 2,
    in_1: "test",
    in_2: 5
)
Input.create!(
    in_0: 3,
    in_1: "mundo",
    in_2: 4
)

p "Input creados = #{Input.count}"
