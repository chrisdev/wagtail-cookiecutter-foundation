Template Tags
==============

The listing of template tags can be found in ``{{cookiecutter.project_slug}}/utils/templatetags/{{cookiecutter.project_slug}}_utils.py``. From there they can be modified  

Top Menu to Offcanvas
-----------------------
To switch to the  {% top_menu parent=site_root calling_page=self %} to {% off_canvas_top_menu parent=site_root calling_page=self %} in base.html


Upcoming Events
-----------------
{% upcoming_events %}


Blog Feed
-----------
{% latest_news %}