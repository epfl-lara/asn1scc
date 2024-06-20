; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25310 () Bool)

(assert start!25310)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5875 0))(
  ( (array!5876 (arr!3274 (Array (_ BitVec 32) (_ BitVec 8))) (size!2657 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5875)

(declare-datatypes ((BitStream!4578 0))(
  ( (BitStream!4579 (buf!3015 array!5875) (currentByte!5760 (_ BitVec 32)) (currentBit!5755 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4578)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25310 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2657 arr!237)) (bvsle ((_ sign_extend 32) (size!2657 (buf!3015 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5760 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5755 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2657 (buf!3015 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5760 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5755 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!25310 true))

(declare-fun array_inv!2446 (array!5875) Bool)

(assert (=> start!25310 (array_inv!2446 arr!237)))

(declare-fun e!84766 () Bool)

(declare-fun inv!12 (BitStream!4578) Bool)

(assert (=> start!25310 (and (inv!12 thiss!1634) e!84766)))

(declare-fun b!127898 () Bool)

(assert (=> b!127898 (= e!84766 (array_inv!2446 (buf!3015 thiss!1634)))))

(assert (= start!25310 b!127898))

(declare-fun m!193701 () Bool)

(assert (=> start!25310 m!193701))

(declare-fun m!193703 () Bool)

(assert (=> start!25310 m!193703))

(declare-fun m!193705 () Bool)

(assert (=> b!127898 m!193705))

(check-sat (not start!25310) (not b!127898))
(check-sat)
(get-model)

(declare-fun d!41360 () Bool)

(assert (=> d!41360 (= (array_inv!2446 arr!237) (bvsge (size!2657 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25310 d!41360))

(declare-fun d!41362 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!41362 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5755 thiss!1634) (currentByte!5760 thiss!1634) (size!2657 (buf!3015 thiss!1634))))))

(declare-fun bs!10052 () Bool)

(assert (= bs!10052 d!41362))

(declare-fun m!193713 () Bool)

(assert (=> bs!10052 m!193713))

(assert (=> start!25310 d!41362))

(declare-fun d!41364 () Bool)

(assert (=> d!41364 (= (array_inv!2446 (buf!3015 thiss!1634)) (bvsge (size!2657 (buf!3015 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!127898 d!41364))

(check-sat (not d!41362))
(check-sat)
(get-model)

(declare-fun d!41366 () Bool)

(assert (=> d!41366 (= (invariant!0 (currentBit!5755 thiss!1634) (currentByte!5760 thiss!1634) (size!2657 (buf!3015 thiss!1634))) (and (bvsge (currentBit!5755 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5755 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5760 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5760 thiss!1634) (size!2657 (buf!3015 thiss!1634))) (and (= (currentBit!5755 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5760 thiss!1634) (size!2657 (buf!3015 thiss!1634)))))))))

(assert (=> d!41362 d!41366))

(check-sat)
