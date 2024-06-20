; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61004 () Bool)

(assert start!61004)

(declare-datatypes ((array!15645 0))(
  ( (array!15646 (arr!7764 (Array (_ BitVec 32) (_ BitVec 8))) (size!6777 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12368 0))(
  ( (BitStream!12369 (buf!7245 array!15645) (currentByte!13400 (_ BitVec 32)) (currentBit!13395 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12368)

(declare-fun diffInBits!14 () (_ BitVec 64))

(assert (=> start!61004 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6777 (buf!7245 b!177)))) diffInBits!14) (not (= ((_ sign_extend 32) (size!6777 (buf!7245 b!177))) (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6777 (buf!7245 b!177)))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!194916 () Bool)

(declare-fun inv!12 (BitStream!12368) Bool)

(assert (=> start!61004 (and (inv!12 b!177) e!194916)))

(assert (=> start!61004 true))

(declare-fun b!275019 () Bool)

(declare-fun array_inv!6501 (array!15645) Bool)

(assert (=> b!275019 (= e!194916 (array_inv!6501 (buf!7245 b!177)))))

(assert (= start!61004 b!275019))

(declare-fun m!407593 () Bool)

(assert (=> start!61004 m!407593))

(declare-fun m!407595 () Bool)

(assert (=> b!275019 m!407595))

(push 1)

(assert (not start!61004))

(assert (not b!275019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

