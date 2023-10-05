#Import Libraries:
import tensorflow as tf
from tensorflow.keras.preprocessing.image import ImageDataGenerator

def get_train_generator(path_to_data):
    #Initialize ImageDataGenerator
    datagen = ImageDataGenerator(
        rotation_range=20,
        width_shift_range=0.2,
        height_shift_range=0.2,
        shear_range=0.2,
        zoom_range=0.2,
        horizontal_flip=True,
        fill_mode='nearest'
    )
    #Flow From Directory
    train_generator = datagen.flow_from_directory(
        path_to_data,
        target_size=(224, 224),
        batch_size=32,
        class_mode='categorical'
    )
    
    return train_generator

