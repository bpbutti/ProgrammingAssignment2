## Put comments here that give an overall description of what your
## functions do

## Creates a matrix object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  inv = NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  set_inv <- function(inv) inv <<- inv
  get_inv <- function() inv
  list(set = set, 
       get = get,
       set_inv = set_inv,
       get_inv = get_inv)
}


## Calculates the inverse of the matrix created by makeCacheMatrix. 
## If the inverse has already been calculated and the matrix has not changed, then 
## it return the inverse from the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$get_inv()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$set_inv(inv)
  return(inv)
}
