; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24426 () Bool)

(assert start!24426)

(declare-fun b!124337 () Bool)

(declare-fun e!81563 () Bool)

(declare-fun e!81567 () Bool)

(assert (=> b!124337 (= e!81563 e!81567)))

(declare-fun res!103071 () Bool)

(assert (=> b!124337 (=> (not res!103071) (not e!81567))))

(declare-datatypes ((array!5487 0))(
  ( (array!5488 (arr!3077 (Array (_ BitVec 32) (_ BitVec 8))) (size!2484 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4442 0))(
  ( (BitStream!4443 (buf!2930 array!5487) (currentByte!5636 (_ BitVec 32)) (currentBit!5631 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4442)

(declare-fun lt!195956 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124337 (= res!103071 (validate_offset_bits!1 ((_ sign_extend 32) (size!2484 (buf!2930 thiss!1305))) ((_ sign_extend 32) (currentByte!5636 thiss!1305)) ((_ sign_extend 32) (currentBit!5631 thiss!1305)) lt!195956))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!124337 (= lt!195956 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!124338 () Bool)

(declare-fun res!103073 () Bool)

(assert (=> b!124338 (=> (not res!103073) (not e!81567))))

(assert (=> b!124338 (= res!103073 (bvsge i!615 nBits!396))))

(declare-fun b!124339 () Bool)

(declare-fun e!81566 () Bool)

(assert (=> b!124339 (= e!81567 (not e!81566))))

(declare-fun res!103070 () Bool)

(assert (=> b!124339 (=> (not res!103070) (not e!81566))))

(declare-fun lt!195952 () (_ BitVec 64))

(assert (=> b!124339 (= res!103070 (= lt!195952 (bvadd lt!195952 lt!195956)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124339 (= lt!195952 (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4442 BitStream!4442) Bool)

(assert (=> b!124339 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7712 0))(
  ( (Unit!7713) )
))
(declare-fun lt!195957 () Unit!7712)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4442) Unit!7712)

(assert (=> b!124339 (= lt!195957 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124340 () Bool)

(declare-fun res!103072 () Bool)

(assert (=> b!124340 (=> (not res!103072) (not e!81567))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124340 (= res!103072 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124341 () Bool)

(declare-datatypes ((tuple2!10458 0))(
  ( (tuple2!10459 (_1!5497 BitStream!4442) (_2!5497 BitStream!4442)) )
))
(declare-fun lt!195953 () tuple2!10458)

(declare-datatypes ((tuple2!10460 0))(
  ( (tuple2!10461 (_1!5498 BitStream!4442) (_2!5498 (_ BitVec 64))) )
))
(declare-fun lt!195955 () tuple2!10460)

(assert (=> b!124341 (= e!81566 (and (= (_2!5498 lt!195955) v!199) (= (_1!5498 lt!195955) (_2!5497 lt!195953))))))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10460)

(assert (=> b!124341 (= lt!195955 (readNLeastSignificantBitsLoopPure!0 (_1!5497 lt!195953) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!195954 () Unit!7712)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4442 array!5487 (_ BitVec 64)) Unit!7712)

(assert (=> b!124341 (= lt!195954 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2930 thiss!1305) lt!195956))))

(declare-fun reader!0 (BitStream!4442 BitStream!4442) tuple2!10458)

(assert (=> b!124341 (= lt!195953 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124342 () Bool)

(declare-fun e!81565 () Bool)

(declare-fun array_inv!2286 (array!5487) Bool)

(assert (=> b!124342 (= e!81565 (array_inv!2286 (buf!2930 thiss!1305)))))

(declare-fun res!103074 () Bool)

(assert (=> start!24426 (=> (not res!103074) (not e!81563))))

(assert (=> start!24426 (= res!103074 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24426 e!81563))

(assert (=> start!24426 true))

(declare-fun inv!12 (BitStream!4442) Bool)

(assert (=> start!24426 (and (inv!12 thiss!1305) e!81565)))

(assert (= (and start!24426 res!103074) b!124337))

(assert (= (and b!124337 res!103071) b!124340))

(assert (= (and b!124340 res!103072) b!124338))

(assert (= (and b!124338 res!103073) b!124339))

(assert (= (and b!124339 res!103070) b!124341))

(assert (= start!24426 b!124342))

(declare-fun m!189543 () Bool)

(assert (=> b!124342 m!189543))

(declare-fun m!189545 () Bool)

(assert (=> start!24426 m!189545))

(declare-fun m!189547 () Bool)

(assert (=> b!124341 m!189547))

(declare-fun m!189549 () Bool)

(assert (=> b!124341 m!189549))

(declare-fun m!189551 () Bool)

(assert (=> b!124341 m!189551))

(declare-fun m!189553 () Bool)

(assert (=> b!124341 m!189553))

(declare-fun m!189555 () Bool)

(assert (=> b!124337 m!189555))

(declare-fun m!189557 () Bool)

(assert (=> b!124339 m!189557))

(declare-fun m!189559 () Bool)

(assert (=> b!124339 m!189559))

(declare-fun m!189561 () Bool)

(assert (=> b!124339 m!189561))

(declare-fun m!189563 () Bool)

(assert (=> b!124340 m!189563))

(push 1)

(assert (not b!124342))

(assert (not b!124341))

(assert (not start!24426))

(assert (not b!124337))

(assert (not b!124339))

(assert (not b!124340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!40460 () Bool)

(assert (=> d!40460 (= (array_inv!2286 (buf!2930 thiss!1305)) (bvsge (size!2484 (buf!2930 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!124342 d!40460))

(declare-fun d!40462 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!40462 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2484 (buf!2930 thiss!1305))) ((_ sign_extend 32) (currentByte!5636 thiss!1305)) ((_ sign_extend 32) (currentBit!5631 thiss!1305)) lt!195956) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2484 (buf!2930 thiss!1305))) ((_ sign_extend 32) (currentByte!5636 thiss!1305)) ((_ sign_extend 32) (currentBit!5631 thiss!1305))) lt!195956))))

(declare-fun bs!9749 () Bool)

(assert (= bs!9749 d!40462))

(declare-fun m!189577 () Bool)

(assert (=> bs!9749 m!189577))

(assert (=> b!124337 d!40462))

(declare-datatypes ((tuple2!10466 0))(
  ( (tuple2!10467 (_1!5501 (_ BitVec 64)) (_2!5501 BitStream!4442)) )
))
(declare-fun lt!195972 () tuple2!10466)

(declare-fun d!40464 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10466)

(assert (=> d!40464 (= lt!195972 (readNLeastSignificantBitsLoop!0 (_1!5497 lt!195953) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!40464 (= (readNLeastSignificantBitsLoopPure!0 (_1!5497 lt!195953) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!10461 (_2!5501 lt!195972) (_1!5501 lt!195972)))))

(declare-fun bs!9750 () Bool)

(assert (= bs!9750 d!40464))

(declare-fun m!189579 () Bool)

(assert (=> bs!9750 m!189579))

(assert (=> b!124341 d!40464))

(declare-fun d!40466 () Bool)

(assert (=> d!40466 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!124341 d!40466))

(declare-fun d!40468 () Bool)

(assert (=> d!40468 (validate_offset_bits!1 ((_ sign_extend 32) (size!2484 (buf!2930 thiss!1305))) ((_ sign_extend 32) (currentByte!5636 thiss!1305)) ((_ sign_extend 32) (currentBit!5631 thiss!1305)) lt!195956)))

(declare-fun lt!195975 () Unit!7712)

(declare-fun choose!9 (BitStream!4442 array!5487 (_ BitVec 64) BitStream!4442) Unit!7712)

(assert (=> d!40468 (= lt!195975 (choose!9 thiss!1305 (buf!2930 thiss!1305) lt!195956 (BitStream!4443 (buf!2930 thiss!1305) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305))))))

(assert (=> d!40468 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2930 thiss!1305) lt!195956) lt!195975)))

(declare-fun bs!9751 () Bool)

(assert (= bs!9751 d!40468))

(assert (=> bs!9751 m!189555))

(declare-fun m!189581 () Bool)

(assert (=> bs!9751 m!189581))

(assert (=> b!124341 d!40468))

(declare-fun b!124413 () Bool)

(declare-fun e!81603 () Unit!7712)

(declare-fun Unit!7716 () Unit!7712)

(assert (=> b!124413 (= e!81603 Unit!7716)))

(declare-fun e!81602 () Bool)

(declare-fun lt!196188 () (_ BitVec 64))

(declare-fun lt!196190 () tuple2!10458)

(declare-fun lt!196179 () (_ BitVec 64))

(declare-fun b!124414 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!4442 (_ BitVec 64)) BitStream!4442)

(assert (=> b!124414 (= e!81602 (= (_1!5497 lt!196190) (withMovedBitIndex!0 (_2!5497 lt!196190) (bvsub lt!196179 lt!196188))))))

(assert (=> b!124414 (or (= (bvand lt!196179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196188 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196179 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196179 lt!196188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!124414 (= lt!196188 (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305)))))

(assert (=> b!124414 (= lt!196179 (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305)))))

(declare-fun b!124415 () Bool)

(declare-fun lt!196181 () Unit!7712)

(assert (=> b!124415 (= e!81603 lt!196181)))

(declare-fun lt!196196 () (_ BitVec 64))

(assert (=> b!124415 (= lt!196196 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!196183 () (_ BitVec 64))

(assert (=> b!124415 (= lt!196183 (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5487 array!5487 (_ BitVec 64) (_ BitVec 64)) Unit!7712)

(assert (=> b!124415 (= lt!196181 (arrayBitRangesEqSymmetric!0 (buf!2930 thiss!1305) (buf!2930 thiss!1305) lt!196196 lt!196183))))

(declare-fun arrayBitRangesEq!0 (array!5487 array!5487 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124415 (arrayBitRangesEq!0 (buf!2930 thiss!1305) (buf!2930 thiss!1305) lt!196196 lt!196183)))

(declare-fun b!124417 () Bool)

(declare-fun res!103130 () Bool)

(assert (=> b!124417 (=> (not res!103130) (not e!81602))))

(assert (=> b!124417 (= res!103130 (isPrefixOf!0 (_1!5497 lt!196190) thiss!1305))))

(declare-fun b!124416 () Bool)

(declare-fun res!103131 () Bool)

(assert (=> b!124416 (=> (not res!103131) (not e!81602))))

(assert (=> b!124416 (= res!103131 (isPrefixOf!0 (_2!5497 lt!196190) thiss!1305))))

(declare-fun d!40470 () Bool)

(assert (=> d!40470 e!81602))

(declare-fun res!103129 () Bool)

(assert (=> d!40470 (=> (not res!103129) (not e!81602))))

(assert (=> d!40470 (= res!103129 (isPrefixOf!0 (_1!5497 lt!196190) (_2!5497 lt!196190)))))

(declare-fun lt!196184 () BitStream!4442)

(assert (=> d!40470 (= lt!196190 (tuple2!10459 lt!196184 thiss!1305))))

(declare-fun lt!196178 () Unit!7712)

(declare-fun lt!196195 () Unit!7712)

(assert (=> d!40470 (= lt!196178 lt!196195)))

(assert (=> d!40470 (isPrefixOf!0 lt!196184 thiss!1305)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4442 BitStream!4442 BitStream!4442) Unit!7712)

(assert (=> d!40470 (= lt!196195 (lemmaIsPrefixTransitive!0 lt!196184 thiss!1305 thiss!1305))))

(declare-fun lt!196186 () Unit!7712)

(declare-fun lt!196193 () Unit!7712)

(assert (=> d!40470 (= lt!196186 lt!196193)))

(assert (=> d!40470 (isPrefixOf!0 lt!196184 thiss!1305)))

(assert (=> d!40470 (= lt!196193 (lemmaIsPrefixTransitive!0 lt!196184 thiss!1305 thiss!1305))))

(declare-fun lt!196180 () Unit!7712)

(assert (=> d!40470 (= lt!196180 e!81603)))

(declare-fun c!7426 () Bool)

(assert (=> d!40470 (= c!7426 (not (= (size!2484 (buf!2930 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!196189 () Unit!7712)

(declare-fun lt!196194 () Unit!7712)

(assert (=> d!40470 (= lt!196189 lt!196194)))

(assert (=> d!40470 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!40470 (= lt!196194 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!196192 () Unit!7712)

(declare-fun lt!196191 () Unit!7712)

(assert (=> d!40470 (= lt!196192 lt!196191)))

(assert (=> d!40470 (= lt!196191 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!196185 () Unit!7712)

(declare-fun lt!196182 () Unit!7712)

(assert (=> d!40470 (= lt!196185 lt!196182)))

(assert (=> d!40470 (isPrefixOf!0 lt!196184 lt!196184)))

(assert (=> d!40470 (= lt!196182 (lemmaIsPrefixRefl!0 lt!196184))))

(declare-fun lt!196197 () Unit!7712)

(declare-fun lt!196187 () Unit!7712)

(assert (=> d!40470 (= lt!196197 lt!196187)))

(assert (=> d!40470 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!40470 (= lt!196187 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!40470 (= lt!196184 (BitStream!4443 (buf!2930 thiss!1305) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305)))))

(assert (=> d!40470 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!40470 (= (reader!0 thiss!1305 thiss!1305) lt!196190)))

(assert (= (and d!40470 c!7426) b!124415))

(assert (= (and d!40470 (not c!7426)) b!124413))

(assert (= (and d!40470 res!103129) b!124417))

(assert (= (and b!124417 res!103130) b!124416))

(assert (= (and b!124416 res!103131) b!124414))

(assert (=> b!124415 m!189557))

(declare-fun m!189635 () Bool)

(assert (=> b!124415 m!189635))

(declare-fun m!189637 () Bool)

(assert (=> b!124415 m!189637))

(declare-fun m!189639 () Bool)

(assert (=> b!124417 m!189639))

(declare-fun m!189641 () Bool)

(assert (=> b!124414 m!189641))

(assert (=> b!124414 m!189557))

(assert (=> b!124414 m!189557))

(assert (=> d!40470 m!189561))

(declare-fun m!189643 () Bool)

(assert (=> d!40470 m!189643))

(assert (=> d!40470 m!189561))

(declare-fun m!189645 () Bool)

(assert (=> d!40470 m!189645))

(assert (=> d!40470 m!189559))

(declare-fun m!189647 () Bool)

(assert (=> d!40470 m!189647))

(declare-fun m!189649 () Bool)

(assert (=> d!40470 m!189649))

(declare-fun m!189651 () Bool)

(assert (=> d!40470 m!189651))

(assert (=> d!40470 m!189559))

(assert (=> d!40470 m!189559))

(assert (=> d!40470 m!189643))

(declare-fun m!189653 () Bool)

(assert (=> b!124416 m!189653))

(assert (=> b!124341 d!40470))

(declare-fun d!40494 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!40494 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5631 thiss!1305) (currentByte!5636 thiss!1305) (size!2484 (buf!2930 thiss!1305))))))

(declare-fun bs!9758 () Bool)

(assert (= bs!9758 d!40494))

(declare-fun m!189655 () Bool)

(assert (=> bs!9758 m!189655))

(assert (=> start!24426 d!40494))

(declare-fun d!40496 () Bool)

(assert (=> d!40496 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!124340 d!40496))

(declare-fun d!40498 () Bool)

(declare-fun e!81606 () Bool)

(assert (=> d!40498 e!81606))

(declare-fun res!103137 () Bool)

(assert (=> d!40498 (=> (not res!103137) (not e!81606))))

(declare-fun lt!196211 () (_ BitVec 64))

(declare-fun lt!196212 () (_ BitVec 64))

(declare-fun lt!196215 () (_ BitVec 64))

(assert (=> d!40498 (= res!103137 (= lt!196215 (bvsub lt!196211 lt!196212)))))

(assert (=> d!40498 (or (= (bvand lt!196211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196212 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196211 lt!196212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40498 (= lt!196212 (remainingBits!0 ((_ sign_extend 32) (size!2484 (buf!2930 thiss!1305))) ((_ sign_extend 32) (currentByte!5636 thiss!1305)) ((_ sign_extend 32) (currentBit!5631 thiss!1305))))))

(declare-fun lt!196210 () (_ BitVec 64))

(declare-fun lt!196213 () (_ BitVec 64))

(assert (=> d!40498 (= lt!196211 (bvmul lt!196210 lt!196213))))

(assert (=> d!40498 (or (= lt!196210 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!196213 (bvsdiv (bvmul lt!196210 lt!196213) lt!196210)))))

(assert (=> d!40498 (= lt!196213 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40498 (= lt!196210 ((_ sign_extend 32) (size!2484 (buf!2930 thiss!1305))))))

(assert (=> d!40498 (= lt!196215 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5636 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5631 thiss!1305))))))

(assert (=> d!40498 (invariant!0 (currentBit!5631 thiss!1305) (currentByte!5636 thiss!1305) (size!2484 (buf!2930 thiss!1305)))))

(assert (=> d!40498 (= (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305)) lt!196215)))

(declare-fun b!124422 () Bool)

(declare-fun res!103136 () Bool)

(assert (=> b!124422 (=> (not res!103136) (not e!81606))))

(assert (=> b!124422 (= res!103136 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!196215))))

(declare-fun b!124423 () Bool)

(declare-fun lt!196214 () (_ BitVec 64))

(assert (=> b!124423 (= e!81606 (bvsle lt!196215 (bvmul lt!196214 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!124423 (or (= lt!196214 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196214 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196214)))))

(assert (=> b!124423 (= lt!196214 ((_ sign_extend 32) (size!2484 (buf!2930 thiss!1305))))))

(assert (= (and d!40498 res!103137) b!124422))

(assert (= (and b!124422 res!103136) b!124423))

(assert (=> d!40498 m!189577))

(assert (=> d!40498 m!189655))

(assert (=> b!124339 d!40498))

(declare-fun d!40500 () Bool)

(declare-fun res!103145 () Bool)

(declare-fun e!81611 () Bool)

(assert (=> d!40500 (=> (not res!103145) (not e!81611))))

(assert (=> d!40500 (= res!103145 (= (size!2484 (buf!2930 thiss!1305)) (size!2484 (buf!2930 thiss!1305))))))

(assert (=> d!40500 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!81611)))

(declare-fun b!124430 () Bool)

(declare-fun res!103144 () Bool)

(assert (=> b!124430 (=> (not res!103144) (not e!81611))))

(assert (=> b!124430 (= res!103144 (bvsle (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305)) (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305))))))

(declare-fun b!124431 () Bool)

(declare-fun e!81612 () Bool)

(assert (=> b!124431 (= e!81611 e!81612)))

(declare-fun res!103146 () Bool)

(assert (=> b!124431 (=> res!103146 e!81612)))

(assert (=> b!124431 (= res!103146 (= (size!2484 (buf!2930 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!124432 () Bool)

(assert (=> b!124432 (= e!81612 (arrayBitRangesEq!0 (buf!2930 thiss!1305) (buf!2930 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305))))))

(assert (= (and d!40500 res!103145) b!124430))

(assert (= (and b!124430 res!103144) b!124431))

(assert (= (and b!124431 (not res!103146)) b!124432))

(assert (=> b!124430 m!189557))

(assert (=> b!124430 m!189557))

(assert (=> b!124432 m!189557))

(assert (=> b!124432 m!189557))

(declare-fun m!189657 () Bool)

(assert (=> b!124432 m!189657))

(assert (=> b!124339 d!40500))

(declare-fun d!40502 () Bool)

(assert (=> d!40502 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!196218 () Unit!7712)

(declare-fun choose!11 (BitStream!4442) Unit!7712)

(assert (=> d!40502 (= lt!196218 (choose!11 thiss!1305))))

(assert (=> d!40502 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!196218)))

(declare-fun bs!9760 () Bool)

(assert (= bs!9760 d!40502))

(assert (=> bs!9760 m!189559))

(declare-fun m!189659 () Bool)

(assert (=> bs!9760 m!189659))

(assert (=> b!124339 d!40502))

(push 1)

(assert (not b!124432))

(assert (not d!40470))

(assert (not d!40468))

(assert (not d!40498))

(assert (not b!124417))

(assert (not b!124416))

(assert (not d!40502))

(assert (not b!124414))

(assert (not b!124415))

(assert (not d!40462))

(assert (not d!40494))

(assert (not d!40464))

(assert (not b!124430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!124430 d!40498))

(declare-fun d!40536 () Bool)

(assert (=> d!40536 (= (invariant!0 (currentBit!5631 thiss!1305) (currentByte!5636 thiss!1305) (size!2484 (buf!2930 thiss!1305))) (and (bvsge (currentBit!5631 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5631 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5636 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5636 thiss!1305) (size!2484 (buf!2930 thiss!1305))) (and (= (currentBit!5631 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5636 thiss!1305) (size!2484 (buf!2930 thiss!1305)))))))))

(assert (=> d!40494 d!40536))

(declare-fun d!40538 () Bool)

(assert (=> d!40538 (= (remainingBits!0 ((_ sign_extend 32) (size!2484 (buf!2930 thiss!1305))) ((_ sign_extend 32) (currentByte!5636 thiss!1305)) ((_ sign_extend 32) (currentBit!5631 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2484 (buf!2930 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5636 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5631 thiss!1305)))))))

(assert (=> d!40498 d!40538))

(assert (=> d!40498 d!40536))

(declare-fun d!40540 () Bool)

(declare-fun res!103201 () Bool)

(declare-fun e!81659 () Bool)

(assert (=> d!40540 (=> (not res!103201) (not e!81659))))

(assert (=> d!40540 (= res!103201 (= (size!2484 (buf!2930 (_1!5497 lt!196190))) (size!2484 (buf!2930 thiss!1305))))))

(assert (=> d!40540 (= (isPrefixOf!0 (_1!5497 lt!196190) thiss!1305) e!81659)))

(declare-fun b!124500 () Bool)

(declare-fun res!103200 () Bool)

(assert (=> b!124500 (=> (not res!103200) (not e!81659))))

(assert (=> b!124500 (= res!103200 (bvsle (bitIndex!0 (size!2484 (buf!2930 (_1!5497 lt!196190))) (currentByte!5636 (_1!5497 lt!196190)) (currentBit!5631 (_1!5497 lt!196190))) (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305))))))

(declare-fun b!124501 () Bool)

(declare-fun e!81660 () Bool)

(assert (=> b!124501 (= e!81659 e!81660)))

(declare-fun res!103202 () Bool)

(assert (=> b!124501 (=> res!103202 e!81660)))

(assert (=> b!124501 (= res!103202 (= (size!2484 (buf!2930 (_1!5497 lt!196190))) #b00000000000000000000000000000000))))

(declare-fun b!124502 () Bool)

(assert (=> b!124502 (= e!81660 (arrayBitRangesEq!0 (buf!2930 (_1!5497 lt!196190)) (buf!2930 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2484 (buf!2930 (_1!5497 lt!196190))) (currentByte!5636 (_1!5497 lt!196190)) (currentBit!5631 (_1!5497 lt!196190)))))))

(assert (= (and d!40540 res!103201) b!124500))

(assert (= (and b!124500 res!103200) b!124501))

(assert (= (and b!124501 (not res!103202)) b!124502))

(declare-fun m!189723 () Bool)

(assert (=> b!124500 m!189723))

(assert (=> b!124500 m!189557))

(assert (=> b!124502 m!189723))

(assert (=> b!124502 m!189723))

(declare-fun m!189725 () Bool)

(assert (=> b!124502 m!189725))

(assert (=> b!124417 d!40540))

(declare-fun d!40542 () Bool)

(declare-fun res!103204 () Bool)

(declare-fun e!81661 () Bool)

(assert (=> d!40542 (=> (not res!103204) (not e!81661))))

(assert (=> d!40542 (= res!103204 (= (size!2484 (buf!2930 lt!196184)) (size!2484 (buf!2930 thiss!1305))))))

(assert (=> d!40542 (= (isPrefixOf!0 lt!196184 thiss!1305) e!81661)))

(declare-fun b!124503 () Bool)

(declare-fun res!103203 () Bool)

(assert (=> b!124503 (=> (not res!103203) (not e!81661))))

(assert (=> b!124503 (= res!103203 (bvsle (bitIndex!0 (size!2484 (buf!2930 lt!196184)) (currentByte!5636 lt!196184) (currentBit!5631 lt!196184)) (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305))))))

(declare-fun b!124504 () Bool)

(declare-fun e!81662 () Bool)

(assert (=> b!124504 (= e!81661 e!81662)))

(declare-fun res!103205 () Bool)

(assert (=> b!124504 (=> res!103205 e!81662)))

(assert (=> b!124504 (= res!103205 (= (size!2484 (buf!2930 lt!196184)) #b00000000000000000000000000000000))))

(declare-fun b!124505 () Bool)

(assert (=> b!124505 (= e!81662 (arrayBitRangesEq!0 (buf!2930 lt!196184) (buf!2930 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2484 (buf!2930 lt!196184)) (currentByte!5636 lt!196184) (currentBit!5631 lt!196184))))))

(assert (= (and d!40542 res!103204) b!124503))

(assert (= (and b!124503 res!103203) b!124504))

(assert (= (and b!124504 (not res!103205)) b!124505))

(declare-fun m!189727 () Bool)

(assert (=> b!124503 m!189727))

(assert (=> b!124503 m!189557))

(assert (=> b!124505 m!189727))

(assert (=> b!124505 m!189727))

(declare-fun m!189729 () Bool)

(assert (=> b!124505 m!189729))

(assert (=> d!40470 d!40542))

(assert (=> d!40470 d!40502))

(declare-fun d!40544 () Bool)

(declare-fun res!103207 () Bool)

(declare-fun e!81663 () Bool)

(assert (=> d!40544 (=> (not res!103207) (not e!81663))))

(assert (=> d!40544 (= res!103207 (= (size!2484 (buf!2930 lt!196184)) (size!2484 (buf!2930 lt!196184))))))

(assert (=> d!40544 (= (isPrefixOf!0 lt!196184 lt!196184) e!81663)))

(declare-fun b!124506 () Bool)

(declare-fun res!103206 () Bool)

(assert (=> b!124506 (=> (not res!103206) (not e!81663))))

(assert (=> b!124506 (= res!103206 (bvsle (bitIndex!0 (size!2484 (buf!2930 lt!196184)) (currentByte!5636 lt!196184) (currentBit!5631 lt!196184)) (bitIndex!0 (size!2484 (buf!2930 lt!196184)) (currentByte!5636 lt!196184) (currentBit!5631 lt!196184))))))

(declare-fun b!124507 () Bool)

(declare-fun e!81664 () Bool)

(assert (=> b!124507 (= e!81663 e!81664)))

(declare-fun res!103208 () Bool)

(assert (=> b!124507 (=> res!103208 e!81664)))

(assert (=> b!124507 (= res!103208 (= (size!2484 (buf!2930 lt!196184)) #b00000000000000000000000000000000))))

(declare-fun b!124508 () Bool)

(assert (=> b!124508 (= e!81664 (arrayBitRangesEq!0 (buf!2930 lt!196184) (buf!2930 lt!196184) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2484 (buf!2930 lt!196184)) (currentByte!5636 lt!196184) (currentBit!5631 lt!196184))))))

(assert (= (and d!40544 res!103207) b!124506))

(assert (= (and b!124506 res!103206) b!124507))

(assert (= (and b!124507 (not res!103208)) b!124508))

(assert (=> b!124506 m!189727))

(assert (=> b!124506 m!189727))

(assert (=> b!124508 m!189727))

(assert (=> b!124508 m!189727))

(declare-fun m!189731 () Bool)

(assert (=> b!124508 m!189731))

(assert (=> d!40470 d!40544))

(declare-fun d!40546 () Bool)

(declare-fun res!103210 () Bool)

(declare-fun e!81665 () Bool)

(assert (=> d!40546 (=> (not res!103210) (not e!81665))))

(assert (=> d!40546 (= res!103210 (= (size!2484 (buf!2930 (_1!5497 lt!196190))) (size!2484 (buf!2930 (_2!5497 lt!196190)))))))

(assert (=> d!40546 (= (isPrefixOf!0 (_1!5497 lt!196190) (_2!5497 lt!196190)) e!81665)))

(declare-fun b!124509 () Bool)

(declare-fun res!103209 () Bool)

(assert (=> b!124509 (=> (not res!103209) (not e!81665))))

(assert (=> b!124509 (= res!103209 (bvsle (bitIndex!0 (size!2484 (buf!2930 (_1!5497 lt!196190))) (currentByte!5636 (_1!5497 lt!196190)) (currentBit!5631 (_1!5497 lt!196190))) (bitIndex!0 (size!2484 (buf!2930 (_2!5497 lt!196190))) (currentByte!5636 (_2!5497 lt!196190)) (currentBit!5631 (_2!5497 lt!196190)))))))

(declare-fun b!124510 () Bool)

(declare-fun e!81666 () Bool)

(assert (=> b!124510 (= e!81665 e!81666)))

(declare-fun res!103211 () Bool)

(assert (=> b!124510 (=> res!103211 e!81666)))

(assert (=> b!124510 (= res!103211 (= (size!2484 (buf!2930 (_1!5497 lt!196190))) #b00000000000000000000000000000000))))

(declare-fun b!124511 () Bool)

(assert (=> b!124511 (= e!81666 (arrayBitRangesEq!0 (buf!2930 (_1!5497 lt!196190)) (buf!2930 (_2!5497 lt!196190)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2484 (buf!2930 (_1!5497 lt!196190))) (currentByte!5636 (_1!5497 lt!196190)) (currentBit!5631 (_1!5497 lt!196190)))))))

(assert (= (and d!40546 res!103210) b!124509))

(assert (= (and b!124509 res!103209) b!124510))

(assert (= (and b!124510 (not res!103211)) b!124511))

(assert (=> b!124509 m!189723))

(declare-fun m!189733 () Bool)

(assert (=> b!124509 m!189733))

(assert (=> b!124511 m!189723))

(assert (=> b!124511 m!189723))

(declare-fun m!189735 () Bool)

(assert (=> b!124511 m!189735))

(assert (=> d!40470 d!40546))

(assert (=> d!40470 d!40500))

(declare-fun d!40548 () Bool)

(assert (=> d!40548 (isPrefixOf!0 lt!196184 lt!196184)))

(declare-fun lt!196271 () Unit!7712)

(assert (=> d!40548 (= lt!196271 (choose!11 lt!196184))))

(assert (=> d!40548 (= (lemmaIsPrefixRefl!0 lt!196184) lt!196271)))

(declare-fun bs!9767 () Bool)

(assert (= bs!9767 d!40548))

(assert (=> bs!9767 m!189649))

(declare-fun m!189737 () Bool)

(assert (=> bs!9767 m!189737))

(assert (=> d!40470 d!40548))

(declare-fun d!40550 () Bool)

(assert (=> d!40550 (isPrefixOf!0 lt!196184 thiss!1305)))

(declare-fun lt!196274 () Unit!7712)

(declare-fun choose!30 (BitStream!4442 BitStream!4442 BitStream!4442) Unit!7712)

(assert (=> d!40550 (= lt!196274 (choose!30 lt!196184 thiss!1305 thiss!1305))))

(assert (=> d!40550 (isPrefixOf!0 lt!196184 thiss!1305)))

(assert (=> d!40550 (= (lemmaIsPrefixTransitive!0 lt!196184 thiss!1305 thiss!1305) lt!196274)))

(declare-fun bs!9768 () Bool)

(assert (= bs!9768 d!40550))

(assert (=> bs!9768 m!189645))

(declare-fun m!189739 () Bool)

(assert (=> bs!9768 m!189739))

(assert (=> bs!9768 m!189645))

(assert (=> d!40470 d!40550))

(declare-fun b!124526 () Bool)

(declare-fun res!103222 () Bool)

(declare-fun e!81674 () Bool)

(assert (=> b!124526 (=> (not res!103222) (not e!81674))))

(declare-fun lt!196293 () tuple2!10466)

(assert (=> b!124526 (= res!103222 (= (bvand (_1!5501 lt!196293) (onesLSBLong!0 nBits!396)) (_1!5501 lt!196293)))))

(declare-fun b!124527 () Bool)

(declare-fun res!103223 () Bool)

(assert (=> b!124527 (=> (not res!103223) (not e!81674))))

(declare-fun lt!196301 () (_ BitVec 64))

(declare-fun lt!196300 () (_ BitVec 64))

(assert (=> b!124527 (= res!103223 (= (bitIndex!0 (size!2484 (buf!2930 (_2!5501 lt!196293))) (currentByte!5636 (_2!5501 lt!196293)) (currentBit!5631 (_2!5501 lt!196293))) (bvadd lt!196301 lt!196300)))))

(assert (=> b!124527 (or (not (= (bvand lt!196301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196300 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!196301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!196301 lt!196300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!124527 (= lt!196300 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!124527 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!124527 (= lt!196301 (bitIndex!0 (size!2484 (buf!2930 (_1!5497 lt!195953))) (currentByte!5636 (_1!5497 lt!195953)) (currentBit!5631 (_1!5497 lt!195953))))))

(declare-fun b!124528 () Bool)

(declare-fun lt!196295 () (_ BitVec 64))

(declare-fun e!81675 () Bool)

(declare-datatypes ((tuple2!10474 0))(
  ( (tuple2!10475 (_1!5506 BitStream!4442) (_2!5506 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4442) tuple2!10474)

(assert (=> b!124528 (= e!81675 (= (= (bvand (bvlshr (_1!5501 lt!196293) lt!196295) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!5506 (readBitPure!0 (_1!5497 lt!195953)))))))

(assert (=> b!124528 (and (bvsge lt!196295 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!196295 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!196298 () (_ BitVec 32))

(assert (=> b!124528 (= lt!196295 ((_ sign_extend 32) (bvsub lt!196298 i!615)))))

(assert (=> b!124528 (or (= (bvand lt!196298 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!196298 #b10000000000000000000000000000000) (bvand (bvsub lt!196298 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!124528 (= lt!196298 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!124528 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!124529 () Bool)

(declare-fun e!81673 () tuple2!10466)

(declare-fun lt!196294 () tuple2!10466)

(assert (=> b!124529 (= e!81673 (tuple2!10467 (_1!5501 lt!196294) (_2!5501 lt!196294)))))

(declare-datatypes ((tuple2!10476 0))(
  ( (tuple2!10477 (_1!5507 Bool) (_2!5507 BitStream!4442)) )
))
(declare-fun lt!196299 () tuple2!10476)

(declare-fun readBit!0 (BitStream!4442) tuple2!10476)

(assert (=> b!124529 (= lt!196299 (readBit!0 (_1!5497 lt!195953)))))

(assert (=> b!124529 (= lt!196294 (readNLeastSignificantBitsLoop!0 (_2!5507 lt!196299) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))) (ite (_1!5507 lt!196299) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!40552 () Bool)

(assert (=> d!40552 e!81674))

(declare-fun res!103226 () Bool)

(assert (=> d!40552 (=> (not res!103226) (not e!81674))))

(assert (=> d!40552 (= res!103226 (= (buf!2930 (_2!5501 lt!196293)) (buf!2930 (_1!5497 lt!195953))))))

(assert (=> d!40552 (= lt!196293 e!81673)))

(declare-fun c!7436 () Bool)

(assert (=> d!40552 (= c!7436 (= nBits!396 i!615))))

(assert (=> d!40552 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!40552 (= (readNLeastSignificantBitsLoop!0 (_1!5497 lt!195953) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) lt!196293)))

(declare-fun b!124530 () Bool)

(assert (=> b!124530 (= e!81673 (tuple2!10467 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))) (_1!5497 lt!195953)))))

(declare-fun b!124531 () Bool)

(declare-fun res!103224 () Bool)

(assert (=> b!124531 (=> (not res!103224) (not e!81674))))

(declare-fun lt!196297 () (_ BitVec 64))

(declare-fun lt!196296 () (_ BitVec 64))

(assert (=> b!124531 (= res!103224 (= (bvlshr (_1!5501 lt!196293) lt!196297) (bvlshr (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))) lt!196296)))))

(assert (=> b!124531 (and (bvsge lt!196296 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!196296 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!124531 (= lt!196296 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!124531 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!124531 (and (bvsge lt!196297 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!196297 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!124531 (= lt!196297 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!124531 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(declare-fun b!124532 () Bool)

(assert (=> b!124532 (= e!81674 e!81675)))

(declare-fun res!103225 () Bool)

(assert (=> b!124532 (=> res!103225 e!81675)))

(assert (=> b!124532 (= res!103225 (bvsge i!615 nBits!396))))

(assert (= (and d!40552 c!7436) b!124530))

(assert (= (and d!40552 (not c!7436)) b!124529))

(assert (= (and d!40552 res!103226) b!124527))

(assert (= (and b!124527 res!103223) b!124531))

(assert (= (and b!124531 res!103224) b!124526))

(assert (= (and b!124526 res!103222) b!124532))

(assert (= (and b!124532 (not res!103225)) b!124528))

(assert (=> b!124526 m!189563))

(declare-fun m!189741 () Bool)

(assert (=> b!124527 m!189741))

(declare-fun m!189743 () Bool)

(assert (=> b!124527 m!189743))

(declare-fun m!189745 () Bool)

(assert (=> b!124528 m!189745))

(declare-fun m!189747 () Bool)

(assert (=> b!124529 m!189747))

(declare-fun m!189749 () Bool)

(assert (=> b!124529 m!189749))

(assert (=> d!40464 d!40552))

(declare-fun d!40554 () Bool)

(declare-fun res!103228 () Bool)

(declare-fun e!81676 () Bool)

(assert (=> d!40554 (=> (not res!103228) (not e!81676))))

(assert (=> d!40554 (= res!103228 (= (size!2484 (buf!2930 (_2!5497 lt!196190))) (size!2484 (buf!2930 thiss!1305))))))

(assert (=> d!40554 (= (isPrefixOf!0 (_2!5497 lt!196190) thiss!1305) e!81676)))

(declare-fun b!124533 () Bool)

(declare-fun res!103227 () Bool)

(assert (=> b!124533 (=> (not res!103227) (not e!81676))))

(assert (=> b!124533 (= res!103227 (bvsle (bitIndex!0 (size!2484 (buf!2930 (_2!5497 lt!196190))) (currentByte!5636 (_2!5497 lt!196190)) (currentBit!5631 (_2!5497 lt!196190))) (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305))))))

(declare-fun b!124534 () Bool)

(declare-fun e!81677 () Bool)

(assert (=> b!124534 (= e!81676 e!81677)))

(declare-fun res!103229 () Bool)

(assert (=> b!124534 (=> res!103229 e!81677)))

(assert (=> b!124534 (= res!103229 (= (size!2484 (buf!2930 (_2!5497 lt!196190))) #b00000000000000000000000000000000))))

(declare-fun b!124535 () Bool)

(assert (=> b!124535 (= e!81677 (arrayBitRangesEq!0 (buf!2930 (_2!5497 lt!196190)) (buf!2930 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2484 (buf!2930 (_2!5497 lt!196190))) (currentByte!5636 (_2!5497 lt!196190)) (currentBit!5631 (_2!5497 lt!196190)))))))

(assert (= (and d!40554 res!103228) b!124533))

(assert (= (and b!124533 res!103227) b!124534))

(assert (= (and b!124534 (not res!103229)) b!124535))

(assert (=> b!124533 m!189733))

(assert (=> b!124533 m!189557))

(assert (=> b!124535 m!189733))

(assert (=> b!124535 m!189733))

(declare-fun m!189751 () Bool)

(assert (=> b!124535 m!189751))

(assert (=> b!124416 d!40554))

(assert (=> d!40462 d!40538))

(assert (=> b!124415 d!40498))

(declare-fun d!40556 () Bool)

(assert (=> d!40556 (arrayBitRangesEq!0 (buf!2930 thiss!1305) (buf!2930 thiss!1305) lt!196196 lt!196183)))

(declare-fun lt!196304 () Unit!7712)

(declare-fun choose!8 (array!5487 array!5487 (_ BitVec 64) (_ BitVec 64)) Unit!7712)

(assert (=> d!40556 (= lt!196304 (choose!8 (buf!2930 thiss!1305) (buf!2930 thiss!1305) lt!196196 lt!196183))))

(assert (=> d!40556 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!196196) (bvsle lt!196196 lt!196183))))

(assert (=> d!40556 (= (arrayBitRangesEqSymmetric!0 (buf!2930 thiss!1305) (buf!2930 thiss!1305) lt!196196 lt!196183) lt!196304)))

(declare-fun bs!9769 () Bool)

(assert (= bs!9769 d!40556))

(assert (=> bs!9769 m!189637))

(declare-fun m!189753 () Bool)

(assert (=> bs!9769 m!189753))

(assert (=> b!124415 d!40556))

(declare-fun b!124550 () Bool)

(declare-fun res!103244 () Bool)

(declare-fun lt!196312 () (_ BitVec 32))

(assert (=> b!124550 (= res!103244 (= lt!196312 #b00000000000000000000000000000000))))

(declare-fun e!81690 () Bool)

(assert (=> b!124550 (=> res!103244 e!81690)))

(declare-fun e!81693 () Bool)

(assert (=> b!124550 (= e!81693 e!81690)))

(declare-fun d!40558 () Bool)

(declare-fun res!103243 () Bool)

(declare-fun e!81691 () Bool)

(assert (=> d!40558 (=> res!103243 e!81691)))

(assert (=> d!40558 (= res!103243 (bvsge lt!196196 lt!196183))))

(assert (=> d!40558 (= (arrayBitRangesEq!0 (buf!2930 thiss!1305) (buf!2930 thiss!1305) lt!196196 lt!196183) e!81691)))

(declare-datatypes ((tuple4!96 0))(
  ( (tuple4!97 (_1!5508 (_ BitVec 32)) (_2!5508 (_ BitVec 32)) (_3!269 (_ BitVec 32)) (_4!48 (_ BitVec 32))) )
))
(declare-fun lt!196311 () tuple4!96)

(declare-fun b!124551 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!124551 (= e!81690 (byteRangesEq!0 (select (arr!3077 (buf!2930 thiss!1305)) (_4!48 lt!196311)) (select (arr!3077 (buf!2930 thiss!1305)) (_4!48 lt!196311)) #b00000000000000000000000000000000 lt!196312))))

(declare-fun b!124552 () Bool)

(declare-fun e!81692 () Bool)

(assert (=> b!124552 (= e!81692 e!81693)))

(declare-fun res!103241 () Bool)

(declare-fun call!1635 () Bool)

(assert (=> b!124552 (= res!103241 call!1635)))

(assert (=> b!124552 (=> (not res!103241) (not e!81693))))

(declare-fun b!124553 () Bool)

(assert (=> b!124553 (= e!81692 call!1635)))

(declare-fun b!124554 () Bool)

(declare-fun e!81695 () Bool)

(assert (=> b!124554 (= e!81695 e!81692)))

(declare-fun c!7439 () Bool)

(assert (=> b!124554 (= c!7439 (= (_3!269 lt!196311) (_4!48 lt!196311)))))

(declare-fun b!124555 () Bool)

(assert (=> b!124555 (= e!81691 e!81695)))

(declare-fun res!103240 () Bool)

(assert (=> b!124555 (=> (not res!103240) (not e!81695))))

(declare-fun e!81694 () Bool)

(assert (=> b!124555 (= res!103240 e!81694)))

(declare-fun res!103242 () Bool)

(assert (=> b!124555 (=> res!103242 e!81694)))

(assert (=> b!124555 (= res!103242 (bvsge (_1!5508 lt!196311) (_2!5508 lt!196311)))))

(assert (=> b!124555 (= lt!196312 ((_ extract 31 0) (bvsrem lt!196183 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!196313 () (_ BitVec 32))

(assert (=> b!124555 (= lt!196313 ((_ extract 31 0) (bvsrem lt!196196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!96)

(assert (=> b!124555 (= lt!196311 (arrayBitIndices!0 lt!196196 lt!196183))))

(declare-fun b!124556 () Bool)

(declare-fun arrayRangesEq!49 (array!5487 array!5487 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!124556 (= e!81694 (arrayRangesEq!49 (buf!2930 thiss!1305) (buf!2930 thiss!1305) (_1!5508 lt!196311) (_2!5508 lt!196311)))))

(declare-fun bm!1632 () Bool)

(assert (=> bm!1632 (= call!1635 (byteRangesEq!0 (select (arr!3077 (buf!2930 thiss!1305)) (_3!269 lt!196311)) (select (arr!3077 (buf!2930 thiss!1305)) (_3!269 lt!196311)) lt!196313 (ite c!7439 lt!196312 #b00000000000000000000000000001000)))))

(assert (= (and d!40558 (not res!103243)) b!124555))

(assert (= (and b!124555 (not res!103242)) b!124556))

(assert (= (and b!124555 res!103240) b!124554))

(assert (= (and b!124554 c!7439) b!124553))

(assert (= (and b!124554 (not c!7439)) b!124552))

(assert (= (and b!124552 res!103241) b!124550))

(assert (= (and b!124550 (not res!103244)) b!124551))

(assert (= (or b!124553 b!124552) bm!1632))

(declare-fun m!189755 () Bool)

(assert (=> b!124551 m!189755))

(assert (=> b!124551 m!189755))

(assert (=> b!124551 m!189755))

(assert (=> b!124551 m!189755))

(declare-fun m!189757 () Bool)

(assert (=> b!124551 m!189757))

(declare-fun m!189759 () Bool)

(assert (=> b!124555 m!189759))

(declare-fun m!189761 () Bool)

(assert (=> b!124556 m!189761))

(declare-fun m!189763 () Bool)

(assert (=> bm!1632 m!189763))

(assert (=> bm!1632 m!189763))

(assert (=> bm!1632 m!189763))

(assert (=> bm!1632 m!189763))

(declare-fun m!189765 () Bool)

(assert (=> bm!1632 m!189765))

(assert (=> b!124415 d!40558))

(assert (=> d!40502 d!40500))

(declare-fun d!40560 () Bool)

(assert (=> d!40560 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!40560 true))

(declare-fun _$14!265 () Unit!7712)

(assert (=> d!40560 (= (choose!11 thiss!1305) _$14!265)))

(declare-fun bs!9771 () Bool)

(assert (= bs!9771 d!40560))

(assert (=> bs!9771 m!189559))

(assert (=> d!40502 d!40560))

(declare-fun d!40562 () Bool)

(declare-fun e!81698 () Bool)

(assert (=> d!40562 e!81698))

(declare-fun res!103247 () Bool)

(assert (=> d!40562 (=> (not res!103247) (not e!81698))))

(declare-fun lt!196319 () (_ BitVec 64))

(declare-fun lt!196318 () BitStream!4442)

(assert (=> d!40562 (= res!103247 (= (bvadd lt!196319 (bvsub lt!196179 lt!196188)) (bitIndex!0 (size!2484 (buf!2930 lt!196318)) (currentByte!5636 lt!196318) (currentBit!5631 lt!196318))))))

(assert (=> d!40562 (or (not (= (bvand lt!196319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196179 lt!196188) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!196319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!196319 (bvsub lt!196179 lt!196188)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40562 (= lt!196319 (bitIndex!0 (size!2484 (buf!2930 (_2!5497 lt!196190))) (currentByte!5636 (_2!5497 lt!196190)) (currentBit!5631 (_2!5497 lt!196190))))))

(declare-datatypes ((tuple2!10478 0))(
  ( (tuple2!10479 (_1!5509 Unit!7712) (_2!5509 BitStream!4442)) )
))
(declare-fun moveBitIndex!0 (BitStream!4442 (_ BitVec 64)) tuple2!10478)

(assert (=> d!40562 (= lt!196318 (_2!5509 (moveBitIndex!0 (_2!5497 lt!196190) (bvsub lt!196179 lt!196188))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4442 (_ BitVec 64)) Bool)

(assert (=> d!40562 (moveBitIndexPrecond!0 (_2!5497 lt!196190) (bvsub lt!196179 lt!196188))))

(assert (=> d!40562 (= (withMovedBitIndex!0 (_2!5497 lt!196190) (bvsub lt!196179 lt!196188)) lt!196318)))

(declare-fun b!124559 () Bool)

(assert (=> b!124559 (= e!81698 (= (size!2484 (buf!2930 (_2!5497 lt!196190))) (size!2484 (buf!2930 lt!196318))))))

(assert (= (and d!40562 res!103247) b!124559))

(declare-fun m!189767 () Bool)

(assert (=> d!40562 m!189767))

(assert (=> d!40562 m!189733))

(declare-fun m!189769 () Bool)

(assert (=> d!40562 m!189769))

(declare-fun m!189771 () Bool)

(assert (=> d!40562 m!189771))

(assert (=> b!124414 d!40562))

(assert (=> b!124414 d!40498))

(assert (=> d!40468 d!40462))

(declare-fun d!40564 () Bool)

(assert (=> d!40564 (validate_offset_bits!1 ((_ sign_extend 32) (size!2484 (buf!2930 thiss!1305))) ((_ sign_extend 32) (currentByte!5636 thiss!1305)) ((_ sign_extend 32) (currentBit!5631 thiss!1305)) lt!195956)))

(assert (=> d!40564 true))

(declare-fun _$6!271 () Unit!7712)

(assert (=> d!40564 (= (choose!9 thiss!1305 (buf!2930 thiss!1305) lt!195956 (BitStream!4443 (buf!2930 thiss!1305) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305))) _$6!271)))

(declare-fun bs!9772 () Bool)

(assert (= bs!9772 d!40564))

(assert (=> bs!9772 m!189555))

(assert (=> d!40468 d!40564))

(declare-fun b!124560 () Bool)

(declare-fun res!103252 () Bool)

(declare-fun lt!196321 () (_ BitVec 32))

(assert (=> b!124560 (= res!103252 (= lt!196321 #b00000000000000000000000000000000))))

(declare-fun e!81699 () Bool)

(assert (=> b!124560 (=> res!103252 e!81699)))

(declare-fun e!81702 () Bool)

(assert (=> b!124560 (= e!81702 e!81699)))

(declare-fun d!40566 () Bool)

(declare-fun res!103251 () Bool)

(declare-fun e!81700 () Bool)

(assert (=> d!40566 (=> res!103251 e!81700)))

(assert (=> d!40566 (= res!103251 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305))))))

(assert (=> d!40566 (= (arrayBitRangesEq!0 (buf!2930 thiss!1305) (buf!2930 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305))) e!81700)))

(declare-fun lt!196320 () tuple4!96)

(declare-fun b!124561 () Bool)

(assert (=> b!124561 (= e!81699 (byteRangesEq!0 (select (arr!3077 (buf!2930 thiss!1305)) (_4!48 lt!196320)) (select (arr!3077 (buf!2930 thiss!1305)) (_4!48 lt!196320)) #b00000000000000000000000000000000 lt!196321))))

(declare-fun b!124562 () Bool)

(declare-fun e!81701 () Bool)

(assert (=> b!124562 (= e!81701 e!81702)))

(declare-fun res!103249 () Bool)

(declare-fun call!1636 () Bool)

(assert (=> b!124562 (= res!103249 call!1636)))

(assert (=> b!124562 (=> (not res!103249) (not e!81702))))

(declare-fun b!124563 () Bool)

(assert (=> b!124563 (= e!81701 call!1636)))

(declare-fun b!124564 () Bool)

(declare-fun e!81704 () Bool)

(assert (=> b!124564 (= e!81704 e!81701)))

(declare-fun c!7440 () Bool)

(assert (=> b!124564 (= c!7440 (= (_3!269 lt!196320) (_4!48 lt!196320)))))

(declare-fun b!124565 () Bool)

(assert (=> b!124565 (= e!81700 e!81704)))

(declare-fun res!103248 () Bool)

(assert (=> b!124565 (=> (not res!103248) (not e!81704))))

(declare-fun e!81703 () Bool)

(assert (=> b!124565 (= res!103248 e!81703)))

(declare-fun res!103250 () Bool)

(assert (=> b!124565 (=> res!103250 e!81703)))

(assert (=> b!124565 (= res!103250 (bvsge (_1!5508 lt!196320) (_2!5508 lt!196320)))))

(assert (=> b!124565 (= lt!196321 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!196322 () (_ BitVec 32))

(assert (=> b!124565 (= lt!196322 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!124565 (= lt!196320 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2484 (buf!2930 thiss!1305)) (currentByte!5636 thiss!1305) (currentBit!5631 thiss!1305))))))

(declare-fun b!124566 () Bool)

(assert (=> b!124566 (= e!81703 (arrayRangesEq!49 (buf!2930 thiss!1305) (buf!2930 thiss!1305) (_1!5508 lt!196320) (_2!5508 lt!196320)))))

(declare-fun bm!1633 () Bool)

(assert (=> bm!1633 (= call!1636 (byteRangesEq!0 (select (arr!3077 (buf!2930 thiss!1305)) (_3!269 lt!196320)) (select (arr!3077 (buf!2930 thiss!1305)) (_3!269 lt!196320)) lt!196322 (ite c!7440 lt!196321 #b00000000000000000000000000001000)))))

(assert (= (and d!40566 (not res!103251)) b!124565))

(assert (= (and b!124565 (not res!103250)) b!124566))

(assert (= (and b!124565 res!103248) b!124564))

(assert (= (and b!124564 c!7440) b!124563))

(assert (= (and b!124564 (not c!7440)) b!124562))

(assert (= (and b!124562 res!103249) b!124560))

(assert (= (and b!124560 (not res!103252)) b!124561))

(assert (= (or b!124563 b!124562) bm!1633))

(declare-fun m!189773 () Bool)

(assert (=> b!124561 m!189773))

(assert (=> b!124561 m!189773))

(assert (=> b!124561 m!189773))

(assert (=> b!124561 m!189773))

(declare-fun m!189775 () Bool)

(assert (=> b!124561 m!189775))

(assert (=> b!124565 m!189557))

(declare-fun m!189777 () Bool)

(assert (=> b!124565 m!189777))

(declare-fun m!189779 () Bool)

(assert (=> b!124566 m!189779))

(declare-fun m!189781 () Bool)

(assert (=> bm!1633 m!189781))

(assert (=> bm!1633 m!189781))

(assert (=> bm!1633 m!189781))

(assert (=> bm!1633 m!189781))

(declare-fun m!189783 () Bool)

(assert (=> bm!1633 m!189783))

(assert (=> b!124432 d!40566))

(assert (=> b!124432 d!40498))

(push 1)

(assert (not b!124500))

(assert (not d!40562))

(assert (not b!124565))

(assert (not b!124527))

(assert (not b!124533))

(assert (not d!40556))

(assert (not d!40564))

(assert (not b!124566))

(assert (not bm!1632))

(assert (not b!124526))

(assert (not b!124509))

(assert (not d!40548))

(assert (not bm!1633))

(assert (not b!124529))

(assert (not d!40560))

(assert (not b!124556))

(assert (not b!124555))

(assert (not b!124511))

(assert (not b!124508))

(assert (not d!40550))

(assert (not b!124551))

(assert (not b!124535))

(assert (not b!124528))

(assert (not b!124502))

(assert (not b!124505))

(assert (not b!124561))

(assert (not b!124503))

(assert (not b!124506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

