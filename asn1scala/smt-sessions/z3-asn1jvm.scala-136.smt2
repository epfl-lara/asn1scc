; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3248 () Bool)

(assert start!3248)

(declare-fun nBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!821 0))(
  ( (array!822 (arr!779 (Array (_ BitVec 32) (_ BitVec 8))) (size!350 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!660 0))(
  ( (BitStream!661 (buf!701 array!821) (currentByte!1842 (_ BitVec 32)) (currentBit!1837 (_ BitVec 32))) )
))
(declare-fun thiss!1862 () BitStream!660)

(assert (=> start!3248 (and (bvsge nBytes!1 #b00000000000000000000000000000000) (or (bvsgt ((_ sign_extend 32) (size!350 (buf!701 thiss!1862))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1842 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1837 thiss!1862)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!3248 true))

(declare-fun e!9056 () Bool)

(declare-fun inv!12 (BitStream!660) Bool)

(assert (=> start!3248 (and (inv!12 thiss!1862) e!9056)))

(declare-fun b!14585 () Bool)

(declare-fun array_inv!339 (array!821) Bool)

(assert (=> b!14585 (= e!9056 (array_inv!339 (buf!701 thiss!1862)))))

(assert (= start!3248 b!14585))

(declare-fun m!21011 () Bool)

(assert (=> start!3248 m!21011))

(declare-fun m!21013 () Bool)

(assert (=> b!14585 m!21013))

(check-sat (not start!3248) (not b!14585))
(check-sat)
