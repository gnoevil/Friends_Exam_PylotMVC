""" 
    Sample Model File

    A Model should be in charge of communicating with the Database. 
    Define specific model method that query the database for information.
    Then call upon these model method in your controller.

    Create a model using this template.
"""
from system.core.model import Model
import re

class Friend(Model):
    def __init__(self):
        super(Friend, self).__init__()
    def create_user(self, info):
        EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
        errors = []

        if not info['name']:
            errors.append('Name cannot be blank')
        elif len(info['name']) < 2:
            errors.append('Name must be at least 2 characters long')

        if not info['alias']:
            errors.append('Alias cannot be blank')
        elif len(info['alias']) < 2:
            errors.append('Alias must be at least 2 characters long')

        if not info['email']:
            errors.append('Email cannot be blank')
        elif not EMAIL_REGEX.match(info['email']):
            errors.append('Email format must be valid!')

        if not info['password']:
            errors.append('Password cannot be blank')
        elif len(info['password']) < 3:
            errors.append('Password must be at least 8 characters long')
        elif info['password'] != info['confirm_pw']:
            errors.append('Password and confirmation must match!')

        if not info['date_of_birth']:
            errors.append('Birth date cannot be blank')
    

        if errors:
            return {"status": False, "errors": errors}
        else:
            password = info['password']
            hashed_pw = self.bcrypt.generate_password_hash(password)
            query = 'INSERT INTO users (name, alias, email, pw_hash, date_of_birth, created_at, updated_at) VALUES (%s,%s,%s,%s, %s, NOW(), NOW())'
            data=[info['name'], info['alias'], info['email'], hashed_pw, info['date_of_birth']]
            self.db.query_db(query, data)
            get_user_query = "SELECT * FROM users ORDER BY id DESC LIMIT 1"
            users = self.db.query_db(get_user_query)
            return { "status": True, "user": users[0] }

    def login_user(self, login_info):
        EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
        errors = []

        if not login_info['email']:
            errors.append('E-mail field required!')
        elif not EMAIL_REGEX.match(login_info['email']):
            errors.append('Pease enter a valid e-mail address!')

        if not login_info['password']:
            errors.append('Password field required!')
        if errors:
            return {'status': False, 'errors': errors}
        else:
            password = login_info['password']
            user_query = "SELECT * FROM users WHERE email = '{}' LIMIT 1".format(login_info['email'])
            users = self.db.query_db(user_query)
            if users[0]:
                if self.bcrypt.check_password_hash(users[0]['pw_hash'], password):
                    return { 
                    "status": True, 
                    "user": users[0] 
                    }
                else:
                    errors.append('Password incorrect!')
                    return {'status': False, 'errors': errors}

    def get_all_friends_by_id(self, id):
        query = "SELECT users.alias as my_name, users2.alias as friend_name, friends.friend_id as friend_id FROM users LEFT JOIN friends ON users.id = friends.user_id LEFT JOIN users as users2 ON users2.id = friends.friend_id WHERE friends.user_id = '{}'".format(id)
            
        friends = self.db.query_db(query)
        return friends

    def get_other_friends(self,id):
        query = "SELECT users.alias as my_name, users2.alias as friend_name, friends.friend_id as friend_id FROM users LEFT JOIN friends ON users.id = friends.user_id LEFT JOIN users as users2 ON users2.id = friends.friend_id WHERE friends.user_id !='{}'".format(id)
            
        friends = self.db.query_db(query)
        return friends


    

    def delete_friend(self, id):
        query = 'DELETE FROM friends WHERE friend_id="{}"'.format(id)
        return self.db.query_db(query)



    def add_friend(self, id, user_id):
        query = 'INSERT INTO friends(user_id, friend_id, created_at, updated_at) VALUES ("{}","{}", NOW(), NOW())'.format(user_id, id)

        return self.db.query_db(query)

    def get_friend_by_id(self, id):
        query = "SELECT * FROM users WHERE id = '{}'".format(id)
            
        return self.db.query_db(query)
        

