from app import create_app

app = create_app()
app.app_context().push()

# Запуск приложения
app.run(debug=True)
