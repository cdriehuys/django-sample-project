from django.urls import path

from health import views


app_name = "health"

urlpatterns = [
    path("alive/", views.alive, name="alive"),
    path("ready/", views.ready, name="ready"),
]
