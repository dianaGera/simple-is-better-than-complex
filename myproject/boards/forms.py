from django import forms
from .models import Post, Board


class NewTopicForm(forms.Form):
    subject = forms.CharField(max_length=100)
    message = forms.CharField(
        widget=forms.Textarea(
            attrs={'row': 5, 'placeholder': 'What is your mind?'}
        ),
        max_length=4000,
        help_text='Max length is 4000')

    file = forms.FileField(
        required=False,
        widget=forms.ClearableFileInput(
            attrs={
                'multiple': True,
                'class': 'js-upload-photos',
                'id': 'fileupload'}))

    class Meta:
        fields = ('subject', 'message', 'file')


class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ['message', ]


class CreateBoards(forms.ModelForm):
    class Meta:
        model = Board
        fields = ('name', 'description')
        widgets = {
            'description': forms.Textarea(
                attrs={'rows': 8}
            )
        }




