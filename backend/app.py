from data_augmentation import get_train_generator
from your_model_library import YourModel

# Get augmented data
path_to_train_data = 'nazam/data/train/'
train_generator = get_train_generator(path_to_train_data)

# Initialize your model
model = YourModel() #TODO: replace with your model's initialization

# Train your model using the augmented data
model.fit(train_generator, epochs=your_preferred_epochs, steps_per_epoch=your_preferred_steps)