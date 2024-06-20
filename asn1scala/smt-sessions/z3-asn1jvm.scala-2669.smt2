; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65382 () Bool)

(assert start!65382)

(declare-fun res!242275 () Bool)

(declare-fun e!209532 () Bool)

(assert (=> start!65382 (=> (not res!242275) (not e!209532))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17530 0))(
  ( (array!17531 (arr!8624 (Array (_ BitVec 32) (_ BitVec 8))) (size!7598 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17530)

(assert (=> start!65382 (= res!242275 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7598 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65382 e!209532))

(declare-datatypes ((BitStream!13200 0))(
  ( (BitStream!13201 (buf!7661 array!17530) (currentByte!14125 (_ BitVec 32)) (currentBit!14120 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13200)

(declare-fun e!209530 () Bool)

(declare-fun inv!12 (BitStream!13200) Bool)

(assert (=> start!65382 (and (inv!12 thiss!1728) e!209530)))

(assert (=> start!65382 true))

(declare-fun array_inv!7210 (array!17530) Bool)

(assert (=> start!65382 (array_inv!7210 arr!273)))

(declare-fun b!293394 () Bool)

(declare-fun res!242274 () Bool)

(assert (=> b!293394 (=> (not res!242274) (not e!209532))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293394 (= res!242274 (validate_offset_bits!1 ((_ sign_extend 32) (size!7598 (buf!7661 thiss!1728))) ((_ sign_extend 32) (currentByte!14125 thiss!1728)) ((_ sign_extend 32) (currentBit!14120 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293396 () Bool)

(declare-datatypes ((tuple2!23026 0))(
  ( (tuple2!23027 (_1!12818 Bool) (_2!12818 BitStream!13200)) )
))
(declare-fun lt!425280 () tuple2!23026)

(assert (=> b!293396 (= e!209532 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (not (= (size!7598 (buf!7661 thiss!1728)) (size!7598 (buf!7661 (_2!12818 lt!425280)))))))))

(declare-fun readBit!0 (BitStream!13200) tuple2!23026)

(assert (=> b!293396 (= lt!425280 (readBit!0 thiss!1728))))

(declare-fun b!293397 () Bool)

(assert (=> b!293397 (= e!209530 (array_inv!7210 (buf!7661 thiss!1728)))))

(declare-fun b!293395 () Bool)

(declare-fun res!242276 () Bool)

(assert (=> b!293395 (=> (not res!242276) (not e!209532))))

(assert (=> b!293395 (= res!242276 (bvslt from!505 to!474))))

(assert (= (and start!65382 res!242275) b!293394))

(assert (= (and b!293394 res!242274) b!293395))

(assert (= (and b!293395 res!242276) b!293396))

(assert (= start!65382 b!293397))

(declare-fun m!428915 () Bool)

(assert (=> start!65382 m!428915))

(declare-fun m!428917 () Bool)

(assert (=> start!65382 m!428917))

(declare-fun m!428919 () Bool)

(assert (=> b!293394 m!428919))

(declare-fun m!428921 () Bool)

(assert (=> b!293396 m!428921))

(declare-fun m!428923 () Bool)

(assert (=> b!293397 m!428923))

(check-sat (not b!293397) (not b!293396) (not b!293394) (not start!65382))
(check-sat)
(get-model)

(declare-fun d!99058 () Bool)

(assert (=> d!99058 (= (array_inv!7210 (buf!7661 thiss!1728)) (bvsge (size!7598 (buf!7661 thiss!1728)) #b00000000000000000000000000000000))))

(assert (=> b!293397 d!99058))

(declare-fun d!99060 () Bool)

(declare-fun e!209551 () Bool)

(assert (=> d!99060 e!209551))

(declare-fun res!242288 () Bool)

(assert (=> d!99060 (=> (not res!242288) (not e!209551))))

(declare-datatypes ((Unit!20393 0))(
  ( (Unit!20394) )
))
(declare-datatypes ((tuple2!23030 0))(
  ( (tuple2!23031 (_1!12820 Unit!20393) (_2!12820 BitStream!13200)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13200) tuple2!23030)

(assert (=> d!99060 (= res!242288 (= (buf!7661 (_2!12820 (increaseBitIndex!0 thiss!1728))) (buf!7661 thiss!1728)))))

(declare-fun lt!425302 () Bool)

(assert (=> d!99060 (= lt!425302 (not (= (bvand ((_ sign_extend 24) (select (arr!8624 (buf!7661 thiss!1728)) (currentByte!14125 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14120 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425299 () tuple2!23026)

(assert (=> d!99060 (= lt!425299 (tuple2!23027 (not (= (bvand ((_ sign_extend 24) (select (arr!8624 (buf!7661 thiss!1728)) (currentByte!14125 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14120 thiss!1728)))) #b00000000000000000000000000000000)) (_2!12820 (increaseBitIndex!0 thiss!1728))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!99060 (validate_offset_bit!0 ((_ sign_extend 32) (size!7598 (buf!7661 thiss!1728))) ((_ sign_extend 32) (currentByte!14125 thiss!1728)) ((_ sign_extend 32) (currentBit!14120 thiss!1728)))))

(assert (=> d!99060 (= (readBit!0 thiss!1728) lt!425299)))

(declare-fun lt!425301 () (_ BitVec 64))

(declare-fun lt!425304 () (_ BitVec 64))

(declare-fun b!293412 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!293412 (= e!209551 (= (bitIndex!0 (size!7598 (buf!7661 (_2!12820 (increaseBitIndex!0 thiss!1728)))) (currentByte!14125 (_2!12820 (increaseBitIndex!0 thiss!1728))) (currentBit!14120 (_2!12820 (increaseBitIndex!0 thiss!1728)))) (bvadd lt!425301 lt!425304)))))

(assert (=> b!293412 (or (not (= (bvand lt!425301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!425304 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!425301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!425301 lt!425304) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!293412 (= lt!425304 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!293412 (= lt!425301 (bitIndex!0 (size!7598 (buf!7661 thiss!1728)) (currentByte!14125 thiss!1728) (currentBit!14120 thiss!1728)))))

(declare-fun lt!425298 () Bool)

(assert (=> b!293412 (= lt!425298 (not (= (bvand ((_ sign_extend 24) (select (arr!8624 (buf!7661 thiss!1728)) (currentByte!14125 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14120 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425303 () Bool)

(assert (=> b!293412 (= lt!425303 (not (= (bvand ((_ sign_extend 24) (select (arr!8624 (buf!7661 thiss!1728)) (currentByte!14125 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14120 thiss!1728)))) #b00000000000000000000000000000000)))))

(declare-fun lt!425300 () Bool)

(assert (=> b!293412 (= lt!425300 (not (= (bvand ((_ sign_extend 24) (select (arr!8624 (buf!7661 thiss!1728)) (currentByte!14125 thiss!1728))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14120 thiss!1728)))) #b00000000000000000000000000000000)))))

(assert (= (and d!99060 res!242288) b!293412))

(declare-fun m!428937 () Bool)

(assert (=> d!99060 m!428937))

(declare-fun m!428939 () Bool)

(assert (=> d!99060 m!428939))

(declare-fun m!428943 () Bool)

(assert (=> d!99060 m!428943))

(declare-fun m!428945 () Bool)

(assert (=> d!99060 m!428945))

(assert (=> b!293412 m!428937))

(assert (=> b!293412 m!428943))

(declare-fun m!428947 () Bool)

(assert (=> b!293412 m!428947))

(assert (=> b!293412 m!428939))

(declare-fun m!428949 () Bool)

(assert (=> b!293412 m!428949))

(assert (=> b!293396 d!99060))

(declare-fun d!99068 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!99068 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7598 (buf!7661 thiss!1728))) ((_ sign_extend 32) (currentByte!14125 thiss!1728)) ((_ sign_extend 32) (currentBit!14120 thiss!1728)) (bvsub nBits!523 from!505)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7598 (buf!7661 thiss!1728))) ((_ sign_extend 32) (currentByte!14125 thiss!1728)) ((_ sign_extend 32) (currentBit!14120 thiss!1728))) (bvsub nBits!523 from!505)))))

(declare-fun bs!25325 () Bool)

(assert (= bs!25325 d!99068))

(declare-fun m!428951 () Bool)

(assert (=> bs!25325 m!428951))

(assert (=> b!293394 d!99068))

(declare-fun d!99074 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!99074 (= (inv!12 thiss!1728) (invariant!0 (currentBit!14120 thiss!1728) (currentByte!14125 thiss!1728) (size!7598 (buf!7661 thiss!1728))))))

(declare-fun bs!25327 () Bool)

(assert (= bs!25327 d!99074))

(declare-fun m!428955 () Bool)

(assert (=> bs!25327 m!428955))

(assert (=> start!65382 d!99074))

(declare-fun d!99078 () Bool)

(assert (=> d!99078 (= (array_inv!7210 arr!273) (bvsge (size!7598 arr!273) #b00000000000000000000000000000000))))

(assert (=> start!65382 d!99078))

(check-sat (not b!293412) (not d!99068) (not d!99060) (not d!99074))
(check-sat)
