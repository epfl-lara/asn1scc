; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60980 () Bool)

(assert start!60980)

(declare-fun res!228748 () Bool)

(declare-fun e!194879 () Bool)

(assert (=> start!60980 (=> (not res!228748) (not e!194879))))

(declare-datatypes ((array!15631 0))(
  ( (array!15632 (arr!7758 (Array (_ BitVec 32) (_ BitVec 8))) (size!6771 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12356 0))(
  ( (BitStream!12357 (buf!7239 array!15631) (currentByte!13392 (_ BitVec 32)) (currentBit!13387 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12356)

(declare-fun diffInBits!14 () (_ BitVec 64))

(assert (=> start!60980 (= res!228748 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6771 (buf!7239 b!177)))) diffInBits!14) (bvsle diffInBits!14 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6771 (buf!7239 b!177)))))))))

(assert (=> start!60980 e!194879))

(declare-fun e!194880 () Bool)

(declare-fun inv!12 (BitStream!12356) Bool)

(assert (=> start!60980 (and (inv!12 b!177) e!194880)))

(assert (=> start!60980 true))

(declare-fun b!275000 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275000 (= e!194879 (not (invariant!0 (currentBit!13387 b!177) (currentByte!13392 b!177) (size!6771 (buf!7239 b!177)))))))

(declare-fun b!275001 () Bool)

(declare-fun array_inv!6495 (array!15631) Bool)

(assert (=> b!275001 (= e!194880 (array_inv!6495 (buf!7239 b!177)))))

(assert (= (and start!60980 res!228748) b!275000))

(assert (= start!60980 b!275001))

(declare-fun m!407567 () Bool)

(assert (=> start!60980 m!407567))

(declare-fun m!407569 () Bool)

(assert (=> b!275000 m!407569))

(declare-fun m!407571 () Bool)

(assert (=> b!275001 m!407571))

(push 1)

(assert (not b!275000))

(assert (not start!60980))

(assert (not b!275001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

