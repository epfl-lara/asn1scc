; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71354 () Bool)

(assert start!71354)

(declare-datatypes ((array!20371 0))(
  ( (array!20372 (arr!9963 (Array (_ BitVec 32) (_ BitVec 8))) (size!8871 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13904 0))(
  ( (BitStream!13905 (buf!8013 array!20371) (currentByte!14784 (_ BitVec 32)) (currentBit!14779 (_ BitVec 32))) )
))
(declare-fun b!176 () BitStream!13904)

(declare-fun diffInBytes!20 () (_ BitVec 32))

(assert (=> start!71354 (and (bvsle (bvneg (size!8871 (buf!8013 b!176))) diffInBytes!20) (bvsle diffInBytes!20 (size!8871 (buf!8013 b!176))) (let ((bdg!18809 (bvand ((_ sign_extend 32) (currentByte!14784 b!176)) #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18809 (bvand ((_ sign_extend 32) diffInBytes!20) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18809 (bvand (bvadd ((_ sign_extend 32) (currentByte!14784 b!176)) ((_ sign_extend 32) diffInBytes!20)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!231473 () Bool)

(declare-fun inv!12 (BitStream!13904) Bool)

(assert (=> start!71354 (and (inv!12 b!176) e!231473)))

(assert (=> start!71354 true))

(declare-fun b!321433 () Bool)

(declare-fun array_inv!8423 (array!20371) Bool)

(assert (=> b!321433 (= e!231473 (array_inv!8423 (buf!8013 b!176)))))

(assert (= start!71354 b!321433))

(declare-fun m!459755 () Bool)

(assert (=> start!71354 m!459755))

(declare-fun m!459757 () Bool)

(assert (=> b!321433 m!459757))

(push 1)

(assert (not b!321433))

(assert (not start!71354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

