## This is assignment 2 for coursera week 3 of R Programming.
## Below are paired functions. The first function creates a series of functions. 
## These include changing the matrix data/inverse and returning the matrix data/inverse. 
## The second function relies on the values of the prior function to either get the cached inverse or calculate a new inverse.

## Function that creates the functions to be used later in the cacheSolve function 
## including returning/changing the matrix data/matrix inverse


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

## Function that returns the following: 
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
