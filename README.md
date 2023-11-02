# AHB FLASITER 
## I/O Registers
| Register | Offset | Mode         | Size | Description |
| -------- | ------ | ------------ | ------|----- |
| Write Enable      | 0x0000  | RW        | 1| Enables flash writer to write to flash   |
| Slave Select      | 0x0004  | RW        | 1| Flash SS signal value  |
| Slave Clock       | 0x0008  | RW        | 1| Flash SCK signal value  |
| Output Enable     | 0x000C  | RW        | 4| Output enable for the four flash IOs  |
| Slave OUT         | 0x0010  | RW        | 4| output data from flash  |
| Slave IN          | 0x00014 | RW        | 4| input data to flash  |
