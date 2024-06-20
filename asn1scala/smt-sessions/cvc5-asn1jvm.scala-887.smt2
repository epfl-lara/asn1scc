; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25308 () Bool)

(assert start!25308)

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5873 0))(
  ( (array!5874 (arr!3273 (Array (_ BitVec 32) (_ BitVec 8))) (size!2656 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5873)

(declare-datatypes ((BitStream!4576 0))(
  ( (BitStream!4577 (buf!3014 array!5873) (currentByte!5759 (_ BitVec 32)) (currentBit!5754 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4576)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25308 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2656 arr!237)) (bvsle ((_ sign_extend 32) (size!2656 (buf!3014 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5759 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5754 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2656 (buf!3014 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5759 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5754 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!25308 true))

(declare-fun array_inv!2445 (array!5873) Bool)

(assert (=> start!25308 (array_inv!2445 arr!237)))

(declare-fun e!84757 () Bool)

(declare-fun inv!12 (BitStream!4576) Bool)

(assert (=> start!25308 (and (inv!12 thiss!1634) e!84757)))

(declare-fun b!127895 () Bool)

(assert (=> b!127895 (= e!84757 (array_inv!2445 (buf!3014 thiss!1634)))))

(assert (= start!25308 b!127895))

(declare-fun m!193695 () Bool)

(assert (=> start!25308 m!193695))

(declare-fun m!193697 () Bool)

(assert (=> start!25308 m!193697))

(declare-fun m!193699 () Bool)

(assert (=> b!127895 m!193699))

(push 1)

(assert (not b!127895))

(assert (not start!25308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41368 () Bool)

(assert (=> d!41368 (= (array_inv!2445 (buf!3014 thiss!1634)) (bvsge (size!2656 (buf!3014 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!127895 d!41368))

(declare-fun d!41370 () Bool)

(assert (=> d!41370 (= (array_inv!2445 arr!237) (bvsge (size!2656 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25308 d!41370))

(declare-fun d!41372 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!41372 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5754 thiss!1634) (currentByte!5759 thiss!1634) (size!2656 (buf!3014 thiss!1634))))))

(declare-fun bs!10053 () Bool)

(assert (= bs!10053 d!41372))

