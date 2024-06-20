; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!420 () Bool)

(assert start!420)

(declare-fun b!1175 () Bool)

(declare-fun e!698 () Bool)

(declare-fun e!702 () Bool)

(assert (=> b!1175 (= e!698 (not e!702))))

(declare-fun res!3243 () Bool)

(assert (=> b!1175 (=> res!3243 e!702)))

(declare-datatypes ((array!110 0))(
  ( (array!111 (arr!428 (Array (_ BitVec 32) (_ BitVec 8))) (size!41 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!66 0))(
  ( (BitStream!67 (buf!353 array!110) (currentByte!1287 (_ BitVec 32)) (currentBit!1282 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!27 0))(
  ( (Unit!28) )
))
(declare-datatypes ((tuple2!74 0))(
  ( (tuple2!75 (_1!37 Unit!27) (_2!37 BitStream!66)) )
))
(declare-fun lt!713 () tuple2!74)

(declare-fun thiss!932 () BitStream!66)

(assert (=> b!1175 (= res!3243 (not (= (size!41 (buf!353 (_2!37 lt!713))) (size!41 (buf!353 thiss!932)))))))

(declare-fun e!701 () Bool)

(assert (=> b!1175 e!701))

(declare-fun res!3245 () Bool)

(assert (=> b!1175 (=> (not res!3245) (not e!701))))

(assert (=> b!1175 (= res!3245 (= (size!41 (buf!353 thiss!932)) (size!41 (buf!353 (_2!37 lt!713)))))))

(declare-fun appendBit!0 (BitStream!66 Bool) tuple2!74)

(assert (=> b!1175 (= lt!713 (appendBit!0 thiss!932 true))))

(declare-fun b!1176 () Bool)

(declare-fun res!3244 () Bool)

(assert (=> b!1176 (=> res!3244 e!702)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!1176 (= res!3244 (not (= (bitIndex!0 (size!41 (buf!353 (_2!37 lt!713))) (currentByte!1287 (_2!37 lt!713)) (currentBit!1282 (_2!37 lt!713))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!41 (buf!353 thiss!932)) (currentByte!1287 thiss!932) (currentBit!1282 thiss!932))))))))

(declare-fun b!1177 () Bool)

(declare-fun e!699 () Bool)

(declare-fun array_inv!38 (array!110) Bool)

(assert (=> b!1177 (= e!699 (array_inv!38 (buf!353 thiss!932)))))

(declare-fun b!1178 () Bool)

(declare-fun e!704 () Bool)

(assert (=> b!1178 (= e!701 e!704)))

(declare-fun res!3241 () Bool)

(assert (=> b!1178 (=> (not res!3241) (not e!704))))

(declare-fun lt!709 () (_ BitVec 64))

(declare-fun lt!711 () (_ BitVec 64))

(assert (=> b!1178 (= res!3241 (= lt!709 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!711)))))

(assert (=> b!1178 (= lt!709 (bitIndex!0 (size!41 (buf!353 (_2!37 lt!713))) (currentByte!1287 (_2!37 lt!713)) (currentBit!1282 (_2!37 lt!713))))))

(assert (=> b!1178 (= lt!711 (bitIndex!0 (size!41 (buf!353 thiss!932)) (currentByte!1287 thiss!932) (currentBit!1282 thiss!932)))))

(declare-fun b!1179 () Bool)

(declare-fun lt!710 () BitStream!66)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1179 (= e!702 (validate_offset_bit!0 ((_ sign_extend 32) (size!41 (buf!353 lt!710))) ((_ sign_extend 32) (currentByte!1287 lt!710)) ((_ sign_extend 32) (currentBit!1282 lt!710))))))

(declare-fun readerFrom!0 (BitStream!66 (_ BitVec 32) (_ BitVec 32)) BitStream!66)

(assert (=> b!1179 (= lt!710 (readerFrom!0 (_2!37 lt!713) (currentBit!1282 thiss!932) (currentByte!1287 thiss!932)))))

(declare-fun b!1180 () Bool)

(declare-fun res!3242 () Bool)

(assert (=> b!1180 (=> res!3242 e!702)))

(declare-fun isPrefixOf!0 (BitStream!66 BitStream!66) Bool)

(assert (=> b!1180 (= res!3242 (not (isPrefixOf!0 thiss!932 (_2!37 lt!713))))))

(declare-fun b!1181 () Bool)

(declare-fun e!700 () Bool)

(declare-datatypes ((tuple2!76 0))(
  ( (tuple2!77 (_1!38 BitStream!66) (_2!38 Bool)) )
))
(declare-fun lt!712 () tuple2!76)

(assert (=> b!1181 (= e!700 (= (bitIndex!0 (size!41 (buf!353 (_1!38 lt!712))) (currentByte!1287 (_1!38 lt!712)) (currentBit!1282 (_1!38 lt!712))) lt!709))))

(declare-fun b!1182 () Bool)

(assert (=> b!1182 (= e!704 e!700)))

(declare-fun res!3246 () Bool)

(assert (=> b!1182 (=> (not res!3246) (not e!700))))

(assert (=> b!1182 (= res!3246 (and (_2!38 lt!712) (= (_1!38 lt!712) (_2!37 lt!713))))))

(declare-fun readBitPure!0 (BitStream!66) tuple2!76)

(assert (=> b!1182 (= lt!712 (readBitPure!0 (readerFrom!0 (_2!37 lt!713) (currentBit!1282 thiss!932) (currentByte!1287 thiss!932))))))

(declare-fun b!1183 () Bool)

(declare-fun res!3240 () Bool)

(assert (=> b!1183 (=> (not res!3240) (not e!704))))

(assert (=> b!1183 (= res!3240 (isPrefixOf!0 thiss!932 (_2!37 lt!713)))))

(declare-fun res!3247 () Bool)

(assert (=> start!420 (=> (not res!3247) (not e!698))))

(assert (=> start!420 (= res!3247 (validate_offset_bit!0 ((_ sign_extend 32) (size!41 (buf!353 thiss!932))) ((_ sign_extend 32) (currentByte!1287 thiss!932)) ((_ sign_extend 32) (currentBit!1282 thiss!932))))))

(assert (=> start!420 e!698))

(declare-fun inv!12 (BitStream!66) Bool)

(assert (=> start!420 (and (inv!12 thiss!932) e!699)))

(assert (= (and start!420 res!3247) b!1175))

(assert (= (and b!1175 res!3245) b!1178))

(assert (= (and b!1178 res!3241) b!1183))

(assert (= (and b!1183 res!3240) b!1182))

(assert (= (and b!1182 res!3246) b!1181))

(assert (= (and b!1175 (not res!3243)) b!1176))

(assert (= (and b!1176 (not res!3244)) b!1180))

(assert (= (and b!1180 (not res!3242)) b!1179))

(assert (= start!420 b!1177))

(declare-fun m!797 () Bool)

(assert (=> start!420 m!797))

(declare-fun m!799 () Bool)

(assert (=> start!420 m!799))

(declare-fun m!801 () Bool)

(assert (=> b!1183 m!801))

(declare-fun m!803 () Bool)

(assert (=> b!1177 m!803))

(assert (=> b!1180 m!801))

(declare-fun m!805 () Bool)

(assert (=> b!1176 m!805))

(declare-fun m!807 () Bool)

(assert (=> b!1176 m!807))

(declare-fun m!809 () Bool)

(assert (=> b!1182 m!809))

(assert (=> b!1182 m!809))

(declare-fun m!811 () Bool)

(assert (=> b!1182 m!811))

(declare-fun m!813 () Bool)

(assert (=> b!1175 m!813))

(assert (=> b!1178 m!805))

(assert (=> b!1178 m!807))

(declare-fun m!815 () Bool)

(assert (=> b!1179 m!815))

(assert (=> b!1179 m!809))

(declare-fun m!817 () Bool)

(assert (=> b!1181 m!817))

(check-sat (not b!1176) (not b!1181) (not b!1183) (not b!1179) (not b!1180) (not start!420) (not b!1177) (not b!1178) (not b!1175) (not b!1182))
(check-sat)
(get-model)

(declare-fun d!1120 () Bool)

(declare-fun e!728 () Bool)

(assert (=> d!1120 e!728))

(declare-fun res!3276 () Bool)

(assert (=> d!1120 (=> (not res!3276) (not e!728))))

(declare-fun lt!743 () (_ BitVec 64))

(declare-fun lt!745 () (_ BitVec 64))

(declare-fun lt!744 () (_ BitVec 64))

(assert (=> d!1120 (= res!3276 (= lt!744 (bvsub lt!743 lt!745)))))

(assert (=> d!1120 (or (= (bvand lt!743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!745 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!743 lt!745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1120 (= lt!745 (remainingBits!0 ((_ sign_extend 32) (size!41 (buf!353 (_2!37 lt!713)))) ((_ sign_extend 32) (currentByte!1287 (_2!37 lt!713))) ((_ sign_extend 32) (currentBit!1282 (_2!37 lt!713)))))))

(declare-fun lt!748 () (_ BitVec 64))

(declare-fun lt!746 () (_ BitVec 64))

(assert (=> d!1120 (= lt!743 (bvmul lt!748 lt!746))))

(assert (=> d!1120 (or (= lt!748 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!746 (bvsdiv (bvmul lt!748 lt!746) lt!748)))))

(assert (=> d!1120 (= lt!746 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1120 (= lt!748 ((_ sign_extend 32) (size!41 (buf!353 (_2!37 lt!713)))))))

(assert (=> d!1120 (= lt!744 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1287 (_2!37 lt!713))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1282 (_2!37 lt!713)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!1120 (invariant!0 (currentBit!1282 (_2!37 lt!713)) (currentByte!1287 (_2!37 lt!713)) (size!41 (buf!353 (_2!37 lt!713))))))

(assert (=> d!1120 (= (bitIndex!0 (size!41 (buf!353 (_2!37 lt!713))) (currentByte!1287 (_2!37 lt!713)) (currentBit!1282 (_2!37 lt!713))) lt!744)))

(declare-fun b!1215 () Bool)

(declare-fun res!3277 () Bool)

(assert (=> b!1215 (=> (not res!3277) (not e!728))))

(assert (=> b!1215 (= res!3277 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!744))))

(declare-fun b!1216 () Bool)

(declare-fun lt!747 () (_ BitVec 64))

(assert (=> b!1216 (= e!728 (bvsle lt!744 (bvmul lt!747 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1216 (or (= lt!747 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!747 #b0000000000000000000000000000000000000000000000000000000000001000) lt!747)))))

(assert (=> b!1216 (= lt!747 ((_ sign_extend 32) (size!41 (buf!353 (_2!37 lt!713)))))))

(assert (= (and d!1120 res!3276) b!1215))

(assert (= (and b!1215 res!3277) b!1216))

(declare-fun m!841 () Bool)

(assert (=> d!1120 m!841))

(declare-fun m!843 () Bool)

(assert (=> d!1120 m!843))

(assert (=> b!1178 d!1120))

(declare-fun d!1126 () Bool)

(declare-fun e!731 () Bool)

(assert (=> d!1126 e!731))

(declare-fun res!3282 () Bool)

(assert (=> d!1126 (=> (not res!3282) (not e!731))))

(declare-fun lt!759 () (_ BitVec 64))

(declare-fun lt!760 () (_ BitVec 64))

(declare-fun lt!761 () (_ BitVec 64))

(assert (=> d!1126 (= res!3282 (= lt!760 (bvsub lt!759 lt!761)))))

(assert (=> d!1126 (or (= (bvand lt!759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!761 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!759 lt!761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1126 (= lt!761 (remainingBits!0 ((_ sign_extend 32) (size!41 (buf!353 thiss!932))) ((_ sign_extend 32) (currentByte!1287 thiss!932)) ((_ sign_extend 32) (currentBit!1282 thiss!932))))))

(declare-fun lt!764 () (_ BitVec 64))

(declare-fun lt!762 () (_ BitVec 64))

(assert (=> d!1126 (= lt!759 (bvmul lt!764 lt!762))))

(assert (=> d!1126 (or (= lt!764 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!762 (bvsdiv (bvmul lt!764 lt!762) lt!764)))))

(assert (=> d!1126 (= lt!762 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1126 (= lt!764 ((_ sign_extend 32) (size!41 (buf!353 thiss!932))))))

(assert (=> d!1126 (= lt!760 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1287 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1282 thiss!932))))))

(assert (=> d!1126 (invariant!0 (currentBit!1282 thiss!932) (currentByte!1287 thiss!932) (size!41 (buf!353 thiss!932)))))

(assert (=> d!1126 (= (bitIndex!0 (size!41 (buf!353 thiss!932)) (currentByte!1287 thiss!932) (currentBit!1282 thiss!932)) lt!760)))

(declare-fun b!1221 () Bool)

(declare-fun res!3283 () Bool)

(assert (=> b!1221 (=> (not res!3283) (not e!731))))

(assert (=> b!1221 (= res!3283 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!760))))

(declare-fun b!1222 () Bool)

(declare-fun lt!763 () (_ BitVec 64))

(assert (=> b!1222 (= e!731 (bvsle lt!760 (bvmul lt!763 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1222 (or (= lt!763 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!763 #b0000000000000000000000000000000000000000000000000000000000001000) lt!763)))))

(assert (=> b!1222 (= lt!763 ((_ sign_extend 32) (size!41 (buf!353 thiss!932))))))

(assert (= (and d!1126 res!3282) b!1221))

(assert (= (and b!1221 res!3283) b!1222))

(declare-fun m!845 () Bool)

(assert (=> d!1126 m!845))

(declare-fun m!847 () Bool)

(assert (=> d!1126 m!847))

(assert (=> b!1178 d!1126))

(declare-fun d!1128 () Bool)

(assert (=> d!1128 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!41 (buf!353 lt!710))) ((_ sign_extend 32) (currentByte!1287 lt!710)) ((_ sign_extend 32) (currentBit!1282 lt!710))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!41 (buf!353 lt!710))) ((_ sign_extend 32) (currentByte!1287 lt!710)) ((_ sign_extend 32) (currentBit!1282 lt!710))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!426 () Bool)

(assert (= bs!426 d!1128))

(declare-fun m!849 () Bool)

(assert (=> bs!426 m!849))

(assert (=> b!1179 d!1128))

(declare-fun d!1130 () Bool)

(declare-fun e!742 () Bool)

(assert (=> d!1130 e!742))

(declare-fun res!3300 () Bool)

(assert (=> d!1130 (=> (not res!3300) (not e!742))))

(assert (=> d!1130 (= res!3300 (invariant!0 (currentBit!1282 (_2!37 lt!713)) (currentByte!1287 (_2!37 lt!713)) (size!41 (buf!353 (_2!37 lt!713)))))))

(assert (=> d!1130 (= (readerFrom!0 (_2!37 lt!713) (currentBit!1282 thiss!932) (currentByte!1287 thiss!932)) (BitStream!67 (buf!353 (_2!37 lt!713)) (currentByte!1287 thiss!932) (currentBit!1282 thiss!932)))))

(declare-fun b!1238 () Bool)

(assert (=> b!1238 (= e!742 (invariant!0 (currentBit!1282 thiss!932) (currentByte!1287 thiss!932) (size!41 (buf!353 (_2!37 lt!713)))))))

(assert (= (and d!1130 res!3300) b!1238))

(assert (=> d!1130 m!843))

(declare-fun m!861 () Bool)

(assert (=> b!1238 m!861))

(assert (=> b!1179 d!1130))

(declare-fun d!1142 () Bool)

(declare-fun res!3317 () Bool)

(declare-fun e!752 () Bool)

(assert (=> d!1142 (=> (not res!3317) (not e!752))))

(assert (=> d!1142 (= res!3317 (= (size!41 (buf!353 thiss!932)) (size!41 (buf!353 (_2!37 lt!713)))))))

(assert (=> d!1142 (= (isPrefixOf!0 thiss!932 (_2!37 lt!713)) e!752)))

(declare-fun b!1253 () Bool)

(declare-fun res!3315 () Bool)

(assert (=> b!1253 (=> (not res!3315) (not e!752))))

(assert (=> b!1253 (= res!3315 (bvsle (bitIndex!0 (size!41 (buf!353 thiss!932)) (currentByte!1287 thiss!932) (currentBit!1282 thiss!932)) (bitIndex!0 (size!41 (buf!353 (_2!37 lt!713))) (currentByte!1287 (_2!37 lt!713)) (currentBit!1282 (_2!37 lt!713)))))))

(declare-fun b!1254 () Bool)

(declare-fun e!753 () Bool)

(assert (=> b!1254 (= e!752 e!753)))

(declare-fun res!3316 () Bool)

(assert (=> b!1254 (=> res!3316 e!753)))

(assert (=> b!1254 (= res!3316 (= (size!41 (buf!353 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!1255 () Bool)

(declare-fun arrayBitRangesEq!0 (array!110 array!110 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1255 (= e!753 (arrayBitRangesEq!0 (buf!353 thiss!932) (buf!353 (_2!37 lt!713)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!41 (buf!353 thiss!932)) (currentByte!1287 thiss!932) (currentBit!1282 thiss!932))))))

(assert (= (and d!1142 res!3317) b!1253))

(assert (= (and b!1253 res!3315) b!1254))

(assert (= (and b!1254 (not res!3316)) b!1255))

(assert (=> b!1253 m!807))

(assert (=> b!1253 m!805))

(assert (=> b!1255 m!807))

(assert (=> b!1255 m!807))

(declare-fun m!867 () Bool)

(assert (=> b!1255 m!867))

(assert (=> b!1180 d!1142))

(declare-fun b!1282 () Bool)

(declare-fun res!3344 () Bool)

(declare-fun e!769 () Bool)

(assert (=> b!1282 (=> (not res!3344) (not e!769))))

(declare-fun lt!825 () tuple2!74)

(assert (=> b!1282 (= res!3344 (isPrefixOf!0 thiss!932 (_2!37 lt!825)))))

(declare-fun b!1284 () Bool)

(declare-fun e!768 () Bool)

(declare-fun lt!824 () tuple2!76)

(assert (=> b!1284 (= e!768 (= (bitIndex!0 (size!41 (buf!353 (_1!38 lt!824))) (currentByte!1287 (_1!38 lt!824)) (currentBit!1282 (_1!38 lt!824))) (bitIndex!0 (size!41 (buf!353 (_2!37 lt!825))) (currentByte!1287 (_2!37 lt!825)) (currentBit!1282 (_2!37 lt!825)))))))

(declare-fun b!1283 () Bool)

(assert (=> b!1283 (= e!769 e!768)))

(declare-fun res!3346 () Bool)

(assert (=> b!1283 (=> (not res!3346) (not e!768))))

(assert (=> b!1283 (= res!3346 (and (= (_2!38 lt!824) true) (= (_1!38 lt!824) (_2!37 lt!825))))))

(assert (=> b!1283 (= lt!824 (readBitPure!0 (readerFrom!0 (_2!37 lt!825) (currentBit!1282 thiss!932) (currentByte!1287 thiss!932))))))

(declare-fun b!1281 () Bool)

(declare-fun res!3343 () Bool)

(assert (=> b!1281 (=> (not res!3343) (not e!769))))

(declare-fun lt!827 () (_ BitVec 64))

(declare-fun lt!826 () (_ BitVec 64))

(assert (=> b!1281 (= res!3343 (= (bitIndex!0 (size!41 (buf!353 (_2!37 lt!825))) (currentByte!1287 (_2!37 lt!825)) (currentBit!1282 (_2!37 lt!825))) (bvadd lt!827 lt!826)))))

(assert (=> b!1281 (or (not (= (bvand lt!827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!826 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!827 lt!826) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1281 (= lt!826 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!1281 (= lt!827 (bitIndex!0 (size!41 (buf!353 thiss!932)) (currentByte!1287 thiss!932) (currentBit!1282 thiss!932)))))

(declare-fun d!1148 () Bool)

(assert (=> d!1148 e!769))

(declare-fun res!3345 () Bool)

(assert (=> d!1148 (=> (not res!3345) (not e!769))))

(assert (=> d!1148 (= res!3345 (= (size!41 (buf!353 thiss!932)) (size!41 (buf!353 (_2!37 lt!825)))))))

(declare-fun choose!16 (BitStream!66 Bool) tuple2!74)

(assert (=> d!1148 (= lt!825 (choose!16 thiss!932 true))))

(assert (=> d!1148 (validate_offset_bit!0 ((_ sign_extend 32) (size!41 (buf!353 thiss!932))) ((_ sign_extend 32) (currentByte!1287 thiss!932)) ((_ sign_extend 32) (currentBit!1282 thiss!932)))))

(assert (=> d!1148 (= (appendBit!0 thiss!932 true) lt!825)))

(assert (= (and d!1148 res!3345) b!1281))

(assert (= (and b!1281 res!3343) b!1282))

(assert (= (and b!1282 res!3344) b!1283))

(assert (= (and b!1283 res!3346) b!1284))

(declare-fun m!887 () Bool)

(assert (=> b!1283 m!887))

(assert (=> b!1283 m!887))

(declare-fun m!889 () Bool)

(assert (=> b!1283 m!889))

(declare-fun m!891 () Bool)

(assert (=> b!1281 m!891))

(assert (=> b!1281 m!807))

(declare-fun m!893 () Bool)

(assert (=> b!1284 m!893))

(assert (=> b!1284 m!891))

(declare-fun m!895 () Bool)

(assert (=> d!1148 m!895))

(assert (=> d!1148 m!797))

(declare-fun m!897 () Bool)

(assert (=> b!1282 m!897))

(assert (=> b!1175 d!1148))

(declare-fun d!1168 () Bool)

(declare-fun e!770 () Bool)

(assert (=> d!1168 e!770))

(declare-fun res!3347 () Bool)

(assert (=> d!1168 (=> (not res!3347) (not e!770))))

(declare-fun lt!829 () (_ BitVec 64))

(declare-fun lt!830 () (_ BitVec 64))

(declare-fun lt!828 () (_ BitVec 64))

(assert (=> d!1168 (= res!3347 (= lt!829 (bvsub lt!828 lt!830)))))

(assert (=> d!1168 (or (= (bvand lt!828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!830 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!828 lt!830) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1168 (= lt!830 (remainingBits!0 ((_ sign_extend 32) (size!41 (buf!353 (_1!38 lt!712)))) ((_ sign_extend 32) (currentByte!1287 (_1!38 lt!712))) ((_ sign_extend 32) (currentBit!1282 (_1!38 lt!712)))))))

(declare-fun lt!833 () (_ BitVec 64))

(declare-fun lt!831 () (_ BitVec 64))

(assert (=> d!1168 (= lt!828 (bvmul lt!833 lt!831))))

(assert (=> d!1168 (or (= lt!833 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!831 (bvsdiv (bvmul lt!833 lt!831) lt!833)))))

(assert (=> d!1168 (= lt!831 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1168 (= lt!833 ((_ sign_extend 32) (size!41 (buf!353 (_1!38 lt!712)))))))

(assert (=> d!1168 (= lt!829 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1287 (_1!38 lt!712))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1282 (_1!38 lt!712)))))))

(assert (=> d!1168 (invariant!0 (currentBit!1282 (_1!38 lt!712)) (currentByte!1287 (_1!38 lt!712)) (size!41 (buf!353 (_1!38 lt!712))))))

(assert (=> d!1168 (= (bitIndex!0 (size!41 (buf!353 (_1!38 lt!712))) (currentByte!1287 (_1!38 lt!712)) (currentBit!1282 (_1!38 lt!712))) lt!829)))

(declare-fun b!1285 () Bool)

(declare-fun res!3348 () Bool)

(assert (=> b!1285 (=> (not res!3348) (not e!770))))

(assert (=> b!1285 (= res!3348 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!829))))

(declare-fun b!1286 () Bool)

(declare-fun lt!832 () (_ BitVec 64))

(assert (=> b!1286 (= e!770 (bvsle lt!829 (bvmul lt!832 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1286 (or (= lt!832 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!832 #b0000000000000000000000000000000000000000000000000000000000001000) lt!832)))))

(assert (=> b!1286 (= lt!832 ((_ sign_extend 32) (size!41 (buf!353 (_1!38 lt!712)))))))

(assert (= (and d!1168 res!3347) b!1285))

(assert (= (and b!1285 res!3348) b!1286))

(declare-fun m!899 () Bool)

(assert (=> d!1168 m!899))

(declare-fun m!901 () Bool)

(assert (=> d!1168 m!901))

(assert (=> b!1181 d!1168))

(declare-fun d!1170 () Bool)

(assert (=> d!1170 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!41 (buf!353 thiss!932))) ((_ sign_extend 32) (currentByte!1287 thiss!932)) ((_ sign_extend 32) (currentBit!1282 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!41 (buf!353 thiss!932))) ((_ sign_extend 32) (currentByte!1287 thiss!932)) ((_ sign_extend 32) (currentBit!1282 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!432 () Bool)

(assert (= bs!432 d!1170))

(assert (=> bs!432 m!845))

(assert (=> start!420 d!1170))

(declare-fun d!1172 () Bool)

(assert (=> d!1172 (= (inv!12 thiss!932) (invariant!0 (currentBit!1282 thiss!932) (currentByte!1287 thiss!932) (size!41 (buf!353 thiss!932))))))

(declare-fun bs!433 () Bool)

(assert (= bs!433 d!1172))

(assert (=> bs!433 m!847))

(assert (=> start!420 d!1172))

(assert (=> b!1176 d!1120))

(assert (=> b!1176 d!1126))

(declare-fun d!1174 () Bool)

(declare-datatypes ((tuple2!82 0))(
  ( (tuple2!83 (_1!41 Bool) (_2!41 BitStream!66)) )
))
(declare-fun lt!852 () tuple2!82)

(declare-fun readBit!0 (BitStream!66) tuple2!82)

(assert (=> d!1174 (= lt!852 (readBit!0 (readerFrom!0 (_2!37 lt!713) (currentBit!1282 thiss!932) (currentByte!1287 thiss!932))))))

(assert (=> d!1174 (= (readBitPure!0 (readerFrom!0 (_2!37 lt!713) (currentBit!1282 thiss!932) (currentByte!1287 thiss!932))) (tuple2!77 (_2!41 lt!852) (_1!41 lt!852)))))

(declare-fun bs!434 () Bool)

(assert (= bs!434 d!1174))

(assert (=> bs!434 m!809))

(declare-fun m!903 () Bool)

(assert (=> bs!434 m!903))

(assert (=> b!1182 d!1174))

(assert (=> b!1182 d!1130))

(declare-fun d!1176 () Bool)

(assert (=> d!1176 (= (array_inv!38 (buf!353 thiss!932)) (bvsge (size!41 (buf!353 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!1177 d!1176))

(assert (=> b!1183 d!1142))

(check-sat (not b!1255) (not d!1148) (not b!1284) (not b!1283) (not d!1120) (not d!1170) (not d!1174) (not d!1126) (not d!1168) (not b!1282) (not d!1130) (not d!1128) (not d!1172) (not b!1238) (not b!1253) (not b!1281))
(check-sat)
