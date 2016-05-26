
# make a matrix cache. It takes a matrix and returns a list of 3 functions.
# The second function(getinv) contain the information of inverse matrix.
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    get <- function() x
    setinv <- function(inv) i <<- inv
    getinv <- function() i
    list(get = get,
         setinv = setinv,
         getinv = getinv)
}

# takes a cache and return a inverse matrix. Firstly it checks whether or not this
# cache has been calculated via checking i value in the cache. If it has, then a
# inverse matrix is returned and there will be a message. If not, then the function
# performs the calculation and store the result in the cache.
cacheSolve <- function(x,...) {
    if (is.null(x$getinv())) {matrix <- x$get()
    i <- solve(matrix,...)
    x$setinv(i)
    i    
    }
    else {message("getting cached data")
        x$getinv()
    }
}