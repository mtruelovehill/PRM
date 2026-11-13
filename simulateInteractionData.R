set.seed(123)

n_per_group <- 30
n <- 2 * n_per_group

# Categorical independent variable
group <- factor(
  rep(c("A", "B"), each = n_per_group),
  levels = c("A", "B")
)

# Continuous independent variable
x <- runif(n, min = 0, max = 10)

# Data-generating parameters
beta_0 <- 10       # Intercept for group A
beta_x <- 1.0      # Slope of x in group A
beta_group <- 2.0  # Difference in intercept for group B
beta_interaction <- 0.8  # Difference in slopes between groups
sigma <- 2          # Residual standard deviation

# Generate the continuous dependent variable
y <- beta_0 +
  beta_x * x +
  beta_group * (group == "B") +
  beta_interaction * x * (group == "B") +
  rnorm(n, mean = 0, sd = sigma)

# Combine variables into a data frame
dat <- data.frame(
  x = x,
  group = group,
  y = y
)

# View the first observations
head(dat)

# Fit a linear model with the interaction
model <- lm(y ~ x * group, data = dat)

# Display model results
summary(model)

# Display the ANOVA table
anova(model)