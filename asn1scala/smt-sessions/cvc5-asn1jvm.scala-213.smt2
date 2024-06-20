; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4270 () Bool)

(assert start!4270)

(declare-fun res!15526 () Bool)

(declare-fun e!11295 () Bool)

(assert (=> start!4270 (=> (not res!15526) (not e!11295))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4270 (= res!15526 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4270 e!11295))

(assert (=> start!4270 true))

(declare-datatypes ((array!1169 0))(
  ( (array!1170 (arr!925 (Array (_ BitVec 32) (_ BitVec 8))) (size!496 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!862 0))(
  ( (BitStream!863 (buf!814 array!1169) (currentByte!2023 (_ BitVec 32)) (currentBit!2018 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!862)

(declare-fun e!11293 () Bool)

(declare-fun inv!12 (BitStream!862) Bool)

(assert (=> start!4270 (and (inv!12 thiss!1917) e!11293)))

(declare-fun b!17595 () Bool)

(declare-fun res!15527 () Bool)

(assert (=> b!17595 (=> (not res!15527) (not e!11295))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17595 (= res!15527 (validate_offset_bits!1 ((_ sign_extend 32) (size!496 (buf!814 thiss!1917))) ((_ sign_extend 32) (currentByte!2023 thiss!1917)) ((_ sign_extend 32) (currentBit!2018 thiss!1917)) nBits!604))))

(declare-fun b!17596 () Bool)

(declare-datatypes ((tuple2!2054 0))(
  ( (tuple2!2055 (_1!1091 array!1169) (_2!1091 BitStream!862)) )
))
(declare-fun lt!25369 () tuple2!2054)

(assert (=> b!17596 (= e!11295 (not (or (not (= (currentByte!2023 thiss!1917) (size!496 (buf!814 (_2!1091 lt!25369))))) (= (currentBit!2018 (_2!1091 lt!25369)) #b00000000000000000000000000000000))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17596 (invariant!0 (currentBit!2018 (_2!1091 lt!25369)) (currentByte!2023 (_2!1091 lt!25369)) (size!496 (buf!814 (_2!1091 lt!25369))))))

(declare-fun readBits!0 (BitStream!862 (_ BitVec 64)) tuple2!2054)

(assert (=> b!17596 (= lt!25369 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!17597 () Bool)

(declare-fun array_inv!466 (array!1169) Bool)

(assert (=> b!17597 (= e!11293 (array_inv!466 (buf!814 thiss!1917)))))

(assert (= (and start!4270 res!15526) b!17595))

(assert (= (and b!17595 res!15527) b!17596))

(assert (= start!4270 b!17597))

(declare-fun m!23917 () Bool)

(assert (=> start!4270 m!23917))

(declare-fun m!23919 () Bool)

(assert (=> b!17595 m!23919))

(declare-fun m!23921 () Bool)

(assert (=> b!17596 m!23921))

(declare-fun m!23923 () Bool)

(assert (=> b!17596 m!23923))

(declare-fun m!23925 () Bool)

(assert (=> b!17597 m!23925))

(push 1)

(assert (not b!17595))

(assert (not start!4270))

(assert (not b!17597))

(assert (not b!17596))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5790 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5790 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!496 (buf!814 thiss!1917))) ((_ sign_extend 32) (currentByte!2023 thiss!1917)) ((_ sign_extend 32) (currentBit!2018 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!496 (buf!814 thiss!1917))) ((_ sign_extend 32) (currentByte!2023 thiss!1917)) ((_ sign_extend 32) (currentBit!2018 thiss!1917))) nBits!604))))

(declare-fun bs!1656 () Bool)

(assert (= bs!1656 d!5790))

(declare-fun m!23947 () Bool)

(assert (=> bs!1656 m!23947))

(assert (=> b!17595 d!5790))

(declare-fun d!5794 () Bool)

(assert (=> d!5794 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2018 thiss!1917) (currentByte!2023 thiss!1917) (size!496 (buf!814 thiss!1917))))))

(declare-fun bs!1658 () Bool)

(assert (= bs!1658 d!5794))

(declare-fun m!23951 () Bool)

(assert (=> bs!1658 m!23951))

(assert (=> start!4270 d!5794))

(declare-fun d!5800 () Bool)

(assert (=> d!5800 (= (array_inv!466 (buf!814 thiss!1917)) (bvsge (size!496 (buf!814 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17597 d!5800))

(declare-fun d!5802 () Bool)

(assert (=> d!5802 (= (invariant!0 (currentBit!2018 (_2!1091 lt!25369)) (currentByte!2023 (_2!1091 lt!25369)) (size!496 (buf!814 (_2!1091 lt!25369)))) (and (bvsge (currentBit!2018 (_2!1091 lt!25369)) #b00000000000000000000000000000000) (bvslt (currentBit!2018 (_2!1091 lt!25369)) #b00000000000000000000000000001000) (bvsge (currentByte!2023 (_2!1091 lt!25369)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2023 (_2!1091 lt!25369)) (size!496 (buf!814 (_2!1091 lt!25369)))) (and (= (currentBit!2018 (_2!1091 lt!25369)) #b00000000000000000000000000000000) (= (currentByte!2023 (_2!1091 lt!25369)) (size!496 (buf!814 (_2!1091 lt!25369))))))))))

(assert (=> b!17596 d!5802))

(declare-fun e!11322 () Bool)

(declare-fun b!17656 () Bool)

(declare-fun lt!25449 () tuple2!2054)

(declare-datatypes ((List!192 0))(
  ( (Nil!189) (Cons!188 (h!307 Bool) (t!942 List!192)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!862 array!1169 (_ BitVec 64) (_ BitVec 64)) List!192)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!862 BitStream!862 (_ BitVec 64)) List!192)

(assert (=> b!17656 (= e!11322 (= (byteArrayBitContentToList!0 (_2!1091 lt!25449) (_1!1091 lt!25449) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1091 lt!25449) thiss!1917 nBits!604)))))

(declare-fun b!17657 () Bool)

(declare-fun res!15583 () Bool)

(assert (=> b!17657 (=> (not res!15583) (not e!11322))))

(declare-fun lt!25455 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!17657 (= res!15583 (= (bvadd lt!25455 nBits!604) (bitIndex!0 (size!496 (buf!814 (_2!1091 lt!25449))) (currentByte!2023 (_2!1091 lt!25449)) (currentBit!2018 (_2!1091 lt!25449)))))))

(assert (=> b!17657 (or (not (= (bvand lt!25455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!25455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!25455 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17657 (= lt!25455 (bitIndex!0 (size!496 (buf!814 thiss!1917)) (currentByte!2023 thiss!1917) (currentBit!2018 thiss!1917)))))

(declare-fun b!17658 () Bool)

(declare-fun res!15580 () Bool)

(assert (=> b!17658 (=> (not res!15580) (not e!11322))))

(assert (=> b!17658 (= res!15580 (invariant!0 (currentBit!2018 (_2!1091 lt!25449)) (currentByte!2023 (_2!1091 lt!25449)) (size!496 (buf!814 (_2!1091 lt!25449)))))))

(declare-fun b!17659 () Bool)

(declare-fun res!15584 () Bool)

(assert (=> b!17659 (=> (not res!15584) (not e!11322))))

(declare-fun lt!25452 () (_ BitVec 64))

(assert (=> b!17659 (= res!15584 (= (size!496 (_1!1091 lt!25449)) ((_ extract 31 0) lt!25452)))))

(assert (=> b!17659 (and (bvslt lt!25452 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!25452 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!25447 () (_ BitVec 64))

(declare-fun lt!25453 () (_ BitVec 64))

(assert (=> b!17659 (= lt!25452 (bvsdiv lt!25447 lt!25453))))

(assert (=> b!17659 (and (not (= lt!25453 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!25447 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!25453 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!17659 (= lt!25453 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!25451 () (_ BitVec 64))

(declare-fun lt!25450 () (_ BitVec 64))

(assert (=> b!17659 (= lt!25447 (bvsub lt!25451 lt!25450))))

(assert (=> b!17659 (or (= (bvand lt!25451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25450 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!25451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!25451 lt!25450) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17659 (= lt!25450 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!25454 () (_ BitVec 64))

(assert (=> b!17659 (= lt!25451 (bvadd nBits!604 lt!25454))))

(assert (=> b!17659 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25454 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!25454) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17659 (= lt!25454 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun d!5808 () Bool)

(assert (=> d!5808 e!11322))

(declare-fun res!15582 () Bool)

(assert (=> d!5808 (=> (not res!15582) (not e!11322))))

(assert (=> d!5808 (= res!15582 (= (buf!814 (_2!1091 lt!25449)) (buf!814 thiss!1917)))))

(declare-datatypes ((Unit!1580 0))(
  ( (Unit!1581) )
))
(declare-datatypes ((tuple3!118 0))(
  ( (tuple3!119 (_1!1095 Unit!1580) (_2!1095 BitStream!862) (_3!65 array!1169)) )
))
(declare-fun lt!25456 () tuple3!118)

(assert (=> d!5808 (= lt!25449 (tuple2!2055 (_3!65 lt!25456) (_2!1095 lt!25456)))))

(declare-fun readBitsLoop!0 (BitStream!862 (_ BitVec 64) array!1169 (_ BitVec 64) (_ BitVec 64)) tuple3!118)

(assert (=> d!5808 (= lt!25456 (readBitsLoop!0 thiss!1917 nBits!604 (array!1170 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5808 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5808 (= (readBits!0 thiss!1917 nBits!604) lt!25449)))

(declare-fun b!17660 () Bool)

(declare-fun res!15581 () Bool)

(assert (=> b!17660 (=> (not res!15581) (not e!11322))))

(assert (=> b!17660 (= res!15581 (bvsle (currentByte!2023 thiss!1917) (currentByte!2023 (_2!1091 lt!25449))))))

(assert (= (and d!5808 res!15582) b!17657))

(assert (= (and b!17657 res!15583) b!17658))

(assert (= (and b!17658 res!15580) b!17659))

(assert (= (and b!17659 res!15584) b!17660))

(assert (= (and b!17660 res!15581) b!17656))

(declare-fun m!23955 () Bool)

(assert (=> b!17656 m!23955))

(declare-fun m!23961 () Bool)

(assert (=> b!17656 m!23961))

(declare-fun m!23967 () Bool)

(assert (=> b!17657 m!23967))

(declare-fun m!23973 () Bool)

(assert (=> b!17657 m!23973))

(declare-fun m!23978 () Bool)

(assert (=> b!17658 m!23978))

(declare-fun m!23987 () Bool)

(assert (=> d!5808 m!23987))

(assert (=> b!17596 d!5808))

(push 1)

(assert (not b!17658))

(assert (not d!5808))

(assert (not b!17656))

(assert (not d!5790))

(assert (not b!17657))

(assert (not d!5794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

