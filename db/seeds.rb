# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
author = Author.create([{ first_name: 'JRR', last_name: 'Tolkien' }, { first_name: 'C.S.', last_name: 'Lewis' }])
Book.create({ title: 'Two Towers', author: author.first })
