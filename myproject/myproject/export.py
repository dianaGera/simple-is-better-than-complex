from celery import shared_task


@shared_task
def export_pdf(fs):
    pass

    # response = HttpResponse(pdf_file, content_type='application/pdf')
    # response['Content-Disposition'] = f'inline; filename="/tmp/report.pdf"'
    # return response