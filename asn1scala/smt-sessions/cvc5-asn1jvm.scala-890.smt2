; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25344 () Bool)

(assert start!25344)

(declare-fun b!127975 () Bool)

(declare-fun e!84859 () Bool)

(declare-datatypes ((array!5894 0))(
  ( (array!5895 (arr!3282 (Array (_ BitVec 32) (_ BitVec 8))) (size!2665 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4594 0))(
  ( (BitStream!4595 (buf!3023 array!5894) (currentByte!5771 (_ BitVec 32)) (currentBit!5766 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4594)

(declare-fun array_inv!2454 (array!5894) Bool)

(assert (=> b!127975 (= e!84859 (array_inv!2454 (buf!3023 thiss!1634)))))

(declare-fun res!105897 () Bool)

(declare-fun e!84860 () Bool)

(assert (=> start!25344 (=> (not res!105897) (not e!84860))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!5894)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25344 (= res!105897 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2665 arr!237))))))

(assert (=> start!25344 e!84860))

(assert (=> start!25344 true))

(assert (=> start!25344 (array_inv!2454 arr!237)))

(declare-fun inv!12 (BitStream!4594) Bool)

(assert (=> start!25344 (and (inv!12 thiss!1634) e!84859)))

(declare-fun b!127976 () Bool)

(declare-fun res!105896 () Bool)

(assert (=> b!127976 (=> (not res!105896) (not e!84860))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127976 (= res!105896 (invariant!0 (currentBit!5766 thiss!1634) (currentByte!5771 thiss!1634) (size!2665 (buf!3023 thiss!1634))))))

(declare-fun b!127977 () Bool)

(declare-fun res!105895 () Bool)

(assert (=> b!127977 (=> (not res!105895) (not e!84860))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127977 (= res!105895 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2665 (buf!3023 thiss!1634))) ((_ sign_extend 32) (currentByte!5771 thiss!1634)) ((_ sign_extend 32) (currentBit!5766 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!127978 () Bool)

(assert (=> b!127978 (= e!84860 (and (bvsle ((_ sign_extend 32) (size!2665 (buf!3023 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5771 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5766 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2665 (buf!3023 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5771 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5766 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127979 () Bool)

(declare-fun res!105898 () Bool)

(assert (=> b!127979 (=> (not res!105898) (not e!84860))))

(assert (=> b!127979 (= res!105898 (bvslt from!447 to!404))))

(assert (= (and start!25344 res!105897) b!127977))

(assert (= (and b!127977 res!105895) b!127979))

(assert (= (and b!127979 res!105898) b!127976))

(assert (= (and b!127976 res!105896) b!127978))

(assert (= start!25344 b!127975))

(declare-fun m!193773 () Bool)

(assert (=> b!127975 m!193773))

(declare-fun m!193775 () Bool)

(assert (=> start!25344 m!193775))

(declare-fun m!193777 () Bool)

(assert (=> start!25344 m!193777))

(declare-fun m!193779 () Bool)

(assert (=> b!127976 m!193779))

(declare-fun m!193781 () Bool)

(assert (=> b!127977 m!193781))

(push 1)

(assert (not b!127977))

(assert (not start!25344))

(assert (not b!127975))

(assert (not b!127976))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41400 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41400 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2665 (buf!3023 thiss!1634))) ((_ sign_extend 32) (currentByte!5771 thiss!1634)) ((_ sign_extend 32) (currentBit!5766 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2665 (buf!3023 thiss!1634))) ((_ sign_extend 32) (currentByte!5771 thiss!1634)) ((_ sign_extend 32) (currentBit!5766 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10066 () Bool)

(assert (= bs!10066 d!41400))

(declare-fun m!193805 () Bool)

(assert (=> bs!10066 m!193805))

(assert (=> b!127977 d!41400))

(declare-fun d!41402 () Bool)

(assert (=> d!41402 (= (array_inv!2454 arr!237) (bvsge (size!2665 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25344 d!41402))

(declare-fun d!41404 () Bool)

