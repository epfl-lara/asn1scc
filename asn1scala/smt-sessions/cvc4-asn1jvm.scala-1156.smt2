; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32696 () Bool)

(assert start!32696)

(declare-fun res!133808 () Bool)

(declare-fun e!109857 () Bool)

(assert (=> start!32696 (=> (not res!133808) (not e!109857))))

(declare-datatypes ((array!7706 0))(
  ( (array!7707 (arr!4404 (Array (_ BitVec 32) (_ BitVec 8))) (size!3483 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6134 0))(
  ( (BitStream!6135 (buf!3941 array!7706) (currentByte!7232 (_ BitVec 32)) (currentBit!7227 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6134)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32696 (= res!133808 (validate_offset_byte!0 ((_ sign_extend 32) (size!3483 (buf!3941 thiss!1602))) ((_ sign_extend 32) (currentByte!7232 thiss!1602)) ((_ sign_extend 32) (currentBit!7227 thiss!1602))))))

(assert (=> start!32696 e!109857))

(declare-fun e!109856 () Bool)

(declare-fun inv!12 (BitStream!6134) Bool)

(assert (=> start!32696 (and (inv!12 thiss!1602) e!109856)))

(declare-fun b!160391 () Bool)

(declare-fun lt!252966 () (_ BitVec 32))

(assert (=> b!160391 (= e!109857 (and (bvslt lt!252966 #b00000000000000000000000010000000) (bvslt lt!252966 #b11111111111111111111111110000000)))))

(assert (=> b!160391 (= lt!252966 (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7227 thiss!1602))))))))))))

(declare-fun b!160392 () Bool)

(declare-fun array_inv!3230 (array!7706) Bool)

(assert (=> b!160392 (= e!109856 (array_inv!3230 (buf!3941 thiss!1602)))))

(assert (= (and start!32696 res!133808) b!160391))

(assert (= start!32696 b!160392))

(declare-fun m!253199 () Bool)

(assert (=> start!32696 m!253199))

(declare-fun m!253201 () Bool)

(assert (=> start!32696 m!253201))

(declare-fun m!253203 () Bool)

(assert (=> b!160391 m!253203))

(declare-fun m!253205 () Bool)

(assert (=> b!160392 m!253205))

(push 1)

(assert (not start!32696))

(assert (not b!160392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

