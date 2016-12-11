## The makeCacheMatrix function stores a matrix

makeCacheMatrix <- function(x = matrix()) {
    c <- NULL
    set <- function(z){
      x <<- z
      c <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) c <<- inverse
    getinv <- function() c
    list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## The cacheSolve function calculates the inverse of the
## matrix in makeCacheMatrix or saves time by returning 
## the inverse matrix that is already stored in "c" of the
## makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return the cache matrix that is the inverse of 'x'
    c <- x$getinv()
    if (!is.null(c)){
          message("getting cache data")
          return(c)
      
        ## Calculates a new inverse matrix if 'x' is different
    }
     data <- x$get()
     c <- solve(data, ...)
     x$setinv(c)
     c
}
