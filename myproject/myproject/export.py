import csv
import string
import xlwt
from django.core.files.storage import FileSystemStorage
from django.db.models import Count
from django.http import HttpResponse
from django.template.loader import render_to_string
from weasyprint import HTML
from boards.models import Board
from celery import shared_task


@shared_task
def export_pdf(fs):
    pass

    # response = HttpResponse(pdf_file, content_type='application/pdf')
    # response['Content-Disposition'] = f'inline; filename="/tmp/report.pdf"'
    # return response