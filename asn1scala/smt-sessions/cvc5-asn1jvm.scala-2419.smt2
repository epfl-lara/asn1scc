; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61726 () Bool)

(assert start!61726)

(declare-fun res!230059 () Bool)

(declare-fun e!196866 () Bool)

(assert (=> start!61726 (=> (not res!230059) (not e!196866))))

(declare-datatypes ((array!15853 0))(
  ( (array!15854 (arr!7858 (Array (_ BitVec 32) (_ BitVec 8))) (size!6862 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12538 0))(
  ( (BitStream!12539 (buf!7330 array!15853) (currentByte!13580 (_ BitVec 32)) (currentBit!13575 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12538)

(declare-fun b2!124 () BitStream!12538)

(assert (=> start!61726 (= res!230059 (= (size!6862 (buf!7330 thiss!872)) (size!6862 (buf!7330 b2!124))))))

(assert (=> start!61726 e!196866))

(declare-fun e!196868 () Bool)

(declare-fun inv!12 (BitStream!12538) Bool)

(assert (=> start!61726 (and (inv!12 thiss!872) e!196868)))

(declare-fun e!196867 () Bool)

(assert (=> start!61726 (and (inv!12 b2!124) e!196867)))

(declare-fun b!276946 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276946 (= e!196866 (not (invariant!0 (currentBit!13575 thiss!872) (currentByte!13580 thiss!872) (size!6862 (buf!7330 thiss!872)))))))

(declare-fun b!276947 () Bool)

(declare-fun array_inv!6586 (array!15853) Bool)

(assert (=> b!276947 (= e!196868 (array_inv!6586 (buf!7330 thiss!872)))))

(declare-fun b!276948 () Bool)

(assert (=> b!276948 (= e!196867 (array_inv!6586 (buf!7330 b2!124)))))

(assert (= (and start!61726 res!230059) b!276946))

(assert (= start!61726 b!276947))

(assert (= start!61726 b!276948))

(declare-fun m!410141 () Bool)

(assert (=> start!61726 m!410141))

(declare-fun m!410143 () Bool)

(assert (=> start!61726 m!410143))

(declare-fun m!410145 () Bool)

(assert (=> b!276946 m!410145))

(declare-fun m!410147 () Bool)

(assert (=> b!276947 m!410147))

(declare-fun m!410149 () Bool)

(assert (=> b!276948 m!410149))

(push 1)

(assert (not b!276946))

(assert (not start!61726))

(assert (not b!276947))

(assert (not b!276948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95524 () Bool)

(assert (=> d!95524 (= (invariant!0 (currentBit!13575 thiss!872) (currentByte!13580 thiss!872) (size!6862 (buf!7330 thiss!872))) (and (bvsge (currentBit!13575 thiss!872) #b00000000000000000000000000000000) (bvslt (currentBit!13575 thiss!872) #b00000000000000000000000000001000) (bvsge (currentByte!13580 thiss!872) #b00000000000000000000000000000000) (or (bvslt (currentByte!13580 thiss!872) (size!6862 (buf!7330 thiss!872))) (and (= (currentBit!13575 thiss!872) #b00000000000000000000000000000000) (= (currentByte!13580 thiss!872) (size!6862 (buf!7330 thiss!872)))))))))

(assert (=> b!276946 d!95524))

(declare-fun d!95532 () Bool)

(assert (=> d!95532 (= (inv!12 thiss!872) (invariant!0 (currentBit!13575 thiss!872) (currentByte!13580 thiss!872) (size!6862 (buf!7330 thiss!872))))))

(declare-fun bs!24091 () Bool)

(assert (= bs!24091 d!95532))

(assert (=> bs!24091 m!410145))

(assert (=> start!61726 d!95532))

(declare-fun d!95536 () Bool)

(assert (=> d!95536 (= (inv!12 b2!124) (invariant!0 (currentBit!13575 b2!124) (currentByte!13580 b2!124) (size!6862 (buf!7330 b2!124))))))

(declare-fun bs!24092 () Bool)

(assert (= bs!24092 d!95536))

(declare-fun m!410175 () Bool)

(assert (=> bs!24092 m!410175))

