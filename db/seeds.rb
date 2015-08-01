Importers::Csv.import('db/seeds/sample_data.csv', 'db/seeds/images')

User.create(email: "admin@publicartcommons.dev", password: "password", role: 0)
