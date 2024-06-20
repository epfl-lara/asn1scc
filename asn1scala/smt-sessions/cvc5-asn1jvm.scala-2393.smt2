; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61036 () Bool)

(assert start!61036)

(declare-datatypes ((array!15662 0))(
  ( (array!15663 (arr!7771 (Array (_ BitVec 32) (_ BitVec 8))) (size!6784 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12382 0))(
  ( (BitStream!12383 (buf!7252 array!15662) (currentByte!13410 (_ BitVec 32)) (currentBit!13405 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12382)

(declare-fun bs2!19 () BitStream!12382)

(assert (=> start!61036 (and (= (size!6784 (buf!7252 bs1!11)) (size!6784 (buf!7252 bs2!19))) (or (bvsgt ((_ sign_extend 32) (size!6784 (buf!7252 bs1!11))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13410 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13405 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!194998 () Bool)

(declare-fun inv!12 (BitStream!12382) Bool)

(assert (=> start!61036 (and (inv!12 bs1!11) e!194998)))

(declare-fun e!195000 () Bool)

(assert (=> start!61036 (and (inv!12 bs2!19) e!195000)))

(declare-fun b!275096 () Bool)

(declare-fun array_inv!6508 (array!15662) Bool)

(assert (=> b!275096 (= e!194998 (array_inv!6508 (buf!7252 bs1!11)))))

(declare-fun b!275097 () Bool)

(assert (=> b!275097 (= e!195000 (array_inv!6508 (buf!7252 bs2!19)))))

(assert (= start!61036 b!275096))

(assert (= start!61036 b!275097))

(declare-fun m!407645 () Bool)

(assert (=> start!61036 m!407645))

(declare-fun m!407647 () Bool)

(assert (=> start!61036 m!407647))

(declare-fun m!407649 () Bool)

(assert (=> b!275096 m!407649))

(declare-fun m!407651 () Bool)

(assert (=> b!275097 m!407651))

(push 1)

(assert (not b!275097))

(assert (not start!61036))

(assert (not b!275096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

