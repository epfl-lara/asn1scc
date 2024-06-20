; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43332 () Bool)

(assert start!43332)

(declare-fun res!171234 () Bool)

(declare-fun e!139944 () Bool)

(assert (=> start!43332 (=> (not res!171234) (not e!139944))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43332 (= res!171234 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43332 e!139944))

(assert (=> start!43332 true))

(declare-datatypes ((array!10334 0))(
  ( (array!10335 (arr!5473 (Array (_ BitVec 32) (_ BitVec 8))) (size!4543 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8194 0))(
  ( (BitStream!8195 (buf!5048 array!10334) (currentByte!9533 (_ BitVec 32)) (currentBit!9528 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8194)

(declare-fun e!139947 () Bool)

(declare-fun inv!12 (BitStream!8194) Bool)

(assert (=> start!43332 (and (inv!12 thiss!1204) e!139947)))

(declare-fun b!204347 () Bool)

(declare-fun res!171232 () Bool)

(assert (=> b!204347 (=> (not res!171232) (not e!139944))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204347 (= res!171232 (validate_offset_bits!1 ((_ sign_extend 32) (size!4543 (buf!5048 thiss!1204))) ((_ sign_extend 32) (currentByte!9533 thiss!1204)) ((_ sign_extend 32) (currentBit!9528 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!204348 () Bool)

(declare-fun array_inv!4284 (array!10334) Bool)

(assert (=> b!204348 (= e!139947 (array_inv!4284 (buf!5048 thiss!1204)))))

(declare-fun b!204349 () Bool)

(declare-fun e!139950 () Bool)

(assert (=> b!204349 (= e!139944 (not e!139950))))

(declare-fun res!171224 () Bool)

(assert (=> b!204349 (=> res!171224 e!139950)))

(declare-fun lt!319342 () (_ BitVec 64))

(declare-fun lt!319350 () (_ BitVec 64))

(assert (=> b!204349 (= res!171224 (not (= lt!319342 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319350))))))

(declare-datatypes ((Unit!14577 0))(
  ( (Unit!14578) )
))
(declare-datatypes ((tuple2!17480 0))(
  ( (tuple2!17481 (_1!9392 Unit!14577) (_2!9392 BitStream!8194)) )
))
(declare-fun lt!319343 () tuple2!17480)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204349 (= lt!319342 (bitIndex!0 (size!4543 (buf!5048 (_2!9392 lt!319343))) (currentByte!9533 (_2!9392 lt!319343)) (currentBit!9528 (_2!9392 lt!319343))))))

(assert (=> b!204349 (= lt!319350 (bitIndex!0 (size!4543 (buf!5048 thiss!1204)) (currentByte!9533 thiss!1204) (currentBit!9528 thiss!1204)))))

(declare-fun e!139943 () Bool)

(assert (=> b!204349 e!139943))

(declare-fun res!171231 () Bool)

(assert (=> b!204349 (=> (not res!171231) (not e!139943))))

(assert (=> b!204349 (= res!171231 (= (size!4543 (buf!5048 thiss!1204)) (size!4543 (buf!5048 (_2!9392 lt!319343)))))))

(declare-fun lt!319351 () Bool)

(declare-fun appendBit!0 (BitStream!8194 Bool) tuple2!17480)

(assert (=> b!204349 (= lt!319343 (appendBit!0 thiss!1204 lt!319351))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!204349 (= lt!319351 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!204350 () Bool)

(declare-fun res!171225 () Bool)

(declare-fun e!139948 () Bool)

(assert (=> b!204350 (=> res!171225 e!139948)))

(declare-fun lt!319347 () tuple2!17480)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!204350 (= res!171225 (not (invariant!0 (currentBit!9528 (_2!9392 lt!319347)) (currentByte!9533 (_2!9392 lt!319347)) (size!4543 (buf!5048 (_2!9392 lt!319347))))))))

(declare-fun b!204351 () Bool)

(declare-fun res!171228 () Bool)

(assert (=> b!204351 (=> res!171228 e!139948)))

(declare-fun isPrefixOf!0 (BitStream!8194 BitStream!8194) Bool)

(assert (=> b!204351 (= res!171228 (not (isPrefixOf!0 (_2!9392 lt!319343) (_2!9392 lt!319347))))))

(declare-fun b!204352 () Bool)

(declare-fun res!171236 () Bool)

(assert (=> b!204352 (=> (not res!171236) (not e!139944))))

(assert (=> b!204352 (= res!171236 (not (= i!590 nBits!348)))))

(declare-fun b!204353 () Bool)

(declare-fun e!139945 () Bool)

(declare-datatypes ((tuple2!17482 0))(
  ( (tuple2!17483 (_1!9393 BitStream!8194) (_2!9393 Bool)) )
))
(declare-fun lt!319352 () tuple2!17482)

(declare-fun lt!319346 () (_ BitVec 64))

(assert (=> b!204353 (= e!139945 (= (bitIndex!0 (size!4543 (buf!5048 (_1!9393 lt!319352))) (currentByte!9533 (_1!9393 lt!319352)) (currentBit!9528 (_1!9393 lt!319352))) lt!319346))))

(declare-fun b!204354 () Bool)

(assert (=> b!204354 (= e!139950 e!139948)))

(declare-fun res!171235 () Bool)

(assert (=> b!204354 (=> res!171235 e!139948)))

(declare-fun lt!319349 () (_ BitVec 64))

(assert (=> b!204354 (= res!171235 (not (= lt!319349 (bvsub (bvsub (bvadd lt!319342 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!204354 (= lt!319349 (bitIndex!0 (size!4543 (buf!5048 (_2!9392 lt!319347))) (currentByte!9533 (_2!9392 lt!319347)) (currentBit!9528 (_2!9392 lt!319347))))))

(assert (=> b!204354 (isPrefixOf!0 thiss!1204 (_2!9392 lt!319347))))

(declare-fun lt!319348 () Unit!14577)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8194 BitStream!8194 BitStream!8194) Unit!14577)

(assert (=> b!204354 (= lt!319348 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9392 lt!319343) (_2!9392 lt!319347)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8194 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17480)

(assert (=> b!204354 (= lt!319347 (appendBitsLSBFirstLoopTR!0 (_2!9392 lt!319343) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!204355 () Bool)

(assert (=> b!204355 (= e!139948 true)))

(declare-fun lt!319345 () Bool)

(assert (=> b!204355 (= lt!319345 (isPrefixOf!0 thiss!1204 (_2!9392 lt!319343)))))

(declare-fun b!204356 () Bool)

(declare-fun res!171229 () Bool)

(assert (=> b!204356 (=> res!171229 e!139948)))

(assert (=> b!204356 (= res!171229 (or (not (= (size!4543 (buf!5048 (_2!9392 lt!319347))) (size!4543 (buf!5048 thiss!1204)))) (not (= lt!319349 (bvsub (bvadd lt!319350 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!204357 () Bool)

(declare-fun e!139949 () Bool)

(assert (=> b!204357 (= e!139949 e!139945)))

(declare-fun res!171226 () Bool)

(assert (=> b!204357 (=> (not res!171226) (not e!139945))))

(assert (=> b!204357 (= res!171226 (and (= (_2!9393 lt!319352) lt!319351) (= (_1!9393 lt!319352) (_2!9392 lt!319343))))))

(declare-fun readBitPure!0 (BitStream!8194) tuple2!17482)

(declare-fun readerFrom!0 (BitStream!8194 (_ BitVec 32) (_ BitVec 32)) BitStream!8194)

(assert (=> b!204357 (= lt!319352 (readBitPure!0 (readerFrom!0 (_2!9392 lt!319343) (currentBit!9528 thiss!1204) (currentByte!9533 thiss!1204))))))

(declare-fun b!204358 () Bool)

(declare-fun res!171233 () Bool)

(assert (=> b!204358 (=> (not res!171233) (not e!139944))))

(assert (=> b!204358 (= res!171233 (invariant!0 (currentBit!9528 thiss!1204) (currentByte!9533 thiss!1204) (size!4543 (buf!5048 thiss!1204))))))

(declare-fun b!204359 () Bool)

(assert (=> b!204359 (= e!139943 e!139949)))

(declare-fun res!171230 () Bool)

(assert (=> b!204359 (=> (not res!171230) (not e!139949))))

(declare-fun lt!319344 () (_ BitVec 64))

(assert (=> b!204359 (= res!171230 (= lt!319346 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!319344)))))

(assert (=> b!204359 (= lt!319346 (bitIndex!0 (size!4543 (buf!5048 (_2!9392 lt!319343))) (currentByte!9533 (_2!9392 lt!319343)) (currentBit!9528 (_2!9392 lt!319343))))))

(assert (=> b!204359 (= lt!319344 (bitIndex!0 (size!4543 (buf!5048 thiss!1204)) (currentByte!9533 thiss!1204) (currentBit!9528 thiss!1204)))))

(declare-fun b!204360 () Bool)

(declare-fun res!171227 () Bool)

(assert (=> b!204360 (=> (not res!171227) (not e!139949))))

(assert (=> b!204360 (= res!171227 (isPrefixOf!0 thiss!1204 (_2!9392 lt!319343)))))

(assert (= (and start!43332 res!171234) b!204347))

(assert (= (and b!204347 res!171232) b!204358))

(assert (= (and b!204358 res!171233) b!204352))

(assert (= (and b!204352 res!171236) b!204349))

(assert (= (and b!204349 res!171231) b!204359))

(assert (= (and b!204359 res!171230) b!204360))

(assert (= (and b!204360 res!171227) b!204357))

(assert (= (and b!204357 res!171226) b!204353))

(assert (= (and b!204349 (not res!171224)) b!204354))

(assert (= (and b!204354 (not res!171235)) b!204350))

(assert (= (and b!204350 (not res!171225)) b!204356))

(assert (= (and b!204356 (not res!171229)) b!204351))

(assert (= (and b!204351 (not res!171228)) b!204355))

(assert (= start!43332 b!204348))

(declare-fun m!315495 () Bool)

(assert (=> b!204350 m!315495))

(declare-fun m!315497 () Bool)

(assert (=> b!204349 m!315497))

(declare-fun m!315499 () Bool)

(assert (=> b!204349 m!315499))

(declare-fun m!315501 () Bool)

(assert (=> b!204349 m!315501))

(declare-fun m!315503 () Bool)

(assert (=> b!204355 m!315503))

(declare-fun m!315505 () Bool)

(assert (=> b!204351 m!315505))

(declare-fun m!315507 () Bool)

(assert (=> b!204354 m!315507))

(declare-fun m!315509 () Bool)

(assert (=> b!204354 m!315509))

(declare-fun m!315511 () Bool)

(assert (=> b!204354 m!315511))

(declare-fun m!315513 () Bool)

(assert (=> b!204354 m!315513))

(assert (=> b!204360 m!315503))

(declare-fun m!315515 () Bool)

(assert (=> b!204358 m!315515))

(assert (=> b!204359 m!315497))

(assert (=> b!204359 m!315499))

(declare-fun m!315517 () Bool)

(assert (=> b!204347 m!315517))

(declare-fun m!315519 () Bool)

(assert (=> b!204348 m!315519))

(declare-fun m!315521 () Bool)

(assert (=> start!43332 m!315521))

(declare-fun m!315523 () Bool)

(assert (=> b!204357 m!315523))

(assert (=> b!204357 m!315523))

(declare-fun m!315525 () Bool)

(assert (=> b!204357 m!315525))

(declare-fun m!315527 () Bool)

(assert (=> b!204353 m!315527))

(push 1)

(assert (not start!43332))

(assert (not b!204354))

(assert (not b!204351))

(assert (not b!204359))

(assert (not b!204353))

(assert (not b!204348))

(assert (not b!204358))

(assert (not b!204360))

(assert (not b!204347))

(assert (not b!204350))

(assert (not b!204349))

(assert (not b!204355))

(assert (not b!204357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

