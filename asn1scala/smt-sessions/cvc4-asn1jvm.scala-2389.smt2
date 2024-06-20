; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60998 () Bool)

(assert start!60998)

(declare-datatypes ((array!15639 0))(
  ( (array!15640 (arr!7761 (Array (_ BitVec 32) (_ BitVec 8))) (size!6774 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12362 0))(
  ( (BitStream!12363 (buf!7242 array!15639) (currentByte!13397 (_ BitVec 32)) (currentBit!13392 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12362)

(assert (=> start!60998 (not (= ((_ sign_extend 32) (size!6774 (buf!7242 b!177))) (bvsdiv (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6774 (buf!7242 b!177)))) #b1111111111111111111111111111111111111111111111111111111111111000)))))

(declare-fun e!194898 () Bool)

(declare-fun inv!12 (BitStream!12362) Bool)

(assert (=> start!60998 (and (inv!12 b!177) e!194898)))

(declare-fun b!275010 () Bool)

(declare-fun array_inv!6498 (array!15639) Bool)

(assert (=> b!275010 (= e!194898 (array_inv!6498 (buf!7242 b!177)))))

(assert (= start!60998 b!275010))

(declare-fun m!407581 () Bool)

(assert (=> start!60998 m!407581))

(declare-fun m!407583 () Bool)

(assert (=> b!275010 m!407583))

(push 1)

(assert (not start!60998))

(assert (not b!275010))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

