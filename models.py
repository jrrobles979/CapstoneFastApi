from typing import Optional, List
from pydantic import BaseModel
from pydantic.types import UUID4
from uuid import UUID, uuid4
from typing import Optional
from enum import Enum

class Gender(str, Enum):
    male ="Male"
    female ="Female"

class Role(str, Enum):
    admin="admin"
    user="user"
    student="student"

class User(BaseModel):
    id: Optional[UUID] = uuid4()
    first_name: str
    last_name: str
    email: str
    gender: Gender
    roles: List[Role]

class UpdateUserRequest(BaseModel):  
    first_name: Optional[str]
    last_name: Optional[str]
    email: Optional[str]
    roles: Optional[List[Role]]