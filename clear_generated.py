import os
import pathlib
import shutil

# Clears "generated" directories (run with care)

project_path = pathlib.Path(__file__).parent.absolute()

paths = [path for path in project_path.rglob('generated') if path.is_dir()]

for path in paths:
	shutil.rmtree(str(path), ignore_errors=True)
