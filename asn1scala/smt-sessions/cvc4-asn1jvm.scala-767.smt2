; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21884 () Bool)

(assert start!21884)

(declare-fun b!110522 () Bool)

(declare-fun e!72503 () Bool)

(declare-fun e!72499 () Bool)

(assert (=> b!110522 (= e!72503 e!72499)))

(declare-fun res!91236 () Bool)

(assert (=> b!110522 (=> (not res!91236) (not e!72499))))

(declare-datatypes ((array!5064 0))(
  ( (array!5065 (arr!2897 (Array (_ BitVec 32) (_ BitVec 8))) (size!2304 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4082 0))(
  ( (BitStream!4083 (buf!2698 array!5064) (currentByte!5252 (_ BitVec 32)) (currentBit!5247 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4082)

(declare-fun lt!167202 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110522 (= res!91236 (validate_offset_bits!1 ((_ sign_extend 32) (size!2304 (buf!2698 thiss!1305))) ((_ sign_extend 32) (currentByte!5252 thiss!1305)) ((_ sign_extend 32) (currentBit!5247 thiss!1305)) lt!167202))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110522 (= lt!167202 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110523 () Bool)

(declare-fun e!72500 () Bool)

(declare-datatypes ((tuple2!9202 0))(
  ( (tuple2!9203 (_1!4858 BitStream!4082) (_2!4858 BitStream!4082)) )
))
(declare-fun lt!167203 () tuple2!9202)

(assert (=> b!110523 (= e!72500 (validate_offset_bits!1 ((_ sign_extend 32) (size!2304 (buf!2698 (_1!4858 lt!167203)))) ((_ sign_extend 32) (currentByte!5252 (_1!4858 lt!167203))) ((_ sign_extend 32) (currentBit!5247 (_1!4858 lt!167203))) lt!167202))))

(declare-datatypes ((Unit!6773 0))(
  ( (Unit!6774) )
))
(declare-fun lt!167204 () Unit!6773)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4082 array!5064 (_ BitVec 64)) Unit!6773)

(assert (=> b!110523 (= lt!167204 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2698 thiss!1305) lt!167202))))

(declare-fun reader!0 (BitStream!4082 BitStream!4082) tuple2!9202)

(assert (=> b!110523 (= lt!167203 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110524 () Bool)

(declare-fun e!72501 () Bool)

(declare-fun array_inv!2106 (array!5064) Bool)

(assert (=> b!110524 (= e!72501 (array_inv!2106 (buf!2698 thiss!1305)))))

(declare-fun res!91237 () Bool)

(assert (=> start!21884 (=> (not res!91237) (not e!72503))))

(assert (=> start!21884 (= res!91237 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21884 e!72503))

(assert (=> start!21884 true))

(declare-fun inv!12 (BitStream!4082) Bool)

(assert (=> start!21884 (and (inv!12 thiss!1305) e!72501)))

(declare-fun b!110525 () Bool)

(declare-fun res!91240 () Bool)

(assert (=> b!110525 (=> (not res!91240) (not e!72499))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110525 (= res!91240 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110526 () Bool)

(declare-fun res!91238 () Bool)

(assert (=> b!110526 (=> (not res!91238) (not e!72499))))

(assert (=> b!110526 (= res!91238 (bvsge i!615 nBits!396))))

(declare-fun b!110527 () Bool)

(assert (=> b!110527 (= e!72499 (not e!72500))))

(declare-fun res!91239 () Bool)

(assert (=> b!110527 (=> res!91239 e!72500)))

(declare-fun lt!167201 () (_ BitVec 64))

(assert (=> b!110527 (= res!91239 (not (= lt!167201 (bvadd lt!167201 lt!167202))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110527 (= lt!167201 (bitIndex!0 (size!2304 (buf!2698 thiss!1305)) (currentByte!5252 thiss!1305) (currentBit!5247 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4082 BitStream!4082) Bool)

(assert (=> b!110527 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!167200 () Unit!6773)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4082) Unit!6773)

(assert (=> b!110527 (= lt!167200 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (= (and start!21884 res!91237) b!110522))

(assert (= (and b!110522 res!91236) b!110525))

(assert (= (and b!110525 res!91240) b!110526))

(assert (= (and b!110526 res!91238) b!110527))

(assert (= (and b!110527 (not res!91239)) b!110523))

(assert (= start!21884 b!110524))

(declare-fun m!164091 () Bool)

(assert (=> b!110522 m!164091))

(declare-fun m!164093 () Bool)

(assert (=> start!21884 m!164093))

(declare-fun m!164095 () Bool)

(assert (=> b!110524 m!164095))

(declare-fun m!164097 () Bool)

(assert (=> b!110527 m!164097))

(declare-fun m!164099 () Bool)

(assert (=> b!110527 m!164099))

(declare-fun m!164101 () Bool)

(assert (=> b!110527 m!164101))

(declare-fun m!164103 () Bool)

(assert (=> b!110525 m!164103))

(declare-fun m!164105 () Bool)

(assert (=> b!110523 m!164105))

(declare-fun m!164107 () Bool)

(assert (=> b!110523 m!164107))

(declare-fun m!164109 () Bool)

(assert (=> b!110523 m!164109))

(push 1)

(assert (not start!21884))

(assert (not b!110524))

(assert (not b!110522))

(assert (not b!110523))

(assert (not b!110527))

(assert (not b!110525))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34752 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34752 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2304 (buf!2698 (_1!4858 lt!167203)))) ((_ sign_extend 32) (currentByte!5252 (_1!4858 lt!167203))) ((_ sign_extend 32) (currentBit!5247 (_1!4858 lt!167203))) lt!167202) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2304 (buf!2698 (_1!4858 lt!167203)))) ((_ sign_extend 32) (currentByte!5252 (_1!4858 lt!167203))) ((_ sign_extend 32) (currentBit!5247 (_1!4858 lt!167203)))) lt!167202))))

(declare-fun bs!8513 () Bool)

(assert (= bs!8513 d!34752))

(declare-fun m!164111 () Bool)

(assert (=> bs!8513 m!164111))

(assert (=> b!110523 d!34752))

(declare-fun d!34758 () Bool)

(assert (=> d!34758 (validate_offset_bits!1 ((_ sign_extend 32) (size!2304 (buf!2698 thiss!1305))) ((_ sign_extend 32) (currentByte!5252 thiss!1305)) ((_ sign_extend 32) (currentBit!5247 thiss!1305)) lt!167202)))

(declare-fun lt!167207 () Unit!6773)

(declare-fun choose!9 (BitStream!4082 array!5064 (_ BitVec 64) BitStream!4082) Unit!6773)

(assert (=> d!34758 (= lt!167207 (choose!9 thiss!1305 (buf!2698 thiss!1305) lt!167202 (BitStream!4083 (buf!2698 thiss!1305) (currentByte!5252 thiss!1305) (currentBit!5247 thiss!1305))))))

(assert (=> d!34758 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2698 thiss!1305) lt!167202) lt!167207)))

(declare-fun bs!8517 () Bool)

(assert (= bs!8517 d!34758))

(assert (=> bs!8517 m!164091))

(declare-fun m!164119 () Bool)

(assert (=> bs!8517 m!164119))

(assert (=> b!110523 d!34758))

(declare-fun lt!167345 () (_ BitVec 64))

(declare-fun lt!167335 () (_ BitVec 64))

(declare-fun lt!167342 () tuple2!9202)

(declare-fun e!72517 () Bool)

(declare-fun b!110558 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4082 (_ BitVec 64)) BitStream!4082)

(assert (=> b!110558 (= e!72517 (= (_1!4858 lt!167342) (withMovedBitIndex!0 (_2!4858 lt!167342) (bvsub lt!167335 lt!167345))))))

(assert (=> b!110558 (or (= (bvand lt!167335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167345 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167335 lt!167345) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!110558 (= lt!167345 (bitIndex!0 (size!2304 (buf!2698 thiss!1305)) (currentByte!5252 thiss!1305) (currentBit!5247 thiss!1305)))))

(assert (=> b!110558 (= lt!167335 (bitIndex!0 (size!2304 (buf!2698 thiss!1305)) (currentByte!5252 thiss!1305) (currentBit!5247 thiss!1305)))))

(declare-fun b!110559 () Bool)

(declare-fun res!91261 () Bool)

(assert (=> b!110559 (=> (not res!91261) (not e!72517))))

(assert (=> b!110559 (= res!91261 (isPrefixOf!0 (_2!4858 lt!167342) thiss!1305))))

(declare-fun b!110560 () Bool)

(declare-fun e!72516 () Unit!6773)

(declare-fun lt!167341 () Unit!6773)

(assert (=> b!110560 (= e!72516 lt!167341)))

(declare-fun lt!167343 () (_ BitVec 64))

(assert (=> b!110560 (= lt!167343 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!167351 () (_ BitVec 64))

(assert (=> b!110560 (= lt!167351 (bitIndex!0 (size!2304 (buf!2698 thiss!1305)) (currentByte!5252 thiss!1305) (currentBit!5247 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5064 array!5064 (_ BitVec 64) (_ BitVec 64)) Unit!6773)

(assert (=> b!110560 (= lt!167341 (arrayBitRangesEqSymmetric!0 (buf!2698 thiss!1305) (buf!2698 thiss!1305) lt!167343 lt!167351))))

(declare-fun arrayBitRangesEq!0 (array!5064 array!5064 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110560 (arrayBitRangesEq!0 (buf!2698 thiss!1305) (buf!2698 thiss!1305) lt!167343 lt!167351)))

(declare-fun d!34768 () Bool)

(assert (=> d!34768 e!72517))

(declare-fun res!91259 () Bool)

(assert (=> d!34768 (=> (not res!91259) (not e!72517))))

(assert (=> d!34768 (= res!91259 (isPrefixOf!0 (_1!4858 lt!167342) (_2!4858 lt!167342)))))

(declare-fun lt!167350 () BitStream!4082)

(assert (=> d!34768 (= lt!167342 (tuple2!9203 lt!167350 thiss!1305))))

(declare-fun lt!167353 () Unit!6773)

(declare-fun lt!167336 () Unit!6773)

(assert (=> d!34768 (= lt!167353 lt!167336)))

(assert (=> d!34768 (isPrefixOf!0 lt!167350 thiss!1305)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4082 BitStream!4082 BitStream!4082) Unit!6773)

(assert (=> d!34768 (= lt!167336 (lemmaIsPrefixTransitive!0 lt!167350 thiss!1305 thiss!1305))))

(declare-fun lt!167338 () Unit!6773)

(declare-fun lt!167340 () Unit!6773)

(assert (=> d!34768 (= lt!167338 lt!167340)))

(assert (=> d!34768 (isPrefixOf!0 lt!167350 thiss!1305)))

(assert (=> d!34768 (= lt!167340 (lemmaIsPrefixTransitive!0 lt!167350 thiss!1305 thiss!1305))))

(declare-fun lt!167334 () Unit!6773)

(assert (=> d!34768 (= lt!167334 e!72516)))

(declare-fun c!6726 () Bool)

(assert (=> d!34768 (= c!6726 (not (= (size!2304 (buf!2698 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!167344 () Unit!6773)

(declare-fun lt!167347 () Unit!6773)

(assert (=> d!34768 (= lt!167344 lt!167347)))

(assert (=> d!34768 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34768 (= lt!167347 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!167349 () Unit!6773)

(declare-fun lt!167346 () Unit!6773)

(assert (=> d!34768 (= lt!167349 lt!167346)))

(assert (=> d!34768 (= lt!167346 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!167348 () Unit!6773)

(declare-fun lt!167339 () Unit!6773)

(assert (=> d!34768 (= lt!167348 lt!167339)))

(assert (=> d!34768 (isPrefixOf!0 lt!167350 lt!167350)))

(assert (=> d!34768 (= lt!167339 (lemmaIsPrefixRefl!0 lt!167350))))

(declare-fun lt!167337 () Unit!6773)

(declare-fun lt!167352 () Unit!6773)

(assert (=> d!34768 (= lt!167337 lt!167352)))

(assert (=> d!34768 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34768 (= lt!167352 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34768 (= lt!167350 (BitStream!4083 (buf!2698 thiss!1305) (currentByte!5252 thiss!1305) (currentBit!5247 thiss!1305)))))

(assert (=> d!34768 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34768 (= (reader!0 thiss!1305 thiss!1305) lt!167342)))

(declare-fun b!110561 () Bool)

(declare-fun res!91260 () Bool)

(assert (=> b!110561 (=> (not res!91260) (not e!72517))))

(assert (=> b!110561 (= res!91260 (isPrefixOf!0 (_1!4858 lt!167342) thiss!1305))))

(declare-fun b!110562 () Bool)

(declare-fun Unit!6777 () Unit!6773)

(assert (=> b!110562 (= e!72516 Unit!6777)))

(assert (= (and d!34768 c!6726) b!110560))

(assert (= (and d!34768 (not c!6726)) b!110562))

(assert (= (and d!34768 res!91259) b!110561))

(assert (= (and b!110561 res!91260) b!110559))

(assert (= (and b!110559 res!91261) b!110558))

(assert (=> b!110560 m!164097))

(declare-fun m!164125 () Bool)

(assert (=> b!110560 m!164125))

(declare-fun m!164127 () Bool)

(assert (=> b!110560 m!164127))

(declare-fun m!164129 () Bool)

(assert (=> d!34768 m!164129))

(declare-fun m!164131 () Bool)

(assert (=> d!34768 m!164131))

(assert (=> d!34768 m!164101))

(assert (=> d!34768 m!164099))

(assert (=> d!34768 m!164099))

(declare-fun m!164137 () Bool)

(assert (=> d!34768 m!164137))

(declare-fun m!164141 () Bool)

(assert (=> d!34768 m!164141))

(assert (=> d!34768 m!164101))

(assert (=> d!34768 m!164099))

(declare-fun m!164145 () Bool)

(assert (=> d!34768 m!164145))

(assert (=> d!34768 m!164131))

(declare-fun m!164147 () Bool)

(assert (=> b!110558 m!164147))

(assert (=> b!110558 m!164097))

(assert (=> b!110558 m!164097))

(declare-fun m!164151 () Bool)

(assert (=> b!110561 m!164151))

(declare-fun m!164155 () Bool)

(assert (=> b!110559 m!164155))

(assert (=> b!110523 d!34768))

(declare-fun d!34774 () Bool)

(assert (=> d!34774 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2304 (buf!2698 thiss!1305))) ((_ sign_extend 32) (currentByte!5252 thiss!1305)) ((_ sign_extend 32) (currentBit!5247 thiss!1305)) lt!167202) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2304 (buf!2698 thiss!1305))) ((_ sign_extend 32) (currentByte!5252 thiss!1305)) ((_ sign_extend 32) (currentBit!5247 thiss!1305))) lt!167202))))

(declare-fun bs!8520 () Bool)

(assert (= bs!8520 d!34774))

(declare-fun m!164165 () Bool)

(assert (=> bs!8520 m!164165))

(assert (=> b!110522 d!34774))

(declare-fun d!34778 () Bool)

(assert (=> d!34778 (= (array_inv!2106 (buf!2698 thiss!1305)) (bvsge (size!2304 (buf!2698 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110524 d!34778))

(declare-fun d!34780 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!34780 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5247 thiss!1305) (currentByte!5252 thiss!1305) (size!2304 (buf!2698 thiss!1305))))))

(declare-fun bs!8522 () Bool)

(assert (= bs!8522 d!34780))

(declare-fun m!164189 () Bool)

(assert (=> bs!8522 m!164189))

(assert (=> start!21884 d!34780))

(declare-fun d!34786 () Bool)

(assert (=> d!34786 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110525 d!34786))

(declare-fun d!34790 () Bool)

(declare-fun e!72529 () Bool)

(assert (=> d!34790 e!72529))

(declare-fun res!91282 () Bool)

(assert (=> d!34790 (=> (not res!91282) (not e!72529))))

(declare-fun lt!167436 () (_ BitVec 64))

(declare-fun lt!167440 () (_ BitVec 64))

(declare-fun lt!167437 () (_ BitVec 64))

(assert (=> d!34790 (= res!91282 (= lt!167437 (bvsub lt!167440 lt!167436)))))

(assert (=> d!34790 (or (= (bvand lt!167440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167436 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167440 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167440 lt!167436) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34790 (= lt!167436 (remainingBits!0 ((_ sign_extend 32) (size!2304 (buf!2698 thiss!1305))) ((_ sign_extend 32) (currentByte!5252 thiss!1305)) ((_ sign_extend 32) (currentBit!5247 thiss!1305))))))

(declare-fun lt!167439 () (_ BitVec 64))

(declare-fun lt!167441 () (_ BitVec 64))

(assert (=> d!34790 (= lt!167440 (bvmul lt!167439 lt!167441))))

(assert (=> d!34790 (or (= lt!167439 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!167441 (bvsdiv (bvmul lt!167439 lt!167441) lt!167439)))))

(assert (=> d!34790 (= lt!167441 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34790 (= lt!167439 ((_ sign_extend 32) (size!2304 (buf!2698 thiss!1305))))))

(assert (=> d!34790 (= lt!167437 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5252 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5247 thiss!1305))))))

(assert (=> d!34790 (invariant!0 (currentBit!5247 thiss!1305) (currentByte!5252 thiss!1305) (size!2304 (buf!2698 thiss!1305)))))

(assert (=> d!34790 (= (bitIndex!0 (size!2304 (buf!2698 thiss!1305)) (currentByte!5252 thiss!1305) (currentBit!5247 thiss!1305)) lt!167437)))

(declare-fun b!110587 () Bool)

(declare-fun res!91283 () Bool)

(assert (=> b!110587 (=> (not res!91283) (not e!72529))))

(assert (=> b!110587 (= res!91283 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!167437))))

(declare-fun b!110588 () Bool)

(declare-fun lt!167438 () (_ BitVec 64))

(assert (=> b!110588 (= e!72529 (bvsle lt!167437 (bvmul lt!167438 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110588 (or (= lt!167438 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!167438 #b0000000000000000000000000000000000000000000000000000000000001000) lt!167438)))))

(assert (=> b!110588 (= lt!167438 ((_ sign_extend 32) (size!2304 (buf!2698 thiss!1305))))))

(assert (= (and d!34790 res!91282) b!110587))

(assert (= (and b!110587 res!91283) b!110588))

(assert (=> d!34790 m!164165))

(assert (=> d!34790 m!164189))

(assert (=> b!110527 d!34790))

(declare-fun d!34796 () Bool)

(declare-fun res!91309 () Bool)

(declare-fun e!72545 () Bool)

(assert (=> d!34796 (=> (not res!91309) (not e!72545))))

(assert (=> d!34796 (= res!91309 (= (size!2304 (buf!2698 thiss!1305)) (size!2304 (buf!2698 thiss!1305))))))

(assert (=> d!34796 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!72545)))

(declare-fun b!110612 () Bool)

(declare-fun res!91308 () Bool)

(assert (=> b!110612 (=> (not res!91308) (not e!72545))))

(assert (=> b!110612 (= res!91308 (bvsle (bitIndex!0 (size!2304 (buf!2698 thiss!1305)) (currentByte!5252 thiss!1305) (currentBit!5247 thiss!1305)) (bitIndex!0 (size!2304 (buf!2698 thiss!1305)) (currentByte!5252 thiss!1305) (currentBit!5247 thiss!1305))))))

(declare-fun b!110613 () Bool)

(declare-fun e!72546 () Bool)

(assert (=> b!110613 (= e!72545 e!72546)))

(declare-fun res!91307 () Bool)

(assert (=> b!110613 (=> res!91307 e!72546)))

(assert (=> b!110613 (= res!91307 (= (size!2304 (buf!2698 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110614 () Bool)

(assert (=> b!110614 (= e!72546 (arrayBitRangesEq!0 (buf!2698 thiss!1305) (buf!2698 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2304 (buf!2698 thiss!1305)) (currentByte!5252 thiss!1305) (currentBit!5247 thiss!1305))))))

(assert (= (and d!34796 res!91309) b!110612))

(assert (= (and b!110612 res!91308) b!110613))

(assert (= (and b!110613 (not res!91307)) b!110614))

(assert (=> b!110612 m!164097))

(assert (=> b!110612 m!164097))

(assert (=> b!110614 m!164097))

(assert (=> b!110614 m!164097))

(declare-fun m!164197 () Bool)

(assert (=> b!110614 m!164197))

(assert (=> b!110527 d!34796))

(declare-fun d!34802 () Bool)

(assert (=> d!34802 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!167455 () Unit!6773)

(declare-fun choose!11 (BitStream!4082) Unit!6773)

(assert (=> d!34802 (= lt!167455 (choose!11 thiss!1305))))

(assert (=> d!34802 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!167455)))

(declare-fun bs!8528 () Bool)

(assert (= bs!8528 d!34802))

(assert (=> bs!8528 m!164099))

(declare-fun m!164203 () Bool)

(assert (=> bs!8528 m!164203))

(assert (=> b!110527 d!34802))

(push 1)

(assert (not d!34802))

(assert (not d!34768))

(assert (not b!110560))

(assert (not b!110561))

(assert (not b!110614))

(assert (not b!110558))

(assert (not d!34790))

(assert (not b!110559))

(assert (not d!34752))

(assert (not b!110612))

(assert (not d!34774))

(assert (not d!34758))

(assert (not d!34780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

