/*
 * Trace all the guest submitted and completed IOs.
 */
crucible_upstairs*:::extent-or-start
{
    start[arg0] = timestamp;
}

crucible_upstairs*:::extent-or-done
/start[arg0]/
{
    strtok(probename, "-");
    this->cmd = strtok(NULL, "-");
    @time[this->cmd] = quantize(timestamp - start[arg0]);
    start[arg0] = 0;
}
