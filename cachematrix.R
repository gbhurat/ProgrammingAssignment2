## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function, makeCacheMatrix creates a matrix that can cache its inverse
## which is really a list containing a function to set the matrix and get the 
## value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
        ## define the argument with default mode of "matrix"
        
        i <- NULL ## initialize i as NULL; will hold value of matrix inverse 
        set <- function(y){ ## define the set function to assign new
                m <<- y  ## value of matrix in parent environment
                i <<- NULL ## if there is a new matrix, reset inv to NULL
        }
        get <- function(){ ## define the get fucntion - returns value of the matrix argument
                m
        }        
        
        setInverse <- function(inverse){ 
                i <<- inverse ## assigns value of i in parent environment
        } 
        getInverse <- function(){
                i ## gets the value of i where called
        }
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse) ##you need this in order to refer 
                                                                                     ## to the functions with the $ operator

}


## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
      m <- x$getInverse()
        
        ## if the inverse has already been calculated
        
        if(!is.null(m)){
                ## get it from the cache and skips the computation
                message("getting cached data")
                return(m)
        }
        ## otherwise, calculates the inverse 
        data <- x$get()
        m <- solve(data, ...)
        
        ## sets the value of the inverse in the cache via the setinv function
        x$setInverse(m)
        m  ## returns the inverse of the matrix
}
