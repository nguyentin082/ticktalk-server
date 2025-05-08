from sqlalchemy.orm import Session
from src.langchain.core import engine, Base, SessionLocal
from src.langchain.topic import Topic

def create_topics_table():
    Base.metadata.create_all(bind=engine)
    print("Topics table created successfully!")


def load_topics(topics: list):
    db: Session = SessionLocal()

    try:
        for topic_name in topics:
            topic = Topic(name=topic_name)
            db.add(topic)
        db.commit()
        print("Mock topics loaded successfully!")
    except Exception as e:
        db.rollback()
        print(f"Error loading mock topics: {e}")
    finally:
        db.close()


if __name__ == "__main__":
    create_topics_table()

    mock_topics = [
        "Travel",
        "Technology",
        "Health",
        "Education",
        "Entertainment",
        "Sports",
        "Science",
        "Food",
        "Art",
        "History"
    ]

    load_topics(mock_topics)