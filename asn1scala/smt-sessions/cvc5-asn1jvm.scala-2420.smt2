; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61750 () Bool)

(assert start!61750)

(declare-fun res!230068 () Bool)

(declare-fun e!196912 () Bool)

(assert (=> start!61750 (=> (not res!230068) (not e!196912))))

(declare-datatypes ((array!15862 0))(
  ( (array!15863 (arr!7861 (Array (_ BitVec 32) (_ BitVec 8))) (size!6865 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12544 0))(
  ( (BitStream!12545 (buf!7333 array!15862) (currentByte!13586 (_ BitVec 32)) (currentBit!13581 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12544)

(declare-fun b2!124 () BitStream!12544)

(assert (=> start!61750 (= res!230068 (= (size!6865 (buf!7333 thiss!872)) (size!6865 (buf!7333 b2!124))))))

(assert (=> start!61750 e!196912))

(declare-fun e!196911 () Bool)

(declare-fun inv!12 (BitStream!12544) Bool)

(assert (=> start!61750 (and (inv!12 thiss!872) e!196911)))

(declare-fun e!196913 () Bool)

(assert (=> start!61750 (and (inv!12 b2!124) e!196913)))

(declare-fun b!276973 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276973 (= e!196912 (not (invariant!0 (currentBit!13581 b2!124) (currentByte!13586 b2!124) (size!6865 (buf!7333 b2!124)))))))

(declare-fun b!276974 () Bool)

(declare-fun array_inv!6589 (array!15862) Bool)

(assert (=> b!276974 (= e!196911 (array_inv!6589 (buf!7333 thiss!872)))))

(declare-fun b!276975 () Bool)

(assert (=> b!276975 (= e!196913 (array_inv!6589 (buf!7333 b2!124)))))

(assert (= (and start!61750 res!230068) b!276973))

(assert (= start!61750 b!276974))

(assert (= start!61750 b!276975))

(declare-fun m!410177 () Bool)

(assert (=> start!61750 m!410177))

(declare-fun m!410179 () Bool)

(assert (=> start!61750 m!410179))

(declare-fun m!410181 () Bool)

(assert (=> b!276973 m!410181))

(declare-fun m!410183 () Bool)

(assert (=> b!276974 m!410183))

(declare-fun m!410185 () Bool)

(assert (=> b!276975 m!410185))

(push 1)

(assert (not b!276975))

(assert (not b!276973))

(assert (not start!61750))

(assert (not b!276974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95544 () Bool)

(assert (=> d!95544 (= (array_inv!6589 (buf!7333 b2!124)) (bvsge (size!6865 (buf!7333 b2!124)) #b00000000000000000000000000000000))))

(assert (=> b!276975 d!95544))

(declare-fun d!95546 () Bool)

(assert (=> d!95546 (= (invariant!0 (currentBit!13581 b2!124) (currentByte!13586 b2!124) (size!6865 (buf!7333 b2!124))) (and (bvsge (currentBit!13581 b2!124) #b00000000000000000000000000000000) (bvslt (currentBit!13581 b2!124) #b00000000000000000000000000001000) (bvsge (currentByte!13586 b2!124) #b00000000000000000000000000000000) (or (bvslt (currentByte!13586 b2!124) (size!6865 (buf!7333 b2!124))) (and (= (currentBit!13581 b2!124) #b00000000000000000000000000000000) (= (currentByte!13586 b2!124) (size!6865 (buf!7333 b2!124)))))))))

(assert (=> b!276973 d!95546))

(declare-fun d!95552 () Bool)

(assert (=> d!95552 (= (inv!12 thiss!872) (invariant!0 (currentBit!13581 thiss!872) (currentByte!13586 thiss!872) (size!6865 (buf!7333 thiss!872))))))

(declare-fun bs!24096 () Bool)

(assert (= bs!24096 d!95552))

(declare-fun m!410207 () Bool)

(assert (=> bs!24096 m!410207))

(assert (=> start!61750 d!95552))

(declare-fun d!95558 () Bool)

(assert (=> d!95558 (= (inv!12 b2!124) (invariant!0 (currentBit!13581 b2!124) (currentByte!13586 b2!124) (size!6865 (buf!7333 b2!124))))))

(declare-fun bs!24097 () Bool)

(assert (= bs!24097 d!95558))

(assert (=> bs!24097 m!410181))

(assert (=> start!61750 d!95558))

(declare-fun d!95560 () Bool)

(assert (=> d!95560 (= (array_inv!6589 (buf!7333 thiss!872)) (bvsge (size!6865 (buf!7333 thiss!872)) #b00000000000000000000000000000000))))

(assert (=> b!276974 d!95560))

(push 1)

(assert (not d!95552))

(assert (not d!95558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

