from database import get_db
from fastapi import APIRouter, Depends, status
from repository import user_repository
from schemas import schema
from sqlalchemy.orm import Session

router = APIRouter(
    prefix="/user",
    tags=["user"],
)


@router.post("/signup", status_code=status.HTTP_201_CREATED)
def create_user(request: schema.UserBase, db: Session = Depends(get_db)):
    return user_repository.create(request, db)
