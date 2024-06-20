; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3900 () Bool)

(assert start!3900)

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!973 0))(
  ( (array!974 (arr!843 (Array (_ BitVec 32) (_ BitVec 8))) (size!414 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!788 0))(
  ( (BitStream!789 (buf!777 array!973) (currentByte!1946 (_ BitVec 32)) (currentBit!1941 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!788)

(assert (=> start!3900 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (or (bvsgt ((_ sign_extend 32) (size!414 (buf!777 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1946 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1941 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!3900 true))

(declare-fun e!10694 () Bool)

(declare-fun inv!12 (BitStream!788) Bool)

(assert (=> start!3900 (and (inv!12 b!162) e!10694)))

(declare-fun b!16979 () Bool)

(declare-fun array_inv!403 (array!973) Bool)

(assert (=> b!16979 (= e!10694 (array_inv!403 (buf!777 b!162)))))

(assert (= start!3900 b!16979))

(declare-fun m!23169 () Bool)

(assert (=> start!3900 m!23169))

(declare-fun m!23171 () Bool)

(assert (=> b!16979 m!23171))

(push 1)

(assert (not start!3900))

(assert (not b!16979))

(check-sat)

(pop 1)

(push 1)

(check-sat)

