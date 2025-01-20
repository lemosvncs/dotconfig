import shutil
import os
from git import Repo
import hashlib
from datetime import date, datetime

id = lambda: hashlib.sha256(datetime.now().strftime('%Y-%d-%m %H:%M').encode()).hexdigest()
now = datetime.now().strftime('%Y-%d-%m %H:%M')
home = os.getenv("HOME")

print("Copiando hypr")
shutil.copytree(f"{home}/.config/hypr",
                f"{home}/git/dotconfig",
                dirs_exist_ok=True)
print("Hypr Ok")

print("Gitting")
# repo_url = "https://github.com/lemosvncs/dotconfig"
repo = Repo('.')
repo.index.add('.')

repo.index.commit(f'{now}\nAuto commit\n{id()}')
repo.remotes[0].fetch()
repo.remotes[0].pull()
repo.remotes[0].push()