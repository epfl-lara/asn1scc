; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32646 () Bool)

(assert start!32646)

(declare-fun res!133778 () Bool)

(declare-fun e!109767 () Bool)

(assert (=> start!32646 (=> (not res!133778) (not e!109767))))

(declare-datatypes ((array!7683 0))(
  ( (array!7684 (arr!4394 (Array (_ BitVec 32) (_ BitVec 8))) (size!3473 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6114 0))(
  ( (BitStream!6115 (buf!3931 array!7683) (currentByte!7213 (_ BitVec 32)) (currentBit!7208 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6114)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32646 (= res!133778 (validate_offset_byte!0 ((_ sign_extend 32) (size!3473 (buf!3931 thiss!1602))) ((_ sign_extend 32) (currentByte!7213 thiss!1602)) ((_ sign_extend 32) (currentBit!7208 thiss!1602))))))

(assert (=> start!32646 e!109767))

(declare-fun e!109766 () Bool)

(declare-fun inv!12 (BitStream!6114) Bool)

(assert (=> start!32646 (and (inv!12 thiss!1602) e!109766)))

(declare-fun b!160331 () Bool)

(declare-fun lt!252945 () (_ BitVec 32))

(assert (=> b!160331 (= e!109767 (and (bvslt lt!252945 #b00000000000000000000000010000000) (bvslt lt!252945 #b11111111111111111111111110000000)))))

(assert (=> b!160331 (= lt!252945 (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7208 thiss!1602)))))))

(declare-fun b!160332 () Bool)

(declare-fun array_inv!3220 (array!7683) Bool)

(assert (=> b!160332 (= e!109766 (array_inv!3220 (buf!3931 thiss!1602)))))

(assert (= (and start!32646 res!133778) b!160331))

(assert (= start!32646 b!160332))

(declare-fun m!253117 () Bool)

(assert (=> start!32646 m!253117))

(declare-fun m!253119 () Bool)

(assert (=> start!32646 m!253119))

(declare-fun m!253121 () Bool)

(assert (=> b!160332 m!253121))

(check-sat (not b!160332) (not start!32646))
(check-sat)
