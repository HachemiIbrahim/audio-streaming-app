from sqlalchemy import Column, Integer, String

from database import Base


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String)
    password = Column(String)
    username = Column(String)


class Song(Base):
    __tablename__ = "songs"

    id = Column(Integer, primary_key=True, index=True)
    song_url = Column(String)
    thumbnail_url = Column(String)
    artist = Column(String)
    song_name = Column(String)
    hex_code = Column(String)
