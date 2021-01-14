import {
  errno,
  sched_yield,
} from "wasi";

export function main(): void {
  assert(sched_yield() == errno.SUCCESS);
}
