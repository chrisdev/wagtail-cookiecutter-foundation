project_slug = '{{ cookiecutter.project_slug }}'
msg = 'Project Slug should be valid Python identifier!'
if hasattr(project_slug, 'isidentifier'):
    assert project_slug.isidentifier(), msg
