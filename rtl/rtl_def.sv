
package rtl_pkg;

typedef struct packed {
                       logic misp;
                       logic ataken;
                       logic boffset;
                       logic pc4;
                       logic [1:0] hist;
                       logic [11:0] toffset;
                       logic valid;
                       logic br_error;
                       logic br_start_error;
                       logic pcall;
                       logic pja;
                       logic way;
                       logic pret;
                       
                       logic [31:1] prett;
                       } rtl_predict_pkt_t;


typedef struct packed {
                       logic clz;  
                       logic ctz;
                       logic cpop;
                       logic siext_b;
                       logic siext_h;
                       logic min;
                       logic max;
                       logic pack;
                       logic packu;
                       logic packh;
                       logic rol; 
                       logic ror;
                       logic grev;
                       logic gorc;
                       logic zbb;
                       logic bset;
                       logic bclr;
                       logic binv;
                       logic bext;
                       logic sh1add; 
                       logic sh2add; 
                       logic sh3add; 
                       logic zba;
                       logic land; 
                       logic lor; 
                       logic lxor; 
                       logic sll; 
                       logic srl; 
                       logic sra; 
                       logic beq;
                       logic bne;
                       logic blt;
                       logic bge;
                       logic add;   
                       logic sub;   
                       logic slt;    
                       logic unsign;
                       logic jal;
                       logic predict_t;
                       logic predict_nt;
                       logic csr_write;
                       logic csr_imm;
                       } rtl_alu_pkt_t;

endpackage 
