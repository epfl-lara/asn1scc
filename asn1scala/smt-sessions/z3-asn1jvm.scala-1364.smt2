; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37772 () Bool)

(assert start!37772)

(declare-fun b!171066 () Bool)

(declare-fun res!141908 () Bool)

(declare-fun e!119420 () Bool)

(assert (=> b!171066 (=> (not res!141908) (not e!119420))))

(declare-datatypes ((array!9093 0))(
  ( (array!9094 (arr!4955 (Array (_ BitVec 32) (_ BitVec 8))) (size!4025 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7188 0))(
  ( (BitStream!7189 (buf!4468 array!9093) (currentByte!8473 (_ BitVec 32)) (currentBit!8468 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7188)

(declare-fun from!235 () (_ BitVec 64))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171066 (= res!141908 (validate_offset_bits!1 ((_ sign_extend 32) (size!4025 (buf!4468 bs!64))) ((_ sign_extend 32) (currentByte!8473 bs!64)) ((_ sign_extend 32) (currentBit!8468 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun res!141907 () Bool)

(assert (=> start!37772 (=> (not res!141907) (not e!119420))))

(assert (=> start!37772 (= res!141907 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37772 e!119420))

(assert (=> start!37772 true))

(declare-fun e!119422 () Bool)

(declare-fun inv!12 (BitStream!7188) Bool)

(assert (=> start!37772 (and (inv!12 bs!64) e!119422)))

(declare-fun b!171069 () Bool)

(declare-fun array_inv!3766 (array!9093) Bool)

(assert (=> b!171069 (= e!119422 (array_inv!3766 (buf!4468 bs!64)))))

(declare-fun e!119421 () Bool)

(declare-fun lt!263695 () BitStream!7188)

(declare-fun b!171068 () Bool)

(assert (=> b!171068 (= e!119421 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4025 (buf!4468 lt!263695))) ((_ sign_extend 32) (currentByte!8473 lt!263695)) ((_ sign_extend 32) (currentBit!8468 lt!263695)) (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235)))))))

(declare-fun b!171067 () Bool)

(assert (=> b!171067 (= e!119420 e!119421)))

(declare-fun res!141909 () Bool)

(assert (=> b!171067 (=> (not res!141909) (not e!119421))))

(assert (=> b!171067 (= res!141909 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))))))

(declare-fun withMovedBitIndex!0 (BitStream!7188 (_ BitVec 64)) BitStream!7188)

(assert (=> b!171067 (= lt!263695 (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!14704 0))(
  ( (tuple2!14705 (_1!7985 BitStream!7188) (_2!7985 Bool)) )
))
(declare-fun lt!263694 () tuple2!14704)

(declare-fun readBitPure!0 (BitStream!7188) tuple2!14704)

(assert (=> b!171067 (= lt!263694 (readBitPure!0 bs!64))))

(declare-fun lt!263696 () tuple2!14704)

(declare-fun expected!82 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!7188 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14704)

(assert (=> b!171067 (= lt!263696 (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235))))

(assert (= (and start!37772 res!141907) b!171066))

(assert (= (and b!171066 res!141908) b!171067))

(assert (= (and b!171067 res!141909) b!171068))

(assert (= start!37772 b!171069))

(declare-fun m!270213 () Bool)

(assert (=> b!171069 m!270213))

(declare-fun m!270215 () Bool)

(assert (=> start!37772 m!270215))

(declare-fun m!270217 () Bool)

(assert (=> b!171067 m!270217))

(declare-fun m!270219 () Bool)

(assert (=> b!171067 m!270219))

(declare-fun m!270221 () Bool)

(assert (=> b!171067 m!270221))

(declare-fun m!270223 () Bool)

(assert (=> b!171066 m!270223))

(declare-fun m!270225 () Bool)

(assert (=> b!171068 m!270225))

(check-sat (not b!171069) (not start!37772) (not b!171066) (not b!171067) (not b!171068))
(check-sat)
(get-model)

(declare-fun d!60453 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60453 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4025 (buf!4468 bs!64))) ((_ sign_extend 32) (currentByte!8473 bs!64)) ((_ sign_extend 32) (currentBit!8468 bs!64)) (bvsub nBits!283 from!235)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4025 (buf!4468 bs!64))) ((_ sign_extend 32) (currentByte!8473 bs!64)) ((_ sign_extend 32) (currentBit!8468 bs!64))) (bvsub nBits!283 from!235)))))

(declare-fun bs!15052 () Bool)

(assert (= bs!15052 d!60453))

(declare-fun m!270253 () Bool)

(assert (=> bs!15052 m!270253))

(assert (=> b!171066 d!60453))

(declare-fun d!60455 () Bool)

(declare-fun e!119443 () Bool)

(assert (=> d!60455 e!119443))

(declare-fun res!141927 () Bool)

(assert (=> d!60455 (=> (not res!141927) (not e!119443))))

(declare-fun lt!263729 () (_ BitVec 64))

(declare-fun lt!263728 () BitStream!7188)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!60455 (= res!141927 (= (bvadd lt!263729 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4025 (buf!4468 lt!263728)) (currentByte!8473 lt!263728) (currentBit!8468 lt!263728))))))

(assert (=> d!60455 (or (not (= (bvand lt!263729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263729 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263729 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60455 (= lt!263729 (bitIndex!0 (size!4025 (buf!4468 bs!64)) (currentByte!8473 bs!64) (currentBit!8468 bs!64)))))

(declare-datatypes ((Unit!12221 0))(
  ( (Unit!12222) )
))
(declare-datatypes ((tuple2!14712 0))(
  ( (tuple2!14713 (_1!7989 Unit!12221) (_2!7989 BitStream!7188)) )
))
(declare-fun moveBitIndex!0 (BitStream!7188 (_ BitVec 64)) tuple2!14712)

(assert (=> d!60455 (= lt!263728 (_2!7989 (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!7188 (_ BitVec 64)) Bool)

(assert (=> d!60455 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!60455 (= (withMovedBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) lt!263728)))

(declare-fun b!171090 () Bool)

(assert (=> b!171090 (= e!119443 (= (size!4025 (buf!4468 bs!64)) (size!4025 (buf!4468 lt!263728))))))

(assert (= (and d!60455 res!141927) b!171090))

(declare-fun m!270275 () Bool)

(assert (=> d!60455 m!270275))

(declare-fun m!270277 () Bool)

(assert (=> d!60455 m!270277))

(declare-fun m!270279 () Bool)

(assert (=> d!60455 m!270279))

(declare-fun m!270281 () Bool)

(assert (=> d!60455 m!270281))

(assert (=> b!171067 d!60455))

(declare-fun d!60463 () Bool)

(declare-datatypes ((tuple2!14716 0))(
  ( (tuple2!14717 (_1!7991 Bool) (_2!7991 BitStream!7188)) )
))
(declare-fun lt!263735 () tuple2!14716)

(declare-fun readBit!0 (BitStream!7188) tuple2!14716)

(assert (=> d!60463 (= lt!263735 (readBit!0 bs!64))))

(assert (=> d!60463 (= (readBitPure!0 bs!64) (tuple2!14705 (_2!7991 lt!263735) (_1!7991 lt!263735)))))

(declare-fun bs!15056 () Bool)

(assert (= bs!15056 d!60463))

(declare-fun m!270285 () Bool)

(assert (=> bs!15056 m!270285))

(assert (=> b!171067 d!60463))

(declare-fun d!60467 () Bool)

(declare-fun lt!263741 () tuple2!14716)

(declare-fun checkBitsLoop!0 (BitStream!7188 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!14716)

(assert (=> d!60467 (= lt!263741 (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235))))

(assert (=> d!60467 (= (checkBitsLoopPure!0 bs!64 nBits!283 expected!82 from!235) (tuple2!14705 (_2!7991 lt!263741) (_1!7991 lt!263741)))))

(declare-fun bs!15058 () Bool)

(assert (= bs!15058 d!60467))

(declare-fun m!270289 () Bool)

(assert (=> bs!15058 m!270289))

(assert (=> b!171067 d!60467))

(declare-fun d!60469 () Bool)

(assert (=> d!60469 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4025 (buf!4468 lt!263695))) ((_ sign_extend 32) (currentByte!8473 lt!263695)) ((_ sign_extend 32) (currentBit!8468 lt!263695)) (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4025 (buf!4468 lt!263695))) ((_ sign_extend 32) (currentByte!8473 lt!263695)) ((_ sign_extend 32) (currentBit!8468 lt!263695))) (bvsub nBits!283 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!235))))))

(declare-fun bs!15059 () Bool)

(assert (= bs!15059 d!60469))

(declare-fun m!270291 () Bool)

(assert (=> bs!15059 m!270291))

(assert (=> b!171068 d!60469))

(declare-fun d!60471 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!60471 (= (inv!12 bs!64) (invariant!0 (currentBit!8468 bs!64) (currentByte!8473 bs!64) (size!4025 (buf!4468 bs!64))))))

(declare-fun bs!15060 () Bool)

(assert (= bs!15060 d!60471))

(declare-fun m!270293 () Bool)

(assert (=> bs!15060 m!270293))

(assert (=> start!37772 d!60471))

(declare-fun d!60473 () Bool)

(assert (=> d!60473 (= (array_inv!3766 (buf!4468 bs!64)) (bvsge (size!4025 (buf!4468 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!171069 d!60473))

(check-sat (not d!60467) (not d!60463) (not d!60455) (not d!60471) (not d!60453) (not d!60469))
(check-sat)
(get-model)

(declare-fun d!60475 () Bool)

(declare-fun e!119450 () Bool)

(assert (=> d!60475 e!119450))

(declare-fun res!141930 () Bool)

(assert (=> d!60475 (=> (not res!141930) (not e!119450))))

(declare-fun increaseBitIndex!0 (BitStream!7188) tuple2!14712)

(assert (=> d!60475 (= res!141930 (= (buf!4468 (_2!7989 (increaseBitIndex!0 bs!64))) (buf!4468 bs!64)))))

(declare-fun lt!263761 () Bool)

(assert (=> d!60475 (= lt!263761 (not (= (bvand ((_ sign_extend 24) (select (arr!4955 (buf!4468 bs!64)) (currentByte!8473 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8468 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263756 () tuple2!14716)

(assert (=> d!60475 (= lt!263756 (tuple2!14717 (not (= (bvand ((_ sign_extend 24) (select (arr!4955 (buf!4468 bs!64)) (currentByte!8473 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8468 bs!64)))) #b00000000000000000000000000000000)) (_2!7989 (increaseBitIndex!0 bs!64))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!60475 (validate_offset_bit!0 ((_ sign_extend 32) (size!4025 (buf!4468 bs!64))) ((_ sign_extend 32) (currentByte!8473 bs!64)) ((_ sign_extend 32) (currentBit!8468 bs!64)))))

(assert (=> d!60475 (= (readBit!0 bs!64) lt!263756)))

(declare-fun b!171093 () Bool)

(declare-fun lt!263758 () (_ BitVec 64))

(declare-fun lt!263757 () (_ BitVec 64))

(assert (=> b!171093 (= e!119450 (= (bitIndex!0 (size!4025 (buf!4468 (_2!7989 (increaseBitIndex!0 bs!64)))) (currentByte!8473 (_2!7989 (increaseBitIndex!0 bs!64))) (currentBit!8468 (_2!7989 (increaseBitIndex!0 bs!64)))) (bvadd lt!263757 lt!263758)))))

(assert (=> b!171093 (or (not (= (bvand lt!263757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263758 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263757 lt!263758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171093 (= lt!263758 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171093 (= lt!263757 (bitIndex!0 (size!4025 (buf!4468 bs!64)) (currentByte!8473 bs!64) (currentBit!8468 bs!64)))))

(declare-fun lt!263762 () Bool)

(assert (=> b!171093 (= lt!263762 (not (= (bvand ((_ sign_extend 24) (select (arr!4955 (buf!4468 bs!64)) (currentByte!8473 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8468 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263760 () Bool)

(assert (=> b!171093 (= lt!263760 (not (= (bvand ((_ sign_extend 24) (select (arr!4955 (buf!4468 bs!64)) (currentByte!8473 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8468 bs!64)))) #b00000000000000000000000000000000)))))

(declare-fun lt!263759 () Bool)

(assert (=> b!171093 (= lt!263759 (not (= (bvand ((_ sign_extend 24) (select (arr!4955 (buf!4468 bs!64)) (currentByte!8473 bs!64))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!8468 bs!64)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60475 res!141930) b!171093))

(declare-fun m!270295 () Bool)

(assert (=> d!60475 m!270295))

(declare-fun m!270297 () Bool)

(assert (=> d!60475 m!270297))

(declare-fun m!270299 () Bool)

(assert (=> d!60475 m!270299))

(declare-fun m!270301 () Bool)

(assert (=> d!60475 m!270301))

(assert (=> b!171093 m!270297))

(declare-fun m!270303 () Bool)

(assert (=> b!171093 m!270303))

(assert (=> b!171093 m!270277))

(assert (=> b!171093 m!270299))

(assert (=> b!171093 m!270295))

(assert (=> d!60463 d!60475))

(declare-fun d!60477 () Bool)

(assert (=> d!60477 (= (invariant!0 (currentBit!8468 bs!64) (currentByte!8473 bs!64) (size!4025 (buf!4468 bs!64))) (and (bvsge (currentBit!8468 bs!64) #b00000000000000000000000000000000) (bvslt (currentBit!8468 bs!64) #b00000000000000000000000000001000) (bvsge (currentByte!8473 bs!64) #b00000000000000000000000000000000) (or (bvslt (currentByte!8473 bs!64) (size!4025 (buf!4468 bs!64))) (and (= (currentBit!8468 bs!64) #b00000000000000000000000000000000) (= (currentByte!8473 bs!64) (size!4025 (buf!4468 bs!64)))))))))

(assert (=> d!60471 d!60477))

(declare-fun d!60479 () Bool)

(assert (=> d!60479 (= (remainingBits!0 ((_ sign_extend 32) (size!4025 (buf!4468 lt!263695))) ((_ sign_extend 32) (currentByte!8473 lt!263695)) ((_ sign_extend 32) (currentBit!8468 lt!263695))) (bvsub (bvmul ((_ sign_extend 32) (size!4025 (buf!4468 lt!263695))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8473 lt!263695)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8468 lt!263695)))))))

(assert (=> d!60469 d!60479))

(declare-fun lt!263794 () (_ BitVec 64))

(declare-fun e!119461 () Bool)

(declare-fun b!171112 () Bool)

(declare-fun lt!263785 () tuple2!14716)

(assert (=> b!171112 (= e!119461 (= (bvsub lt!263794 from!235) (bitIndex!0 (size!4025 (buf!4468 (_2!7991 lt!263785))) (currentByte!8473 (_2!7991 lt!263785)) (currentBit!8468 (_2!7991 lt!263785)))))))

(assert (=> b!171112 (or (= (bvand lt!263794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263794 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263794 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263787 () (_ BitVec 64))

(assert (=> b!171112 (= lt!263794 (bvadd lt!263787 nBits!283))))

(assert (=> b!171112 (or (not (= (bvand lt!263787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263787 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263787 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171112 (= lt!263787 (bitIndex!0 (size!4025 (buf!4468 bs!64)) (currentByte!8473 bs!64) (currentBit!8468 bs!64)))))

(declare-fun b!171113 () Bool)

(declare-fun e!119465 () tuple2!14716)

(assert (=> b!171113 (= e!119465 (tuple2!14717 true bs!64))))

(declare-fun b!171114 () Bool)

(declare-fun e!119462 () Bool)

(declare-fun e!119463 () Bool)

(assert (=> b!171114 (= e!119462 e!119463)))

(declare-fun res!141941 () Bool)

(assert (=> b!171114 (=> res!141941 e!119463)))

(assert (=> b!171114 (= res!141941 (or (not (_1!7991 lt!263785)) (bvsge from!235 nBits!283)))))

(declare-fun b!171115 () Bool)

(declare-fun res!141943 () Bool)

(assert (=> b!171115 (=> (not res!141943) (not e!119462))))

(assert (=> b!171115 (= res!141943 (and (= (buf!4468 bs!64) (buf!4468 (_2!7991 lt!263785))) (or (not (= nBits!283 from!235)) (_1!7991 lt!263785))))))

(declare-fun d!60481 () Bool)

(assert (=> d!60481 e!119462))

(declare-fun res!141945 () Bool)

(assert (=> d!60481 (=> (not res!141945) (not e!119462))))

(declare-fun lt!263791 () (_ BitVec 64))

(assert (=> d!60481 (= res!141945 (bvsge (bvsub lt!263791 from!235) (bitIndex!0 (size!4025 (buf!4468 (_2!7991 lt!263785))) (currentByte!8473 (_2!7991 lt!263785)) (currentBit!8468 (_2!7991 lt!263785)))))))

(assert (=> d!60481 (or (= (bvand lt!263791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!235 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263791 from!235) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!263790 () (_ BitVec 64))

(assert (=> d!60481 (= lt!263791 (bvadd lt!263790 nBits!283))))

(assert (=> d!60481 (or (not (= (bvand lt!263790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!283 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263790 nBits!283) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60481 (= lt!263790 (bitIndex!0 (size!4025 (buf!4468 bs!64)) (currentByte!8473 bs!64) (currentBit!8468 bs!64)))))

(assert (=> d!60481 (= lt!263785 e!119465)))

(declare-fun c!8955 () Bool)

(assert (=> d!60481 (= c!8955 (= from!235 nBits!283))))

(assert (=> d!60481 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!60481 (= (checkBitsLoop!0 bs!64 nBits!283 expected!82 from!235) lt!263785)))

(declare-fun lt!263789 () tuple2!14716)

(declare-fun b!171116 () Bool)

(declare-fun lt!263792 () tuple2!14716)

(assert (=> b!171116 (= lt!263789 (checkBitsLoop!0 (_2!7991 lt!263792) nBits!283 expected!82 (bvadd from!235 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!263788 () Unit!12221)

(declare-fun lt!263793 () Unit!12221)

(assert (=> b!171116 (= lt!263788 lt!263793)))

(declare-fun lt!263795 () (_ BitVec 64))

(declare-fun lt!263786 () (_ BitVec 64))

(assert (=> b!171116 (validate_offset_bits!1 ((_ sign_extend 32) (size!4025 (buf!4468 (_2!7991 lt!263792)))) ((_ sign_extend 32) (currentByte!8473 (_2!7991 lt!263792))) ((_ sign_extend 32) (currentBit!8468 (_2!7991 lt!263792))) (bvsub lt!263795 lt!263786))))

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!7188 BitStream!7188 (_ BitVec 64) (_ BitVec 64)) Unit!12221)

(assert (=> b!171116 (= lt!263793 (validateOffsetBitsIneqLemma!0 bs!64 (_2!7991 lt!263792) lt!263795 lt!263786))))

(assert (=> b!171116 (= lt!263786 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!171116 (= lt!263795 (bvsub nBits!283 from!235))))

(declare-fun e!119464 () tuple2!14716)

(assert (=> b!171116 (= e!119464 (tuple2!14717 (_1!7991 lt!263789) (_2!7991 lt!263789)))))

(declare-fun b!171117 () Bool)

(declare-fun res!141942 () Bool)

(assert (=> b!171117 (=> (not res!141942) (not e!119462))))

(assert (=> b!171117 (= res!141942 e!119461)))

(declare-fun res!141944 () Bool)

(assert (=> b!171117 (=> res!141944 e!119461)))

(assert (=> b!171117 (= res!141944 (not (_1!7991 lt!263785)))))

(declare-fun b!171118 () Bool)

(assert (=> b!171118 (= e!119464 (tuple2!14717 false (_2!7991 lt!263792)))))

(declare-fun b!171119 () Bool)

(assert (=> b!171119 (= e!119465 e!119464)))

(assert (=> b!171119 (= lt!263792 (readBit!0 bs!64))))

(declare-fun c!8954 () Bool)

(assert (=> b!171119 (= c!8954 (not (= (_1!7991 lt!263792) expected!82)))))

(declare-fun b!171120 () Bool)

(assert (=> b!171120 (= e!119463 (= expected!82 (_2!7985 (readBitPure!0 bs!64))))))

(assert (= (and d!60481 c!8955) b!171113))

(assert (= (and d!60481 (not c!8955)) b!171119))

(assert (= (and b!171119 c!8954) b!171118))

(assert (= (and b!171119 (not c!8954)) b!171116))

(assert (= (and d!60481 res!141945) b!171115))

(assert (= (and b!171115 res!141943) b!171117))

(assert (= (and b!171117 (not res!141944)) b!171112))

(assert (= (and b!171117 res!141942) b!171114))

(assert (= (and b!171114 (not res!141941)) b!171120))

(declare-fun m!270305 () Bool)

(assert (=> d!60481 m!270305))

(assert (=> d!60481 m!270277))

(declare-fun m!270307 () Bool)

(assert (=> b!171116 m!270307))

(declare-fun m!270309 () Bool)

(assert (=> b!171116 m!270309))

(declare-fun m!270311 () Bool)

(assert (=> b!171116 m!270311))

(assert (=> b!171119 m!270285))

(assert (=> b!171120 m!270219))

(assert (=> b!171112 m!270305))

(assert (=> b!171112 m!270277))

(assert (=> d!60467 d!60481))

(declare-fun d!60483 () Bool)

(declare-fun e!119468 () Bool)

(assert (=> d!60483 e!119468))

(declare-fun res!141950 () Bool)

(assert (=> d!60483 (=> (not res!141950) (not e!119468))))

(declare-fun lt!263808 () (_ BitVec 64))

(declare-fun lt!263809 () (_ BitVec 64))

(declare-fun lt!263811 () (_ BitVec 64))

(assert (=> d!60483 (= res!141950 (= lt!263811 (bvsub lt!263808 lt!263809)))))

(assert (=> d!60483 (or (= (bvand lt!263808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263809 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263808 lt!263809) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60483 (= lt!263809 (remainingBits!0 ((_ sign_extend 32) (size!4025 (buf!4468 lt!263728))) ((_ sign_extend 32) (currentByte!8473 lt!263728)) ((_ sign_extend 32) (currentBit!8468 lt!263728))))))

(declare-fun lt!263812 () (_ BitVec 64))

(declare-fun lt!263813 () (_ BitVec 64))

(assert (=> d!60483 (= lt!263808 (bvmul lt!263812 lt!263813))))

(assert (=> d!60483 (or (= lt!263812 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!263813 (bvsdiv (bvmul lt!263812 lt!263813) lt!263812)))))

(assert (=> d!60483 (= lt!263813 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60483 (= lt!263812 ((_ sign_extend 32) (size!4025 (buf!4468 lt!263728))))))

(assert (=> d!60483 (= lt!263811 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8473 lt!263728)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8468 lt!263728))))))

(assert (=> d!60483 (invariant!0 (currentBit!8468 lt!263728) (currentByte!8473 lt!263728) (size!4025 (buf!4468 lt!263728)))))

(assert (=> d!60483 (= (bitIndex!0 (size!4025 (buf!4468 lt!263728)) (currentByte!8473 lt!263728) (currentBit!8468 lt!263728)) lt!263811)))

(declare-fun b!171125 () Bool)

(declare-fun res!141951 () Bool)

(assert (=> b!171125 (=> (not res!141951) (not e!119468))))

(assert (=> b!171125 (= res!141951 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263811))))

(declare-fun b!171126 () Bool)

(declare-fun lt!263810 () (_ BitVec 64))

(assert (=> b!171126 (= e!119468 (bvsle lt!263811 (bvmul lt!263810 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171126 (or (= lt!263810 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!263810 #b0000000000000000000000000000000000000000000000000000000000001000) lt!263810)))))

(assert (=> b!171126 (= lt!263810 ((_ sign_extend 32) (size!4025 (buf!4468 lt!263728))))))

(assert (= (and d!60483 res!141950) b!171125))

(assert (= (and b!171125 res!141951) b!171126))

(declare-fun m!270313 () Bool)

(assert (=> d!60483 m!270313))

(declare-fun m!270315 () Bool)

(assert (=> d!60483 m!270315))

(assert (=> d!60455 d!60483))

(declare-fun d!60485 () Bool)

(declare-fun e!119469 () Bool)

(assert (=> d!60485 e!119469))

(declare-fun res!141952 () Bool)

(assert (=> d!60485 (=> (not res!141952) (not e!119469))))

(declare-fun lt!263815 () (_ BitVec 64))

(declare-fun lt!263814 () (_ BitVec 64))

(declare-fun lt!263817 () (_ BitVec 64))

(assert (=> d!60485 (= res!141952 (= lt!263817 (bvsub lt!263814 lt!263815)))))

(assert (=> d!60485 (or (= (bvand lt!263814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!263815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!263814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!263814 lt!263815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!60485 (= lt!263815 (remainingBits!0 ((_ sign_extend 32) (size!4025 (buf!4468 bs!64))) ((_ sign_extend 32) (currentByte!8473 bs!64)) ((_ sign_extend 32) (currentBit!8468 bs!64))))))

(declare-fun lt!263818 () (_ BitVec 64))

(declare-fun lt!263819 () (_ BitVec 64))

(assert (=> d!60485 (= lt!263814 (bvmul lt!263818 lt!263819))))

(assert (=> d!60485 (or (= lt!263818 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!263819 (bvsdiv (bvmul lt!263818 lt!263819) lt!263818)))))

(assert (=> d!60485 (= lt!263819 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!60485 (= lt!263818 ((_ sign_extend 32) (size!4025 (buf!4468 bs!64))))))

(assert (=> d!60485 (= lt!263817 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8473 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8468 bs!64))))))

(assert (=> d!60485 (invariant!0 (currentBit!8468 bs!64) (currentByte!8473 bs!64) (size!4025 (buf!4468 bs!64)))))

(assert (=> d!60485 (= (bitIndex!0 (size!4025 (buf!4468 bs!64)) (currentByte!8473 bs!64) (currentBit!8468 bs!64)) lt!263817)))

(declare-fun b!171127 () Bool)

(declare-fun res!141953 () Bool)

(assert (=> b!171127 (=> (not res!141953) (not e!119469))))

(assert (=> b!171127 (= res!141953 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263817))))

(declare-fun b!171128 () Bool)

(declare-fun lt!263816 () (_ BitVec 64))

(assert (=> b!171128 (= e!119469 (bvsle lt!263817 (bvmul lt!263816 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171128 (or (= lt!263816 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!263816 #b0000000000000000000000000000000000000000000000000000000000001000) lt!263816)))))

(assert (=> b!171128 (= lt!263816 ((_ sign_extend 32) (size!4025 (buf!4468 bs!64))))))

(assert (= (and d!60485 res!141952) b!171127))

(assert (= (and b!171127 res!141953) b!171128))

(assert (=> d!60485 m!270253))

(assert (=> d!60485 m!270293))

(assert (=> d!60455 d!60485))

(declare-fun d!60487 () Bool)

(declare-fun lt!263833 () (_ BitVec 32))

(assert (=> d!60487 (= lt!263833 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!263836 () (_ BitVec 32))

(assert (=> d!60487 (= lt!263836 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!119475 () Bool)

(assert (=> d!60487 e!119475))

(declare-fun res!141959 () Bool)

(assert (=> d!60487 (=> (not res!141959) (not e!119475))))

(assert (=> d!60487 (= res!141959 (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!12225 () Unit!12221)

(declare-fun Unit!12226 () Unit!12221)

(declare-fun Unit!12227 () Unit!12221)

(assert (=> d!60487 (= (moveBitIndex!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!8468 bs!64) lt!263833) #b00000000000000000000000000000000) (tuple2!14713 Unit!12225 (BitStream!7189 (buf!4468 bs!64) (bvsub (bvadd (currentByte!8473 bs!64) lt!263836) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!263833 (currentBit!8468 bs!64)))) (ite (bvsge (bvadd (currentBit!8468 bs!64) lt!263833) #b00000000000000000000000000001000) (tuple2!14713 Unit!12226 (BitStream!7189 (buf!4468 bs!64) (bvadd (currentByte!8473 bs!64) lt!263836 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8468 bs!64) lt!263833) #b00000000000000000000000000001000))) (tuple2!14713 Unit!12227 (BitStream!7189 (buf!4468 bs!64) (bvadd (currentByte!8473 bs!64) lt!263836) (bvadd (currentBit!8468 bs!64) lt!263833))))))))

(declare-fun b!171133 () Bool)

(declare-fun e!119474 () Bool)

(assert (=> b!171133 (= e!119475 e!119474)))

(declare-fun res!141958 () Bool)

(assert (=> b!171133 (=> (not res!141958) (not e!119474))))

(declare-fun lt!263834 () (_ BitVec 64))

(declare-fun lt!263837 () tuple2!14712)

(assert (=> b!171133 (= res!141958 (= (bvadd lt!263834 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4025 (buf!4468 (_2!7989 lt!263837))) (currentByte!8473 (_2!7989 lt!263837)) (currentBit!8468 (_2!7989 lt!263837)))))))

(assert (=> b!171133 (or (not (= (bvand lt!263834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!263834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!263834 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!171133 (= lt!263834 (bitIndex!0 (size!4025 (buf!4468 bs!64)) (currentByte!8473 bs!64) (currentBit!8468 bs!64)))))

(declare-fun lt!263835 () (_ BitVec 32))

(declare-fun lt!263832 () (_ BitVec 32))

(declare-fun Unit!12228 () Unit!12221)

(declare-fun Unit!12229 () Unit!12221)

(declare-fun Unit!12230 () Unit!12221)

(assert (=> b!171133 (= lt!263837 (ite (bvslt (bvadd (currentBit!8468 bs!64) lt!263835) #b00000000000000000000000000000000) (tuple2!14713 Unit!12228 (BitStream!7189 (buf!4468 bs!64) (bvsub (bvadd (currentByte!8473 bs!64) lt!263832) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!263835 (currentBit!8468 bs!64)))) (ite (bvsge (bvadd (currentBit!8468 bs!64) lt!263835) #b00000000000000000000000000001000) (tuple2!14713 Unit!12229 (BitStream!7189 (buf!4468 bs!64) (bvadd (currentByte!8473 bs!64) lt!263832 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8468 bs!64) lt!263835) #b00000000000000000000000000001000))) (tuple2!14713 Unit!12230 (BitStream!7189 (buf!4468 bs!64) (bvadd (currentByte!8473 bs!64) lt!263832) (bvadd (currentBit!8468 bs!64) lt!263835))))))))

(assert (=> b!171133 (= lt!263835 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!171133 (= lt!263832 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!171134 () Bool)

(assert (=> b!171134 (= e!119474 (and (= (size!4025 (buf!4468 bs!64)) (size!4025 (buf!4468 (_2!7989 lt!263837)))) (= (buf!4468 bs!64) (buf!4468 (_2!7989 lt!263837)))))))

(assert (= (and d!60487 res!141959) b!171133))

(assert (= (and b!171133 res!141958) b!171134))

(assert (=> d!60487 m!270281))

(declare-fun m!270317 () Bool)

(assert (=> b!171133 m!270317))

(assert (=> b!171133 m!270277))

(assert (=> d!60455 d!60487))

(declare-fun d!60491 () Bool)

(declare-fun res!141962 () Bool)

(declare-fun e!119478 () Bool)

(assert (=> d!60491 (=> (not res!141962) (not e!119478))))

(assert (=> d!60491 (= res!141962 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4025 (buf!4468 bs!64)))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4025 (buf!4468 bs!64)))))))))

(assert (=> d!60491 (= (moveBitIndexPrecond!0 bs!64 #b0000000000000000000000000000000000000000000000000000000000000001) e!119478)))

(declare-fun b!171138 () Bool)

(declare-fun lt!263840 () (_ BitVec 64))

(assert (=> b!171138 (= e!119478 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!263840) (bvsle lt!263840 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4025 (buf!4468 bs!64)))))))))

(assert (=> b!171138 (= lt!263840 (bvadd (bitIndex!0 (size!4025 (buf!4468 bs!64)) (currentByte!8473 bs!64) (currentBit!8468 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!60491 res!141962) b!171138))

(assert (=> b!171138 m!270277))

(assert (=> d!60455 d!60491))

(declare-fun d!60493 () Bool)

(assert (=> d!60493 (= (remainingBits!0 ((_ sign_extend 32) (size!4025 (buf!4468 bs!64))) ((_ sign_extend 32) (currentByte!8473 bs!64)) ((_ sign_extend 32) (currentBit!8468 bs!64))) (bvsub (bvmul ((_ sign_extend 32) (size!4025 (buf!4468 bs!64))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8473 bs!64)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8468 bs!64)))))))

(assert (=> d!60453 d!60493))

(check-sat (not d!60475) (not d!60487) (not d!60485) (not b!171093) (not b!171138) (not b!171119) (not d!60483) (not b!171120) (not b!171112) (not b!171116) (not b!171133) (not d!60481))
(check-sat)
