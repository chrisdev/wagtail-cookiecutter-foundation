"""
Sample tasks file.
Will fallback to a simple task decorator that returns the original function.
"""

from django.conf import settings

from celery.decorators import task

# We could have installed celery for other projects.
# Check if we have defined the BROKER_URL setting. If not then definitely we
# haven't configured it.
if not hasattr(settings, 'BROKER_URL'):
    # So if we enter here we will define a different "task" decorator that
    # just returns the original function and sets its delay attribute to
    # point to the original function: This way, the actual callee
    # function (task_function()) will be called instead of task_function.delay()
    def task(f):
        f.delay = f
        return f
