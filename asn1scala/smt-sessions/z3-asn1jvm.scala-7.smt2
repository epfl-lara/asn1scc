; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126 () Bool)

(assert start!126)

(declare-datatypes ((array!50 0))(
  ( (array!51 (arr!407 (Array (_ BitVec 32) (_ BitVec 8))) (size!20 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!24 0))(
  ( (BitStream!25 (buf!332 array!50) (currentByte!1224 (_ BitVec 32)) (currentBit!1219 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!24)

(assert (=> start!126 (or (bvsgt ((_ sign_extend 32) (size!20 (buf!332 thiss!932))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1224 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1219 thiss!932)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!118 () Bool)

(declare-fun inv!12 (BitStream!24) Bool)

(assert (=> start!126 (and (inv!12 thiss!932) e!118)))

(declare-fun b!382 () Bool)

(declare-fun array_inv!17 (array!50) Bool)

(assert (=> b!382 (= e!118 (array_inv!17 (buf!332 thiss!932)))))

(assert (= start!126 b!382))

(declare-fun m!125 () Bool)

(assert (=> start!126 m!125))

(declare-fun m!127 () Bool)

(assert (=> b!382 m!127))

(check-sat (not b!382) (not start!126))
(check-sat)
