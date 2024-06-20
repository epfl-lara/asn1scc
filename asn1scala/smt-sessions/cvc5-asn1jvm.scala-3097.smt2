; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71350 () Bool)

(assert start!71350)

(declare-datatypes ((array!20367 0))(
  ( (array!20368 (arr!9961 (Array (_ BitVec 32) (_ BitVec 8))) (size!8869 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13900 0))(
  ( (BitStream!13901 (buf!8011 array!20367) (currentByte!14782 (_ BitVec 32)) (currentBit!14777 (_ BitVec 32))) )
))
(declare-fun b!176 () BitStream!13900)

(declare-fun diffInBytes!20 () (_ BitVec 32))

(assert (=> start!71350 (and (bvsle (bvneg (size!8869 (buf!8011 b!176))) diffInBytes!20) (bvsle diffInBytes!20 (size!8869 (buf!8011 b!176))) (let ((bdg!18809 (bvand ((_ sign_extend 32) (currentByte!14782 b!176)) #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!18809 (bvand ((_ sign_extend 32) diffInBytes!20) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= bdg!18809 (bvand (bvadd ((_ sign_extend 32) (currentByte!14782 b!176)) ((_ sign_extend 32) diffInBytes!20)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!231461 () Bool)

(declare-fun inv!12 (BitStream!13900) Bool)

(assert (=> start!71350 (and (inv!12 b!176) e!231461)))

(assert (=> start!71350 true))

(declare-fun b!321427 () Bool)

(declare-fun array_inv!8421 (array!20367) Bool)

(assert (=> b!321427 (= e!231461 (array_inv!8421 (buf!8011 b!176)))))

(assert (= start!71350 b!321427))

(declare-fun m!459747 () Bool)

(assert (=> start!71350 m!459747))

(declare-fun m!459749 () Bool)

(assert (=> b!321427 m!459749))

(push 1)

(assert (not b!321427))

(assert (not start!71350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

