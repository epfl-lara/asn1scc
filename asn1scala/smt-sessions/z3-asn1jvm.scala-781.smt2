; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22388 () Bool)

(assert start!22388)

(declare-fun b!113245 () Bool)

(declare-fun res!93522 () Bool)

(declare-fun e!74314 () Bool)

(assert (=> b!113245 (=> (not res!93522) (not e!74314))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113245 (= res!93522 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113246 () Bool)

(declare-fun e!74310 () Bool)

(declare-datatypes ((array!5152 0))(
  ( (array!5153 (arr!2935 (Array (_ BitVec 32) (_ BitVec 8))) (size!2342 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4158 0))(
  ( (BitStream!4159 (buf!2750 array!5152) (currentByte!5330 (_ BitVec 32)) (currentBit!5325 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6951 0))(
  ( (Unit!6952) )
))
(declare-datatypes ((tuple2!9328 0))(
  ( (tuple2!9329 (_1!4926 Unit!6951) (_2!4926 BitStream!4158)) )
))
(declare-fun lt!171999 () tuple2!9328)

(declare-fun lt!172001 () tuple2!9328)

(declare-fun isPrefixOf!0 (BitStream!4158 BitStream!4158) Bool)

(assert (=> b!113246 (= e!74310 (isPrefixOf!0 (_2!4926 lt!171999) (_2!4926 lt!172001)))))

(declare-fun b!113247 () Bool)

(declare-fun res!93523 () Bool)

(declare-fun e!74316 () Bool)

(assert (=> b!113247 (=> (not res!93523) (not e!74316))))

(declare-fun thiss!1305 () BitStream!4158)

(assert (=> b!113247 (= res!93523 (isPrefixOf!0 thiss!1305 (_2!4926 lt!171999)))))

(declare-fun res!93527 () Bool)

(assert (=> start!22388 (=> (not res!93527) (not e!74314))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!22388 (= res!93527 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22388 e!74314))

(assert (=> start!22388 true))

(declare-fun e!74315 () Bool)

(declare-fun inv!12 (BitStream!4158) Bool)

(assert (=> start!22388 (and (inv!12 thiss!1305) e!74315)))

(declare-fun b!113248 () Bool)

(declare-fun e!74312 () Bool)

(assert (=> b!113248 (= e!74312 e!74316)))

(declare-fun res!93520 () Bool)

(assert (=> b!113248 (=> (not res!93520) (not e!74316))))

(declare-fun lt!172000 () (_ BitVec 64))

(declare-fun lt!171998 () (_ BitVec 64))

(assert (=> b!113248 (= res!93520 (= lt!172000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!171998)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113248 (= lt!172000 (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!171999))) (currentByte!5330 (_2!4926 lt!171999)) (currentBit!5325 (_2!4926 lt!171999))))))

(assert (=> b!113248 (= lt!171998 (bitIndex!0 (size!2342 (buf!2750 thiss!1305)) (currentByte!5330 thiss!1305) (currentBit!5325 thiss!1305)))))

(declare-fun b!113249 () Bool)

(declare-fun array_inv!2144 (array!5152) Bool)

(assert (=> b!113249 (= e!74315 (array_inv!2144 (buf!2750 thiss!1305)))))

(declare-fun b!113250 () Bool)

(declare-fun e!74313 () Bool)

(assert (=> b!113250 (= e!74316 e!74313)))

(declare-fun res!93521 () Bool)

(assert (=> b!113250 (=> (not res!93521) (not e!74313))))

(declare-datatypes ((tuple2!9330 0))(
  ( (tuple2!9331 (_1!4927 BitStream!4158) (_2!4927 Bool)) )
))
(declare-fun lt!171997 () tuple2!9330)

(declare-fun lt!171996 () Bool)

(assert (=> b!113250 (= res!93521 (and (= (_2!4927 lt!171997) lt!171996) (= (_1!4927 lt!171997) (_2!4926 lt!171999))))))

(declare-fun readBitPure!0 (BitStream!4158) tuple2!9330)

(declare-fun readerFrom!0 (BitStream!4158 (_ BitVec 32) (_ BitVec 32)) BitStream!4158)

(assert (=> b!113250 (= lt!171997 (readBitPure!0 (readerFrom!0 (_2!4926 lt!171999) (currentBit!5325 thiss!1305) (currentByte!5330 thiss!1305))))))

(declare-fun b!113251 () Bool)

(assert (=> b!113251 (= e!74314 (not e!74310))))

(declare-fun res!93526 () Bool)

(assert (=> b!113251 (=> res!93526 e!74310)))

(assert (=> b!113251 (= res!93526 (not (isPrefixOf!0 thiss!1305 (_2!4926 lt!171999))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4158 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9328)

(assert (=> b!113251 (= lt!172001 (appendNLeastSignificantBitsLoop!0 (_2!4926 lt!171999) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!113251 e!74312))

(declare-fun res!93524 () Bool)

(assert (=> b!113251 (=> (not res!93524) (not e!74312))))

(assert (=> b!113251 (= res!93524 (= (size!2342 (buf!2750 thiss!1305)) (size!2342 (buf!2750 (_2!4926 lt!171999)))))))

(declare-fun appendBit!0 (BitStream!4158 Bool) tuple2!9328)

(assert (=> b!113251 (= lt!171999 (appendBit!0 thiss!1305 lt!171996))))

(assert (=> b!113251 (= lt!171996 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113252 () Bool)

(assert (=> b!113252 (= e!74313 (= (bitIndex!0 (size!2342 (buf!2750 (_1!4927 lt!171997))) (currentByte!5330 (_1!4927 lt!171997)) (currentBit!5325 (_1!4927 lt!171997))) lt!172000))))

(declare-fun b!113253 () Bool)

(declare-fun res!93519 () Bool)

(assert (=> b!113253 (=> (not res!93519) (not e!74314))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113253 (= res!93519 (validate_offset_bits!1 ((_ sign_extend 32) (size!2342 (buf!2750 thiss!1305))) ((_ sign_extend 32) (currentByte!5330 thiss!1305)) ((_ sign_extend 32) (currentBit!5325 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113254 () Bool)

(declare-fun res!93525 () Bool)

(assert (=> b!113254 (=> (not res!93525) (not e!74314))))

(assert (=> b!113254 (= res!93525 (bvslt i!615 nBits!396))))

(assert (= (and start!22388 res!93527) b!113253))

(assert (= (and b!113253 res!93519) b!113245))

(assert (= (and b!113245 res!93522) b!113254))

(assert (= (and b!113254 res!93525) b!113251))

(assert (= (and b!113251 res!93524) b!113248))

(assert (= (and b!113248 res!93520) b!113247))

(assert (= (and b!113247 res!93523) b!113250))

(assert (= (and b!113250 res!93521) b!113252))

(assert (= (and b!113251 (not res!93526)) b!113246))

(assert (= start!22388 b!113249))

(declare-fun m!169257 () Bool)

(assert (=> b!113245 m!169257))

(declare-fun m!169259 () Bool)

(assert (=> b!113252 m!169259))

(declare-fun m!169261 () Bool)

(assert (=> b!113253 m!169261))

(declare-fun m!169263 () Bool)

(assert (=> b!113247 m!169263))

(declare-fun m!169265 () Bool)

(assert (=> start!22388 m!169265))

(assert (=> b!113251 m!169263))

(declare-fun m!169267 () Bool)

(assert (=> b!113251 m!169267))

(declare-fun m!169269 () Bool)

(assert (=> b!113251 m!169269))

(declare-fun m!169271 () Bool)

(assert (=> b!113246 m!169271))

(declare-fun m!169273 () Bool)

(assert (=> b!113250 m!169273))

(assert (=> b!113250 m!169273))

(declare-fun m!169275 () Bool)

(assert (=> b!113250 m!169275))

(declare-fun m!169277 () Bool)

(assert (=> b!113248 m!169277))

(declare-fun m!169279 () Bool)

(assert (=> b!113248 m!169279))

(declare-fun m!169281 () Bool)

(assert (=> b!113249 m!169281))

(check-sat (not b!113250) (not b!113249) (not b!113247) (not b!113252) (not b!113251) (not b!113246) (not b!113248) (not start!22388) (not b!113253) (not b!113245))
(check-sat)
(get-model)

(declare-fun d!36404 () Bool)

(assert (=> d!36404 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!113245 d!36404))

(declare-fun d!36406 () Bool)

(declare-datatypes ((tuple2!9336 0))(
  ( (tuple2!9337 (_1!4930 Bool) (_2!4930 BitStream!4158)) )
))
(declare-fun lt!172022 () tuple2!9336)

(declare-fun readBit!0 (BitStream!4158) tuple2!9336)

(assert (=> d!36406 (= lt!172022 (readBit!0 (readerFrom!0 (_2!4926 lt!171999) (currentBit!5325 thiss!1305) (currentByte!5330 thiss!1305))))))

(assert (=> d!36406 (= (readBitPure!0 (readerFrom!0 (_2!4926 lt!171999) (currentBit!5325 thiss!1305) (currentByte!5330 thiss!1305))) (tuple2!9331 (_2!4930 lt!172022) (_1!4930 lt!172022)))))

(declare-fun bs!8856 () Bool)

(assert (= bs!8856 d!36406))

(assert (=> bs!8856 m!169273))

(declare-fun m!169309 () Bool)

(assert (=> bs!8856 m!169309))

(assert (=> b!113250 d!36406))

(declare-fun d!36408 () Bool)

(declare-fun e!74340 () Bool)

(assert (=> d!36408 e!74340))

(declare-fun res!93558 () Bool)

(assert (=> d!36408 (=> (not res!93558) (not e!74340))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!36408 (= res!93558 (invariant!0 (currentBit!5325 (_2!4926 lt!171999)) (currentByte!5330 (_2!4926 lt!171999)) (size!2342 (buf!2750 (_2!4926 lt!171999)))))))

(assert (=> d!36408 (= (readerFrom!0 (_2!4926 lt!171999) (currentBit!5325 thiss!1305) (currentByte!5330 thiss!1305)) (BitStream!4159 (buf!2750 (_2!4926 lt!171999)) (currentByte!5330 thiss!1305) (currentBit!5325 thiss!1305)))))

(declare-fun b!113287 () Bool)

(assert (=> b!113287 (= e!74340 (invariant!0 (currentBit!5325 thiss!1305) (currentByte!5330 thiss!1305) (size!2342 (buf!2750 (_2!4926 lt!171999)))))))

(assert (= (and d!36408 res!93558) b!113287))

(declare-fun m!169311 () Bool)

(assert (=> d!36408 m!169311))

(declare-fun m!169313 () Bool)

(assert (=> b!113287 m!169313))

(assert (=> b!113250 d!36408))

(declare-fun d!36410 () Bool)

(assert (=> d!36410 (= (array_inv!2144 (buf!2750 thiss!1305)) (bvsge (size!2342 (buf!2750 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!113249 d!36410))

(declare-fun d!36412 () Bool)

(assert (=> d!36412 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5325 thiss!1305) (currentByte!5330 thiss!1305) (size!2342 (buf!2750 thiss!1305))))))

(declare-fun bs!8857 () Bool)

(assert (= bs!8857 d!36412))

(declare-fun m!169315 () Bool)

(assert (=> bs!8857 m!169315))

(assert (=> start!22388 d!36412))

(declare-fun d!36414 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36414 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2342 (buf!2750 thiss!1305))) ((_ sign_extend 32) (currentByte!5330 thiss!1305)) ((_ sign_extend 32) (currentBit!5325 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2342 (buf!2750 thiss!1305))) ((_ sign_extend 32) (currentByte!5330 thiss!1305)) ((_ sign_extend 32) (currentBit!5325 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8858 () Bool)

(assert (= bs!8858 d!36414))

(declare-fun m!169317 () Bool)

(assert (=> bs!8858 m!169317))

(assert (=> b!113253 d!36414))

(declare-fun d!36416 () Bool)

(declare-fun e!74343 () Bool)

(assert (=> d!36416 e!74343))

(declare-fun res!93564 () Bool)

(assert (=> d!36416 (=> (not res!93564) (not e!74343))))

(declare-fun lt!172039 () (_ BitVec 64))

(declare-fun lt!172037 () (_ BitVec 64))

(declare-fun lt!172036 () (_ BitVec 64))

(assert (=> d!36416 (= res!93564 (= lt!172039 (bvsub lt!172037 lt!172036)))))

(assert (=> d!36416 (or (= (bvand lt!172037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172036 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172037 lt!172036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36416 (= lt!172036 (remainingBits!0 ((_ sign_extend 32) (size!2342 (buf!2750 (_2!4926 lt!171999)))) ((_ sign_extend 32) (currentByte!5330 (_2!4926 lt!171999))) ((_ sign_extend 32) (currentBit!5325 (_2!4926 lt!171999)))))))

(declare-fun lt!172038 () (_ BitVec 64))

(declare-fun lt!172040 () (_ BitVec 64))

(assert (=> d!36416 (= lt!172037 (bvmul lt!172038 lt!172040))))

(assert (=> d!36416 (or (= lt!172038 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172040 (bvsdiv (bvmul lt!172038 lt!172040) lt!172038)))))

(assert (=> d!36416 (= lt!172040 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36416 (= lt!172038 ((_ sign_extend 32) (size!2342 (buf!2750 (_2!4926 lt!171999)))))))

(assert (=> d!36416 (= lt!172039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5330 (_2!4926 lt!171999))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5325 (_2!4926 lt!171999)))))))

(assert (=> d!36416 (invariant!0 (currentBit!5325 (_2!4926 lt!171999)) (currentByte!5330 (_2!4926 lt!171999)) (size!2342 (buf!2750 (_2!4926 lt!171999))))))

(assert (=> d!36416 (= (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!171999))) (currentByte!5330 (_2!4926 lt!171999)) (currentBit!5325 (_2!4926 lt!171999))) lt!172039)))

(declare-fun b!113292 () Bool)

(declare-fun res!93563 () Bool)

(assert (=> b!113292 (=> (not res!93563) (not e!74343))))

(assert (=> b!113292 (= res!93563 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172039))))

(declare-fun b!113293 () Bool)

(declare-fun lt!172035 () (_ BitVec 64))

(assert (=> b!113293 (= e!74343 (bvsle lt!172039 (bvmul lt!172035 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113293 (or (= lt!172035 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172035 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172035)))))

(assert (=> b!113293 (= lt!172035 ((_ sign_extend 32) (size!2342 (buf!2750 (_2!4926 lt!171999)))))))

(assert (= (and d!36416 res!93564) b!113292))

(assert (= (and b!113292 res!93563) b!113293))

(declare-fun m!169319 () Bool)

(assert (=> d!36416 m!169319))

(assert (=> d!36416 m!169311))

(assert (=> b!113248 d!36416))

(declare-fun d!36418 () Bool)

(declare-fun e!74344 () Bool)

(assert (=> d!36418 e!74344))

(declare-fun res!93566 () Bool)

(assert (=> d!36418 (=> (not res!93566) (not e!74344))))

(declare-fun lt!172045 () (_ BitVec 64))

(declare-fun lt!172042 () (_ BitVec 64))

(declare-fun lt!172043 () (_ BitVec 64))

(assert (=> d!36418 (= res!93566 (= lt!172045 (bvsub lt!172043 lt!172042)))))

(assert (=> d!36418 (or (= (bvand lt!172043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172042 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172043 lt!172042) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36418 (= lt!172042 (remainingBits!0 ((_ sign_extend 32) (size!2342 (buf!2750 thiss!1305))) ((_ sign_extend 32) (currentByte!5330 thiss!1305)) ((_ sign_extend 32) (currentBit!5325 thiss!1305))))))

(declare-fun lt!172044 () (_ BitVec 64))

(declare-fun lt!172046 () (_ BitVec 64))

(assert (=> d!36418 (= lt!172043 (bvmul lt!172044 lt!172046))))

(assert (=> d!36418 (or (= lt!172044 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172046 (bvsdiv (bvmul lt!172044 lt!172046) lt!172044)))))

(assert (=> d!36418 (= lt!172046 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36418 (= lt!172044 ((_ sign_extend 32) (size!2342 (buf!2750 thiss!1305))))))

(assert (=> d!36418 (= lt!172045 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5330 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5325 thiss!1305))))))

(assert (=> d!36418 (invariant!0 (currentBit!5325 thiss!1305) (currentByte!5330 thiss!1305) (size!2342 (buf!2750 thiss!1305)))))

(assert (=> d!36418 (= (bitIndex!0 (size!2342 (buf!2750 thiss!1305)) (currentByte!5330 thiss!1305) (currentBit!5325 thiss!1305)) lt!172045)))

(declare-fun b!113294 () Bool)

(declare-fun res!93565 () Bool)

(assert (=> b!113294 (=> (not res!93565) (not e!74344))))

(assert (=> b!113294 (= res!93565 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172045))))

(declare-fun b!113295 () Bool)

(declare-fun lt!172041 () (_ BitVec 64))

(assert (=> b!113295 (= e!74344 (bvsle lt!172045 (bvmul lt!172041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113295 (or (= lt!172041 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172041 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172041)))))

(assert (=> b!113295 (= lt!172041 ((_ sign_extend 32) (size!2342 (buf!2750 thiss!1305))))))

(assert (= (and d!36418 res!93566) b!113294))

(assert (= (and b!113294 res!93565) b!113295))

(assert (=> d!36418 m!169317))

(assert (=> d!36418 m!169315))

(assert (=> b!113248 d!36418))

(declare-fun d!36420 () Bool)

(declare-fun res!93574 () Bool)

(declare-fun e!74350 () Bool)

(assert (=> d!36420 (=> (not res!93574) (not e!74350))))

(assert (=> d!36420 (= res!93574 (= (size!2342 (buf!2750 thiss!1305)) (size!2342 (buf!2750 (_2!4926 lt!171999)))))))

(assert (=> d!36420 (= (isPrefixOf!0 thiss!1305 (_2!4926 lt!171999)) e!74350)))

(declare-fun b!113302 () Bool)

(declare-fun res!93573 () Bool)

(assert (=> b!113302 (=> (not res!93573) (not e!74350))))

(assert (=> b!113302 (= res!93573 (bvsle (bitIndex!0 (size!2342 (buf!2750 thiss!1305)) (currentByte!5330 thiss!1305) (currentBit!5325 thiss!1305)) (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!171999))) (currentByte!5330 (_2!4926 lt!171999)) (currentBit!5325 (_2!4926 lt!171999)))))))

(declare-fun b!113303 () Bool)

(declare-fun e!74349 () Bool)

(assert (=> b!113303 (= e!74350 e!74349)))

(declare-fun res!93575 () Bool)

(assert (=> b!113303 (=> res!93575 e!74349)))

(assert (=> b!113303 (= res!93575 (= (size!2342 (buf!2750 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!113304 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5152 array!5152 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113304 (= e!74349 (arrayBitRangesEq!0 (buf!2750 thiss!1305) (buf!2750 (_2!4926 lt!171999)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2342 (buf!2750 thiss!1305)) (currentByte!5330 thiss!1305) (currentBit!5325 thiss!1305))))))

(assert (= (and d!36420 res!93574) b!113302))

(assert (= (and b!113302 res!93573) b!113303))

(assert (= (and b!113303 (not res!93575)) b!113304))

(assert (=> b!113302 m!169279))

(assert (=> b!113302 m!169277))

(assert (=> b!113304 m!169279))

(assert (=> b!113304 m!169279))

(declare-fun m!169321 () Bool)

(assert (=> b!113304 m!169321))

(assert (=> b!113247 d!36420))

(declare-fun d!36422 () Bool)

(declare-fun e!74351 () Bool)

(assert (=> d!36422 e!74351))

(declare-fun res!93577 () Bool)

(assert (=> d!36422 (=> (not res!93577) (not e!74351))))

(declare-fun lt!172051 () (_ BitVec 64))

(declare-fun lt!172048 () (_ BitVec 64))

(declare-fun lt!172049 () (_ BitVec 64))

(assert (=> d!36422 (= res!93577 (= lt!172051 (bvsub lt!172049 lt!172048)))))

(assert (=> d!36422 (or (= (bvand lt!172049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172048 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!172049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!172049 lt!172048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36422 (= lt!172048 (remainingBits!0 ((_ sign_extend 32) (size!2342 (buf!2750 (_1!4927 lt!171997)))) ((_ sign_extend 32) (currentByte!5330 (_1!4927 lt!171997))) ((_ sign_extend 32) (currentBit!5325 (_1!4927 lt!171997)))))))

(declare-fun lt!172050 () (_ BitVec 64))

(declare-fun lt!172052 () (_ BitVec 64))

(assert (=> d!36422 (= lt!172049 (bvmul lt!172050 lt!172052))))

(assert (=> d!36422 (or (= lt!172050 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!172052 (bvsdiv (bvmul lt!172050 lt!172052) lt!172050)))))

(assert (=> d!36422 (= lt!172052 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36422 (= lt!172050 ((_ sign_extend 32) (size!2342 (buf!2750 (_1!4927 lt!171997)))))))

(assert (=> d!36422 (= lt!172051 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5330 (_1!4927 lt!171997))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5325 (_1!4927 lt!171997)))))))

(assert (=> d!36422 (invariant!0 (currentBit!5325 (_1!4927 lt!171997)) (currentByte!5330 (_1!4927 lt!171997)) (size!2342 (buf!2750 (_1!4927 lt!171997))))))

(assert (=> d!36422 (= (bitIndex!0 (size!2342 (buf!2750 (_1!4927 lt!171997))) (currentByte!5330 (_1!4927 lt!171997)) (currentBit!5325 (_1!4927 lt!171997))) lt!172051)))

(declare-fun b!113305 () Bool)

(declare-fun res!93576 () Bool)

(assert (=> b!113305 (=> (not res!93576) (not e!74351))))

(assert (=> b!113305 (= res!93576 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!172051))))

(declare-fun b!113306 () Bool)

(declare-fun lt!172047 () (_ BitVec 64))

(assert (=> b!113306 (= e!74351 (bvsle lt!172051 (bvmul lt!172047 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113306 (or (= lt!172047 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!172047 #b0000000000000000000000000000000000000000000000000000000000001000) lt!172047)))))

(assert (=> b!113306 (= lt!172047 ((_ sign_extend 32) (size!2342 (buf!2750 (_1!4927 lt!171997)))))))

(assert (= (and d!36422 res!93577) b!113305))

(assert (= (and b!113305 res!93576) b!113306))

(declare-fun m!169323 () Bool)

(assert (=> d!36422 m!169323))

(declare-fun m!169325 () Bool)

(assert (=> d!36422 m!169325))

(assert (=> b!113252 d!36422))

(assert (=> b!113251 d!36420))

(declare-fun b!113403 () Bool)

(declare-fun res!93659 () Bool)

(declare-fun e!74411 () Bool)

(assert (=> b!113403 (=> (not res!93659) (not e!74411))))

(declare-fun lt!172308 () tuple2!9328)

(declare-fun lt!172321 () (_ BitVec 64))

(declare-fun lt!172284 () (_ BitVec 64))

(assert (=> b!113403 (= res!93659 (= (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!172308))) (currentByte!5330 (_2!4926 lt!172308)) (currentBit!5325 (_2!4926 lt!172308))) (bvadd lt!172321 lt!172284)))))

(assert (=> b!113403 (or (not (= (bvand lt!172321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172284 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!172321 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!172321 lt!172284) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113403 (= lt!172284 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113403 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113403 (= lt!172321 (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!171999))) (currentByte!5330 (_2!4926 lt!171999)) (currentBit!5325 (_2!4926 lt!171999))))))

(declare-fun b!113404 () Bool)

(declare-fun res!93661 () Bool)

(assert (=> b!113404 (=> (not res!93661) (not e!74411))))

(assert (=> b!113404 (= res!93661 (isPrefixOf!0 (_2!4926 lt!171999) (_2!4926 lt!172308)))))

(declare-fun b!113405 () Bool)

(declare-fun e!74410 () tuple2!9328)

(declare-fun lt!172318 () tuple2!9328)

(declare-fun Unit!6955 () Unit!6951)

(assert (=> b!113405 (= e!74410 (tuple2!9329 Unit!6955 (_2!4926 lt!172318)))))

(declare-fun lt!172323 () Bool)

(assert (=> b!113405 (= lt!172323 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!172317 () tuple2!9328)

(assert (=> b!113405 (= lt!172317 (appendBit!0 (_2!4926 lt!171999) lt!172323))))

(declare-fun res!93657 () Bool)

(assert (=> b!113405 (= res!93657 (= (size!2342 (buf!2750 (_2!4926 lt!171999))) (size!2342 (buf!2750 (_2!4926 lt!172317)))))))

(declare-fun e!74414 () Bool)

(assert (=> b!113405 (=> (not res!93657) (not e!74414))))

(assert (=> b!113405 e!74414))

(declare-fun lt!172316 () tuple2!9328)

(assert (=> b!113405 (= lt!172316 lt!172317)))

(assert (=> b!113405 (= lt!172318 (appendNLeastSignificantBitsLoop!0 (_2!4926 lt!172316) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!172310 () Unit!6951)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4158 BitStream!4158 BitStream!4158) Unit!6951)

(assert (=> b!113405 (= lt!172310 (lemmaIsPrefixTransitive!0 (_2!4926 lt!171999) (_2!4926 lt!172316) (_2!4926 lt!172318)))))

(assert (=> b!113405 (isPrefixOf!0 (_2!4926 lt!171999) (_2!4926 lt!172318))))

(declare-fun lt!172303 () Unit!6951)

(assert (=> b!113405 (= lt!172303 lt!172310)))

(assert (=> b!113405 (invariant!0 (currentBit!5325 (_2!4926 lt!171999)) (currentByte!5330 (_2!4926 lt!171999)) (size!2342 (buf!2750 (_2!4926 lt!172316))))))

(declare-fun lt!172289 () BitStream!4158)

(assert (=> b!113405 (= lt!172289 (BitStream!4159 (buf!2750 (_2!4926 lt!172316)) (currentByte!5330 (_2!4926 lt!171999)) (currentBit!5325 (_2!4926 lt!171999))))))

(assert (=> b!113405 (invariant!0 (currentBit!5325 lt!172289) (currentByte!5330 lt!172289) (size!2342 (buf!2750 (_2!4926 lt!172318))))))

(declare-fun lt!172311 () BitStream!4158)

(assert (=> b!113405 (= lt!172311 (BitStream!4159 (buf!2750 (_2!4926 lt!172318)) (currentByte!5330 lt!172289) (currentBit!5325 lt!172289)))))

(declare-fun lt!172309 () tuple2!9330)

(assert (=> b!113405 (= lt!172309 (readBitPure!0 lt!172289))))

(declare-fun lt!172286 () tuple2!9330)

(assert (=> b!113405 (= lt!172286 (readBitPure!0 lt!172311))))

(declare-fun lt!172288 () Unit!6951)

(declare-fun readBitPrefixLemma!0 (BitStream!4158 BitStream!4158) Unit!6951)

(assert (=> b!113405 (= lt!172288 (readBitPrefixLemma!0 lt!172289 (_2!4926 lt!172318)))))

(declare-fun res!93656 () Bool)

(assert (=> b!113405 (= res!93656 (= (bitIndex!0 (size!2342 (buf!2750 (_1!4927 lt!172309))) (currentByte!5330 (_1!4927 lt!172309)) (currentBit!5325 (_1!4927 lt!172309))) (bitIndex!0 (size!2342 (buf!2750 (_1!4927 lt!172286))) (currentByte!5330 (_1!4927 lt!172286)) (currentBit!5325 (_1!4927 lt!172286)))))))

(declare-fun e!74409 () Bool)

(assert (=> b!113405 (=> (not res!93656) (not e!74409))))

(assert (=> b!113405 e!74409))

(declare-fun lt!172315 () Unit!6951)

(assert (=> b!113405 (= lt!172315 lt!172288)))

(declare-datatypes ((tuple2!9338 0))(
  ( (tuple2!9339 (_1!4931 BitStream!4158) (_2!4931 BitStream!4158)) )
))
(declare-fun lt!172301 () tuple2!9338)

(declare-fun reader!0 (BitStream!4158 BitStream!4158) tuple2!9338)

(assert (=> b!113405 (= lt!172301 (reader!0 (_2!4926 lt!171999) (_2!4926 lt!172318)))))

(declare-fun lt!172280 () tuple2!9338)

(assert (=> b!113405 (= lt!172280 (reader!0 (_2!4926 lt!172316) (_2!4926 lt!172318)))))

(declare-fun lt!172305 () tuple2!9330)

(assert (=> b!113405 (= lt!172305 (readBitPure!0 (_1!4931 lt!172301)))))

(assert (=> b!113405 (= (_2!4927 lt!172305) lt!172323)))

(declare-fun lt!172294 () Unit!6951)

(declare-fun Unit!6956 () Unit!6951)

(assert (=> b!113405 (= lt!172294 Unit!6956)))

(declare-fun lt!172283 () (_ BitVec 64))

(assert (=> b!113405 (= lt!172283 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!172282 () (_ BitVec 64))

(assert (=> b!113405 (= lt!172282 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!172292 () Unit!6951)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4158 array!5152 (_ BitVec 64)) Unit!6951)

(assert (=> b!113405 (= lt!172292 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4926 lt!171999) (buf!2750 (_2!4926 lt!172318)) lt!172282))))

(assert (=> b!113405 (validate_offset_bits!1 ((_ sign_extend 32) (size!2342 (buf!2750 (_2!4926 lt!172318)))) ((_ sign_extend 32) (currentByte!5330 (_2!4926 lt!171999))) ((_ sign_extend 32) (currentBit!5325 (_2!4926 lt!171999))) lt!172282)))

(declare-fun lt!172320 () Unit!6951)

(assert (=> b!113405 (= lt!172320 lt!172292)))

(declare-datatypes ((tuple2!9340 0))(
  ( (tuple2!9341 (_1!4932 BitStream!4158) (_2!4932 (_ BitVec 64))) )
))
(declare-fun lt!172306 () tuple2!9340)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9340)

(assert (=> b!113405 (= lt!172306 (readNLeastSignificantBitsLoopPure!0 (_1!4931 lt!172301) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172283))))

(declare-fun lt!172299 () (_ BitVec 64))

(assert (=> b!113405 (= lt!172299 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!172287 () Unit!6951)

(assert (=> b!113405 (= lt!172287 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4926 lt!172316) (buf!2750 (_2!4926 lt!172318)) lt!172299))))

(assert (=> b!113405 (validate_offset_bits!1 ((_ sign_extend 32) (size!2342 (buf!2750 (_2!4926 lt!172318)))) ((_ sign_extend 32) (currentByte!5330 (_2!4926 lt!172316))) ((_ sign_extend 32) (currentBit!5325 (_2!4926 lt!172316))) lt!172299)))

(declare-fun lt!172285 () Unit!6951)

(assert (=> b!113405 (= lt!172285 lt!172287)))

(declare-fun lt!172319 () tuple2!9340)

(assert (=> b!113405 (= lt!172319 (readNLeastSignificantBitsLoopPure!0 (_1!4931 lt!172280) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!172283 (ite (_2!4927 lt!172305) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!172298 () tuple2!9340)

(assert (=> b!113405 (= lt!172298 (readNLeastSignificantBitsLoopPure!0 (_1!4931 lt!172301) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172283))))

(declare-fun c!6882 () Bool)

(assert (=> b!113405 (= c!6882 (_2!4927 (readBitPure!0 (_1!4931 lt!172301))))))

(declare-fun lt!172281 () tuple2!9340)

(declare-fun e!74412 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4158 (_ BitVec 64)) BitStream!4158)

(assert (=> b!113405 (= lt!172281 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4931 lt!172301) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!172283 e!74412)))))

(declare-fun lt!172324 () Unit!6951)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6951)

(assert (=> b!113405 (= lt!172324 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4931 lt!172301) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172283))))

(assert (=> b!113405 (and (= (_2!4932 lt!172298) (_2!4932 lt!172281)) (= (_1!4932 lt!172298) (_1!4932 lt!172281)))))

(declare-fun lt!172314 () Unit!6951)

(assert (=> b!113405 (= lt!172314 lt!172324)))

(assert (=> b!113405 (= (_1!4931 lt!172301) (withMovedBitIndex!0 (_2!4931 lt!172301) (bvsub (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!171999))) (currentByte!5330 (_2!4926 lt!171999)) (currentBit!5325 (_2!4926 lt!171999))) (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!172318))) (currentByte!5330 (_2!4926 lt!172318)) (currentBit!5325 (_2!4926 lt!172318))))))))

(declare-fun lt!172313 () Unit!6951)

(declare-fun Unit!6958 () Unit!6951)

(assert (=> b!113405 (= lt!172313 Unit!6958)))

(assert (=> b!113405 (= (_1!4931 lt!172280) (withMovedBitIndex!0 (_2!4931 lt!172280) (bvsub (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!172316))) (currentByte!5330 (_2!4926 lt!172316)) (currentBit!5325 (_2!4926 lt!172316))) (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!172318))) (currentByte!5330 (_2!4926 lt!172318)) (currentBit!5325 (_2!4926 lt!172318))))))))

(declare-fun lt!172307 () Unit!6951)

(declare-fun Unit!6959 () Unit!6951)

(assert (=> b!113405 (= lt!172307 Unit!6959)))

(assert (=> b!113405 (= (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!171999))) (currentByte!5330 (_2!4926 lt!171999)) (currentBit!5325 (_2!4926 lt!171999))) (bvsub (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!172316))) (currentByte!5330 (_2!4926 lt!172316)) (currentBit!5325 (_2!4926 lt!172316))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!172293 () Unit!6951)

(declare-fun Unit!6960 () Unit!6951)

(assert (=> b!113405 (= lt!172293 Unit!6960)))

(assert (=> b!113405 (= (_2!4932 lt!172306) (_2!4932 lt!172319))))

(declare-fun lt!172312 () Unit!6951)

(declare-fun Unit!6961 () Unit!6951)

(assert (=> b!113405 (= lt!172312 Unit!6961)))

(assert (=> b!113405 (= (_1!4932 lt!172306) (_2!4931 lt!172301))))

(declare-fun b!113406 () Bool)

(declare-fun res!93658 () Bool)

(assert (=> b!113406 (= res!93658 (= (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!172317))) (currentByte!5330 (_2!4926 lt!172317)) (currentBit!5325 (_2!4926 lt!172317))) (bvadd (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!171999))) (currentByte!5330 (_2!4926 lt!171999)) (currentBit!5325 (_2!4926 lt!171999))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!113406 (=> (not res!93658) (not e!74414))))

(declare-fun b!113407 () Bool)

(assert (=> b!113407 (= e!74412 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!113408 () Bool)

(declare-fun res!93662 () Bool)

(declare-fun call!1444 () Bool)

(assert (=> b!113408 (= res!93662 call!1444)))

(assert (=> b!113408 (=> (not res!93662) (not e!74414))))

(declare-fun b!113409 () Bool)

(declare-fun e!74413 () Bool)

(declare-fun lt!172291 () (_ BitVec 64))

(assert (=> b!113409 (= e!74413 (validate_offset_bits!1 ((_ sign_extend 32) (size!2342 (buf!2750 (_2!4926 lt!171999)))) ((_ sign_extend 32) (currentByte!5330 (_2!4926 lt!171999))) ((_ sign_extend 32) (currentBit!5325 (_2!4926 lt!171999))) lt!172291))))

(declare-fun d!36424 () Bool)

(assert (=> d!36424 e!74411))

(declare-fun res!93655 () Bool)

(assert (=> d!36424 (=> (not res!93655) (not e!74411))))

(assert (=> d!36424 (= res!93655 (= (size!2342 (buf!2750 (_2!4926 lt!171999))) (size!2342 (buf!2750 (_2!4926 lt!172308)))))))

(assert (=> d!36424 (= lt!172308 e!74410)))

(declare-fun c!6883 () Bool)

(assert (=> d!36424 (= c!6883 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36424 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36424 (= (appendNLeastSignificantBitsLoop!0 (_2!4926 lt!171999) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!172308)))

(declare-fun b!113410 () Bool)

(assert (=> b!113410 (= e!74409 (= (_2!4927 lt!172309) (_2!4927 lt!172286)))))

(declare-fun b!113411 () Bool)

(assert (=> b!113411 (= e!74412 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!113412 () Bool)

(declare-fun e!74408 () Bool)

(declare-fun lt!172304 () tuple2!9330)

(assert (=> b!113412 (= e!74408 (= (bitIndex!0 (size!2342 (buf!2750 (_1!4927 lt!172304))) (currentByte!5330 (_1!4927 lt!172304)) (currentBit!5325 (_1!4927 lt!172304))) (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!172317))) (currentByte!5330 (_2!4926 lt!172317)) (currentBit!5325 (_2!4926 lt!172317)))))))

(declare-fun b!113413 () Bool)

(declare-fun lt!172302 () Unit!6951)

(assert (=> b!113413 (= e!74410 (tuple2!9329 lt!172302 (_2!4926 lt!171999)))))

(declare-fun lt!172295 () BitStream!4158)

(assert (=> b!113413 (= lt!172295 (_2!4926 lt!171999))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4158) Unit!6951)

(assert (=> b!113413 (= lt!172302 (lemmaIsPrefixRefl!0 lt!172295))))

(assert (=> b!113413 call!1444))

(declare-fun b!113414 () Bool)

(declare-fun lt!172322 () tuple2!9338)

(declare-fun lt!172297 () tuple2!9340)

(assert (=> b!113414 (= e!74411 (and (= (_2!4932 lt!172297) v!199) (= (_1!4932 lt!172297) (_2!4931 lt!172322))))))

(declare-fun lt!172296 () (_ BitVec 64))

(assert (=> b!113414 (= lt!172297 (readNLeastSignificantBitsLoopPure!0 (_1!4931 lt!172322) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!172296))))

(declare-fun lt!172300 () Unit!6951)

(declare-fun lt!172290 () Unit!6951)

(assert (=> b!113414 (= lt!172300 lt!172290)))

(assert (=> b!113414 (validate_offset_bits!1 ((_ sign_extend 32) (size!2342 (buf!2750 (_2!4926 lt!172308)))) ((_ sign_extend 32) (currentByte!5330 (_2!4926 lt!171999))) ((_ sign_extend 32) (currentBit!5325 (_2!4926 lt!171999))) lt!172291)))

(assert (=> b!113414 (= lt!172290 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4926 lt!171999) (buf!2750 (_2!4926 lt!172308)) lt!172291))))

(assert (=> b!113414 e!74413))

(declare-fun res!93660 () Bool)

(assert (=> b!113414 (=> (not res!93660) (not e!74413))))

(assert (=> b!113414 (= res!93660 (and (= (size!2342 (buf!2750 (_2!4926 lt!171999))) (size!2342 (buf!2750 (_2!4926 lt!172308)))) (bvsge lt!172291 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113414 (= lt!172291 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113414 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113414 (= lt!172296 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!113414 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113414 (= lt!172322 (reader!0 (_2!4926 lt!171999) (_2!4926 lt!172308)))))

(declare-fun bm!1441 () Bool)

(assert (=> bm!1441 (= call!1444 (isPrefixOf!0 (ite c!6883 (_2!4926 lt!171999) lt!172295) (ite c!6883 (_2!4926 lt!172317) lt!172295)))))

(declare-fun b!113415 () Bool)

(assert (=> b!113415 (= lt!172304 (readBitPure!0 (readerFrom!0 (_2!4926 lt!172317) (currentBit!5325 (_2!4926 lt!171999)) (currentByte!5330 (_2!4926 lt!171999)))))))

(declare-fun res!93663 () Bool)

(assert (=> b!113415 (= res!93663 (and (= (_2!4927 lt!172304) lt!172323) (= (_1!4927 lt!172304) (_2!4926 lt!172317))))))

(assert (=> b!113415 (=> (not res!93663) (not e!74408))))

(assert (=> b!113415 (= e!74414 e!74408)))

(assert (= (and d!36424 c!6883) b!113405))

(assert (= (and d!36424 (not c!6883)) b!113413))

(assert (= (and b!113405 res!93657) b!113406))

(assert (= (and b!113406 res!93658) b!113408))

(assert (= (and b!113408 res!93662) b!113415))

(assert (= (and b!113415 res!93663) b!113412))

(assert (= (and b!113405 res!93656) b!113410))

(assert (= (and b!113405 c!6882) b!113407))

(assert (= (and b!113405 (not c!6882)) b!113411))

(assert (= (or b!113408 b!113413) bm!1441))

(assert (= (and d!36424 res!93655) b!113403))

(assert (= (and b!113403 res!93659) b!113404))

(assert (= (and b!113404 res!93661) b!113414))

(assert (= (and b!113414 res!93660) b!113409))

(declare-fun m!169345 () Bool)

(assert (=> b!113403 m!169345))

(assert (=> b!113403 m!169277))

(declare-fun m!169347 () Bool)

(assert (=> b!113405 m!169347))

(declare-fun m!169349 () Bool)

(assert (=> b!113405 m!169349))

(declare-fun m!169351 () Bool)

(assert (=> b!113405 m!169351))

(declare-fun m!169353 () Bool)

(assert (=> b!113405 m!169353))

(declare-fun m!169355 () Bool)

(assert (=> b!113405 m!169355))

(declare-fun m!169357 () Bool)

(assert (=> b!113405 m!169357))

(declare-fun m!169359 () Bool)

(assert (=> b!113405 m!169359))

(declare-fun m!169361 () Bool)

(assert (=> b!113405 m!169361))

(declare-fun m!169363 () Bool)

(assert (=> b!113405 m!169363))

(declare-fun m!169365 () Bool)

(assert (=> b!113405 m!169365))

(declare-fun m!169367 () Bool)

(assert (=> b!113405 m!169367))

(declare-fun m!169369 () Bool)

(assert (=> b!113405 m!169369))

(declare-fun m!169371 () Bool)

(assert (=> b!113405 m!169371))

(declare-fun m!169373 () Bool)

(assert (=> b!113405 m!169373))

(declare-fun m!169375 () Bool)

(assert (=> b!113405 m!169375))

(declare-fun m!169377 () Bool)

(assert (=> b!113405 m!169377))

(declare-fun m!169379 () Bool)

(assert (=> b!113405 m!169379))

(declare-fun m!169381 () Bool)

(assert (=> b!113405 m!169381))

(declare-fun m!169383 () Bool)

(assert (=> b!113405 m!169383))

(declare-fun m!169385 () Bool)

(assert (=> b!113405 m!169385))

(declare-fun m!169387 () Bool)

(assert (=> b!113405 m!169387))

(assert (=> b!113405 m!169377))

(declare-fun m!169389 () Bool)

(assert (=> b!113405 m!169389))

(assert (=> b!113405 m!169277))

(declare-fun m!169391 () Bool)

(assert (=> b!113405 m!169391))

(declare-fun m!169393 () Bool)

(assert (=> b!113405 m!169393))

(declare-fun m!169395 () Bool)

(assert (=> b!113405 m!169395))

(declare-fun m!169397 () Bool)

(assert (=> b!113405 m!169397))

(declare-fun m!169399 () Bool)

(assert (=> b!113405 m!169399))

(declare-fun m!169401 () Bool)

(assert (=> b!113405 m!169401))

(declare-fun m!169403 () Bool)

(assert (=> b!113404 m!169403))

(declare-fun m!169405 () Bool)

(assert (=> b!113406 m!169405))

(assert (=> b!113406 m!169277))

(declare-fun m!169407 () Bool)

(assert (=> b!113409 m!169407))

(declare-fun m!169409 () Bool)

(assert (=> b!113412 m!169409))

(assert (=> b!113412 m!169405))

(declare-fun m!169411 () Bool)

(assert (=> b!113415 m!169411))

(assert (=> b!113415 m!169411))

(declare-fun m!169413 () Bool)

(assert (=> b!113415 m!169413))

(assert (=> b!113414 m!169349))

(declare-fun m!169415 () Bool)

(assert (=> b!113414 m!169415))

(declare-fun m!169417 () Bool)

(assert (=> b!113414 m!169417))

(declare-fun m!169419 () Bool)

(assert (=> b!113414 m!169419))

(declare-fun m!169421 () Bool)

(assert (=> b!113414 m!169421))

(declare-fun m!169423 () Bool)

(assert (=> bm!1441 m!169423))

(declare-fun m!169425 () Bool)

(assert (=> b!113413 m!169425))

(assert (=> b!113251 d!36424))

(declare-fun b!113465 () Bool)

(declare-fun e!74440 () Bool)

(declare-fun e!74439 () Bool)

(assert (=> b!113465 (= e!74440 e!74439)))

(declare-fun res!93698 () Bool)

(assert (=> b!113465 (=> (not res!93698) (not e!74439))))

(declare-fun lt!172489 () tuple2!9330)

(declare-fun lt!172488 () tuple2!9328)

(assert (=> b!113465 (= res!93698 (and (= (_2!4927 lt!172489) lt!171996) (= (_1!4927 lt!172489) (_2!4926 lt!172488))))))

(assert (=> b!113465 (= lt!172489 (readBitPure!0 (readerFrom!0 (_2!4926 lt!172488) (currentBit!5325 thiss!1305) (currentByte!5330 thiss!1305))))))

(declare-fun d!36442 () Bool)

(assert (=> d!36442 e!74440))

(declare-fun res!93700 () Bool)

(assert (=> d!36442 (=> (not res!93700) (not e!74440))))

(assert (=> d!36442 (= res!93700 (= (size!2342 (buf!2750 thiss!1305)) (size!2342 (buf!2750 (_2!4926 lt!172488)))))))

(declare-fun choose!16 (BitStream!4158 Bool) tuple2!9328)

(assert (=> d!36442 (= lt!172488 (choose!16 thiss!1305 lt!171996))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!36442 (validate_offset_bit!0 ((_ sign_extend 32) (size!2342 (buf!2750 thiss!1305))) ((_ sign_extend 32) (currentByte!5330 thiss!1305)) ((_ sign_extend 32) (currentBit!5325 thiss!1305)))))

(assert (=> d!36442 (= (appendBit!0 thiss!1305 lt!171996) lt!172488)))

(declare-fun b!113466 () Bool)

(assert (=> b!113466 (= e!74439 (= (bitIndex!0 (size!2342 (buf!2750 (_1!4927 lt!172489))) (currentByte!5330 (_1!4927 lt!172489)) (currentBit!5325 (_1!4927 lt!172489))) (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!172488))) (currentByte!5330 (_2!4926 lt!172488)) (currentBit!5325 (_2!4926 lt!172488)))))))

(declare-fun b!113464 () Bool)

(declare-fun res!93701 () Bool)

(assert (=> b!113464 (=> (not res!93701) (not e!74440))))

(assert (=> b!113464 (= res!93701 (isPrefixOf!0 thiss!1305 (_2!4926 lt!172488)))))

(declare-fun b!113463 () Bool)

(declare-fun res!93699 () Bool)

(assert (=> b!113463 (=> (not res!93699) (not e!74440))))

(declare-fun lt!172487 () (_ BitVec 64))

(declare-fun lt!172490 () (_ BitVec 64))

(assert (=> b!113463 (= res!93699 (= (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!172488))) (currentByte!5330 (_2!4926 lt!172488)) (currentBit!5325 (_2!4926 lt!172488))) (bvadd lt!172487 lt!172490)))))

(assert (=> b!113463 (or (not (= (bvand lt!172487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!172490 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!172487 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!172487 lt!172490) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113463 (= lt!172490 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!113463 (= lt!172487 (bitIndex!0 (size!2342 (buf!2750 thiss!1305)) (currentByte!5330 thiss!1305) (currentBit!5325 thiss!1305)))))

(assert (= (and d!36442 res!93700) b!113463))

(assert (= (and b!113463 res!93699) b!113464))

(assert (= (and b!113464 res!93701) b!113465))

(assert (= (and b!113465 res!93698) b!113466))

(declare-fun m!169509 () Bool)

(assert (=> b!113466 m!169509))

(declare-fun m!169511 () Bool)

(assert (=> b!113466 m!169511))

(declare-fun m!169513 () Bool)

(assert (=> d!36442 m!169513))

(declare-fun m!169515 () Bool)

(assert (=> d!36442 m!169515))

(declare-fun m!169517 () Bool)

(assert (=> b!113465 m!169517))

(assert (=> b!113465 m!169517))

(declare-fun m!169519 () Bool)

(assert (=> b!113465 m!169519))

(declare-fun m!169521 () Bool)

(assert (=> b!113464 m!169521))

(assert (=> b!113463 m!169511))

(assert (=> b!113463 m!169279))

(assert (=> b!113251 d!36442))

(declare-fun d!36446 () Bool)

(declare-fun res!93703 () Bool)

(declare-fun e!74442 () Bool)

(assert (=> d!36446 (=> (not res!93703) (not e!74442))))

(assert (=> d!36446 (= res!93703 (= (size!2342 (buf!2750 (_2!4926 lt!171999))) (size!2342 (buf!2750 (_2!4926 lt!172001)))))))

(assert (=> d!36446 (= (isPrefixOf!0 (_2!4926 lt!171999) (_2!4926 lt!172001)) e!74442)))

(declare-fun b!113467 () Bool)

(declare-fun res!93702 () Bool)

(assert (=> b!113467 (=> (not res!93702) (not e!74442))))

(assert (=> b!113467 (= res!93702 (bvsle (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!171999))) (currentByte!5330 (_2!4926 lt!171999)) (currentBit!5325 (_2!4926 lt!171999))) (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!172001))) (currentByte!5330 (_2!4926 lt!172001)) (currentBit!5325 (_2!4926 lt!172001)))))))

(declare-fun b!113468 () Bool)

(declare-fun e!74441 () Bool)

(assert (=> b!113468 (= e!74442 e!74441)))

(declare-fun res!93704 () Bool)

(assert (=> b!113468 (=> res!93704 e!74441)))

(assert (=> b!113468 (= res!93704 (= (size!2342 (buf!2750 (_2!4926 lt!171999))) #b00000000000000000000000000000000))))

(declare-fun b!113469 () Bool)

(assert (=> b!113469 (= e!74441 (arrayBitRangesEq!0 (buf!2750 (_2!4926 lt!171999)) (buf!2750 (_2!4926 lt!172001)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2342 (buf!2750 (_2!4926 lt!171999))) (currentByte!5330 (_2!4926 lt!171999)) (currentBit!5325 (_2!4926 lt!171999)))))))

(assert (= (and d!36446 res!93703) b!113467))

(assert (= (and b!113467 res!93702) b!113468))

(assert (= (and b!113468 (not res!93704)) b!113469))

(assert (=> b!113467 m!169277))

(declare-fun m!169539 () Bool)

(assert (=> b!113467 m!169539))

(assert (=> b!113469 m!169277))

(assert (=> b!113469 m!169277))

(declare-fun m!169545 () Bool)

(assert (=> b!113469 m!169545))

(assert (=> b!113246 d!36446))

(check-sat (not b!113404) (not b!113409) (not bm!1441) (not b!113403) (not d!36422) (not b!113469) (not d!36442) (not d!36408) (not d!36416) (not b!113463) (not b!113464) (not b!113415) (not b!113466) (not b!113465) (not d!36412) (not d!36414) (not b!113467) (not b!113304) (not b!113412) (not d!36406) (not b!113414) (not b!113405) (not b!113406) (not b!113413) (not d!36418) (not b!113302) (not b!113287))
