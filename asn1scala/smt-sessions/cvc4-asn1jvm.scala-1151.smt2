; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32606 () Bool)

(assert start!32606)

(declare-fun res!133763 () Bool)

(declare-fun e!109720 () Bool)

(assert (=> start!32606 (=> (not res!133763) (not e!109720))))

(declare-datatypes ((array!7670 0))(
  ( (array!7671 (arr!4389 (Array (_ BitVec 32) (_ BitVec 8))) (size!3468 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6104 0))(
  ( (BitStream!6105 (buf!3926 array!7670) (currentByte!7199 (_ BitVec 32)) (currentBit!7194 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6104)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32606 (= res!133763 (validate_offset_byte!0 ((_ sign_extend 32) (size!3468 (buf!3926 thiss!1602))) ((_ sign_extend 32) (currentByte!7199 thiss!1602)) ((_ sign_extend 32) (currentBit!7194 thiss!1602))))))

(assert (=> start!32606 e!109720))

(declare-fun e!109722 () Bool)

(declare-fun inv!12 (BitStream!6104) Bool)

(assert (=> start!32606 (and (inv!12 thiss!1602) e!109722)))

(declare-fun b!160301 () Bool)

(declare-fun lt!252939 () (_ BitVec 32))

(assert (=> b!160301 (= e!109720 (and (not (= #b00000000000000000000000000000000 (bvand lt!252939 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 lt!252939) #b10000000000000000000000000000000)))))))

(assert (=> b!160301 (= lt!252939 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7194 thiss!1602))))))

(declare-fun b!160302 () Bool)

(declare-fun array_inv!3215 (array!7670) Bool)

(assert (=> b!160302 (= e!109722 (array_inv!3215 (buf!3926 thiss!1602)))))

(assert (= (and start!32606 res!133763) b!160301))

(assert (= start!32606 b!160302))

(declare-fun m!253075 () Bool)

(assert (=> start!32606 m!253075))

(declare-fun m!253077 () Bool)

(assert (=> start!32606 m!253077))

(declare-fun m!253079 () Bool)

(assert (=> b!160302 m!253079))

(push 1)

(assert (not b!160302))

(assert (not start!32606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

