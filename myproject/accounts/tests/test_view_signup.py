from django.contrib.auth.models import User
from django.urls import resolve, reverse
from django.test import TestCase
from ..forms import SignupForm
from ..views import signup


class SignUpTests(TestCase):
    def setUp(self):
        url = reverse('signup')
        self.response = self.client.get(url)

    def test_signup_status_code(self):
        #testing status code
        self.assertEquals(self.response.status_code, 200)

    def test_signup_url_resolves_signup_view(self):
        #testing if returning view function is correct
        view = resolve('/signup/')
        self.assertEquals(view.func, signup)

    def test_csrf(self):
        self.assertContains(self.response, 'csrfmiddlewaretoken')

    def test_contains_form(self):
        form = self.response.context.get('form')
        self.assertIsInstance(form, SignupForm)

    def test_form_inputs(self):
        # if our form contains five inputs: csrf, username, email, password1, password2
        self.assertContains(self.response, '<input', 5)
        self.assertContains(self.response, 'type="text"', 1)
        self.assertContains(self.response, 'type="email"', 1)
        self.assertContains(self.response, 'type="password"', 2)

    def test_form_has_fields(self):
        form = SignupForm()
        expected = ['username', 'email', 'password1', 'password2',]
        actual = list(form.fields)
        self.assertSequenceEqual(expected, actual)


class SuccessfulSignUpTests(TestCase):
    def setUp(self):
        url = reverse('signup')
        data = {
            'username': 'john',
            'email': 'john@gmail.com',
            'password1': 'abcdef123456',
            'password2': 'abcdef123456'
        }
        self.response = self.client.post(url, data)
        self.home_url = reverse('home')

    def test_redirection(self):
        #A valid form submission should redirect the user to the home page
        self.assertRedirects(self.response, self.home_url)

    def test_user_creation(self):
        #check if user was registered
        self.assertTrue(User.objects.exists())

    def test_user_authentication(self):
        #check if user is authenticated after reg
        response = self.client.get(self.home_url)
        user = response.context.get('user')
        self.assertTrue(user.is_authenticated)


class InvalidSignUpTests(TestCase):
    def setUp(self):
        url = reverse('signup')
        # trying to submit an empty dictionary
        self.response = self.client.post(url, {})

    def test_signup_status_code(self):
        #An invalid form submission should return to the same page
        self.assertEquals(self.response.status_code, 200)

    def test_form_errors(self):
        #if there is some error messages
        form = self.response.context.get('form')
        self.assertTrue(form.errors)

    def test_dont_create_user(self):
        #check if user was registered after invalid data
        self.assertFalse(User.objects.exists())
