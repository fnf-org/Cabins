import os 
from lxml import html  

from locust import HttpUser, task

class HelloWorldUser(HttpUser):
    @task
    def hello_world(self):
        self.client.get("/accommodations")

    def on_start(self):
        self.username = os.environ.get('LOCUST_USER', 'gerstle+cabins@gmail.com')
        self.password = os.environ.get('LOCUST_PASSWORD', 'nopenope')
        landing_response = self.client.get("/login")
        tree = html.fromstring(landing_response.text)
        csrf_token = tree.xpath('/html/head/meta[@name="csrf-token"]/@content')[0]
        auth_token = tree.xpath('//form/input[@name="authenticity_token"]/@value')[0]
        self.client.post("/login",
            {"session[email]": self.username,
            "session[password]": self.password,
            "authenticity_token": auth_token},
            headers={"X-CSRFToken": csrf_token})
        print('Login with %s email and %s password', self.username, self.password)
