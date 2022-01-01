import csv
import sys
from datetime import time
from io import BytesIO

import xlwt
from PIL.Image import Image
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.core.files.storage import FileSystemStorage
from django.core.files.uploadedfile import InMemoryUploadedFile
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.db import transaction
from django.db.models import Count
from django.shortcuts import render, get_object_or_404, redirect
from django.http import JsonResponse, HttpResponse, Http404
from django.template.loader import render_to_string
from django.urls import reverse_lazy, reverse
from django.utils import timezone
from django.utils.decorators import method_decorator
from django.views import View
from django.views.generic import CreateView, UpdateView, ListView
from .templatetags.restriction import is_blogger
from .forms import NewTopicForm, PostForm, CreateBoards
from .models import Board, Topic, Post, Photo
from weasyprint import HTML


def home(request):
    boards = Board.objects.filter(is_active=True)
    page = request.GET.get('page', 1)
    paginator = Paginator(boards, 10)
    page_obj = paginator.get_page(page)
    try:
        boards = paginator.page(page)
    except PageNotAnInteger:
        boards = paginator.page(1)
    except EmptyPage:
        boards = paginator.page(paginator.num_pages)

    return render(request, 'boards/home.html', {'boards': boards, 'page_obj': page_obj, 'paginator': paginator})


# class BoardListView(ListView):
#     model = Board
#     context_object_name = 'boards'
#     template_name = 'boards/home.html'
#     paginate_by = 11
#
#     # def get_queryset(self):
#     #     return Post.objects.all()

@login_required
@is_blogger
def blogger_home(request):
    history = Board.history.all()
    page_num = request.GET.get('page')
    paginator = Paginator(history, 10)
    page_obj = paginator.get_page(page_num)

    try:
        page_obj = paginator.page(page_num)
    except PageNotAnInteger:
        # Если страница не является целым числом,возвращаем первую страницу.
        page_obj = paginator.page(1)
    except EmptyPage:
        # Если номер страницы больше, чем общее количество страниц,
        # возвращаем последнюю.
        page_obj = paginator.page(paginator.num_pages)
    context = {
        'history': history,
        'page_obj': page_obj,
        'paginator': paginator
    }
    return render(request, 'boards/blogger_home.html', context=context)

#
# class Blogger_home(ListView):
#     model = Board
#     context_object_name = 'boards'
#     template_name = 'home.html'
#     paginate_by = 10
#     ordering= ['-id']
#     def get_context_data(self,**kwargs):
#         # messages.add_message(self.request,messages.SUCCESS,'khftyde')
#         context = super().get_context_data(**kwargs)
#         context['bloger'] = get_user_status(self.request)
#         context['history'] = Board.history.all()[:10]
#         context['boards'] = Board.objects.filter(is_activ=True).prefetch_related('topic_set')
#         return context


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
    paginate_by = 5

    def get_context_data(self, **kwargs):
        kwargs['board'] = self.board
        return super().get_context_data(**kwargs)

    def get_queryset(self):
        self.board = Board.objects.filter(is_active=True).get(pk=self.kwargs.get('board_id'))
        try:
            self.board
        except:
            raise Http404
        queryset = self.board.topics.order_by('-last_updated').annotate(replies=Count('posts'))
        return queryset



# @login_required
# def new_topic(request, board_id):
#     board = get_object_or_404(Board, pk=board_id)
#     if request.method == 'POST':
#         form = NewTopicForm(request.POST, request.FILES)
#         if form.is_valid():
#             topic = form.save(commit=False)
#             topic.board = board
#             topic.starter = request.user
#
#             topic.save()
#             post = Post.objects.create(
#                 message=form.cleaned_data.get('message'),
#                 topic=topic,
#                 created_by=request.user,
#             )
#             data = {'is_valid': True, 'name': topic.file.name, 'url': topic.file.url}
#             # return redirect('topic_posts', board_id, topic.pk)
#         else:
#             data = {'is_valid': False}
#         return JsonResponse(data)
#     else:
#         form = NewTopicForm()
#         file = PhotoForm()
#     return render(request, 'boards/new_topic.html', {'board': board, 'form': form})

def get_image(photo):
    img3 = Image.open(photo)
    new_img3 = img3.convert('RGB')
    res_img3 = new_img3.resize((700, 450), Image.ANTIALIAS)
    filestream = BytesIO()
    file_ = res_img3.save(filestream, 'JPEG', quality=90)
    filestream.seek(0)
    name = '{}.{}'.format(*photo.name.split('.'))
    photo = InMemoryUploadedFile(
        filestream, 'ImageFiedl', name, 'jpeg/image', sys.getsizeof(filestream),  None
    )
    return photo


@method_decorator(login_required, name='dispatch')
class New_topicView(View):
    def get(self, request, board_id):
        board = get_object_or_404(Board, pk=board_id)
        form1 = NewTopicForm(request.POST, request.FILES)
        return render(request, 'boards/new_topic.html', {'board': board, 'form': form1, 'photos': None})

    @transaction.atomic
    def post(self, request, board_id, images=[]):
        board = get_object_or_404(Board, pk=board_id)
        form = NewTopicForm(request.POST, request.FILES)
        if form.is_valid():
            if not Topic.objects.filter(subject=form.cleaned_data.get('subject'), board=board):
                topic = Topic.objects.create(
                    subject=form.cleaned_data.get('subject'),
                    starter=request.user,
                    board=board
                )
                Post.objects.create(
                    message=form.cleaned_data.get('message'),
                    created_by=request.user,
                    topic=topic
                )
            else:
                topic = Topic.objects.get(subject=form.cleaned_data.get('subject'), board=board)
            files = request.FILES.getlist('file')

            for file in images if not files else files:
                photo = Photo(
                    title=file.name,
                    file=file,
                    topic=topic
                )
                photo.save()
                data = {'is_valid': True, 'name': photo.title}

            if not files:
                return redirect('board_topics', pk=board_id)
        else:
            photo = request.FILES.get('file')
            images.append(get_image(photo))
            data = {'is_valid': True, 'name': photo.name}
        return JsonResponse(data)


@login_required
def new_topic(request, board_id):
    pass


@login_required
def new_topic(request, board_id):
    topics = Topic.objects.all()
    board = get_object_or_404(Board, pk=board_id)
    if request.method == 'POST':
        images = request.FILES.getlist('images')
        print(images)
        for image in images:
            print(image)
            photo = Photo.objects.create(
            title='image',
            file=image,
            topic=topics.get(pk=1)
        )
        return redirect('home')
    return render(request, 'boards/new_topic.html', {'topics': topics, 'board': board})

    # topic =
    # if topic == None:
    #     photos = Photo.objects.all()
    # else:
    #     photos = Photo.objects.filter(topic__subject=topic)
    #
    # topics = Topic.objects.all()
    # context = {'topics': topics, 'photos': photos, 'board': board}
    # return render(request, 'boards/new_topic.html', context)




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
            # subject = f'Hello {topic.starter}!'
            message = f'You create new post!!'
            # recipient_list = [topic.starter.email]
            # send_email.delay(subject, message, recipient_list)
            messages.success(request, message)
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


def export_boards_csv(request, board_id):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="boards.csv"'

    writer = csv.writer(response)
    writer.writerow(['name', 'description'])

    topics = Board.objects.get(pk=board_id).topics.all().values_list('subject', 'board', 'starter', 'views')
    for topic in topics:
        writer.writerow(topic)
    return response


def export_boards_xls(request, board_id):
    response = HttpResponse(content_type='application/ms-excel')
    response['Content-Disposition'] = 'attachment; filename="TopicsXml.xls"'

    wb = xlwt.Workbook(encoding='utf-8')
    ws = wb.add_sheet('Topics')

    row_num = 0

    font_style = xlwt.XFStyle()
    font_style.font.bold = True

    columns = ['subject', 'board', 'starter', 'views']

    for col_num in range(len(columns)):
        ws.write(row_num, col_num, columns[col_num], font_style)

    font_style = xlwt.XFStyle()

    rows = Board.objects.get(pk=board_id).topics.all().values_list('subject', 'board', 'starter', 'views')
    if len(rows) > 1:
        for row in rows:
            row_num += 1
            for col_num in range(len(row)):
                ws.write(row_num, col_num, row[col_num], font_style)

        wb.save(response)
        return response
    return redirect('home')


def export_boards_pdf(request, board_id):
    board = Board.objects.get(pk=board_id)
    topics = board.topics.all()
    if len(topics) > 1:
        html_string = render_to_string(
            'includes/topics_list.html', {'topics': topics, 'board': board})

        html = HTML(string=html_string)
        html.write_pdf(target=f'/tmp/{board.name}.pdf')

        fs = FileSystemStorage('/tmp')
        with fs.open(f'{board.name}.pdf') as pdf:
            response = HttpResponse(pdf, content_type='application/pdf')
            response['Content-Disposition'] = f'attachment; filename="{board.name}.pdf"'
            return response
    else:
        messages.add_message(request, messages.ERROR, 'Failed')
    return redirect('home')