; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51296 () Bool)

(assert start!51296)

(declare-datatypes ((array!12834 0))(
  ( (array!12835 (arr!6623 (Array (_ BitVec 32) (_ BitVec 8))) (size!5636 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10194 0))(
  ( (BitStream!10195 (buf!6090 array!12834) (currentByte!11293 (_ BitVec 32)) (currentBit!11288 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10194)

(assert (=> start!51296 (or (bvsgt ((_ sign_extend 32) (size!5636 (buf!6090 thiss!1854))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11293 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11288 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!165358 () Bool)

(declare-fun inv!12 (BitStream!10194) Bool)

(assert (=> start!51296 (and (inv!12 thiss!1854) e!165358)))

(declare-fun b!239153 () Bool)

(declare-fun array_inv!5377 (array!12834) Bool)

(assert (=> b!239153 (= e!165358 (array_inv!5377 (buf!6090 thiss!1854)))))

(assert (= start!51296 b!239153))

(declare-fun m!361207 () Bool)

(assert (=> start!51296 m!361207))

(declare-fun m!361209 () Bool)

(assert (=> b!239153 m!361209))

(check-sat (not b!239153) (not start!51296))
(check-sat)
