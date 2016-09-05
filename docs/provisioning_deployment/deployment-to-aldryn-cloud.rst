Deployment to Aldryn Cloud
==========================

Wagtail is now supported on `Aldryn Cloud`_. The following steps will guide you to deploy `Wagtail Cookiecutter Foundation`_ projects on Aldryn Cloud.

.. _Aldryn Cloud: https://www.divio.com/en/
.. _Wagtail Cookiecutter Foundation: https://github.com/chrisdev/wagtail-cookiecutter-foundation

Steps to Deploy
---------------

1. Create a Wagtail project (like ``wagtail-aldryn``) on Aldryn using the guide - `Get Started with Wagtail on Aldryn`_

2. Create a local development environment of project generated.

3. Suppose the project you want to deploy (generated with Wagtail Cookiecutter Foundation) is named as ``wagtail-demo``.

4. Now we can copy the apps directories from ``wagtail-demo`` project directory to ``wagtail-aldryn`` project directory. You can move apps like ``pages``, ``blog``, ``utils`` etc. You are free to move any app but remember all static assets are present in ``pages`` app.

5. Copy the ``media`` directory to ``wagtail-aldryn`` project directory.

6. Open ``requirements.in`` file from ``wagtail-aldryn`` project. Add the following requirements::

	wagtailfontawesome==1.0.5
	celery==3.1.23
	django-cachalot==1.2.1
	django-compressor==2.1
	django-environ==0.4.0
	django-foundation-formtags==0.0.6
	django-wagtail-feeds==0.0.3
	django-libsass==0.7
	django-redis==4.4.4
	elasticsearch==2.4.0
	libsass==0.11.1

For updated list, copy the requirements from your ``wagtail-demo`` project.

7. Open ``settings.py`` file from ``wagtail-aldryn`` project. Add the following::

	INSTALLED_APPS.extend([
	    # add your project specific apps here
	    'compressor',
	    'foundation_formtags',
	    'wagtail_feeds',

	    'utils',
	    'pages',
	    'blog',
	    'events',
	    'contact',
	    'people',
	    'photo_gallery',
	    'products',
	    'documents_gallery',
	])

	COMPRESS_PRECOMPILERS = (
	    ('text/x-scss', 'django_libsass.SassCompiler'),
	)

8. Importing Database from ``wagtail-demo`` project.

- Create db dump of ``wagtail-demo`` project.
- Wagtail Cookiecutter Foundation and Aldryn projects use PostgreSQL as a database management system (DBMS). To transfer your existing Postgres data dumps into the ``wagtail-aldryn`` project, the commands to do so could look like following example::

	docker exec <container_id> dropdb -U postgres db --if-exists

	docker exec <container_id> createdb -U postgres db

	docker exec <container_id> psql -U postgres --dbname=db -c "CREATE EXTENSION IF NOT EXISTS hstore"

	docker run --rm -v /path/to/dump:/app/tmp/db_dump --link <container_id>:postgres postgres:9.4 /bin/bash -c pg_restore -h postgres -U postgres -F /app/tmp/db_dump --dbname=db -n public --no-owner --exit-on-error

Note: ``<container_id>`` is usually something like: ``projectslug_db`` (if you’re unsure, open the docker-compose.yaml file and check.

9. Test locally if everything works.

10. Push changes to Server

To push code changes to the test server, run for example::

	git add .
	git commit -m "Your commit message"
	git push

To push DB changes, run::

	aldryn project push db

To push media file changes, run::

	aldryn project push media

To deploy the test server, run::

	aldryn project deploy

Useful links:

- https://support.divio.com/hc/en-us/articles/209053809-Get-Started-with-Wagtail-on-Aldryn
- https://support.divio.com/hc/en-us/articles/208393155-Moving-your-Django-projects-to-Aldryn
- https://support.divio.com/hc/en-us/articles/208243415

.. _Get Started with Wagtail on Aldryn: https://support.divio.com/hc/en-us/articles/209053809-Get-Started-with-Wagtail-on-Aldryn