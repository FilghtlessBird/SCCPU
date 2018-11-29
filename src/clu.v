/* 
writer:liyiming 
date: 2018/11/13
version: 0.0
module: clu
func: control unit
*/
module clu(
    op,
    func,
    z,
    wmem,
    wreg,
    regrt,
    m2reg,
    aluc,
    shift,
    aluimm,
    pcsource,
    jal,
    sext
);
    input [5:0]op,func;
    input z;
    output wmem,wreg,jal,m2reg,shift,aluimm,sext,regrt;
    output [3:0] aluc;
    output [1:0] pcsource;

    reg  wmem,wreg,jal,m2reg,shift,aluimm,sext,regrt;
    reg [3:0] aluc;
    reg [1:0] pcsource;
    always @(*) begin
        case (op)
            6'b000000: begin//special code
                case (func)
                    6'b100000: begin//add
                        wreg <= 1'b1;
                        regrt <= 1'b0;
                        jal <= 1'b0;
                        m2reg <= 1'b0;
                        shift <= 1'b0;
                        aluimm <= 1'b0;
                        //sext <= 1'bx;
                        wmem <= 1'b0;
                        aluc[2:0] <= 3'b000;
                        pcsource <= 2'b00;
                    end
                    6'b100010: begin//sub
                        wreg <= 1'b1;
                        regrt <= 1'b0;
                        jal <= 1'b0;
                        m2reg <= 1'b0;
                        shift <= 1'b0;
                        aluimm <= 1'b0;
                        //sext <= 1'bx;
                        wmem <= 1'b0;
                        aluc[2:0] <= 3'b100;
                        pcsource <= 2'b00;
                    end
                    6'b100100: begin//and
                        wreg <= 1'b1;
                        regrt <= 1'b0;
                        jal <= 1'b0;
                        m2reg <= 1'b0;
                        shift <= 1'b0;
                        aluimm <= 1'b0;
                        //sext <= 1'bx;
                        wmem <= 1'b0;
                        aluc[2:0] <= 3'b001;
                        pcsource <= 2'b00;
                    end
                    6'b100101: begin//or
                        wreg <= 1'b1;
                        regrt <= 1'b0;
                        jal <= 1'b0;
                        m2reg <= 1'b0;
                        shift <= 1'b0;
                        aluimm <= 1'b0;
                        //sext <= 1'bx;
                        wmem <= 1'b0;
                        aluc[2:0] <= 3'b101;
                        pcsource <= 2'b00;
                    end
                    6'b100110: begin//xor
                        wreg <= 1'b1;
                        regrt <= 1'b0;
                        jal <= 1'b0;
                        m2reg <= 1'b0;
                        shift <= 1'b0;
                        aluimm <= 1'b0;
                        //sext <= 1'bx;
                        wmem <= 1'b0;
                        aluc[2:0] <= 3'b010;
                        pcsource <= 2'b00;
                    end
                    6'b000000: begin//sll
                        wreg <= 1'b1;
                        regrt <= 1'b0;
                        jal <= 1'b0;
                        m2reg <= 1'b0;
                        shift <= 1'b1;
                        aluimm <= 1'b0;
                        //sext <= 1'bx;
                        wmem <= 1'b0;
                        aluc <= 4'b0011;
                        pcsource <= 2'b00;
                    end
                    6'b000010: begin//srl
                        wreg <= 1'b1;
                        regrt <= 1'b0;
                        jal <= 1'b0;
                        m2reg <= 1'b0;
                        shift <= 1'b1;
                        aluimm <= 1'b0;
                        //sext <= 1'bx;
                        wmem <= 1'b0;
                        aluc <= 4'b0111;
                        pcsource <= 2'b00;
                    end
                    6'b000011: begin//sra
                        wreg <= 1'b1;
                        regrt <= 1'b0;
                        jal <= 1'b0;
                        m2reg <= 1'b0;
                        shift <= 1'b1;
                        aluimm <= 1'b0;
                        //sext <= 1'bx;
                        wmem <= 1'b0;
                        aluc <= 4'b1111;
                        pcsource <= 2'b00;
                    end
                    6'b001000: begin//jr
                        wreg <= 1'b0;
                        //regrt <= 1'b0;
                        //jal <= 1'b0;
                        //m2reg <= 1'b0;
                        //shift <= 1'b1;
                        //aluimm <= 1'b0;
                        //sext <= 1'bx;
                        wmem <= 1'b0;
                        //aluc <= 4'b1111;
                        pcsource <= 2'b10;
                    end
                    default: begin
                        wreg <= 1'b0;
                        regrt <= 1'b0;
                        jal <= 1'b0;
                        m2reg <= 1'b0;
                        shift <= 1'b0;
                        aluimm <= 1'b0;
                        sext <= 1'b0;
                        wmem <= 1'b0;
                        aluc <= 4'b0000;
                        pcsource <= 2'b00;
                    end
                endcase
            end
            6'b001000: begin//addi
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b0;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b1;
                wmem <= 1'b0;
                aluc[2:0] <= 3'b000;
                pcsource <= 2'b00;
            end
            6'b001100: begin//andi
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b0;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b0;
                wmem <= 1'b0;
                aluc[2:0] <= 3'b001;
                pcsource <= 2'b00;
            end
            6'b001101: begin//ori
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b0;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b0;
                wmem <= 1'b0;
                aluc[2:0] <= 3'b101;
                pcsource <= 2'b00;
            end
            6'b001110: begin//xori
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b0;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b0;
                wmem <= 1'b0;
                aluc[2:0] <= 3'b010;
                pcsource <= 2'b00;
            end
            6'b100011: begin//lw
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b1;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b1;
                wmem <= 1'b0;
                aluc[2:0] <= 3'b000;
                pcsource <= 2'b00;
            end
            6'b101011: begin//sw
                wreg <= 1'b0;
                //regrt <= 1'b1;
                //jal <= 1'b0;
                //m2reg <= 1'b0;
                shift <= 1'b0;
                aluimm <= 1'b1;
                sext <= 1'b1;
                wmem <= 1'b1;
                aluc[2:0] <= 3'b000;
                pcsource <= 2'b00;
            end
            6'b000100: begin//beq
                if(z == 1'b0) begin
                    wreg <= 1'b0;
                    //regrt <= 1'b1;
                    //jal <= 1'b0;
                    //m2reg <= 1'b0;
                    shift <= 1'b0;
                    aluimm <= 1'b0;
                    sext <= 1'b1;
                    wmem <= 1'b0;
                    aluc[2:0] <= 3'b010;
                    pcsource <= 2'b00;
                end else if(z == 1'b1)begin
                    wreg <= 1'b0;
                    //regrt <= 1'b1;
                    //jal <= 1'b0;
                    //m2reg <= 1'b0;
                    shift <= 1'b0;
                    aluimm <= 1'b0;
                    sext <= 1'b1;
                    wmem <= 1'b0;
                    aluc[2:0] <= 3'b010;
                    pcsource <= 2'b01;
                end
            end
            6'b000101: begin//bne
                if(z == 1'b0) begin
                    wreg <= 1'b0;
                    //regrt <= 1'b1;
                    //jal <= 1'b0;
                    //m2reg <= 1'b0;
                    shift <= 1'b0;
                    aluimm <= 1'b0;
                    sext <= 1'b1;
                    wmem <= 1'b0;
                    aluc[2:0] <= 3'b010;
                    pcsource <= 2'b01;
                end else if(z == 1'b1)begin
                    wreg <= 1'b0;
                    //regrt <= 1'b1;
                    //jal <= 1'b0;
                    //m2reg <= 1'b0;
                    shift <= 1'b0;
                    aluimm <= 1'b0;
                    sext <= 1'b1;
                    wmem <= 1'b0;
                    aluc[2:0] <= 3'b010;
                    pcsource <= 2'b00;
                end
            end
            6'b001111: begin//lui
                wreg <= 1'b1;
                regrt <= 1'b1;
                jal <= 1'b0;
                m2reg <= 1'b0;
                //shift <= 1'b0;
                aluimm <= 1'b1;
                //sext <= 1'b0;
                wmem <= 1'b0;
                aluc[2:0] <= 3'b110;
                pcsource <= 2'b00;
            end
            6'b00000: begin//j
                wreg <= 1'b0;
                //regrt <= 1'b1;
                //jal <= 1'b0;
                //m2reg <= 1'b0;
                //shift <= 1'b0;
                //aluimm <= 1'b1;
                //sext <= 1'b0;
                wmem <= 1'b0;
               // aluc[2:0] <= 3'b110;
                pcsource <= 2'b11;
            end
            6'b000011: begin//jal
                wreg <= 1'b1;
                //regrt <= 1'b1;
                //jal <= 1'b0;
                //m2reg <= 1'b0;
                //shift <= 1'b0;
                //aluimm <= 1'b1;
                //sext <= 1'b0;
                wmem <= 1'b0;
               // aluc[2:0] <= 3'b110;
                pcsource <= 2'b11;
            end
            default: begin
                wreg <= 1'b0;
                regrt <= 1'b0;
                jal <= 1'b0;
                m2reg <= 1'b0;
                shift <= 1'b0;
                aluimm <= 1'b0;
                sext <= 1'b0;
                wmem <= 1'b0;
                aluc <= 4'b0000;
                pcsource <= 2'b00;
            end
        endcase
    end
endmodule