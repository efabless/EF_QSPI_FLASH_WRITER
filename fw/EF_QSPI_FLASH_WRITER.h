/*
	Copyright 2025 Efabless Corp.

	Author: Efabless Corp. (ip_admin@efabless.com)

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	    www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/

#ifndef EF_QSPI_FLASH_WRITERREGS_H
#define EF_QSPI_FLASH_WRITERREGS_H

 
/******************************************************************************
* Includes
******************************************************************************/
#include <stdint.h>

/******************************************************************************
* Macros and Constants
******************************************************************************/

#ifndef IO_TYPES
#define IO_TYPES
#define   __R     volatile const uint32_t
#define   __W     volatile       uint32_t
#define   __RW    volatile       uint32_t
#endif

#define EF_QSPI_FLASH_WRITER_WE_REG_WE_BIT	((uint32_t)0)
#define EF_QSPI_FLASH_WRITER_WE_REG_WE_MASK	((uint32_t)0x1)
#define EF_QSPI_FLASH_WRITER_WE_REG_MAX_VALUE	((uint32_t)0x1)

#define EF_QSPI_FLASH_WRITER_SS_REG_SS_BIT	((uint32_t)0)
#define EF_QSPI_FLASH_WRITER_SS_REG_SS_MASK	((uint32_t)0x1)
#define EF_QSPI_FLASH_WRITER_SS_REG_MAX_VALUE	((uint32_t)0x1)

#define EF_QSPI_FLASH_WRITER_SCK_REG_SCK_BIT	((uint32_t)0)
#define EF_QSPI_FLASH_WRITER_SCK_REG_SCK_MASK	((uint32_t)0x1)
#define EF_QSPI_FLASH_WRITER_SCK_REG_MAX_VALUE	((uint32_t)0x1)

#define EF_QSPI_FLASH_WRITER_OE_REG_OE_BIT	((uint32_t)0)
#define EF_QSPI_FLASH_WRITER_OE_REG_OE_MASK	((uint32_t)0xf)
#define EF_QSPI_FLASH_WRITER_OE_REG_MAX_VALUE	((uint32_t)0xF)

#define EF_QSPI_FLASH_WRITER_DATAO_REG_DATAO_BIT	((uint32_t)0)
#define EF_QSPI_FLASH_WRITER_DATAO_REG_DATAO_MASK	((uint32_t)0xf)
#define EF_QSPI_FLASH_WRITER_DATAO_REG_MAX_VALUE	((uint32_t)0xF)

#define EF_QSPI_FLASH_WRITER_DATAI_REG_DATAI_BIT	((uint32_t)0)
#define EF_QSPI_FLASH_WRITER_DATAI_REG_DATAI_MASK	((uint32_t)0xf)
#define EF_QSPI_FLASH_WRITER_DATAI_REG_MAX_VALUE	((uint32_t)0xF)

#define EF_QSPI_FLASH_WRITER_ID_REG_ID_BIT	((uint32_t)0)
#define EF_QSPI_FLASH_WRITER_ID_REG_ID_MASK	((uint32_t)0xffffffff)
#define EF_QSPI_FLASH_WRITER_ID_REG_MAX_VALUE	((uint32_t)0xFFFFFFFF)




          
/******************************************************************************
* Typedefs and Enums
******************************************************************************/
          
typedef struct _EF_QSPI_FLASH_WRITER_TYPE_ {
	__W 	WE;
	__W 	SS;
	__W 	SCK;
	__W 	OE;
	__W 	DATAO;
	__R 	DATAI;
	__R 	ID;
} EF_QSPI_FLASH_WRITER_TYPE;

typedef struct _EF_QSPI_FLASH_WRITER_TYPE_ *EF_QSPI_FLASH_WRITER_TYPE_PTR;     // Pointer to the register structure

  
/******************************************************************************
* Function Prototypes
******************************************************************************/



/******************************************************************************
* External Variables
******************************************************************************/




#endif

/******************************************************************************
* End of File
******************************************************************************/
          
          
