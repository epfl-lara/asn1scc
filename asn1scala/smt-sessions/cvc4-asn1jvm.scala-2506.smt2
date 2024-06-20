; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63370 () Bool)

(assert start!63370)

(declare-fun lt!417975 () (_ BitVec 32))

(declare-datatypes ((array!16490 0))(
  ( (array!16491 (arr!8118 (Array (_ BitVec 32) (_ BitVec 8))) (size!7122 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12614 0))(
  ( (BitStream!12615 (buf!7368 array!16490) (currentByte!13643 (_ BitVec 32)) (currentBit!13638 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12614)

(assert (=> start!63370 (= lt!417975 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13643 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13638 thiss!1939)))))

(assert (=> start!63370 (and (not (= #b00000000000000000000000000000000 (bvand lt!417975 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000010000 lt!417975) #b10000000000000000000000000000000))))))

(declare-fun e!202556 () Bool)

(declare-fun inv!12 (BitStream!12614) Bool)

(assert (=> start!63370 (and (inv!12 thiss!1939) e!202556)))

(declare-fun b!283638 () Bool)

(declare-fun array_inv!6815 (array!16490) Bool)

(assert (=> b!283638 (= e!202556 (array_inv!6815 (buf!7368 thiss!1939)))))

(assert (= start!63370 b!283638))

(declare-fun m!416697 () Bool)

(assert (=> start!63370 m!416697))

(declare-fun m!416699 () Bool)

(assert (=> b!283638 m!416699))

(push 1)

(assert (not b!283638))

(assert (not start!63370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97360 () Bool)

(assert (=> d!97360 (= (array_inv!6815 (buf!7368 thiss!1939)) (bvsge (size!7122 (buf!7368 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283638 d!97360))

(declare-fun d!97362 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97362 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13638 thiss!1939) (currentByte!13643 thiss!1939) (size!7122 (buf!7368 thiss!1939))))))

(declare-fun bs!24578 () Bool)

(assert (= bs!24578 d!97362))

(declare-fun m!416705 () Bool)

(assert (=> bs!24578 m!416705))

(assert (=> start!63370 d!97362))

(push 1)

(assert (not d!97362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

