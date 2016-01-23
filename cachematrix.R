## Two functions. The first makes a "matrix" object that stores a matrix and
## has the ability to get the matrix, as well as cache an object passed to it. The
## second function checks to see if the cache has an object in it. If so,
## it delivers the cached object with a printed note. If not,
## it calculates the inverse of the matrix from the object,  stores it in the cache.
## and prints it.

## Function to store a matrix, get it, and cache an object passed to it.

makeCacheMatrix <- function(mymatrix = matrix()) {
      inverse <- NULL
      get <- function() mymatrix
      getinverse <- function() inverse
      cacheinverse <- function(i) {
            inverse <<- i
      }
      list(get=get, getinverse=getinverse, cacheinverse=cacheinverse)
}



## Function to check the cache or calculate the inverse and cache it, delivering results
## either way.

cacheSolve <- function(x, ...) {
      inverse <- x$getinverse()
      if(!is.null(inverse)) {
            message("getting cached data")
            return(inverse)
      }
      thematrix <- x$get()
      inverse <- solve(thematrix)
      x$cacheinverse(inverse)
      inverse
}
