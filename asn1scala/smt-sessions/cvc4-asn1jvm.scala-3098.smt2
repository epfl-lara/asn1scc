; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71360 () Bool)

(assert start!71360)

(declare-datatypes ((array!20377 0))(
  ( (array!20378 (arr!9966 (Array (_ BitVec 32) (_ BitVec 8))) (size!8874 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13910 0))(
  ( (BitStream!13911 (buf!8016 array!20377) (currentByte!14787 (_ BitVec 32)) (currentBit!14782 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13910)

(assert (=> start!71360 (or (bvsgt ((_ sign_extend 32) (size!8874 (buf!8016 thiss!1701))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!14787 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!14782 thiss!1701)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!231491 () Bool)

(declare-fun inv!12 (BitStream!13910) Bool)

(assert (=> start!71360 (and (inv!12 thiss!1701) e!231491)))

(declare-fun b!321442 () Bool)

(declare-fun array_inv!8426 (array!20377) Bool)

(assert (=> b!321442 (= e!231491 (array_inv!8426 (buf!8016 thiss!1701)))))

(assert (= start!71360 b!321442))

(declare-fun m!459767 () Bool)

(assert (=> start!71360 m!459767))

(declare-fun m!459769 () Bool)

(assert (=> b!321442 m!459769))

(push 1)

(assert (not b!321442))

(assert (not start!71360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

