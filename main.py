from app import create_app, db
from sqlalchemy.orm import class_mapper
from sqlalchemy.orm.util import identity_key
from app.models import User, Comment, Article


def print_mapping_info(model):
    mapper = class_mapper(model)

    print(f"Model: {model.__name__}")
    print(f"Columns: {[prop.key for prop in mapper.column_attrs]}")
    print(f"Relationships: {[rel.key for rel in mapper.relationships]}")
    print()


app = create_app()
app.app_context().push()

# Вывод информации о маппинге
with app.app_context():
    print_mapping_info(User)
    print_mapping_info(Comment)
    print_mapping_info(Article)

# Запуск приложения
app.run(debug=True)
