; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28780 () Bool)

(assert start!28780)

(declare-fun b!149492 () Bool)

(declare-fun res!125225 () Bool)

(declare-fun e!99807 () Bool)

(assert (=> b!149492 (=> (not res!125225) (not e!99807))))

(declare-datatypes ((array!6702 0))(
  ( (array!6703 (arr!3817 (Array (_ BitVec 32) (_ BitVec 8))) (size!3033 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5324 0))(
  ( (BitStream!5325 (buf!3508 array!6702) (currentByte!6422 (_ BitVec 32)) (currentBit!6417 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5324)

(declare-datatypes ((Unit!9457 0))(
  ( (Unit!9458) )
))
(declare-datatypes ((tuple2!13342 0))(
  ( (tuple2!13343 (_1!7035 Unit!9457) (_2!7035 BitStream!5324)) )
))
(declare-fun lt!233269 () tuple2!13342)

(declare-fun isPrefixOf!0 (BitStream!5324 BitStream!5324) Bool)

(assert (=> b!149492 (= res!125225 (isPrefixOf!0 thiss!1634 (_2!7035 lt!233269)))))

(declare-datatypes ((tuple2!13344 0))(
  ( (tuple2!13345 (_1!7036 BitStream!5324) (_2!7036 (_ BitVec 8))) )
))
(declare-fun lt!233271 () tuple2!13344)

(declare-fun arr!237 () array!6702)

(declare-fun b!149493 () Bool)

(declare-datatypes ((tuple2!13346 0))(
  ( (tuple2!13347 (_1!7037 BitStream!5324) (_2!7037 BitStream!5324)) )
))
(declare-fun lt!233253 () tuple2!13346)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!149493 (= e!99807 (and (= (_2!7036 lt!233271) (select (arr!3817 arr!237) from!447)) (= (_1!7036 lt!233271) (_2!7037 lt!233253))))))

(declare-fun readBytePure!0 (BitStream!5324) tuple2!13344)

(assert (=> b!149493 (= lt!233271 (readBytePure!0 (_1!7037 lt!233253)))))

(declare-fun reader!0 (BitStream!5324 BitStream!5324) tuple2!13346)

(assert (=> b!149493 (= lt!233253 (reader!0 thiss!1634 (_2!7035 lt!233269)))))

(declare-fun b!149494 () Bool)

(declare-fun e!99812 () Bool)

(declare-fun lt!233276 () tuple2!13344)

(declare-fun lt!233258 () tuple2!13344)

(assert (=> b!149494 (= e!99812 (= (_2!7036 lt!233276) (_2!7036 lt!233258)))))

(declare-fun b!149495 () Bool)

(declare-fun res!125223 () Bool)

(declare-fun e!99809 () Bool)

(assert (=> b!149495 (=> (not res!125223) (not e!99809))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149495 (= res!125223 (invariant!0 (currentBit!6417 thiss!1634) (currentByte!6422 thiss!1634) (size!3033 (buf!3508 thiss!1634))))))

(declare-fun b!149496 () Bool)

(declare-fun e!99810 () Bool)

(declare-fun e!99805 () Bool)

(assert (=> b!149496 (= e!99810 e!99805)))

(declare-fun res!125227 () Bool)

(assert (=> b!149496 (=> (not res!125227) (not e!99805))))

(declare-fun lt!233254 () tuple2!13342)

(declare-fun lt!233270 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!149496 (= res!125227 (= (bitIndex!0 (size!3033 (buf!3508 (_2!7035 lt!233254))) (currentByte!6422 (_2!7035 lt!233254)) (currentBit!6417 (_2!7035 lt!233254))) (bvadd (bitIndex!0 (size!3033 (buf!3508 (_2!7035 lt!233269))) (currentByte!6422 (_2!7035 lt!233269)) (currentBit!6417 (_2!7035 lt!233269))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!233270))))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!149496 (= lt!233270 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!149497 () Bool)

(declare-fun res!125229 () Bool)

(assert (=> b!149497 (=> (not res!125229) (not e!99809))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!149497 (= res!125229 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3033 (buf!3508 thiss!1634))) ((_ sign_extend 32) (currentByte!6422 thiss!1634)) ((_ sign_extend 32) (currentBit!6417 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!149498 () Bool)

(declare-fun e!99811 () Bool)

(assert (=> b!149498 (= e!99805 (not e!99811))))

(declare-fun res!125230 () Bool)

(assert (=> b!149498 (=> res!125230 e!99811)))

(declare-fun lt!233274 () tuple2!13346)

(declare-datatypes ((tuple2!13348 0))(
  ( (tuple2!13349 (_1!7038 BitStream!5324) (_2!7038 array!6702)) )
))
(declare-fun lt!233266 () tuple2!13348)

(assert (=> b!149498 (= res!125230 (or (not (= (size!3033 (_2!7038 lt!233266)) (size!3033 arr!237))) (not (= (_1!7038 lt!233266) (_2!7037 lt!233274)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5324 array!6702 (_ BitVec 32) (_ BitVec 32)) tuple2!13348)

(assert (=> b!149498 (= lt!233266 (readByteArrayLoopPure!0 (_1!7037 lt!233274) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149498 (validate_offset_bits!1 ((_ sign_extend 32) (size!3033 (buf!3508 (_2!7035 lt!233254)))) ((_ sign_extend 32) (currentByte!6422 (_2!7035 lt!233269))) ((_ sign_extend 32) (currentBit!6417 (_2!7035 lt!233269))) lt!233270)))

(declare-fun lt!233267 () Unit!9457)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5324 array!6702 (_ BitVec 64)) Unit!9457)

(assert (=> b!149498 (= lt!233267 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7035 lt!233269) (buf!3508 (_2!7035 lt!233254)) lt!233270))))

(assert (=> b!149498 (= lt!233274 (reader!0 (_2!7035 lt!233269) (_2!7035 lt!233254)))))

(declare-fun b!149499 () Bool)

(declare-fun arrayRangesEq!349 (array!6702 array!6702 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149499 (= e!99811 (not (arrayRangesEq!349 arr!237 (_2!7038 lt!233266) #b00000000000000000000000000000000 to!404)))))

(declare-fun res!125228 () Bool)

(assert (=> start!28780 (=> (not res!125228) (not e!99809))))

(assert (=> start!28780 (= res!125228 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3033 arr!237))))))

(assert (=> start!28780 e!99809))

(assert (=> start!28780 true))

(declare-fun array_inv!2822 (array!6702) Bool)

(assert (=> start!28780 (array_inv!2822 arr!237)))

(declare-fun e!99813 () Bool)

(declare-fun inv!12 (BitStream!5324) Bool)

(assert (=> start!28780 (and (inv!12 thiss!1634) e!99813)))

(declare-fun b!149500 () Bool)

(assert (=> b!149500 (= e!99813 (array_inv!2822 (buf!3508 thiss!1634)))))

(declare-fun b!149501 () Bool)

(declare-fun res!125233 () Bool)

(assert (=> b!149501 (=> (not res!125233) (not e!99809))))

(assert (=> b!149501 (= res!125233 (bvslt from!447 to!404))))

(declare-fun b!149502 () Bool)

(declare-fun e!99806 () Bool)

(assert (=> b!149502 (= e!99806 (invariant!0 (currentBit!6417 thiss!1634) (currentByte!6422 thiss!1634) (size!3033 (buf!3508 (_2!7035 lt!233269)))))))

(declare-fun b!149503 () Bool)

(declare-fun e!99808 () Bool)

(assert (=> b!149503 (= e!99809 (not e!99808))))

(declare-fun res!125224 () Bool)

(assert (=> b!149503 (=> res!125224 e!99808)))

(declare-fun lt!233256 () tuple2!13348)

(declare-fun lt!233252 () tuple2!13348)

(assert (=> b!149503 (= res!125224 (not (arrayRangesEq!349 (_2!7038 lt!233252) (_2!7038 lt!233256) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!233249 () tuple2!13348)

(assert (=> b!149503 (arrayRangesEq!349 (_2!7038 lt!233252) (_2!7038 lt!233249) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233251 () tuple2!13346)

(declare-fun lt!233265 () Unit!9457)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5324 array!6702 (_ BitVec 32) (_ BitVec 32)) Unit!9457)

(assert (=> b!149503 (= lt!233265 (readByteArrayLoopArrayPrefixLemma!0 (_1!7037 lt!233251) arr!237 from!447 to!404))))

(declare-fun lt!233259 () array!6702)

(declare-fun withMovedByteIndex!0 (BitStream!5324 (_ BitVec 32)) BitStream!5324)

(assert (=> b!149503 (= lt!233249 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7037 lt!233251) #b00000000000000000000000000000001) lt!233259 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!233263 () tuple2!13346)

(assert (=> b!149503 (= lt!233256 (readByteArrayLoopPure!0 (_1!7037 lt!233263) lt!233259 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!233261 () tuple2!13344)

(assert (=> b!149503 (= lt!233259 (array!6703 (store (arr!3817 arr!237) from!447 (_2!7036 lt!233261)) (size!3033 arr!237)))))

(declare-fun lt!233272 () (_ BitVec 32))

(assert (=> b!149503 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3033 (buf!3508 (_2!7035 lt!233254)))) ((_ sign_extend 32) (currentByte!6422 (_2!7035 lt!233269))) ((_ sign_extend 32) (currentBit!6417 (_2!7035 lt!233269))) lt!233272)))

(declare-fun lt!233262 () Unit!9457)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5324 array!6702 (_ BitVec 32)) Unit!9457)

(assert (=> b!149503 (= lt!233262 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7035 lt!233269) (buf!3508 (_2!7035 lt!233254)) lt!233272))))

(assert (=> b!149503 (= (_1!7038 lt!233252) (_2!7037 lt!233251))))

(assert (=> b!149503 (= lt!233252 (readByteArrayLoopPure!0 (_1!7037 lt!233251) arr!237 from!447 to!404))))

(assert (=> b!149503 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3033 (buf!3508 (_2!7035 lt!233254)))) ((_ sign_extend 32) (currentByte!6422 thiss!1634)) ((_ sign_extend 32) (currentBit!6417 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!233255 () Unit!9457)

(assert (=> b!149503 (= lt!233255 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3508 (_2!7035 lt!233254)) (bvsub to!404 from!447)))))

(assert (=> b!149503 (= (_2!7036 lt!233261) (select (arr!3817 arr!237) from!447))))

(assert (=> b!149503 (= lt!233261 (readBytePure!0 (_1!7037 lt!233251)))))

(assert (=> b!149503 (= lt!233263 (reader!0 (_2!7035 lt!233269) (_2!7035 lt!233254)))))

(assert (=> b!149503 (= lt!233251 (reader!0 thiss!1634 (_2!7035 lt!233254)))))

(assert (=> b!149503 e!99812))

(declare-fun res!125222 () Bool)

(assert (=> b!149503 (=> (not res!125222) (not e!99812))))

(assert (=> b!149503 (= res!125222 (= (bitIndex!0 (size!3033 (buf!3508 (_1!7036 lt!233276))) (currentByte!6422 (_1!7036 lt!233276)) (currentBit!6417 (_1!7036 lt!233276))) (bitIndex!0 (size!3033 (buf!3508 (_1!7036 lt!233258))) (currentByte!6422 (_1!7036 lt!233258)) (currentBit!6417 (_1!7036 lt!233258)))))))

(declare-fun lt!233257 () Unit!9457)

(declare-fun lt!233275 () BitStream!5324)

(declare-fun readBytePrefixLemma!0 (BitStream!5324 BitStream!5324) Unit!9457)

(assert (=> b!149503 (= lt!233257 (readBytePrefixLemma!0 lt!233275 (_2!7035 lt!233254)))))

(assert (=> b!149503 (= lt!233258 (readBytePure!0 (BitStream!5325 (buf!3508 (_2!7035 lt!233254)) (currentByte!6422 thiss!1634) (currentBit!6417 thiss!1634))))))

(assert (=> b!149503 (= lt!233276 (readBytePure!0 lt!233275))))

(assert (=> b!149503 (= lt!233275 (BitStream!5325 (buf!3508 (_2!7035 lt!233269)) (currentByte!6422 thiss!1634) (currentBit!6417 thiss!1634)))))

(assert (=> b!149503 e!99806))

(declare-fun res!125234 () Bool)

(assert (=> b!149503 (=> (not res!125234) (not e!99806))))

(assert (=> b!149503 (= res!125234 (isPrefixOf!0 thiss!1634 (_2!7035 lt!233254)))))

(declare-fun lt!233250 () Unit!9457)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5324 BitStream!5324 BitStream!5324) Unit!9457)

(assert (=> b!149503 (= lt!233250 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7035 lt!233269) (_2!7035 lt!233254)))))

(assert (=> b!149503 e!99810))

(declare-fun res!125232 () Bool)

(assert (=> b!149503 (=> (not res!125232) (not e!99810))))

(assert (=> b!149503 (= res!125232 (= (size!3033 (buf!3508 (_2!7035 lt!233269))) (size!3033 (buf!3508 (_2!7035 lt!233254)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5324 array!6702 (_ BitVec 32) (_ BitVec 32)) tuple2!13342)

(assert (=> b!149503 (= lt!233254 (appendByteArrayLoop!0 (_2!7035 lt!233269) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!149503 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3033 (buf!3508 (_2!7035 lt!233269)))) ((_ sign_extend 32) (currentByte!6422 (_2!7035 lt!233269))) ((_ sign_extend 32) (currentBit!6417 (_2!7035 lt!233269))) lt!233272)))

(assert (=> b!149503 (= lt!233272 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!233277 () Unit!9457)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5324 BitStream!5324 (_ BitVec 64) (_ BitVec 32)) Unit!9457)

(assert (=> b!149503 (= lt!233277 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7035 lt!233269) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!149503 e!99807))

(declare-fun res!125220 () Bool)

(assert (=> b!149503 (=> (not res!125220) (not e!99807))))

(assert (=> b!149503 (= res!125220 (= (size!3033 (buf!3508 thiss!1634)) (size!3033 (buf!3508 (_2!7035 lt!233269)))))))

(declare-fun appendByte!0 (BitStream!5324 (_ BitVec 8)) tuple2!13342)

(assert (=> b!149503 (= lt!233269 (appendByte!0 thiss!1634 (select (arr!3817 arr!237) from!447)))))

(declare-fun b!149504 () Bool)

(declare-fun e!99804 () Bool)

(declare-fun lt!233273 () (_ BitVec 64))

(assert (=> b!149504 (= e!99804 (or (= lt!233273 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!233273) lt!233273))))))

(assert (=> b!149504 (= lt!233273 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun lt!233260 () (_ BitVec 64))

(assert (=> b!149504 (= lt!233260 (bitIndex!0 (size!3033 (buf!3508 thiss!1634)) (currentByte!6422 thiss!1634) (currentBit!6417 thiss!1634)))))

(declare-fun b!149505 () Bool)

(declare-fun res!125231 () Bool)

(assert (=> b!149505 (=> (not res!125231) (not e!99807))))

(assert (=> b!149505 (= res!125231 (= (bitIndex!0 (size!3033 (buf!3508 (_2!7035 lt!233269))) (currentByte!6422 (_2!7035 lt!233269)) (currentBit!6417 (_2!7035 lt!233269))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3033 (buf!3508 thiss!1634)) (currentByte!6422 thiss!1634) (currentBit!6417 thiss!1634)))))))

(declare-fun b!149506 () Bool)

(declare-fun res!125226 () Bool)

(assert (=> b!149506 (=> (not res!125226) (not e!99805))))

(assert (=> b!149506 (= res!125226 (isPrefixOf!0 (_2!7035 lt!233269) (_2!7035 lt!233254)))))

(declare-fun b!149507 () Bool)

(assert (=> b!149507 (= e!99808 e!99804)))

(declare-fun res!125221 () Bool)

(assert (=> b!149507 (=> res!125221 e!99804)))

(assert (=> b!149507 (= res!125221 (not (= (size!3033 (buf!3508 thiss!1634)) (size!3033 (buf!3508 (_2!7035 lt!233254))))))))

(assert (=> b!149507 (arrayRangesEq!349 arr!237 (_2!7038 lt!233252) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233264 () Unit!9457)

(declare-fun arrayRangesEqTransitive!64 (array!6702 array!6702 array!6702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9457)

(assert (=> b!149507 (= lt!233264 (arrayRangesEqTransitive!64 arr!237 (_2!7038 lt!233256) (_2!7038 lt!233252) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!149507 (arrayRangesEq!349 (_2!7038 lt!233256) (_2!7038 lt!233252) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233268 () Unit!9457)

(declare-fun arrayRangesEqSymmetricLemma!81 (array!6702 array!6702 (_ BitVec 32) (_ BitVec 32)) Unit!9457)

(assert (=> b!149507 (= lt!233268 (arrayRangesEqSymmetricLemma!81 (_2!7038 lt!233252) (_2!7038 lt!233256) #b00000000000000000000000000000000 to!404))))

(assert (= (and start!28780 res!125228) b!149497))

(assert (= (and b!149497 res!125229) b!149501))

(assert (= (and b!149501 res!125233) b!149495))

(assert (= (and b!149495 res!125223) b!149503))

(assert (= (and b!149503 res!125220) b!149505))

(assert (= (and b!149505 res!125231) b!149492))

(assert (= (and b!149492 res!125225) b!149493))

(assert (= (and b!149503 res!125232) b!149496))

(assert (= (and b!149496 res!125227) b!149506))

(assert (= (and b!149506 res!125226) b!149498))

(assert (= (and b!149498 (not res!125230)) b!149499))

(assert (= (and b!149503 res!125234) b!149502))

(assert (= (and b!149503 res!125222) b!149494))

(assert (= (and b!149503 (not res!125224)) b!149507))

(assert (= (and b!149507 (not res!125221)) b!149504))

(assert (= start!28780 b!149500))

(declare-fun m!232623 () Bool)

(assert (=> start!28780 m!232623))

(declare-fun m!232625 () Bool)

(assert (=> start!28780 m!232625))

(declare-fun m!232627 () Bool)

(assert (=> b!149492 m!232627))

(declare-fun m!232629 () Bool)

(assert (=> b!149493 m!232629))

(declare-fun m!232631 () Bool)

(assert (=> b!149493 m!232631))

(declare-fun m!232633 () Bool)

(assert (=> b!149493 m!232633))

(declare-fun m!232635 () Bool)

(assert (=> b!149503 m!232635))

(declare-fun m!232637 () Bool)

(assert (=> b!149503 m!232637))

(declare-fun m!232639 () Bool)

(assert (=> b!149503 m!232639))

(declare-fun m!232641 () Bool)

(assert (=> b!149503 m!232641))

(declare-fun m!232643 () Bool)

(assert (=> b!149503 m!232643))

(declare-fun m!232645 () Bool)

(assert (=> b!149503 m!232645))

(declare-fun m!232647 () Bool)

(assert (=> b!149503 m!232647))

(assert (=> b!149503 m!232637))

(declare-fun m!232649 () Bool)

(assert (=> b!149503 m!232649))

(declare-fun m!232651 () Bool)

(assert (=> b!149503 m!232651))

(declare-fun m!232653 () Bool)

(assert (=> b!149503 m!232653))

(declare-fun m!232655 () Bool)

(assert (=> b!149503 m!232655))

(declare-fun m!232657 () Bool)

(assert (=> b!149503 m!232657))

(declare-fun m!232659 () Bool)

(assert (=> b!149503 m!232659))

(declare-fun m!232661 () Bool)

(assert (=> b!149503 m!232661))

(declare-fun m!232663 () Bool)

(assert (=> b!149503 m!232663))

(declare-fun m!232665 () Bool)

(assert (=> b!149503 m!232665))

(declare-fun m!232667 () Bool)

(assert (=> b!149503 m!232667))

(declare-fun m!232669 () Bool)

(assert (=> b!149503 m!232669))

(declare-fun m!232671 () Bool)

(assert (=> b!149503 m!232671))

(declare-fun m!232673 () Bool)

(assert (=> b!149503 m!232673))

(declare-fun m!232675 () Bool)

(assert (=> b!149503 m!232675))

(declare-fun m!232677 () Bool)

(assert (=> b!149503 m!232677))

(declare-fun m!232679 () Bool)

(assert (=> b!149503 m!232679))

(assert (=> b!149503 m!232629))

(declare-fun m!232681 () Bool)

(assert (=> b!149503 m!232681))

(declare-fun m!232683 () Bool)

(assert (=> b!149503 m!232683))

(declare-fun m!232685 () Bool)

(assert (=> b!149503 m!232685))

(assert (=> b!149503 m!232629))

(declare-fun m!232687 () Bool)

(assert (=> b!149507 m!232687))

(declare-fun m!232689 () Bool)

(assert (=> b!149507 m!232689))

(declare-fun m!232691 () Bool)

(assert (=> b!149507 m!232691))

(declare-fun m!232693 () Bool)

(assert (=> b!149507 m!232693))

(declare-fun m!232695 () Bool)

(assert (=> b!149496 m!232695))

(declare-fun m!232697 () Bool)

(assert (=> b!149496 m!232697))

(declare-fun m!232699 () Bool)

(assert (=> b!149497 m!232699))

(declare-fun m!232701 () Bool)

(assert (=> b!149504 m!232701))

(declare-fun m!232703 () Bool)

(assert (=> b!149500 m!232703))

(declare-fun m!232705 () Bool)

(assert (=> b!149495 m!232705))

(declare-fun m!232707 () Bool)

(assert (=> b!149506 m!232707))

(declare-fun m!232709 () Bool)

(assert (=> b!149498 m!232709))

(declare-fun m!232711 () Bool)

(assert (=> b!149498 m!232711))

(declare-fun m!232713 () Bool)

(assert (=> b!149498 m!232713))

(assert (=> b!149498 m!232677))

(assert (=> b!149505 m!232697))

(assert (=> b!149505 m!232701))

(declare-fun m!232715 () Bool)

(assert (=> b!149502 m!232715))

(declare-fun m!232717 () Bool)

(assert (=> b!149499 m!232717))

(push 1)

(assert (not b!149496))

(assert (not b!149497))

(assert (not b!149504))

(assert (not b!149498))

(assert (not b!149503))

(assert (not b!149493))

(assert (not b!149492))

(assert (not b!149495))

(assert (not b!149502))

(assert (not b!149505))

(assert (not b!149506))

(assert (not b!149499))

(assert (not b!149507))

(assert (not b!149500))

(assert (not start!28780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

