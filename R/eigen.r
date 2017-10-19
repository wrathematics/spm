#' eigen
#' 
#' Solve a system of equations or invert a float matrix.
#' 
#' @param x
#' A float vector/matrix.
#' @param symmetric
#' Is the matrix symmetric? If not, it will be tested for symmetry with
#' \code{isSymmetric()}. Note that only symmetric matrices are supported at this
#' time.
#' @param only.values
#' Should only the values (and not the vectors) be returned?
#' @param EISPACK
#' Ignored.
#' 
#' @return
#' A list containing the values and optionally vectors, each stored as floats.
#' 
#' @examples
#' \dontrun{
#' library(float)
#' 
#' s = flrunif(10, 3)
#' cp = crossprod(s)
#' 
#' eigen(cp)
#' }
#' 
#' @name eigen
#' @rdname eigen
NULL



eigen_float32 = function(x, symmetric, only.values=FALSE, EISPACK=FALSE)
{
  if (missing(symmetric))
    symmetric = isSymmetric(x)
  
  if (!isTRUE(symmetric))
    stop("only symmetric=TRUE is supported at this time")
  
  only.values = as.integer(only.values)
  ret = .Call(R_symeig_spm, DATA(x), only.values, TRUE)
  
  ret$values = new("float32", Data=ret$values)
  if (!only.values)
    ret$vectors = new("float32", Data=ret$vectors)
  
  ret
}



#' @rdname eigen
#' @export
setMethod("eigen", signature(x="float32"), eigen_float32)