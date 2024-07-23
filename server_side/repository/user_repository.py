from fastapi import HTTPException, status
from models import models
from routers.hashing import Hash
from schemas.schema import UserBase
from sqlalchemy.orm import Session


def create(request: UserBase, db: Session):
    new_user = models.User(
        username=request.username,
        email=request.email,
        password=Hash.bycrypt(request.password),
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    return new_user


def get_user_by_email(db: Session, email=str):
    user = db.query(models.User).filter(models.User.email == email).first()
    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"User with email {email} not found",
        )
    return user
