; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71058 () Bool)

(assert start!71058)

(declare-fun b!320873 () Bool)

(declare-fun e!231065 () Bool)

(declare-fun e!231063 () Bool)

(assert (=> b!320873 (= e!231065 e!231063)))

(declare-fun res!263552 () Bool)

(assert (=> b!320873 (=> (not res!263552) (not e!231063))))

(declare-datatypes ((array!20288 0))(
  ( (array!20289 (arr!9935 (Array (_ BitVec 32) (_ BitVec 8))) (size!8843 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13848 0))(
  ( (BitStream!13849 (buf!7985 array!20288) (currentByte!14720 (_ BitVec 32)) (currentBit!14715 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23446 0))(
  ( (tuple2!23447 (_1!13352 (_ BitVec 64)) (_2!13352 BitStream!13848)) )
))
(declare-fun lt!444110 () tuple2!23446)

(declare-fun thiss!1780 () BitStream!13848)

(assert (=> b!320873 (= res!263552 (= (buf!7985 (_2!13352 lt!444110)) (buf!7985 thiss!1780)))))

(declare-fun nBits!542 () (_ BitVec 32))

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!13848 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23446)

(assert (=> b!320873 (= lt!444110 (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320872 () Bool)

(declare-fun res!263553 () Bool)

(assert (=> b!320872 (=> (not res!263553) (not e!231065))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!320872 (= res!263553 (validate_offset_bits!1 ((_ sign_extend 32) (size!8843 (buf!7985 thiss!1780))) ((_ sign_extend 32) (currentByte!14720 thiss!1780)) ((_ sign_extend 32) (currentBit!14715 thiss!1780)) ((_ sign_extend 32) nBits!542)))))

(declare-fun b!320875 () Bool)

(declare-fun e!231066 () Bool)

(declare-fun array_inv!8395 (array!20288) Bool)

(assert (=> b!320875 (= e!231066 (array_inv!8395 (buf!7985 thiss!1780)))))

(declare-fun res!263554 () Bool)

(assert (=> start!71058 (=> (not res!263554) (not e!231065))))

(assert (=> start!71058 (= res!263554 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000)))))

(assert (=> start!71058 e!231065))

(assert (=> start!71058 true))

(declare-fun inv!12 (BitStream!13848) Bool)

(assert (=> start!71058 (and (inv!12 thiss!1780) e!231066)))

(declare-fun b!320874 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320874 (= e!231063 (not (invariant!0 (currentBit!14715 (_2!13352 lt!444110)) (currentByte!14720 (_2!13352 lt!444110)) (size!8843 (buf!7985 (_2!13352 lt!444110))))))))

(assert (= (and start!71058 res!263554) b!320872))

(assert (= (and b!320872 res!263553) b!320873))

(assert (= (and b!320873 res!263552) b!320874))

(assert (= start!71058 b!320875))

(declare-fun m!459223 () Bool)

(assert (=> b!320874 m!459223))

(declare-fun m!459225 () Bool)

(assert (=> b!320873 m!459225))

(declare-fun m!459227 () Bool)

(assert (=> b!320872 m!459227))

(declare-fun m!459229 () Bool)

(assert (=> b!320875 m!459229))

(declare-fun m!459231 () Bool)

(assert (=> start!71058 m!459231))

(check-sat (not b!320875) (not b!320872) (not start!71058) (not b!320874) (not b!320873))
(check-sat)
(get-model)

(declare-fun b!320937 () Bool)

(declare-fun e!231102 () tuple2!23446)

(declare-fun lt!444161 () tuple2!23446)

(assert (=> b!320937 (= e!231102 (tuple2!23447 (_1!13352 lt!444161) (_2!13352 lt!444161)))))

(declare-datatypes ((tuple2!23454 0))(
  ( (tuple2!23455 (_1!13356 Bool) (_2!13356 BitStream!13848)) )
))
(declare-fun lt!444156 () tuple2!23454)

(declare-fun readBit!0 (BitStream!13848) tuple2!23454)

(assert (=> b!320937 (= lt!444156 (readBit!0 thiss!1780))))

(assert (=> b!320937 (= lt!444161 (readNBitsLSBFirstsLoop!0 (_2!13356 lt!444156) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13356 lt!444156) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!320938 () Bool)

(declare-fun res!263601 () Bool)

(declare-fun e!231100 () Bool)

(assert (=> b!320938 (=> (not res!263601) (not e!231100))))

(declare-fun lt!444160 () tuple2!23446)

(declare-fun lt!444159 () (_ BitVec 64))

(declare-fun lt!444157 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!320938 (= res!263601 (= (bitIndex!0 (size!8843 (buf!7985 (_2!13352 lt!444160))) (currentByte!14720 (_2!13352 lt!444160)) (currentBit!14715 (_2!13352 lt!444160))) (bvadd lt!444157 lt!444159)))))

(assert (=> b!320938 (or (not (= (bvand lt!444157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444159 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444157 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444157 lt!444159) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!320938 (= lt!444159 ((_ sign_extend 32) (bvsub nBits!542 #b00000000000000000000000000000000)))))

(assert (=> b!320938 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!320938 (= lt!444157 (bitIndex!0 (size!8843 (buf!7985 thiss!1780)) (currentByte!14720 thiss!1780) (currentBit!14715 thiss!1780)))))

(declare-fun b!320939 () Bool)

(declare-fun res!263599 () Bool)

(assert (=> b!320939 (=> (not res!263599) (not e!231100))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!320939 (= res!263599 (= (bvand (_1!13352 lt!444160) (onesLSBLong!0 nBits!542)) (_1!13352 lt!444160)))))

(declare-fun lt!444158 () (_ BitVec 64))

(declare-fun b!320941 () Bool)

(declare-fun e!231101 () Bool)

(declare-datatypes ((tuple2!23458 0))(
  ( (tuple2!23459 (_1!13358 BitStream!13848) (_2!13358 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!13848) tuple2!23458)

(assert (=> b!320941 (= e!231101 (= (= (bvand (bvlshr (_1!13352 lt!444160) lt!444158) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13358 (readBitPure!0 thiss!1780))))))

(assert (=> b!320941 (and (bvsge lt!444158 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444158 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!320941 (= lt!444158 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun b!320942 () Bool)

(assert (=> b!320942 (= e!231100 e!231101)))

(declare-fun res!263602 () Bool)

(assert (=> b!320942 (=> res!263602 e!231101)))

(assert (=> b!320942 (= res!263602 (not (bvslt #b00000000000000000000000000000000 nBits!542)))))

(declare-fun b!320943 () Bool)

(assert (=> b!320943 (= e!231102 (tuple2!23447 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1780))))

(declare-fun b!320940 () Bool)

(declare-fun res!263600 () Bool)

(assert (=> b!320940 (=> (not res!263600) (not e!231100))))

(assert (=> b!320940 (= res!263600 (= (bvand (_1!13352 lt!444160) (onesLSBLong!0 #b00000000000000000000000000000000)) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun d!105066 () Bool)

(assert (=> d!105066 e!231100))

(declare-fun res!263603 () Bool)

(assert (=> d!105066 (=> (not res!263603) (not e!231100))))

(assert (=> d!105066 (= res!263603 (= (buf!7985 (_2!13352 lt!444160)) (buf!7985 thiss!1780)))))

(assert (=> d!105066 (= lt!444160 e!231102)))

(declare-fun c!15381 () Bool)

(assert (=> d!105066 (= c!15381 (= nBits!542 #b00000000000000000000000000000000))))

(assert (=> d!105066 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105066 (= (readNBitsLSBFirstsLoop!0 thiss!1780 nBits!542 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!444160)))

(assert (= (and d!105066 c!15381) b!320943))

(assert (= (and d!105066 (not c!15381)) b!320937))

(assert (= (and d!105066 res!263603) b!320938))

(assert (= (and b!320938 res!263601) b!320940))

(assert (= (and b!320940 res!263600) b!320939))

(assert (= (and b!320939 res!263599) b!320942))

(assert (= (and b!320942 (not res!263602)) b!320941))

(declare-fun m!459263 () Bool)

(assert (=> b!320938 m!459263))

(declare-fun m!459265 () Bool)

(assert (=> b!320938 m!459265))

(declare-fun m!459267 () Bool)

(assert (=> b!320939 m!459267))

(declare-fun m!459269 () Bool)

(assert (=> b!320941 m!459269))

(declare-fun m!459271 () Bool)

(assert (=> b!320940 m!459271))

(declare-fun m!459273 () Bool)

(assert (=> b!320937 m!459273))

(declare-fun m!459275 () Bool)

(assert (=> b!320937 m!459275))

(assert (=> b!320873 d!105066))

(declare-fun d!105086 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105086 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8843 (buf!7985 thiss!1780))) ((_ sign_extend 32) (currentByte!14720 thiss!1780)) ((_ sign_extend 32) (currentBit!14715 thiss!1780)) ((_ sign_extend 32) nBits!542)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8843 (buf!7985 thiss!1780))) ((_ sign_extend 32) (currentByte!14720 thiss!1780)) ((_ sign_extend 32) (currentBit!14715 thiss!1780))) ((_ sign_extend 32) nBits!542)))))

(declare-fun bs!27642 () Bool)

(assert (= bs!27642 d!105086))

(declare-fun m!459277 () Bool)

(assert (=> bs!27642 m!459277))

(assert (=> b!320872 d!105086))

(declare-fun d!105088 () Bool)

(assert (=> d!105088 (= (inv!12 thiss!1780) (invariant!0 (currentBit!14715 thiss!1780) (currentByte!14720 thiss!1780) (size!8843 (buf!7985 thiss!1780))))))

(declare-fun bs!27643 () Bool)

(assert (= bs!27643 d!105088))

(declare-fun m!459279 () Bool)

(assert (=> bs!27643 m!459279))

(assert (=> start!71058 d!105088))

(declare-fun d!105090 () Bool)

(assert (=> d!105090 (= (array_inv!8395 (buf!7985 thiss!1780)) (bvsge (size!8843 (buf!7985 thiss!1780)) #b00000000000000000000000000000000))))

(assert (=> b!320875 d!105090))

(declare-fun d!105092 () Bool)

(assert (=> d!105092 (= (invariant!0 (currentBit!14715 (_2!13352 lt!444110)) (currentByte!14720 (_2!13352 lt!444110)) (size!8843 (buf!7985 (_2!13352 lt!444110)))) (and (bvsge (currentBit!14715 (_2!13352 lt!444110)) #b00000000000000000000000000000000) (bvslt (currentBit!14715 (_2!13352 lt!444110)) #b00000000000000000000000000001000) (bvsge (currentByte!14720 (_2!13352 lt!444110)) #b00000000000000000000000000000000) (or (bvslt (currentByte!14720 (_2!13352 lt!444110)) (size!8843 (buf!7985 (_2!13352 lt!444110)))) (and (= (currentBit!14715 (_2!13352 lt!444110)) #b00000000000000000000000000000000) (= (currentByte!14720 (_2!13352 lt!444110)) (size!8843 (buf!7985 (_2!13352 lt!444110))))))))))

(assert (=> b!320874 d!105092))

(check-sat (not b!320939) (not d!105086) (not b!320940) (not b!320938) (not b!320941) (not b!320937) (not d!105088))
(check-sat)
(get-model)

(declare-fun d!105096 () Bool)

(assert (=> d!105096 (= (onesLSBLong!0 #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!320940 d!105096))

(declare-fun d!105098 () Bool)

(assert (=> d!105098 (= (onesLSBLong!0 nBits!542) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!542))))))

(assert (=> b!320939 d!105098))

(declare-fun d!105100 () Bool)

(assert (=> d!105100 (= (remainingBits!0 ((_ sign_extend 32) (size!8843 (buf!7985 thiss!1780))) ((_ sign_extend 32) (currentByte!14720 thiss!1780)) ((_ sign_extend 32) (currentBit!14715 thiss!1780))) (bvsub (bvmul ((_ sign_extend 32) (size!8843 (buf!7985 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14720 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14715 thiss!1780)))))))

(assert (=> d!105086 d!105100))

(declare-fun d!105102 () Bool)

(declare-fun e!231108 () Bool)

(assert (=> d!105102 e!231108))

(declare-fun res!263613 () Bool)

(assert (=> d!105102 (=> (not res!263613) (not e!231108))))

(declare-fun lt!444184 () (_ BitVec 64))

(declare-fun lt!444182 () (_ BitVec 64))

(declare-fun lt!444185 () (_ BitVec 64))

(assert (=> d!105102 (= res!263613 (= lt!444185 (bvsub lt!444184 lt!444182)))))

(assert (=> d!105102 (or (= (bvand lt!444184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444182 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444184 lt!444182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105102 (= lt!444182 (remainingBits!0 ((_ sign_extend 32) (size!8843 (buf!7985 (_2!13352 lt!444160)))) ((_ sign_extend 32) (currentByte!14720 (_2!13352 lt!444160))) ((_ sign_extend 32) (currentBit!14715 (_2!13352 lt!444160)))))))

(declare-fun lt!444183 () (_ BitVec 64))

(declare-fun lt!444180 () (_ BitVec 64))

(assert (=> d!105102 (= lt!444184 (bvmul lt!444183 lt!444180))))

(assert (=> d!105102 (or (= lt!444183 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444180 (bvsdiv (bvmul lt!444183 lt!444180) lt!444183)))))

(assert (=> d!105102 (= lt!444180 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105102 (= lt!444183 ((_ sign_extend 32) (size!8843 (buf!7985 (_2!13352 lt!444160)))))))

(assert (=> d!105102 (= lt!444185 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14720 (_2!13352 lt!444160))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14715 (_2!13352 lt!444160)))))))

(assert (=> d!105102 (invariant!0 (currentBit!14715 (_2!13352 lt!444160)) (currentByte!14720 (_2!13352 lt!444160)) (size!8843 (buf!7985 (_2!13352 lt!444160))))))

(assert (=> d!105102 (= (bitIndex!0 (size!8843 (buf!7985 (_2!13352 lt!444160))) (currentByte!14720 (_2!13352 lt!444160)) (currentBit!14715 (_2!13352 lt!444160))) lt!444185)))

(declare-fun b!320955 () Bool)

(declare-fun res!263614 () Bool)

(assert (=> b!320955 (=> (not res!263614) (not e!231108))))

(assert (=> b!320955 (= res!263614 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444185))))

(declare-fun b!320956 () Bool)

(declare-fun lt!444181 () (_ BitVec 64))

(assert (=> b!320956 (= e!231108 (bvsle lt!444185 (bvmul lt!444181 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320956 (or (= lt!444181 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444181 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444181)))))

(assert (=> b!320956 (= lt!444181 ((_ sign_extend 32) (size!8843 (buf!7985 (_2!13352 lt!444160)))))))

(assert (= (and d!105102 res!263613) b!320955))

(assert (= (and b!320955 res!263614) b!320956))

(declare-fun m!459297 () Bool)

(assert (=> d!105102 m!459297))

(declare-fun m!459299 () Bool)

(assert (=> d!105102 m!459299))

(assert (=> b!320938 d!105102))

(declare-fun d!105104 () Bool)

(declare-fun e!231109 () Bool)

(assert (=> d!105104 e!231109))

(declare-fun res!263615 () Bool)

(assert (=> d!105104 (=> (not res!263615) (not e!231109))))

(declare-fun lt!444188 () (_ BitVec 64))

(declare-fun lt!444191 () (_ BitVec 64))

(declare-fun lt!444190 () (_ BitVec 64))

(assert (=> d!105104 (= res!263615 (= lt!444191 (bvsub lt!444190 lt!444188)))))

(assert (=> d!105104 (or (= (bvand lt!444190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444188 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!444190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!444190 lt!444188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105104 (= lt!444188 (remainingBits!0 ((_ sign_extend 32) (size!8843 (buf!7985 thiss!1780))) ((_ sign_extend 32) (currentByte!14720 thiss!1780)) ((_ sign_extend 32) (currentBit!14715 thiss!1780))))))

(declare-fun lt!444189 () (_ BitVec 64))

(declare-fun lt!444186 () (_ BitVec 64))

(assert (=> d!105104 (= lt!444190 (bvmul lt!444189 lt!444186))))

(assert (=> d!105104 (or (= lt!444189 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!444186 (bvsdiv (bvmul lt!444189 lt!444186) lt!444189)))))

(assert (=> d!105104 (= lt!444186 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!105104 (= lt!444189 ((_ sign_extend 32) (size!8843 (buf!7985 thiss!1780))))))

(assert (=> d!105104 (= lt!444191 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14720 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14715 thiss!1780))))))

(assert (=> d!105104 (invariant!0 (currentBit!14715 thiss!1780) (currentByte!14720 thiss!1780) (size!8843 (buf!7985 thiss!1780)))))

(assert (=> d!105104 (= (bitIndex!0 (size!8843 (buf!7985 thiss!1780)) (currentByte!14720 thiss!1780) (currentBit!14715 thiss!1780)) lt!444191)))

(declare-fun b!320957 () Bool)

(declare-fun res!263616 () Bool)

(assert (=> b!320957 (=> (not res!263616) (not e!231109))))

(assert (=> b!320957 (= res!263616 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!444191))))

(declare-fun b!320958 () Bool)

(declare-fun lt!444187 () (_ BitVec 64))

(assert (=> b!320958 (= e!231109 (bvsle lt!444191 (bvmul lt!444187 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!320958 (or (= lt!444187 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!444187 #b0000000000000000000000000000000000000000000000000000000000001000) lt!444187)))))

(assert (=> b!320958 (= lt!444187 ((_ sign_extend 32) (size!8843 (buf!7985 thiss!1780))))))

(assert (= (and d!105104 res!263615) b!320957))

(assert (= (and b!320957 res!263616) b!320958))

(assert (=> d!105104 m!459277))

(assert (=> d!105104 m!459279))

(assert (=> b!320938 d!105104))

(declare-fun d!105106 () Bool)

(assert (=> d!105106 (= (invariant!0 (currentBit!14715 thiss!1780) (currentByte!14720 thiss!1780) (size!8843 (buf!7985 thiss!1780))) (and (bvsge (currentBit!14715 thiss!1780) #b00000000000000000000000000000000) (bvslt (currentBit!14715 thiss!1780) #b00000000000000000000000000001000) (bvsge (currentByte!14720 thiss!1780) #b00000000000000000000000000000000) (or (bvslt (currentByte!14720 thiss!1780) (size!8843 (buf!7985 thiss!1780))) (and (= (currentBit!14715 thiss!1780) #b00000000000000000000000000000000) (= (currentByte!14720 thiss!1780) (size!8843 (buf!7985 thiss!1780)))))))))

(assert (=> d!105088 d!105106))

(declare-fun d!105108 () Bool)

(declare-fun e!231129 () Bool)

(assert (=> d!105108 e!231129))

(declare-fun res!263633 () Bool)

(assert (=> d!105108 (=> (not res!263633) (not e!231129))))

(declare-datatypes ((Unit!21994 0))(
  ( (Unit!21995) )
))
(declare-datatypes ((tuple2!23464 0))(
  ( (tuple2!23465 (_1!13361 Unit!21994) (_2!13361 BitStream!13848)) )
))
(declare-fun increaseBitIndex!0 (BitStream!13848) tuple2!23464)

(assert (=> d!105108 (= res!263633 (= (buf!7985 (_2!13361 (increaseBitIndex!0 thiss!1780))) (buf!7985 thiss!1780)))))

(declare-fun lt!444258 () Bool)

(assert (=> d!105108 (= lt!444258 (not (= (bvand ((_ sign_extend 24) (select (arr!9935 (buf!7985 thiss!1780)) (currentByte!14720 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14715 thiss!1780)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444259 () tuple2!23454)

(assert (=> d!105108 (= lt!444259 (tuple2!23455 (not (= (bvand ((_ sign_extend 24) (select (arr!9935 (buf!7985 thiss!1780)) (currentByte!14720 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14715 thiss!1780)))) #b00000000000000000000000000000000)) (_2!13361 (increaseBitIndex!0 thiss!1780))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!105108 (validate_offset_bit!0 ((_ sign_extend 32) (size!8843 (buf!7985 thiss!1780))) ((_ sign_extend 32) (currentByte!14720 thiss!1780)) ((_ sign_extend 32) (currentBit!14715 thiss!1780)))))

(assert (=> d!105108 (= (readBit!0 thiss!1780) lt!444259)))

(declare-fun b!320977 () Bool)

(declare-fun lt!444256 () (_ BitVec 64))

(declare-fun lt!444260 () (_ BitVec 64))

(assert (=> b!320977 (= e!231129 (= (bitIndex!0 (size!8843 (buf!7985 (_2!13361 (increaseBitIndex!0 thiss!1780)))) (currentByte!14720 (_2!13361 (increaseBitIndex!0 thiss!1780))) (currentBit!14715 (_2!13361 (increaseBitIndex!0 thiss!1780)))) (bvadd lt!444260 lt!444256)))))

(assert (=> b!320977 (or (not (= (bvand lt!444260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444256 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444260 lt!444256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!320977 (= lt!444256 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!320977 (= lt!444260 (bitIndex!0 (size!8843 (buf!7985 thiss!1780)) (currentByte!14720 thiss!1780) (currentBit!14715 thiss!1780)))))

(declare-fun lt!444257 () Bool)

(assert (=> b!320977 (= lt!444257 (not (= (bvand ((_ sign_extend 24) (select (arr!9935 (buf!7985 thiss!1780)) (currentByte!14720 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14715 thiss!1780)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444255 () Bool)

(assert (=> b!320977 (= lt!444255 (not (= (bvand ((_ sign_extend 24) (select (arr!9935 (buf!7985 thiss!1780)) (currentByte!14720 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14715 thiss!1780)))) #b00000000000000000000000000000000)))))

(declare-fun lt!444254 () Bool)

(assert (=> b!320977 (= lt!444254 (not (= (bvand ((_ sign_extend 24) (select (arr!9935 (buf!7985 thiss!1780)) (currentByte!14720 thiss!1780))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!14715 thiss!1780)))) #b00000000000000000000000000000000)))))

(assert (= (and d!105108 res!263633) b!320977))

(declare-fun m!459327 () Bool)

(assert (=> d!105108 m!459327))

(declare-fun m!459329 () Bool)

(assert (=> d!105108 m!459329))

(declare-fun m!459331 () Bool)

(assert (=> d!105108 m!459331))

(declare-fun m!459333 () Bool)

(assert (=> d!105108 m!459333))

(assert (=> b!320977 m!459329))

(assert (=> b!320977 m!459327))

(assert (=> b!320977 m!459331))

(assert (=> b!320977 m!459265))

(declare-fun m!459335 () Bool)

(assert (=> b!320977 m!459335))

(assert (=> b!320937 d!105108))

(declare-fun b!320980 () Bool)

(declare-fun e!231133 () tuple2!23446)

(declare-fun lt!444272 () tuple2!23446)

(assert (=> b!320980 (= e!231133 (tuple2!23447 (_1!13352 lt!444272) (_2!13352 lt!444272)))))

(declare-fun lt!444267 () tuple2!23454)

(assert (=> b!320980 (= lt!444267 (readBit!0 (_2!13356 lt!444156)))))

(assert (=> b!320980 (= lt!444272 (readNBitsLSBFirstsLoop!0 (_2!13356 lt!444267) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13356 lt!444156) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13356 lt!444267) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!320981 () Bool)

(declare-fun res!263638 () Bool)

(declare-fun e!231131 () Bool)

(assert (=> b!320981 (=> (not res!263638) (not e!231131))))

(declare-fun lt!444270 () (_ BitVec 64))

(declare-fun lt!444268 () (_ BitVec 64))

(declare-fun lt!444271 () tuple2!23446)

(assert (=> b!320981 (= res!263638 (= (bitIndex!0 (size!8843 (buf!7985 (_2!13352 lt!444271))) (currentByte!14720 (_2!13352 lt!444271)) (currentBit!14715 (_2!13352 lt!444271))) (bvadd lt!444268 lt!444270)))))

(assert (=> b!320981 (or (not (= (bvand lt!444268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!444270 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!444268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!444268 lt!444270) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!320981 (= lt!444270 ((_ sign_extend 32) (bvsub nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!320981 (or (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!542 #b10000000000000000000000000000000) (bvand (bvsub nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!320981 (= lt!444268 (bitIndex!0 (size!8843 (buf!7985 (_2!13356 lt!444156))) (currentByte!14720 (_2!13356 lt!444156)) (currentBit!14715 (_2!13356 lt!444156))))))

(declare-fun b!320982 () Bool)

(declare-fun res!263636 () Bool)

(assert (=> b!320982 (=> (not res!263636) (not e!231131))))

(assert (=> b!320982 (= res!263636 (= (bvand (_1!13352 lt!444271) (onesLSBLong!0 nBits!542)) (_1!13352 lt!444271)))))

(declare-fun b!320984 () Bool)

(declare-fun e!231132 () Bool)

(declare-fun lt!444269 () (_ BitVec 64))

(assert (=> b!320984 (= e!231132 (= (= (bvand (bvlshr (_1!13352 lt!444271) lt!444269) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13358 (readBitPure!0 (_2!13356 lt!444156)))))))

(assert (=> b!320984 (and (bvsge lt!444269 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!444269 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!320984 (= lt!444269 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!320985 () Bool)

(assert (=> b!320985 (= e!231131 e!231132)))

(declare-fun res!263639 () Bool)

(assert (=> b!320985 (=> res!263639 e!231132)))

(assert (=> b!320985 (= res!263639 (not (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!542)))))

(declare-fun b!320986 () Bool)

(assert (=> b!320986 (= e!231133 (tuple2!23447 (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13356 lt!444156) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13356 lt!444156)))))

(declare-fun b!320983 () Bool)

(declare-fun res!263637 () Bool)

(assert (=> b!320983 (=> (not res!263637) (not e!231131))))

(assert (=> b!320983 (= res!263637 (= (bvand (_1!13352 lt!444271) (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (bvand (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13356 lt!444156) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun d!105130 () Bool)

(assert (=> d!105130 e!231131))

(declare-fun res!263640 () Bool)

(assert (=> d!105130 (=> (not res!263640) (not e!231131))))

(assert (=> d!105130 (= res!263640 (= (buf!7985 (_2!13352 lt!444271)) (buf!7985 (_2!13356 lt!444156))))))

(assert (=> d!105130 (= lt!444271 e!231133)))

(declare-fun c!15384 () Bool)

(assert (=> d!105130 (= c!15384 (= nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!105130 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!542) (bvsle nBits!542 #b00000000000000000000000001000000))))

(assert (=> d!105130 (= (readNBitsLSBFirstsLoop!0 (_2!13356 lt!444156) nBits!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!13356 lt!444156) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!444271)))

(assert (= (and d!105130 c!15384) b!320986))

(assert (= (and d!105130 (not c!15384)) b!320980))

(assert (= (and d!105130 res!263640) b!320981))

(assert (= (and b!320981 res!263638) b!320983))

(assert (= (and b!320983 res!263637) b!320982))

(assert (= (and b!320982 res!263636) b!320985))

(assert (= (and b!320985 (not res!263639)) b!320984))

(declare-fun m!459337 () Bool)

(assert (=> b!320981 m!459337))

(declare-fun m!459339 () Bool)

(assert (=> b!320981 m!459339))

(assert (=> b!320982 m!459267))

(declare-fun m!459341 () Bool)

(assert (=> b!320984 m!459341))

(declare-fun m!459343 () Bool)

(assert (=> b!320983 m!459343))

(declare-fun m!459345 () Bool)

(assert (=> b!320980 m!459345))

(declare-fun m!459347 () Bool)

(assert (=> b!320980 m!459347))

(assert (=> b!320937 d!105130))

(declare-fun d!105134 () Bool)

(declare-fun lt!444285 () tuple2!23454)

(assert (=> d!105134 (= lt!444285 (readBit!0 thiss!1780))))

(assert (=> d!105134 (= (readBitPure!0 thiss!1780) (tuple2!23459 (_2!13356 lt!444285) (_1!13356 lt!444285)))))

(declare-fun bs!27646 () Bool)

(assert (= bs!27646 d!105134))

(assert (=> bs!27646 m!459273))

(assert (=> b!320941 d!105134))

(check-sat (not d!105104) (not b!320984) (not d!105134) (not b!320980) (not b!320977) (not b!320982) (not d!105102) (not d!105108) (not b!320981) (not b!320983))
