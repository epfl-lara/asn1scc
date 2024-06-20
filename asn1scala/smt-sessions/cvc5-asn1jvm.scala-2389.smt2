; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60994 () Bool)

(assert start!60994)

(declare-datatypes ((array!15635 0))(
  ( (array!15636 (arr!7759 (Array (_ BitVec 32) (_ BitVec 8))) (size!6772 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12358 0))(
  ( (BitStream!12359 (buf!7240 array!15635) (currentByte!13395 (_ BitVec 32)) (currentBit!13390 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12358)

(assert (=> start!60994 (not (= ((_ sign_extend 32) (size!6772 (buf!7240 b!177))) (bvsdiv (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6772 (buf!7240 b!177)))) #b1111111111111111111111111111111111111111111111111111111111111000)))))

(declare-fun e!194886 () Bool)

(declare-fun inv!12 (BitStream!12358) Bool)

(assert (=> start!60994 (and (inv!12 b!177) e!194886)))

(declare-fun b!275004 () Bool)

(declare-fun array_inv!6496 (array!15635) Bool)

(assert (=> b!275004 (= e!194886 (array_inv!6496 (buf!7240 b!177)))))

(assert (= start!60994 b!275004))

(declare-fun m!407573 () Bool)

(assert (=> start!60994 m!407573))

(declare-fun m!407575 () Bool)

(assert (=> b!275004 m!407575))

(push 1)

(assert (not b!275004))

(assert (not start!60994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

