## Put comments here that give an overall description of what your
## functions do

## function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  j<- NULL
  set<- function(y){
    x<<- y
    j<<- NULL
  }
  get<- function() x
  setinverse<- function(inverse) j<<-inverse
  getinverse<<- function() j
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}




cacheSolve <- function(x, ...) {
  mat<- x$getinverse()
  if(!is.null(mat)){
    message("getting cached data")
    return(mat)
  }
  data<- x$get()
  mat<- solve(data, ...)
  x$getinverse(mat)
  mat
  ## Return a matrix that is the inverse of 'x'
}
