; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4668 () Bool)

(assert start!4668)

(declare-fun bits!97 () (_ BitVec 64))

(declare-datatypes ((array!1276 0))(
  ( (array!1277 (arr!980 (Array (_ BitVec 32) (_ BitVec 8))) (size!539 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!912 0))(
  ( (BitStream!913 (buf!839 array!1276) (currentByte!2102 (_ BitVec 32)) (currentBit!2097 (_ BitVec 32))) )
))
(declare-fun thiss!912 () BitStream!912)

(assert (=> start!4668 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!97) (or (bvsgt ((_ sign_extend 32) (size!539 (buf!839 thiss!912))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!2102 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!2097 thiss!912)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!4668 true))

(declare-fun e!12050 () Bool)

(declare-fun inv!12 (BitStream!912) Bool)

(assert (=> start!4668 (and (inv!12 thiss!912) e!12050)))

(declare-fun b!18722 () Bool)

(declare-fun array_inv!509 (array!1276) Bool)

(assert (=> b!18722 (= e!12050 (array_inv!509 (buf!839 thiss!912)))))

(assert (= start!4668 b!18722))

(declare-fun m!25139 () Bool)

(assert (=> start!4668 m!25139))

(declare-fun m!25141 () Bool)

(assert (=> b!18722 m!25141))

(check-sat (not b!18722) (not start!4668))
(check-sat)
