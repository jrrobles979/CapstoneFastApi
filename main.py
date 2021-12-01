from typing import List
from uuid import UUID, uuid4
from fastapi import FastAPI, HTTPException
from models import User, Gender, Role , UpdateUserRequest


app = FastAPI()

db: List[User] = [ 
    User(id=UUID("b0d8abee-3c1e-4cec-8fe0-29c087d488ee"), 
    first_name="Adrian",
    last_name= "Monk",
    email="amonk@monk.tv",
    gender=Gender.male,
    roles=[Role.student] ) , 
    User(id=UUID("13fa78c1-2756-4237-9e54-c6a965f37e96"), 
    first_name="Temperance",
    last_name= "Brennan",
    email="tbrenan@bones.tv",
    gender=Gender.female,
    roles=[Role.student, Role.admin] )
]


@app.get("/api/v1/users")
async def fetch_users():
    
    return db

@app.post("/api/v1/users")
async def register_users(user:User):
    db.append(user)    
    return {"id":user.id}


@app.delete("/api/v1/users")
async def delete_user(user_id:UUID):
    for user in db:
        if user.id == user_id:
            db.remove(user)
            return "User with id: {user_id} was removed"
        
    raise HTTPException(
        status_code=404,
        detail=f"user with id: {user_id} does not exist"
    )

@app.put("/api/v1/users/{user_id}")
async def update_user(updateUserRequest:UpdateUserRequest,user_id:UUID):
    for user in db:
        if user.id == user_id:

            if updateUserRequest.first_name is not None:
                user.first_name = updateUserRequest.first_name
            
            if updateUserRequest.last_name is not None:
                user.last_name = updateUserRequest.last_name
            
            if updateUserRequest.email is not None:
                user.email = updateUserRequest.email
            
            if updateUserRequest.roles is not None:
                user.roles = updateUserRequest.roles

            return "user has been updated"
    

    raise HTTPException(
        status_code=404,
        detail=f"user with id: {user_id} does not found"
    )