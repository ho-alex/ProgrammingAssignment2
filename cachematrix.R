## (To mirror the text in the example)

# The first function, makeVector creates a special "matrix", 
# which is really a list containing a function to
# 
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of the matrix inverse
# 4. get the value of the matrix inverse

# will use the built-in "solve" function to calculate the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## (To mirror the text in the example)

# The following function calculates the inverse of the special 
# "matrixr" created with the above function. However, it first 
# checks to see if the inverse has already been calculated. 
# If so, it gets the inverse from the cache and skips the computation. 
# Otherwise, it calculates the inverse of the data and sets the 
# value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)){
          message("getting cached data")
          return(m)
  }
  data <-x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
