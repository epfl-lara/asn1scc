; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32648 () Bool)

(assert start!32648)

(declare-fun res!133781 () Bool)

(declare-fun e!109774 () Bool)

(assert (=> start!32648 (=> (not res!133781) (not e!109774))))

(declare-datatypes ((array!7685 0))(
  ( (array!7686 (arr!4395 (Array (_ BitVec 32) (_ BitVec 8))) (size!3474 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6116 0))(
  ( (BitStream!6117 (buf!3932 array!7685) (currentByte!7214 (_ BitVec 32)) (currentBit!7209 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6116)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32648 (= res!133781 (validate_offset_byte!0 ((_ sign_extend 32) (size!3474 (buf!3932 thiss!1602))) ((_ sign_extend 32) (currentByte!7214 thiss!1602)) ((_ sign_extend 32) (currentBit!7209 thiss!1602))))))

(assert (=> start!32648 e!109774))

(declare-fun e!109775 () Bool)

(declare-fun inv!12 (BitStream!6116) Bool)

(assert (=> start!32648 (and (inv!12 thiss!1602) e!109775)))

(declare-fun b!160337 () Bool)

(declare-fun lt!252948 () (_ BitVec 32))

(assert (=> b!160337 (= e!109774 (and (bvslt lt!252948 #b00000000000000000000000010000000) (bvslt lt!252948 #b11111111111111111111111110000000)))))

(assert (=> b!160337 (= lt!252948 (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7209 thiss!1602)))))))

(declare-fun b!160338 () Bool)

(declare-fun array_inv!3221 (array!7685) Bool)

(assert (=> b!160338 (= e!109775 (array_inv!3221 (buf!3932 thiss!1602)))))

(assert (= (and start!32648 res!133781) b!160337))

(assert (= start!32648 b!160338))

(declare-fun m!253123 () Bool)

(assert (=> start!32648 m!253123))

(declare-fun m!253125 () Bool)

(assert (=> start!32648 m!253125))

(declare-fun m!253127 () Bool)

(assert (=> b!160338 m!253127))

(push 1)

(assert (not start!32648))

(assert (not b!160338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

