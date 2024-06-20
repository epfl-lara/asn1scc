; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38156 () Bool)

(assert start!38156)

(declare-fun res!142346 () Bool)

(declare-fun e!120032 () Bool)

(assert (=> start!38156 (=> (not res!142346) (not e!120032))))

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9185 0))(
  ( (array!9186 (arr!4988 (Array (_ BitVec 32) (_ BitVec 8))) (size!4058 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7224 0))(
  ( (BitStream!7225 (buf!4486 array!9185) (currentByte!8523 (_ BitVec 32)) (currentBit!8518 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7224)

(assert (=> start!38156 (= res!142346 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4058 (buf!4486 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8523 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8518 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4058 (buf!4486 thiss!1817))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8523 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8518 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38156 e!120032))

(assert (=> start!38156 true))

(declare-fun e!120034 () Bool)

(declare-fun inv!12 (BitStream!7224) Bool)

(assert (=> start!38156 (and (inv!12 thiss!1817) e!120034)))

(declare-fun b!171772 () Bool)

(declare-fun res!142347 () Bool)

(assert (=> b!171772 (=> (not res!142347) (not e!120032))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!171772 (= res!142347 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8518 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8523 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4058 (buf!4486 thiss!1817))))))))

(declare-fun b!171773 () Bool)

(assert (=> b!171773 (= e!120032 (bvslt ((_ sign_extend 32) nBits!575) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171774 () Bool)

(declare-fun array_inv!3799 (array!9185) Bool)

(assert (=> b!171774 (= e!120034 (array_inv!3799 (buf!4486 thiss!1817)))))

(assert (= (and start!38156 res!142346) b!171772))

(assert (= (and b!171772 res!142347) b!171773))

(assert (= start!38156 b!171774))

(declare-fun m!271025 () Bool)

(assert (=> start!38156 m!271025))

(declare-fun m!271027 () Bool)

(assert (=> b!171772 m!271027))

(declare-fun m!271029 () Bool)

(assert (=> b!171774 m!271029))

(check-sat (not b!171774) (not start!38156) (not b!171772))
(check-sat)
