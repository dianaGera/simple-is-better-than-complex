from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.db.models import Count
from django.shortcuts import render, get_object_or_404, redirect
from django.http import JsonResponse
from django.template.loader import render_to_string
from django.urls import reverse_lazy, reverse
from django.utils import timezone
from django.utils.decorators import method_decorator
from django.views.generic import CreateView, UpdateView, ListView
from .templatetags.restriction import is_blogger

from .forms import NewTopicForm, PostForm, CreateBoards
from .models import Board, Topic, Post


# def home(request):
#     boards = Board.objects.all()
#     return render(request, 'home.html', {'boards': boards})


class BoardListView(ListView):
    model = Board
    context_object_name = 'boards'
    template_name = 'boards/home.html'


@login_required
@is_blogger
def create_boards(request):
    if request.method == 'POST':
        form = CreateBoards(request.POST)
    else:
        form = CreateBoards()
    return save_boards(request, form, 'boards/create_boards.html')


@login_required
@is_blogger
def update_boards(request, board_id):
    board = get_object_or_404(Board, pk=board_id)
    if request.method == 'POST':
        form = CreateBoards(request.POST, instance=board)
    else:
        form = CreateBoards(instance=board)
    return save_boards(request, form, 'boards/update_boards.html')


@login_required
@is_blogger
def save_boards(request, form, template_name):
    data = dict()
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            data['form_is_valid'] = True
            boards = Board.objects.all()
            data['boards_list'] = render_to_string('includes/boards_list.html',
                                                   {'boards': boards})
            #!?!?!?!?
            if template_name == 'boards/update_boards.html':
                messages.success(request, 'Board was updated successfully!')
            if template_name == 'boards/create_boards.html':
                messages.success(request, 'Board was created successfully!')
        else:
            data['form_is_valid'] = False
            messages.error(request, 'Something went wrong. Try again')
    context = {'form': form}
    data['html_form'] = render_to_string(template_name, context, request=request)
    return JsonResponse(data)


@login_required
@is_blogger
def delete_boards(request, board_id):
    board = get_object_or_404(Board, pk=board_id)
    data = dict()
    if request.method == 'POST':
        board.delete()
        data['form_is_valid'] = True
        boards = Board.objects.all()
        data['boards_list'] = render_to_string('includes/boards_list.html',
                                               {'boards': boards})
        messages.success(request, 'Board was deleted successfully')
        #!?!?!?
        try:
            board in boards
        except ObjectDoesNotExist:
            messages.error(request, 'Something went wrong. Try again')
    else:
        context = {'board': board}
        data['html_form'] = render_to_string('boards/delete_boards.html',
                                             context, request=request)

    return JsonResponse(data)


# board_topics FCV
# def board_topics(request, board_id):
#     board = get_object_or_404(Board, pk=board_id)
#     queryset = board.topics.order_by('-last_updated').annotate(replies=Count('posts')-1)
#     page = request.GET.get('page', 1)
#     paginator = Paginator(queryset, 20)
#
#     try:
#         topics = paginator.page(page)
#     except PageNotAnInteger:
#         topics = paginator.page(1)
#     except EmptyPage:
#         topics = paginator.page(paginator.num_pages)
#
#     return render(request, 'boards/topics.html', {'board': board, 'topics': topics})


# board_topics GCBV with pagination
class TopicListView(ListView):
    model = Topic
    context_object_name = 'topics'
    template_name = 'boards/topics.html'
    paginate_by = 15

    def get_context_data(self, **kwargs):
        kwargs['board'] = self.board
        return super().get_context_data(**kwargs)

    def get_queryset(self):
        self.board = get_object_or_404(Board, pk=self.kwargs.get('board_id'))
        queryset = self.board.topics.order_by('-last_updated').annotate(replies=Count('posts'))
        return queryset


# board_topics FCV with infinity scroll
def test(request, board_id):
    board = get_object_or_404(Board, pk=board_id)
    topics = Topic.objects.filter(board=board).order_by('-last_updated').annotate(replies=Count('posts') - 1)
    number_list = range(1, 1000)
    page = request.GET.get('page', 1)
    paginator = Paginator(number_list, 5)

    try:
        numbers = paginator.page(page)
    except PageNotAnInteger:
        numbers = paginator.page(1)
    except EmptyPage:
        numbers = paginator.page(paginator.num_pages)

    return render(request, 'boards/test.html', {'board': board, 'numbers': numbers})


@login_required
def new_topic(request, board_id):
    board = get_object_or_404(Board, pk=board_id)
    if request.method == 'POST':
        form = NewTopicForm(request.POST)
        if form.is_valid():
            topic = form.save(commit=False)
            topic.board = board
            topic.starter = request.user
            topic.save()
            post = Post.objects.create(
                message=form.cleaned_data.get('message'),
                topic=topic,
                created_by=request.user
            )
            return redirect('topic_posts', board_id=board_id, topic_id=topic.id)
    else:
        form = NewTopicForm()
    return render(request, 'boards/new_topic.html', {'board': board, 'form': form})


# def topic_posts(request, board_id, topic_id):
#     topic = get_object_or_404(Topic, board__pk=board_id, pk=topic_id)
#     topic.views += 1
#     topic.save()
#     return render(request, 'boards/topic_posts.html', {'topic': topic})

class PostListView(ListView):
    model = Post
    template_name = 'boards/topic_posts.html'
    context_object_name = 'posts'
    paginate_by = 4

    def get_context_data(self, **kwargs):
        #prevent redundant views from one user
        session_key = 'viewed_topic_{}'.format(self.topic.pk)
        if not self.request.session.get(session_key, False):
            self.topic.views += 1
            self.topic.save()
            self.request.session[session_key] = True

        kwargs['topic'] = self.topic
        return super().get_context_data(**kwargs)

    def get_queryset(self):
        self.topic = get_object_or_404(Topic, board__pk=self.kwargs.get('board_id'),
                                       pk=self.kwargs.get('topic_id'))
        queryset = self.topic.posts.order_by('created_at')
        return queryset


@login_required
def reply_topic(request, board_id, topic_id):
    topic = get_object_or_404(Topic, board__pk=board_id, pk=topic_id)
    if request.method == 'POST':
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.topic = topic
            post.created_by = request.user
            post.save()

            topic.last_updated = timezone.now()
            topic.save()

            topic_url = reverse('topic_posts', kwargs={'board_id': board_id, 'topic_id': topic_id})
            topic_post_url = '{url}?page={page}#{id}'.format(
                url=topic_url,
                id=post.pk,
                page=topic.get_page_count()
            )

            return redirect(topic_post_url)
    else:
        form = PostForm()
    return render(request, 'boards/reply_topic.html', {'form': form, 'topic': topic})


class NewPostView(CreateView):
    model = Post
    form_class = PostForm
    success_url = reverse_lazy('post_list')
    template_name = 'boards/new_post.html'


#The way we use view decorators on class-based views
@method_decorator(login_required, name='dispatch')
class PostUpdateView(UpdateView):
    model = Post
    fields = ('message', )
    template_name = 'boards/edit_post.html'
    pk_url_kwarg = 'post_pk'
    context_object_name = 'post'

    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset.filter(created_by=self.request.user)

    def form_valid(self, form):
        post = form.save(commit=False)
        post.updated_by = self.request.user
        post.updated_at = timezone.now()
        post.save()
        return redirect('topic_posts', board_id=post.topic.board.pk, topic_id=post.topic.pk)



