; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34998 () Bool)

(assert start!34998)

(declare-fun res!137393 () Bool)

(declare-fun e!114021 () Bool)

(assert (=> start!34998 (=> (not res!137393) (not e!114021))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34998 (= res!137393 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34998 e!114021))

(assert (=> start!34998 true))

(declare-datatypes ((array!8305 0))(
  ( (array!8306 (arr!4635 (Array (_ BitVec 32) (_ BitVec 8))) (size!3714 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6584 0))(
  ( (BitStream!6585 (buf!4166 array!8305) (currentByte!7776 (_ BitVec 32)) (currentBit!7771 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6584)

(declare-fun e!114019 () Bool)

(declare-fun inv!12 (BitStream!6584) Bool)

(assert (=> start!34998 (and (inv!12 thiss!1577) e!114019)))

(declare-fun b!164902 () Bool)

(declare-fun res!137392 () Bool)

(assert (=> b!164902 (=> (not res!137392) (not e!114021))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164902 (= res!137392 (validate_offset_bits!1 ((_ sign_extend 32) (size!3714 (buf!4166 thiss!1577))) ((_ sign_extend 32) (currentByte!7776 thiss!1577)) ((_ sign_extend 32) (currentBit!7771 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164903 () Bool)

(assert (=> b!164903 (= e!114021 (or (bvslt nBits!511 #b00000000000000000000000000000000) (bvsge nBits!511 #b00000000000000000000000000001001)))))

(declare-fun b!164904 () Bool)

(declare-fun array_inv!3455 (array!8305) Bool)

(assert (=> b!164904 (= e!114019 (array_inv!3455 (buf!4166 thiss!1577)))))

(assert (= (and start!34998 res!137393) b!164902))

(assert (= (and b!164902 res!137392) b!164903))

(assert (= start!34998 b!164904))

(declare-fun m!262255 () Bool)

(assert (=> start!34998 m!262255))

(declare-fun m!262257 () Bool)

(assert (=> b!164902 m!262257))

(declare-fun m!262259 () Bool)

(assert (=> b!164904 m!262259))

(push 1)

(assert (not b!164904))

(assert (not b!164902))

(assert (not start!34998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

