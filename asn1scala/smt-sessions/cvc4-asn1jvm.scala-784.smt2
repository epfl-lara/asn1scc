; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22540 () Bool)

(assert start!22540)

(declare-fun b!114006 () Bool)

(declare-fun e!74782 () Bool)

(declare-fun e!74784 () Bool)

(assert (=> b!114006 (= e!74782 e!74784)))

(declare-fun res!94183 () Bool)

(assert (=> b!114006 (=> (not res!94183) (not e!74784))))

(declare-fun lt!173297 () (_ BitVec 64))

(declare-fun lt!173292 () (_ BitVec 64))

(assert (=> b!114006 (= res!94183 (= lt!173297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!173292)))))

(declare-datatypes ((array!5178 0))(
  ( (array!5179 (arr!2945 (Array (_ BitVec 32) (_ BitVec 8))) (size!2352 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4178 0))(
  ( (BitStream!4179 (buf!2760 array!5178) (currentByte!5355 (_ BitVec 32)) (currentBit!5350 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7007 0))(
  ( (Unit!7008) )
))
(declare-datatypes ((tuple2!9404 0))(
  ( (tuple2!9405 (_1!4964 Unit!7007) (_2!4964 BitStream!4178)) )
))
(declare-fun lt!173294 () tuple2!9404)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114006 (= lt!173297 (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173294))) (currentByte!5355 (_2!4964 lt!173294)) (currentBit!5350 (_2!4964 lt!173294))))))

(declare-fun thiss!1305 () BitStream!4178)

(assert (=> b!114006 (= lt!173292 (bitIndex!0 (size!2352 (buf!2760 thiss!1305)) (currentByte!5355 thiss!1305) (currentBit!5350 thiss!1305)))))

(declare-fun b!114007 () Bool)

(declare-fun e!74777 () Bool)

(declare-fun array_inv!2154 (array!5178) Bool)

(assert (=> b!114007 (= e!74777 (array_inv!2154 (buf!2760 thiss!1305)))))

(declare-fun b!114008 () Bool)

(declare-fun res!94187 () Bool)

(declare-fun e!74780 () Bool)

(assert (=> b!114008 (=> (not res!94187) (not e!74780))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114008 (= res!94187 (validate_offset_bits!1 ((_ sign_extend 32) (size!2352 (buf!2760 thiss!1305))) ((_ sign_extend 32) (currentByte!5355 thiss!1305)) ((_ sign_extend 32) (currentBit!5350 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!94179 () Bool)

(assert (=> start!22540 (=> (not res!94179) (not e!74780))))

(assert (=> start!22540 (= res!94179 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22540 e!74780))

(assert (=> start!22540 true))

(declare-fun inv!12 (BitStream!4178) Bool)

(assert (=> start!22540 (and (inv!12 thiss!1305) e!74777)))

(declare-fun b!114009 () Bool)

(declare-fun e!74781 () Bool)

(assert (=> b!114009 (= e!74780 (not e!74781))))

(declare-fun res!94186 () Bool)

(assert (=> b!114009 (=> res!94186 e!74781)))

(declare-fun lt!173291 () tuple2!9404)

(assert (=> b!114009 (= res!94186 (not (= (size!2352 (buf!2760 (_2!4964 lt!173294))) (size!2352 (buf!2760 (_2!4964 lt!173291))))))))

(declare-fun e!74783 () Bool)

(assert (=> b!114009 e!74783))

(declare-fun res!94185 () Bool)

(assert (=> b!114009 (=> (not res!94185) (not e!74783))))

(declare-fun isPrefixOf!0 (BitStream!4178 BitStream!4178) Bool)

(assert (=> b!114009 (= res!94185 (isPrefixOf!0 thiss!1305 (_2!4964 lt!173291)))))

(declare-fun lt!173293 () Unit!7007)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4178 BitStream!4178 BitStream!4178) Unit!7007)

(assert (=> b!114009 (= lt!173293 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4964 lt!173294) (_2!4964 lt!173291)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4178 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9404)

(assert (=> b!114009 (= lt!173291 (appendNLeastSignificantBitsLoop!0 (_2!4964 lt!173294) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!114009 e!74782))

(declare-fun res!94184 () Bool)

(assert (=> b!114009 (=> (not res!94184) (not e!74782))))

(assert (=> b!114009 (= res!94184 (= (size!2352 (buf!2760 thiss!1305)) (size!2352 (buf!2760 (_2!4964 lt!173294)))))))

(declare-fun lt!173296 () Bool)

(declare-fun appendBit!0 (BitStream!4178 Bool) tuple2!9404)

(assert (=> b!114009 (= lt!173294 (appendBit!0 thiss!1305 lt!173296))))

(assert (=> b!114009 (= lt!173296 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!114010 () Bool)

(declare-fun res!94181 () Bool)

(assert (=> b!114010 (=> (not res!94181) (not e!74784))))

(assert (=> b!114010 (= res!94181 (isPrefixOf!0 thiss!1305 (_2!4964 lt!173294)))))

(declare-fun b!114011 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!114011 (= e!74783 (invariant!0 (currentBit!5350 thiss!1305) (currentByte!5355 thiss!1305) (size!2352 (buf!2760 (_2!4964 lt!173294)))))))

(declare-fun b!114012 () Bool)

(declare-fun e!74779 () Bool)

(declare-datatypes ((tuple2!9406 0))(
  ( (tuple2!9407 (_1!4965 BitStream!4178) (_2!4965 Bool)) )
))
(declare-fun lt!173295 () tuple2!9406)

(assert (=> b!114012 (= e!74779 (= (bitIndex!0 (size!2352 (buf!2760 (_1!4965 lt!173295))) (currentByte!5355 (_1!4965 lt!173295)) (currentBit!5350 (_1!4965 lt!173295))) lt!173297))))

(declare-fun b!114013 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114013 (= e!74781 (validate_offset_bit!0 ((_ sign_extend 32) (size!2352 (buf!2760 (_2!4964 lt!173294)))) ((_ sign_extend 32) (currentByte!5355 thiss!1305)) ((_ sign_extend 32) (currentBit!5350 thiss!1305))))))

(declare-fun b!114014 () Bool)

(declare-fun res!94180 () Bool)

(assert (=> b!114014 (=> (not res!94180) (not e!74780))))

(assert (=> b!114014 (= res!94180 (bvslt i!615 nBits!396))))

(declare-fun b!114015 () Bool)

(assert (=> b!114015 (= e!74784 e!74779)))

(declare-fun res!94182 () Bool)

(assert (=> b!114015 (=> (not res!94182) (not e!74779))))

(assert (=> b!114015 (= res!94182 (and (= (_2!4965 lt!173295) lt!173296) (= (_1!4965 lt!173295) (_2!4964 lt!173294))))))

(declare-fun readBitPure!0 (BitStream!4178) tuple2!9406)

(declare-fun readerFrom!0 (BitStream!4178 (_ BitVec 32) (_ BitVec 32)) BitStream!4178)

(assert (=> b!114015 (= lt!173295 (readBitPure!0 (readerFrom!0 (_2!4964 lt!173294) (currentBit!5350 thiss!1305) (currentByte!5355 thiss!1305))))))

(declare-fun b!114016 () Bool)

(declare-fun res!94178 () Bool)

(assert (=> b!114016 (=> (not res!94178) (not e!74780))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!114016 (= res!94178 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!22540 res!94179) b!114008))

(assert (= (and b!114008 res!94187) b!114016))

(assert (= (and b!114016 res!94178) b!114014))

(assert (= (and b!114014 res!94180) b!114009))

(assert (= (and b!114009 res!94184) b!114006))

(assert (= (and b!114006 res!94183) b!114010))

(assert (= (and b!114010 res!94181) b!114015))

(assert (= (and b!114015 res!94182) b!114012))

(assert (= (and b!114009 res!94185) b!114011))

(assert (= (and b!114009 (not res!94186)) b!114013))

(assert (= start!22540 b!114007))

(declare-fun m!170255 () Bool)

(assert (=> b!114012 m!170255))

(declare-fun m!170257 () Bool)

(assert (=> b!114007 m!170257))

(declare-fun m!170259 () Bool)

(assert (=> b!114015 m!170259))

(assert (=> b!114015 m!170259))

(declare-fun m!170261 () Bool)

(assert (=> b!114015 m!170261))

(declare-fun m!170263 () Bool)

(assert (=> b!114009 m!170263))

(declare-fun m!170265 () Bool)

(assert (=> b!114009 m!170265))

(declare-fun m!170267 () Bool)

(assert (=> b!114009 m!170267))

(declare-fun m!170269 () Bool)

(assert (=> b!114009 m!170269))

(declare-fun m!170271 () Bool)

(assert (=> b!114011 m!170271))

(declare-fun m!170273 () Bool)

(assert (=> b!114010 m!170273))

(declare-fun m!170275 () Bool)

(assert (=> b!114013 m!170275))

(declare-fun m!170277 () Bool)

(assert (=> b!114006 m!170277))

(declare-fun m!170279 () Bool)

(assert (=> b!114006 m!170279))

(declare-fun m!170281 () Bool)

(assert (=> b!114016 m!170281))

(declare-fun m!170283 () Bool)

(assert (=> b!114008 m!170283))

(declare-fun m!170285 () Bool)

(assert (=> start!22540 m!170285))

(push 1)

(assert (not b!114009))

(assert (not b!114010))

(assert (not b!114012))

(assert (not b!114007))

(assert (not b!114008))

(assert (not b!114006))

(assert (not start!22540))

(assert (not b!114016))

(assert (not b!114011))

(assert (not b!114013))

(assert (not b!114015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36606 () Bool)

(assert (=> d!36606 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5350 thiss!1305) (currentByte!5355 thiss!1305) (size!2352 (buf!2760 thiss!1305))))))

(declare-fun bs!8893 () Bool)

(assert (= bs!8893 d!36606))

(declare-fun m!170311 () Bool)

(assert (=> bs!8893 m!170311))

(assert (=> start!22540 d!36606))

(declare-fun d!36608 () Bool)

(declare-datatypes ((tuple2!9412 0))(
  ( (tuple2!9413 (_1!4968 Bool) (_2!4968 BitStream!4178)) )
))
(declare-fun lt!173309 () tuple2!9412)

(declare-fun readBit!0 (BitStream!4178) tuple2!9412)

(assert (=> d!36608 (= lt!173309 (readBit!0 (readerFrom!0 (_2!4964 lt!173294) (currentBit!5350 thiss!1305) (currentByte!5355 thiss!1305))))))

(assert (=> d!36608 (= (readBitPure!0 (readerFrom!0 (_2!4964 lt!173294) (currentBit!5350 thiss!1305) (currentByte!5355 thiss!1305))) (tuple2!9407 (_2!4968 lt!173309) (_1!4968 lt!173309)))))

(declare-fun bs!8894 () Bool)

(assert (= bs!8894 d!36608))

(assert (=> bs!8894 m!170259))

(declare-fun m!170313 () Bool)

(assert (=> bs!8894 m!170313))

(assert (=> b!114015 d!36608))

(declare-fun d!36610 () Bool)

(declare-fun e!74802 () Bool)

(assert (=> d!36610 e!74802))

(declare-fun res!94213 () Bool)

(assert (=> d!36610 (=> (not res!94213) (not e!74802))))

(assert (=> d!36610 (= res!94213 (invariant!0 (currentBit!5350 (_2!4964 lt!173294)) (currentByte!5355 (_2!4964 lt!173294)) (size!2352 (buf!2760 (_2!4964 lt!173294)))))))

(assert (=> d!36610 (= (readerFrom!0 (_2!4964 lt!173294) (currentBit!5350 thiss!1305) (currentByte!5355 thiss!1305)) (BitStream!4179 (buf!2760 (_2!4964 lt!173294)) (currentByte!5355 thiss!1305) (currentBit!5350 thiss!1305)))))

(declare-fun b!114040 () Bool)

(assert (=> b!114040 (= e!74802 (invariant!0 (currentBit!5350 thiss!1305) (currentByte!5355 thiss!1305) (size!2352 (buf!2760 (_2!4964 lt!173294)))))))

(assert (= (and d!36610 res!94213) b!114040))

(declare-fun m!170315 () Bool)

(assert (=> d!36610 m!170315))

(assert (=> b!114040 m!170271))

(assert (=> b!114015 d!36610))

(declare-fun d!36612 () Bool)

(assert (=> d!36612 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!114016 d!36612))

(declare-fun d!36614 () Bool)

(declare-fun e!74805 () Bool)

(assert (=> d!36614 e!74805))

(declare-fun res!94219 () Bool)

(assert (=> d!36614 (=> (not res!94219) (not e!74805))))

(declare-fun lt!173325 () (_ BitVec 64))

(declare-fun lt!173323 () (_ BitVec 64))

(declare-fun lt!173326 () (_ BitVec 64))

(assert (=> d!36614 (= res!94219 (= lt!173323 (bvsub lt!173325 lt!173326)))))

(assert (=> d!36614 (or (= (bvand lt!173325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173326 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173325 lt!173326) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36614 (= lt!173326 (remainingBits!0 ((_ sign_extend 32) (size!2352 (buf!2760 (_2!4964 lt!173294)))) ((_ sign_extend 32) (currentByte!5355 (_2!4964 lt!173294))) ((_ sign_extend 32) (currentBit!5350 (_2!4964 lt!173294)))))))

(declare-fun lt!173324 () (_ BitVec 64))

(declare-fun lt!173327 () (_ BitVec 64))

(assert (=> d!36614 (= lt!173325 (bvmul lt!173324 lt!173327))))

(assert (=> d!36614 (or (= lt!173324 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173327 (bvsdiv (bvmul lt!173324 lt!173327) lt!173324)))))

(assert (=> d!36614 (= lt!173327 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36614 (= lt!173324 ((_ sign_extend 32) (size!2352 (buf!2760 (_2!4964 lt!173294)))))))

(assert (=> d!36614 (= lt!173323 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5355 (_2!4964 lt!173294))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5350 (_2!4964 lt!173294)))))))

(assert (=> d!36614 (invariant!0 (currentBit!5350 (_2!4964 lt!173294)) (currentByte!5355 (_2!4964 lt!173294)) (size!2352 (buf!2760 (_2!4964 lt!173294))))))

(assert (=> d!36614 (= (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173294))) (currentByte!5355 (_2!4964 lt!173294)) (currentBit!5350 (_2!4964 lt!173294))) lt!173323)))

(declare-fun b!114045 () Bool)

(declare-fun res!94218 () Bool)

(assert (=> b!114045 (=> (not res!94218) (not e!74805))))

(assert (=> b!114045 (= res!94218 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173323))))

(declare-fun b!114046 () Bool)

(declare-fun lt!173322 () (_ BitVec 64))

(assert (=> b!114046 (= e!74805 (bvsle lt!173323 (bvmul lt!173322 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114046 (or (= lt!173322 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173322 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173322)))))

(assert (=> b!114046 (= lt!173322 ((_ sign_extend 32) (size!2352 (buf!2760 (_2!4964 lt!173294)))))))

(assert (= (and d!36614 res!94219) b!114045))

(assert (= (and b!114045 res!94218) b!114046))

(declare-fun m!170317 () Bool)

(assert (=> d!36614 m!170317))

(assert (=> d!36614 m!170315))

(assert (=> b!114006 d!36614))

(declare-fun d!36616 () Bool)

(declare-fun e!74806 () Bool)

(assert (=> d!36616 e!74806))

(declare-fun res!94221 () Bool)

(assert (=> d!36616 (=> (not res!94221) (not e!74806))))

(declare-fun lt!173332 () (_ BitVec 64))

(declare-fun lt!173329 () (_ BitVec 64))

(declare-fun lt!173331 () (_ BitVec 64))

(assert (=> d!36616 (= res!94221 (= lt!173329 (bvsub lt!173331 lt!173332)))))

(assert (=> d!36616 (or (= (bvand lt!173331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173332 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173331 lt!173332) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36616 (= lt!173332 (remainingBits!0 ((_ sign_extend 32) (size!2352 (buf!2760 thiss!1305))) ((_ sign_extend 32) (currentByte!5355 thiss!1305)) ((_ sign_extend 32) (currentBit!5350 thiss!1305))))))

(declare-fun lt!173330 () (_ BitVec 64))

(declare-fun lt!173333 () (_ BitVec 64))

(assert (=> d!36616 (= lt!173331 (bvmul lt!173330 lt!173333))))

(assert (=> d!36616 (or (= lt!173330 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173333 (bvsdiv (bvmul lt!173330 lt!173333) lt!173330)))))

(assert (=> d!36616 (= lt!173333 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36616 (= lt!173330 ((_ sign_extend 32) (size!2352 (buf!2760 thiss!1305))))))

(assert (=> d!36616 (= lt!173329 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5355 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5350 thiss!1305))))))

(assert (=> d!36616 (invariant!0 (currentBit!5350 thiss!1305) (currentByte!5355 thiss!1305) (size!2352 (buf!2760 thiss!1305)))))

(assert (=> d!36616 (= (bitIndex!0 (size!2352 (buf!2760 thiss!1305)) (currentByte!5355 thiss!1305) (currentBit!5350 thiss!1305)) lt!173329)))

(declare-fun b!114047 () Bool)

(declare-fun res!94220 () Bool)

(assert (=> b!114047 (=> (not res!94220) (not e!74806))))

(assert (=> b!114047 (= res!94220 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173329))))

(declare-fun b!114048 () Bool)

(declare-fun lt!173328 () (_ BitVec 64))

(assert (=> b!114048 (= e!74806 (bvsle lt!173329 (bvmul lt!173328 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114048 (or (= lt!173328 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173328 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173328)))))

(assert (=> b!114048 (= lt!173328 ((_ sign_extend 32) (size!2352 (buf!2760 thiss!1305))))))

(assert (= (and d!36616 res!94221) b!114047))

(assert (= (and b!114047 res!94220) b!114048))

(declare-fun m!170319 () Bool)

(assert (=> d!36616 m!170319))

(assert (=> d!36616 m!170311))

(assert (=> b!114006 d!36616))

(declare-fun d!36618 () Bool)

(assert (=> d!36618 (= (array_inv!2154 (buf!2760 thiss!1305)) (bvsge (size!2352 (buf!2760 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!114007 d!36618))

(declare-fun d!36620 () Bool)

(assert (=> d!36620 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2352 (buf!2760 thiss!1305))) ((_ sign_extend 32) (currentByte!5355 thiss!1305)) ((_ sign_extend 32) (currentBit!5350 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2352 (buf!2760 thiss!1305))) ((_ sign_extend 32) (currentByte!5355 thiss!1305)) ((_ sign_extend 32) (currentBit!5350 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8895 () Bool)

(assert (= bs!8895 d!36620))

(assert (=> bs!8895 m!170319))

(assert (=> b!114008 d!36620))

(declare-fun d!36622 () Bool)

(declare-fun res!94230 () Bool)

(declare-fun e!74812 () Bool)

(assert (=> d!36622 (=> (not res!94230) (not e!74812))))

(assert (=> d!36622 (= res!94230 (= (size!2352 (buf!2760 thiss!1305)) (size!2352 (buf!2760 (_2!4964 lt!173291)))))))

(assert (=> d!36622 (= (isPrefixOf!0 thiss!1305 (_2!4964 lt!173291)) e!74812)))

(declare-fun b!114055 () Bool)

(declare-fun res!94229 () Bool)

(assert (=> b!114055 (=> (not res!94229) (not e!74812))))

(assert (=> b!114055 (= res!94229 (bvsle (bitIndex!0 (size!2352 (buf!2760 thiss!1305)) (currentByte!5355 thiss!1305) (currentBit!5350 thiss!1305)) (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173291))) (currentByte!5355 (_2!4964 lt!173291)) (currentBit!5350 (_2!4964 lt!173291)))))))

(declare-fun b!114056 () Bool)

(declare-fun e!74811 () Bool)

(assert (=> b!114056 (= e!74812 e!74811)))

(declare-fun res!94228 () Bool)

(assert (=> b!114056 (=> res!94228 e!74811)))

(assert (=> b!114056 (= res!94228 (= (size!2352 (buf!2760 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114057 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5178 array!5178 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114057 (= e!74811 (arrayBitRangesEq!0 (buf!2760 thiss!1305) (buf!2760 (_2!4964 lt!173291)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2352 (buf!2760 thiss!1305)) (currentByte!5355 thiss!1305) (currentBit!5350 thiss!1305))))))

(assert (= (and d!36622 res!94230) b!114055))

(assert (= (and b!114055 res!94229) b!114056))

(assert (= (and b!114056 (not res!94228)) b!114057))

(assert (=> b!114055 m!170279))

(declare-fun m!170321 () Bool)

(assert (=> b!114055 m!170321))

(assert (=> b!114057 m!170279))

(assert (=> b!114057 m!170279))

(declare-fun m!170323 () Bool)

(assert (=> b!114057 m!170323))

(assert (=> b!114009 d!36622))

(declare-fun d!36624 () Bool)

(assert (=> d!36624 (isPrefixOf!0 thiss!1305 (_2!4964 lt!173291))))

(declare-fun lt!173336 () Unit!7007)

(declare-fun choose!30 (BitStream!4178 BitStream!4178 BitStream!4178) Unit!7007)

(assert (=> d!36624 (= lt!173336 (choose!30 thiss!1305 (_2!4964 lt!173294) (_2!4964 lt!173291)))))

(assert (=> d!36624 (isPrefixOf!0 thiss!1305 (_2!4964 lt!173294))))

(assert (=> d!36624 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4964 lt!173294) (_2!4964 lt!173291)) lt!173336)))

(declare-fun bs!8896 () Bool)

(assert (= bs!8896 d!36624))

(assert (=> bs!8896 m!170263))

(declare-fun m!170325 () Bool)

(assert (=> bs!8896 m!170325))

(assert (=> bs!8896 m!170273))

(assert (=> b!114009 d!36624))

(declare-fun b!114166 () Bool)

(declare-fun e!74873 () Bool)

(declare-fun lt!173697 () tuple2!9406)

(declare-fun lt!173667 () tuple2!9406)

(assert (=> b!114166 (= e!74873 (= (_2!4965 lt!173697) (_2!4965 lt!173667)))))

(declare-fun b!114167 () Bool)

(declare-fun res!94321 () Bool)

(declare-fun lt!173692 () tuple2!9404)

(assert (=> b!114167 (= res!94321 (= (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173692))) (currentByte!5355 (_2!4964 lt!173692)) (currentBit!5350 (_2!4964 lt!173692))) (bvadd (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173294))) (currentByte!5355 (_2!4964 lt!173294)) (currentBit!5350 (_2!4964 lt!173294))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!74875 () Bool)

(assert (=> b!114167 (=> (not res!94321) (not e!74875))))

(declare-fun b!114168 () Bool)

(declare-fun res!94320 () Bool)

(declare-fun e!74872 () Bool)

(assert (=> b!114168 (=> (not res!94320) (not e!74872))))

(declare-fun lt!173672 () tuple2!9404)

(declare-fun lt!173668 () (_ BitVec 64))

(declare-fun lt!173679 () (_ BitVec 64))

(assert (=> b!114168 (= res!94320 (= (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173672))) (currentByte!5355 (_2!4964 lt!173672)) (currentBit!5350 (_2!4964 lt!173672))) (bvadd lt!173668 lt!173679)))))

(assert (=> b!114168 (or (not (= (bvand lt!173668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173679 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!173668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!173668 lt!173679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114168 (= lt!173679 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114168 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114168 (= lt!173668 (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173294))) (currentByte!5355 (_2!4964 lt!173294)) (currentBit!5350 (_2!4964 lt!173294))))))

(declare-fun d!36626 () Bool)

(assert (=> d!36626 e!74872))

(declare-fun res!94316 () Bool)

(assert (=> d!36626 (=> (not res!94316) (not e!74872))))

(assert (=> d!36626 (= res!94316 (= (size!2352 (buf!2760 (_2!4964 lt!173294))) (size!2352 (buf!2760 (_2!4964 lt!173672)))))))

(declare-fun e!74878 () tuple2!9404)

(assert (=> d!36626 (= lt!173672 e!74878)))

(declare-fun c!6920 () Bool)

(assert (=> d!36626 (= c!6920 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36626 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36626 (= (appendNLeastSignificantBitsLoop!0 (_2!4964 lt!173294) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!173672)))

(declare-fun b!114169 () Bool)

(declare-fun e!74876 () Bool)

(declare-fun lt!173681 () (_ BitVec 64))

(assert (=> b!114169 (= e!74876 (validate_offset_bits!1 ((_ sign_extend 32) (size!2352 (buf!2760 (_2!4964 lt!173294)))) ((_ sign_extend 32) (currentByte!5355 (_2!4964 lt!173294))) ((_ sign_extend 32) (currentBit!5350 (_2!4964 lt!173294))) lt!173681))))

(declare-fun b!114170 () Bool)

(declare-fun lt!173688 () Unit!7007)

(assert (=> b!114170 (= e!74878 (tuple2!9405 lt!173688 (_2!4964 lt!173294)))))

(declare-fun lt!173682 () BitStream!4178)

(assert (=> b!114170 (= lt!173682 (_2!4964 lt!173294))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4178) Unit!7007)

(assert (=> b!114170 (= lt!173688 (lemmaIsPrefixRefl!0 lt!173682))))

(declare-fun call!1463 () Bool)

(assert (=> b!114170 call!1463))

(declare-fun b!114171 () Bool)

(declare-fun res!94319 () Bool)

(assert (=> b!114171 (=> (not res!94319) (not e!74872))))

(assert (=> b!114171 (= res!94319 (isPrefixOf!0 (_2!4964 lt!173294) (_2!4964 lt!173672)))))

(declare-datatypes ((tuple2!9422 0))(
  ( (tuple2!9423 (_1!4973 BitStream!4178) (_2!4973 (_ BitVec 64))) )
))
(declare-fun lt!173661 () tuple2!9422)

(declare-datatypes ((tuple2!9424 0))(
  ( (tuple2!9425 (_1!4974 BitStream!4178) (_2!4974 BitStream!4178)) )
))
(declare-fun lt!173702 () tuple2!9424)

(declare-fun b!114172 () Bool)

(assert (=> b!114172 (= e!74872 (and (= (_2!4973 lt!173661) v!199) (= (_1!4973 lt!173661) (_2!4974 lt!173702))))))

(declare-fun lt!173660 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9422)

(assert (=> b!114172 (= lt!173661 (readNLeastSignificantBitsLoopPure!0 (_1!4974 lt!173702) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173660))))

(declare-fun lt!173683 () Unit!7007)

(declare-fun lt!173694 () Unit!7007)

(assert (=> b!114172 (= lt!173683 lt!173694)))

(assert (=> b!114172 (validate_offset_bits!1 ((_ sign_extend 32) (size!2352 (buf!2760 (_2!4964 lt!173672)))) ((_ sign_extend 32) (currentByte!5355 (_2!4964 lt!173294))) ((_ sign_extend 32) (currentBit!5350 (_2!4964 lt!173294))) lt!173681)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4178 array!5178 (_ BitVec 64)) Unit!7007)

(assert (=> b!114172 (= lt!173694 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4964 lt!173294) (buf!2760 (_2!4964 lt!173672)) lt!173681))))

(assert (=> b!114172 e!74876))

(declare-fun res!94315 () Bool)

(assert (=> b!114172 (=> (not res!94315) (not e!74876))))

(assert (=> b!114172 (= res!94315 (and (= (size!2352 (buf!2760 (_2!4964 lt!173294))) (size!2352 (buf!2760 (_2!4964 lt!173672)))) (bvsge lt!173681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114172 (= lt!173681 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114172 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114172 (= lt!173660 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!114172 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!4178 BitStream!4178) tuple2!9424)

(assert (=> b!114172 (= lt!173702 (reader!0 (_2!4964 lt!173294) (_2!4964 lt!173672)))))

(declare-fun b!114173 () Bool)

(declare-fun e!74877 () (_ BitVec 64))

(assert (=> b!114173 (= e!74877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!173671 () tuple2!9404)

(declare-fun bm!1460 () Bool)

(assert (=> bm!1460 (= call!1463 (isPrefixOf!0 (ite c!6920 (_2!4964 lt!173294) lt!173682) (ite c!6920 (_2!4964 lt!173671) lt!173682)))))

(declare-fun b!114174 () Bool)

(declare-fun res!94322 () Bool)

(assert (=> b!114174 (= res!94322 (isPrefixOf!0 (_2!4964 lt!173294) (_2!4964 lt!173692)))))

(assert (=> b!114174 (=> (not res!94322) (not e!74875))))

(declare-fun b!114175 () Bool)

(declare-fun Unit!7015 () Unit!7007)

(assert (=> b!114175 (= e!74878 (tuple2!9405 Unit!7015 (_2!4964 lt!173671)))))

(declare-fun lt!173674 () Bool)

(assert (=> b!114175 (= lt!173674 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114175 (= lt!173692 (appendBit!0 (_2!4964 lt!173294) lt!173674))))

(declare-fun res!94318 () Bool)

(assert (=> b!114175 (= res!94318 (= (size!2352 (buf!2760 (_2!4964 lt!173294))) (size!2352 (buf!2760 (_2!4964 lt!173692)))))))

(assert (=> b!114175 (=> (not res!94318) (not e!74875))))

(assert (=> b!114175 e!74875))

(declare-fun lt!173700 () tuple2!9404)

(assert (=> b!114175 (= lt!173700 lt!173692)))

(assert (=> b!114175 (= lt!173671 (appendNLeastSignificantBitsLoop!0 (_2!4964 lt!173700) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!173687 () Unit!7007)

(assert (=> b!114175 (= lt!173687 (lemmaIsPrefixTransitive!0 (_2!4964 lt!173294) (_2!4964 lt!173700) (_2!4964 lt!173671)))))

(assert (=> b!114175 call!1463))

(declare-fun lt!173698 () Unit!7007)

(assert (=> b!114175 (= lt!173698 lt!173687)))

(assert (=> b!114175 (invariant!0 (currentBit!5350 (_2!4964 lt!173294)) (currentByte!5355 (_2!4964 lt!173294)) (size!2352 (buf!2760 (_2!4964 lt!173700))))))

(declare-fun lt!173664 () BitStream!4178)

(assert (=> b!114175 (= lt!173664 (BitStream!4179 (buf!2760 (_2!4964 lt!173700)) (currentByte!5355 (_2!4964 lt!173294)) (currentBit!5350 (_2!4964 lt!173294))))))

(assert (=> b!114175 (invariant!0 (currentBit!5350 lt!173664) (currentByte!5355 lt!173664) (size!2352 (buf!2760 (_2!4964 lt!173671))))))

(declare-fun lt!173676 () BitStream!4178)

(assert (=> b!114175 (= lt!173676 (BitStream!4179 (buf!2760 (_2!4964 lt!173671)) (currentByte!5355 lt!173664) (currentBit!5350 lt!173664)))))

(assert (=> b!114175 (= lt!173697 (readBitPure!0 lt!173664))))

(assert (=> b!114175 (= lt!173667 (readBitPure!0 lt!173676))))

(declare-fun lt!173675 () Unit!7007)

(declare-fun readBitPrefixLemma!0 (BitStream!4178 BitStream!4178) Unit!7007)

(assert (=> b!114175 (= lt!173675 (readBitPrefixLemma!0 lt!173664 (_2!4964 lt!173671)))))

(declare-fun res!94323 () Bool)

(assert (=> b!114175 (= res!94323 (= (bitIndex!0 (size!2352 (buf!2760 (_1!4965 lt!173697))) (currentByte!5355 (_1!4965 lt!173697)) (currentBit!5350 (_1!4965 lt!173697))) (bitIndex!0 (size!2352 (buf!2760 (_1!4965 lt!173667))) (currentByte!5355 (_1!4965 lt!173667)) (currentBit!5350 (_1!4965 lt!173667)))))))

(assert (=> b!114175 (=> (not res!94323) (not e!74873))))

(assert (=> b!114175 e!74873))

(declare-fun lt!173684 () Unit!7007)

(assert (=> b!114175 (= lt!173684 lt!173675)))

(declare-fun lt!173695 () tuple2!9424)

(assert (=> b!114175 (= lt!173695 (reader!0 (_2!4964 lt!173294) (_2!4964 lt!173671)))))

(declare-fun lt!173703 () tuple2!9424)

(assert (=> b!114175 (= lt!173703 (reader!0 (_2!4964 lt!173700) (_2!4964 lt!173671)))))

(declare-fun lt!173666 () tuple2!9406)

(assert (=> b!114175 (= lt!173666 (readBitPure!0 (_1!4974 lt!173695)))))

(assert (=> b!114175 (= (_2!4965 lt!173666) lt!173674)))

(declare-fun lt!173665 () Unit!7007)

(declare-fun Unit!7018 () Unit!7007)

(assert (=> b!114175 (= lt!173665 Unit!7018)))

(declare-fun lt!173673 () (_ BitVec 64))

(assert (=> b!114175 (= lt!173673 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!173693 () (_ BitVec 64))

(assert (=> b!114175 (= lt!173693 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!173696 () Unit!7007)

(assert (=> b!114175 (= lt!173696 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4964 lt!173294) (buf!2760 (_2!4964 lt!173671)) lt!173693))))

(assert (=> b!114175 (validate_offset_bits!1 ((_ sign_extend 32) (size!2352 (buf!2760 (_2!4964 lt!173671)))) ((_ sign_extend 32) (currentByte!5355 (_2!4964 lt!173294))) ((_ sign_extend 32) (currentBit!5350 (_2!4964 lt!173294))) lt!173693)))

(declare-fun lt!173662 () Unit!7007)

(assert (=> b!114175 (= lt!173662 lt!173696)))

(declare-fun lt!173699 () tuple2!9422)

(assert (=> b!114175 (= lt!173699 (readNLeastSignificantBitsLoopPure!0 (_1!4974 lt!173695) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173673))))

(declare-fun lt!173686 () (_ BitVec 64))

(assert (=> b!114175 (= lt!173686 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!173691 () Unit!7007)

(assert (=> b!114175 (= lt!173691 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4964 lt!173700) (buf!2760 (_2!4964 lt!173671)) lt!173686))))

(assert (=> b!114175 (validate_offset_bits!1 ((_ sign_extend 32) (size!2352 (buf!2760 (_2!4964 lt!173671)))) ((_ sign_extend 32) (currentByte!5355 (_2!4964 lt!173700))) ((_ sign_extend 32) (currentBit!5350 (_2!4964 lt!173700))) lt!173686)))

(declare-fun lt!173659 () Unit!7007)

(assert (=> b!114175 (= lt!173659 lt!173691)))

(declare-fun lt!173663 () tuple2!9422)

(assert (=> b!114175 (= lt!173663 (readNLeastSignificantBitsLoopPure!0 (_1!4974 lt!173703) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!173673 (ite (_2!4965 lt!173666) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!173690 () tuple2!9422)

(assert (=> b!114175 (= lt!173690 (readNLeastSignificantBitsLoopPure!0 (_1!4974 lt!173695) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173673))))

(declare-fun c!6921 () Bool)

(assert (=> b!114175 (= c!6921 (_2!4965 (readBitPure!0 (_1!4974 lt!173695))))))

(declare-fun lt!173685 () tuple2!9422)

(declare-fun withMovedBitIndex!0 (BitStream!4178 (_ BitVec 64)) BitStream!4178)

(assert (=> b!114175 (= lt!173685 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4974 lt!173695) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!173673 e!74877)))))

(declare-fun lt!173669 () Unit!7007)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7007)

(assert (=> b!114175 (= lt!173669 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4974 lt!173695) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173673))))

(assert (=> b!114175 (and (= (_2!4973 lt!173690) (_2!4973 lt!173685)) (= (_1!4973 lt!173690) (_1!4973 lt!173685)))))

(declare-fun lt!173680 () Unit!7007)

(assert (=> b!114175 (= lt!173680 lt!173669)))

(assert (=> b!114175 (= (_1!4974 lt!173695) (withMovedBitIndex!0 (_2!4974 lt!173695) (bvsub (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173294))) (currentByte!5355 (_2!4964 lt!173294)) (currentBit!5350 (_2!4964 lt!173294))) (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173671))) (currentByte!5355 (_2!4964 lt!173671)) (currentBit!5350 (_2!4964 lt!173671))))))))

(declare-fun lt!173670 () Unit!7007)

(declare-fun Unit!7023 () Unit!7007)

(assert (=> b!114175 (= lt!173670 Unit!7023)))

(assert (=> b!114175 (= (_1!4974 lt!173703) (withMovedBitIndex!0 (_2!4974 lt!173703) (bvsub (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173700))) (currentByte!5355 (_2!4964 lt!173700)) (currentBit!5350 (_2!4964 lt!173700))) (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173671))) (currentByte!5355 (_2!4964 lt!173671)) (currentBit!5350 (_2!4964 lt!173671))))))))

(declare-fun lt!173678 () Unit!7007)

(declare-fun Unit!7024 () Unit!7007)

(assert (=> b!114175 (= lt!173678 Unit!7024)))

(assert (=> b!114175 (= (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173294))) (currentByte!5355 (_2!4964 lt!173294)) (currentBit!5350 (_2!4964 lt!173294))) (bvsub (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173700))) (currentByte!5355 (_2!4964 lt!173700)) (currentBit!5350 (_2!4964 lt!173700))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!173677 () Unit!7007)

(declare-fun Unit!7025 () Unit!7007)

(assert (=> b!114175 (= lt!173677 Unit!7025)))

(assert (=> b!114175 (= (_2!4973 lt!173699) (_2!4973 lt!173663))))

(declare-fun lt!173689 () Unit!7007)

(declare-fun Unit!7026 () Unit!7007)

(assert (=> b!114175 (= lt!173689 Unit!7026)))

(assert (=> b!114175 (= (_1!4973 lt!173699) (_2!4974 lt!173695))))

(declare-fun b!114176 () Bool)

(declare-fun e!74874 () Bool)

(declare-fun lt!173701 () tuple2!9406)

(assert (=> b!114176 (= e!74874 (= (bitIndex!0 (size!2352 (buf!2760 (_1!4965 lt!173701))) (currentByte!5355 (_1!4965 lt!173701)) (currentBit!5350 (_1!4965 lt!173701))) (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173692))) (currentByte!5355 (_2!4964 lt!173692)) (currentBit!5350 (_2!4964 lt!173692)))))))

(declare-fun b!114177 () Bool)

(assert (=> b!114177 (= e!74877 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!114178 () Bool)

(assert (=> b!114178 (= lt!173701 (readBitPure!0 (readerFrom!0 (_2!4964 lt!173692) (currentBit!5350 (_2!4964 lt!173294)) (currentByte!5355 (_2!4964 lt!173294)))))))

(declare-fun res!94317 () Bool)

(assert (=> b!114178 (= res!94317 (and (= (_2!4965 lt!173701) lt!173674) (= (_1!4965 lt!173701) (_2!4964 lt!173692))))))

(assert (=> b!114178 (=> (not res!94317) (not e!74874))))

(assert (=> b!114178 (= e!74875 e!74874)))

(assert (= (and d!36626 c!6920) b!114175))

(assert (= (and d!36626 (not c!6920)) b!114170))

(assert (= (and b!114175 res!94318) b!114167))

(assert (= (and b!114167 res!94321) b!114174))

(assert (= (and b!114174 res!94322) b!114178))

(assert (= (and b!114178 res!94317) b!114176))

(assert (= (and b!114175 res!94323) b!114166))

(assert (= (and b!114175 c!6921) b!114177))

(assert (= (and b!114175 (not c!6921)) b!114173))

(assert (= (or b!114175 b!114170) bm!1460))

(assert (= (and d!36626 res!94316) b!114168))

(assert (= (and b!114168 res!94320) b!114171))

(assert (= (and b!114171 res!94319) b!114172))

(assert (= (and b!114172 res!94315) b!114169))

(declare-fun m!170439 () Bool)

(assert (=> b!114178 m!170439))

(assert (=> b!114178 m!170439))

(declare-fun m!170441 () Bool)

(assert (=> b!114178 m!170441))

(declare-fun m!170443 () Bool)

(assert (=> b!114169 m!170443))

(declare-fun m!170445 () Bool)

(assert (=> b!114172 m!170445))

(declare-fun m!170447 () Bool)

(assert (=> b!114172 m!170447))

(declare-fun m!170449 () Bool)

(assert (=> b!114172 m!170449))

(declare-fun m!170451 () Bool)

(assert (=> b!114172 m!170451))

(declare-fun m!170453 () Bool)

(assert (=> b!114172 m!170453))

(declare-fun m!170455 () Bool)

(assert (=> b!114170 m!170455))

(declare-fun m!170457 () Bool)

(assert (=> b!114168 m!170457))

(assert (=> b!114168 m!170277))

(declare-fun m!170459 () Bool)

(assert (=> b!114171 m!170459))

(declare-fun m!170461 () Bool)

(assert (=> b!114174 m!170461))

(declare-fun m!170463 () Bool)

(assert (=> b!114175 m!170463))

(assert (=> b!114175 m!170277))

(declare-fun m!170465 () Bool)

(assert (=> b!114175 m!170465))

(declare-fun m!170467 () Bool)

(assert (=> b!114175 m!170467))

(declare-fun m!170469 () Bool)

(assert (=> b!114175 m!170469))

(declare-fun m!170471 () Bool)

(assert (=> b!114175 m!170471))

(declare-fun m!170473 () Bool)

(assert (=> b!114175 m!170473))

(declare-fun m!170475 () Bool)

(assert (=> b!114175 m!170475))

(declare-fun m!170477 () Bool)

(assert (=> b!114175 m!170477))

(declare-fun m!170479 () Bool)

(assert (=> b!114175 m!170479))

(declare-fun m!170481 () Bool)

(assert (=> b!114175 m!170481))

(declare-fun m!170483 () Bool)

(assert (=> b!114175 m!170483))

(declare-fun m!170485 () Bool)

(assert (=> b!114175 m!170485))

(declare-fun m!170487 () Bool)

(assert (=> b!114175 m!170487))

(declare-fun m!170489 () Bool)

(assert (=> b!114175 m!170489))

(assert (=> b!114175 m!170447))

(declare-fun m!170491 () Bool)

(assert (=> b!114175 m!170491))

(declare-fun m!170493 () Bool)

(assert (=> b!114175 m!170493))

(declare-fun m!170495 () Bool)

(assert (=> b!114175 m!170495))

(declare-fun m!170497 () Bool)

(assert (=> b!114175 m!170497))

(declare-fun m!170499 () Bool)

(assert (=> b!114175 m!170499))

(declare-fun m!170501 () Bool)

(assert (=> b!114175 m!170501))

(declare-fun m!170503 () Bool)

(assert (=> b!114175 m!170503))

(declare-fun m!170505 () Bool)

(assert (=> b!114175 m!170505))

(declare-fun m!170507 () Bool)

(assert (=> b!114175 m!170507))

(declare-fun m!170509 () Bool)

(assert (=> b!114175 m!170509))

(declare-fun m!170511 () Bool)

(assert (=> b!114175 m!170511))

(assert (=> b!114175 m!170485))

(declare-fun m!170513 () Bool)

(assert (=> b!114175 m!170513))

(declare-fun m!170515 () Bool)

(assert (=> bm!1460 m!170515))

(declare-fun m!170517 () Bool)

(assert (=> b!114167 m!170517))

(assert (=> b!114167 m!170277))

(declare-fun m!170519 () Bool)

(assert (=> b!114176 m!170519))

(assert (=> b!114176 m!170517))

(assert (=> b!114009 d!36626))

(declare-fun b!114213 () Bool)

(declare-fun res!94349 () Bool)

(declare-fun e!74896 () Bool)

(assert (=> b!114213 (=> (not res!94349) (not e!74896))))

(declare-fun lt!173797 () tuple2!9404)

(declare-fun lt!173796 () (_ BitVec 64))

(declare-fun lt!173798 () (_ BitVec 64))

(assert (=> b!114213 (= res!94349 (= (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173797))) (currentByte!5355 (_2!4964 lt!173797)) (currentBit!5350 (_2!4964 lt!173797))) (bvadd lt!173796 lt!173798)))))

(assert (=> b!114213 (or (not (= (bvand lt!173796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173798 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!173796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!173796 lt!173798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114213 (= lt!173798 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!114213 (= lt!173796 (bitIndex!0 (size!2352 (buf!2760 thiss!1305)) (currentByte!5355 thiss!1305) (currentBit!5350 thiss!1305)))))

(declare-fun b!114216 () Bool)

(declare-fun e!74897 () Bool)

(declare-fun lt!173795 () tuple2!9406)

(assert (=> b!114216 (= e!74897 (= (bitIndex!0 (size!2352 (buf!2760 (_1!4965 lt!173795))) (currentByte!5355 (_1!4965 lt!173795)) (currentBit!5350 (_1!4965 lt!173795))) (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173797))) (currentByte!5355 (_2!4964 lt!173797)) (currentBit!5350 (_2!4964 lt!173797)))))))

(declare-fun d!36652 () Bool)

(assert (=> d!36652 e!74896))

(declare-fun res!94351 () Bool)

(assert (=> d!36652 (=> (not res!94351) (not e!74896))))

(assert (=> d!36652 (= res!94351 (= (size!2352 (buf!2760 thiss!1305)) (size!2352 (buf!2760 (_2!4964 lt!173797)))))))

(declare-fun choose!16 (BitStream!4178 Bool) tuple2!9404)

(assert (=> d!36652 (= lt!173797 (choose!16 thiss!1305 lt!173296))))

(assert (=> d!36652 (validate_offset_bit!0 ((_ sign_extend 32) (size!2352 (buf!2760 thiss!1305))) ((_ sign_extend 32) (currentByte!5355 thiss!1305)) ((_ sign_extend 32) (currentBit!5350 thiss!1305)))))

(assert (=> d!36652 (= (appendBit!0 thiss!1305 lt!173296) lt!173797)))

(declare-fun b!114214 () Bool)

(declare-fun res!94350 () Bool)

(assert (=> b!114214 (=> (not res!94350) (not e!74896))))

(assert (=> b!114214 (= res!94350 (isPrefixOf!0 thiss!1305 (_2!4964 lt!173797)))))

(declare-fun b!114215 () Bool)

(assert (=> b!114215 (= e!74896 e!74897)))

(declare-fun res!94352 () Bool)

(assert (=> b!114215 (=> (not res!94352) (not e!74897))))

(assert (=> b!114215 (= res!94352 (and (= (_2!4965 lt!173795) lt!173296) (= (_1!4965 lt!173795) (_2!4964 lt!173797))))))

(assert (=> b!114215 (= lt!173795 (readBitPure!0 (readerFrom!0 (_2!4964 lt!173797) (currentBit!5350 thiss!1305) (currentByte!5355 thiss!1305))))))

(assert (= (and d!36652 res!94351) b!114213))

(assert (= (and b!114213 res!94349) b!114214))

(assert (= (and b!114214 res!94350) b!114215))

(assert (= (and b!114215 res!94352) b!114216))

(declare-fun m!170603 () Bool)

(assert (=> d!36652 m!170603))

(declare-fun m!170605 () Bool)

(assert (=> d!36652 m!170605))

(declare-fun m!170607 () Bool)

(assert (=> b!114213 m!170607))

(assert (=> b!114213 m!170279))

(declare-fun m!170609 () Bool)

(assert (=> b!114215 m!170609))

(assert (=> b!114215 m!170609))

(declare-fun m!170611 () Bool)

(assert (=> b!114215 m!170611))

(declare-fun m!170613 () Bool)

(assert (=> b!114214 m!170613))

(declare-fun m!170615 () Bool)

(assert (=> b!114216 m!170615))

(assert (=> b!114216 m!170607))

(assert (=> b!114009 d!36652))

(declare-fun d!36656 () Bool)

(declare-fun res!94355 () Bool)

(declare-fun e!74899 () Bool)

(assert (=> d!36656 (=> (not res!94355) (not e!74899))))

(assert (=> d!36656 (= res!94355 (= (size!2352 (buf!2760 thiss!1305)) (size!2352 (buf!2760 (_2!4964 lt!173294)))))))

(assert (=> d!36656 (= (isPrefixOf!0 thiss!1305 (_2!4964 lt!173294)) e!74899)))

(declare-fun b!114217 () Bool)

(declare-fun res!94354 () Bool)

(assert (=> b!114217 (=> (not res!94354) (not e!74899))))

(assert (=> b!114217 (= res!94354 (bvsle (bitIndex!0 (size!2352 (buf!2760 thiss!1305)) (currentByte!5355 thiss!1305) (currentBit!5350 thiss!1305)) (bitIndex!0 (size!2352 (buf!2760 (_2!4964 lt!173294))) (currentByte!5355 (_2!4964 lt!173294)) (currentBit!5350 (_2!4964 lt!173294)))))))

(declare-fun b!114218 () Bool)

(declare-fun e!74898 () Bool)

(assert (=> b!114218 (= e!74899 e!74898)))

(declare-fun res!94353 () Bool)

(assert (=> b!114218 (=> res!94353 e!74898)))

(assert (=> b!114218 (= res!94353 (= (size!2352 (buf!2760 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114219 () Bool)

(assert (=> b!114219 (= e!74898 (arrayBitRangesEq!0 (buf!2760 thiss!1305) (buf!2760 (_2!4964 lt!173294)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2352 (buf!2760 thiss!1305)) (currentByte!5355 thiss!1305) (currentBit!5350 thiss!1305))))))

(assert (= (and d!36656 res!94355) b!114217))

(assert (= (and b!114217 res!94354) b!114218))

(assert (= (and b!114218 (not res!94353)) b!114219))

(assert (=> b!114217 m!170279))

(assert (=> b!114217 m!170277))

(assert (=> b!114219 m!170279))

(assert (=> b!114219 m!170279))

(declare-fun m!170617 () Bool)

(assert (=> b!114219 m!170617))

(assert (=> b!114010 d!36656))

(declare-fun d!36658 () Bool)

(assert (=> d!36658 (= (invariant!0 (currentBit!5350 thiss!1305) (currentByte!5355 thiss!1305) (size!2352 (buf!2760 (_2!4964 lt!173294)))) (and (bvsge (currentBit!5350 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5350 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5355 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5355 thiss!1305) (size!2352 (buf!2760 (_2!4964 lt!173294)))) (and (= (currentBit!5350 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5355 thiss!1305) (size!2352 (buf!2760 (_2!4964 lt!173294))))))))))

(assert (=> b!114011 d!36658))

(declare-fun d!36660 () Bool)

(declare-fun e!74900 () Bool)

(assert (=> d!36660 e!74900))

(declare-fun res!94357 () Bool)

(assert (=> d!36660 (=> (not res!94357) (not e!74900))))

(declare-fun lt!173802 () (_ BitVec 64))

(declare-fun lt!173803 () (_ BitVec 64))

(declare-fun lt!173800 () (_ BitVec 64))

(assert (=> d!36660 (= res!94357 (= lt!173800 (bvsub lt!173802 lt!173803)))))

(assert (=> d!36660 (or (= (bvand lt!173802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173803 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173802 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173802 lt!173803) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36660 (= lt!173803 (remainingBits!0 ((_ sign_extend 32) (size!2352 (buf!2760 (_1!4965 lt!173295)))) ((_ sign_extend 32) (currentByte!5355 (_1!4965 lt!173295))) ((_ sign_extend 32) (currentBit!5350 (_1!4965 lt!173295)))))))

(declare-fun lt!173801 () (_ BitVec 64))

(declare-fun lt!173804 () (_ BitVec 64))

(assert (=> d!36660 (= lt!173802 (bvmul lt!173801 lt!173804))))

(assert (=> d!36660 (or (= lt!173801 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173804 (bvsdiv (bvmul lt!173801 lt!173804) lt!173801)))))

(assert (=> d!36660 (= lt!173804 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36660 (= lt!173801 ((_ sign_extend 32) (size!2352 (buf!2760 (_1!4965 lt!173295)))))))

(assert (=> d!36660 (= lt!173800 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5355 (_1!4965 lt!173295))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5350 (_1!4965 lt!173295)))))))

(assert (=> d!36660 (invariant!0 (currentBit!5350 (_1!4965 lt!173295)) (currentByte!5355 (_1!4965 lt!173295)) (size!2352 (buf!2760 (_1!4965 lt!173295))))))

(assert (=> d!36660 (= (bitIndex!0 (size!2352 (buf!2760 (_1!4965 lt!173295))) (currentByte!5355 (_1!4965 lt!173295)) (currentBit!5350 (_1!4965 lt!173295))) lt!173800)))

(declare-fun b!114220 () Bool)

(declare-fun res!94356 () Bool)

(assert (=> b!114220 (=> (not res!94356) (not e!74900))))

(assert (=> b!114220 (= res!94356 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173800))))

(declare-fun b!114221 () Bool)

(declare-fun lt!173799 () (_ BitVec 64))

(assert (=> b!114221 (= e!74900 (bvsle lt!173800 (bvmul lt!173799 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114221 (or (= lt!173799 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173799 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173799)))))

(assert (=> b!114221 (= lt!173799 ((_ sign_extend 32) (size!2352 (buf!2760 (_1!4965 lt!173295)))))))

(assert (= (and d!36660 res!94357) b!114220))

(assert (= (and b!114220 res!94356) b!114221))

(declare-fun m!170619 () Bool)

(assert (=> d!36660 m!170619))

(declare-fun m!170621 () Bool)

(assert (=> d!36660 m!170621))

(assert (=> b!114012 d!36660))

(declare-fun d!36662 () Bool)

(assert (=> d!36662 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2352 (buf!2760 (_2!4964 lt!173294)))) ((_ sign_extend 32) (currentByte!5355 thiss!1305)) ((_ sign_extend 32) (currentBit!5350 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2352 (buf!2760 (_2!4964 lt!173294)))) ((_ sign_extend 32) (currentByte!5355 thiss!1305)) ((_ sign_extend 32) (currentBit!5350 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8900 () Bool)

(assert (= bs!8900 d!36662))

(declare-fun m!170623 () Bool)

(assert (=> bs!8900 m!170623))

(assert (=> b!114013 d!36662))

(push 1)

(assert (not d!36624))

(assert (not b!114169))

(assert (not b!114216))

(assert (not b!114217))

(assert (not d!36610))

(assert (not b!114219))

(assert (not b!114214))

(assert (not b!114172))

(assert (not b!114055))

(assert (not b!114176))

(assert (not b!114170))

(assert (not b!114057))

(assert (not d!36620))

(assert (not b!114215))

(assert (not b!114167))

(assert (not b!114178))

(assert (not d!36662))

(assert (not b!114175))

(assert (not d!36652))

(assert (not b!114168))

(assert (not d!36614))

(assert (not bm!1460))

(assert (not d!36606))

(assert (not d!36616))

(assert (not b!114040))

(assert (not d!36608))

(assert (not b!114171))

(assert (not d!36660))

(assert (not b!114174))

(assert (not b!114213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

