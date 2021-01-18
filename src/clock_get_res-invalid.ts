import {
  clock_res_get,
  errno,
} from "wasi";

const err = clock_res_get(-1, 0);
assert(err == errno.INVAL);
