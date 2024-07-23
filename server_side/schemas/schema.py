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
