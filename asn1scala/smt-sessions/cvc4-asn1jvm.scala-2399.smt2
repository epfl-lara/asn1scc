; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61152 () Bool)

(assert start!61152)

(declare-fun b!275321 () Bool)

(declare-fun e!195292 () Bool)

(declare-datatypes ((array!15713 0))(
  ( (array!15714 (arr!7791 (Array (_ BitVec 32) (_ BitVec 8))) (size!6804 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12422 0))(
  ( (BitStream!12423 (buf!7272 array!15713) (currentByte!13445 (_ BitVec 32)) (currentBit!13440 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12422)

(declare-fun array_inv!6528 (array!15713) Bool)

(assert (=> b!275321 (= e!195292 (array_inv!6528 (buf!7272 bs2!19)))))

(declare-fun b!275322 () Bool)

(declare-fun res!228909 () Bool)

(declare-fun e!195293 () Bool)

(assert (=> b!275322 (=> (not res!228909) (not e!195293))))

(declare-fun bs1!11 () BitStream!12422)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275322 (= res!228909 (validate_offset_bit!0 ((_ sign_extend 32) (size!6804 (buf!7272 bs1!11))) ((_ sign_extend 32) (currentByte!13445 bs1!11)) ((_ sign_extend 32) (currentBit!13440 bs1!11))))))

(declare-fun b!275324 () Bool)

(declare-fun res!228908 () Bool)

(assert (=> b!275324 (=> (not res!228908) (not e!195293))))

(declare-fun arrayBitRangesEq!0 (array!15713 array!15713 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275324 (= res!228908 (arrayBitRangesEq!0 (buf!7272 bs1!11) (buf!7272 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6804 (buf!7272 bs1!11)) (currentByte!13445 bs1!11) (currentBit!13440 bs1!11)))))))

(declare-fun b!275325 () Bool)

(assert (=> b!275325 (= e!195293 (not true))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275325 (invariant!0 (currentBit!13440 bs1!11) (currentByte!13445 bs1!11) (size!6804 (buf!7272 bs2!19)))))

(declare-fun b!275323 () Bool)

(declare-fun e!195294 () Bool)

(assert (=> b!275323 (= e!195294 (array_inv!6528 (buf!7272 bs1!11)))))

(declare-fun res!228910 () Bool)

(assert (=> start!61152 (=> (not res!228910) (not e!195293))))

(assert (=> start!61152 (= res!228910 (= (size!6804 (buf!7272 bs1!11)) (size!6804 (buf!7272 bs2!19))))))

(assert (=> start!61152 e!195293))

(declare-fun inv!12 (BitStream!12422) Bool)

(assert (=> start!61152 (and (inv!12 bs1!11) e!195294)))

(assert (=> start!61152 (and (inv!12 bs2!19) e!195292)))

(assert (= (and start!61152 res!228910) b!275322))

(assert (= (and b!275322 res!228909) b!275324))

(assert (= (and b!275324 res!228908) b!275325))

(assert (= start!61152 b!275323))

(assert (= start!61152 b!275321))

(declare-fun m!407907 () Bool)

(assert (=> start!61152 m!407907))

(declare-fun m!407909 () Bool)

(assert (=> start!61152 m!407909))

(declare-fun m!407911 () Bool)

(assert (=> b!275325 m!407911))

(declare-fun m!407913 () Bool)

(assert (=> b!275321 m!407913))

(declare-fun m!407915 () Bool)

(assert (=> b!275323 m!407915))

(declare-fun m!407917 () Bool)

(assert (=> b!275324 m!407917))

(declare-fun m!407919 () Bool)

(assert (=> b!275324 m!407919))

(declare-fun m!407921 () Bool)

(assert (=> b!275322 m!407921))

(push 1)

(assert (not start!61152))

(assert (not b!275323))

(assert (not b!275325))

(assert (not b!275321))

(assert (not b!275322))

(assert (not b!275324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

