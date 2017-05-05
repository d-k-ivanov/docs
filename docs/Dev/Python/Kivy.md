### Python 2 and >3.5
```bash
python -m pip install --upgrade pip wheel setuptools
python -m pip install docutils pygments pypiwin32 kivy.deps.sdl2 kivy.deps.glew
python -m pip install kivy.deps.gstreamer
python -m pip install kivy
```

### Python 3.5+
> You will need [Glew](http://glew.sourceforge.net/)
```bash
python -m pip install --upgrade pip wheel setuptools
python -m pip install docutils pygments pypiwin32 kivy.deps.sdl2 kivy.deps.glew
python -m pip install kivy.deps.gstreamer
python -m pip install Cython
#python -m pip install https://github.com/kivy/kivy/zipball/master
python -m pip install https://kivy.org/downloads/appveyor/kivy/Kivy-1.9.2.dev0-cp36-cp36m-win_amd64.whl

# For x64 you need to  download 64-bit version pygame from here:
# http://www.lfd.uci.edu/~gohlke/pythonlibs/#pygame
python -m pip install pygame-1.9.3-cp36-cp36m-win_amd64.whl
```

### Test
```py
from kivy.app import App
from kivy.uix.button import Button

class TestApp(App):
  def build(self):
    return Button(text='Hello World')

TestApp().run()
```