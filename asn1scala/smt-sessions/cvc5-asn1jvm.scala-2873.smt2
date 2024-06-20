; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68788 () Bool)

(assert start!68788)

(declare-fun res!254623 () Bool)

(declare-fun e!223125 () Bool)

(assert (=> start!68788 (=> (not res!254623) (not e!223125))))

(declare-fun nBits!480 () (_ BitVec 64))

(declare-datatypes ((array!18904 0))(
  ( (array!18905 (arr!9286 (Array (_ BitVec 32) (_ BitVec 8))) (size!8203 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13516 0))(
  ( (BitStream!13517 (buf!7819 array!18904) (currentByte!14384 (_ BitVec 32)) (currentBit!14379 (_ BitVec 32))) )
))
(declare-fun bitStream!19 () BitStream!13516)

(assert (=> start!68788 (= res!254623 (and (bvsge nBits!480 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle ((_ sign_extend 32) (size!8203 (buf!7819 bitStream!19))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14384 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14379 bitStream!19)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8203 (buf!7819 bitStream!19))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14384 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14379 bitStream!19)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!68788 e!223125))

(assert (=> start!68788 true))

(declare-fun e!223126 () Bool)

(declare-fun inv!12 (BitStream!13516) Bool)

(assert (=> start!68788 (and (inv!12 bitStream!19) e!223126)))

(declare-fun b!310583 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!310583 (= e!223125 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14379 bitStream!19))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14384 bitStream!19))) ((_ extract 31 0) ((_ sign_extend 32) (size!8203 (buf!7819 bitStream!19)))))))))

(declare-fun b!310584 () Bool)

(declare-fun array_inv!7758 (array!18904) Bool)

(assert (=> b!310584 (= e!223126 (array_inv!7758 (buf!7819 bitStream!19)))))

(assert (= (and start!68788 res!254623) b!310583))

(assert (= start!68788 b!310584))

(declare-fun m!448377 () Bool)

(assert (=> start!68788 m!448377))

(declare-fun m!448379 () Bool)

(assert (=> b!310583 m!448379))

(declare-fun m!448381 () Bool)

(assert (=> b!310584 m!448381))

(push 1)

(assert (not start!68788))

(assert (not b!310583))

(assert (not b!310584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

