; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60996 () Bool)

(assert start!60996)

(declare-datatypes ((array!15637 0))(
  ( (array!15638 (arr!7760 (Array (_ BitVec 32) (_ BitVec 8))) (size!6773 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12360 0))(
  ( (BitStream!12361 (buf!7241 array!15637) (currentByte!13396 (_ BitVec 32)) (currentBit!13391 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12360)

(assert (=> start!60996 (not (= ((_ sign_extend 32) (size!6773 (buf!7241 b!177))) (bvsdiv (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6773 (buf!7241 b!177)))) #b1111111111111111111111111111111111111111111111111111111111111000)))))

(declare-fun e!194892 () Bool)

(declare-fun inv!12 (BitStream!12360) Bool)

(assert (=> start!60996 (and (inv!12 b!177) e!194892)))

(declare-fun b!275007 () Bool)

(declare-fun array_inv!6497 (array!15637) Bool)

(assert (=> b!275007 (= e!194892 (array_inv!6497 (buf!7241 b!177)))))

(assert (= start!60996 b!275007))

(declare-fun m!407577 () Bool)

(assert (=> start!60996 m!407577))

(declare-fun m!407579 () Bool)

(assert (=> b!275007 m!407579))

(check-sat (not start!60996) (not b!275007))
(check-sat)
