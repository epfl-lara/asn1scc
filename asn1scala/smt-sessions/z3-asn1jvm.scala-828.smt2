; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24424 () Bool)

(assert start!24424)

(declare-fun b!124319 () Bool)

(declare-fun e!81548 () Bool)

(declare-fun e!81551 () Bool)

(assert (=> b!124319 (= e!81548 (not e!81551))))

(declare-fun res!103055 () Bool)

(assert (=> b!124319 (=> (not res!103055) (not e!81551))))

(declare-fun lt!195934 () (_ BitVec 64))

(declare-fun lt!195935 () (_ BitVec 64))

(assert (=> b!124319 (= res!103055 (= lt!195934 (bvadd lt!195934 lt!195935)))))

(declare-datatypes ((array!5485 0))(
  ( (array!5486 (arr!3076 (Array (_ BitVec 32) (_ BitVec 8))) (size!2483 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4440 0))(
  ( (BitStream!4441 (buf!2929 array!5485) (currentByte!5635 (_ BitVec 32)) (currentBit!5630 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4440)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124319 (= lt!195934 (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4440 BitStream!4440) Bool)

(assert (=> b!124319 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7710 0))(
  ( (Unit!7711) )
))
(declare-fun lt!195939 () Unit!7710)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4440) Unit!7710)

(assert (=> b!124319 (= lt!195939 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-datatypes ((tuple2!10454 0))(
  ( (tuple2!10455 (_1!5495 BitStream!4440) (_2!5495 BitStream!4440)) )
))
(declare-fun lt!195938 () tuple2!10454)

(declare-datatypes ((tuple2!10456 0))(
  ( (tuple2!10457 (_1!5496 BitStream!4440) (_2!5496 (_ BitVec 64))) )
))
(declare-fun lt!195936 () tuple2!10456)

(declare-fun b!124320 () Bool)

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!124320 (= e!81551 (and (= (_2!5496 lt!195936) v!199) (= (_1!5496 lt!195936) (_2!5495 lt!195938))))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10456)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124320 (= lt!195936 (readNLeastSignificantBitsLoopPure!0 (_1!5495 lt!195938) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(declare-fun lt!195937 () Unit!7710)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4440 array!5485 (_ BitVec 64)) Unit!7710)

(assert (=> b!124320 (= lt!195937 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2929 thiss!1305) lt!195935))))

(declare-fun reader!0 (BitStream!4440 BitStream!4440) tuple2!10454)

(assert (=> b!124320 (= lt!195938 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124321 () Bool)

(declare-fun e!81549 () Bool)

(assert (=> b!124321 (= e!81549 e!81548)))

(declare-fun res!103056 () Bool)

(assert (=> b!124321 (=> (not res!103056) (not e!81548))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124321 (= res!103056 (validate_offset_bits!1 ((_ sign_extend 32) (size!2483 (buf!2929 thiss!1305))) ((_ sign_extend 32) (currentByte!5635 thiss!1305)) ((_ sign_extend 32) (currentBit!5630 thiss!1305)) lt!195935))))

(assert (=> b!124321 (= lt!195935 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!124322 () Bool)

(declare-fun res!103058 () Bool)

(assert (=> b!124322 (=> (not res!103058) (not e!81548))))

(assert (=> b!124322 (= res!103058 (bvsge i!615 nBits!396))))

(declare-fun b!124323 () Bool)

(declare-fun e!81550 () Bool)

(declare-fun array_inv!2285 (array!5485) Bool)

(assert (=> b!124323 (= e!81550 (array_inv!2285 (buf!2929 thiss!1305)))))

(declare-fun res!103057 () Bool)

(assert (=> start!24424 (=> (not res!103057) (not e!81549))))

(assert (=> start!24424 (= res!103057 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24424 e!81549))

(assert (=> start!24424 true))

(declare-fun inv!12 (BitStream!4440) Bool)

(assert (=> start!24424 (and (inv!12 thiss!1305) e!81550)))

(declare-fun b!124324 () Bool)

(declare-fun res!103059 () Bool)

(assert (=> b!124324 (=> (not res!103059) (not e!81548))))

(assert (=> b!124324 (= res!103059 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!24424 res!103057) b!124321))

(assert (= (and b!124321 res!103056) b!124324))

(assert (= (and b!124324 res!103059) b!124322))

(assert (= (and b!124322 res!103058) b!124319))

(assert (= (and b!124319 res!103055) b!124320))

(assert (= start!24424 b!124323))

(declare-fun m!189521 () Bool)

(assert (=> b!124319 m!189521))

(declare-fun m!189523 () Bool)

(assert (=> b!124319 m!189523))

(declare-fun m!189525 () Bool)

(assert (=> b!124319 m!189525))

(declare-fun m!189527 () Bool)

(assert (=> b!124324 m!189527))

(declare-fun m!189529 () Bool)

(assert (=> b!124321 m!189529))

(declare-fun m!189531 () Bool)

(assert (=> start!24424 m!189531))

(declare-fun m!189533 () Bool)

(assert (=> b!124320 m!189533))

(declare-fun m!189535 () Bool)

(assert (=> b!124320 m!189535))

(declare-fun m!189537 () Bool)

(assert (=> b!124320 m!189537))

(declare-fun m!189539 () Bool)

(assert (=> b!124320 m!189539))

(declare-fun m!189541 () Bool)

(assert (=> b!124323 m!189541))

(check-sat (not b!124324) (not start!24424) (not b!124320) (not b!124321) (not b!124323) (not b!124319))
(check-sat)
(get-model)

(declare-fun d!40438 () Bool)

(assert (=> d!40438 (= (array_inv!2285 (buf!2929 thiss!1305)) (bvsge (size!2483 (buf!2929 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!124323 d!40438))

(declare-fun d!40440 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!40440 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5630 thiss!1305) (currentByte!5635 thiss!1305) (size!2483 (buf!2929 thiss!1305))))))

(declare-fun bs!9743 () Bool)

(assert (= bs!9743 d!40440))

(declare-fun m!189565 () Bool)

(assert (=> bs!9743 m!189565))

(assert (=> start!24424 d!40440))

(declare-fun d!40442 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!40442 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2483 (buf!2929 thiss!1305))) ((_ sign_extend 32) (currentByte!5635 thiss!1305)) ((_ sign_extend 32) (currentBit!5630 thiss!1305)) lt!195935) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2483 (buf!2929 thiss!1305))) ((_ sign_extend 32) (currentByte!5635 thiss!1305)) ((_ sign_extend 32) (currentBit!5630 thiss!1305))) lt!195935))))

(declare-fun bs!9744 () Bool)

(assert (= bs!9744 d!40442))

(declare-fun m!189567 () Bool)

(assert (=> bs!9744 m!189567))

(assert (=> b!124321 d!40442))

(declare-datatypes ((tuple2!10462 0))(
  ( (tuple2!10463 (_1!5499 (_ BitVec 64)) (_2!5499 BitStream!4440)) )
))
(declare-fun lt!195960 () tuple2!10462)

(declare-fun d!40444 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10462)

(assert (=> d!40444 (= lt!195960 (readNLeastSignificantBitsLoop!0 (_1!5495 lt!195938) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!40444 (= (readNLeastSignificantBitsLoopPure!0 (_1!5495 lt!195938) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!10457 (_2!5499 lt!195960) (_1!5499 lt!195960)))))

(declare-fun bs!9745 () Bool)

(assert (= bs!9745 d!40444))

(declare-fun m!189569 () Bool)

(assert (=> bs!9745 m!189569))

(assert (=> b!124320 d!40444))

(declare-fun d!40446 () Bool)

(assert (=> d!40446 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!124320 d!40446))

(declare-fun d!40448 () Bool)

(assert (=> d!40448 (validate_offset_bits!1 ((_ sign_extend 32) (size!2483 (buf!2929 thiss!1305))) ((_ sign_extend 32) (currentByte!5635 thiss!1305)) ((_ sign_extend 32) (currentBit!5630 thiss!1305)) lt!195935)))

(declare-fun lt!195963 () Unit!7710)

(declare-fun choose!9 (BitStream!4440 array!5485 (_ BitVec 64) BitStream!4440) Unit!7710)

(assert (=> d!40448 (= lt!195963 (choose!9 thiss!1305 (buf!2929 thiss!1305) lt!195935 (BitStream!4441 (buf!2929 thiss!1305) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305))))))

(assert (=> d!40448 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2929 thiss!1305) lt!195935) lt!195963)))

(declare-fun bs!9746 () Bool)

(assert (= bs!9746 d!40448))

(assert (=> bs!9746 m!189529))

(declare-fun m!189571 () Bool)

(assert (=> bs!9746 m!189571))

(assert (=> b!124320 d!40448))

(declare-fun b!124353 () Bool)

(declare-fun e!81573 () Unit!7710)

(declare-fun Unit!7714 () Unit!7710)

(assert (=> b!124353 (= e!81573 Unit!7714)))

(declare-fun b!124354 () Bool)

(declare-fun res!103081 () Bool)

(declare-fun e!81572 () Bool)

(assert (=> b!124354 (=> (not res!103081) (not e!81572))))

(declare-fun lt!196019 () tuple2!10454)

(assert (=> b!124354 (= res!103081 (isPrefixOf!0 (_1!5495 lt!196019) thiss!1305))))

(declare-fun b!124355 () Bool)

(declare-fun res!103082 () Bool)

(assert (=> b!124355 (=> (not res!103082) (not e!81572))))

(assert (=> b!124355 (= res!103082 (isPrefixOf!0 (_2!5495 lt!196019) thiss!1305))))

(declare-fun d!40450 () Bool)

(assert (=> d!40450 e!81572))

(declare-fun res!103083 () Bool)

(assert (=> d!40450 (=> (not res!103083) (not e!81572))))

(assert (=> d!40450 (= res!103083 (isPrefixOf!0 (_1!5495 lt!196019) (_2!5495 lt!196019)))))

(declare-fun lt!196031 () BitStream!4440)

(assert (=> d!40450 (= lt!196019 (tuple2!10455 lt!196031 thiss!1305))))

(declare-fun lt!196021 () Unit!7710)

(declare-fun lt!196018 () Unit!7710)

(assert (=> d!40450 (= lt!196021 lt!196018)))

(assert (=> d!40450 (isPrefixOf!0 lt!196031 thiss!1305)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4440 BitStream!4440 BitStream!4440) Unit!7710)

(assert (=> d!40450 (= lt!196018 (lemmaIsPrefixTransitive!0 lt!196031 thiss!1305 thiss!1305))))

(declare-fun lt!196032 () Unit!7710)

(declare-fun lt!196024 () Unit!7710)

(assert (=> d!40450 (= lt!196032 lt!196024)))

(assert (=> d!40450 (isPrefixOf!0 lt!196031 thiss!1305)))

(assert (=> d!40450 (= lt!196024 (lemmaIsPrefixTransitive!0 lt!196031 thiss!1305 thiss!1305))))

(declare-fun lt!196025 () Unit!7710)

(assert (=> d!40450 (= lt!196025 e!81573)))

(declare-fun c!7420 () Bool)

(assert (=> d!40450 (= c!7420 (not (= (size!2483 (buf!2929 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!196017 () Unit!7710)

(declare-fun lt!196022 () Unit!7710)

(assert (=> d!40450 (= lt!196017 lt!196022)))

(assert (=> d!40450 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!40450 (= lt!196022 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!196033 () Unit!7710)

(declare-fun lt!196023 () Unit!7710)

(assert (=> d!40450 (= lt!196033 lt!196023)))

(assert (=> d!40450 (= lt!196023 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!196027 () Unit!7710)

(declare-fun lt!196028 () Unit!7710)

(assert (=> d!40450 (= lt!196027 lt!196028)))

(assert (=> d!40450 (isPrefixOf!0 lt!196031 lt!196031)))

(assert (=> d!40450 (= lt!196028 (lemmaIsPrefixRefl!0 lt!196031))))

(declare-fun lt!196030 () Unit!7710)

(declare-fun lt!196020 () Unit!7710)

(assert (=> d!40450 (= lt!196030 lt!196020)))

(assert (=> d!40450 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!40450 (= lt!196020 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!40450 (= lt!196031 (BitStream!4441 (buf!2929 thiss!1305) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305)))))

(assert (=> d!40450 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!40450 (= (reader!0 thiss!1305 thiss!1305) lt!196019)))

(declare-fun b!124356 () Bool)

(declare-fun lt!196029 () Unit!7710)

(assert (=> b!124356 (= e!81573 lt!196029)))

(declare-fun lt!196026 () (_ BitVec 64))

(assert (=> b!124356 (= lt!196026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!196034 () (_ BitVec 64))

(assert (=> b!124356 (= lt!196034 (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5485 array!5485 (_ BitVec 64) (_ BitVec 64)) Unit!7710)

(assert (=> b!124356 (= lt!196029 (arrayBitRangesEqSymmetric!0 (buf!2929 thiss!1305) (buf!2929 thiss!1305) lt!196026 lt!196034))))

(declare-fun arrayBitRangesEq!0 (array!5485 array!5485 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124356 (arrayBitRangesEq!0 (buf!2929 thiss!1305) (buf!2929 thiss!1305) lt!196026 lt!196034)))

(declare-fun lt!196016 () (_ BitVec 64))

(declare-fun b!124357 () Bool)

(declare-fun lt!196035 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4440 (_ BitVec 64)) BitStream!4440)

(assert (=> b!124357 (= e!81572 (= (_1!5495 lt!196019) (withMovedBitIndex!0 (_2!5495 lt!196019) (bvsub lt!196035 lt!196016))))))

(assert (=> b!124357 (or (= (bvand lt!196035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196016 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196035 lt!196016) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!124357 (= lt!196016 (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305)))))

(assert (=> b!124357 (= lt!196035 (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305)))))

(assert (= (and d!40450 c!7420) b!124356))

(assert (= (and d!40450 (not c!7420)) b!124353))

(assert (= (and d!40450 res!103083) b!124354))

(assert (= (and b!124354 res!103081) b!124355))

(assert (= (and b!124355 res!103082) b!124357))

(declare-fun m!189583 () Bool)

(assert (=> b!124357 m!189583))

(assert (=> b!124357 m!189521))

(assert (=> b!124357 m!189521))

(assert (=> d!40450 m!189523))

(declare-fun m!189585 () Bool)

(assert (=> d!40450 m!189585))

(assert (=> d!40450 m!189523))

(assert (=> d!40450 m!189525))

(assert (=> d!40450 m!189525))

(declare-fun m!189587 () Bool)

(assert (=> d!40450 m!189587))

(declare-fun m!189589 () Bool)

(assert (=> d!40450 m!189589))

(declare-fun m!189591 () Bool)

(assert (=> d!40450 m!189591))

(assert (=> d!40450 m!189523))

(declare-fun m!189593 () Bool)

(assert (=> d!40450 m!189593))

(assert (=> d!40450 m!189587))

(assert (=> b!124356 m!189521))

(declare-fun m!189595 () Bool)

(assert (=> b!124356 m!189595))

(declare-fun m!189597 () Bool)

(assert (=> b!124356 m!189597))

(declare-fun m!189599 () Bool)

(assert (=> b!124354 m!189599))

(declare-fun m!189601 () Bool)

(assert (=> b!124355 m!189601))

(assert (=> b!124320 d!40450))

(declare-fun d!40472 () Bool)

(assert (=> d!40472 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!124324 d!40472))

(declare-fun d!40474 () Bool)

(declare-fun e!81582 () Bool)

(assert (=> d!40474 e!81582))

(declare-fun res!103097 () Bool)

(assert (=> d!40474 (=> (not res!103097) (not e!81582))))

(declare-fun lt!196113 () (_ BitVec 64))

(declare-fun lt!196111 () (_ BitVec 64))

(declare-fun lt!196112 () (_ BitVec 64))

(assert (=> d!40474 (= res!103097 (= lt!196113 (bvsub lt!196112 lt!196111)))))

(assert (=> d!40474 (or (= (bvand lt!196112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196111 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!196112 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196112 lt!196111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40474 (= lt!196111 (remainingBits!0 ((_ sign_extend 32) (size!2483 (buf!2929 thiss!1305))) ((_ sign_extend 32) (currentByte!5635 thiss!1305)) ((_ sign_extend 32) (currentBit!5630 thiss!1305))))))

(declare-fun lt!196110 () (_ BitVec 64))

(declare-fun lt!196109 () (_ BitVec 64))

(assert (=> d!40474 (= lt!196112 (bvmul lt!196110 lt!196109))))

(assert (=> d!40474 (or (= lt!196110 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!196109 (bvsdiv (bvmul lt!196110 lt!196109) lt!196110)))))

(assert (=> d!40474 (= lt!196109 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40474 (= lt!196110 ((_ sign_extend 32) (size!2483 (buf!2929 thiss!1305))))))

(assert (=> d!40474 (= lt!196113 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5635 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5630 thiss!1305))))))

(assert (=> d!40474 (invariant!0 (currentBit!5630 thiss!1305) (currentByte!5635 thiss!1305) (size!2483 (buf!2929 thiss!1305)))))

(assert (=> d!40474 (= (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305)) lt!196113)))

(declare-fun b!124377 () Bool)

(declare-fun res!103098 () Bool)

(assert (=> b!124377 (=> (not res!103098) (not e!81582))))

(assert (=> b!124377 (= res!103098 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!196113))))

(declare-fun b!124378 () Bool)

(declare-fun lt!196108 () (_ BitVec 64))

(assert (=> b!124378 (= e!81582 (bvsle lt!196113 (bvmul lt!196108 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!124378 (or (= lt!196108 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!196108 #b0000000000000000000000000000000000000000000000000000000000001000) lt!196108)))))

(assert (=> b!124378 (= lt!196108 ((_ sign_extend 32) (size!2483 (buf!2929 thiss!1305))))))

(assert (= (and d!40474 res!103097) b!124377))

(assert (= (and b!124377 res!103098) b!124378))

(assert (=> d!40474 m!189567))

(assert (=> d!40474 m!189565))

(assert (=> b!124319 d!40474))

(declare-fun d!40478 () Bool)

(declare-fun res!103106 () Bool)

(declare-fun e!81587 () Bool)

(assert (=> d!40478 (=> (not res!103106) (not e!81587))))

(assert (=> d!40478 (= res!103106 (= (size!2483 (buf!2929 thiss!1305)) (size!2483 (buf!2929 thiss!1305))))))

(assert (=> d!40478 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!81587)))

(declare-fun b!124385 () Bool)

(declare-fun res!103105 () Bool)

(assert (=> b!124385 (=> (not res!103105) (not e!81587))))

(assert (=> b!124385 (= res!103105 (bvsle (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305)) (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305))))))

(declare-fun b!124386 () Bool)

(declare-fun e!81588 () Bool)

(assert (=> b!124386 (= e!81587 e!81588)))

(declare-fun res!103107 () Bool)

(assert (=> b!124386 (=> res!103107 e!81588)))

(assert (=> b!124386 (= res!103107 (= (size!2483 (buf!2929 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!124387 () Bool)

(assert (=> b!124387 (= e!81588 (arrayBitRangesEq!0 (buf!2929 thiss!1305) (buf!2929 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305))))))

(assert (= (and d!40478 res!103106) b!124385))

(assert (= (and b!124385 res!103105) b!124386))

(assert (= (and b!124386 (not res!103107)) b!124387))

(assert (=> b!124385 m!189521))

(assert (=> b!124385 m!189521))

(assert (=> b!124387 m!189521))

(assert (=> b!124387 m!189521))

(declare-fun m!189623 () Bool)

(assert (=> b!124387 m!189623))

(assert (=> b!124319 d!40478))

(declare-fun d!40480 () Bool)

(assert (=> d!40480 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!196128 () Unit!7710)

(declare-fun choose!11 (BitStream!4440) Unit!7710)

(assert (=> d!40480 (= lt!196128 (choose!11 thiss!1305))))

(assert (=> d!40480 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!196128)))

(declare-fun bs!9753 () Bool)

(assert (= bs!9753 d!40480))

(assert (=> bs!9753 m!189523))

(declare-fun m!189625 () Bool)

(assert (=> bs!9753 m!189625))

(assert (=> b!124319 d!40480))

(check-sat (not d!40450) (not d!40440) (not d!40442) (not d!40444) (not b!124357) (not b!124355) (not d!40474) (not b!124387) (not d!40448) (not b!124354) (not b!124385) (not d!40480) (not b!124356))
(check-sat)
(get-model)

(declare-fun d!40504 () Bool)

(assert (=> d!40504 (= (remainingBits!0 ((_ sign_extend 32) (size!2483 (buf!2929 thiss!1305))) ((_ sign_extend 32) (currentByte!5635 thiss!1305)) ((_ sign_extend 32) (currentBit!5630 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2483 (buf!2929 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5635 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5630 thiss!1305)))))))

(assert (=> d!40474 d!40504))

(declare-fun d!40506 () Bool)

(assert (=> d!40506 (= (invariant!0 (currentBit!5630 thiss!1305) (currentByte!5635 thiss!1305) (size!2483 (buf!2929 thiss!1305))) (and (bvsge (currentBit!5630 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5630 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5635 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5635 thiss!1305) (size!2483 (buf!2929 thiss!1305))) (and (= (currentBit!5630 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5635 thiss!1305) (size!2483 (buf!2929 thiss!1305)))))))))

(assert (=> d!40474 d!40506))

(assert (=> d!40440 d!40506))

(assert (=> d!40480 d!40478))

(declare-fun d!40508 () Bool)

(assert (=> d!40508 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!40508 true))

(declare-fun _$14!262 () Unit!7710)

(assert (=> d!40508 (= (choose!11 thiss!1305) _$14!262)))

(declare-fun bs!9762 () Bool)

(assert (= bs!9762 d!40508))

(assert (=> bs!9762 m!189523))

(assert (=> d!40480 d!40508))

(declare-fun b!124447 () Bool)

(declare-fun e!81621 () Bool)

(declare-fun e!81620 () Bool)

(assert (=> b!124447 (= e!81621 e!81620)))

(declare-fun res!103158 () Bool)

(assert (=> b!124447 (=> res!103158 e!81620)))

(assert (=> b!124447 (= res!103158 (bvsge i!615 nBits!396))))

(declare-fun b!124448 () Bool)

(declare-fun res!103161 () Bool)

(assert (=> b!124448 (=> (not res!103161) (not e!81621))))

(declare-fun lt!196238 () (_ BitVec 64))

(declare-fun lt!196241 () tuple2!10462)

(declare-fun lt!196237 () (_ BitVec 64))

(assert (=> b!124448 (= res!103161 (= (bvlshr (_1!5499 lt!196241) lt!196238) (bvlshr (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))) lt!196237)))))

(assert (=> b!124448 (and (bvsge lt!196237 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!196237 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!124448 (= lt!196237 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!124448 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!124448 (and (bvsge lt!196238 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!196238 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!124448 (= lt!196238 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!124448 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(declare-fun b!124450 () Bool)

(declare-fun res!103157 () Bool)

(assert (=> b!124450 (=> (not res!103157) (not e!81621))))

(declare-fun lt!196239 () (_ BitVec 64))

(declare-fun lt!196243 () (_ BitVec 64))

(assert (=> b!124450 (= res!103157 (= (bitIndex!0 (size!2483 (buf!2929 (_2!5499 lt!196241))) (currentByte!5635 (_2!5499 lt!196241)) (currentBit!5630 (_2!5499 lt!196241))) (bvadd lt!196243 lt!196239)))))

(assert (=> b!124450 (or (not (= (bvand lt!196243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!196239 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!196243 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!196243 lt!196239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!124450 (= lt!196239 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!124450 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!124450 (= lt!196243 (bitIndex!0 (size!2483 (buf!2929 (_1!5495 lt!195938))) (currentByte!5635 (_1!5495 lt!195938)) (currentBit!5630 (_1!5495 lt!195938))))))

(declare-fun e!81619 () tuple2!10462)

(declare-fun b!124451 () Bool)

(assert (=> b!124451 (= e!81619 (tuple2!10463 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))) (_1!5495 lt!195938)))))

(declare-fun b!124449 () Bool)

(declare-fun lt!196244 () tuple2!10462)

(assert (=> b!124449 (= e!81619 (tuple2!10463 (_1!5499 lt!196244) (_2!5499 lt!196244)))))

(declare-datatypes ((tuple2!10468 0))(
  ( (tuple2!10469 (_1!5502 Bool) (_2!5502 BitStream!4440)) )
))
(declare-fun lt!196240 () tuple2!10468)

(declare-fun readBit!0 (BitStream!4440) tuple2!10468)

(assert (=> b!124449 (= lt!196240 (readBit!0 (_1!5495 lt!195938)))))

(assert (=> b!124449 (= lt!196244 (readNLeastSignificantBitsLoop!0 (_2!5502 lt!196240) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))) (ite (_1!5502 lt!196240) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!40510 () Bool)

(assert (=> d!40510 e!81621))

(declare-fun res!103160 () Bool)

(assert (=> d!40510 (=> (not res!103160) (not e!81621))))

(assert (=> d!40510 (= res!103160 (= (buf!2929 (_2!5499 lt!196241)) (buf!2929 (_1!5495 lt!195938))))))

(assert (=> d!40510 (= lt!196241 e!81619)))

(declare-fun c!7429 () Bool)

(assert (=> d!40510 (= c!7429 (= nBits!396 i!615))))

(assert (=> d!40510 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!40510 (= (readNLeastSignificantBitsLoop!0 (_1!5495 lt!195938) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) lt!196241)))

(declare-fun b!124452 () Bool)

(declare-fun res!103159 () Bool)

(assert (=> b!124452 (=> (not res!103159) (not e!81621))))

(assert (=> b!124452 (= res!103159 (= (bvand (_1!5499 lt!196241) (onesLSBLong!0 nBits!396)) (_1!5499 lt!196241)))))

(declare-fun lt!196242 () (_ BitVec 64))

(declare-fun b!124453 () Bool)

(declare-datatypes ((tuple2!10470 0))(
  ( (tuple2!10471 (_1!5503 BitStream!4440) (_2!5503 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4440) tuple2!10470)

(assert (=> b!124453 (= e!81620 (= (= (bvand (bvlshr (_1!5499 lt!196241) lt!196242) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!5503 (readBitPure!0 (_1!5495 lt!195938)))))))

(assert (=> b!124453 (and (bvsge lt!196242 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!196242 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!196245 () (_ BitVec 32))

(assert (=> b!124453 (= lt!196242 ((_ sign_extend 32) (bvsub lt!196245 i!615)))))

(assert (=> b!124453 (or (= (bvand lt!196245 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!196245 #b10000000000000000000000000000000) (bvand (bvsub lt!196245 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!124453 (= lt!196245 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!124453 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(assert (= (and d!40510 c!7429) b!124451))

(assert (= (and d!40510 (not c!7429)) b!124449))

(assert (= (and d!40510 res!103160) b!124450))

(assert (= (and b!124450 res!103157) b!124448))

(assert (= (and b!124448 res!103161) b!124452))

(assert (= (and b!124452 res!103159) b!124447))

(assert (= (and b!124447 (not res!103158)) b!124453))

(declare-fun m!189661 () Bool)

(assert (=> b!124450 m!189661))

(declare-fun m!189663 () Bool)

(assert (=> b!124450 m!189663))

(declare-fun m!189665 () Bool)

(assert (=> b!124449 m!189665))

(declare-fun m!189667 () Bool)

(assert (=> b!124449 m!189667))

(assert (=> b!124452 m!189527))

(declare-fun m!189669 () Bool)

(assert (=> b!124453 m!189669))

(assert (=> d!40444 d!40510))

(assert (=> d!40450 d!40480))

(declare-fun d!40512 () Bool)

(declare-fun res!103163 () Bool)

(declare-fun e!81622 () Bool)

(assert (=> d!40512 (=> (not res!103163) (not e!81622))))

(assert (=> d!40512 (= res!103163 (= (size!2483 (buf!2929 lt!196031)) (size!2483 (buf!2929 lt!196031))))))

(assert (=> d!40512 (= (isPrefixOf!0 lt!196031 lt!196031) e!81622)))

(declare-fun b!124454 () Bool)

(declare-fun res!103162 () Bool)

(assert (=> b!124454 (=> (not res!103162) (not e!81622))))

(assert (=> b!124454 (= res!103162 (bvsle (bitIndex!0 (size!2483 (buf!2929 lt!196031)) (currentByte!5635 lt!196031) (currentBit!5630 lt!196031)) (bitIndex!0 (size!2483 (buf!2929 lt!196031)) (currentByte!5635 lt!196031) (currentBit!5630 lt!196031))))))

(declare-fun b!124455 () Bool)

(declare-fun e!81623 () Bool)

(assert (=> b!124455 (= e!81622 e!81623)))

(declare-fun res!103164 () Bool)

(assert (=> b!124455 (=> res!103164 e!81623)))

(assert (=> b!124455 (= res!103164 (= (size!2483 (buf!2929 lt!196031)) #b00000000000000000000000000000000))))

(declare-fun b!124456 () Bool)

(assert (=> b!124456 (= e!81623 (arrayBitRangesEq!0 (buf!2929 lt!196031) (buf!2929 lt!196031) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2483 (buf!2929 lt!196031)) (currentByte!5635 lt!196031) (currentBit!5630 lt!196031))))))

(assert (= (and d!40512 res!103163) b!124454))

(assert (= (and b!124454 res!103162) b!124455))

(assert (= (and b!124455 (not res!103164)) b!124456))

(declare-fun m!189671 () Bool)

(assert (=> b!124454 m!189671))

(assert (=> b!124454 m!189671))

(assert (=> b!124456 m!189671))

(assert (=> b!124456 m!189671))

(declare-fun m!189673 () Bool)

(assert (=> b!124456 m!189673))

(assert (=> d!40450 d!40512))

(assert (=> d!40450 d!40478))

(declare-fun d!40514 () Bool)

(declare-fun res!103166 () Bool)

(declare-fun e!81624 () Bool)

(assert (=> d!40514 (=> (not res!103166) (not e!81624))))

(assert (=> d!40514 (= res!103166 (= (size!2483 (buf!2929 lt!196031)) (size!2483 (buf!2929 thiss!1305))))))

(assert (=> d!40514 (= (isPrefixOf!0 lt!196031 thiss!1305) e!81624)))

(declare-fun b!124457 () Bool)

(declare-fun res!103165 () Bool)

(assert (=> b!124457 (=> (not res!103165) (not e!81624))))

(assert (=> b!124457 (= res!103165 (bvsle (bitIndex!0 (size!2483 (buf!2929 lt!196031)) (currentByte!5635 lt!196031) (currentBit!5630 lt!196031)) (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305))))))

(declare-fun b!124458 () Bool)

(declare-fun e!81625 () Bool)

(assert (=> b!124458 (= e!81624 e!81625)))

(declare-fun res!103167 () Bool)

(assert (=> b!124458 (=> res!103167 e!81625)))

(assert (=> b!124458 (= res!103167 (= (size!2483 (buf!2929 lt!196031)) #b00000000000000000000000000000000))))

(declare-fun b!124459 () Bool)

(assert (=> b!124459 (= e!81625 (arrayBitRangesEq!0 (buf!2929 lt!196031) (buf!2929 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2483 (buf!2929 lt!196031)) (currentByte!5635 lt!196031) (currentBit!5630 lt!196031))))))

(assert (= (and d!40514 res!103166) b!124457))

(assert (= (and b!124457 res!103165) b!124458))

(assert (= (and b!124458 (not res!103167)) b!124459))

(assert (=> b!124457 m!189671))

(assert (=> b!124457 m!189521))

(assert (=> b!124459 m!189671))

(assert (=> b!124459 m!189671))

(declare-fun m!189675 () Bool)

(assert (=> b!124459 m!189675))

(assert (=> d!40450 d!40514))

(declare-fun d!40516 () Bool)

(declare-fun res!103169 () Bool)

(declare-fun e!81626 () Bool)

(assert (=> d!40516 (=> (not res!103169) (not e!81626))))

(assert (=> d!40516 (= res!103169 (= (size!2483 (buf!2929 (_1!5495 lt!196019))) (size!2483 (buf!2929 (_2!5495 lt!196019)))))))

(assert (=> d!40516 (= (isPrefixOf!0 (_1!5495 lt!196019) (_2!5495 lt!196019)) e!81626)))

(declare-fun b!124460 () Bool)

(declare-fun res!103168 () Bool)

(assert (=> b!124460 (=> (not res!103168) (not e!81626))))

(assert (=> b!124460 (= res!103168 (bvsle (bitIndex!0 (size!2483 (buf!2929 (_1!5495 lt!196019))) (currentByte!5635 (_1!5495 lt!196019)) (currentBit!5630 (_1!5495 lt!196019))) (bitIndex!0 (size!2483 (buf!2929 (_2!5495 lt!196019))) (currentByte!5635 (_2!5495 lt!196019)) (currentBit!5630 (_2!5495 lt!196019)))))))

(declare-fun b!124461 () Bool)

(declare-fun e!81627 () Bool)

(assert (=> b!124461 (= e!81626 e!81627)))

(declare-fun res!103170 () Bool)

(assert (=> b!124461 (=> res!103170 e!81627)))

(assert (=> b!124461 (= res!103170 (= (size!2483 (buf!2929 (_1!5495 lt!196019))) #b00000000000000000000000000000000))))

(declare-fun b!124462 () Bool)

(assert (=> b!124462 (= e!81627 (arrayBitRangesEq!0 (buf!2929 (_1!5495 lt!196019)) (buf!2929 (_2!5495 lt!196019)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2483 (buf!2929 (_1!5495 lt!196019))) (currentByte!5635 (_1!5495 lt!196019)) (currentBit!5630 (_1!5495 lt!196019)))))))

(assert (= (and d!40516 res!103169) b!124460))

(assert (= (and b!124460 res!103168) b!124461))

(assert (= (and b!124461 (not res!103170)) b!124462))

(declare-fun m!189677 () Bool)

(assert (=> b!124460 m!189677))

(declare-fun m!189679 () Bool)

(assert (=> b!124460 m!189679))

(assert (=> b!124462 m!189677))

(assert (=> b!124462 m!189677))

(declare-fun m!189681 () Bool)

(assert (=> b!124462 m!189681))

(assert (=> d!40450 d!40516))

(declare-fun d!40518 () Bool)

(assert (=> d!40518 (isPrefixOf!0 lt!196031 lt!196031)))

(declare-fun lt!196246 () Unit!7710)

(assert (=> d!40518 (= lt!196246 (choose!11 lt!196031))))

(assert (=> d!40518 (= (lemmaIsPrefixRefl!0 lt!196031) lt!196246)))

(declare-fun bs!9763 () Bool)

(assert (= bs!9763 d!40518))

(assert (=> bs!9763 m!189589))

(declare-fun m!189683 () Bool)

(assert (=> bs!9763 m!189683))

(assert (=> d!40450 d!40518))

(declare-fun d!40520 () Bool)

(assert (=> d!40520 (isPrefixOf!0 lt!196031 thiss!1305)))

(declare-fun lt!196249 () Unit!7710)

(declare-fun choose!30 (BitStream!4440 BitStream!4440 BitStream!4440) Unit!7710)

(assert (=> d!40520 (= lt!196249 (choose!30 lt!196031 thiss!1305 thiss!1305))))

(assert (=> d!40520 (isPrefixOf!0 lt!196031 thiss!1305)))

(assert (=> d!40520 (= (lemmaIsPrefixTransitive!0 lt!196031 thiss!1305 thiss!1305) lt!196249)))

(declare-fun bs!9764 () Bool)

(assert (= bs!9764 d!40520))

(assert (=> bs!9764 m!189593))

(declare-fun m!189685 () Bool)

(assert (=> bs!9764 m!189685))

(assert (=> bs!9764 m!189593))

(assert (=> d!40450 d!40520))

(declare-fun d!40522 () Bool)

(declare-fun e!81630 () Bool)

(assert (=> d!40522 e!81630))

(declare-fun res!103173 () Bool)

(assert (=> d!40522 (=> (not res!103173) (not e!81630))))

(declare-fun lt!196254 () BitStream!4440)

(declare-fun lt!196255 () (_ BitVec 64))

(assert (=> d!40522 (= res!103173 (= (bvadd lt!196255 (bvsub lt!196035 lt!196016)) (bitIndex!0 (size!2483 (buf!2929 lt!196254)) (currentByte!5635 lt!196254) (currentBit!5630 lt!196254))))))

(assert (=> d!40522 (or (not (= (bvand lt!196255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!196035 lt!196016) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!196255 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!196255 (bvsub lt!196035 lt!196016)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40522 (= lt!196255 (bitIndex!0 (size!2483 (buf!2929 (_2!5495 lt!196019))) (currentByte!5635 (_2!5495 lt!196019)) (currentBit!5630 (_2!5495 lt!196019))))))

(declare-datatypes ((tuple2!10472 0))(
  ( (tuple2!10473 (_1!5504 Unit!7710) (_2!5504 BitStream!4440)) )
))
(declare-fun moveBitIndex!0 (BitStream!4440 (_ BitVec 64)) tuple2!10472)

(assert (=> d!40522 (= lt!196254 (_2!5504 (moveBitIndex!0 (_2!5495 lt!196019) (bvsub lt!196035 lt!196016))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4440 (_ BitVec 64)) Bool)

(assert (=> d!40522 (moveBitIndexPrecond!0 (_2!5495 lt!196019) (bvsub lt!196035 lt!196016))))

(assert (=> d!40522 (= (withMovedBitIndex!0 (_2!5495 lt!196019) (bvsub lt!196035 lt!196016)) lt!196254)))

(declare-fun b!124465 () Bool)

(assert (=> b!124465 (= e!81630 (= (size!2483 (buf!2929 (_2!5495 lt!196019))) (size!2483 (buf!2929 lt!196254))))))

(assert (= (and d!40522 res!103173) b!124465))

(declare-fun m!189687 () Bool)

(assert (=> d!40522 m!189687))

(assert (=> d!40522 m!189679))

(declare-fun m!189689 () Bool)

(assert (=> d!40522 m!189689))

(declare-fun m!189691 () Bool)

(assert (=> d!40522 m!189691))

(assert (=> b!124357 d!40522))

(assert (=> b!124357 d!40474))

(assert (=> d!40442 d!40504))

(assert (=> b!124356 d!40474))

(declare-fun d!40524 () Bool)

(assert (=> d!40524 (arrayBitRangesEq!0 (buf!2929 thiss!1305) (buf!2929 thiss!1305) lt!196026 lt!196034)))

(declare-fun lt!196258 () Unit!7710)

(declare-fun choose!8 (array!5485 array!5485 (_ BitVec 64) (_ BitVec 64)) Unit!7710)

(assert (=> d!40524 (= lt!196258 (choose!8 (buf!2929 thiss!1305) (buf!2929 thiss!1305) lt!196026 lt!196034))))

(assert (=> d!40524 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!196026) (bvsle lt!196026 lt!196034))))

(assert (=> d!40524 (= (arrayBitRangesEqSymmetric!0 (buf!2929 thiss!1305) (buf!2929 thiss!1305) lt!196026 lt!196034) lt!196258)))

(declare-fun bs!9765 () Bool)

(assert (= bs!9765 d!40524))

(assert (=> bs!9765 m!189597))

(declare-fun m!189693 () Bool)

(assert (=> bs!9765 m!189693))

(assert (=> b!124356 d!40524))

(declare-fun b!124480 () Bool)

(declare-fun e!81645 () Bool)

(declare-fun call!1631 () Bool)

(assert (=> b!124480 (= e!81645 call!1631)))

(declare-fun b!124481 () Bool)

(declare-fun res!103186 () Bool)

(declare-fun lt!196266 () (_ BitVec 32))

(assert (=> b!124481 (= res!103186 (= lt!196266 #b00000000000000000000000000000000))))

(assert (=> b!124481 (=> res!103186 e!81645)))

(declare-fun e!81646 () Bool)

(assert (=> b!124481 (= e!81646 e!81645)))

(declare-fun b!124482 () Bool)

(declare-fun e!81644 () Bool)

(declare-fun e!81647 () Bool)

(assert (=> b!124482 (= e!81644 e!81647)))

(declare-fun c!7432 () Bool)

(declare-datatypes ((tuple4!94 0))(
  ( (tuple4!95 (_1!5505 (_ BitVec 32)) (_2!5505 (_ BitVec 32)) (_3!268 (_ BitVec 32)) (_4!47 (_ BitVec 32))) )
))
(declare-fun lt!196267 () tuple4!94)

(assert (=> b!124482 (= c!7432 (= (_3!268 lt!196267) (_4!47 lt!196267)))))

(declare-fun b!124483 () Bool)

(declare-fun e!81643 () Bool)

(declare-fun arrayRangesEq!48 (array!5485 array!5485 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!124483 (= e!81643 (arrayRangesEq!48 (buf!2929 thiss!1305) (buf!2929 thiss!1305) (_1!5505 lt!196267) (_2!5505 lt!196267)))))

(declare-fun b!124484 () Bool)

(declare-fun e!81648 () Bool)

(assert (=> b!124484 (= e!81648 e!81644)))

(declare-fun res!103187 () Bool)

(assert (=> b!124484 (=> (not res!103187) (not e!81644))))

(assert (=> b!124484 (= res!103187 e!81643)))

(declare-fun res!103184 () Bool)

(assert (=> b!124484 (=> res!103184 e!81643)))

(assert (=> b!124484 (= res!103184 (bvsge (_1!5505 lt!196267) (_2!5505 lt!196267)))))

(assert (=> b!124484 (= lt!196266 ((_ extract 31 0) (bvsrem lt!196034 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!196265 () (_ BitVec 32))

(assert (=> b!124484 (= lt!196265 ((_ extract 31 0) (bvsrem lt!196026 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!94)

(assert (=> b!124484 (= lt!196267 (arrayBitIndices!0 lt!196026 lt!196034))))

(declare-fun b!124485 () Bool)

(assert (=> b!124485 (= e!81647 call!1631)))

(declare-fun d!40526 () Bool)

(declare-fun res!103185 () Bool)

(assert (=> d!40526 (=> res!103185 e!81648)))

(assert (=> d!40526 (= res!103185 (bvsge lt!196026 lt!196034))))

(assert (=> d!40526 (= (arrayBitRangesEq!0 (buf!2929 thiss!1305) (buf!2929 thiss!1305) lt!196026 lt!196034) e!81648)))

(declare-fun bm!1628 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1628 (= call!1631 (byteRangesEq!0 (ite c!7432 (select (arr!3076 (buf!2929 thiss!1305)) (_3!268 lt!196267)) (select (arr!3076 (buf!2929 thiss!1305)) (_4!47 lt!196267))) (ite c!7432 (select (arr!3076 (buf!2929 thiss!1305)) (_3!268 lt!196267)) (select (arr!3076 (buf!2929 thiss!1305)) (_4!47 lt!196267))) (ite c!7432 lt!196265 #b00000000000000000000000000000000) lt!196266))))

(declare-fun b!124486 () Bool)

(assert (=> b!124486 (= e!81647 e!81646)))

(declare-fun res!103188 () Bool)

(assert (=> b!124486 (= res!103188 (byteRangesEq!0 (select (arr!3076 (buf!2929 thiss!1305)) (_3!268 lt!196267)) (select (arr!3076 (buf!2929 thiss!1305)) (_3!268 lt!196267)) lt!196265 #b00000000000000000000000000001000))))

(assert (=> b!124486 (=> (not res!103188) (not e!81646))))

(assert (= (and d!40526 (not res!103185)) b!124484))

(assert (= (and b!124484 (not res!103184)) b!124483))

(assert (= (and b!124484 res!103187) b!124482))

(assert (= (and b!124482 c!7432) b!124485))

(assert (= (and b!124482 (not c!7432)) b!124486))

(assert (= (and b!124486 res!103188) b!124481))

(assert (= (and b!124481 (not res!103186)) b!124480))

(assert (= (or b!124485 b!124480) bm!1628))

(declare-fun m!189695 () Bool)

(assert (=> b!124483 m!189695))

(declare-fun m!189697 () Bool)

(assert (=> b!124484 m!189697))

(declare-fun m!189699 () Bool)

(assert (=> bm!1628 m!189699))

(declare-fun m!189701 () Bool)

(assert (=> bm!1628 m!189701))

(declare-fun m!189703 () Bool)

(assert (=> bm!1628 m!189703))

(assert (=> bm!1628 m!189699))

(assert (=> bm!1628 m!189703))

(assert (=> b!124486 m!189699))

(assert (=> b!124486 m!189699))

(assert (=> b!124486 m!189699))

(assert (=> b!124486 m!189699))

(declare-fun m!189705 () Bool)

(assert (=> b!124486 m!189705))

(assert (=> b!124356 d!40526))

(declare-fun b!124487 () Bool)

(declare-fun e!81651 () Bool)

(declare-fun call!1632 () Bool)

(assert (=> b!124487 (= e!81651 call!1632)))

(declare-fun b!124488 () Bool)

(declare-fun res!103191 () Bool)

(declare-fun lt!196269 () (_ BitVec 32))

(assert (=> b!124488 (= res!103191 (= lt!196269 #b00000000000000000000000000000000))))

(assert (=> b!124488 (=> res!103191 e!81651)))

(declare-fun e!81652 () Bool)

(assert (=> b!124488 (= e!81652 e!81651)))

(declare-fun b!124489 () Bool)

(declare-fun e!81650 () Bool)

(declare-fun e!81653 () Bool)

(assert (=> b!124489 (= e!81650 e!81653)))

(declare-fun c!7433 () Bool)

(declare-fun lt!196270 () tuple4!94)

(assert (=> b!124489 (= c!7433 (= (_3!268 lt!196270) (_4!47 lt!196270)))))

(declare-fun b!124490 () Bool)

(declare-fun e!81649 () Bool)

(assert (=> b!124490 (= e!81649 (arrayRangesEq!48 (buf!2929 thiss!1305) (buf!2929 thiss!1305) (_1!5505 lt!196270) (_2!5505 lt!196270)))))

(declare-fun b!124491 () Bool)

(declare-fun e!81654 () Bool)

(assert (=> b!124491 (= e!81654 e!81650)))

(declare-fun res!103192 () Bool)

(assert (=> b!124491 (=> (not res!103192) (not e!81650))))

(assert (=> b!124491 (= res!103192 e!81649)))

(declare-fun res!103189 () Bool)

(assert (=> b!124491 (=> res!103189 e!81649)))

(assert (=> b!124491 (= res!103189 (bvsge (_1!5505 lt!196270) (_2!5505 lt!196270)))))

(assert (=> b!124491 (= lt!196269 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!196268 () (_ BitVec 32))

(assert (=> b!124491 (= lt!196268 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!124491 (= lt!196270 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305))))))

(declare-fun b!124492 () Bool)

(assert (=> b!124492 (= e!81653 call!1632)))

(declare-fun d!40528 () Bool)

(declare-fun res!103190 () Bool)

(assert (=> d!40528 (=> res!103190 e!81654)))

(assert (=> d!40528 (= res!103190 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305))))))

(assert (=> d!40528 (= (arrayBitRangesEq!0 (buf!2929 thiss!1305) (buf!2929 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305))) e!81654)))

(declare-fun bm!1629 () Bool)

(assert (=> bm!1629 (= call!1632 (byteRangesEq!0 (ite c!7433 (select (arr!3076 (buf!2929 thiss!1305)) (_3!268 lt!196270)) (select (arr!3076 (buf!2929 thiss!1305)) (_4!47 lt!196270))) (ite c!7433 (select (arr!3076 (buf!2929 thiss!1305)) (_3!268 lt!196270)) (select (arr!3076 (buf!2929 thiss!1305)) (_4!47 lt!196270))) (ite c!7433 lt!196268 #b00000000000000000000000000000000) lt!196269))))

(declare-fun b!124493 () Bool)

(assert (=> b!124493 (= e!81653 e!81652)))

(declare-fun res!103193 () Bool)

(assert (=> b!124493 (= res!103193 (byteRangesEq!0 (select (arr!3076 (buf!2929 thiss!1305)) (_3!268 lt!196270)) (select (arr!3076 (buf!2929 thiss!1305)) (_3!268 lt!196270)) lt!196268 #b00000000000000000000000000001000))))

(assert (=> b!124493 (=> (not res!103193) (not e!81652))))

(assert (= (and d!40528 (not res!103190)) b!124491))

(assert (= (and b!124491 (not res!103189)) b!124490))

(assert (= (and b!124491 res!103192) b!124489))

(assert (= (and b!124489 c!7433) b!124492))

(assert (= (and b!124489 (not c!7433)) b!124493))

(assert (= (and b!124493 res!103193) b!124488))

(assert (= (and b!124488 (not res!103191)) b!124487))

(assert (= (or b!124492 b!124487) bm!1629))

(declare-fun m!189707 () Bool)

(assert (=> b!124490 m!189707))

(assert (=> b!124491 m!189521))

(declare-fun m!189709 () Bool)

(assert (=> b!124491 m!189709))

(declare-fun m!189711 () Bool)

(assert (=> bm!1629 m!189711))

(declare-fun m!189713 () Bool)

(assert (=> bm!1629 m!189713))

(declare-fun m!189715 () Bool)

(assert (=> bm!1629 m!189715))

(assert (=> bm!1629 m!189711))

(assert (=> bm!1629 m!189715))

(assert (=> b!124493 m!189711))

(assert (=> b!124493 m!189711))

(assert (=> b!124493 m!189711))

(assert (=> b!124493 m!189711))

(declare-fun m!189717 () Bool)

(assert (=> b!124493 m!189717))

(assert (=> b!124387 d!40528))

(assert (=> b!124387 d!40474))

(declare-fun d!40530 () Bool)

(declare-fun res!103195 () Bool)

(declare-fun e!81655 () Bool)

(assert (=> d!40530 (=> (not res!103195) (not e!81655))))

(assert (=> d!40530 (= res!103195 (= (size!2483 (buf!2929 (_2!5495 lt!196019))) (size!2483 (buf!2929 thiss!1305))))))

(assert (=> d!40530 (= (isPrefixOf!0 (_2!5495 lt!196019) thiss!1305) e!81655)))

(declare-fun b!124494 () Bool)

(declare-fun res!103194 () Bool)

(assert (=> b!124494 (=> (not res!103194) (not e!81655))))

(assert (=> b!124494 (= res!103194 (bvsle (bitIndex!0 (size!2483 (buf!2929 (_2!5495 lt!196019))) (currentByte!5635 (_2!5495 lt!196019)) (currentBit!5630 (_2!5495 lt!196019))) (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305))))))

(declare-fun b!124495 () Bool)

(declare-fun e!81656 () Bool)

(assert (=> b!124495 (= e!81655 e!81656)))

(declare-fun res!103196 () Bool)

(assert (=> b!124495 (=> res!103196 e!81656)))

(assert (=> b!124495 (= res!103196 (= (size!2483 (buf!2929 (_2!5495 lt!196019))) #b00000000000000000000000000000000))))

(declare-fun b!124496 () Bool)

(assert (=> b!124496 (= e!81656 (arrayBitRangesEq!0 (buf!2929 (_2!5495 lt!196019)) (buf!2929 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2483 (buf!2929 (_2!5495 lt!196019))) (currentByte!5635 (_2!5495 lt!196019)) (currentBit!5630 (_2!5495 lt!196019)))))))

(assert (= (and d!40530 res!103195) b!124494))

(assert (= (and b!124494 res!103194) b!124495))

(assert (= (and b!124495 (not res!103196)) b!124496))

(assert (=> b!124494 m!189679))

(assert (=> b!124494 m!189521))

(assert (=> b!124496 m!189679))

(assert (=> b!124496 m!189679))

(declare-fun m!189719 () Bool)

(assert (=> b!124496 m!189719))

(assert (=> b!124355 d!40530))

(assert (=> d!40448 d!40442))

(declare-fun d!40532 () Bool)

(assert (=> d!40532 (validate_offset_bits!1 ((_ sign_extend 32) (size!2483 (buf!2929 thiss!1305))) ((_ sign_extend 32) (currentByte!5635 thiss!1305)) ((_ sign_extend 32) (currentBit!5630 thiss!1305)) lt!195935)))

(assert (=> d!40532 true))

(declare-fun _$6!268 () Unit!7710)

(assert (=> d!40532 (= (choose!9 thiss!1305 (buf!2929 thiss!1305) lt!195935 (BitStream!4441 (buf!2929 thiss!1305) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305))) _$6!268)))

(declare-fun bs!9766 () Bool)

(assert (= bs!9766 d!40532))

(assert (=> bs!9766 m!189529))

(assert (=> d!40448 d!40532))

(declare-fun d!40534 () Bool)

(declare-fun res!103198 () Bool)

(declare-fun e!81657 () Bool)

(assert (=> d!40534 (=> (not res!103198) (not e!81657))))

(assert (=> d!40534 (= res!103198 (= (size!2483 (buf!2929 (_1!5495 lt!196019))) (size!2483 (buf!2929 thiss!1305))))))

(assert (=> d!40534 (= (isPrefixOf!0 (_1!5495 lt!196019) thiss!1305) e!81657)))

(declare-fun b!124497 () Bool)

(declare-fun res!103197 () Bool)

(assert (=> b!124497 (=> (not res!103197) (not e!81657))))

(assert (=> b!124497 (= res!103197 (bvsle (bitIndex!0 (size!2483 (buf!2929 (_1!5495 lt!196019))) (currentByte!5635 (_1!5495 lt!196019)) (currentBit!5630 (_1!5495 lt!196019))) (bitIndex!0 (size!2483 (buf!2929 thiss!1305)) (currentByte!5635 thiss!1305) (currentBit!5630 thiss!1305))))))

(declare-fun b!124498 () Bool)

(declare-fun e!81658 () Bool)

(assert (=> b!124498 (= e!81657 e!81658)))

(declare-fun res!103199 () Bool)

(assert (=> b!124498 (=> res!103199 e!81658)))

(assert (=> b!124498 (= res!103199 (= (size!2483 (buf!2929 (_1!5495 lt!196019))) #b00000000000000000000000000000000))))

(declare-fun b!124499 () Bool)

(assert (=> b!124499 (= e!81658 (arrayBitRangesEq!0 (buf!2929 (_1!5495 lt!196019)) (buf!2929 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2483 (buf!2929 (_1!5495 lt!196019))) (currentByte!5635 (_1!5495 lt!196019)) (currentBit!5630 (_1!5495 lt!196019)))))))

(assert (= (and d!40534 res!103198) b!124497))

(assert (= (and b!124497 res!103197) b!124498))

(assert (= (and b!124498 (not res!103199)) b!124499))

(assert (=> b!124497 m!189677))

(assert (=> b!124497 m!189521))

(assert (=> b!124499 m!189677))

(assert (=> b!124499 m!189677))

(declare-fun m!189721 () Bool)

(assert (=> b!124499 m!189721))

(assert (=> b!124354 d!40534))

(assert (=> b!124385 d!40474))

(check-sat (not b!124460) (not b!124450) (not d!40532) (not b!124462) (not b!124486) (not b!124452) (not b!124490) (not b!124494) (not b!124459) (not b!124493) (not d!40522) (not d!40524) (not d!40518) (not d!40508) (not b!124454) (not b!124449) (not b!124499) (not b!124457) (not b!124484) (not d!40520) (not b!124491) (not b!124453) (not bm!1628) (not b!124497) (not b!124483) (not b!124456) (not b!124496) (not bm!1629))
(check-sat)
