; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32692 () Bool)

(assert start!32692)

(declare-fun res!133802 () Bool)

(declare-fun e!109837 () Bool)

(assert (=> start!32692 (=> (not res!133802) (not e!109837))))

(declare-datatypes ((array!7702 0))(
  ( (array!7703 (arr!4402 (Array (_ BitVec 32) (_ BitVec 8))) (size!3481 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6130 0))(
  ( (BitStream!6131 (buf!3939 array!7702) (currentByte!7230 (_ BitVec 32)) (currentBit!7225 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6130)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32692 (= res!133802 (validate_offset_byte!0 ((_ sign_extend 32) (size!3481 (buf!3939 thiss!1602))) ((_ sign_extend 32) (currentByte!7230 thiss!1602)) ((_ sign_extend 32) (currentBit!7225 thiss!1602))))))

(assert (=> start!32692 e!109837))

(declare-fun e!109839 () Bool)

(declare-fun inv!12 (BitStream!6130) Bool)

(assert (=> start!32692 (and (inv!12 thiss!1602) e!109839)))

(declare-fun b!160379 () Bool)

(declare-fun lt!252960 () (_ BitVec 32))

(assert (=> b!160379 (= e!109837 (and (bvslt lt!252960 #b00000000000000000000000010000000) (bvslt lt!252960 #b11111111111111111111111110000000)))))

(assert (=> b!160379 (= lt!252960 (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7225 thiss!1602))))))))))))

(declare-fun b!160380 () Bool)

(declare-fun array_inv!3228 (array!7702) Bool)

(assert (=> b!160380 (= e!109839 (array_inv!3228 (buf!3939 thiss!1602)))))

(assert (= (and start!32692 res!133802) b!160379))

(assert (= start!32692 b!160380))

(declare-fun m!253183 () Bool)

(assert (=> start!32692 m!253183))

(declare-fun m!253185 () Bool)

(assert (=> start!32692 m!253185))

(declare-fun m!253187 () Bool)

(assert (=> b!160379 m!253187))

(declare-fun m!253189 () Bool)

(assert (=> b!160380 m!253189))

(push 1)

(assert (not start!32692))

(assert (not b!160380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

