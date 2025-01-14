# EF_QSPI_FLASH_WRITER

A Quad SPI Flash Writer used to program flash. It can be used along with flash controller to program the flash then read from it.
## The wrapped IP


 The IP comes with an AHBL Wrapper

#### Wrapped IP System Integration

```verilog
EF_QSPI_FLASH_WRITER_APB INST (
	.HCLK(CLK), 
	.HRESETn(RESETn), 
	.HADDR(HADDR), 
	.HWRITE(HWRITE), 
	.HSEL(HSEL), 
	.HTRANS(HTRANS), 
	.HWDATA(HWDATA),
	.HRDATA(HRDATA), 
	.HREADY(HREADY),
	.HREADYOUT(HREADYOUT),
	.fr_sck(fr_sck)
	.fr_ce_n(fr_ce_n)
	.fr_din(fr_din)
	.fr_dout(fr_dout)
	.fr_douten(fr_douten)
	.fm_sck(fm_sck)
	.fm_ce_n(fm_ce_n)
	.fm_din(fm_din)
	.fm_dout(fm_dout)
	.fm_douten(fm_douten)
);
```

## Implementation example  

The following table is the result for implementing the EF_QSPI_FLASH_WRITER IP with different wrappers using Sky130 PDK and [OpenLane2](https://github.com/efabless/openlane2) flow.
|Module | Number of cells | Max. freq |
|---|---|---|
|EF_QSPI_FLASH_WRITER|N/A| N/A |
|EF_QSPI_FLASH_WRITER_AHBL|TBD|TBD|
## The Programmer's Interface


### Registers

|Name|Offset|Reset Value|Access Mode|Description|
|---|---|---|---|---|
|WE|0000|0x00000000|w|Write Enable; enables flash writer to write to flash|
|SS|0004|0x00000000|w|Slave Select; flash SS signal value|
|SCK|0008|0x00000000|w|Slave Clock; flash SCK signal value|
|OE|000c|0x00000000|w|Output enable for the four flash IOs|
|DATAO|0010|0x00000000|w|Output Data from the flash writer or controller going to flash|
|DATAI|0014|0x00000000|r|Input Data coming from flash flash|

### WE Register [Offset: 0x0, mode: w]

Write Enable; enables flash writer to write to flash
<img src="https://svg.wavedrom.com/{reg:[{name:'WE', bits:1},{bits: 31}], config: {lanes: 2, hflip: true}} "/>

### SS Register [Offset: 0x4, mode: w]

Slave Select; flash SS signal value
<img src="https://svg.wavedrom.com/{reg:[{name:'SS', bits:1},{bits: 31}], config: {lanes: 2, hflip: true}} "/>

### SCK Register [Offset: 0x8, mode: w]

Slave Clock; flash SCK signal value
<img src="https://svg.wavedrom.com/{reg:[{name:'SCK', bits:1},{bits: 31}], config: {lanes: 2, hflip: true}} "/>

### OE Register [Offset: 0xc, mode: w]

Output enable for the four flash IOs
<img src="https://svg.wavedrom.com/{reg:[{name:'OE', bits:4},{bits: 28}], config: {lanes: 2, hflip: true}} "/>

### DATAO Register [Offset: 0x10, mode: w]

Output Data from the flash writer or controller going to flash
<img src="https://svg.wavedrom.com/{reg:[{name:'DATAO', bits:4},{bits: 28}], config: {lanes: 2, hflip: true}} "/>

### DATAI Register [Offset: 0x14, mode: r]

Input Data coming from flash flash
<img src="https://svg.wavedrom.com/{reg:[{name:'DATAI', bits:4},{bits: 28}], config: {lanes: 2, hflip: true}} "/>


### The Interface 

<img src="docs/_static/EF_QSPI_FLASH_WRITER.svg" width="600"/>

#### Ports 

|Port|Direction|Width|Description|
|---|---|---|---|
|fr_sck|input|1|spi clock coming from flash reader|
|fr_ce_n|input|1|spi slave select coming from flash reader|
|fr_din|output|4|spi master data in going to the flash reader|
|fr_dout|input|4|spi master data out coming from flash reader|
|fr_douten|input|4|spi master data out enable coming from flash reader|
|fm_sck|output|1|spi clock going to flash (slave)|
|fm_ce_n|output|1|spi slave select going to flash (slave)|
|fm_din|input|4|spi master data in coming from flash (slave)|
|fm_dout|output|4|spi master data out going to flash (slave)|
|fm_douten|output|4|spi master data out enable going to flash (slave)|
## Firmware Drivers:
Firmware drivers for EF_QSPI_FLASH_WRITER can be found in the [fw](https://github.com/efabless/EF_QSPI_FLASH_WRITER/tree/main/fw) directory. EF_QSPI_FLASH_WRITER driver documentation  is available [here](https://github.com/efabless/EF_QSPI_FLASH_WRITER/blob/main/fw/README.md).
You can also find an example C application using the EF_QSPI_FLASH_WRITER drivers [here]().
## Installation:
You can install the IP either by cloning this repository or by using [IPM](https://github.com/efabless/IPM).
##### 1. Using [IPM](https://github.com/efabless/IPM):
- [Optional] If you do not have IPM installed, follow the installation guide [here](https://github.com/efabless/IPM/blob/main/README.md)
- After installing IPM, execute the following command ```ipm install EF_QSPI_FLASH_WRITER```.
> **Note:** This method is recommended as it automatically installs [EF_IP_UTIL](https://github.com/efabless/EF_IP_UTIL.git) as a dependency.
##### 2. Cloning this repo: 
- Clone [EF_IP_UTIL](https://github.com/efabless/EF_IP_UTIL.git) repository, which includes the required modules from the common modules library, [ef_util_lib.v](https://github.com/efabless/EF_IP_UTIL/blob/main/hdl/ef_util_lib.v).
```git clone https://github.com/efabless/EF_IP_UTIL.git```
- Clone the IP repository
```git clone github.com/efabless/EF_QSPI_FLASH_WRITER```
