project_slug = '{{ cookiecutter.project_slug }}'

if hasattr(project_slug, 'isidentifier'):
    assert project_slug.isidentifier(), 'Repo should be valid Python identifier!'

