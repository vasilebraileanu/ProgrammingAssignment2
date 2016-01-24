## Helper functions to store a matrix and his inverse

## Functions sample usage
##w <- matrix(c(2:5),nrow=2,ncol=2)
##u <- makeCacheMatrix(w)
##inverseMatrix <- cacheSolve(u)
##originalMatrix <- w$get()

## Stores a matrix and his inverse
makeCacheMatrix <- function(x = matrix()) {
    invMattrix <<- NULL
    
    set <- function(y) {
        x <<- y
        invMattrix <<- NULL
    }
    
    get <- function() x
    getInverse <- function() invMattrix
    setInverse <- function(a) invMattrix <<- a
    
    list(set = set, get = get, getInverse = getInverse, setInverse = setInverse)
}


## Returns the inverse of cached matrix x
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    invMattrix <- x$getInverse()
    if (is.null(invMattrix)) {
        data <- x$get()
        x$setInverse(solve(data))
    }
    
    invMattrix <- x$getInverse()
}
