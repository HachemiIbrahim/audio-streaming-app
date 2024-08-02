from fastapi import APIRouter, Depends, File, Form, UploadFile
from pytest import Session

from database import get_db
from repository import song_repository

router = APIRouter(
    prefix="/song",
    tags=["song"],
)


@router.post("/upload", status_code=201)
def upload_song(
    song: UploadFile = File(...),
    thumbnail: UploadFile = File(...),
    artist: str = Form(...),
    song_name: str = Form(...),
    hex_code: str = Form(...),
    db: Session = Depends(get_db),
):
    return song_repository.upload_song(
        song=song,
        artist=artist,
        db=db,
        hex_code=hex_code,
        song_name=song_name,
        thumbnail=thumbnail,
    )
