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
    songurl: str
    tumbnailurl: str
    artist: str
    songname: str
    hexcode: str

    class Config:
        orm_mode = True
