; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!418 () Bool)

(assert start!418)

(declare-fun b!1148 () Bool)

(declare-fun e!678 () Bool)

(declare-datatypes ((array!108 0))(
  ( (array!109 (arr!427 (Array (_ BitVec 32) (_ BitVec 8))) (size!40 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!64 0))(
  ( (BitStream!65 (buf!352 array!108) (currentByte!1286 (_ BitVec 32)) (currentBit!1281 (_ BitVec 32))) )
))
(declare-fun lt!698 () BitStream!64)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1148 (= e!678 (validate_offset_bit!0 ((_ sign_extend 32) (size!40 (buf!352 lt!698))) ((_ sign_extend 32) (currentByte!1286 lt!698)) ((_ sign_extend 32) (currentBit!1281 lt!698))))))

(declare-datatypes ((Unit!25 0))(
  ( (Unit!26) )
))
(declare-datatypes ((tuple2!70 0))(
  ( (tuple2!71 (_1!35 Unit!25) (_2!35 BitStream!64)) )
))
(declare-fun lt!696 () tuple2!70)

(declare-fun thiss!932 () BitStream!64)

(declare-fun readerFrom!0 (BitStream!64 (_ BitVec 32) (_ BitVec 32)) BitStream!64)

(assert (=> b!1148 (= lt!698 (readerFrom!0 (_2!35 lt!696) (currentBit!1281 thiss!932) (currentByte!1286 thiss!932)))))

(declare-fun b!1149 () Bool)

(declare-fun e!681 () Bool)

(declare-fun array_inv!37 (array!108) Bool)

(assert (=> b!1149 (= e!681 (array_inv!37 (buf!352 thiss!932)))))

(declare-fun b!1150 () Bool)

(declare-fun res!3222 () Bool)

(assert (=> b!1150 (=> res!3222 e!678)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!1150 (= res!3222 (not (= (bitIndex!0 (size!40 (buf!352 (_2!35 lt!696))) (currentByte!1286 (_2!35 lt!696)) (currentBit!1281 (_2!35 lt!696))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!40 (buf!352 thiss!932)) (currentByte!1286 thiss!932) (currentBit!1281 thiss!932))))))))

(declare-fun b!1151 () Bool)

(declare-fun res!3217 () Bool)

(assert (=> b!1151 (=> res!3217 e!678)))

(declare-fun isPrefixOf!0 (BitStream!64 BitStream!64) Bool)

(assert (=> b!1151 (= res!3217 (not (isPrefixOf!0 thiss!932 (_2!35 lt!696))))))

(declare-fun b!1152 () Bool)

(declare-fun e!679 () Bool)

(declare-fun e!682 () Bool)

(assert (=> b!1152 (= e!679 e!682)))

(declare-fun res!3221 () Bool)

(assert (=> b!1152 (=> (not res!3221) (not e!682))))

(declare-datatypes ((tuple2!72 0))(
  ( (tuple2!73 (_1!36 BitStream!64) (_2!36 Bool)) )
))
(declare-fun lt!694 () tuple2!72)

(assert (=> b!1152 (= res!3221 (and (_2!36 lt!694) (= (_1!36 lt!694) (_2!35 lt!696))))))

(declare-fun readBitPure!0 (BitStream!64) tuple2!72)

(assert (=> b!1152 (= lt!694 (readBitPure!0 (readerFrom!0 (_2!35 lt!696) (currentBit!1281 thiss!932) (currentByte!1286 thiss!932))))))

(declare-fun res!3219 () Bool)

(declare-fun e!680 () Bool)

(assert (=> start!418 (=> (not res!3219) (not e!680))))

(assert (=> start!418 (= res!3219 (validate_offset_bit!0 ((_ sign_extend 32) (size!40 (buf!352 thiss!932))) ((_ sign_extend 32) (currentByte!1286 thiss!932)) ((_ sign_extend 32) (currentBit!1281 thiss!932))))))

(assert (=> start!418 e!680))

(declare-fun inv!12 (BitStream!64) Bool)

(assert (=> start!418 (and (inv!12 thiss!932) e!681)))

(declare-fun b!1153 () Bool)

(assert (=> b!1153 (= e!680 (not e!678))))

(declare-fun res!3223 () Bool)

(assert (=> b!1153 (=> res!3223 e!678)))

(assert (=> b!1153 (= res!3223 (not (= (size!40 (buf!352 (_2!35 lt!696))) (size!40 (buf!352 thiss!932)))))))

(declare-fun e!677 () Bool)

(assert (=> b!1153 e!677))

(declare-fun res!3220 () Bool)

(assert (=> b!1153 (=> (not res!3220) (not e!677))))

(assert (=> b!1153 (= res!3220 (= (size!40 (buf!352 thiss!932)) (size!40 (buf!352 (_2!35 lt!696)))))))

(declare-fun appendBit!0 (BitStream!64 Bool) tuple2!70)

(assert (=> b!1153 (= lt!696 (appendBit!0 thiss!932 true))))

(declare-fun b!1154 () Bool)

(assert (=> b!1154 (= e!677 e!679)))

(declare-fun res!3218 () Bool)

(assert (=> b!1154 (=> (not res!3218) (not e!679))))

(declare-fun lt!695 () (_ BitVec 64))

(declare-fun lt!697 () (_ BitVec 64))

(assert (=> b!1154 (= res!3218 (= lt!695 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!697)))))

(assert (=> b!1154 (= lt!695 (bitIndex!0 (size!40 (buf!352 (_2!35 lt!696))) (currentByte!1286 (_2!35 lt!696)) (currentBit!1281 (_2!35 lt!696))))))

(assert (=> b!1154 (= lt!697 (bitIndex!0 (size!40 (buf!352 thiss!932)) (currentByte!1286 thiss!932) (currentBit!1281 thiss!932)))))

(declare-fun b!1155 () Bool)

(assert (=> b!1155 (= e!682 (= (bitIndex!0 (size!40 (buf!352 (_1!36 lt!694))) (currentByte!1286 (_1!36 lt!694)) (currentBit!1281 (_1!36 lt!694))) lt!695))))

(declare-fun b!1156 () Bool)

(declare-fun res!3216 () Bool)

(assert (=> b!1156 (=> (not res!3216) (not e!679))))

(assert (=> b!1156 (= res!3216 (isPrefixOf!0 thiss!932 (_2!35 lt!696)))))

(assert (= (and start!418 res!3219) b!1153))

(assert (= (and b!1153 res!3220) b!1154))

(assert (= (and b!1154 res!3218) b!1156))

(assert (= (and b!1156 res!3216) b!1152))

(assert (= (and b!1152 res!3221) b!1155))

(assert (= (and b!1153 (not res!3223)) b!1150))

(assert (= (and b!1150 (not res!3222)) b!1151))

(assert (= (and b!1151 (not res!3217)) b!1148))

(assert (= start!418 b!1149))

(declare-fun m!775 () Bool)

(assert (=> b!1151 m!775))

(declare-fun m!777 () Bool)

(assert (=> b!1148 m!777))

(declare-fun m!779 () Bool)

(assert (=> b!1148 m!779))

(declare-fun m!781 () Bool)

(assert (=> b!1150 m!781))

(declare-fun m!783 () Bool)

(assert (=> b!1150 m!783))

(assert (=> b!1152 m!779))

(assert (=> b!1152 m!779))

(declare-fun m!785 () Bool)

(assert (=> b!1152 m!785))

(declare-fun m!787 () Bool)

(assert (=> start!418 m!787))

(declare-fun m!789 () Bool)

(assert (=> start!418 m!789))

(assert (=> b!1156 m!775))

(assert (=> b!1154 m!781))

(assert (=> b!1154 m!783))

(declare-fun m!791 () Bool)

(assert (=> b!1149 m!791))

(declare-fun m!793 () Bool)

(assert (=> b!1155 m!793))

(declare-fun m!795 () Bool)

(assert (=> b!1153 m!795))

(push 1)

(assert (not start!418))

(assert (not b!1155))

(assert (not b!1148))

(assert (not b!1150))

(assert (not b!1149))

(assert (not b!1154))

(assert (not b!1152))

(assert (not b!1156))

(assert (not b!1151))

(assert (not b!1153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1122 () Bool)

(declare-fun e!736 () Bool)

(assert (=> d!1122 e!736))

(declare-fun res!3291 () Bool)

(assert (=> d!1122 (=> (not res!3291) (not e!736))))

(declare-fun lt!770 () (_ BitVec 64))

(declare-fun lt!768 () (_ BitVec 64))

(declare-fun lt!765 () (_ BitVec 64))

(assert (=> d!1122 (= res!3291 (= lt!765 (bvsub lt!768 lt!770)))))

(assert (=> d!1122 (or (= (bvand lt!768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!770 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!768 lt!770) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1122 (= lt!770 (remainingBits!0 ((_ sign_extend 32) (size!40 (buf!352 (_2!35 lt!696)))) ((_ sign_extend 32) (currentByte!1286 (_2!35 lt!696))) ((_ sign_extend 32) (currentBit!1281 (_2!35 lt!696)))))))

(declare-fun lt!766 () (_ BitVec 64))

(declare-fun lt!769 () (_ BitVec 64))

(assert (=> d!1122 (= lt!768 (bvmul lt!766 lt!769))))

(assert (=> d!1122 (or (= lt!766 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!769 (bvsdiv (bvmul lt!766 lt!769) lt!766)))))

(assert (=> d!1122 (= lt!769 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1122 (= lt!766 ((_ sign_extend 32) (size!40 (buf!352 (_2!35 lt!696)))))))

(assert (=> d!1122 (= lt!765 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1286 (_2!35 lt!696))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1281 (_2!35 lt!696)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!1122 (invariant!0 (currentBit!1281 (_2!35 lt!696)) (currentByte!1286 (_2!35 lt!696)) (size!40 (buf!352 (_2!35 lt!696))))))

(assert (=> d!1122 (= (bitIndex!0 (size!40 (buf!352 (_2!35 lt!696))) (currentByte!1286 (_2!35 lt!696)) (currentBit!1281 (_2!35 lt!696))) lt!765)))

(declare-fun b!1229 () Bool)

(declare-fun res!3290 () Bool)

(assert (=> b!1229 (=> (not res!3290) (not e!736))))

(assert (=> b!1229 (= res!3290 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!765))))

(declare-fun b!1230 () Bool)

(declare-fun lt!767 () (_ BitVec 64))

(assert (=> b!1230 (= e!736 (bvsle lt!765 (bvmul lt!767 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1230 (or (= lt!767 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!767 #b0000000000000000000000000000000000000000000000000000000000001000) lt!767)))))

(assert (=> b!1230 (= lt!767 ((_ sign_extend 32) (size!40 (buf!352 (_2!35 lt!696)))))))

(assert (= (and d!1122 res!3291) b!1229))

(assert (= (and b!1229 res!3290) b!1230))

(declare-fun m!851 () Bool)

(assert (=> d!1122 m!851))

(declare-fun m!853 () Bool)

(assert (=> d!1122 m!853))

(assert (=> b!1154 d!1122))

(declare-fun d!1132 () Bool)

(declare-fun e!737 () Bool)

(assert (=> d!1132 e!737))

(declare-fun res!3293 () Bool)

(assert (=> d!1132 (=> (not res!3293) (not e!737))))

(declare-fun lt!774 () (_ BitVec 64))

(declare-fun lt!776 () (_ BitVec 64))

(declare-fun lt!771 () (_ BitVec 64))

(assert (=> d!1132 (= res!3293 (= lt!771 (bvsub lt!774 lt!776)))))

(assert (=> d!1132 (or (= (bvand lt!774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!776 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!774 lt!776) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1132 (= lt!776 (remainingBits!0 ((_ sign_extend 32) (size!40 (buf!352 thiss!932))) ((_ sign_extend 32) (currentByte!1286 thiss!932)) ((_ sign_extend 32) (currentBit!1281 thiss!932))))))

(declare-fun lt!772 () (_ BitVec 64))

(declare-fun lt!775 () (_ BitVec 64))

(assert (=> d!1132 (= lt!774 (bvmul lt!772 lt!775))))

(assert (=> d!1132 (or (= lt!772 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!775 (bvsdiv (bvmul lt!772 lt!775) lt!772)))))

(assert (=> d!1132 (= lt!775 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1132 (= lt!772 ((_ sign_extend 32) (size!40 (buf!352 thiss!932))))))

(assert (=> d!1132 (= lt!771 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1286 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1281 thiss!932))))))

(assert (=> d!1132 (invariant!0 (currentBit!1281 thiss!932) (currentByte!1286 thiss!932) (size!40 (buf!352 thiss!932)))))

(assert (=> d!1132 (= (bitIndex!0 (size!40 (buf!352 thiss!932)) (currentByte!1286 thiss!932) (currentBit!1281 thiss!932)) lt!771)))

(declare-fun b!1231 () Bool)

(declare-fun res!3292 () Bool)

(assert (=> b!1231 (=> (not res!3292) (not e!737))))

(assert (=> b!1231 (= res!3292 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!771))))

(declare-fun b!1232 () Bool)

(declare-fun lt!773 () (_ BitVec 64))

(assert (=> b!1232 (= e!737 (bvsle lt!771 (bvmul lt!773 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1232 (or (= lt!773 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!773 #b0000000000000000000000000000000000000000000000000000000000001000) lt!773)))))

(assert (=> b!1232 (= lt!773 ((_ sign_extend 32) (size!40 (buf!352 thiss!932))))))

(assert (= (and d!1132 res!3293) b!1231))

(assert (= (and b!1231 res!3292) b!1232))

(declare-fun m!855 () Bool)

(assert (=> d!1132 m!855))

(declare-fun m!857 () Bool)

(assert (=> d!1132 m!857))

(assert (=> b!1154 d!1132))

(declare-fun d!1134 () Bool)

(assert (=> d!1134 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!40 (buf!352 thiss!932))) ((_ sign_extend 32) (currentByte!1286 thiss!932)) ((_ sign_extend 32) (currentBit!1281 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!40 (buf!352 thiss!932))) ((_ sign_extend 32) (currentByte!1286 thiss!932)) ((_ sign_extend 32) (currentBit!1281 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!427 () Bool)

(assert (= bs!427 d!1134))

(assert (=> bs!427 m!855))

(assert (=> start!418 d!1134))

(declare-fun d!1138 () Bool)

(assert (=> d!1138 (= (inv!12 thiss!932) (invariant!0 (currentBit!1281 thiss!932) (currentByte!1286 thiss!932) (size!40 (buf!352 thiss!932))))))

(declare-fun bs!428 () Bool)

(assert (= bs!428 d!1138))

(assert (=> bs!428 m!857))

(assert (=> start!418 d!1138))

(declare-fun d!1140 () Bool)

(assert (=> d!1140 (= (array_inv!37 (buf!352 thiss!932)) (bvsge (size!40 (buf!352 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!1149 d!1140))

(declare-fun d!1144 () Bool)

(declare-fun e!743 () Bool)

(assert (=> d!1144 e!743))

(declare-fun res!3302 () Bool)

(assert (=> d!1144 (=> (not res!3302) (not e!743))))

(declare-fun lt!777 () (_ BitVec 64))

(declare-fun lt!782 () (_ BitVec 64))

(declare-fun lt!780 () (_ BitVec 64))

(assert (=> d!1144 (= res!3302 (= lt!777 (bvsub lt!780 lt!782)))))

(assert (=> d!1144 (or (= (bvand lt!780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!782 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!780 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!780 lt!782) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1144 (= lt!782 (remainingBits!0 ((_ sign_extend 32) (size!40 (buf!352 (_1!36 lt!694)))) ((_ sign_extend 32) (currentByte!1286 (_1!36 lt!694))) ((_ sign_extend 32) (currentBit!1281 (_1!36 lt!694)))))))

(declare-fun lt!778 () (_ BitVec 64))

(declare-fun lt!781 () (_ BitVec 64))

(assert (=> d!1144 (= lt!780 (bvmul lt!778 lt!781))))

(assert (=> d!1144 (or (= lt!778 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!781 (bvsdiv (bvmul lt!778 lt!781) lt!778)))))

(assert (=> d!1144 (= lt!781 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1144 (= lt!778 ((_ sign_extend 32) (size!40 (buf!352 (_1!36 lt!694)))))))

(assert (=> d!1144 (= lt!777 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1286 (_1!36 lt!694))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1281 (_1!36 lt!694)))))))

(assert (=> d!1144 (invariant!0 (currentBit!1281 (_1!36 lt!694)) (currentByte!1286 (_1!36 lt!694)) (size!40 (buf!352 (_1!36 lt!694))))))

(assert (=> d!1144 (= (bitIndex!0 (size!40 (buf!352 (_1!36 lt!694))) (currentByte!1286 (_1!36 lt!694)) (currentBit!1281 (_1!36 lt!694))) lt!777)))

(declare-fun b!1239 () Bool)

(declare-fun res!3301 () Bool)

(assert (=> b!1239 (=> (not res!3301) (not e!743))))

(assert (=> b!1239 (= res!3301 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!777))))

(declare-fun b!1240 () Bool)

(declare-fun lt!779 () (_ BitVec 64))

(assert (=> b!1240 (= e!743 (bvsle lt!777 (bvmul lt!779 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1240 (or (= lt!779 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!779 #b0000000000000000000000000000000000000000000000000000000000001000) lt!779)))))

(assert (=> b!1240 (= lt!779 ((_ sign_extend 32) (size!40 (buf!352 (_1!36 lt!694)))))))

(assert (= (and d!1144 res!3302) b!1239))

(assert (= (and b!1239 res!3301) b!1240))

(declare-fun m!863 () Bool)

(assert (=> d!1144 m!863))

(declare-fun m!865 () Bool)

(assert (=> d!1144 m!865))

(assert (=> b!1155 d!1144))

(assert (=> b!1150 d!1122))

(assert (=> b!1150 d!1132))

(declare-fun d!1146 () Bool)

(declare-fun res!3322 () Bool)

(declare-fun e!757 () Bool)

(assert (=> d!1146 (=> (not res!3322) (not e!757))))

(assert (=> d!1146 (= res!3322 (= (size!40 (buf!352 thiss!932)) (size!40 (buf!352 (_2!35 lt!696)))))))

(assert (=> d!1146 (= (isPrefixOf!0 thiss!932 (_2!35 lt!696)) e!757)))

(declare-fun b!1256 () Bool)

(declare-fun res!3320 () Bool)

(assert (=> b!1256 (=> (not res!3320) (not e!757))))

(assert (=> b!1256 (= res!3320 (bvsle (bitIndex!0 (size!40 (buf!352 thiss!932)) (currentByte!1286 thiss!932) (currentBit!1281 thiss!932)) (bitIndex!0 (size!40 (buf!352 (_2!35 lt!696))) (currentByte!1286 (_2!35 lt!696)) (currentBit!1281 (_2!35 lt!696)))))))

(declare-fun b!1257 () Bool)

(declare-fun e!756 () Bool)

(assert (=> b!1257 (= e!757 e!756)))

(declare-fun res!3321 () Bool)

(assert (=> b!1257 (=> res!3321 e!756)))

(assert (=> b!1257 (= res!3321 (= (size!40 (buf!352 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!1258 () Bool)

(declare-fun arrayBitRangesEq!0 (array!108 array!108 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1258 (= e!756 (arrayBitRangesEq!0 (buf!352 thiss!932) (buf!352 (_2!35 lt!696)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!40 (buf!352 thiss!932)) (currentByte!1286 thiss!932) (currentBit!1281 thiss!932))))))

(assert (= (and d!1146 res!3322) b!1256))

(assert (= (and b!1256 res!3320) b!1257))

(assert (= (and b!1257 (not res!3321)) b!1258))

(assert (=> b!1256 m!783))

(assert (=> b!1256 m!781))

(assert (=> b!1258 m!783))

(assert (=> b!1258 m!783))

(declare-fun m!869 () Bool)

(assert (=> b!1258 m!869))

(assert (=> b!1156 d!1146))

(assert (=> b!1151 d!1146))

(declare-fun d!1150 () Bool)

(declare-datatypes ((tuple2!84 0))(
  ( (tuple2!85 (_1!42 Bool) (_2!42 BitStream!64)) )
))
(declare-fun lt!803 () tuple2!84)

(declare-fun readBit!0 (BitStream!64) tuple2!84)

(assert (=> d!1150 (= lt!803 (readBit!0 (readerFrom!0 (_2!35 lt!696) (currentBit!1281 thiss!932) (currentByte!1286 thiss!932))))))

(assert (=> d!1150 (= (readBitPure!0 (readerFrom!0 (_2!35 lt!696) (currentBit!1281 thiss!932) (currentByte!1286 thiss!932))) (tuple2!73 (_2!42 lt!803) (_1!42 lt!803)))))

(declare-fun bs!429 () Bool)

(assert (= bs!429 d!1150))

(assert (=> bs!429 m!779))

(declare-fun m!875 () Bool)

(assert (=> bs!429 m!875))

(assert (=> b!1152 d!1150))

(declare-fun d!1154 () Bool)

(declare-fun e!762 () Bool)

(assert (=> d!1154 e!762))

(declare-fun res!3332 () Bool)

(assert (=> d!1154 (=> (not res!3332) (not e!762))))

(assert (=> d!1154 (= res!3332 (invariant!0 (currentBit!1281 (_2!35 lt!696)) (currentByte!1286 (_2!35 lt!696)) (size!40 (buf!352 (_2!35 lt!696)))))))

(assert (=> d!1154 (= (readerFrom!0 (_2!35 lt!696) (currentBit!1281 thiss!932) (currentByte!1286 thiss!932)) (BitStream!65 (buf!352 (_2!35 lt!696)) (currentByte!1286 thiss!932) (currentBit!1281 thiss!932)))))

(declare-fun b!1269 () Bool)

(assert (=> b!1269 (= e!762 (invariant!0 (currentBit!1281 thiss!932) (currentByte!1286 thiss!932) (size!40 (buf!352 (_2!35 lt!696)))))))

(assert (= (and d!1154 res!3332) b!1269))

(assert (=> d!1154 m!853))

(declare-fun m!885 () Bool)

(assert (=> b!1269 m!885))

(assert (=> b!1152 d!1154))

(declare-fun b!1309 () Bool)

(declare-fun res!3370 () Bool)

(declare-fun e!781 () Bool)

(assert (=> b!1309 (=> (not res!3370) (not e!781))))

(declare-fun lt!858 () tuple2!70)

(declare-fun lt!860 () (_ BitVec 64))

(declare-fun lt!859 () (_ BitVec 64))

(assert (=> b!1309 (= res!3370 (= (bitIndex!0 (size!40 (buf!352 (_2!35 lt!858))) (currentByte!1286 (_2!35 lt!858)) (currentBit!1281 (_2!35 lt!858))) (bvadd lt!859 lt!860)))))

(assert (=> b!1309 (or (not (= (bvand lt!859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!860 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!859 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!859 lt!860) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1309 (= lt!860 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!1309 (= lt!859 (bitIndex!0 (size!40 (buf!352 thiss!932)) (currentByte!1286 thiss!932) (currentBit!1281 thiss!932)))))

(declare-fun b!1312 () Bool)

(declare-fun e!782 () Bool)

(declare-fun lt!857 () tuple2!72)

(assert (=> b!1312 (= e!782 (= (bitIndex!0 (size!40 (buf!352 (_1!36 lt!857))) (currentByte!1286 (_1!36 lt!857)) (currentBit!1281 (_1!36 lt!857))) (bitIndex!0 (size!40 (buf!352 (_2!35 lt!858))) (currentByte!1286 (_2!35 lt!858)) (currentBit!1281 (_2!35 lt!858)))))))

(declare-fun b!1310 () Bool)

(declare-fun res!3369 () Bool)

(assert (=> b!1310 (=> (not res!3369) (not e!781))))

(assert (=> b!1310 (= res!3369 (isPrefixOf!0 thiss!932 (_2!35 lt!858)))))

(declare-fun d!1164 () Bool)

(assert (=> d!1164 e!781))

(declare-fun res!3372 () Bool)

(assert (=> d!1164 (=> (not res!3372) (not e!781))))

(assert (=> d!1164 (= res!3372 (= (size!40 (buf!352 thiss!932)) (size!40 (buf!352 (_2!35 lt!858)))))))

(declare-fun choose!16 (BitStream!64 Bool) tuple2!70)

(assert (=> d!1164 (= lt!858 (choose!16 thiss!932 true))))

(assert (=> d!1164 (validate_offset_bit!0 ((_ sign_extend 32) (size!40 (buf!352 thiss!932))) ((_ sign_extend 32) (currentByte!1286 thiss!932)) ((_ sign_extend 32) (currentBit!1281 thiss!932)))))

(assert (=> d!1164 (= (appendBit!0 thiss!932 true) lt!858)))

(declare-fun b!1311 () Bool)

(assert (=> b!1311 (= e!781 e!782)))

(declare-fun res!3371 () Bool)

(assert (=> b!1311 (=> (not res!3371) (not e!782))))

(assert (=> b!1311 (= res!3371 (and (= (_2!36 lt!857) true) (= (_1!36 lt!857) (_2!35 lt!858))))))

(assert (=> b!1311 (= lt!857 (readBitPure!0 (readerFrom!0 (_2!35 lt!858) (currentBit!1281 thiss!932) (currentByte!1286 thiss!932))))))

(assert (= (and d!1164 res!3372) b!1309))

(assert (= (and b!1309 res!3370) b!1310))

(assert (= (and b!1310 res!3369) b!1311))

(assert (= (and b!1311 res!3371) b!1312))

(declare-fun m!915 () Bool)

(assert (=> b!1309 m!915))

(assert (=> b!1309 m!783))

(declare-fun m!919 () Bool)

(assert (=> b!1311 m!919))

(assert (=> b!1311 m!919))

(declare-fun m!921 () Bool)

(assert (=> b!1311 m!921))

(declare-fun m!923 () Bool)

(assert (=> d!1164 m!923))

(assert (=> d!1164 m!787))

(declare-fun m!925 () Bool)

(assert (=> b!1310 m!925))

(declare-fun m!927 () Bool)

(assert (=> b!1312 m!927))

(assert (=> b!1312 m!915))

(assert (=> b!1153 d!1164))

(declare-fun d!1180 () Bool)

(assert (=> d!1180 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!40 (buf!352 lt!698))) ((_ sign_extend 32) (currentByte!1286 lt!698)) ((_ sign_extend 32) (currentBit!1281 lt!698))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!40 (buf!352 lt!698))) ((_ sign_extend 32) (currentByte!1286 lt!698)) ((_ sign_extend 32) (currentBit!1281 lt!698))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!435 () Bool)

(assert (= bs!435 d!1180))

(declare-fun m!929 () Bool)

(assert (=> bs!435 m!929))

(assert (=> b!1148 d!1180))

(assert (=> b!1148 d!1154))

(push 1)

(assert (not b!1312))

(assert (not d!1138))

(assert (not d!1180))

(assert (not d!1122))

(assert (not d!1150))

(assert (not d!1154))

(assert (not b!1310))

(assert (not d!1144))

(assert (not b!1309))

(assert (not d!1132))

(assert (not b!1269))

(assert (not b!1311))

(assert (not b!1256))

(assert (not d!1134))

(assert (not d!1164))

(assert (not b!1258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

