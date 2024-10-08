from fastapi import APIRouter, Depends, File, Form, UploadFile
from pytest import Session

from auth.oauth2 import verify_token
from database import get_db
from repository import song_repository
from schemas.schema import FavoriteSongRequest

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
    auth_dict=Depends(verify_token),
):
    return song_repository.upload_song(
        song=song,
        artist=artist,
        db=db,
        hex_code=hex_code,
        song_name=song_name,
        thumbnail=thumbnail,
        auth_dict=auth_dict,
    )


@router.get("/songs")
def get_all_songs(
    db: Session = Depends(get_db),
    auth_dict=Depends(verify_token),
):
    songs = song_repository.get_all_songs(
        db=db,
        auth_dict=auth_dict,
    )
    return songs


@router.post("/favorite", status_code=201)
def favorite_song(
    request: FavoriteSongRequest,
    db: Session = Depends(get_db),
    auth_dict=Depends(verify_token),
):
    response = song_repository.favorite_song(
        song_id=request.song_id,
        db=db,
        auth_dict=auth_dict,
    )
    return response


@router.get("/list/favorite", status_code=200)
def list_fav_songs(
    db: Session = Depends(get_db),
    auth_dict=Depends(verify_token),
):
    response = song_repository.list_fav_songs(
        auth_dict=auth_dict,
        db=db,
    )

    return response
