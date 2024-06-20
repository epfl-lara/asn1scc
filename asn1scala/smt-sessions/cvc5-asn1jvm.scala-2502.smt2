; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63306 () Bool)

(assert start!63306)

(declare-fun res!235049 () Bool)

(declare-fun e!202483 () Bool)

(assert (=> start!63306 (=> (not res!235049) (not e!202483))))

(declare-datatypes ((array!16462 0))(
  ( (array!16463 (arr!8107 (Array (_ BitVec 32) (_ BitVec 8))) (size!7111 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12592 0))(
  ( (BitStream!12593 (buf!7357 array!16462) (currentByte!13626 (_ BitVec 32)) (currentBit!13621 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12592)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63306 (= res!235049 (validate_offset_bits!1 ((_ sign_extend 32) (size!7111 (buf!7357 thiss!1939))) ((_ sign_extend 32) (currentByte!13626 thiss!1939)) ((_ sign_extend 32) (currentBit!13621 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13626 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13621 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63306 e!202483))

(declare-fun e!202484 () Bool)

(declare-fun inv!12 (BitStream!12592) Bool)

(assert (=> start!63306 (and (inv!12 thiss!1939) e!202484)))

(declare-fun b!283598 () Bool)

(assert (=> b!283598 (= e!202483 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!7111 (buf!7357 thiss!1939))) ((_ sign_extend 32) (currentByte!13626 thiss!1939)) ((_ sign_extend 32) (currentBit!13621 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13621 thiss!1939)) #b00000000000000000000000000000111)))))))

(declare-fun b!283599 () Bool)

(declare-fun array_inv!6804 (array!16462) Bool)

(assert (=> b!283599 (= e!202484 (array_inv!6804 (buf!7357 thiss!1939)))))

(assert (= (and start!63306 res!235049) b!283598))

(assert (= start!63306 b!283599))

(declare-fun m!416623 () Bool)

(assert (=> start!63306 m!416623))

(declare-fun m!416625 () Bool)

(assert (=> start!63306 m!416625))

(declare-fun m!416627 () Bool)

(assert (=> b!283598 m!416627))

(declare-fun m!416629 () Bool)

(assert (=> b!283599 m!416629))

(push 1)

(assert (not b!283598))

(assert (not b!283599))

(assert (not start!63306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97306 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97306 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7111 (buf!7357 thiss!1939))) ((_ sign_extend 32) (currentByte!13626 thiss!1939)) ((_ sign_extend 32) (currentBit!13621 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13621 thiss!1939)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7111 (buf!7357 thiss!1939))) ((_ sign_extend 32) (currentByte!13626 thiss!1939)) ((_ sign_extend 32) (currentBit!13621 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13621 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun bs!24554 () Bool)

(assert (= bs!24554 d!97306))

(declare-fun m!416649 () Bool)

(assert (=> bs!24554 m!416649))

(assert (=> b!283598 d!97306))

(declare-fun d!97310 () Bool)

(assert (=> d!97310 (= (array_inv!6804 (buf!7357 thiss!1939)) (bvsge (size!7111 (buf!7357 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283599 d!97310))

(declare-fun d!97316 () Bool)

(assert (=> d!97316 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7111 (buf!7357 thiss!1939))) ((_ sign_extend 32) (currentByte!13626 thiss!1939)) ((_ sign_extend 32) (currentBit!13621 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13626 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13621 thiss!1939))) #b00000000000000000000000000001111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7111 (buf!7357 thiss!1939))) ((_ sign_extend 32) (currentByte!13626 thiss!1939)) ((_ sign_extend 32) (currentBit!13621 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13626 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13621 thiss!1939))) #b00000000000000000000000000001111))))))

(declare-fun bs!24557 () Bool)

(assert (= bs!24557 d!97316))

(assert (=> bs!24557 m!416649))

(assert (=> start!63306 d!97316))

(declare-fun d!97318 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97318 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13621 thiss!1939) (currentByte!13626 thiss!1939) (size!7111 (buf!7357 thiss!1939))))))

(declare-fun bs!24560 () Bool)

(assert (= bs!24560 d!97318))

(declare-fun m!416657 () Bool)

(assert (=> bs!24560 m!416657))

(assert (=> start!63306 d!97318))

(push 1)

(assert (not d!97316))

(assert (not d!97318))

(assert (not d!97306))

(check-sat)

(pop 1)

