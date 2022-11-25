install.packages("ggplot2")  # Install ggplot2 library
install.packages("palmerpenguins")  # Install palmerpenguins dataset for analysis
library(palmerpenguins) # Put into library
data("penguins") # Put dataset for the analysis
View(penguins)   # View dataset

ggplot(data = penguins) # Make frame for dataset
#+ ----># means we add one more layer to the previous layer

# geom_point() function uses points to create scatterplots
# geom_bar() function uses bars to create bar charts  
# the mapping argument is always paired with the aes() function.
# aes()---> stand for Aesthetic that means A visual property of an object in your plot
# The x and y argument of the aes() function specify which variables to map to the x-axis and y-axis of the coordinate system
# In this case "flipper_length_mm" to the x-axis and "body_mass_g" on the y-axis
# Mapping(R)---> Means Matching up a specific variable in your dataset with a specific aesthetic

ggplot(data = penguins)+
   geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g)) # Plot the graph between the axis


ggplot(data = penguins)+
  geom_point(mapping = aes(x=bill_length_mm,y=bill_depth_mm), color = "blue") # Plot the graph between the axis

# To plot different species colour

ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g, color = species))

# To plot different species with different size

ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g, shape = species))

# To plot different species with different shape and colour

ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g, shape = species,color = species))

# To plot different species with different shape and colour

ggplot(data = penguins)+
  geom_point(mapping = aes(x=flipper_length_mm,y=body_mass_g, shape = species,color = species,size = species))



ggplot(data = penguins)+
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g,alpha = species),color = "purple")

#To get smooth curve of the dataset using geom_smooth()
ggplot(data = penguins)+
  geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

#TO get scatter data plot using geom_jitter()
ggplot(data = penguins)+
  geom_jitter(mapping = aes(x = flipper_length_mm, y = body_mass_g))


#**Diamons** datasets
data()
#data("diamonds")
View(diamonds)

#To plot the bar graph of dataset with cut 
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut))+
  facet_wrap(~cut)

#To plot the bar graph with color of dataset with cut 
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut,color = cut))

#To plot the bar graph with "fill" of dataset with cut 
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut,fill = cut))+
  facet_wrap(~cut)

#To plot the bar graph with "fill" of dataset with clarity
#that shows different colours of the dataset itself
ggplot(data = diamonds)+
  geom_bar(mapping = aes(x = cut,fill = clarity))+
  facet_wrap(~cut)


#***facet_wrap()**function, to plot different species in a diiefrent graph using this function 
ggplot(data = penguins)+
  geom_point(mapping = aes(x = flipper_length_mm,y = body_mass_g,color  =species))+
  facet_wrap(~species)

ggplot(data = diamonds)+
  geom_bar(mapping = aes(x=color,fill=cut))+
  facet_wrap(~color)

#plot the graph using the facet_grid(), first variable is plot on the 
#vertical followed by second variable on horizontal axis
#EX: sex <---- vertical axis, species <---- on horizontal axis
ggplot(data = penguins)+
  geom_point(mapping = aes(x = flipper_length_mm,y = body_mass_g,color  =species))+
  facet_grid(sex~species)

ggplot(data = penguins)+
  geom_point(mapping = aes(x = flipper_length_mm,y = body_mass_g,color  =species))+
  facet_grid(~sex)

ggplot(data = penguins)+
  geom_point(mapping = aes(x = flipper_length_mm,y = body_mass_g,color  =species))+
  facet_grid(~species)

#Adding title and subtitle and caption into the graph with the help of lab
ggplot(data = penguins)+
  geom_point(mapping = aes(x = flipper_length_mm,y = body_mass_g,color=species))+
  labs(title = "Palmer Penguins:Body Mass vs.Flipper Length",subtitle = "Sample of three penguins",
       caption = "Data collected by Dr. Kriston")+
  annotate("text", x=220,y=3500,label="The Gentoos are the largest",color="red",
           fontface="bold",size=4.5)
