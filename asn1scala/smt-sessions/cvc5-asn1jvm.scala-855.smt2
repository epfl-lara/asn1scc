; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24748 () Bool)

(assert start!24748)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5658 0))(
  ( (array!5659 (arr!3156 (Array (_ BitVec 32) (_ BitVec 8))) (size!2563 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5658)

(declare-datatypes ((BitStream!4450 0))(
  ( (BitStream!4451 (buf!2939 array!5658) (currentByte!5650 (_ BitVec 32)) (currentBit!5645 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4450)

(assert (=> start!24748 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2563 arr!227)) (bvsle ((_ sign_extend 32) (size!2563 (buf!2939 thiss!1614))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5650 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5645 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2563 (buf!2939 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5650 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5645 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!24748 true))

(declare-fun array_inv!2352 (array!5658) Bool)

(assert (=> start!24748 (array_inv!2352 arr!227)))

(declare-fun e!82639 () Bool)

(declare-fun inv!12 (BitStream!4450) Bool)

(assert (=> start!24748 (and (inv!12 thiss!1614) e!82639)))

(declare-fun b!125621 () Bool)

(assert (=> b!125621 (= e!82639 (array_inv!2352 (buf!2939 thiss!1614)))))

(assert (= start!24748 b!125621))

(declare-fun m!190977 () Bool)

(assert (=> start!24748 m!190977))

(declare-fun m!190979 () Bool)

(assert (=> start!24748 m!190979))

(declare-fun m!190981 () Bool)

(assert (=> b!125621 m!190981))

(push 1)

(assert (not start!24748))

(assert (not b!125621))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!40816 () Bool)

(assert (=> d!40816 (= (array_inv!2352 arr!227) (bvsge (size!2563 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24748 d!40816))

(declare-fun d!40818 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!40818 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5645 thiss!1614) (currentByte!5650 thiss!1614) (size!2563 (buf!2939 thiss!1614))))))

(declare-fun bs!9885 () Bool)

(assert (= bs!9885 d!40818))

(declare-fun m!190997 () Bool)

(assert (=> bs!9885 m!190997))

(assert (=> start!24748 d!40818))

(declare-fun d!40822 () Bool)

(assert (=> d!40822 (= (array_inv!2352 (buf!2939 thiss!1614)) (bvsge (size!2563 (buf!2939 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!125621 d!40822))

(push 1)

(assert (not d!40818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!40826 () Bool)

(assert (=> d!40826 (= (invariant!0 (currentBit!5645 thiss!1614) (currentByte!5650 thiss!1614) (size!2563 (buf!2939 thiss!1614))) (and (bvsge (currentBit!5645 thiss!1614) #b00000000000000000000000000000000) (bvslt (currentBit!5645 thiss!1614) #b00000000000000000000000000001000) (bvsge (currentByte!5650 thiss!1614) #b00000000000000000000000000000000) (or (bvslt (currentByte!5650 thiss!1614) (size!2563 (buf!2939 thiss!1614))) (and (= (currentBit!5645 thiss!1614) #b00000000000000000000000000000000) (= (currentByte!5650 thiss!1614) (size!2563 (buf!2939 thiss!1614)))))))))

(assert (=> d!40818 d!40826))

(push 1)

