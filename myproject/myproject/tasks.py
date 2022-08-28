import csv
import string
import xlwt
from django.http import HttpResponse
from django.utils.crypto import get_random_string
from django.core.mail import send_mail

from accounts.forms import User
from celery import shared_task


@shared_task
def create_random_user_accounts(total):
    for i in range(total):
        username = 'user_{}'.format(get_random_string(10, string.ascii_letters))
        email = '{}@example.com'.format(username)
        password = get_random_string(50)
        User.objects.create(username=username, email=email, password=password)
    return '{} random users created with success!'.format(total)


@shared_task
def send_email(subject, message, recipient_list):
    from_email = 'djangoproject64@gmail.com'
    return send_mail(subject, message, from_email, recipient_list, fail_silently=False)

#
# @shared_task
# def export_csv(board_id):
#     response = HttpResponse(content_type='text/csv')
#     response['Content-Disposition'] = 'attachment; filename="boards.csv"'
#
#     writer = csv.writer(response)
#     writer.writerow(['name', 'description'])
#
#     topics = Board.objects.get(pk=board_id).topics.all().values_list('subject', 'board', 'starter', 'views')
#     for topic in topics:
#         writer.writerow(topic)
#     return response


@shared_task
def export_xls(rows):
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


    if len(rows) > 1:
        for row in rows:
            row_num += 1
            for col_num in range(len(row)):
                ws.write(row_num, col_num, row[col_num], font_style)

        wb.save(response)
        return response


# @shared_task
# def export_pdf(request, board_id):
#     board = Board.objects.get(pk=board_id)
#     topics = board.topics.all().annotate(replies=Count('posts'))
#
#     html_string = render_to_string('includes/topic_list_pdf.html', {'topics': topics, 'board': board})
#     url = request.build_absolute_uri()
#     html = HTML(string=html_string, base_url=url)
#     pdf_file = html.write_pdf()
#
#     response = HttpResponse(pdf_file, content_type='application/pdf')
#     response['Content-Disposition'] = f'inline; filename="vcvc.pdf"'
#     return response