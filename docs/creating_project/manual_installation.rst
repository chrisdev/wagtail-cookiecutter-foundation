Manual Installation
===================

Firstly, open up a command line shell in your new projects directory.
    
1. **Create a virtual environment**


  **Linux/Mac OSX:** :code:`pyvenv venv`

  **Windows:** :code:`c:\Python34\python -m venv myenv`

  **Python 2.7**

  ``pyvenv`` is only included with Python 3.3 onwards.
  To get virtual environments on Python 2, use the ``virtualenv`` package:

  .. code-block:: bash

      pip install virtualenv
      virtualenv venv

  **Virtualenvwrapper**

  virtualenvwrapper_ provides a set of commands which makes working with virtual environments much more pleasant. It also places all your virtual environments in one place.

  To install (make sure virtualenv is already installed):

  .. code-block:: bash

      pip install virtualenvwrapper
      export WORKON_HOME=~/Envs
      source /usr/local/bin/virtualenvwrapper.sh
      mkvirtualenv venv

  *Windows*:

  .. code-block:: bash

      pip install virtualenvwrapper-win
      mkvirtualenv venv

  .. _virtualenvwrapper: http://virtualenvwrapper.readthedocs.org/en/latest/index.html

2. **Activate the virtual environment**

  **Linux/Mac OSX:** :code:`source venv/bin/activate`

  **Windows:** :code:`venv/Scripts/activate.bat`

  **Virtualenvwrapper:** :code:`workon venv`

3. **Install PIP requirements**

  :code:`pip install -r requirements/dev.txt`

.. _Fabric: http://www.fabfile.org/

4. **Create the database*

  By default require ``PostgreSQL`` to be installed

.. code-block:: sh

    createdb my_site

5. **Load the Initial Data**
   The cookiecutter comes with some pages already created for your
   convenience including the Homepage with a working ``bx_slider`` slide show, 
   contact page, events and news/blog pages. To generate these pages run:

  :code:`psql -d my_site -f ansible/roles/web/files/initial_data.sql`
  
  The default Admin username is *admin*
  
  The default Admin password is *admin123*

  To copy the media directory to project root.

  :code:`./manage.py copy_media`

6. **Install Packages (Foundation, Font-Awesome etc.) using Bower package manager**

  We use bower_ for front-end dependency management. To install front
  dependencies use

  :code:`bower install`

  This will install the supported version of `Zurb Foundation`_, `Font
  Awesome`_ and bxSlider_ as well as their dependencies.

  ..  _bower: http://bower.io
  ..  _bxSlider: http://bxslider.com
  ..  _`Font Awesome`: http://fontawesome.io 

  
7. **Run the development server**

  :code:`./manage.py runserver`

  Your site is now accessible at ``http://localhost:8000``,
  with the admin backend available at ``http://localhost:8000/admin/``.

.. _`Zurb Foundation`: https://foundation.zurb.com