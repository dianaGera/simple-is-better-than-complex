from django.test import TestCase
from django.urls import reverse, resolve
from .views import signup


class SignUpTests(TestCase):
    def test_signup_status_code(self):
        #testing status code
        url = reverse('signup')
        response = self.client.get(url)
        self.assertEquals(response.status_code, 200)

    def test_signup_url_resolves_signup_view(self):
        #testing if returning view function is correct
        view = resolve('/signup/')
        self.assertEquals(view.func, signup)