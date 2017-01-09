## The following two functions are to create a special object to be able to 
## cache its inverse matrix and also to either get its cached inverse matrix if exists 
## or to calculate its inverse matrix if it does not exist.
 

## The following function is to create a special list containing function to
## 1) set a value for the matrix, 2) get the value of the matrix
## 3) set the inverse of the matrix, 4) get the inverse of the matrix 

makeCacheMatrix <- function(x = matrix()) {
   im <- NULL
   set <- function(y) {
      x <<- y
      im <<- NULL
   }
   get <- function() x
   setsolve <- function(inm)
      im <<- inm
   getsolve <- function() im
   list(set = set, get = get, setsolve =  setsolve, getsolve = getsolve)
}


## The following function to is to either get the cached inverse of the matrix if exists,
## or calculate the inverse of the matrix, if it does not exist

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getsolve()
  if (!is.null(inverse)) {
     message("getting cached data")
     return(inverse)
  }
  data <- x$get()
  invese <- solve(data)
  x$setsolve(inverse)
  inverse
}
