## Put comments here that give an overall description of what your
## functions do

## Function that creates the functions to be used later in the cacheSolve function 
## including getting/setting the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL #must create default value 
  set <- function(y){
    x <<- y
    m <<- NULL #resets Inverse saved from last cacheSolve
  }
  get <- function()x
  setinverse <- function(solve) m <<- solve 
  getinverse <- function() m 
  list(set = set, 
       get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
}


## If no cached matrix or new matrix set, calculates inverse and returns the value
## If cached matrix exists, returns message and the cached inverse 

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
}
