from django import forms

class Employee(forms.Form):
   name=forms.CharField()
   salary=forms.IntegerField()

