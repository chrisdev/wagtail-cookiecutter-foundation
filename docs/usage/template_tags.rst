Template Tags
==============

The listing of template tags can be found in ``{{cookiecutter.repo_name}}/utils/templatetags/{{cookiecutter.repo_name}}_utils.py``. From there they can be modified  

Top Menu to Offcanvas
-----------------------
To switch to the  {% top_menu parent=site_root calling_page=self %} to {% off_canvas_top_menu parent=site_root calling_page=self %} in base.html


Upcoming Events
-----------------
{% upcoming_events %}


Blog Feed
-----------
{% latest_news %}