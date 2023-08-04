 1. open cmd and create virtual environment: 
```shell 
python -m venv venv
```

 2. open activate script in virtual environment:
```shell 
venv\Scripts\activate
```

 3. install dependencies:
 ```shell
 pip install -r requirements.txt`
 ```


 4. open cmd and type: 
 ```shell
 uvicorn api:app --reload
 ```
 5. open browser and type: [http://localhost:8000/docs](http://localhost:8000/docs)

 6. click `Try it out!` button on endpoint who you want to test

 7. input your data and click `Execute` button