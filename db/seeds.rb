AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Очистимо таблицю перед додаванням даних
ArticlesCategory.delete_all

# Створюємо основні категорії
cannabis = ArticlesCategory.create(name: 'Каннабіс')
strains = ArticlesCategory.create(name: 'Сорти')
cultivation = ArticlesCategory.create(name: 'Вирощування')
health = ArticlesCategory.create(name: 'Здоров’я та медицина')
legal = ArticlesCategory.create(name: 'Законодавство')

# Створюємо підкатегорії для "Сорти"
sativa = ArticlesCategory.create(name: 'Сатіва', parent: strains)
indica = ArticlesCategory.create(name: 'Індіка', parent: strains)
hybrid = ArticlesCategory.create(name: 'Гібриди', parent: strains)

# Створюємо підкатегорії для "Вирощування"
indoor = ArticlesCategory.create(name: 'Індор (в приміщенні)', parent: cultivation)
outdoor = ArticlesCategory.create(name: 'Аутдор (на відкритому повітрі)', parent: cultivation)
hydroponics = ArticlesCategory.create(name: 'Гідропоніка', parent: cultivation)

# Створюємо підкатегорії для "Здоров’я та медицина"
medicinal_use = ArticlesCategory.create(name: 'Медичне використання', parent: health)
mental_health = ArticlesCategory.create(name: 'Вплив на психічне здоров’я', parent: health)

# Створюємо підкатегорії для "Законодавство"
laws_by_country = ArticlesCategory.create(name: 'Закони за країнами', parent: legal)
recreational_use = ArticlesCategory.create(name: 'Легальне використання для рекреаційних цілей', parent: legal)

# Створюємо підкатегорії для "Закони за країнами"
usa = ArticlesCategory.create(name: 'США', parent: laws_by_country)
canada = ArticlesCategory.create(name: 'Канада', parent: laws_by_country)
europe = ArticlesCategory.create(name: 'Європа', parent: laws_by_country)

# Очистимо таблицю перед додаванням статей
Article.delete_all

# Знайдемо деякі категорії, щоб пов’язати статті
sativa = ArticlesCategory.find_by(name: 'Сатіва')
indica = ArticlesCategory.find_by(name: 'Індіка')
indoor = ArticlesCategory.find_by(name: 'Індор (в приміщенні)')
hydroponics = ArticlesCategory.find_by(name: 'Гідропоніка')

# Створюємо статті для різних категорій
Article.create!(
  title: 'Основи вирощування сатіви',
  body: 'Сатіва потребує більше сонця і часто росте вище за інші сорти...',
  articles_category: sativa
)

Article.create!(
  title: 'Як вирощувати індику в домашніх умовах',
  body: 'Індика зазвичай вирощується в приміщеннях, оскільки вона компактніша...',
  articles_category: indica
)

Article.create!(
  title: 'Переваги вирощування в індорі',
  body: 'Індор вирощування дозволяє контролювати всі фактори навколишнього середовища...',
  articles_category: indoor
)

Article.create!(
  title: 'Використання гідропоніки для вирощування канабісу',
  body: 'Гідропоніка стає популярним методом вирощування завдяки ефективності використання води...',
  articles_category: hydroponics
)
