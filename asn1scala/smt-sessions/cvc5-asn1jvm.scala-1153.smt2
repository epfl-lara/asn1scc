; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32644 () Bool)

(assert start!32644)

(declare-fun res!133775 () Bool)

(declare-fun e!109757 () Bool)

(assert (=> start!32644 (=> (not res!133775) (not e!109757))))

(declare-datatypes ((array!7681 0))(
  ( (array!7682 (arr!4393 (Array (_ BitVec 32) (_ BitVec 8))) (size!3472 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6112 0))(
  ( (BitStream!6113 (buf!3930 array!7681) (currentByte!7212 (_ BitVec 32)) (currentBit!7207 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6112)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32644 (= res!133775 (validate_offset_byte!0 ((_ sign_extend 32) (size!3472 (buf!3930 thiss!1602))) ((_ sign_extend 32) (currentByte!7212 thiss!1602)) ((_ sign_extend 32) (currentBit!7207 thiss!1602))))))

(assert (=> start!32644 e!109757))

(declare-fun e!109756 () Bool)

(declare-fun inv!12 (BitStream!6112) Bool)

(assert (=> start!32644 (and (inv!12 thiss!1602) e!109756)))

(declare-fun b!160325 () Bool)

(declare-fun lt!252942 () (_ BitVec 32))

(assert (=> b!160325 (= e!109757 (and (bvslt lt!252942 #b00000000000000000000000010000000) (bvslt lt!252942 #b11111111111111111111111110000000)))))

(assert (=> b!160325 (= lt!252942 (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7207 thiss!1602)))))))

(declare-fun b!160326 () Bool)

(declare-fun array_inv!3219 (array!7681) Bool)

(assert (=> b!160326 (= e!109756 (array_inv!3219 (buf!3930 thiss!1602)))))

(assert (= (and start!32644 res!133775) b!160325))

(assert (= start!32644 b!160326))

(declare-fun m!253111 () Bool)

(assert (=> start!32644 m!253111))

(declare-fun m!253113 () Bool)

(assert (=> start!32644 m!253113))

(declare-fun m!253115 () Bool)

(assert (=> b!160326 m!253115))

(push 1)

(assert (not start!32644))

(assert (not b!160326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

