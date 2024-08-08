from pydantic import BaseModel


class UserBase(BaseModel):
    username: str
    email: str
    password: str  # hash password


class UserDisplay(BaseModel):
    username: str
    email: str

    class Config:
        orm_mode = True


class UserAuth(BaseModel):
    id: int
    username: str
    email: str


class User(BaseModel):
    username: str

    class Config:
        orm_mode = True


class SongBase(BaseModel):
    songurl: str
    tumbnailurl: str
    artist: str
    songname: str
    hexcode: str


class SongDisplay(BaseModel):
    songurl: str
    tumbnailurl: str
    artist: str
    songname: str
    hexcode: str

    class Config:
        orm_mode = True


class Song(BaseModel):
    id: int
    songurl: str
    tumbnailurl: str
    artist: str
    songname: str
    hexcode: str

    class Config:
        orm_mode = True


class FavoriteSongRequest(BaseModel):
    song_id: int
