; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68766 () Bool)

(assert start!68766)

(declare-fun nBits!480 () (_ BitVec 64))

(declare-datatypes ((array!18895 0))(
  ( (array!18896 (arr!9283 (Array (_ BitVec 32) (_ BitVec 8))) (size!8200 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13510 0))(
  ( (BitStream!13511 (buf!7816 array!18895) (currentByte!14379 (_ BitVec 32)) (currentBit!14374 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13510)

(assert (=> start!68766 (and (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!8200 (buf!7816 bitStream!19))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14379 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14374 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8200 (buf!7816 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14379 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14374 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!68766 true))

(declare-fun e!223105 () Bool)

(declare-fun inv!12 (BitStream!13510) Bool)

(assert (=> start!68766 (and (inv!12 bitStream!19) e!223105)))

(declare-fun b!310572 () Bool)

(declare-fun array_inv!7755 (array!18895) Bool)

(assert (=> b!310572 (= e!223105 (array_inv!7755 (buf!7816 bitStream!19)))))

(assert (= start!68766 b!310572))

(declare-fun m!448359 () Bool)

(assert (=> start!68766 m!448359))

(declare-fun m!448361 () Bool)

(assert (=> b!310572 m!448361))

(push 1)

(assert (not start!68766))

(assert (not b!310572))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!102782 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!102782 (= (inv!12 bitStream!19) (invariant!0 (currentBit!14374 bitStream!19) (currentByte!14379 bitStream!19) (size!8200 (buf!7816 bitStream!19))))))

(declare-fun bs!26595 () Bool)

(assert (= bs!26595 d!102782))

(declare-fun m!448373 () Bool)

(assert (=> bs!26595 m!448373))

(assert (=> start!68766 d!102782))

(declare-fun d!102784 () Bool)

(assert (=> d!102784 (= (array_inv!7755 (buf!7816 bitStream!19)) (bvsge (size!8200 (buf!7816 bitStream!19)) #b00000000000000000000000000000000))))

(assert (=> b!310572 d!102784))

(push 1)

(assert (not d!102782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

