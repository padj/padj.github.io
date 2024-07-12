


# Use Ackley function to demonstrate GA
# Plot the function

ack <- makeAckleyFunction(2)

# Plot the function with overlain seeded initial population

res <- 0.1
min_range <- -3
max_range <- 3

x_range <- seq(min_range, max_range, by = res)
y_range <- x_range

dat <- expand.grid(x = x_range,
                   y = y_range,
                   z = 0)

for (i in 1:nrow(dat)){
  
  dat$z[i] <- ack(c(dat$x[i], dat$y[i]))
  
}

ggplot(data = dat, aes(x = x,
                       y = y,
                       z = z)) +
  geom_contour_filled(bins = 20) +
  labs(title = '2D Ackley function',
       fill = 'Z')


# Demonstrate one iteration of GA on the Ackley function

# Initial population

# Highlight selected to breed

# Highlight reproduction

# Highlight Mutation

# Highlight elitism

# Highlight extermination

# New population





# Plot the Ackley function in 2D as a heatmap? Easier to seed individuals. 


