from django.test import TestCase
from django.urls import resolve, reverse
from boards.views import BoardListView
from boards.models import Board


class HomeTests(TestCase):
    def setUp(self):
        #create a test db object that will be called in each test
        self.board = Board.objects.create(name='Django', description='Django board.')
        url = reverse('home')
        self.response = self.client.get(url)

    def test_home_view_status_code(self):
        #examine an assertive http status
        self.assertEquals(self.response.status_code, 200)

    def test_home_url_resolves_home_view(self):
        #cheking if url name equals its view function
        view = resolve('/')
        # self.assertEquals(view.func, home)
        self.assertEquals(view.func.view_class, BoardListView)

    def test_home_view_contains_link_to_topics_page(self):
        board_topics_url = reverse('board_topics', kwargs={'board_id': self.board.pk})
        self.assertContains(self.response, 'href="{0}"'.format(board_topics_url))

