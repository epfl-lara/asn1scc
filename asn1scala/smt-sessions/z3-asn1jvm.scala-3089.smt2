; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71124 () Bool)

(assert start!71124)

(declare-fun b!321028 () Bool)

(declare-fun e!231163 () Bool)

(declare-datatypes ((array!20297 0))(
  ( (array!20298 (arr!9938 (Array (_ BitVec 32) (_ BitVec 8))) (size!8846 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13854 0))(
  ( (BitStream!13855 (buf!7988 array!20297) (currentByte!14735 (_ BitVec 32)) (currentBit!14730 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13854)

(declare-fun array_inv!8398 (array!20297) Bool)

(assert (=> b!321028 (= e!231163 (array_inv!8398 (buf!7988 thiss!1780)))))

(declare-fun b!321026 () Bool)

(declare-fun res!263673 () Bool)

(declare-fun e!231165 () Bool)

(assert (=> b!321026 (=> (not res!263673) (not e!231165))))

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((tuple2!23470 0))(
  ( (tuple2!23471 (_1!13364 (_ BitVec 64)) (_2!13364 BitStream!13854)) )
))
(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23470)

(assert (=> b!321026 (= res!263673 (= (buf!7988 (_2!13364 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!7988 thiss!1780)))))

(declare-fun res!263672 () Bool)

(assert (=> start!71124 (=> (not res!263672) (not e!231165))))

(assert (=> start!71124 (= res!263672 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71124 e!231165))

(assert (=> start!71124 true))

(declare-fun inv!12 (BitStream!13854) Bool)

(assert (=> start!71124 (and (inv!12 thiss!1780) e!231163)))

(declare-fun b!321025 () Bool)

(declare-fun res!263674 () Bool)

(assert (=> b!321025 (=> (not res!263674) (not e!231165))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321025 (= res!263674 (validate_offset_bits!1 ((_ sign_extend 32) (size!8846 (buf!7988 thiss!1780))) ((_ sign_extend 32) (currentByte!14735 thiss!1780)) ((_ sign_extend 32) (currentBit!14730 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!321027 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321027 (= e!231165 (not (invariant!0 (currentBit!14730 thiss!1780) (currentByte!14735 thiss!1780) (size!8846 (buf!7988 thiss!1780)))))))

(assert (= (and start!71124 res!263672) b!321025))

(assert (= (and b!321025 res!263674) b!321026))

(assert (= (and b!321026 res!263673) b!321027))

(assert (= start!71124 b!321028))

(declare-fun m!459385 () Bool)

(assert (=> start!71124 m!459385))

(declare-fun m!459387 () Bool)

(assert (=> b!321026 m!459387))

(declare-fun m!459389 () Bool)

(assert (=> b!321027 m!459389))

(declare-fun m!459391 () Bool)

(assert (=> b!321028 m!459391))

(declare-fun m!459393 () Bool)

(assert (=> b!321025 m!459393))

(check-sat (not b!321026) (not start!71124) (not b!321028) (not b!321027) (not b!321025))
(check-sat)
(get-model)

(declare-fun d!105152 () Bool)

(assert (=> d!105152 (= (array_inv!8398 (buf!7988 thiss!1780)) (bvsge (size!8846 (buf!7988 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!321028 d!105152))

(declare-fun d!105154 () Bool)

(assert (=> d!105154 (= (invariant!0 (currentBit!14730 thiss!1780) (currentByte!14735 thiss!1780) (size!8846 (buf!7988 thiss!1780))) (and (bvsge (currentBit!14730 thiss!1780) #b00000000000000000000000000000000) (bvslt (currentBit!14730 thiss!1780) #b00000000000000000000000000001000) (bvsge (currentByte!14735 thiss!1780) #b00000000000000000000000000000000) (or (bvslt (currentByte!14735 thiss!1780) (size!8846 (buf!7988 thiss!1780))) (and (= (currentBit!14730 thiss!1780) #b00000000000000000000000000000000) (= (currentByte!14735 thiss!1780) (size!8846 (buf!7988 thiss!1780)))))))))

(assert (=> b!321027 d!105154))

(declare-fun d!105164 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105164 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8846 (buf!7988 thiss!1780))) ((_ sign_extend 32) (currentByte!14735 thiss!1780)) ((_ sign_extend 32) (currentBit!14730 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8846 (buf!7988 thiss!1780))) ((_ sign_extend 32) (currentByte!14735 thiss!1780)) ((_ sign_extend 32) (currentBit!14730 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27653 () Bool)

(assert (= bs!27653 d!105164))

(declare-fun m!459409 () Bool)

(assert (=> bs!27653 m!459409))

(assert (=> b!321025 d!105164))

(declare-fun b!321097 () Bool)

(declare-fun res!263725 () Bool)

(declare-fun e!231201 () Bool)

(assert (=> b!321097 (=> (not res!263725) (not e!231201))))

(declare-fun lt!444383 () tuple2!23470)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321097 (= res!263725 (= (bvand (_1!13364 lt!444383) (onesLSBLong!0 #b00000000000000000000000000000000)) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun b!321098 () Bool)

(declare-fun res!263726 () Bool)

(assert (=> b!321098 (=> (not res!263726) (not e!231201))))

(declare-fun lt!444381 () (_ BitVec 64))

(declare-fun lt!444382 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321098 (= res!263726 (= (bitIndex!0 (size!8846 (buf!7988 (_2!13364 lt!444383))) (currentByte!14735 (_2!13364 lt!444383)) (currentBit!14730 (_2!13364 lt!444383))) (bvadd lt!444381 lt!444382)))))

(assert (=> b!321098 (or (not (= (bvand lt!444381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444382 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444381 lt!444382) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!321098 (= lt!444382 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

(assert (=> b!321098 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!321098 (= lt!444381 (bitIndex!0 (size!8846 (buf!7988 thiss!1780)) (currentByte!14735 thiss!1780) (currentBit!14730 thiss!1780)))))

(declare-fun b!321099 () Bool)

(declare-fun res!263724 () Bool)

(assert (=> b!321099 (=> (not res!263724) (not e!231201))))

(assert (=> b!321099 (= res!263724 (= (bvand (_1!13364 lt!444383) (onesLSBLong!0 nBits!542)) (_1!13364 lt!444383)))))

(declare-fun b!321100 () Bool)

(declare-fun e!231199 () tuple2!23470)

(assert (=> b!321100 (= e!231199 (tuple2!23471 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(declare-fun b!321101 () Bool)

(declare-fun e!231200 () Bool)

(assert (=> b!321101 (= e!231201 e!231200)))

(declare-fun res!263727 () Bool)

(assert (=> b!321101 (=> res!263727 e!231200)))

(assert (=> b!321101 (= res!263727 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun d!105166 () Bool)

(assert (=> d!105166 e!231201))

(declare-fun res!263728 () Bool)

(assert (=> d!105166 (=> (not res!263728) (not e!231201))))

