
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
                    'id' = seq(1:pop_size),
                    'label' = 0,
                    'x' = runif(pop_size, min_range, max_range),
                    'y' = runif(pop_size, min_range, max_range),
                    'fit' = 0,
                    'selected' = 0,
                    'mutated' = 0,
                    'elite' = 0,
                    'exterminated' = 0)
  return(out)
} 

calculateFitness <- function(pop){
  for (i in 1:nrow(pop)){
    pop$fit[i] <- ack(c(pop$x[i], pop$y[i]))
  }
  return(pop)
}

selectBreeders <- function(pop, pop_size, breed_prop){
  # Fitness weighted selection
  
  #how many?
  breed_num <- 2*round(pop_size*breed_prop/2,0)
  
  weight <- (1/pop$fit)/sum(1/pop$fit)
  
  selected <- sample(pop$id, size = breed_num, replace = F, prob = weight)
  
  pop$selected[pop$id %in% selected] <- 1
  pop$label[pop$id %in% selected] <- 1
  
  return(pop)
}

reproduce <- function(current_pop, alpha = 0.66){
  
  # filter to breeders
  pop <- current_pop[current_pop$selected == 1,]
  
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
  new_born <- data.frame('gen' = max(current_pop$gen)+1,
                         'id' = seq(max(current_pop$id)+1, max(current_pop$id)+length(parent_list)),
                         'label' = 2,
                         'x' = c(new_x1, new_x2),
                         'y' = c(new_y1, new_y2),
                         'fit' = 0,
                         'selected' = 0,
                         'mutated' = 0,
                         'elite' = 0,
                         'exterminated' = 0)
  
  # add to current population
  pop <- rbind(current_pop, new_born)
  pop <- calculateFitness(pop)
  
  return(pop)
}


mutate <- function(current_pop, pop_size, mut_chance = 0.1){
  
  # roll dice to determine whether each new born mutates
  current_pop$mutated <- c(rep(0,pop_size),
                          sample(x = c(0,1), 
                                 size = nrow(current_pop[current_pop$gen == max(current_pop$gen),]), 
                                 replace = T, 
                                 prob = c(1-mut_chance, mut_chance)))
  
  if (any(current_pop$mutated)){
    
    current_pop$label[current_pop$mutated == 1] <- 3
    
    # for those that mutate, pick either x or y to mutate
    # 0 = x, 1 = y
    change_x <- c(rep(0,pop_size),
                  sample(x = c(0,1), 
                       size = sum(current_pop$mutated == 1), 
                       replace = T))
    
    change_y <- -1*(change_x - 1)
    change_y[1:pop_size] <- 0
    
    # Determine the amount each changes by. 
    # normal distribution mean 0, std = 0.2
    change_pc <- rnorm(n = length(change_x), mean = 0, sd = 0.1)
    
    # Apply changes to x and y
    current_pop[as.logical(change_x),]$x <- (current_pop[as.logical(change_x),]$x
                                     * (1 + change_pc[as.logical(change_x)]))
    
    current_pop[as.logical(change_y),]$y <- (current_pop[as.logical(change_y),]$y
                                     * (1 + change_pc[as.logical(change_y)]))
    
    # recalculate fitness
    current_pop <- calculateFitness(current_pop)
  }
  
  return(current_pop)
  
}

elitism <- function(current_pop, elite = 0.1){

  # order current pop id by fitness (lower is better)
  sorted <- sort(current_pop$fit, decreasing = F, index.return = T)
  
  # identify top % define by elite
  elite_num <- round(pop_size*elite,0)
  
  # top elites
  current_pop$elite[sorted$ix[1:elite_num]] <- 1
  current_pop$label[sorted$ix[1:elite_num]] <- 4
  
  return(current_pop)
}


exterminate <- function(current_pop, pop_size){

  # Order current pop id by fitness, removing the elite
  sorted <- sort(current_pop$fit, decreasing = T, index.return = T)
  
  # how many?
  deaths_needed <- nrow(current_pop) - pop_size
  
  # Remove least fit until the population = pop_size (inc. elites)
  current_pop$exterminated[sorted$ix[1:deaths_needed]] <- 1
  current_pop$label[sorted$ix[1:deaths_needed]] <- 5
  
  return(current_pop)
}








################################################################################
# Demonstrate one iteration of GA on the Ackley function

# GA inputs
pop_size <- 10
breed_prop <- 0.2
maxIt <- 30

# Initial population
current_pop <- createPop(pop_size, min_range, max_range)

current_pop_history <- list()

for (i in 1:maxIt){
  
  # Record the current pop
  current_pop_history <- c(current_pop_history, 
                           list(current_pop))
  
  # Calculate fitness
  current_pop <- calculateFitness(current_pop)
  
  
  # Highlight selected to breed
  current_pop <- selectBreeders(pop = current_pop, 
                                pop_size = pop_size, 
                                breed_prop = breed_prop)
  
  # Highlight reproduction
  current_pop <- reproduce(current_pop = current_pop)
  
  # Highlight Mutation
  current_pop <- mutate(current_pop = current_pop, 
                        pop_size = pop_size,
                        mut_chance = 0.2)
  
  # Highlight elitism
  current_pop <- elitism(current_pop)
  
  # Highlight extermination
  current_pop <- exterminate(current_pop, pop_size)

  # New population
  # The current population minus those tagged for extermination, become the new 
  # population. Some individuals are retained from previous generation(s), some 
  # are newly added.
  
  new_pop <- current_pop[current_pop$exterminated != 1,]
  new_pop$label <- 0
  new_pop$selected <- 0
  new_pop$mutated <- 0
  new_pop$elite <- 0
  
  if (i == 1){ #First iteration
    total_pop <- current_pop
  } else{
    # rbind the current population to the total population
    total_pop <- rbind(total_pop, 
                       current_pop[!current_pop$id %in% total_pop$id,])
    
  }
  
  current_pop <- new_pop
  
}

# First gen
ggplot() +
  geom_contour_filled(data = dat, 
                      aes(x = x,
                          y = y,
                          z = z),
                      bins = 20) +
  geom_point(data = current_pop_history[[10]], 
             size = 5,
             shape = 3,
             stroke = 2,   
             aes(x = x,
                 y = y)) +
  labs(title = '2D Ackley function',
       fill = 'Z')




# All

ggplot() +
  geom_contour_filled(data = dat, 
                      aes(x = x,
                          y = y,
                          z = z),
                      bins = 20) +
  geom_point(data = total_pop[total_pop$gen == 1,], 
             size = 5,
             shape = 3,
             stroke = 2,   
             aes(x = x,
                 y = y,
                 colour = as.factor(gen))) +
  
  geom_point(data = total_pop[total_pop$gen == 5,], 
             size = 5,
             shape = 3,
             stroke = 2, 
             aes(x = x,
                 y = y,
                 colour = as.factor(gen))) +
  
  geom_point(data = total_pop[total_pop$gen == 10,], 
             size = 5,
             shape = 3,
             stroke = 2, 
             aes(x = x,
                 y = y,
                 colour = as.factor(gen))) +

  geom_point(data = total_pop[total_pop$gen == maxIt,], 
             size = 5,
             shape = 3,
             stroke = 2, 
             aes(x = x,
                 y = y,
                 colour = as.factor(gen))) +
  
  labs(title = '2D Ackley function',
       fill = 'Z',
       colour = 'Generation')




# Animation
animation_ack <- dat
animation_ack$t <- 1

animation_dat <- current_pop_history[[1]]
animation_dat$t <- 1

for (i in 2:pop_size){
  
  current_pop_history[[i]]$t <- i
  animation_dat <- rbind(animation_dat, 
                         current_pop_history[[i]])
  A <- dat
  A$t <- i
  animation_ack <- rbind(animation_ack, A)
}

anim <- ggplot() +
  geom_contour_filled(data = dat, 
                      aes(x = x,
                          y = y,
                          z = z),
                      bins = 20) +
  
  geom_point(data = animation_dat, 
             size = 5,
             shape = 3,
             stroke = 2,   
             aes(x = x,
                 y = y)) +
  
  labs(title = '2D Ackley function',
       fill = 'Z') + 
  
  transition_time(t) +
  
  ease_aes("linear")

anim_save(filename = "outputs/animation.gif", 
          animation = anim,
          duration = 10, 
          fps = 20, 
          width = 500, 
          height = 500, 
          renderer = gifski_renderer())




