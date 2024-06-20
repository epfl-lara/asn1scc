; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68792 () Bool)

(assert start!68792)

(declare-fun res!254629 () Bool)

(declare-fun e!223143 () Bool)

(assert (=> start!68792 (=> (not res!254629) (not e!223143))))

(declare-fun nBits!480 () (_ BitVec 64))

(declare-datatypes ((array!18908 0))(
  ( (array!18909 (arr!9288 (Array (_ BitVec 32) (_ BitVec 8))) (size!8205 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13520 0))(
  ( (BitStream!13521 (buf!7821 array!18908) (currentByte!14386 (_ BitVec 32)) (currentBit!14381 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13520)

(assert (=> start!68792 (= res!254629 (and (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!8205 (buf!7821 bitStream!19))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14386 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14381 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8205 (buf!7821 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14386 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14381 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!68792 e!223143))

(assert (=> start!68792 true))

(declare-fun e!223144 () Bool)

(declare-fun inv!12 (BitStream!13520) Bool)

(assert (=> start!68792 (and (inv!12 bitStream!19) e!223144)))

(declare-fun b!310595 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310595 (= e!223143 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14381 bitStream!19))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14386 bitStream!19))) ((_ extract 31 0) ((_ sign_extend 32) (size!8205 (buf!7821 bitStream!19)))))))))

(declare-fun b!310596 () Bool)

(declare-fun array_inv!7760 (array!18908) Bool)

(assert (=> b!310596 (= e!223144 (array_inv!7760 (buf!7821 bitStream!19)))))

(assert (= (and start!68792 res!254629) b!310595))

(assert (= start!68792 b!310596))

(declare-fun m!448389 () Bool)

(assert (=> start!68792 m!448389))

(declare-fun m!448391 () Bool)

(assert (=> b!310595 m!448391))

(declare-fun m!448393 () Bool)

(assert (=> b!310596 m!448393))

(push 1)

(assert (not b!310595))

(assert (not b!310596))

(assert (not start!68792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

