Importers::Csv.import('db/seeds/sample_data.csv', 'db/seeds/images')

User.create(first_name: "Hans", last_name: "Schuler" email: "admin@publicartcommons.dev", password: "password", role: 0)
