; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3898 () Bool)

(assert start!3898)

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!971 0))(
  ( (array!972 (arr!842 (Array (_ BitVec 32) (_ BitVec 8))) (size!413 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!786 0))(
  ( (BitStream!787 (buf!776 array!971) (currentByte!1945 (_ BitVec 32)) (currentBit!1940 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!786)

(assert (=> start!3898 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (or (bvsgt ((_ sign_extend 32) (size!413 (buf!776 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1945 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1940 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!3898 true))

(declare-fun e!10688 () Bool)

(declare-fun inv!12 (BitStream!786) Bool)

(assert (=> start!3898 (and (inv!12 b!162) e!10688)))

(declare-fun b!16976 () Bool)

(declare-fun array_inv!402 (array!971) Bool)

(assert (=> b!16976 (= e!10688 (array_inv!402 (buf!776 b!162)))))

(assert (= start!3898 b!16976))

(declare-fun m!23165 () Bool)

(assert (=> start!3898 m!23165))

(declare-fun m!23167 () Bool)

(assert (=> b!16976 m!23167))

(check-sat (not start!3898) (not b!16976))
(check-sat)
