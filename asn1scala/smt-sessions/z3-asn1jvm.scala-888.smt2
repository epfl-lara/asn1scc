; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25326 () Bool)

(assert start!25326)

(declare-fun res!105847 () Bool)

(declare-fun e!84799 () Bool)

(assert (=> start!25326 (=> (not res!105847) (not e!84799))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5883 0))(
  ( (array!5884 (arr!3277 (Array (_ BitVec 32) (_ BitVec 8))) (size!2660 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5883)

(declare-datatypes ((BitStream!4584 0))(
  ( (BitStream!4585 (buf!3018 array!5883) (currentByte!5764 (_ BitVec 32)) (currentBit!5759 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4584)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25326 (= res!105847 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2660 arr!237)) (bvsle ((_ sign_extend 32) (size!2660 (buf!3018 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5764 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5759 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2660 (buf!3018 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5764 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5759 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!25326 e!84799))

(assert (=> start!25326 true))

(declare-fun array_inv!2449 (array!5883) Bool)

(assert (=> start!25326 (array_inv!2449 arr!237)))

(declare-fun e!84797 () Bool)

(declare-fun inv!12 (BitStream!4584) Bool)

(assert (=> start!25326 (and (inv!12 thiss!1634) e!84797)))

(declare-fun b!127912 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127912 (= e!84799 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5759 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5764 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2660 (buf!3018 thiss!1634)))))))))

(declare-fun b!127913 () Bool)

(assert (=> b!127913 (= e!84797 (array_inv!2449 (buf!3018 thiss!1634)))))

(assert (= (and start!25326 res!105847) b!127912))

(assert (= start!25326 b!127913))

(declare-fun m!193725 () Bool)

(assert (=> start!25326 m!193725))

(declare-fun m!193727 () Bool)

(assert (=> start!25326 m!193727))

(declare-fun m!193729 () Bool)

(assert (=> b!127912 m!193729))

(declare-fun m!193731 () Bool)

(assert (=> b!127913 m!193731))

(check-sat (not b!127913) (not start!25326) (not b!127912))
(check-sat)
(get-model)

(declare-fun d!41376 () Bool)

(assert (=> d!41376 (= (array_inv!2449 (buf!3018 thiss!1634)) (bvsge (size!2660 (buf!3018 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!127913 d!41376))

(declare-fun d!41378 () Bool)

(assert (=> d!41378 (= (array_inv!2449 arr!237) (bvsge (size!2660 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25326 d!41378))

(declare-fun d!41380 () Bool)

(assert (=> d!41380 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5759 thiss!1634) (currentByte!5764 thiss!1634) (size!2660 (buf!3018 thiss!1634))))))

(declare-fun bs!10057 () Bool)

(assert (= bs!10057 d!41380))

(declare-fun m!193741 () Bool)

(assert (=> bs!10057 m!193741))

(assert (=> start!25326 d!41380))

(declare-fun d!41382 () Bool)

(assert (=> d!41382 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5759 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5764 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2660 (buf!3018 thiss!1634))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5759 thiss!1634))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5759 thiss!1634))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5764 thiss!1634))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5764 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2660 (buf!3018 thiss!1634))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5759 thiss!1634))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5764 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2660 (buf!3018 thiss!1634)))))))))))

(assert (=> b!127912 d!41382))

(check-sat (not d!41380))
(check-sat)
