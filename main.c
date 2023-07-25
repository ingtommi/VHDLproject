#include "platform.h"
#include "xil_printf.h"
#include "xuartlite.h"
#include "xstatus.h"


int main()
{
    XUartLite uart;
    u8 msg_in = 0x55;
    u8 key = 0xFF;
    u8 msg_out = 0xFF;
    XStatus status;

    init_platform();
    //INITIALIZATION
    status = XUartLite_Initialize(&uart, XPAR_UARTLITE_0_DEVICE_ID);
    if(status != XST_SUCCESS)
    {
    	xil_printf("\nInitialization failed...\n");
    	xil_printf("Exit...");
    	return XST_FAILURE;
    }
    xil_printf("\nInitialization completed...\n\n");
    //KEY
    XUartLite_Send(&uart, &key, sizeof(key));
    xil_printf("Key: 0x%02X\n", key);
    //MSG_IN
    XUartLite_Send(&uart, &msg_in, sizeof(msg_in));
    xil_printf("Message IN: 0x%02X\n\n", msg_in);
    //MSG_OUT
    while(msg_out == 0xFF)
    {
    	XUartLite_Recv(&uart, &msg_out, sizeof(msg_out));
    }
    xil_printf("Message OUT: 0x%02X\n\n", msg_out);
    xil_printf("Exit...\n");
    cleanup_platform();
    return 0;
}