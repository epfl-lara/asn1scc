; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27360 () Bool)

(assert start!27360)

(declare-fun b!140497 () Bool)

(declare-fun res!117145 () Bool)

(declare-fun e!93637 () Bool)

(assert (=> b!140497 (=> (not res!117145) (not e!93637))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6426 0))(
  ( (array!6427 (arr!3615 (Array (_ BitVec 32) (_ BitVec 8))) (size!2908 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5074 0))(
  ( (BitStream!5075 (buf!3329 array!6426) (currentByte!6180 (_ BitVec 32)) (currentBit!6175 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5074)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140497 (= res!117145 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2908 (buf!3329 thiss!1634))) ((_ sign_extend 32) (currentByte!6180 thiss!1634)) ((_ sign_extend 32) (currentBit!6175 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun e!93638 () Bool)

(declare-datatypes ((tuple2!12322 0))(
  ( (tuple2!12323 (_1!6491 BitStream!5074) (_2!6491 BitStream!5074)) )
))
(declare-fun lt!218751 () tuple2!12322)

(declare-fun arr!237 () array!6426)

(declare-fun b!140498 () Bool)

(declare-datatypes ((tuple2!12324 0))(
  ( (tuple2!12325 (_1!6492 BitStream!5074) (_2!6492 (_ BitVec 8))) )
))
(declare-fun lt!218752 () tuple2!12324)

(assert (=> b!140498 (= e!93638 (and (= (_2!6492 lt!218752) (select (arr!3615 arr!237) from!447)) (= (_1!6492 lt!218752) (_2!6491 lt!218751))))))

(declare-fun readBytePure!0 (BitStream!5074) tuple2!12324)

(assert (=> b!140498 (= lt!218752 (readBytePure!0 (_1!6491 lt!218751)))))

(declare-datatypes ((Unit!8795 0))(
  ( (Unit!8796) )
))
(declare-datatypes ((tuple2!12326 0))(
  ( (tuple2!12327 (_1!6493 Unit!8795) (_2!6493 BitStream!5074)) )
))
(declare-fun lt!218753 () tuple2!12326)

(declare-fun reader!0 (BitStream!5074 BitStream!5074) tuple2!12322)

(assert (=> b!140498 (= lt!218751 (reader!0 thiss!1634 (_2!6493 lt!218753)))))

(declare-fun b!140499 () Bool)

(declare-fun res!117146 () Bool)

(assert (=> b!140499 (=> (not res!117146) (not e!93637))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140499 (= res!117146 (invariant!0 (currentBit!6175 thiss!1634) (currentByte!6180 thiss!1634) (size!2908 (buf!3329 thiss!1634))))))

(declare-fun b!140500 () Bool)

(declare-fun res!117147 () Bool)

(assert (=> b!140500 (=> (not res!117147) (not e!93638))))

(declare-fun isPrefixOf!0 (BitStream!5074 BitStream!5074) Bool)

(assert (=> b!140500 (= res!117147 (isPrefixOf!0 thiss!1634 (_2!6493 lt!218753)))))

(declare-fun b!140501 () Bool)

(declare-fun res!117142 () Bool)

(assert (=> b!140501 (=> (not res!117142) (not e!93638))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140501 (= res!117142 (= (bitIndex!0 (size!2908 (buf!3329 (_2!6493 lt!218753))) (currentByte!6180 (_2!6493 lt!218753)) (currentBit!6175 (_2!6493 lt!218753))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2908 (buf!3329 thiss!1634)) (currentByte!6180 thiss!1634) (currentBit!6175 thiss!1634)))))))

(declare-fun b!140502 () Bool)

(assert (=> b!140502 (= e!93637 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2908 (buf!3329 (_2!6493 lt!218753))) (currentByte!6180 (_2!6493 lt!218753)) (currentBit!6175 (_2!6493 lt!218753))))))))

(assert (=> b!140502 e!93638))

(declare-fun res!117148 () Bool)

(assert (=> b!140502 (=> (not res!117148) (not e!93638))))

(assert (=> b!140502 (= res!117148 (= (size!2908 (buf!3329 thiss!1634)) (size!2908 (buf!3329 (_2!6493 lt!218753)))))))

(declare-fun appendByte!0 (BitStream!5074 (_ BitVec 8)) tuple2!12326)

(assert (=> b!140502 (= lt!218753 (appendByte!0 thiss!1634 (select (arr!3615 arr!237) from!447)))))

(declare-fun b!140503 () Bool)

(declare-fun res!117144 () Bool)

(assert (=> b!140503 (=> (not res!117144) (not e!93637))))

(assert (=> b!140503 (= res!117144 (bvslt from!447 to!404))))

(declare-fun b!140504 () Bool)

(declare-fun e!93636 () Bool)

(declare-fun array_inv!2697 (array!6426) Bool)

(assert (=> b!140504 (= e!93636 (array_inv!2697 (buf!3329 thiss!1634)))))

(declare-fun res!117143 () Bool)

(assert (=> start!27360 (=> (not res!117143) (not e!93637))))

(assert (=> start!27360 (= res!117143 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2908 arr!237))))))

(assert (=> start!27360 e!93637))

(assert (=> start!27360 true))

(assert (=> start!27360 (array_inv!2697 arr!237)))

(declare-fun inv!12 (BitStream!5074) Bool)

(assert (=> start!27360 (and (inv!12 thiss!1634) e!93636)))

(assert (= (and start!27360 res!117143) b!140497))

(assert (= (and b!140497 res!117145) b!140503))

(assert (= (and b!140503 res!117144) b!140499))

(assert (= (and b!140499 res!117146) b!140502))

(assert (= (and b!140502 res!117148) b!140501))

(assert (= (and b!140501 res!117142) b!140500))

(assert (= (and b!140500 res!117147) b!140498))

(assert (= start!27360 b!140504))

(declare-fun m!216281 () Bool)

(assert (=> b!140498 m!216281))

(declare-fun m!216283 () Bool)

(assert (=> b!140498 m!216283))

(declare-fun m!216285 () Bool)

(assert (=> b!140498 m!216285))

(declare-fun m!216287 () Bool)

(assert (=> b!140500 m!216287))

(declare-fun m!216289 () Bool)

(assert (=> b!140502 m!216289))

(assert (=> b!140502 m!216281))

(assert (=> b!140502 m!216281))

(declare-fun m!216291 () Bool)

(assert (=> b!140502 m!216291))

(assert (=> b!140501 m!216289))

(declare-fun m!216293 () Bool)

(assert (=> b!140501 m!216293))

(declare-fun m!216295 () Bool)

(assert (=> start!27360 m!216295))

(declare-fun m!216297 () Bool)

(assert (=> start!27360 m!216297))

(declare-fun m!216299 () Bool)

(assert (=> b!140499 m!216299))

(declare-fun m!216301 () Bool)

(assert (=> b!140504 m!216301))

(declare-fun m!216303 () Bool)

(assert (=> b!140497 m!216303))

(push 1)

(assert (not b!140499))

(assert (not start!27360))

(assert (not b!140501))

(assert (not b!140500))

(assert (not b!140504))

(assert (not b!140497))

(assert (not b!140498))

(assert (not b!140502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45304 () Bool)

(declare-fun res!117197 () Bool)

(declare-fun e!93675 () Bool)

(assert (=> d!45304 (=> (not res!117197) (not e!93675))))

(assert (=> d!45304 (= res!117197 (= (size!2908 (buf!3329 thiss!1634)) (size!2908 (buf!3329 (_2!6493 lt!218753)))))))

(assert (=> d!45304 (= (isPrefixOf!0 thiss!1634 (_2!6493 lt!218753)) e!93675)))

(declare-fun b!140559 () Bool)

(declare-fun res!117199 () Bool)

(assert (=> b!140559 (=> (not res!117199) (not e!93675))))

(assert (=> b!140559 (= res!117199 (bvsle (bitIndex!0 (size!2908 (buf!3329 thiss!1634)) (currentByte!6180 thiss!1634) (currentBit!6175 thiss!1634)) (bitIndex!0 (size!2908 (buf!3329 (_2!6493 lt!218753))) (currentByte!6180 (_2!6493 lt!218753)) (currentBit!6175 (_2!6493 lt!218753)))))))

(declare-fun b!140560 () Bool)

(declare-fun e!93674 () Bool)

(assert (=> b!140560 (= e!93675 e!93674)))

(declare-fun res!117198 () Bool)

(assert (=> b!140560 (=> res!117198 e!93674)))

(assert (=> b!140560 (= res!117198 (= (size!2908 (buf!3329 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!140561 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6426 array!6426 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!140561 (= e!93674 (arrayBitRangesEq!0 (buf!3329 thiss!1634) (buf!3329 (_2!6493 lt!218753)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2908 (buf!3329 thiss!1634)) (currentByte!6180 thiss!1634) (currentBit!6175 thiss!1634))))))

(assert (= (and d!45304 res!117197) b!140559))

(assert (= (and b!140559 res!117199) b!140560))

(assert (= (and b!140560 (not res!117198)) b!140561))

(assert (=> b!140559 m!216293))

(assert (=> b!140559 m!216289))

(assert (=> b!140561 m!216293))

(assert (=> b!140561 m!216293))

(declare-fun m!216353 () Bool)

(assert (=> b!140561 m!216353))

(assert (=> b!140500 d!45304))

(declare-fun d!45306 () Bool)

(assert (=> d!45306 (= (invariant!0 (currentBit!6175 thiss!1634) (currentByte!6180 thiss!1634) (size!2908 (buf!3329 thiss!1634))) (and (bvsge (currentBit!6175 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6175 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6180 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6180 thiss!1634) (size!2908 (buf!3329 thiss!1634))) (and (= (currentBit!6175 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6180 thiss!1634) (size!2908 (buf!3329 thiss!1634)))))))))

(assert (=> b!140499 d!45306))

(declare-fun d!45310 () Bool)

(assert (=> d!45310 (= (array_inv!2697 arr!237) (bvsge (size!2908 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27360 d!45310))

(declare-fun d!45312 () Bool)

(assert (=> d!45312 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6175 thiss!1634) (currentByte!6180 thiss!1634) (size!2908 (buf!3329 thiss!1634))))))

(declare-fun bs!11117 () Bool)

(assert (= bs!11117 d!45312))

(assert (=> bs!11117 m!216299))

(assert (=> start!27360 d!45312))

(declare-fun d!45314 () Bool)

(assert (=> d!45314 (= (array_inv!2697 (buf!3329 thiss!1634)) (bvsge (size!2908 (buf!3329 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!140504 d!45314))

(declare-fun d!45316 () Bool)

(declare-datatypes ((tuple2!12342 0))(
  ( (tuple2!12343 (_1!6501 (_ BitVec 8)) (_2!6501 BitStream!5074)) )
))
(declare-fun lt!218801 () tuple2!12342)

(declare-fun readByte!0 (BitStream!5074) tuple2!12342)

(assert (=> d!45316 (= lt!218801 (readByte!0 (_1!6491 lt!218751)))))

(assert (=> d!45316 (= (readBytePure!0 (_1!6491 lt!218751)) (tuple2!12325 (_2!6501 lt!218801) (_1!6501 lt!218801)))))

(declare-fun bs!11119 () Bool)

(assert (= bs!11119 d!45316))

(declare-fun m!216363 () Bool)

(assert (=> bs!11119 m!216363))

(assert (=> b!140498 d!45316))

(declare-fun b!140605 () Bool)

(declare-fun e!93695 () Unit!8795)

(declare-fun Unit!8801 () Unit!8795)

(assert (=> b!140605 (= e!93695 Unit!8801)))

(declare-fun b!140606 () Bool)

(declare-fun lt!218956 () Unit!8795)

(assert (=> b!140606 (= e!93695 lt!218956)))

(declare-fun lt!218954 () (_ BitVec 64))

(assert (=> b!140606 (= lt!218954 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218950 () (_ BitVec 64))

(assert (=> b!140606 (= lt!218950 (bitIndex!0 (size!2908 (buf!3329 thiss!1634)) (currentByte!6180 thiss!1634) (currentBit!6175 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6426 array!6426 (_ BitVec 64) (_ BitVec 64)) Unit!8795)

(assert (=> b!140606 (= lt!218956 (arrayBitRangesEqSymmetric!0 (buf!3329 thiss!1634) (buf!3329 (_2!6493 lt!218753)) lt!218954 lt!218950))))

(assert (=> b!140606 (arrayBitRangesEq!0 (buf!3329 (_2!6493 lt!218753)) (buf!3329 thiss!1634) lt!218954 lt!218950)))

(declare-fun b!140607 () Bool)

(declare-fun res!117230 () Bool)

(declare-fun e!93694 () Bool)

(assert (=> b!140607 (=> (not res!117230) (not e!93694))))

(declare-fun lt!218963 () tuple2!12322)

(assert (=> b!140607 (= res!117230 (isPrefixOf!0 (_2!6491 lt!218963) (_2!6493 lt!218753)))))

(declare-fun b!140608 () Bool)

(declare-fun lt!218959 () (_ BitVec 64))

(declare-fun lt!218962 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5074 (_ BitVec 64)) BitStream!5074)

(assert (=> b!140608 (= e!93694 (= (_1!6491 lt!218963) (withMovedBitIndex!0 (_2!6491 lt!218963) (bvsub lt!218959 lt!218962))))))

(assert (=> b!140608 (or (= (bvand lt!218959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218962 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218959 lt!218962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!140608 (= lt!218962 (bitIndex!0 (size!2908 (buf!3329 (_2!6493 lt!218753))) (currentByte!6180 (_2!6493 lt!218753)) (currentBit!6175 (_2!6493 lt!218753))))))

(assert (=> b!140608 (= lt!218959 (bitIndex!0 (size!2908 (buf!3329 thiss!1634)) (currentByte!6180 thiss!1634) (currentBit!6175 thiss!1634)))))

(declare-fun d!45324 () Bool)

(assert (=> d!45324 e!93694))

(declare-fun res!117231 () Bool)

(assert (=> d!45324 (=> (not res!117231) (not e!93694))))

(assert (=> d!45324 (= res!117231 (isPrefixOf!0 (_1!6491 lt!218963) (_2!6491 lt!218963)))))

(declare-fun lt!218952 () BitStream!5074)

(assert (=> d!45324 (= lt!218963 (tuple2!12323 lt!218952 (_2!6493 lt!218753)))))

(declare-fun lt!218948 () Unit!8795)

(declare-fun lt!218951 () Unit!8795)

(assert (=> d!45324 (= lt!218948 lt!218951)))

(assert (=> d!45324 (isPrefixOf!0 lt!218952 (_2!6493 lt!218753))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5074 BitStream!5074 BitStream!5074) Unit!8795)

(assert (=> d!45324 (= lt!218951 (lemmaIsPrefixTransitive!0 lt!218952 (_2!6493 lt!218753) (_2!6493 lt!218753)))))

(declare-fun lt!218955 () Unit!8795)

(declare-fun lt!218960 () Unit!8795)

(assert (=> d!45324 (= lt!218955 lt!218960)))

(assert (=> d!45324 (isPrefixOf!0 lt!218952 (_2!6493 lt!218753))))

(assert (=> d!45324 (= lt!218960 (lemmaIsPrefixTransitive!0 lt!218952 thiss!1634 (_2!6493 lt!218753)))))

(declare-fun lt!218953 () Unit!8795)

(assert (=> d!45324 (= lt!218953 e!93695)))

(declare-fun c!7798 () Bool)

(assert (=> d!45324 (= c!7798 (not (= (size!2908 (buf!3329 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!218945 () Unit!8795)

(declare-fun lt!218964 () Unit!8795)

(assert (=> d!45324 (= lt!218945 lt!218964)))

(assert (=> d!45324 (isPrefixOf!0 (_2!6493 lt!218753) (_2!6493 lt!218753))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5074) Unit!8795)

(assert (=> d!45324 (= lt!218964 (lemmaIsPrefixRefl!0 (_2!6493 lt!218753)))))

(declare-fun lt!218946 () Unit!8795)

(declare-fun lt!218949 () Unit!8795)

(assert (=> d!45324 (= lt!218946 lt!218949)))

(assert (=> d!45324 (= lt!218949 (lemmaIsPrefixRefl!0 (_2!6493 lt!218753)))))

(declare-fun lt!218957 () Unit!8795)

(declare-fun lt!218961 () Unit!8795)

(assert (=> d!45324 (= lt!218957 lt!218961)))

(assert (=> d!45324 (isPrefixOf!0 lt!218952 lt!218952)))

(assert (=> d!45324 (= lt!218961 (lemmaIsPrefixRefl!0 lt!218952))))

(declare-fun lt!218947 () Unit!8795)

(declare-fun lt!218958 () Unit!8795)

(assert (=> d!45324 (= lt!218947 lt!218958)))

(assert (=> d!45324 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45324 (= lt!218958 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45324 (= lt!218952 (BitStream!5075 (buf!3329 (_2!6493 lt!218753)) (currentByte!6180 thiss!1634) (currentBit!6175 thiss!1634)))))

(assert (=> d!45324 (isPrefixOf!0 thiss!1634 (_2!6493 lt!218753))))

(assert (=> d!45324 (= (reader!0 thiss!1634 (_2!6493 lt!218753)) lt!218963)))

(declare-fun b!140609 () Bool)

(declare-fun res!117229 () Bool)

(assert (=> b!140609 (=> (not res!117229) (not e!93694))))

(assert (=> b!140609 (= res!117229 (isPrefixOf!0 (_1!6491 lt!218963) thiss!1634))))

(assert (= (and d!45324 c!7798) b!140606))

(assert (= (and d!45324 (not c!7798)) b!140605))

(assert (= (and d!45324 res!117231) b!140609))

(assert (= (and b!140609 res!117229) b!140607))

(assert (= (and b!140607 res!117230) b!140608))

(declare-fun m!216397 () Bool)

(assert (=> b!140607 m!216397))

(declare-fun m!216399 () Bool)

(assert (=> d!45324 m!216399))

(declare-fun m!216401 () Bool)

(assert (=> d!45324 m!216401))

(declare-fun m!216403 () Bool)

(assert (=> d!45324 m!216403))

(declare-fun m!216405 () Bool)

(assert (=> d!45324 m!216405))

(declare-fun m!216407 () Bool)

(assert (=> d!45324 m!216407))

(declare-fun m!216409 () Bool)

(assert (=> d!45324 m!216409))

(declare-fun m!216411 () Bool)

(assert (=> d!45324 m!216411))

(declare-fun m!216413 () Bool)

(assert (=> d!45324 m!216413))

(declare-fun m!216415 () Bool)

(assert (=> d!45324 m!216415))

(declare-fun m!216417 () Bool)

(assert (=> d!45324 m!216417))

(assert (=> d!45324 m!216287))

(assert (=> b!140606 m!216293))

(declare-fun m!216419 () Bool)

(assert (=> b!140606 m!216419))

(declare-fun m!216421 () Bool)

(assert (=> b!140606 m!216421))

(declare-fun m!216425 () Bool)

(assert (=> b!140609 m!216425))

(declare-fun m!216429 () Bool)

(assert (=> b!140608 m!216429))

(assert (=> b!140608 m!216289))

(assert (=> b!140608 m!216293))

(assert (=> b!140498 d!45324))

(declare-fun d!45330 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45330 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2908 (buf!3329 thiss!1634))) ((_ sign_extend 32) (currentByte!6180 thiss!1634)) ((_ sign_extend 32) (currentBit!6175 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2908 (buf!3329 thiss!1634))) ((_ sign_extend 32) (currentByte!6180 thiss!1634)) ((_ sign_extend 32) (currentBit!6175 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11121 () Bool)

(assert (= bs!11121 d!45330))

(declare-fun m!216457 () Bool)

(assert (=> bs!11121 m!216457))

(assert (=> b!140497 d!45330))

(declare-fun d!45336 () Bool)

(declare-fun e!93704 () Bool)

(assert (=> d!45336 e!93704))

(declare-fun res!117247 () Bool)

(assert (=> d!45336 (=> (not res!117247) (not e!93704))))

(declare-fun lt!219022 () (_ BitVec 64))

(declare-fun lt!219021 () (_ BitVec 64))

(declare-fun lt!219025 () (_ BitVec 64))

(assert (=> d!45336 (= res!117247 (= lt!219022 (bvsub lt!219021 lt!219025)))))

(assert (=> d!45336 (or (= (bvand lt!219021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219025 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219021 lt!219025) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45336 (= lt!219025 (remainingBits!0 ((_ sign_extend 32) (size!2908 (buf!3329 (_2!6493 lt!218753)))) ((_ sign_extend 32) (currentByte!6180 (_2!6493 lt!218753))) ((_ sign_extend 32) (currentBit!6175 (_2!6493 lt!218753)))))))

(declare-fun lt!219026 () (_ BitVec 64))

(declare-fun lt!219023 () (_ BitVec 64))

(assert (=> d!45336 (= lt!219021 (bvmul lt!219026 lt!219023))))

(assert (=> d!45336 (or (= lt!219026 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!219023 (bvsdiv (bvmul lt!219026 lt!219023) lt!219026)))))

(assert (=> d!45336 (= lt!219023 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45336 (= lt!219026 ((_ sign_extend 32) (size!2908 (buf!3329 (_2!6493 lt!218753)))))))

(assert (=> d!45336 (= lt!219022 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6180 (_2!6493 lt!218753))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6175 (_2!6493 lt!218753)))))))

(assert (=> d!45336 (invariant!0 (currentBit!6175 (_2!6493 lt!218753)) (currentByte!6180 (_2!6493 lt!218753)) (size!2908 (buf!3329 (_2!6493 lt!218753))))))

(assert (=> d!45336 (= (bitIndex!0 (size!2908 (buf!3329 (_2!6493 lt!218753))) (currentByte!6180 (_2!6493 lt!218753)) (currentBit!6175 (_2!6493 lt!218753))) lt!219022)))

(declare-fun b!140627 () Bool)

(declare-fun res!117248 () Bool)

(assert (=> b!140627 (=> (not res!117248) (not e!93704))))

(assert (=> b!140627 (= res!117248 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!219022))))

(declare-fun b!140628 () Bool)

(declare-fun lt!219024 () (_ BitVec 64))

(assert (=> b!140628 (= e!93704 (bvsle lt!219022 (bvmul lt!219024 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140628 (or (= lt!219024 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!219024 #b0000000000000000000000000000000000000000000000000000000000001000) lt!219024)))))

(assert (=> b!140628 (= lt!219024 ((_ sign_extend 32) (size!2908 (buf!3329 (_2!6493 lt!218753)))))))

(assert (= (and d!45336 res!117247) b!140627))

(assert (= (and b!140627 res!117248) b!140628))

(declare-fun m!216465 () Bool)

(assert (=> d!45336 m!216465))

(declare-fun m!216467 () Bool)

(assert (=> d!45336 m!216467))

(assert (=> b!140502 d!45336))

(declare-fun d!45348 () Bool)

(declare-fun e!93719 () Bool)

(assert (=> d!45348 e!93719))

(declare-fun res!117283 () Bool)

(assert (=> d!45348 (=> (not res!117283) (not e!93719))))

(declare-fun lt!219067 () tuple2!12326)

(assert (=> d!45348 (= res!117283 (= (size!2908 (buf!3329 thiss!1634)) (size!2908 (buf!3329 (_2!6493 lt!219067)))))))

(declare-fun choose!6 (BitStream!5074 (_ BitVec 8)) tuple2!12326)

(assert (=> d!45348 (= lt!219067 (choose!6 thiss!1634 (select (arr!3615 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45348 (validate_offset_byte!0 ((_ sign_extend 32) (size!2908 (buf!3329 thiss!1634))) ((_ sign_extend 32) (currentByte!6180 thiss!1634)) ((_ sign_extend 32) (currentBit!6175 thiss!1634)))))

(assert (=> d!45348 (= (appendByte!0 thiss!1634 (select (arr!3615 arr!237) from!447)) lt!219067)))

(declare-fun b!140662 () Bool)

(declare-fun res!117282 () Bool)

(assert (=> b!140662 (=> (not res!117282) (not e!93719))))

(declare-fun lt!219070 () (_ BitVec 64))

(declare-fun lt!219069 () (_ BitVec 64))

(assert (=> b!140662 (= res!117282 (= (bitIndex!0 (size!2908 (buf!3329 (_2!6493 lt!219067))) (currentByte!6180 (_2!6493 lt!219067)) (currentBit!6175 (_2!6493 lt!219067))) (bvadd lt!219069 lt!219070)))))

(assert (=> b!140662 (or (not (= (bvand lt!219069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219070 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!219069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!219069 lt!219070) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!140662 (= lt!219070 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!140662 (= lt!219069 (bitIndex!0 (size!2908 (buf!3329 thiss!1634)) (currentByte!6180 thiss!1634) (currentBit!6175 thiss!1634)))))

(declare-fun b!140663 () Bool)

(declare-fun res!117284 () Bool)

(assert (=> b!140663 (=> (not res!117284) (not e!93719))))

(assert (=> b!140663 (= res!117284 (isPrefixOf!0 thiss!1634 (_2!6493 lt!219067)))))

(declare-fun lt!219071 () tuple2!12324)

(declare-fun b!140664 () Bool)

(declare-fun lt!219068 () tuple2!12322)

(assert (=> b!140664 (= e!93719 (and (= (_2!6492 lt!219071) (select (arr!3615 arr!237) from!447)) (= (_1!6492 lt!219071) (_2!6491 lt!219068))))))

(assert (=> b!140664 (= lt!219071 (readBytePure!0 (_1!6491 lt!219068)))))

(assert (=> b!140664 (= lt!219068 (reader!0 thiss!1634 (_2!6493 lt!219067)))))

(assert (= (and d!45348 res!117283) b!140662))

(assert (= (and b!140662 res!117282) b!140663))

(assert (= (and b!140663 res!117284) b!140664))

(assert (=> d!45348 m!216281))

(declare-fun m!216495 () Bool)

(assert (=> d!45348 m!216495))

(declare-fun m!216497 () Bool)

(assert (=> d!45348 m!216497))

(declare-fun m!216499 () Bool)

(assert (=> b!140662 m!216499))

(assert (=> b!140662 m!216293))

(declare-fun m!216501 () Bool)

(assert (=> b!140663 m!216501))

(declare-fun m!216503 () Bool)

(assert (=> b!140664 m!216503))

(declare-fun m!216505 () Bool)

(assert (=> b!140664 m!216505))

(assert (=> b!140502 d!45348))

(assert (=> b!140501 d!45336))

(declare-fun d!45362 () Bool)

(declare-fun e!93720 () Bool)

(assert (=> d!45362 e!93720))

(declare-fun res!117285 () Bool)

(assert (=> d!45362 (=> (not res!117285) (not e!93720))))

(declare-fun lt!219073 () (_ BitVec 64))

(declare-fun lt!219072 () (_ BitVec 64))

(declare-fun lt!219076 () (_ BitVec 64))

(assert (=> d!45362 (= res!117285 (= lt!219073 (bvsub lt!219072 lt!219076)))))

(assert (=> d!45362 (or (= (bvand lt!219072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219076 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219072 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219072 lt!219076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45362 (= lt!219076 (remainingBits!0 ((_ sign_extend 32) (size!2908 (buf!3329 thiss!1634))) ((_ sign_extend 32) (currentByte!6180 thiss!1634)) ((_ sign_extend 32) (currentBit!6175 thiss!1634))))))

(declare-fun lt!219077 () (_ BitVec 64))

(declare-fun lt!219074 () (_ BitVec 64))

(assert (=> d!45362 (= lt!219072 (bvmul lt!219077 lt!219074))))

(assert (=> d!45362 (or (= lt!219077 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!219074 (bvsdiv (bvmul lt!219077 lt!219074) lt!219077)))))

(assert (=> d!45362 (= lt!219074 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45362 (= lt!219077 ((_ sign_extend 32) (size!2908 (buf!3329 thiss!1634))))))

(assert (=> d!45362 (= lt!219073 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6180 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6175 thiss!1634))))))

(assert (=> d!45362 (invariant!0 (currentBit!6175 thiss!1634) (currentByte!6180 thiss!1634) (size!2908 (buf!3329 thiss!1634)))))

(assert (=> d!45362 (= (bitIndex!0 (size!2908 (buf!3329 thiss!1634)) (currentByte!6180 thiss!1634) (currentBit!6175 thiss!1634)) lt!219073)))

(declare-fun b!140665 () Bool)

(declare-fun res!117286 () Bool)

(assert (=> b!140665 (=> (not res!117286) (not e!93720))))

(assert (=> b!140665 (= res!117286 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!219073))))

(declare-fun b!140666 () Bool)

(declare-fun lt!219075 () (_ BitVec 64))

(assert (=> b!140666 (= e!93720 (bvsle lt!219073 (bvmul lt!219075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140666 (or (= lt!219075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!219075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!219075)))))

(assert (=> b!140666 (= lt!219075 ((_ sign_extend 32) (size!2908 (buf!3329 thiss!1634))))))

(assert (= (and d!45362 res!117285) b!140665))

(assert (= (and b!140665 res!117286) b!140666))

(assert (=> d!45362 m!216457))

(assert (=> d!45362 m!216299))

(assert (=> b!140501 d!45362))

(push 1)

(assert (not b!140609))

(assert (not d!45316))

(assert (not b!140606))

(assert (not d!45336))

(assert (not d!45312))

(assert (not b!140662))

(assert (not d!45362))

(assert (not b!140663))

(assert (not d!45348))

(assert (not b!140607))

(assert (not b!140559))

(assert (not b!140561))

(assert (not d!45330))

(assert (not d!45324))

(assert (not b!140664))

(assert (not b!140608))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

