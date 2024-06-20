; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72346 () Bool)

(assert start!72346)

(declare-datatypes ((array!20727 0))(
  ( (array!20728 (arr!10112 (Array (_ BitVec 32) (_ BitVec 8))) (size!9020 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14202 0))(
  ( (BitStream!14203 (buf!8162 array!20727) (currentByte!15057 (_ BitVec 32)) (currentBit!15052 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14202)

(assert (=> start!72346 (or (bvsgt ((_ sign_extend 32) (size!9020 (buf!8162 thiss!1702))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15057 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15052 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!233429 () Bool)

(declare-fun inv!12 (BitStream!14202) Bool)

(assert (=> start!72346 (and (inv!12 thiss!1702) e!233429)))

(declare-fun b!324007 () Bool)

(declare-fun array_inv!8572 (array!20727) Bool)

(assert (=> b!324007 (= e!233429 (array_inv!8572 (buf!8162 thiss!1702)))))

(assert (= start!72346 b!324007))

(declare-fun m!462071 () Bool)

(assert (=> start!72346 m!462071))

(declare-fun m!462073 () Bool)

(assert (=> b!324007 m!462073))

(check-sat (not start!72346) (not b!324007))
(check-sat)
