from flask import Flask ,request, jsonify
import POS
import json

app = Flask(__name__)
response = ''
cnt=0
links={}
links2={}
links3={}
tag1={}
tag2={}
tag3={}

@app.route('/', methods = ['GET', 'POST'])
def index():
    # POS.main()
    # fetching the global response variable to manipulate inside the function
    global response
    # POS.pos("Tiger bites Rabbit")
    # checking the request type we get from the app
    if (request.method == 'POST'):
        request_data = request.data  # getting the response data
        request_data = json.loads(request_data.decode('utf-8'))  # converting it from json to key value pair
        name = request_data['name']  # assigning it to name
        response = f'{name}'  # re-assigning response with the name we got from the user
        print(response)
        POS.pos(response)
        # return jsonify({'greetings': links, 'is': links2, 'ironman': links3})  # returning key-value pair in json format
        # return " "  # to avoid a type error
    # else:
    #     return jsonify({'name': response})  # sending data back to your frontend app

    POS.






    return jsonify({'greetings': links,'is' : links2,'ironman' : links3})  # returning key-value pair in json format

    # return jsonify({'greetings': 'https://i.pinimg.com/originals/75/47/d7/7547d70ae8714e715dd4e3b118898438.jpg'})  # returning key-value pair in json format

if __name__ == '__main__':
    app.run(debug=True)
