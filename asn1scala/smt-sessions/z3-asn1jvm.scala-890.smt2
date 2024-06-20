; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25346 () Bool)

(assert start!25346)

(declare-fun b!127990 () Bool)

(declare-fun e!84870 () Bool)

(declare-datatypes ((array!5896 0))(
  ( (array!5897 (arr!3283 (Array (_ BitVec 32) (_ BitVec 8))) (size!2666 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4596 0))(
  ( (BitStream!4597 (buf!3024 array!5896) (currentByte!5772 (_ BitVec 32)) (currentBit!5767 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4596)

(declare-fun array_inv!2455 (array!5896) Bool)

(assert (=> b!127990 (= e!84870 (array_inv!2455 (buf!3024 thiss!1634)))))

(declare-fun b!127991 () Bool)

(declare-fun e!84872 () Bool)

(assert (=> b!127991 (= e!84872 (and (bvsle ((_ sign_extend 32) (size!2666 (buf!3024 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5772 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5767 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2666 (buf!3024 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5772 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5767 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!127993 () Bool)

(declare-fun res!105909 () Bool)

(assert (=> b!127993 (=> (not res!105909) (not e!84872))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!127993 (= res!105909 (invariant!0 (currentBit!5767 thiss!1634) (currentByte!5772 thiss!1634) (size!2666 (buf!3024 thiss!1634))))))

(declare-fun b!127994 () Bool)

(declare-fun res!105907 () Bool)

(assert (=> b!127994 (=> (not res!105907) (not e!84872))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!127994 (= res!105907 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2666 (buf!3024 thiss!1634))) ((_ sign_extend 32) (currentByte!5772 thiss!1634)) ((_ sign_extend 32) (currentBit!5767 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!127992 () Bool)

(declare-fun res!105908 () Bool)

(assert (=> b!127992 (=> (not res!105908) (not e!84872))))

(assert (=> b!127992 (= res!105908 (bvslt from!447 to!404))))

(declare-fun res!105910 () Bool)

(assert (=> start!25346 (=> (not res!105910) (not e!84872))))

(declare-fun arr!237 () array!5896)

(assert (=> start!25346 (= res!105910 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2666 arr!237))))))

(assert (=> start!25346 e!84872))

(assert (=> start!25346 true))

(assert (=> start!25346 (array_inv!2455 arr!237)))

(declare-fun inv!12 (BitStream!4596) Bool)

(assert (=> start!25346 (and (inv!12 thiss!1634) e!84870)))

(assert (= (and start!25346 res!105910) b!127994))

(assert (= (and b!127994 res!105907) b!127992))

(assert (= (and b!127992 res!105908) b!127993))

(assert (= (and b!127993 res!105909) b!127991))

(assert (= start!25346 b!127990))

(declare-fun m!193783 () Bool)

(assert (=> b!127990 m!193783))

(declare-fun m!193785 () Bool)

(assert (=> b!127993 m!193785))

(declare-fun m!193787 () Bool)

(assert (=> b!127994 m!193787))

(declare-fun m!193789 () Bool)

(assert (=> start!25346 m!193789))

(declare-fun m!193791 () Bool)

(assert (=> start!25346 m!193791))

(check-sat (not b!127994) (not b!127993) (not start!25346) (not b!127990))
(check-sat)
(get-model)

(declare-fun d!41390 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41390 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2666 (buf!3024 thiss!1634))) ((_ sign_extend 32) (currentByte!5772 thiss!1634)) ((_ sign_extend 32) (currentBit!5767 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2666 (buf!3024 thiss!1634))) ((_ sign_extend 32) (currentByte!5772 thiss!1634)) ((_ sign_extend 32) (currentBit!5767 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10064 () Bool)

(assert (= bs!10064 d!41390))

(declare-fun m!193803 () Bool)

(assert (=> bs!10064 m!193803))

(assert (=> b!127994 d!41390))

(declare-fun d!41392 () Bool)

(assert (=> d!41392 (= (invariant!0 (currentBit!5767 thiss!1634) (currentByte!5772 thiss!1634) (size!2666 (buf!3024 thiss!1634))) (and (bvsge (currentBit!5767 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5767 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5772 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5772 thiss!1634) (size!2666 (buf!3024 thiss!1634))) (and (= (currentBit!5767 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5772 thiss!1634) (size!2666 (buf!3024 thiss!1634)))))))))

(assert (=> b!127993 d!41392))

(declare-fun d!41394 () Bool)

(assert (=> d!41394 (= (array_inv!2455 arr!237) (bvsge (size!2666 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25346 d!41394))

(declare-fun d!41396 () Bool)

(assert (=> d!41396 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5767 thiss!1634) (currentByte!5772 thiss!1634) (size!2666 (buf!3024 thiss!1634))))))

(declare-fun bs!10065 () Bool)

(assert (= bs!10065 d!41396))

(assert (=> bs!10065 m!193785))

(assert (=> start!25346 d!41396))

(declare-fun d!41398 () Bool)

(assert (=> d!41398 (= (array_inv!2455 (buf!3024 thiss!1634)) (bvsge (size!2666 (buf!3024 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!127990 d!41398))

(check-sat (not d!41396) (not d!41390))
(check-sat)
