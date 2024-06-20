; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!422 () Bool)

(assert start!422)

(declare-fun res!3267 () Bool)

(declare-fun e!725 () Bool)

(assert (=> start!422 (=> (not res!3267) (not e!725))))

(declare-datatypes ((array!112 0))(
  ( (array!113 (arr!429 (Array (_ BitVec 32) (_ BitVec 8))) (size!42 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!68 0))(
  ( (BitStream!69 (buf!354 array!112) (currentByte!1288 (_ BitVec 32)) (currentBit!1283 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!68)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!422 (= res!3267 (validate_offset_bit!0 ((_ sign_extend 32) (size!42 (buf!354 thiss!932))) ((_ sign_extend 32) (currentByte!1288 thiss!932)) ((_ sign_extend 32) (currentBit!1283 thiss!932))))))

(assert (=> start!422 e!725))

(declare-fun e!719 () Bool)

(declare-fun inv!12 (BitStream!68) Bool)

(assert (=> start!422 (and (inv!12 thiss!932) e!719)))

(declare-fun b!1202 () Bool)

(declare-fun res!3264 () Bool)

(declare-fun e!724 () Bool)

(assert (=> b!1202 (=> res!3264 e!724)))

(declare-datatypes ((Unit!29 0))(
  ( (Unit!30) )
))
(declare-datatypes ((tuple2!78 0))(
  ( (tuple2!79 (_1!39 Unit!29) (_2!39 BitStream!68)) )
))
(declare-fun lt!726 () tuple2!78)

(declare-fun isPrefixOf!0 (BitStream!68 BitStream!68) Bool)

(assert (=> b!1202 (= res!3264 (not (isPrefixOf!0 thiss!932 (_2!39 lt!726))))))

(declare-fun b!1203 () Bool)

(declare-fun res!3268 () Bool)

(declare-fun e!720 () Bool)

(assert (=> b!1203 (=> (not res!3268) (not e!720))))

(assert (=> b!1203 (= res!3268 (isPrefixOf!0 thiss!932 (_2!39 lt!726)))))

(declare-fun b!1204 () Bool)

(declare-fun e!722 () Bool)

(assert (=> b!1204 (= e!722 e!720)))

(declare-fun res!3266 () Bool)

(assert (=> b!1204 (=> (not res!3266) (not e!720))))

(declare-fun lt!727 () (_ BitVec 64))

(declare-fun lt!728 () (_ BitVec 64))

(assert (=> b!1204 (= res!3266 (= lt!727 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!728)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!1204 (= lt!727 (bitIndex!0 (size!42 (buf!354 (_2!39 lt!726))) (currentByte!1288 (_2!39 lt!726)) (currentBit!1283 (_2!39 lt!726))))))

(assert (=> b!1204 (= lt!728 (bitIndex!0 (size!42 (buf!354 thiss!932)) (currentByte!1288 thiss!932) (currentBit!1283 thiss!932)))))

(declare-fun b!1205 () Bool)

(assert (=> b!1205 (= e!725 (not e!724))))

(declare-fun res!3269 () Bool)

(assert (=> b!1205 (=> res!3269 e!724)))

(assert (=> b!1205 (= res!3269 (not (= (size!42 (buf!354 (_2!39 lt!726))) (size!42 (buf!354 thiss!932)))))))

(assert (=> b!1205 e!722))

(declare-fun res!3270 () Bool)

(assert (=> b!1205 (=> (not res!3270) (not e!722))))

(assert (=> b!1205 (= res!3270 (= (size!42 (buf!354 thiss!932)) (size!42 (buf!354 (_2!39 lt!726)))))))

(declare-fun appendBit!0 (BitStream!68 Bool) tuple2!78)

(assert (=> b!1205 (= lt!726 (appendBit!0 thiss!932 true))))

(declare-fun b!1206 () Bool)

(declare-fun e!723 () Bool)

(assert (=> b!1206 (= e!720 e!723)))

(declare-fun res!3271 () Bool)

(assert (=> b!1206 (=> (not res!3271) (not e!723))))

(declare-datatypes ((tuple2!80 0))(
  ( (tuple2!81 (_1!40 BitStream!68) (_2!40 Bool)) )
))
(declare-fun lt!725 () tuple2!80)

(assert (=> b!1206 (= res!3271 (and (_2!40 lt!725) (= (_1!40 lt!725) (_2!39 lt!726))))))

(declare-fun readBitPure!0 (BitStream!68) tuple2!80)

(declare-fun readerFrom!0 (BitStream!68 (_ BitVec 32) (_ BitVec 32)) BitStream!68)

(assert (=> b!1206 (= lt!725 (readBitPure!0 (readerFrom!0 (_2!39 lt!726) (currentBit!1283 thiss!932) (currentByte!1288 thiss!932))))))

(declare-fun b!1207 () Bool)

(declare-fun lt!724 () BitStream!68)

(assert (=> b!1207 (= e!724 (validate_offset_bit!0 ((_ sign_extend 32) (size!42 (buf!354 lt!724))) ((_ sign_extend 32) (currentByte!1288 lt!724)) ((_ sign_extend 32) (currentBit!1283 lt!724))))))

(assert (=> b!1207 (= lt!724 (readerFrom!0 (_2!39 lt!726) (currentBit!1283 thiss!932) (currentByte!1288 thiss!932)))))

(declare-fun b!1208 () Bool)

(assert (=> b!1208 (= e!723 (= (bitIndex!0 (size!42 (buf!354 (_1!40 lt!725))) (currentByte!1288 (_1!40 lt!725)) (currentBit!1283 (_1!40 lt!725))) lt!727))))

(declare-fun b!1209 () Bool)

(declare-fun array_inv!39 (array!112) Bool)

(assert (=> b!1209 (= e!719 (array_inv!39 (buf!354 thiss!932)))))

(declare-fun b!1210 () Bool)

(declare-fun res!3265 () Bool)

(assert (=> b!1210 (=> res!3265 e!724)))

(assert (=> b!1210 (= res!3265 (not (= (bitIndex!0 (size!42 (buf!354 (_2!39 lt!726))) (currentByte!1288 (_2!39 lt!726)) (currentBit!1283 (_2!39 lt!726))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!42 (buf!354 thiss!932)) (currentByte!1288 thiss!932) (currentBit!1283 thiss!932))))))))

(assert (= (and start!422 res!3267) b!1205))

(assert (= (and b!1205 res!3270) b!1204))

(assert (= (and b!1204 res!3266) b!1203))

(assert (= (and b!1203 res!3268) b!1206))

(assert (= (and b!1206 res!3271) b!1208))

(assert (= (and b!1205 (not res!3269)) b!1210))

(assert (= (and b!1210 (not res!3265)) b!1202))

(assert (= (and b!1202 (not res!3264)) b!1207))

(assert (= start!422 b!1209))

(declare-fun m!819 () Bool)

(assert (=> start!422 m!819))

(declare-fun m!821 () Bool)

(assert (=> start!422 m!821))

(declare-fun m!823 () Bool)

(assert (=> b!1204 m!823))

(declare-fun m!825 () Bool)

(assert (=> b!1204 m!825))

(declare-fun m!827 () Bool)

(assert (=> b!1208 m!827))

(declare-fun m!829 () Bool)

(assert (=> b!1205 m!829))

(declare-fun m!831 () Bool)

(assert (=> b!1207 m!831))

(declare-fun m!833 () Bool)

(assert (=> b!1207 m!833))

(declare-fun m!835 () Bool)

(assert (=> b!1202 m!835))

(assert (=> b!1206 m!833))

(assert (=> b!1206 m!833))

(declare-fun m!837 () Bool)

(assert (=> b!1206 m!837))

(assert (=> b!1203 m!835))

(assert (=> b!1210 m!823))

(assert (=> b!1210 m!825))

(declare-fun m!839 () Bool)

(assert (=> b!1209 m!839))

(push 1)

(assert (not b!1206))

(assert (not b!1207))

(assert (not b!1205))

(assert (not start!422))

(assert (not b!1203))

(assert (not b!1204))

(assert (not b!1202))

(assert (not b!1208))

(assert (not b!1210))

(assert (not b!1209))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1124 () Bool)

(declare-fun res!3295 () Bool)

(declare-fun e!738 () Bool)

(assert (=> d!1124 (=> (not res!3295) (not e!738))))

(assert (=> d!1124 (= res!3295 (= (size!42 (buf!354 thiss!932)) (size!42 (buf!354 (_2!39 lt!726)))))))

(assert (=> d!1124 (= (isPrefixOf!0 thiss!932 (_2!39 lt!726)) e!738)))

(declare-fun b!1233 () Bool)

(declare-fun res!3296 () Bool)

(assert (=> b!1233 (=> (not res!3296) (not e!738))))

(assert (=> b!1233 (= res!3296 (bvsle (bitIndex!0 (size!42 (buf!354 thiss!932)) (currentByte!1288 thiss!932) (currentBit!1283 thiss!932)) (bitIndex!0 (size!42 (buf!354 (_2!39 lt!726))) (currentByte!1288 (_2!39 lt!726)) (currentBit!1283 (_2!39 lt!726)))))))

(declare-fun b!1234 () Bool)

(declare-fun e!739 () Bool)

(assert (=> b!1234 (= e!738 e!739)))

(declare-fun res!3294 () Bool)

(assert (=> b!1234 (=> res!3294 e!739)))

(assert (=> b!1234 (= res!3294 (= (size!42 (buf!354 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!1235 () Bool)

(declare-fun arrayBitRangesEq!0 (array!112 array!112 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1235 (= e!739 (arrayBitRangesEq!0 (buf!354 thiss!932) (buf!354 (_2!39 lt!726)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!42 (buf!354 thiss!932)) (currentByte!1288 thiss!932) (currentBit!1283 thiss!932))))))

(assert (= (and d!1124 res!3295) b!1233))

(assert (= (and b!1233 res!3296) b!1234))

(assert (= (and b!1234 (not res!3294)) b!1235))

(assert (=> b!1233 m!825))

(assert (=> b!1233 m!823))

(assert (=> b!1235 m!825))

(assert (=> b!1235 m!825))

(declare-fun m!859 () Bool)

(assert (=> b!1235 m!859))

(assert (=> b!1202 d!1124))

(declare-fun d!1136 () Bool)

(declare-fun e!758 () Bool)

(assert (=> d!1136 e!758))

(declare-fun res!3326 () Bool)

(assert (=> d!1136 (=> (not res!3326) (not e!758))))

(declare-fun lt!799 () (_ BitVec 64))

(declare-fun lt!796 () (_ BitVec 64))

(declare-fun lt!797 () (_ BitVec 64))

(assert (=> d!1136 (= res!3326 (= lt!797 (bvsub lt!796 lt!799)))))

(assert (=> d!1136 (or (= (bvand lt!796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!799 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!796 lt!799) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1136 (= lt!799 (remainingBits!0 ((_ sign_extend 32) (size!42 (buf!354 (_1!40 lt!725)))) ((_ sign_extend 32) (currentByte!1288 (_1!40 lt!725))) ((_ sign_extend 32) (currentBit!1283 (_1!40 lt!725)))))))

(declare-fun lt!798 () (_ BitVec 64))

(declare-fun lt!800 () (_ BitVec 64))

(assert (=> d!1136 (= lt!796 (bvmul lt!798 lt!800))))

(assert (=> d!1136 (or (= lt!798 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!800 (bvsdiv (bvmul lt!798 lt!800) lt!798)))))

(assert (=> d!1136 (= lt!800 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1136 (= lt!798 ((_ sign_extend 32) (size!42 (buf!354 (_1!40 lt!725)))))))

(assert (=> d!1136 (= lt!797 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1288 (_1!40 lt!725))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1283 (_1!40 lt!725)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!1136 (invariant!0 (currentBit!1283 (_1!40 lt!725)) (currentByte!1288 (_1!40 lt!725)) (size!42 (buf!354 (_1!40 lt!725))))))

(assert (=> d!1136 (= (bitIndex!0 (size!42 (buf!354 (_1!40 lt!725))) (currentByte!1288 (_1!40 lt!725)) (currentBit!1283 (_1!40 lt!725))) lt!797)))

(declare-fun b!1263 () Bool)

(declare-fun res!3325 () Bool)

(assert (=> b!1263 (=> (not res!3325) (not e!758))))

(assert (=> b!1263 (= res!3325 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!797))))

(declare-fun b!1264 () Bool)

(declare-fun lt!795 () (_ BitVec 64))

(assert (=> b!1264 (= e!758 (bvsle lt!797 (bvmul lt!795 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1264 (or (= lt!795 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!795 #b0000000000000000000000000000000000000000000000000000000000001000) lt!795)))))

(assert (=> b!1264 (= lt!795 ((_ sign_extend 32) (size!42 (buf!354 (_1!40 lt!725)))))))

(assert (= (and d!1136 res!3326) b!1263))

(assert (= (and b!1263 res!3325) b!1264))

(declare-fun m!871 () Bool)

(assert (=> d!1136 m!871))

(declare-fun m!873 () Bool)

(assert (=> d!1136 m!873))

(assert (=> b!1208 d!1136))

(declare-fun d!1152 () Bool)

(assert (=> d!1152 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!42 (buf!354 thiss!932))) ((_ sign_extend 32) (currentByte!1288 thiss!932)) ((_ sign_extend 32) (currentBit!1283 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!42 (buf!354 thiss!932))) ((_ sign_extend 32) (currentByte!1288 thiss!932)) ((_ sign_extend 32) (currentBit!1283 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!430 () Bool)

(assert (= bs!430 d!1152))

(declare-fun m!877 () Bool)

(assert (=> bs!430 m!877))

(assert (=> start!422 d!1152))

(declare-fun d!1156 () Bool)

(assert (=> d!1156 (= (inv!12 thiss!932) (invariant!0 (currentBit!1283 thiss!932) (currentByte!1288 thiss!932) (size!42 (buf!354 thiss!932))))))

(declare-fun bs!431 () Bool)

(assert (= bs!431 d!1156))

(declare-fun m!879 () Bool)

(assert (=> bs!431 m!879))

(assert (=> start!422 d!1156))

(assert (=> b!1203 d!1124))

(declare-fun d!1158 () Bool)

(assert (=> d!1158 (= (array_inv!39 (buf!354 thiss!932)) (bvsge (size!42 (buf!354 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!1209 d!1158))

(declare-fun d!1160 () Bool)

(declare-fun e!761 () Bool)

(assert (=> d!1160 e!761))

(declare-fun res!3331 () Bool)

(assert (=> d!1160 (=> (not res!3331) (not e!761))))

(declare-fun lt!805 () (_ BitVec 64))

(declare-fun lt!808 () (_ BitVec 64))

(declare-fun lt!806 () (_ BitVec 64))

(assert (=> d!1160 (= res!3331 (= lt!806 (bvsub lt!805 lt!808)))))

(assert (=> d!1160 (or (= (bvand lt!805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!808 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!805 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!805 lt!808) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1160 (= lt!808 (remainingBits!0 ((_ sign_extend 32) (size!42 (buf!354 (_2!39 lt!726)))) ((_ sign_extend 32) (currentByte!1288 (_2!39 lt!726))) ((_ sign_extend 32) (currentBit!1283 (_2!39 lt!726)))))))

(declare-fun lt!807 () (_ BitVec 64))

(declare-fun lt!809 () (_ BitVec 64))

(assert (=> d!1160 (= lt!805 (bvmul lt!807 lt!809))))

(assert (=> d!1160 (or (= lt!807 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!809 (bvsdiv (bvmul lt!807 lt!809) lt!807)))))

(assert (=> d!1160 (= lt!809 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1160 (= lt!807 ((_ sign_extend 32) (size!42 (buf!354 (_2!39 lt!726)))))))

(assert (=> d!1160 (= lt!806 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1288 (_2!39 lt!726))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1283 (_2!39 lt!726)))))))

(assert (=> d!1160 (invariant!0 (currentBit!1283 (_2!39 lt!726)) (currentByte!1288 (_2!39 lt!726)) (size!42 (buf!354 (_2!39 lt!726))))))

(assert (=> d!1160 (= (bitIndex!0 (size!42 (buf!354 (_2!39 lt!726))) (currentByte!1288 (_2!39 lt!726)) (currentBit!1283 (_2!39 lt!726))) lt!806)))

(declare-fun b!1267 () Bool)

(declare-fun res!3330 () Bool)

(assert (=> b!1267 (=> (not res!3330) (not e!761))))

(assert (=> b!1267 (= res!3330 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!806))))

(declare-fun b!1268 () Bool)

(declare-fun lt!804 () (_ BitVec 64))

(assert (=> b!1268 (= e!761 (bvsle lt!806 (bvmul lt!804 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1268 (or (= lt!804 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!804 #b0000000000000000000000000000000000000000000000000000000000001000) lt!804)))))

(assert (=> b!1268 (= lt!804 ((_ sign_extend 32) (size!42 (buf!354 (_2!39 lt!726)))))))

(assert (= (and d!1160 res!3331) b!1267))

(assert (= (and b!1267 res!3330) b!1268))

(declare-fun m!881 () Bool)

(assert (=> d!1160 m!881))

(declare-fun m!883 () Bool)

(assert (=> d!1160 m!883))

(assert (=> b!1204 d!1160))

(declare-fun d!1162 () Bool)

(declare-fun e!763 () Bool)

(assert (=> d!1162 e!763))

(declare-fun res!3334 () Bool)

(assert (=> d!1162 (=> (not res!3334) (not e!763))))

(declare-fun lt!812 () (_ BitVec 64))

(declare-fun lt!811 () (_ BitVec 64))

(declare-fun lt!814 () (_ BitVec 64))

(assert (=> d!1162 (= res!3334 (= lt!812 (bvsub lt!811 lt!814)))))

(assert (=> d!1162 (or (= (bvand lt!811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!814 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!811 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!811 lt!814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1162 (= lt!814 (remainingBits!0 ((_ sign_extend 32) (size!42 (buf!354 thiss!932))) ((_ sign_extend 32) (currentByte!1288 thiss!932)) ((_ sign_extend 32) (currentBit!1283 thiss!932))))))

(declare-fun lt!813 () (_ BitVec 64))

(declare-fun lt!815 () (_ BitVec 64))

(assert (=> d!1162 (= lt!811 (bvmul lt!813 lt!815))))

(assert (=> d!1162 (or (= lt!813 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!815 (bvsdiv (bvmul lt!813 lt!815) lt!813)))))

(assert (=> d!1162 (= lt!815 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1162 (= lt!813 ((_ sign_extend 32) (size!42 (buf!354 thiss!932))))))

(assert (=> d!1162 (= lt!812 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1288 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1283 thiss!932))))))

(assert (=> d!1162 (invariant!0 (currentBit!1283 thiss!932) (currentByte!1288 thiss!932) (size!42 (buf!354 thiss!932)))))

(assert (=> d!1162 (= (bitIndex!0 (size!42 (buf!354 thiss!932)) (currentByte!1288 thiss!932) (currentBit!1283 thiss!932)) lt!812)))

(declare-fun b!1270 () Bool)

(declare-fun res!3333 () Bool)

(assert (=> b!1270 (=> (not res!3333) (not e!763))))

(assert (=> b!1270 (= res!3333 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!812))))

(declare-fun b!1271 () Bool)

(declare-fun lt!810 () (_ BitVec 64))

(assert (=> b!1271 (= e!763 (bvsle lt!812 (bvmul lt!810 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1271 (or (= lt!810 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!810 #b0000000000000000000000000000000000000000000000000000000000001000) lt!810)))))

(assert (=> b!1271 (= lt!810 ((_ sign_extend 32) (size!42 (buf!354 thiss!932))))))

(assert (= (and d!1162 res!3334) b!1270))

(assert (= (and b!1270 res!3333) b!1271))

(assert (=> d!1162 m!877))

(assert (=> d!1162 m!879))

(assert (=> b!1204 d!1162))

(assert (=> b!1210 d!1160))

(assert (=> b!1210 d!1162))

(declare-fun d!1166 () Bool)

(declare-fun e!780 () Bool)

(assert (=> d!1166 e!780))

(declare-fun res!3365 () Bool)

(assert (=> d!1166 (=> (not res!3365) (not e!780))))

(declare-fun lt!853 () tuple2!78)

(assert (=> d!1166 (= res!3365 (= (size!42 (buf!354 thiss!932)) (size!42 (buf!354 (_2!39 lt!853)))))))

(declare-fun choose!16 (BitStream!68 Bool) tuple2!78)

(assert (=> d!1166 (= lt!853 (choose!16 thiss!932 true))))

(assert (=> d!1166 (validate_offset_bit!0 ((_ sign_extend 32) (size!42 (buf!354 thiss!932))) ((_ sign_extend 32) (currentByte!1288 thiss!932)) ((_ sign_extend 32) (currentBit!1283 thiss!932)))))

(assert (=> d!1166 (= (appendBit!0 thiss!932 true) lt!853)))

(declare-fun b!1306 () Bool)

(declare-fun res!3366 () Bool)

(assert (=> b!1306 (=> (not res!3366) (not e!780))))

(assert (=> b!1306 (= res!3366 (isPrefixOf!0 thiss!932 (_2!39 lt!853)))))

(declare-fun b!1307 () Bool)

(declare-fun e!779 () Bool)

(assert (=> b!1307 (= e!780 e!779)))

(declare-fun res!3367 () Bool)

(assert (=> b!1307 (=> (not res!3367) (not e!779))))

(declare-fun lt!854 () tuple2!80)

(assert (=> b!1307 (= res!3367 (and (= (_2!40 lt!854) true) (= (_1!40 lt!854) (_2!39 lt!853))))))

(assert (=> b!1307 (= lt!854 (readBitPure!0 (readerFrom!0 (_2!39 lt!853) (currentBit!1283 thiss!932) (currentByte!1288 thiss!932))))))

(declare-fun b!1305 () Bool)

(declare-fun res!3368 () Bool)

(assert (=> b!1305 (=> (not res!3368) (not e!780))))

(declare-fun lt!855 () (_ BitVec 64))

(declare-fun lt!856 () (_ BitVec 64))

(assert (=> b!1305 (= res!3368 (= (bitIndex!0 (size!42 (buf!354 (_2!39 lt!853))) (currentByte!1288 (_2!39 lt!853)) (currentBit!1283 (_2!39 lt!853))) (bvadd lt!856 lt!855)))))

(assert (=> b!1305 (or (not (= (bvand lt!856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!855 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!856 lt!855) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1305 (= lt!855 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!1305 (= lt!856 (bitIndex!0 (size!42 (buf!354 thiss!932)) (currentByte!1288 thiss!932) (currentBit!1283 thiss!932)))))

(declare-fun b!1308 () Bool)

(assert (=> b!1308 (= e!779 (= (bitIndex!0 (size!42 (buf!354 (_1!40 lt!854))) (currentByte!1288 (_1!40 lt!854)) (currentBit!1283 (_1!40 lt!854))) (bitIndex!0 (size!42 (buf!354 (_2!39 lt!853))) (currentByte!1288 (_2!39 lt!853)) (currentBit!1283 (_2!39 lt!853)))))))

(assert (= (and d!1166 res!3365) b!1305))

(assert (= (and b!1305 res!3368) b!1306))

(assert (= (and b!1306 res!3366) b!1307))

(assert (= (and b!1307 res!3367) b!1308))

(declare-fun m!905 () Bool)

(assert (=> b!1305 m!905))

(assert (=> b!1305 m!825))

(declare-fun m!907 () Bool)

(assert (=> b!1307 m!907))

(assert (=> b!1307 m!907))

(declare-fun m!909 () Bool)

(assert (=> b!1307 m!909))

(declare-fun m!911 () Bool)

(assert (=> b!1306 m!911))

(declare-fun m!913 () Bool)

(assert (=> d!1166 m!913))

(assert (=> d!1166 m!819))

(declare-fun m!917 () Bool)

(assert (=> b!1308 m!917))

(assert (=> b!1308 m!905))

(assert (=> b!1205 d!1166))

(declare-fun d!1178 () Bool)

(declare-datatypes ((tuple2!86 0))(
  ( (tuple2!87 (_1!43 Bool) (_2!43 BitStream!68)) )
))
(declare-fun lt!863 () tuple2!86)

(declare-fun readBit!0 (BitStream!68) tuple2!86)

(assert (=> d!1178 (= lt!863 (readBit!0 (readerFrom!0 (_2!39 lt!726) (currentBit!1283 thiss!932) (currentByte!1288 thiss!932))))))

(assert (=> d!1178 (= (readBitPure!0 (readerFrom!0 (_2!39 lt!726) (currentBit!1283 thiss!932) (currentByte!1288 thiss!932))) (tuple2!81 (_2!43 lt!863) (_1!43 lt!863)))))

(declare-fun bs!436 () Bool)

(assert (= bs!436 d!1178))

(assert (=> bs!436 m!833))

(declare-fun m!931 () Bool)

(assert (=> bs!436 m!931))

(assert (=> b!1206 d!1178))

(declare-fun d!1182 () Bool)

(declare-fun e!785 () Bool)

(assert (=> d!1182 e!785))

(declare-fun res!3376 () Bool)

(assert (=> d!1182 (=> (not res!3376) (not e!785))))

(assert (=> d!1182 (= res!3376 (invariant!0 (currentBit!1283 (_2!39 lt!726)) (currentByte!1288 (_2!39 lt!726)) (size!42 (buf!354 (_2!39 lt!726)))))))

(assert (=> d!1182 (= (readerFrom!0 (_2!39 lt!726) (currentBit!1283 thiss!932) (currentByte!1288 thiss!932)) (BitStream!69 (buf!354 (_2!39 lt!726)) (currentByte!1288 thiss!932) (currentBit!1283 thiss!932)))))

(declare-fun b!1315 () Bool)

(assert (=> b!1315 (= e!785 (invariant!0 (currentBit!1283 thiss!932) (currentByte!1288 thiss!932) (size!42 (buf!354 (_2!39 lt!726)))))))

(assert (= (and d!1182 res!3376) b!1315))

(assert (=> d!1182 m!883))

(declare-fun m!933 () Bool)

(assert (=> b!1315 m!933))

(assert (=> b!1206 d!1182))

(declare-fun d!1184 () Bool)

(assert (=> d!1184 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!42 (buf!354 lt!724))) ((_ sign_extend 32) (currentByte!1288 lt!724)) ((_ sign_extend 32) (currentBit!1283 lt!724))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!42 (buf!354 lt!724))) ((_ sign_extend 32) (currentByte!1288 lt!724)) ((_ sign_extend 32) (currentBit!1283 lt!724))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!437 () Bool)

(assert (= bs!437 d!1184))

(declare-fun m!935 () Bool)

(assert (=> bs!437 m!935))

(assert (=> b!1207 d!1184))

(assert (=> b!1207 d!1182))

(push 1)

(assert (not d!1184))

(assert (not d!1136))

(assert (not d!1162))

(assert (not b!1315))

(assert (not d!1182))

(assert (not d!1166))

(assert (not b!1305))

(assert (not b!1307))

(assert (not b!1235))

(assert (not d!1160))

(assert (not b!1233))

(assert (not d!1152))

(assert (not b!1308))

(assert (not d!1156))

(assert (not d!1178))

(assert (not b!1306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

