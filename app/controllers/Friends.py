"""
    Sample Controller File

    A Controller should be in charge of responding to a request.
    Load models to interact with the database and load views to render them to the client.

    Create a controller using this template
"""
from system.core.controller import *

class Friends(Controller):
    def __init__(self, action):
        super(Friends, self).__init__(action)
        self.load_model('Friend')

    def index(self):
        return self.load_view('index.html')

    def greetings(self):
        id = session['id']
        friends = self.models['Friend'].get_all_friends_by_id(id)

        other_friends = self.models['Friend'].get_other_friends(id)
        print other_friends
        length = len(friends)
        return self.load_view('greetings.html', friends=friends, other_friends=other_friends, length=length)




    def create(self):
        print 'hello create'
        user_info = {
            'name': request.form['name'],
            'alias': request.form['alias'],
            'email': request.form['email'],
            'password': request.form['password'],
            'confirm_pw':request.form['confirm_pw'],
            'date_of_birth': request.form['date_of_birth']
        }
        create_status = self.models['Friend'].create_user(user_info)
        if create_status['status'] == True:
            session['id'] = create_status['user']['id']
            session['name'] = create_status['user']['name']
            session['alias'] = create_status['user']['alias']
            session['email'] = create_status['user']['email']
            session['password'] = create_status['user']['pw_hash']
            session['date_of_birth'] = create_status['user']['date_of_birth']

            return redirect('/greetings')
        else:
            for message in create_status['errors']:
                flash(message, 'you have errors!')
            return redirect('/')

    def login(self):
        print request.form['email']
        login_info = {
            "email" : request.form['email'],
            "password" : request.form['password']
        }
        print login_info
        user_login = self.models['Friend'].login_user(login_info)
        if user_login['status'] == True:
            session['email'] = user_login['user']['email']
            session['id'] = user_login['user']['id']
            session['name'] = user_login['user']['name']
            return redirect('/greetings')
        else:
            for message in user_login['errors']:
                flash(message,'errors')
            return redirect('/')


    def logout(self):
        session.clear()
        return redirect('/')

    def view_profile(self, id):
        friends = self.models['Friend'].get_friend_by_id(id)
        return self.load_view('view_profile.html',friends=friends[0])

    def delete(self, id):
        self.models['Friend'].delete_friend(id)
        return redirect('/greetings')

    def add_friend(self, id):
        self.models['Friend'].add_friend(id, session['id'])

        return redirect('/greetings')

    def view_alias(self, id):
        other_friends = self.models['Friend'].get_friend_by_id(id)
        return self.load_view('view_alias.html',other_friends=other_friends[0])
