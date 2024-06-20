; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52026 () Bool)

(assert start!52026)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-datatypes ((array!13089 0))(
  ( (array!13090 (arr!6721 (Array (_ BitVec 32) (_ BitVec 8))) (size!5734 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10390 0))(
  ( (BitStream!10391 (buf!6188 array!13089) (currentByte!11527 (_ BitVec 32)) (currentBit!11522 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10390)

(assert (=> start!52026 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!5734 (buf!6188 thiss!982))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11527 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11522 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5734 (buf!6188 thiss!982))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11527 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11522 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52026 true))

(declare-fun e!166252 () Bool)

(declare-fun inv!12 (BitStream!10390) Bool)

(assert (=> start!52026 (and (inv!12 thiss!982) e!166252)))

(declare-fun b!239807 () Bool)

(declare-fun array_inv!5475 (array!13089) Bool)

(assert (=> b!239807 (= e!166252 (array_inv!5475 (buf!6188 thiss!982)))))

(assert (= start!52026 b!239807))

(declare-fun m!362119 () Bool)

(assert (=> start!52026 m!362119))

(declare-fun m!362121 () Bool)

(assert (=> b!239807 m!362121))

(push 1)

(assert (not b!239807))

(assert (not start!52026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81134 () Bool)

(assert (=> d!81134 (= (array_inv!5475 (buf!6188 thiss!982)) (bvsge (size!5734 (buf!6188 thiss!982)) #b00000000000000000000000000000000))))

(assert (=> b!239807 d!81134))

(declare-fun d!81136 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

