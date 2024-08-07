import cloudinary
import cloudinary.uploader
from fastapi import Depends, File, Form, UploadFile
from sqlalchemy.orm import Session

from auth.oauth2 import verify_token
from database import get_db
from models import models

cloudinary.config(
    cloud_name="dsomyc4hv",
    api_key="433823972159394",
    api_secret="i7gUk6UOSuARwXHRe6Wz-6Uu7uo",
    secure=True,
)


def upload_song(
    song: UploadFile = File(...),
    thumbnail: UploadFile = File(...),
    artist: str = Form(...),
    song_name: str = Form(...),
    hex_code: str = Form(...),
    db: Session = Depends(get_db),
    auth_dict=Depends(verify_token),
):

    song_res = cloudinary.uploader.upload(
        song.file, resource_type="auto", folder="songs"
    )
    thumbnail_res = cloudinary.uploader.upload(
        thumbnail.file, resource_type="image", folder="songs"
    )

    new_song = models.Song(
        song_url=song_res["url"],
        thumbnail_url=thumbnail_res["url"],
        artist=artist,
        song_name=song_name,
        hex_code=hex_code,
    )
    db.add(new_song)
    db.commit()
    db.refresh(new_song)

    return new_song


def get_all_songs(
    db: Session,
    auth_dict=Depends(verify_token),
):
    songs = db.query(models.Song).all()
    return songs


def favorite_song(
    song_id: int = Form(...),
    db: Session = Depends(get_db),
    auth_dict=Depends(verify_token),
):
    # song is already favorited by the user
    user_id = auth_dict["id"]
    uid = int(user_id)
    fav_song = (
        db.query(models.Favorites)
        .filter(
            models.Favorites.song_id == song_id,
            models.Favorites.user_id == uid,
        )
        .first()
    )

    if fav_song:
        db.delete(fav_song)
        db.commit()
        return {"message": False}
    else:
        new_fav = models.Favorites(song_id=song_id, user_id=uid)
        db.add(new_fav)
        db.commit()
        return {"message": True}
