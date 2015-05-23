## Pair of functions that cache the inverse of a matrix in order to
## avoid time-consuming computations

## makeCacheMatrix is a function that create a matrix object that is
## a square invertible matrix

makeCacheMatrix <- function(x = matrix()) {
        inversematrix <- NULL
        set <- function(y) {
                x <<- y    # <<- is used in order to assign a value to a variable outside the current environment
                inversematrix <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) inversematrix <<- solve
        getinverse <- function() inversematrix
        list(set = set, get = get,          
                setinverse = setinverse,
                getinverse = getinverse)
        # return the list of 4 functions used as input for cacheSolve function              
}


## cacheSolve function return the inverse a the matrix created by the
## makeCacheMatrix function

cacheSolve <- function(x, ...) {
        inversematrix <- x$getinverse()
        if(!is.null(inversemastrix)) {    # if the inverse of the matrix has been already calculated
                message("getting cached data")    # print this massage
                return(inversematrix)    # and return the inverse of hte matrix from the function above
        }
        # if the inverse of the matrix has not been already calculated, get the data and calculate the inverse using solve function
        data <- x$get()
        inversematrix <- solve(data, ...)
        x$setinverse(inversematrix)
        inversematrix        
        ## Return a matrix that is the inverse of 'x'
}
