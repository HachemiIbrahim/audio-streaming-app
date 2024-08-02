import random
import shutil
import string

from fastapi import Depends, File, Form, UploadFile
from sqlalchemy.orm import Session

from auth.oauth2 import verify_token
from database import get_db
from models import models


def upload_song(
    song: UploadFile = File(...),
    thumbnail: UploadFile = File(...),
    artist: str = Form(...),
    song_name: str = Form(...),
    hex_code: str = Form(...),
    db: Session = Depends(get_db),
    auth_dict=Depends(verify_token),
):

    letters = string.ascii_letters
    random_string = "".join(random.choice(letters) for i in range(6))
    new = f"_{random_string}."
    songfilename = new.join(song.filename.rsplit(".", 1))
    thumbnailfilename = new.join(thumbnail.filename.rsplit(".", 1))
    songpath = f"song/{songfilename}"
    thumbnailpath = f"song/{thumbnailfilename}"

    with open(songpath, "w+b") as buffer:
        shutil.copyfileobj(song.file, buffer)
    with open(thumbnailpath, "w+b") as buffer:
        shutil.copyfileobj(thumbnail.file, buffer)

    new_song = models.Song(
        song_url=songpath,
        thumbnail_url=thumbnailpath,
        artist=artist,
        song_name=song_name,
        hex_code=hex_code,
    )
    db.add(new_song)
    db.commit()
    db.refresh(new_song)

    return new_song
