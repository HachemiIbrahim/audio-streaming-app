from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security.oauth2 import OAuth2PasswordRequestForm
from sqlalchemy.orm.session import Session

from auth import oauth2

# from auth.oauth2 import create_access_token
from database import get_db
from models import models
from routers.hashing import Hash

router = APIRouter(tags=["authentication"])


@router.post("/login")
def login(
    request: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(get_db)
):
    user = db.query(models.User).filter(models.User.email == request.username).first()
    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Invalid credentials"
        )
    if not Hash.verify(user.password, request.password):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Incorrect password"
        )

    access_token = oauth2.create_access_token(
        data={"username": user.username, "id": user.id, "email": user.email}
    )

    return {
        "token": access_token,
        "user": {
            "username": user.username,
            "id": user.id,
            "email": user.email,
        },
    }
