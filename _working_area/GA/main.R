
source('preamble.R')

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


################################################################################
# functions
createPop <- function(pop_size, min_range, max_range){
  
  out <- data.frame('gen' = 1, 
                    'id' = seq(1:20),
                    'x' = runif(20, min_range, max_range),
                    'y' = runif(20, min_range, max_range))
  return(out)
} 

calculateFitness <- function(pop){
  for (i in 1:nrow(pop)){
    pop$fit[i] <- ack(c(pop$x[i], pop$y[i]))
  }
  return(pop)
}

selectBreeders <- function(pop, pop_size, breed_prop){
  # roulette wheel
  
  #how many?
  breed_num <- 2*round(pop_size*breed_prop/2,0)
  
  weight <- (1/pop$fit)/sum(1/pop$fit)
  
  selected <- sample(pop$id, size = breed_num, replace = F, prob = weight)
  
  breeders <- rep(0,pop_size)
  breeders[selected] <- 1
  
  return(breeders)
}

reproduce <- function(current_pop, alpha = 0.66){
  
  # filter to breeders
  pop <- current_pop[current_pop$breeder == 1,]
  
  # randomly order parents
  parent_list <- sample(pop$id, size = nrow(pop), replace = F) 
  
  # split parents into two
  parents1 <- pop[pop$id %in% parent_list[1:(length(parent_list)/2)],] 
  parents2 <- pop[pop$id %in% parent_list[(length(parent_list)/2 + 1):length(parent_list)],]
  
  # generate new individuals by weighted average of parents
  new_x1 <- alpha * parents1$x + (1 - alpha) * parents2$x
  new_y1 <- alpha * parents1$y + (1 - alpha) * parents2$y
  
  new_x2 <- alpha * parents2$x + (1 - alpha) * parents1$x
  new_y2 <- alpha * parents2$y + (1 - alpha) * parents1$y
  
  # Make df of newborns
  new_born <- data.frame('gen' = current_pop$gen[1]+1,
                         'id' = seq(max(current_pop$id)+1, max(current_pop$id)+length(parent_list)),
                         'x' = c(new_x1, new_x2),
                         'y' = c(new_y1, new_y2),
                         'fit' = 0,
                         'breeder' = 0)
  
  # add to current population
  pop <- rbind(current_pop, new_born)
  pop <- calculateFitness(pop)
  
  return(pop)
}


mutate <- function(current_pop){
  
  # filter to newest born
  
  # roll dice to determine whether each new born mutates
  
  # for those that mutate, pick either x or y to mutate
  
  # mutate chosen param by normal distribution mean 0, std = 0.1
  
  # update pop df and recalculate fitness
  
  # return current pop with mutated col to identify those mutated
  
}

elitism <- function(current_pop, elite = 0.1){
  
  # order current pop id by fitness
  
  # identify top % define by elite
  
  # Add new col to current_pop to identify elites
  
  # return current_pop

}


exterminate <- function(current_pop){
  
  # Order current pop id by fitness, removing the elite
  
  # Remove least fit until the population = pop_size (inc. elites)
  
  # Return current_pop
  
}








################################################################################
# Demonstrate one iteration of GA on the Ackley function

# GA inputs
pop_size <- 20
breed_prop <- 0.3

# Initial population
pop <- createPop(pop_size, min_range, max_range)

# Calculate fitness
pop <- calculateFitness(pop)

# Split into total pop and current pop
total_pop <- pop
current_pop <- pop
rm(pop)

# Plot initial population on heatmap
ggplot() +
  geom_contour_filled(data = dat, 
                      aes(x = x,
                          y = y,
                          z = z),
                      bins = 20) +
  geom_point(data = current_pop,
             aes(x = x, 
                 y = y),
             shape = 2, 
             size = 5,
             stroke = 2) + 

  labs(title = '2D Ackley function',
       fill = 'Z')


# Highlight selected to breed
current_pop$breeder <- selectBreeders(pop = current_pop, 
                             pop_size = pop_size, 
                             breed_prop = breed_prop)

# Plot initial population on heatmap, with breeders highlighted
ggplot() +
  geom_contour_filled(data = dat, 
                      aes(x = x,
                          y = y,
                          z = z),
                      bins = 20) +
  geom_point(data = current_pop,
             aes(x = x, 
                 y = y,
                 colour = as.factor(breeder)),
             shape = 2, 
             size = 5,
             stroke = 2) + 
  
  labs(title = '2D Ackley function',
       fill = 'Z',
       colour = 'Selected')

# Highlight reproduction
current_pop <- reproduce(current_pop = current_pop)

# Plot current population on heatmap, with new born highlighted
ggplot() +
  geom_contour_filled(data = dat, 
                      aes(x = x,
                          y = y,
                          z = z),
                      bins = 20) +
  geom_point(data = current_pop,
             aes(x = x, 
                 y = y,
                 colour = as.factor(gen)),
             shape = 2, 
             size = 5,
             stroke = 2) + 
  
  labs(title = '2D Ackley function',
       fill = 'Z',
       colour = 'Generation')

# Highlight Mutation
current_pop <- mutate(current_pop)


# Highlight elitism
current_pop <- elitism(current_pop)


# Highlight extermination
current_pop <- exterminate(current_pop)


# New population
# The current population is now the new population. 
# Some individuals are retained from previous generation(s), some are newly added.
# Define all as being from generation n+1
# rbind the current population to the total population


