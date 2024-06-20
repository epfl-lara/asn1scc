; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71336 () Bool)

(assert start!71336)

(declare-datatypes ((array!20362 0))(
  ( (array!20363 (arr!9960 (Array (_ BitVec 32) (_ BitVec 8))) (size!8868 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13898 0))(
  ( (BitStream!13899 (buf!8010 array!20362) (currentByte!14781 (_ BitVec 32)) (currentBit!14776 (_ BitVec 32))) )
))
(declare-fun b!176 () BitStream!13898)

(assert (=> start!71336 (= (size!8868 (buf!8010 b!176)) #b10000000000000000000000000000000)))

(declare-fun e!231455 () Bool)

(declare-fun inv!12 (BitStream!13898) Bool)

(assert (=> start!71336 (and (inv!12 b!176) e!231455)))

(declare-fun b!321424 () Bool)

(declare-fun array_inv!8420 (array!20362) Bool)

(assert (=> b!321424 (= e!231455 (array_inv!8420 (buf!8010 b!176)))))

(assert (= start!71336 b!321424))

(declare-fun m!459737 () Bool)

(assert (=> start!71336 m!459737))

(declare-fun m!459739 () Bool)

(assert (=> b!321424 m!459739))

(push 1)

(assert (not b!321424))

(assert (not start!71336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105355 () Bool)

(assert (=> d!105355 (= (array_inv!8420 (buf!8010 b!176)) (bvsge (size!8868 (buf!8010 b!176)) #b00000000000000000000000000000000))))

(assert (=> b!321424 d!105355))

(declare-fun d!105359 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105359 (= (inv!12 b!176) (invariant!0 (currentBit!14776 b!176) (currentByte!14781 b!176) (size!8868 (buf!8010 b!176))))))

(declare-fun bs!27707 () Bool)

(assert (= bs!27707 d!105359))

(declare-fun m!459745 () Bool)

