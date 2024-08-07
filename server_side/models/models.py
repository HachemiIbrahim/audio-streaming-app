from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship

from database import Base


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String)
    password = Column(String)
    username = Column(String)
    favorites = relationship("Favorites", back_populates="user")


class Song(Base):
    __tablename__ = "songs"

    id = Column(Integer, primary_key=True, index=True)
    song_url = Column(String)
    thumbnail_url = Column(String)
    artist = Column(String)
    song_name = Column(String)
    hex_code = Column(String)


class Favorites(Base):
    __tablename__ = "favorites"

    id = Column(Integer, primary_key=True, index=True)
    song_id = Column(Integer, ForeignKey("songs.id"))
    user_id = Column(Integer, ForeignKey("users.id"))

    song = relationship("Song")
    user = relationship("User", back_populates="favorites")
