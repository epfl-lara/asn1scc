; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47020 () Bool)

(assert start!47020)

(declare-fun b!225009 () Bool)

(declare-fun res!188846 () Bool)

(declare-fun e!153450 () Bool)

(assert (=> b!225009 (=> (not res!188846) (not e!153450))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!225009 (= res!188846 (bvsge i!761 to!496))))

(declare-fun b!225010 () Bool)

(declare-datatypes ((array!11129 0))(
  ( (array!11130 (arr!5840 (Array (_ BitVec 32) (_ BitVec 8))) (size!4883 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8868 0))(
  ( (BitStream!8869 (buf!5427 array!11129) (currentByte!10182 (_ BitVec 32)) (currentBit!10177 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8868)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225010 (= e!153450 (not (invariant!0 (currentBit!10177 thiss!1870) (currentByte!10182 thiss!1870) (size!4883 (buf!5427 thiss!1870)))))))

(declare-fun res!188847 () Bool)

(assert (=> start!47020 (=> (not res!188847) (not e!153450))))

(declare-fun arr!308 () array!11129)

(assert (=> start!47020 (= res!188847 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4883 arr!308))))))

(assert (=> start!47020 e!153450))

(assert (=> start!47020 true))

(declare-fun array_inv!4624 (array!11129) Bool)

(assert (=> start!47020 (array_inv!4624 arr!308)))

(declare-fun e!153452 () Bool)

(declare-fun inv!12 (BitStream!8868) Bool)

(assert (=> start!47020 (and (inv!12 thiss!1870) e!153452)))

(declare-fun b!225008 () Bool)

(declare-fun res!188845 () Bool)

(assert (=> b!225008 (=> (not res!188845) (not e!153450))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225008 (= res!188845 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4883 (buf!5427 thiss!1870))) ((_ sign_extend 32) (currentByte!10182 thiss!1870)) ((_ sign_extend 32) (currentBit!10177 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225011 () Bool)

(assert (=> b!225011 (= e!153452 (array_inv!4624 (buf!5427 thiss!1870)))))

(assert (= (and start!47020 res!188847) b!225008))

(assert (= (and b!225008 res!188845) b!225009))

(assert (= (and b!225009 res!188846) b!225010))

(assert (= start!47020 b!225011))

(declare-fun m!345909 () Bool)

(assert (=> b!225010 m!345909))

(declare-fun m!345911 () Bool)

(assert (=> start!47020 m!345911))

(declare-fun m!345913 () Bool)

(assert (=> start!47020 m!345913))

(declare-fun m!345915 () Bool)

(assert (=> b!225008 m!345915))

(declare-fun m!345917 () Bool)

(assert (=> b!225011 m!345917))

(check-sat (not b!225010) (not start!47020) (not b!225011) (not b!225008))
(check-sat)
(get-model)

(declare-fun d!76358 () Bool)

(assert (=> d!76358 (= (invariant!0 (currentBit!10177 thiss!1870) (currentByte!10182 thiss!1870) (size!4883 (buf!5427 thiss!1870))) (and (bvsge (currentBit!10177 thiss!1870) #b00000000000000000000000000000000) (bvslt (currentBit!10177 thiss!1870) #b00000000000000000000000000001000) (bvsge (currentByte!10182 thiss!1870) #b00000000000000000000000000000000) (or (bvslt (currentByte!10182 thiss!1870) (size!4883 (buf!5427 thiss!1870))) (and (= (currentBit!10177 thiss!1870) #b00000000000000000000000000000000) (= (currentByte!10182 thiss!1870) (size!4883 (buf!5427 thiss!1870)))))))))

(assert (=> b!225010 d!76358))

(declare-fun d!76374 () Bool)

(assert (=> d!76374 (= (array_inv!4624 arr!308) (bvsge (size!4883 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47020 d!76374))

(declare-fun d!76380 () Bool)

(assert (=> d!76380 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10177 thiss!1870) (currentByte!10182 thiss!1870) (size!4883 (buf!5427 thiss!1870))))))

(declare-fun bs!18629 () Bool)

(assert (= bs!18629 d!76380))

(assert (=> bs!18629 m!345909))

(assert (=> start!47020 d!76380))

(declare-fun d!76384 () Bool)

(assert (=> d!76384 (= (array_inv!4624 (buf!5427 thiss!1870)) (bvsge (size!4883 (buf!5427 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225011 d!76384))

(declare-fun d!76386 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76386 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4883 (buf!5427 thiss!1870))) ((_ sign_extend 32) (currentByte!10182 thiss!1870)) ((_ sign_extend 32) (currentBit!10177 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4883 (buf!5427 thiss!1870))) ((_ sign_extend 32) (currentByte!10182 thiss!1870)) ((_ sign_extend 32) (currentBit!10177 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18630 () Bool)

(assert (= bs!18630 d!76386))

(declare-fun m!345933 () Bool)

(assert (=> bs!18630 m!345933))

(assert (=> b!225008 d!76386))

