import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import os
import cv2
from PIL import Image


dim=500

i = 0
lifeCondition = np.array([3],dtype='i')

shift = np.zeros([8,2],dtype='i')
for a in np.arange(-1,2):
    for b in np.arange(-1,2):
        if a != 0 or b!= 0:
            shift[i] = np.array([a,b])
            i = i+1

def evolve(field):
    newField =field.copy()
    for i in np.arange(dim):
        for k in np.arange(dim):
            temp = np.tile(np.array([i,k],dtype='i'),[8,1])
            intorno = temp+shift
            intorno = np.mod(intorno,dim)
            alive = np.sum(field[intorno[...,[0]],intorno[...,[1]]])
            "se si mette eater = 2 poi occhio che bisogna sottrarre"

            """
            test = (np.random.randint(0,1,size=(dim,dim)))
            test[intorno[...,[0]],intorno[...,[1]]] = 1;
            plt.imshow(test)
            plt.show()

            """
            if field[i][k]==1:
                if (alive<2 or alive>3):
                    newField[i][k]=0
            else:
                if alive==3:
                    newField[i][k]=1
    return newField

def insertPiece(file,i,j,field):
    piece = np.genfromtxt(file,delimiter=',').astype(int)
    dim = piece.shape
    field[i:i+dim[0],j:j+dim[1]] = piece


dir_name = "GOL_output"
video_name="prova.avi"
cwd = os.getcwd()
if not os.path.exists(os.path.join(cwd,dir_name)):
    os.mkdir(os.path.join(cwd,dir_name))

data = (np.random.randint(0,1,size=(dim,dim)))
generations = 100
i = 0
insertPiece("gun.csv",1,1,data)
plt.imsave(os.path.join(cwd,dir_name,str(i)+".png"),data,dpi = 3000)

frame = cv2.imread(os.path.join(cwd,dir_name,str(i)+".png"))
height, width, layers = frame.shape
video = cv2.VideoWriter(video_name, 0, 1, (width, height))
while(i<generations):
    i=i+1
    data = (np.random.randint(0,1,size=(dim,dim)))
    print("frame: "+str(i)+"/"+str(generations) )
    data = evolve(data)
    plt.imshow(data)
    plt.show()
    plt.imsave(os.path.join(cwd,dir_name,str(i)+".png"),data,dpi=3000)
    video.write(cv2.imread(os.path.join(cwd,dir_name,str(i)+".png")))
cv2.destroyAllWindows()
video.release()
