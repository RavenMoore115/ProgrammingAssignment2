## Function sets matrix, resets the inverse when the matrix is updated
## Returns a list of all functions

## Function gets the matrix, sets the inverse and returns a list

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <-function(y) {
    x <<-y
    inv <<-NULL
  }
get <- function() x
setInverse <- function(inverse) inv <<-inverse
getInverse <-function() inv
list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Get the cached inverse, otherwise calculate the inverse and return the inverse

cacheSolve <- function(x, ...) {
  inv <-x$getInverse()
  if (!is.null(inv)) {
    message("retrieving cached data")
    return(inv)
  }
  data <-x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv
        ## Return a matrix that is the inverse of 'x'
}
