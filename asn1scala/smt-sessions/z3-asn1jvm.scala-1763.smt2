; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48218 () Bool)

(assert start!48218)

(declare-fun b!228941 () Bool)

(declare-fun e!157069 () Bool)

(declare-datatypes ((array!11611 0))(
  ( (array!11612 (arr!6083 (Array (_ BitVec 32) (_ BitVec 8))) (size!5096 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9288 0))(
  ( (BitStream!9289 (buf!5637 array!11611) (currentByte!10507 (_ BitVec 32)) (currentBit!10502 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9288)

(declare-fun array_inv!4837 (array!11611) Bool)

(assert (=> b!228941 (= e!157069 (array_inv!4837 (buf!5637 b2!99)))))

(declare-fun b!228942 () Bool)

(declare-fun e!157070 () Bool)

(declare-fun b1!101 () BitStream!9288)

(assert (=> b!228942 (= e!157070 (array_inv!4837 (buf!5637 b1!101)))))

(declare-fun res!191977 () Bool)

(declare-fun e!157068 () Bool)

(assert (=> start!48218 (=> (not res!191977) (not e!157068))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> start!48218 (= res!191977 (and (= (size!5096 (buf!5637 b1!101)) (size!5096 (buf!5637 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48218 e!157068))

(declare-fun inv!12 (BitStream!9288) Bool)

(assert (=> start!48218 (and (inv!12 b1!101) e!157070)))

(assert (=> start!48218 (and (inv!12 b2!99) e!157069)))

(assert (=> start!48218 true))

(declare-fun b!228943 () Bool)

(declare-fun res!191976 () Bool)

(assert (=> b!228943 (=> (not res!191976) (not e!157068))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228943 (= res!191976 (bvsle bits!86 (bitIndex!0 (size!5096 (buf!5637 b2!99)) (currentByte!10507 b2!99) (currentBit!10502 b2!99))))))

(declare-fun b!228944 () Bool)

(declare-fun res!191975 () Bool)

(assert (=> b!228944 (=> (not res!191975) (not e!157068))))

(assert (=> b!228944 (= res!191975 (and (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19) (bvsle ((_ sign_extend 32) (size!5096 (buf!5637 b1!101))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10507 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10502 b1!101)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5096 (buf!5637 b1!101))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10507 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10502 b1!101)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!228945 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228945 (= e!157068 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10502 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10507 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5096 (buf!5637 b1!101)))))))))

(assert (= (and start!48218 res!191977) b!228943))

(assert (= (and b!228943 res!191976) b!228944))

(assert (= (and b!228944 res!191975) b!228945))

(assert (= start!48218 b!228942))

(assert (= start!48218 b!228941))

(declare-fun m!352729 () Bool)

(assert (=> b!228945 m!352729))

(declare-fun m!352731 () Bool)

(assert (=> b!228942 m!352731))

(declare-fun m!352733 () Bool)

(assert (=> b!228943 m!352733))

(declare-fun m!352735 () Bool)

(assert (=> b!228941 m!352735))

(declare-fun m!352737 () Bool)

(assert (=> start!48218 m!352737))

(declare-fun m!352739 () Bool)

(assert (=> start!48218 m!352739))

(check-sat (not b!228945) (not start!48218) (not b!228941) (not b!228943) (not b!228942))
(check-sat)
(get-model)

(declare-fun d!77640 () Bool)

(assert (=> d!77640 (= (array_inv!4837 (buf!5637 b1!101)) (bvsge (size!5096 (buf!5637 b1!101)) #b00000000000000000000000000000000))))

(assert (=> b!228942 d!77640))

(declare-fun d!77642 () Bool)

(declare-fun e!157090 () Bool)

(assert (=> d!77642 e!157090))

(declare-fun res!191991 () Bool)

(assert (=> d!77642 (=> (not res!191991) (not e!157090))))

(declare-fun lt!367048 () (_ BitVec 64))

(declare-fun lt!367052 () (_ BitVec 64))

(declare-fun lt!367049 () (_ BitVec 64))

(assert (=> d!77642 (= res!191991 (= lt!367049 (bvsub lt!367048 lt!367052)))))

(assert (=> d!77642 (or (= (bvand lt!367048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!367052 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!367048 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!367048 lt!367052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77642 (= lt!367052 (remainingBits!0 ((_ sign_extend 32) (size!5096 (buf!5637 b2!99))) ((_ sign_extend 32) (currentByte!10507 b2!99)) ((_ sign_extend 32) (currentBit!10502 b2!99))))))

(declare-fun lt!367050 () (_ BitVec 64))

(declare-fun lt!367051 () (_ BitVec 64))

(assert (=> d!77642 (= lt!367048 (bvmul lt!367050 lt!367051))))

(assert (=> d!77642 (or (= lt!367050 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!367051 (bvsdiv (bvmul lt!367050 lt!367051) lt!367050)))))

(assert (=> d!77642 (= lt!367051 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77642 (= lt!367050 ((_ sign_extend 32) (size!5096 (buf!5637 b2!99))))))

(assert (=> d!77642 (= lt!367049 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10507 b2!99)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10502 b2!99))))))

(assert (=> d!77642 (invariant!0 (currentBit!10502 b2!99) (currentByte!10507 b2!99) (size!5096 (buf!5637 b2!99)))))

(assert (=> d!77642 (= (bitIndex!0 (size!5096 (buf!5637 b2!99)) (currentByte!10507 b2!99) (currentBit!10502 b2!99)) lt!367049)))

(declare-fun b!228965 () Bool)

(declare-fun res!191992 () Bool)

(assert (=> b!228965 (=> (not res!191992) (not e!157090))))

(assert (=> b!228965 (= res!191992 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!367049))))

(declare-fun b!228966 () Bool)

(declare-fun lt!367053 () (_ BitVec 64))

(assert (=> b!228966 (= e!157090 (bvsle lt!367049 (bvmul lt!367053 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!228966 (or (= lt!367053 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!367053 #b0000000000000000000000000000000000000000000000000000000000001000) lt!367053)))))

(assert (=> b!228966 (= lt!367053 ((_ sign_extend 32) (size!5096 (buf!5637 b2!99))))))

(assert (= (and d!77642 res!191991) b!228965))

(assert (= (and b!228965 res!191992) b!228966))

(declare-fun m!352753 () Bool)

(assert (=> d!77642 m!352753))

(declare-fun m!352755 () Bool)

(assert (=> d!77642 m!352755))

(assert (=> b!228943 d!77642))

(declare-fun d!77644 () Bool)

(assert (=> d!77644 (= (inv!12 b1!101) (invariant!0 (currentBit!10502 b1!101) (currentByte!10507 b1!101) (size!5096 (buf!5637 b1!101))))))

(declare-fun bs!19014 () Bool)

(assert (= bs!19014 d!77644))

(declare-fun m!352757 () Bool)

(assert (=> bs!19014 m!352757))

(assert (=> start!48218 d!77644))

(declare-fun d!77646 () Bool)

(assert (=> d!77646 (= (inv!12 b2!99) (invariant!0 (currentBit!10502 b2!99) (currentByte!10507 b2!99) (size!5096 (buf!5637 b2!99))))))

(declare-fun bs!19015 () Bool)

(assert (= bs!19015 d!77646))

(assert (=> bs!19015 m!352755))

(assert (=> start!48218 d!77646))

(declare-fun d!77648 () Bool)

(assert (=> d!77648 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10502 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10507 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5096 (buf!5637 b1!101))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10502 b1!101))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10502 b1!101))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10507 b1!101))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10507 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5096 (buf!5637 b1!101))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10502 b1!101))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10507 b1!101))) ((_ extract 31 0) ((_ sign_extend 32) (size!5096 (buf!5637 b1!101)))))))))))

(assert (=> b!228945 d!77648))

(declare-fun d!77650 () Bool)

(assert (=> d!77650 (= (array_inv!4837 (buf!5637 b2!99)) (bvsge (size!5096 (buf!5637 b2!99)) #b00000000000000000000000000000000))))

(assert (=> b!228941 d!77650))

(check-sat (not d!77644) (not d!77646) (not d!77642))
