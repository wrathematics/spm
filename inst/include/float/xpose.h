// Taken from the coop package. Copyright (c) 2016-2017 Drew Schmidt

#ifndef SPM_XPOSE_H_
#define SPM_XPOSE_H_


#include "blocksize.h"


static inline void float_xpose(const int m, const int n, const float *const restrict x, float *restrict tx)
{
  for (int j=0; j<n; j+=BLOCKSIZE)
  {
    for (int i=0; i<m; i+=BLOCKSIZE)
    {
      for (int col=j; col<j+BLOCKSIZE && col<n; ++col)
      {
        for (int row=i; row<i+BLOCKSIZE && row<m; ++row)
          tx[col + n*row] = x[row + m*col];
      }
    }
  }
}


#endif
