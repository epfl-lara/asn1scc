; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3956 () Bool)

(assert start!3956)

(declare-fun res!15368 () Bool)

(declare-fun e!10821 () Bool)

(assert (=> start!3956 (=> (not res!15368) (not e!10821))))

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(assert (=> start!3956 (= res!15368 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!3956 e!10821))

(assert (=> start!3956 true))

(declare-datatypes ((array!1008 0))(
  ( (array!1009 (arr!858 (Array (_ BitVec 32) (_ BitVec 8))) (size!429 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!818 0))(
  ( (BitStream!819 (buf!792 array!1008) (currentByte!1964 (_ BitVec 32)) (currentBit!1959 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!818)

(declare-fun e!10820 () Bool)

(declare-fun inv!12 (BitStream!818) Bool)

(assert (=> start!3956 (and (inv!12 b!162) e!10820)))

(declare-fun b!17085 () Bool)

(declare-fun res!15367 () Bool)

(assert (=> b!17085 (=> (not res!15367) (not e!10821))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17085 (= res!15367 (validate_offset_bits!1 ((_ sign_extend 32) (size!429 (buf!792 b!162))) ((_ sign_extend 32) (currentByte!1964 b!162)) ((_ sign_extend 32) (currentBit!1959 b!162)) origOffset!1))))

(declare-fun b!17086 () Bool)

(assert (=> b!17086 (= e!10821 (and (bvsle ((_ sign_extend 32) (size!429 (buf!792 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1964 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1959 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!429 (buf!792 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!1964 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!1959 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!17087 () Bool)

(declare-fun array_inv!418 (array!1008) Bool)

(assert (=> b!17087 (= e!10820 (array_inv!418 (buf!792 b!162)))))

(assert (= (and start!3956 res!15368) b!17085))

(assert (= (and b!17085 res!15367) b!17086))

(assert (= start!3956 b!17087))

(declare-fun m!23259 () Bool)

(assert (=> start!3956 m!23259))

(declare-fun m!23261 () Bool)

(assert (=> b!17085 m!23261))

(declare-fun m!23263 () Bool)

(assert (=> b!17087 m!23263))

(push 1)

(assert (not b!17087))

(assert (not b!17085))

(assert (not start!3956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5558 () Bool)

(assert (=> d!5558 (= (array_inv!418 (buf!792 b!162)) (bvsge (size!429 (buf!792 b!162)) #b00000000000000000000000000000000))))

(assert (=> b!17087 d!5558))

(declare-fun d!5562 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5562 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!429 (buf!792 b!162))) ((_ sign_extend 32) (currentByte!1964 b!162)) ((_ sign_extend 32) (currentBit!1959 b!162)) origOffset!1) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!429 (buf!792 b!162))) ((_ sign_extend 32) (currentByte!1964 b!162)) ((_ sign_extend 32) (currentBit!1959 b!162))) origOffset!1))))

(declare-fun bs!1553 () Bool)

(assert (= bs!1553 d!5562))

(declare-fun m!23273 () Bool)

(assert (=> bs!1553 m!23273))

(assert (=> b!17085 d!5562))

(declare-fun d!5564 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5564 (= (inv!12 b!162) (invariant!0 (currentBit!1959 b!162) (currentByte!1964 b!162) (size!429 (buf!792 b!162))))))

(declare-fun bs!1554 () Bool)

(assert (= bs!1554 d!5564))

(declare-fun m!23275 () Bool)

(assert (=> bs!1554 m!23275))

(assert (=> start!3956 d!5564))

(push 1)

(assert (not d!5562))

(assert (not d!5564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

