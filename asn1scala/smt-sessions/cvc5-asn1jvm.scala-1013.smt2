; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28782 () Bool)

(assert start!28782)

(declare-fun b!149540 () Bool)

(declare-fun e!99845 () Bool)

(declare-datatypes ((array!6704 0))(
  ( (array!6705 (arr!3818 (Array (_ BitVec 32) (_ BitVec 8))) (size!3034 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5326 0))(
  ( (BitStream!5327 (buf!3509 array!6704) (currentByte!6423 (_ BitVec 32)) (currentBit!6418 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13350 0))(
  ( (tuple2!13351 (_1!7039 BitStream!5326) (_2!7039 (_ BitVec 8))) )
))
(declare-fun lt!233344 () tuple2!13350)

(declare-fun lt!233366 () tuple2!13350)

(assert (=> b!149540 (= e!99845 (= (_2!7039 lt!233344) (_2!7039 lt!233366)))))

(declare-fun b!149541 () Bool)

(declare-fun res!125271 () Bool)

(declare-fun e!99847 () Bool)

(assert (=> b!149541 (=> (not res!125271) (not e!99847))))

(declare-datatypes ((Unit!9459 0))(
  ( (Unit!9460) )
))
(declare-datatypes ((tuple2!13352 0))(
  ( (tuple2!13353 (_1!7040 Unit!9459) (_2!7040 BitStream!5326)) )
))
(declare-fun lt!233347 () tuple2!13352)

(declare-fun lt!233352 () tuple2!13352)

(declare-fun isPrefixOf!0 (BitStream!5326 BitStream!5326) Bool)

(assert (=> b!149541 (= res!125271 (isPrefixOf!0 (_2!7040 lt!233347) (_2!7040 lt!233352)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!13354 0))(
  ( (tuple2!13355 (_1!7041 BitStream!5326) (_2!7041 array!6704)) )
))
(declare-fun lt!233355 () tuple2!13354)

(declare-fun arr!237 () array!6704)

(declare-fun b!149542 () Bool)

(declare-fun e!99848 () Bool)

(declare-fun arrayRangesEq!350 (array!6704 array!6704 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149542 (= e!99848 (not (arrayRangesEq!350 arr!237 (_2!7041 lt!233355) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!149543 () Bool)

(declare-fun e!99841 () Bool)

(declare-fun thiss!1634 () BitStream!5326)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!149543 (= e!99841 (invariant!0 (currentBit!6418 thiss!1634) (currentByte!6423 thiss!1634) (size!3034 (buf!3509 (_2!7040 lt!233347)))))))

(declare-fun b!149544 () Bool)

(declare-fun res!125272 () Bool)

(declare-fun e!99840 () Bool)

(assert (=> b!149544 (=> (not res!125272) (not e!99840))))

(assert (=> b!149544 (= res!125272 (isPrefixOf!0 thiss!1634 (_2!7040 lt!233347)))))

(declare-fun res!125276 () Bool)

(declare-fun e!99843 () Bool)

(assert (=> start!28782 (=> (not res!125276) (not e!99843))))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!28782 (= res!125276 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3034 arr!237))))))

(assert (=> start!28782 e!99843))

(assert (=> start!28782 true))

(declare-fun array_inv!2823 (array!6704) Bool)

(assert (=> start!28782 (array_inv!2823 arr!237)))

(declare-fun e!99842 () Bool)

(declare-fun inv!12 (BitStream!5326) Bool)

(assert (=> start!28782 (and (inv!12 thiss!1634) e!99842)))

(declare-fun b!149545 () Bool)

(declare-fun e!99844 () Bool)

(declare-fun e!99850 () Bool)

(assert (=> b!149545 (= e!99844 e!99850)))

(declare-fun res!125267 () Bool)

(assert (=> b!149545 (=> res!125267 e!99850)))

(assert (=> b!149545 (= res!125267 (not (= (size!3034 (buf!3509 thiss!1634)) (size!3034 (buf!3509 (_2!7040 lt!233352))))))))

(declare-fun lt!233362 () tuple2!13354)

(assert (=> b!149545 (arrayRangesEq!350 arr!237 (_2!7041 lt!233362) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233341 () Unit!9459)

(declare-fun lt!233367 () tuple2!13354)

(declare-fun arrayRangesEqTransitive!65 (array!6704 array!6704 array!6704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9459)

(assert (=> b!149545 (= lt!233341 (arrayRangesEqTransitive!65 arr!237 (_2!7041 lt!233367) (_2!7041 lt!233362) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!149545 (arrayRangesEq!350 (_2!7041 lt!233367) (_2!7041 lt!233362) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233356 () Unit!9459)

(declare-fun arrayRangesEqSymmetricLemma!82 (array!6704 array!6704 (_ BitVec 32) (_ BitVec 32)) Unit!9459)

(assert (=> b!149545 (= lt!233356 (arrayRangesEqSymmetricLemma!82 (_2!7041 lt!233362) (_2!7041 lt!233367) #b00000000000000000000000000000000 to!404))))

(declare-fun b!149546 () Bool)

(declare-fun res!125268 () Bool)

(assert (=> b!149546 (=> (not res!125268) (not e!99843))))

(assert (=> b!149546 (= res!125268 (invariant!0 (currentBit!6418 thiss!1634) (currentByte!6423 thiss!1634) (size!3034 (buf!3509 thiss!1634))))))

(declare-fun lt!233353 () (_ BitVec 64))

(declare-fun lt!233351 () (_ BitVec 64))

(declare-fun lt!233350 () (_ BitVec 64))

(declare-fun b!149547 () Bool)

(assert (=> b!149547 (= e!99850 (or (not (= lt!233351 (bvand lt!233353 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!233351 (bvand (bvadd lt!233350 lt!233353) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!149547 (= lt!233351 (bvand lt!233350 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!149547 (= lt!233353 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!149547 (= lt!233350 (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)))))

(declare-fun b!149548 () Bool)

(assert (=> b!149548 (= e!99843 (not e!99844))))

(declare-fun res!125275 () Bool)

(assert (=> b!149548 (=> res!125275 e!99844)))

(assert (=> b!149548 (= res!125275 (not (arrayRangesEq!350 (_2!7041 lt!233362) (_2!7041 lt!233367) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!233358 () tuple2!13354)

(assert (=> b!149548 (arrayRangesEq!350 (_2!7041 lt!233362) (_2!7041 lt!233358) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233346 () Unit!9459)

(declare-datatypes ((tuple2!13356 0))(
  ( (tuple2!13357 (_1!7042 BitStream!5326) (_2!7042 BitStream!5326)) )
))
(declare-fun lt!233343 () tuple2!13356)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5326 array!6704 (_ BitVec 32) (_ BitVec 32)) Unit!9459)

(assert (=> b!149548 (= lt!233346 (readByteArrayLoopArrayPrefixLemma!0 (_1!7042 lt!233343) arr!237 from!447 to!404))))

(declare-fun lt!233339 () array!6704)

(declare-fun readByteArrayLoopPure!0 (BitStream!5326 array!6704 (_ BitVec 32) (_ BitVec 32)) tuple2!13354)

(declare-fun withMovedByteIndex!0 (BitStream!5326 (_ BitVec 32)) BitStream!5326)

(assert (=> b!149548 (= lt!233358 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7042 lt!233343) #b00000000000000000000000000000001) lt!233339 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!233349 () tuple2!13356)

(assert (=> b!149548 (= lt!233367 (readByteArrayLoopPure!0 (_1!7042 lt!233349) lt!233339 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!233348 () tuple2!13350)

(assert (=> b!149548 (= lt!233339 (array!6705 (store (arr!3818 arr!237) from!447 (_2!7039 lt!233348)) (size!3034 arr!237)))))

(declare-fun lt!233364 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!149548 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347))) lt!233364)))

(declare-fun lt!233342 () Unit!9459)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5326 array!6704 (_ BitVec 32)) Unit!9459)

(assert (=> b!149548 (= lt!233342 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7040 lt!233347) (buf!3509 (_2!7040 lt!233352)) lt!233364))))

(assert (=> b!149548 (= (_1!7041 lt!233362) (_2!7042 lt!233343))))

(assert (=> b!149548 (= lt!233362 (readByteArrayLoopPure!0 (_1!7042 lt!233343) arr!237 from!447 to!404))))

(assert (=> b!149548 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 thiss!1634)) ((_ sign_extend 32) (currentBit!6418 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!233359 () Unit!9459)

(assert (=> b!149548 (= lt!233359 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3509 (_2!7040 lt!233352)) (bvsub to!404 from!447)))))

(assert (=> b!149548 (= (_2!7039 lt!233348) (select (arr!3818 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5326) tuple2!13350)

(assert (=> b!149548 (= lt!233348 (readBytePure!0 (_1!7042 lt!233343)))))

(declare-fun reader!0 (BitStream!5326 BitStream!5326) tuple2!13356)

(assert (=> b!149548 (= lt!233349 (reader!0 (_2!7040 lt!233347) (_2!7040 lt!233352)))))

(assert (=> b!149548 (= lt!233343 (reader!0 thiss!1634 (_2!7040 lt!233352)))))

(assert (=> b!149548 e!99845))

(declare-fun res!125279 () Bool)

(assert (=> b!149548 (=> (not res!125279) (not e!99845))))

(assert (=> b!149548 (= res!125279 (= (bitIndex!0 (size!3034 (buf!3509 (_1!7039 lt!233344))) (currentByte!6423 (_1!7039 lt!233344)) (currentBit!6418 (_1!7039 lt!233344))) (bitIndex!0 (size!3034 (buf!3509 (_1!7039 lt!233366))) (currentByte!6423 (_1!7039 lt!233366)) (currentBit!6418 (_1!7039 lt!233366)))))))

(declare-fun lt!233365 () Unit!9459)

(declare-fun lt!233357 () BitStream!5326)

(declare-fun readBytePrefixLemma!0 (BitStream!5326 BitStream!5326) Unit!9459)

(assert (=> b!149548 (= lt!233365 (readBytePrefixLemma!0 lt!233357 (_2!7040 lt!233352)))))

(assert (=> b!149548 (= lt!233366 (readBytePure!0 (BitStream!5327 (buf!3509 (_2!7040 lt!233352)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634))))))

(assert (=> b!149548 (= lt!233344 (readBytePure!0 lt!233357))))

(assert (=> b!149548 (= lt!233357 (BitStream!5327 (buf!3509 (_2!7040 lt!233347)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)))))

(assert (=> b!149548 e!99841))

(declare-fun res!125265 () Bool)

(assert (=> b!149548 (=> (not res!125265) (not e!99841))))

(assert (=> b!149548 (= res!125265 (isPrefixOf!0 thiss!1634 (_2!7040 lt!233352)))))

(declare-fun lt!233340 () Unit!9459)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5326 BitStream!5326 BitStream!5326) Unit!9459)

(assert (=> b!149548 (= lt!233340 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7040 lt!233347) (_2!7040 lt!233352)))))

(declare-fun e!99849 () Bool)

(assert (=> b!149548 e!99849))

(declare-fun res!125270 () Bool)

(assert (=> b!149548 (=> (not res!125270) (not e!99849))))

(assert (=> b!149548 (= res!125270 (= (size!3034 (buf!3509 (_2!7040 lt!233347))) (size!3034 (buf!3509 (_2!7040 lt!233352)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5326 array!6704 (_ BitVec 32) (_ BitVec 32)) tuple2!13352)

(assert (=> b!149548 (= lt!233352 (appendByteArrayLoop!0 (_2!7040 lt!233347) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!149548 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233347)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347))) lt!233364)))

(assert (=> b!149548 (= lt!233364 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!233345 () Unit!9459)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5326 BitStream!5326 (_ BitVec 64) (_ BitVec 32)) Unit!9459)

(assert (=> b!149548 (= lt!233345 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7040 lt!233347) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!149548 e!99840))

(declare-fun res!125274 () Bool)

(assert (=> b!149548 (=> (not res!125274) (not e!99840))))

(assert (=> b!149548 (= res!125274 (= (size!3034 (buf!3509 thiss!1634)) (size!3034 (buf!3509 (_2!7040 lt!233347)))))))

(declare-fun appendByte!0 (BitStream!5326 (_ BitVec 8)) tuple2!13352)

(assert (=> b!149548 (= lt!233347 (appendByte!0 thiss!1634 (select (arr!3818 arr!237) from!447)))))

(declare-fun b!149549 () Bool)

(assert (=> b!149549 (= e!99849 e!99847)))

(declare-fun res!125273 () Bool)

(assert (=> b!149549 (=> (not res!125273) (not e!99847))))

(declare-fun lt!233360 () (_ BitVec 64))

(assert (=> b!149549 (= res!125273 (= (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233352))) (currentByte!6423 (_2!7040 lt!233352)) (currentBit!6418 (_2!7040 lt!233352))) (bvadd (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233347))) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!233360))))))

(assert (=> b!149549 (= lt!233360 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!149550 () Bool)

(assert (=> b!149550 (= e!99842 (array_inv!2823 (buf!3509 thiss!1634)))))

(declare-fun b!149551 () Bool)

(declare-fun res!125266 () Bool)

(assert (=> b!149551 (=> (not res!125266) (not e!99843))))

(assert (=> b!149551 (= res!125266 (bvslt from!447 to!404))))

(declare-fun b!149552 () Bool)

(assert (=> b!149552 (= e!99847 (not e!99848))))

(declare-fun res!125277 () Bool)

(assert (=> b!149552 (=> res!125277 e!99848)))

(declare-fun lt!233338 () tuple2!13356)

(assert (=> b!149552 (= res!125277 (or (not (= (size!3034 (_2!7041 lt!233355)) (size!3034 arr!237))) (not (= (_1!7041 lt!233355) (_2!7042 lt!233338)))))))

(assert (=> b!149552 (= lt!233355 (readByteArrayLoopPure!0 (_1!7042 lt!233338) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149552 (validate_offset_bits!1 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347))) lt!233360)))

(declare-fun lt!233361 () Unit!9459)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5326 array!6704 (_ BitVec 64)) Unit!9459)

(assert (=> b!149552 (= lt!233361 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7040 lt!233347) (buf!3509 (_2!7040 lt!233352)) lt!233360))))

(assert (=> b!149552 (= lt!233338 (reader!0 (_2!7040 lt!233347) (_2!7040 lt!233352)))))

(declare-fun b!149553 () Bool)

(declare-fun res!125278 () Bool)

(assert (=> b!149553 (=> (not res!125278) (not e!99843))))

(assert (=> b!149553 (= res!125278 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3034 (buf!3509 thiss!1634))) ((_ sign_extend 32) (currentByte!6423 thiss!1634)) ((_ sign_extend 32) (currentBit!6418 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!149554 () Bool)

(declare-fun res!125269 () Bool)

(assert (=> b!149554 (=> (not res!125269) (not e!99840))))

(assert (=> b!149554 (= res!125269 (= (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233347))) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)))))))

(declare-fun lt!233354 () tuple2!13350)

(declare-fun b!149555 () Bool)

(declare-fun lt!233363 () tuple2!13356)

(assert (=> b!149555 (= e!99840 (and (= (_2!7039 lt!233354) (select (arr!3818 arr!237) from!447)) (= (_1!7039 lt!233354) (_2!7042 lt!233363))))))

(assert (=> b!149555 (= lt!233354 (readBytePure!0 (_1!7042 lt!233363)))))

(assert (=> b!149555 (= lt!233363 (reader!0 thiss!1634 (_2!7040 lt!233347)))))

(assert (= (and start!28782 res!125276) b!149553))

(assert (= (and b!149553 res!125278) b!149551))

(assert (= (and b!149551 res!125266) b!149546))

(assert (= (and b!149546 res!125268) b!149548))

(assert (= (and b!149548 res!125274) b!149554))

(assert (= (and b!149554 res!125269) b!149544))

(assert (= (and b!149544 res!125272) b!149555))

(assert (= (and b!149548 res!125270) b!149549))

(assert (= (and b!149549 res!125273) b!149541))

(assert (= (and b!149541 res!125271) b!149552))

(assert (= (and b!149552 (not res!125277)) b!149542))

(assert (= (and b!149548 res!125265) b!149543))

(assert (= (and b!149548 res!125279) b!149540))

(assert (= (and b!149548 (not res!125275)) b!149545))

(assert (= (and b!149545 (not res!125267)) b!149547))

(assert (= start!28782 b!149550))

(declare-fun m!232719 () Bool)

(assert (=> b!149553 m!232719))

(declare-fun m!232721 () Bool)

(assert (=> b!149546 m!232721))

(declare-fun m!232723 () Bool)

(assert (=> b!149554 m!232723))

(declare-fun m!232725 () Bool)

(assert (=> b!149554 m!232725))

(declare-fun m!232727 () Bool)

(assert (=> b!149555 m!232727))

(declare-fun m!232729 () Bool)

(assert (=> b!149555 m!232729))

(declare-fun m!232731 () Bool)

(assert (=> b!149555 m!232731))

(declare-fun m!232733 () Bool)

(assert (=> b!149545 m!232733))

(declare-fun m!232735 () Bool)

(assert (=> b!149545 m!232735))

(declare-fun m!232737 () Bool)

(assert (=> b!149545 m!232737))

(declare-fun m!232739 () Bool)

(assert (=> b!149545 m!232739))

(declare-fun m!232741 () Bool)

(assert (=> b!149552 m!232741))

(declare-fun m!232743 () Bool)

(assert (=> b!149552 m!232743))

(declare-fun m!232745 () Bool)

(assert (=> b!149552 m!232745))

(declare-fun m!232747 () Bool)

(assert (=> b!149552 m!232747))

(declare-fun m!232749 () Bool)

(assert (=> b!149550 m!232749))

(declare-fun m!232751 () Bool)

(assert (=> b!149543 m!232751))

(declare-fun m!232753 () Bool)

(assert (=> b!149544 m!232753))

(declare-fun m!232755 () Bool)

(assert (=> b!149549 m!232755))

(assert (=> b!149549 m!232723))

(declare-fun m!232757 () Bool)

(assert (=> start!28782 m!232757))

(declare-fun m!232759 () Bool)

(assert (=> start!28782 m!232759))

(declare-fun m!232761 () Bool)

(assert (=> b!149541 m!232761))

(declare-fun m!232763 () Bool)

(assert (=> b!149542 m!232763))

(assert (=> b!149547 m!232725))

(declare-fun m!232765 () Bool)

(assert (=> b!149548 m!232765))

(declare-fun m!232767 () Bool)

(assert (=> b!149548 m!232767))

(declare-fun m!232769 () Bool)

(assert (=> b!149548 m!232769))

(declare-fun m!232771 () Bool)

(assert (=> b!149548 m!232771))

(declare-fun m!232773 () Bool)

(assert (=> b!149548 m!232773))

(declare-fun m!232775 () Bool)

(assert (=> b!149548 m!232775))

(declare-fun m!232777 () Bool)

(assert (=> b!149548 m!232777))

(declare-fun m!232779 () Bool)

(assert (=> b!149548 m!232779))

(declare-fun m!232781 () Bool)

(assert (=> b!149548 m!232781))

(declare-fun m!232783 () Bool)

(assert (=> b!149548 m!232783))

(declare-fun m!232785 () Bool)

(assert (=> b!149548 m!232785))

(assert (=> b!149548 m!232727))

(declare-fun m!232787 () Bool)

(assert (=> b!149548 m!232787))

(declare-fun m!232789 () Bool)

(assert (=> b!149548 m!232789))

(declare-fun m!232791 () Bool)

(assert (=> b!149548 m!232791))

(declare-fun m!232793 () Bool)

(assert (=> b!149548 m!232793))

(declare-fun m!232795 () Bool)

(assert (=> b!149548 m!232795))

(declare-fun m!232797 () Bool)

(assert (=> b!149548 m!232797))

(declare-fun m!232799 () Bool)

(assert (=> b!149548 m!232799))

(assert (=> b!149548 m!232747))

(declare-fun m!232801 () Bool)

(assert (=> b!149548 m!232801))

(assert (=> b!149548 m!232771))

(declare-fun m!232803 () Bool)

(assert (=> b!149548 m!232803))

(declare-fun m!232805 () Bool)

(assert (=> b!149548 m!232805))

(declare-fun m!232807 () Bool)

(assert (=> b!149548 m!232807))

(declare-fun m!232809 () Bool)

(assert (=> b!149548 m!232809))

(declare-fun m!232811 () Bool)

(assert (=> b!149548 m!232811))

(assert (=> b!149548 m!232727))

(declare-fun m!232813 () Bool)

(assert (=> b!149548 m!232813))

(push 1)

(assert (not b!149542))

(assert (not b!149548))

(assert (not b!149543))

(assert (not b!149555))

(assert (not b!149550))

(assert (not b!149552))

(assert (not b!149545))

(assert (not b!149549))

(assert (not b!149554))

(assert (not b!149544))

(assert (not b!149553))

(assert (not b!149541))

(assert (not b!149547))

(assert (not b!149546))

(assert (not start!28782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!48565 () Bool)

(declare-fun e!99925 () Bool)

(assert (=> d!48565 e!99925))

(declare-fun res!125374 () Bool)

(assert (=> d!48565 (=> (not res!125374) (not e!99925))))

(declare-fun lt!233561 () (_ BitVec 64))

(declare-fun lt!233562 () (_ BitVec 64))

(declare-fun lt!233563 () (_ BitVec 64))

(assert (=> d!48565 (= res!125374 (= lt!233562 (bvsub lt!233563 lt!233561)))))

(assert (=> d!48565 (or (= (bvand lt!233563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233561 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233563 lt!233561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!48565 (= lt!233561 (remainingBits!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233352))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233352)))))))

(declare-fun lt!233565 () (_ BitVec 64))

(declare-fun lt!233560 () (_ BitVec 64))

(assert (=> d!48565 (= lt!233563 (bvmul lt!233565 lt!233560))))

(assert (=> d!48565 (or (= lt!233565 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!233560 (bvsdiv (bvmul lt!233565 lt!233560) lt!233565)))))

(assert (=> d!48565 (= lt!233560 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48565 (= lt!233565 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))))))

(assert (=> d!48565 (= lt!233562 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233352))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233352)))))))

(assert (=> d!48565 (invariant!0 (currentBit!6418 (_2!7040 lt!233352)) (currentByte!6423 (_2!7040 lt!233352)) (size!3034 (buf!3509 (_2!7040 lt!233352))))))

(assert (=> d!48565 (= (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233352))) (currentByte!6423 (_2!7040 lt!233352)) (currentBit!6418 (_2!7040 lt!233352))) lt!233562)))

(declare-fun b!149656 () Bool)

(declare-fun res!125375 () Bool)

(assert (=> b!149656 (=> (not res!125375) (not e!99925))))

(assert (=> b!149656 (= res!125375 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!233562))))

(declare-fun b!149657 () Bool)

(declare-fun lt!233564 () (_ BitVec 64))

(assert (=> b!149657 (= e!99925 (bvsle lt!233562 (bvmul lt!233564 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149657 (or (= lt!233564 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!233564 #b0000000000000000000000000000000000000000000000000000000000001000) lt!233564)))))

(assert (=> b!149657 (= lt!233564 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))))))

(assert (= (and d!48565 res!125374) b!149656))

(assert (= (and b!149656 res!125375) b!149657))

(declare-fun m!233007 () Bool)

(assert (=> d!48565 m!233007))

(declare-fun m!233009 () Bool)

(assert (=> d!48565 m!233009))

(assert (=> b!149549 d!48565))

(declare-fun d!48567 () Bool)

(declare-fun e!99926 () Bool)

(assert (=> d!48567 e!99926))

(declare-fun res!125376 () Bool)

(assert (=> d!48567 (=> (not res!125376) (not e!99926))))

(declare-fun lt!233568 () (_ BitVec 64))

(declare-fun lt!233567 () (_ BitVec 64))

(declare-fun lt!233569 () (_ BitVec 64))

(assert (=> d!48567 (= res!125376 (= lt!233568 (bvsub lt!233569 lt!233567)))))

(assert (=> d!48567 (or (= (bvand lt!233569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233567 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233569 lt!233567) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48567 (= lt!233567 (remainingBits!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233347)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347)))))))

(declare-fun lt!233571 () (_ BitVec 64))

(declare-fun lt!233566 () (_ BitVec 64))

(assert (=> d!48567 (= lt!233569 (bvmul lt!233571 lt!233566))))

(assert (=> d!48567 (or (= lt!233571 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!233566 (bvsdiv (bvmul lt!233571 lt!233566) lt!233571)))))

(assert (=> d!48567 (= lt!233566 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48567 (= lt!233571 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233347)))))))

(assert (=> d!48567 (= lt!233568 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347)))))))

(assert (=> d!48567 (invariant!0 (currentBit!6418 (_2!7040 lt!233347)) (currentByte!6423 (_2!7040 lt!233347)) (size!3034 (buf!3509 (_2!7040 lt!233347))))))

(assert (=> d!48567 (= (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233347))) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347))) lt!233568)))

(declare-fun b!149658 () Bool)

(declare-fun res!125377 () Bool)

(assert (=> b!149658 (=> (not res!125377) (not e!99926))))

(assert (=> b!149658 (= res!125377 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!233568))))

(declare-fun b!149659 () Bool)

(declare-fun lt!233570 () (_ BitVec 64))

(assert (=> b!149659 (= e!99926 (bvsle lt!233568 (bvmul lt!233570 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149659 (or (= lt!233570 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!233570 #b0000000000000000000000000000000000000000000000000000000000001000) lt!233570)))))

(assert (=> b!149659 (= lt!233570 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233347)))))))

(assert (= (and d!48567 res!125376) b!149658))

(assert (= (and b!149658 res!125377) b!149659))

(declare-fun m!233011 () Bool)

(assert (=> d!48567 m!233011))

(declare-fun m!233013 () Bool)

(assert (=> d!48567 m!233013))

(assert (=> b!149549 d!48567))

(declare-fun d!48569 () Bool)

(assert (=> d!48569 (= (array_inv!2823 (buf!3509 thiss!1634)) (bvsge (size!3034 (buf!3509 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!149550 d!48569))

(declare-fun d!48571 () Bool)

(declare-fun e!99927 () Bool)

(assert (=> d!48571 e!99927))

(declare-fun res!125378 () Bool)

(assert (=> d!48571 (=> (not res!125378) (not e!99927))))

(declare-fun lt!233573 () (_ BitVec 64))

(declare-fun lt!233575 () (_ BitVec 64))

(declare-fun lt!233574 () (_ BitVec 64))

(assert (=> d!48571 (= res!125378 (= lt!233574 (bvsub lt!233575 lt!233573)))))

(assert (=> d!48571 (or (= (bvand lt!233575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233573 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233575 lt!233573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48571 (= lt!233573 (remainingBits!0 ((_ sign_extend 32) (size!3034 (buf!3509 thiss!1634))) ((_ sign_extend 32) (currentByte!6423 thiss!1634)) ((_ sign_extend 32) (currentBit!6418 thiss!1634))))))

(declare-fun lt!233577 () (_ BitVec 64))

(declare-fun lt!233572 () (_ BitVec 64))

(assert (=> d!48571 (= lt!233575 (bvmul lt!233577 lt!233572))))

(assert (=> d!48571 (or (= lt!233577 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!233572 (bvsdiv (bvmul lt!233577 lt!233572) lt!233577)))))

(assert (=> d!48571 (= lt!233572 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48571 (= lt!233577 ((_ sign_extend 32) (size!3034 (buf!3509 thiss!1634))))))

(assert (=> d!48571 (= lt!233574 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6423 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6418 thiss!1634))))))

(assert (=> d!48571 (invariant!0 (currentBit!6418 thiss!1634) (currentByte!6423 thiss!1634) (size!3034 (buf!3509 thiss!1634)))))

(assert (=> d!48571 (= (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)) lt!233574)))

(declare-fun b!149660 () Bool)

(declare-fun res!125379 () Bool)

(assert (=> b!149660 (=> (not res!125379) (not e!99927))))

(assert (=> b!149660 (= res!125379 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!233574))))

(declare-fun b!149661 () Bool)

(declare-fun lt!233576 () (_ BitVec 64))

(assert (=> b!149661 (= e!99927 (bvsle lt!233574 (bvmul lt!233576 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149661 (or (= lt!233576 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!233576 #b0000000000000000000000000000000000000000000000000000000000001000) lt!233576)))))

(assert (=> b!149661 (= lt!233576 ((_ sign_extend 32) (size!3034 (buf!3509 thiss!1634))))))

(assert (= (and d!48571 res!125378) b!149660))

(assert (= (and b!149660 res!125379) b!149661))

(declare-fun m!233015 () Bool)

(assert (=> d!48571 m!233015))

(assert (=> d!48571 m!232721))

(assert (=> b!149547 d!48571))

(declare-fun d!48573 () Bool)

(assert (=> d!48573 (= (invariant!0 (currentBit!6418 thiss!1634) (currentByte!6423 thiss!1634) (size!3034 (buf!3509 thiss!1634))) (and (bvsge (currentBit!6418 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6418 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6423 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6423 thiss!1634) (size!3034 (buf!3509 thiss!1634))) (and (= (currentBit!6418 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6423 thiss!1634) (size!3034 (buf!3509 thiss!1634)))))))))

(assert (=> b!149546 d!48573))

(declare-fun d!48575 () Bool)

(declare-fun e!99928 () Bool)

(assert (=> d!48575 e!99928))

(declare-fun res!125380 () Bool)

(assert (=> d!48575 (=> (not res!125380) (not e!99928))))

(declare-fun lt!233580 () (_ BitVec 64))

(declare-fun lt!233581 () (_ BitVec 64))

(declare-fun lt!233579 () (_ BitVec 64))

(assert (=> d!48575 (= res!125380 (= lt!233580 (bvsub lt!233581 lt!233579)))))

(assert (=> d!48575 (or (= (bvand lt!233581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233581 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233581 lt!233579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48575 (= lt!233579 (remainingBits!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_1!7039 lt!233366)))) ((_ sign_extend 32) (currentByte!6423 (_1!7039 lt!233366))) ((_ sign_extend 32) (currentBit!6418 (_1!7039 lt!233366)))))))

(declare-fun lt!233583 () (_ BitVec 64))

(declare-fun lt!233578 () (_ BitVec 64))

(assert (=> d!48575 (= lt!233581 (bvmul lt!233583 lt!233578))))

(assert (=> d!48575 (or (= lt!233583 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!233578 (bvsdiv (bvmul lt!233583 lt!233578) lt!233583)))))

(assert (=> d!48575 (= lt!233578 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48575 (= lt!233583 ((_ sign_extend 32) (size!3034 (buf!3509 (_1!7039 lt!233366)))))))

(assert (=> d!48575 (= lt!233580 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6423 (_1!7039 lt!233366))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6418 (_1!7039 lt!233366)))))))

(assert (=> d!48575 (invariant!0 (currentBit!6418 (_1!7039 lt!233366)) (currentByte!6423 (_1!7039 lt!233366)) (size!3034 (buf!3509 (_1!7039 lt!233366))))))

(assert (=> d!48575 (= (bitIndex!0 (size!3034 (buf!3509 (_1!7039 lt!233366))) (currentByte!6423 (_1!7039 lt!233366)) (currentBit!6418 (_1!7039 lt!233366))) lt!233580)))

(declare-fun b!149662 () Bool)

(declare-fun res!125381 () Bool)

(assert (=> b!149662 (=> (not res!125381) (not e!99928))))

(assert (=> b!149662 (= res!125381 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!233580))))

(declare-fun b!149663 () Bool)

(declare-fun lt!233582 () (_ BitVec 64))

(assert (=> b!149663 (= e!99928 (bvsle lt!233580 (bvmul lt!233582 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149663 (or (= lt!233582 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!233582 #b0000000000000000000000000000000000000000000000000000000000001000) lt!233582)))))

(assert (=> b!149663 (= lt!233582 ((_ sign_extend 32) (size!3034 (buf!3509 (_1!7039 lt!233366)))))))

(assert (= (and d!48575 res!125380) b!149662))

(assert (= (and b!149662 res!125381) b!149663))

(declare-fun m!233017 () Bool)

(assert (=> d!48575 m!233017))

(declare-fun m!233019 () Bool)

(assert (=> d!48575 m!233019))

(assert (=> b!149548 d!48575))

(declare-fun d!48577 () Bool)

(assert (=> d!48577 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 thiss!1634)) ((_ sign_extend 32) (currentBit!6418 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 thiss!1634)) ((_ sign_extend 32) (currentBit!6418 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11860 () Bool)

(assert (= bs!11860 d!48577))

(declare-fun m!233021 () Bool)

(assert (=> bs!11860 m!233021))

(assert (=> b!149548 d!48577))

(declare-datatypes ((tuple3!582 0))(
  ( (tuple3!583 (_1!7051 Unit!9459) (_2!7051 BitStream!5326) (_3!364 array!6704)) )
))
(declare-fun lt!233586 () tuple3!582)

(declare-fun d!48579 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5326 array!6704 (_ BitVec 32) (_ BitVec 32)) tuple3!582)

(assert (=> d!48579 (= lt!233586 (readByteArrayLoop!0 (_1!7042 lt!233343) arr!237 from!447 to!404))))

(assert (=> d!48579 (= (readByteArrayLoopPure!0 (_1!7042 lt!233343) arr!237 from!447 to!404) (tuple2!13355 (_2!7051 lt!233586) (_3!364 lt!233586)))))

(declare-fun bs!11861 () Bool)

(assert (= bs!11861 d!48579))

(declare-fun m!233023 () Bool)

(assert (=> bs!11861 m!233023))

(assert (=> b!149548 d!48579))

(declare-fun d!48581 () Bool)

(declare-fun res!125386 () Bool)

(declare-fun e!99933 () Bool)

(assert (=> d!48581 (=> res!125386 e!99933)))

(assert (=> d!48581 (= res!125386 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48581 (= (arrayRangesEq!350 (_2!7041 lt!233362) (_2!7041 lt!233358) #b00000000000000000000000000000000 to!404) e!99933)))

(declare-fun b!149668 () Bool)

(declare-fun e!99934 () Bool)

(assert (=> b!149668 (= e!99933 e!99934)))

(declare-fun res!125387 () Bool)

(assert (=> b!149668 (=> (not res!125387) (not e!99934))))

(assert (=> b!149668 (= res!125387 (= (select (arr!3818 (_2!7041 lt!233362)) #b00000000000000000000000000000000) (select (arr!3818 (_2!7041 lt!233358)) #b00000000000000000000000000000000)))))

(declare-fun b!149669 () Bool)

(assert (=> b!149669 (= e!99934 (arrayRangesEq!350 (_2!7041 lt!233362) (_2!7041 lt!233358) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48581 (not res!125386)) b!149668))

(assert (= (and b!149668 res!125387) b!149669))

(declare-fun m!233025 () Bool)

(assert (=> b!149668 m!233025))

(declare-fun m!233027 () Bool)

(assert (=> b!149668 m!233027))

(declare-fun m!233029 () Bool)

(assert (=> b!149669 m!233029))

(assert (=> b!149548 d!48581))

(declare-fun d!48583 () Bool)

(declare-fun lt!233587 () tuple3!582)

(assert (=> d!48583 (= lt!233587 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!7042 lt!233343) #b00000000000000000000000000000001) lt!233339 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48583 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7042 lt!233343) #b00000000000000000000000000000001) lt!233339 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13355 (_2!7051 lt!233587) (_3!364 lt!233587)))))

(declare-fun bs!11862 () Bool)

(assert (= bs!11862 d!48583))

(assert (=> bs!11862 m!232771))

(declare-fun m!233031 () Bool)

(assert (=> bs!11862 m!233031))

(assert (=> b!149548 d!48583))

(declare-fun d!48585 () Bool)

(declare-fun e!99935 () Bool)

(assert (=> d!48585 e!99935))

(declare-fun res!125388 () Bool)

(assert (=> d!48585 (=> (not res!125388) (not e!99935))))

(declare-fun lt!233591 () (_ BitVec 64))

(declare-fun lt!233590 () (_ BitVec 64))

(declare-fun lt!233589 () (_ BitVec 64))

(assert (=> d!48585 (= res!125388 (= lt!233590 (bvsub lt!233591 lt!233589)))))

(assert (=> d!48585 (or (= (bvand lt!233591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233589 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233591 lt!233589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!48585 (= lt!233589 (remainingBits!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_1!7039 lt!233344)))) ((_ sign_extend 32) (currentByte!6423 (_1!7039 lt!233344))) ((_ sign_extend 32) (currentBit!6418 (_1!7039 lt!233344)))))))

(declare-fun lt!233593 () (_ BitVec 64))

(declare-fun lt!233588 () (_ BitVec 64))

(assert (=> d!48585 (= lt!233591 (bvmul lt!233593 lt!233588))))

(assert (=> d!48585 (or (= lt!233593 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!233588 (bvsdiv (bvmul lt!233593 lt!233588) lt!233593)))))

(assert (=> d!48585 (= lt!233588 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!48585 (= lt!233593 ((_ sign_extend 32) (size!3034 (buf!3509 (_1!7039 lt!233344)))))))

(assert (=> d!48585 (= lt!233590 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6423 (_1!7039 lt!233344))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6418 (_1!7039 lt!233344)))))))

(assert (=> d!48585 (invariant!0 (currentBit!6418 (_1!7039 lt!233344)) (currentByte!6423 (_1!7039 lt!233344)) (size!3034 (buf!3509 (_1!7039 lt!233344))))))

(assert (=> d!48585 (= (bitIndex!0 (size!3034 (buf!3509 (_1!7039 lt!233344))) (currentByte!6423 (_1!7039 lt!233344)) (currentBit!6418 (_1!7039 lt!233344))) lt!233590)))

(declare-fun b!149670 () Bool)

(declare-fun res!125389 () Bool)

(assert (=> b!149670 (=> (not res!125389) (not e!99935))))

(assert (=> b!149670 (= res!125389 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!233590))))

(declare-fun b!149671 () Bool)

(declare-fun lt!233592 () (_ BitVec 64))

(assert (=> b!149671 (= e!99935 (bvsle lt!233590 (bvmul lt!233592 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!149671 (or (= lt!233592 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!233592 #b0000000000000000000000000000000000000000000000000000000000001000) lt!233592)))))

(assert (=> b!149671 (= lt!233592 ((_ sign_extend 32) (size!3034 (buf!3509 (_1!7039 lt!233344)))))))

(assert (= (and d!48585 res!125388) b!149670))

(assert (= (and b!149670 res!125389) b!149671))

(declare-fun m!233033 () Bool)

(assert (=> d!48585 m!233033))

(declare-fun m!233035 () Bool)

(assert (=> d!48585 m!233035))

(assert (=> b!149548 d!48585))

(declare-fun d!48587 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5326 (_ BitVec 32)) tuple2!13352)

(assert (=> d!48587 (= (withMovedByteIndex!0 (_1!7042 lt!233343) #b00000000000000000000000000000001) (_2!7040 (moveByteIndex!0 (_1!7042 lt!233343) #b00000000000000000000000000000001)))))

(declare-fun bs!11863 () Bool)

(assert (= bs!11863 d!48587))

(declare-fun m!233037 () Bool)

(assert (=> bs!11863 m!233037))

(assert (=> b!149548 d!48587))

(declare-fun d!48589 () Bool)

(declare-fun lt!233594 () tuple3!582)

(assert (=> d!48589 (= lt!233594 (readByteArrayLoop!0 (_1!7042 lt!233349) lt!233339 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48589 (= (readByteArrayLoopPure!0 (_1!7042 lt!233349) lt!233339 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13355 (_2!7051 lt!233594) (_3!364 lt!233594)))))

(declare-fun bs!11864 () Bool)

(assert (= bs!11864 d!48589))

(declare-fun m!233039 () Bool)

(assert (=> bs!11864 m!233039))

(assert (=> b!149548 d!48589))

(declare-fun d!48591 () Bool)

(declare-datatypes ((tuple2!13374 0))(
  ( (tuple2!13375 (_1!7052 (_ BitVec 8)) (_2!7052 BitStream!5326)) )
))
(declare-fun lt!233597 () tuple2!13374)

(declare-fun readByte!0 (BitStream!5326) tuple2!13374)

(assert (=> d!48591 (= lt!233597 (readByte!0 lt!233357))))

(assert (=> d!48591 (= (readBytePure!0 lt!233357) (tuple2!13351 (_2!7052 lt!233597) (_1!7052 lt!233597)))))

(declare-fun bs!11865 () Bool)

(assert (= bs!11865 d!48591))

(declare-fun m!233041 () Bool)

(assert (=> bs!11865 m!233041))

(assert (=> b!149548 d!48591))

(declare-fun d!48593 () Bool)

(assert (=> d!48593 (isPrefixOf!0 thiss!1634 (_2!7040 lt!233352))))

(declare-fun lt!233600 () Unit!9459)

(declare-fun choose!30 (BitStream!5326 BitStream!5326 BitStream!5326) Unit!9459)

(assert (=> d!48593 (= lt!233600 (choose!30 thiss!1634 (_2!7040 lt!233347) (_2!7040 lt!233352)))))

(assert (=> d!48593 (isPrefixOf!0 thiss!1634 (_2!7040 lt!233347))))

(assert (=> d!48593 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7040 lt!233347) (_2!7040 lt!233352)) lt!233600)))

(declare-fun bs!11866 () Bool)

(assert (= bs!11866 d!48593))

(assert (=> bs!11866 m!232791))

(declare-fun m!233043 () Bool)

(assert (=> bs!11866 m!233043))

(assert (=> bs!11866 m!232753))

(assert (=> b!149548 d!48593))

(declare-fun d!48595 () Bool)

(assert (=> d!48595 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347))) lt!233364)))

(declare-fun lt!233603 () Unit!9459)

(declare-fun choose!26 (BitStream!5326 array!6704 (_ BitVec 32) BitStream!5326) Unit!9459)

(assert (=> d!48595 (= lt!233603 (choose!26 (_2!7040 lt!233347) (buf!3509 (_2!7040 lt!233352)) lt!233364 (BitStream!5327 (buf!3509 (_2!7040 lt!233352)) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347)))))))

(assert (=> d!48595 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7040 lt!233347) (buf!3509 (_2!7040 lt!233352)) lt!233364) lt!233603)))

(declare-fun bs!11867 () Bool)

(assert (= bs!11867 d!48595))

(assert (=> bs!11867 m!232767))

(declare-fun m!233045 () Bool)

(assert (=> bs!11867 m!233045))

(assert (=> b!149548 d!48595))

(declare-fun b!149682 () Bool)

(declare-fun res!125396 () Bool)

(declare-fun e!99941 () Bool)

(assert (=> b!149682 (=> (not res!125396) (not e!99941))))

(declare-fun lt!233660 () tuple2!13356)

(assert (=> b!149682 (= res!125396 (isPrefixOf!0 (_1!7042 lt!233660) thiss!1634))))

(declare-fun b!149683 () Bool)

(declare-fun res!125398 () Bool)

(assert (=> b!149683 (=> (not res!125398) (not e!99941))))

(assert (=> b!149683 (= res!125398 (isPrefixOf!0 (_2!7042 lt!233660) (_2!7040 lt!233352)))))

(declare-fun lt!233648 () (_ BitVec 64))

(declare-fun b!149684 () Bool)

(declare-fun lt!233650 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5326 (_ BitVec 64)) BitStream!5326)

(assert (=> b!149684 (= e!99941 (= (_1!7042 lt!233660) (withMovedBitIndex!0 (_2!7042 lt!233660) (bvsub lt!233648 lt!233650))))))

(assert (=> b!149684 (or (= (bvand lt!233648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233650 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233648 lt!233650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149684 (= lt!233650 (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233352))) (currentByte!6423 (_2!7040 lt!233352)) (currentBit!6418 (_2!7040 lt!233352))))))

(assert (=> b!149684 (= lt!233648 (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)))))

(declare-fun b!149685 () Bool)

(declare-fun e!99940 () Unit!9459)

(declare-fun Unit!9465 () Unit!9459)

(assert (=> b!149685 (= e!99940 Unit!9465)))

(declare-fun b!149686 () Bool)

(declare-fun lt!233655 () Unit!9459)

(assert (=> b!149686 (= e!99940 lt!233655)))

(declare-fun lt!233653 () (_ BitVec 64))

(assert (=> b!149686 (= lt!233653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!233651 () (_ BitVec 64))

(assert (=> b!149686 (= lt!233651 (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6704 array!6704 (_ BitVec 64) (_ BitVec 64)) Unit!9459)

(assert (=> b!149686 (= lt!233655 (arrayBitRangesEqSymmetric!0 (buf!3509 thiss!1634) (buf!3509 (_2!7040 lt!233352)) lt!233653 lt!233651))))

(declare-fun arrayBitRangesEq!0 (array!6704 array!6704 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!149686 (arrayBitRangesEq!0 (buf!3509 (_2!7040 lt!233352)) (buf!3509 thiss!1634) lt!233653 lt!233651)))

(declare-fun d!48597 () Bool)

(assert (=> d!48597 e!99941))

(declare-fun res!125397 () Bool)

(assert (=> d!48597 (=> (not res!125397) (not e!99941))))

(assert (=> d!48597 (= res!125397 (isPrefixOf!0 (_1!7042 lt!233660) (_2!7042 lt!233660)))))

(declare-fun lt!233652 () BitStream!5326)

(assert (=> d!48597 (= lt!233660 (tuple2!13357 lt!233652 (_2!7040 lt!233352)))))

(declare-fun lt!233644 () Unit!9459)

(declare-fun lt!233658 () Unit!9459)

(assert (=> d!48597 (= lt!233644 lt!233658)))

(assert (=> d!48597 (isPrefixOf!0 lt!233652 (_2!7040 lt!233352))))

(assert (=> d!48597 (= lt!233658 (lemmaIsPrefixTransitive!0 lt!233652 (_2!7040 lt!233352) (_2!7040 lt!233352)))))

(declare-fun lt!233656 () Unit!9459)

(declare-fun lt!233662 () Unit!9459)

(assert (=> d!48597 (= lt!233656 lt!233662)))

(assert (=> d!48597 (isPrefixOf!0 lt!233652 (_2!7040 lt!233352))))

(assert (=> d!48597 (= lt!233662 (lemmaIsPrefixTransitive!0 lt!233652 thiss!1634 (_2!7040 lt!233352)))))

(declare-fun lt!233654 () Unit!9459)

(assert (=> d!48597 (= lt!233654 e!99940)))

(declare-fun c!8044 () Bool)

(assert (=> d!48597 (= c!8044 (not (= (size!3034 (buf!3509 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!233645 () Unit!9459)

(declare-fun lt!233657 () Unit!9459)

(assert (=> d!48597 (= lt!233645 lt!233657)))

(assert (=> d!48597 (isPrefixOf!0 (_2!7040 lt!233352) (_2!7040 lt!233352))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5326) Unit!9459)

(assert (=> d!48597 (= lt!233657 (lemmaIsPrefixRefl!0 (_2!7040 lt!233352)))))

(declare-fun lt!233661 () Unit!9459)

(declare-fun lt!233647 () Unit!9459)

(assert (=> d!48597 (= lt!233661 lt!233647)))

(assert (=> d!48597 (= lt!233647 (lemmaIsPrefixRefl!0 (_2!7040 lt!233352)))))

(declare-fun lt!233659 () Unit!9459)

(declare-fun lt!233646 () Unit!9459)

(assert (=> d!48597 (= lt!233659 lt!233646)))

(assert (=> d!48597 (isPrefixOf!0 lt!233652 lt!233652)))

(assert (=> d!48597 (= lt!233646 (lemmaIsPrefixRefl!0 lt!233652))))

(declare-fun lt!233663 () Unit!9459)

(declare-fun lt!233649 () Unit!9459)

(assert (=> d!48597 (= lt!233663 lt!233649)))

(assert (=> d!48597 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48597 (= lt!233649 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48597 (= lt!233652 (BitStream!5327 (buf!3509 (_2!7040 lt!233352)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)))))

(assert (=> d!48597 (isPrefixOf!0 thiss!1634 (_2!7040 lt!233352))))

(assert (=> d!48597 (= (reader!0 thiss!1634 (_2!7040 lt!233352)) lt!233660)))

(assert (= (and d!48597 c!8044) b!149686))

(assert (= (and d!48597 (not c!8044)) b!149685))

(assert (= (and d!48597 res!125397) b!149682))

(assert (= (and b!149682 res!125396) b!149683))

(assert (= (and b!149683 res!125398) b!149684))

(declare-fun m!233047 () Bool)

(assert (=> b!149683 m!233047))

(declare-fun m!233049 () Bool)

(assert (=> b!149684 m!233049))

(assert (=> b!149684 m!232755))

(assert (=> b!149684 m!232725))

(assert (=> b!149686 m!232725))

(declare-fun m!233051 () Bool)

(assert (=> b!149686 m!233051))

(declare-fun m!233053 () Bool)

(assert (=> b!149686 m!233053))

(declare-fun m!233055 () Bool)

(assert (=> b!149682 m!233055))

(declare-fun m!233057 () Bool)

(assert (=> d!48597 m!233057))

(declare-fun m!233059 () Bool)

(assert (=> d!48597 m!233059))

(declare-fun m!233061 () Bool)

(assert (=> d!48597 m!233061))

(assert (=> d!48597 m!232791))

(declare-fun m!233063 () Bool)

(assert (=> d!48597 m!233063))

(declare-fun m!233065 () Bool)

(assert (=> d!48597 m!233065))

(declare-fun m!233067 () Bool)

(assert (=> d!48597 m!233067))

(declare-fun m!233069 () Bool)

(assert (=> d!48597 m!233069))

(declare-fun m!233071 () Bool)

(assert (=> d!48597 m!233071))

(declare-fun m!233073 () Bool)

(assert (=> d!48597 m!233073))

(declare-fun m!233075 () Bool)

(assert (=> d!48597 m!233075))

(assert (=> b!149548 d!48597))

(declare-fun d!48599 () Bool)

(declare-fun e!99944 () Bool)

(assert (=> d!48599 e!99944))

(declare-fun res!125406 () Bool)

(assert (=> d!48599 (=> (not res!125406) (not e!99944))))

(declare-fun lt!233678 () tuple2!13352)

(assert (=> d!48599 (= res!125406 (= (size!3034 (buf!3509 thiss!1634)) (size!3034 (buf!3509 (_2!7040 lt!233678)))))))

(declare-fun choose!6 (BitStream!5326 (_ BitVec 8)) tuple2!13352)

(assert (=> d!48599 (= lt!233678 (choose!6 thiss!1634 (select (arr!3818 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!48599 (validate_offset_byte!0 ((_ sign_extend 32) (size!3034 (buf!3509 thiss!1634))) ((_ sign_extend 32) (currentByte!6423 thiss!1634)) ((_ sign_extend 32) (currentBit!6418 thiss!1634)))))

(assert (=> d!48599 (= (appendByte!0 thiss!1634 (select (arr!3818 arr!237) from!447)) lt!233678)))

(declare-fun b!149693 () Bool)

(declare-fun res!125405 () Bool)

(assert (=> b!149693 (=> (not res!125405) (not e!99944))))

(declare-fun lt!233675 () (_ BitVec 64))

(declare-fun lt!233676 () (_ BitVec 64))

(assert (=> b!149693 (= res!125405 (= (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233678))) (currentByte!6423 (_2!7040 lt!233678)) (currentBit!6418 (_2!7040 lt!233678))) (bvadd lt!233675 lt!233676)))))

(assert (=> b!149693 (or (not (= (bvand lt!233675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233676 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!233675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!233675 lt!233676) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149693 (= lt!233676 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!149693 (= lt!233675 (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)))))

(declare-fun b!149694 () Bool)

(declare-fun res!125407 () Bool)

(assert (=> b!149694 (=> (not res!125407) (not e!99944))))

(assert (=> b!149694 (= res!125407 (isPrefixOf!0 thiss!1634 (_2!7040 lt!233678)))))

(declare-fun lt!233677 () tuple2!13356)

(declare-fun b!149695 () Bool)

(declare-fun lt!233674 () tuple2!13350)

(assert (=> b!149695 (= e!99944 (and (= (_2!7039 lt!233674) (select (arr!3818 arr!237) from!447)) (= (_1!7039 lt!233674) (_2!7042 lt!233677))))))

(assert (=> b!149695 (= lt!233674 (readBytePure!0 (_1!7042 lt!233677)))))

(assert (=> b!149695 (= lt!233677 (reader!0 thiss!1634 (_2!7040 lt!233678)))))

(assert (= (and d!48599 res!125406) b!149693))

(assert (= (and b!149693 res!125405) b!149694))

(assert (= (and b!149694 res!125407) b!149695))

(assert (=> d!48599 m!232727))

(declare-fun m!233077 () Bool)

(assert (=> d!48599 m!233077))

(declare-fun m!233079 () Bool)

(assert (=> d!48599 m!233079))

(declare-fun m!233081 () Bool)

(assert (=> b!149693 m!233081))

(assert (=> b!149693 m!232725))

(declare-fun m!233083 () Bool)

(assert (=> b!149694 m!233083))

(declare-fun m!233085 () Bool)

(assert (=> b!149695 m!233085))

(declare-fun m!233087 () Bool)

(assert (=> b!149695 m!233087))

(assert (=> b!149548 d!48599))

(declare-fun d!48601 () Bool)

(declare-fun res!125415 () Bool)

(declare-fun e!99950 () Bool)

(assert (=> d!48601 (=> (not res!125415) (not e!99950))))

(assert (=> d!48601 (= res!125415 (= (size!3034 (buf!3509 thiss!1634)) (size!3034 (buf!3509 (_2!7040 lt!233352)))))))

(assert (=> d!48601 (= (isPrefixOf!0 thiss!1634 (_2!7040 lt!233352)) e!99950)))

(declare-fun b!149702 () Bool)

(declare-fun res!125414 () Bool)

(assert (=> b!149702 (=> (not res!125414) (not e!99950))))

(assert (=> b!149702 (= res!125414 (bvsle (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)) (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233352))) (currentByte!6423 (_2!7040 lt!233352)) (currentBit!6418 (_2!7040 lt!233352)))))))

(declare-fun b!149703 () Bool)

(declare-fun e!99949 () Bool)

(assert (=> b!149703 (= e!99950 e!99949)))

(declare-fun res!125416 () Bool)

(assert (=> b!149703 (=> res!125416 e!99949)))

(assert (=> b!149703 (= res!125416 (= (size!3034 (buf!3509 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!149704 () Bool)

(assert (=> b!149704 (= e!99949 (arrayBitRangesEq!0 (buf!3509 thiss!1634) (buf!3509 (_2!7040 lt!233352)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634))))))

(assert (= (and d!48601 res!125415) b!149702))

(assert (= (and b!149702 res!125414) b!149703))

(assert (= (and b!149703 (not res!125416)) b!149704))

(assert (=> b!149702 m!232725))

(assert (=> b!149702 m!232755))

(assert (=> b!149704 m!232725))

(assert (=> b!149704 m!232725))

(declare-fun m!233089 () Bool)

(assert (=> b!149704 m!233089))

(assert (=> b!149548 d!48601))

(declare-fun d!48603 () Bool)

(declare-fun lt!233679 () tuple2!13374)

(assert (=> d!48603 (= lt!233679 (readByte!0 (_1!7042 lt!233343)))))

(assert (=> d!48603 (= (readBytePure!0 (_1!7042 lt!233343)) (tuple2!13351 (_2!7052 lt!233679) (_1!7052 lt!233679)))))

(declare-fun bs!11868 () Bool)

(assert (= bs!11868 d!48603))

(declare-fun m!233091 () Bool)

(assert (=> bs!11868 m!233091))

(assert (=> b!149548 d!48603))

(declare-fun d!48605 () Bool)

(assert (=> d!48605 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 thiss!1634)) ((_ sign_extend 32) (currentBit!6418 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!233680 () Unit!9459)

(assert (=> d!48605 (= lt!233680 (choose!26 thiss!1634 (buf!3509 (_2!7040 lt!233352)) (bvsub to!404 from!447) (BitStream!5327 (buf!3509 (_2!7040 lt!233352)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634))))))

(assert (=> d!48605 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3509 (_2!7040 lt!233352)) (bvsub to!404 from!447)) lt!233680)))

(declare-fun bs!11869 () Bool)

(assert (= bs!11869 d!48605))

(assert (=> bs!11869 m!232799))

(declare-fun m!233093 () Bool)

(assert (=> bs!11869 m!233093))

(assert (=> b!149548 d!48605))

(declare-fun d!48607 () Bool)

(declare-fun res!125417 () Bool)

(declare-fun e!99951 () Bool)

(assert (=> d!48607 (=> res!125417 e!99951)))

(assert (=> d!48607 (= res!125417 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48607 (= (arrayRangesEq!350 (_2!7041 lt!233362) (_2!7041 lt!233367) #b00000000000000000000000000000000 to!404) e!99951)))

(declare-fun b!149705 () Bool)

(declare-fun e!99952 () Bool)

(assert (=> b!149705 (= e!99951 e!99952)))

(declare-fun res!125418 () Bool)

(assert (=> b!149705 (=> (not res!125418) (not e!99952))))

(assert (=> b!149705 (= res!125418 (= (select (arr!3818 (_2!7041 lt!233362)) #b00000000000000000000000000000000) (select (arr!3818 (_2!7041 lt!233367)) #b00000000000000000000000000000000)))))

(declare-fun b!149706 () Bool)

(assert (=> b!149706 (= e!99952 (arrayRangesEq!350 (_2!7041 lt!233362) (_2!7041 lt!233367) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48607 (not res!125417)) b!149705))

(assert (= (and b!149705 res!125418) b!149706))

(assert (=> b!149705 m!233025))

(declare-fun m!233095 () Bool)

(assert (=> b!149705 m!233095))

(declare-fun m!233097 () Bool)

(assert (=> b!149706 m!233097))

(assert (=> b!149548 d!48607))

(declare-fun d!48609 () Bool)

(assert (=> d!48609 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233347)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347))) lt!233364) (bvsle ((_ sign_extend 32) lt!233364) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233347)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11870 () Bool)

(assert (= bs!11870 d!48609))

(assert (=> bs!11870 m!233011))

(assert (=> b!149548 d!48609))

(declare-fun d!48611 () Bool)

(declare-fun lt!233689 () tuple2!13354)

(declare-fun lt!233691 () tuple2!13354)

(assert (=> d!48611 (arrayRangesEq!350 (_2!7041 lt!233689) (_2!7041 lt!233691) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233692 () Unit!9459)

(declare-fun lt!233690 () BitStream!5326)

(declare-fun choose!35 (BitStream!5326 array!6704 (_ BitVec 32) (_ BitVec 32) tuple2!13354 array!6704 BitStream!5326 tuple2!13354 array!6704) Unit!9459)

(assert (=> d!48611 (= lt!233692 (choose!35 (_1!7042 lt!233343) arr!237 from!447 to!404 lt!233689 (_2!7041 lt!233689) lt!233690 lt!233691 (_2!7041 lt!233691)))))

(assert (=> d!48611 (= lt!233691 (readByteArrayLoopPure!0 lt!233690 (array!6705 (store (arr!3818 arr!237) from!447 (_2!7039 (readBytePure!0 (_1!7042 lt!233343)))) (size!3034 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!48611 (= lt!233690 (withMovedByteIndex!0 (_1!7042 lt!233343) #b00000000000000000000000000000001))))

(assert (=> d!48611 (= lt!233689 (readByteArrayLoopPure!0 (_1!7042 lt!233343) arr!237 from!447 to!404))))

(assert (=> d!48611 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!7042 lt!233343) arr!237 from!447 to!404) lt!233692)))

(declare-fun bs!11872 () Bool)

(assert (= bs!11872 d!48611))

(declare-fun m!233099 () Bool)

(assert (=> bs!11872 m!233099))

(assert (=> bs!11872 m!232783))

(declare-fun m!233101 () Bool)

(assert (=> bs!11872 m!233101))

(declare-fun m!233103 () Bool)

(assert (=> bs!11872 m!233103))

(assert (=> bs!11872 m!232771))

(assert (=> bs!11872 m!232787))

(declare-fun m!233105 () Bool)

(assert (=> bs!11872 m!233105))

(assert (=> b!149548 d!48611))

(declare-fun b!149707 () Bool)

(declare-fun res!125419 () Bool)

(declare-fun e!99954 () Bool)

(assert (=> b!149707 (=> (not res!125419) (not e!99954))))

(declare-fun lt!233709 () tuple2!13356)

(assert (=> b!149707 (= res!125419 (isPrefixOf!0 (_1!7042 lt!233709) (_2!7040 lt!233347)))))

(declare-fun b!149708 () Bool)

(declare-fun res!125421 () Bool)

(assert (=> b!149708 (=> (not res!125421) (not e!99954))))

(assert (=> b!149708 (= res!125421 (isPrefixOf!0 (_2!7042 lt!233709) (_2!7040 lt!233352)))))

(declare-fun lt!233697 () (_ BitVec 64))

(declare-fun b!149709 () Bool)

(declare-fun lt!233699 () (_ BitVec 64))

(assert (=> b!149709 (= e!99954 (= (_1!7042 lt!233709) (withMovedBitIndex!0 (_2!7042 lt!233709) (bvsub lt!233697 lt!233699))))))

(assert (=> b!149709 (or (= (bvand lt!233697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233699 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233697 lt!233699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149709 (= lt!233699 (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233352))) (currentByte!6423 (_2!7040 lt!233352)) (currentBit!6418 (_2!7040 lt!233352))))))

(assert (=> b!149709 (= lt!233697 (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233347))) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347))))))

(declare-fun b!149710 () Bool)

(declare-fun e!99953 () Unit!9459)

(declare-fun Unit!9466 () Unit!9459)

(assert (=> b!149710 (= e!99953 Unit!9466)))

(declare-fun b!149711 () Bool)

(declare-fun lt!233704 () Unit!9459)

(assert (=> b!149711 (= e!99953 lt!233704)))

(declare-fun lt!233702 () (_ BitVec 64))

(assert (=> b!149711 (= lt!233702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!233700 () (_ BitVec 64))

(assert (=> b!149711 (= lt!233700 (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233347))) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347))))))

(assert (=> b!149711 (= lt!233704 (arrayBitRangesEqSymmetric!0 (buf!3509 (_2!7040 lt!233347)) (buf!3509 (_2!7040 lt!233352)) lt!233702 lt!233700))))

(assert (=> b!149711 (arrayBitRangesEq!0 (buf!3509 (_2!7040 lt!233352)) (buf!3509 (_2!7040 lt!233347)) lt!233702 lt!233700)))

(declare-fun d!48613 () Bool)

(assert (=> d!48613 e!99954))

(declare-fun res!125420 () Bool)

(assert (=> d!48613 (=> (not res!125420) (not e!99954))))

(assert (=> d!48613 (= res!125420 (isPrefixOf!0 (_1!7042 lt!233709) (_2!7042 lt!233709)))))

(declare-fun lt!233701 () BitStream!5326)

(assert (=> d!48613 (= lt!233709 (tuple2!13357 lt!233701 (_2!7040 lt!233352)))))

(declare-fun lt!233693 () Unit!9459)

(declare-fun lt!233707 () Unit!9459)

(assert (=> d!48613 (= lt!233693 lt!233707)))

(assert (=> d!48613 (isPrefixOf!0 lt!233701 (_2!7040 lt!233352))))

(assert (=> d!48613 (= lt!233707 (lemmaIsPrefixTransitive!0 lt!233701 (_2!7040 lt!233352) (_2!7040 lt!233352)))))

(declare-fun lt!233705 () Unit!9459)

(declare-fun lt!233711 () Unit!9459)

(assert (=> d!48613 (= lt!233705 lt!233711)))

(assert (=> d!48613 (isPrefixOf!0 lt!233701 (_2!7040 lt!233352))))

(assert (=> d!48613 (= lt!233711 (lemmaIsPrefixTransitive!0 lt!233701 (_2!7040 lt!233347) (_2!7040 lt!233352)))))

(declare-fun lt!233703 () Unit!9459)

(assert (=> d!48613 (= lt!233703 e!99953)))

(declare-fun c!8045 () Bool)

(assert (=> d!48613 (= c!8045 (not (= (size!3034 (buf!3509 (_2!7040 lt!233347))) #b00000000000000000000000000000000)))))

(declare-fun lt!233694 () Unit!9459)

(declare-fun lt!233706 () Unit!9459)

(assert (=> d!48613 (= lt!233694 lt!233706)))

(assert (=> d!48613 (isPrefixOf!0 (_2!7040 lt!233352) (_2!7040 lt!233352))))

(assert (=> d!48613 (= lt!233706 (lemmaIsPrefixRefl!0 (_2!7040 lt!233352)))))

(declare-fun lt!233710 () Unit!9459)

(declare-fun lt!233696 () Unit!9459)

(assert (=> d!48613 (= lt!233710 lt!233696)))

(assert (=> d!48613 (= lt!233696 (lemmaIsPrefixRefl!0 (_2!7040 lt!233352)))))

(declare-fun lt!233708 () Unit!9459)

(declare-fun lt!233695 () Unit!9459)

(assert (=> d!48613 (= lt!233708 lt!233695)))

(assert (=> d!48613 (isPrefixOf!0 lt!233701 lt!233701)))

(assert (=> d!48613 (= lt!233695 (lemmaIsPrefixRefl!0 lt!233701))))

(declare-fun lt!233712 () Unit!9459)

(declare-fun lt!233698 () Unit!9459)

(assert (=> d!48613 (= lt!233712 lt!233698)))

(assert (=> d!48613 (isPrefixOf!0 (_2!7040 lt!233347) (_2!7040 lt!233347))))

(assert (=> d!48613 (= lt!233698 (lemmaIsPrefixRefl!0 (_2!7040 lt!233347)))))

(assert (=> d!48613 (= lt!233701 (BitStream!5327 (buf!3509 (_2!7040 lt!233352)) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347))))))

(assert (=> d!48613 (isPrefixOf!0 (_2!7040 lt!233347) (_2!7040 lt!233352))))

(assert (=> d!48613 (= (reader!0 (_2!7040 lt!233347) (_2!7040 lt!233352)) lt!233709)))

(assert (= (and d!48613 c!8045) b!149711))

(assert (= (and d!48613 (not c!8045)) b!149710))

(assert (= (and d!48613 res!125420) b!149707))

(assert (= (and b!149707 res!125419) b!149708))

(assert (= (and b!149708 res!125421) b!149709))

(declare-fun m!233107 () Bool)

(assert (=> b!149708 m!233107))

(declare-fun m!233109 () Bool)

(assert (=> b!149709 m!233109))

(assert (=> b!149709 m!232755))

(assert (=> b!149709 m!232723))

(assert (=> b!149711 m!232723))

(declare-fun m!233111 () Bool)

(assert (=> b!149711 m!233111))

(declare-fun m!233113 () Bool)

(assert (=> b!149711 m!233113))

(declare-fun m!233115 () Bool)

(assert (=> b!149707 m!233115))

(declare-fun m!233117 () Bool)

(assert (=> d!48613 m!233117))

(declare-fun m!233119 () Bool)

(assert (=> d!48613 m!233119))

(declare-fun m!233121 () Bool)

(assert (=> d!48613 m!233121))

(assert (=> d!48613 m!232761))

(assert (=> d!48613 m!233063))

(assert (=> d!48613 m!233065))

(declare-fun m!233123 () Bool)

(assert (=> d!48613 m!233123))

(declare-fun m!233125 () Bool)

(assert (=> d!48613 m!233125))

(declare-fun m!233127 () Bool)

(assert (=> d!48613 m!233127))

(declare-fun m!233129 () Bool)

(assert (=> d!48613 m!233129))

(declare-fun m!233131 () Bool)

(assert (=> d!48613 m!233131))

(assert (=> b!149548 d!48613))

(declare-fun d!48615 () Bool)

(declare-fun e!99957 () Bool)

(assert (=> d!48615 e!99957))

(declare-fun res!125424 () Bool)

(assert (=> d!48615 (=> (not res!125424) (not e!99957))))

(assert (=> d!48615 (= res!125424 (and (or (let ((rhs!3277 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3277 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3277) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!48616 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!48616 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!48616 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3276 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3276 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3276) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!233721 () Unit!9459)

(declare-fun choose!57 (BitStream!5326 BitStream!5326 (_ BitVec 64) (_ BitVec 32)) Unit!9459)

(assert (=> d!48615 (= lt!233721 (choose!57 thiss!1634 (_2!7040 lt!233347) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!48615 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7040 lt!233347) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!233721)))

(declare-fun b!149714 () Bool)

(declare-fun lt!233720 () (_ BitVec 32))

(assert (=> b!149714 (= e!99957 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233347)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347))) (bvsub (bvsub to!404 from!447) lt!233720)))))

(assert (=> b!149714 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!233720 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!233720) #b10000000000000000000000000000000)))))

(declare-fun lt!233719 () (_ BitVec 64))

(assert (=> b!149714 (= lt!233720 ((_ extract 31 0) lt!233719))))

(assert (=> b!149714 (and (bvslt lt!233719 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!233719 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!149714 (= lt!233719 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!48615 res!125424) b!149714))

(declare-fun m!233133 () Bool)

(assert (=> d!48615 m!233133))

(declare-fun m!233135 () Bool)

(assert (=> b!149714 m!233135))

(assert (=> b!149548 d!48615))

(declare-fun d!48618 () Bool)

(declare-fun e!99960 () Bool)

(assert (=> d!48618 e!99960))

(declare-fun res!125427 () Bool)

(assert (=> d!48618 (=> (not res!125427) (not e!99960))))

(declare-fun lt!233732 () tuple2!13350)

(declare-fun lt!233730 () tuple2!13350)

(assert (=> d!48618 (= res!125427 (= (bitIndex!0 (size!3034 (buf!3509 (_1!7039 lt!233732))) (currentByte!6423 (_1!7039 lt!233732)) (currentBit!6418 (_1!7039 lt!233732))) (bitIndex!0 (size!3034 (buf!3509 (_1!7039 lt!233730))) (currentByte!6423 (_1!7039 lt!233730)) (currentBit!6418 (_1!7039 lt!233730)))))))

(declare-fun lt!233733 () BitStream!5326)

(declare-fun lt!233731 () Unit!9459)

(declare-fun choose!14 (BitStream!5326 BitStream!5326 BitStream!5326 tuple2!13350 tuple2!13350 BitStream!5326 (_ BitVec 8) tuple2!13350 tuple2!13350 BitStream!5326 (_ BitVec 8)) Unit!9459)

(assert (=> d!48618 (= lt!233731 (choose!14 lt!233357 (_2!7040 lt!233352) lt!233733 lt!233732 (tuple2!13351 (_1!7039 lt!233732) (_2!7039 lt!233732)) (_1!7039 lt!233732) (_2!7039 lt!233732) lt!233730 (tuple2!13351 (_1!7039 lt!233730) (_2!7039 lt!233730)) (_1!7039 lt!233730) (_2!7039 lt!233730)))))

(assert (=> d!48618 (= lt!233730 (readBytePure!0 lt!233733))))

(assert (=> d!48618 (= lt!233732 (readBytePure!0 lt!233357))))

(assert (=> d!48618 (= lt!233733 (BitStream!5327 (buf!3509 (_2!7040 lt!233352)) (currentByte!6423 lt!233357) (currentBit!6418 lt!233357)))))

(assert (=> d!48618 (= (readBytePrefixLemma!0 lt!233357 (_2!7040 lt!233352)) lt!233731)))

(declare-fun b!149717 () Bool)

(assert (=> b!149717 (= e!99960 (= (_2!7039 lt!233732) (_2!7039 lt!233730)))))

(assert (= (and d!48618 res!125427) b!149717))

(declare-fun m!233137 () Bool)

(assert (=> d!48618 m!233137))

(declare-fun m!233139 () Bool)

(assert (=> d!48618 m!233139))

(assert (=> d!48618 m!232809))

(declare-fun m!233141 () Bool)

(assert (=> d!48618 m!233141))

(declare-fun m!233143 () Bool)

(assert (=> d!48618 m!233143))

(assert (=> b!149548 d!48618))

(declare-fun d!48622 () Bool)

(assert (=> d!48622 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347))) lt!233364) (bvsle ((_ sign_extend 32) lt!233364) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11873 () Bool)

(assert (= bs!11873 d!48622))

(declare-fun m!233145 () Bool)

(assert (=> bs!11873 m!233145))

(assert (=> b!149548 d!48622))

(declare-fun b!149766 () Bool)

(declare-fun res!125471 () Bool)

(declare-fun e!99989 () Bool)

(assert (=> b!149766 (=> (not res!125471) (not e!99989))))

(declare-fun lt!233847 () tuple2!13352)

(assert (=> b!149766 (= res!125471 (isPrefixOf!0 (_2!7040 lt!233347) (_2!7040 lt!233847)))))

(declare-fun b!149767 () Bool)

(declare-fun lt!233848 () tuple2!13354)

(declare-fun e!99990 () Bool)

(assert (=> b!149767 (= e!99990 (arrayRangesEq!350 arr!237 (_2!7041 lt!233848) #b00000000000000000000000000000000 to!404))))

(declare-fun b!149768 () Bool)

(assert (=> b!149768 (= e!99989 e!99990)))

(declare-fun res!125472 () Bool)

(assert (=> b!149768 (=> (not res!125472) (not e!99990))))

(declare-fun lt!233845 () tuple2!13356)

(assert (=> b!149768 (= res!125472 (and (= (size!3034 (_2!7041 lt!233848)) (size!3034 arr!237)) (= (_1!7041 lt!233848) (_2!7042 lt!233845))))))

(assert (=> b!149768 (= lt!233848 (readByteArrayLoopPure!0 (_1!7042 lt!233845) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!233842 () Unit!9459)

(declare-fun lt!233844 () Unit!9459)

(assert (=> b!149768 (= lt!233842 lt!233844)))

(declare-fun lt!233850 () (_ BitVec 64))

(assert (=> b!149768 (validate_offset_bits!1 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233847)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347))) lt!233850)))

(assert (=> b!149768 (= lt!233844 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7040 lt!233347) (buf!3509 (_2!7040 lt!233847)) lt!233850))))

(declare-fun e!99991 () Bool)

(assert (=> b!149768 e!99991))

(declare-fun res!125473 () Bool)

(assert (=> b!149768 (=> (not res!125473) (not e!99991))))

(assert (=> b!149768 (= res!125473 (and (= (size!3034 (buf!3509 (_2!7040 lt!233347))) (size!3034 (buf!3509 (_2!7040 lt!233847)))) (bvsge lt!233850 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149768 (= lt!233850 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!149768 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!149768 (= lt!233845 (reader!0 (_2!7040 lt!233347) (_2!7040 lt!233847)))))

(declare-fun d!48624 () Bool)

(assert (=> d!48624 e!99989))

(declare-fun res!125474 () Bool)

(assert (=> d!48624 (=> (not res!125474) (not e!99989))))

(assert (=> d!48624 (= res!125474 (= (size!3034 (buf!3509 (_2!7040 lt!233347))) (size!3034 (buf!3509 (_2!7040 lt!233847)))))))

(declare-fun choose!64 (BitStream!5326 array!6704 (_ BitVec 32) (_ BitVec 32)) tuple2!13352)

(assert (=> d!48624 (= lt!233847 (choose!64 (_2!7040 lt!233347) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48624 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3034 arr!237)))))

(assert (=> d!48624 (= (appendByteArrayLoop!0 (_2!7040 lt!233347) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!233847)))

(declare-fun b!149769 () Bool)

(assert (=> b!149769 (= e!99991 (validate_offset_bits!1 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233347)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347))) lt!233850))))

(declare-fun b!149770 () Bool)

(declare-fun res!125470 () Bool)

(assert (=> b!149770 (=> (not res!125470) (not e!99989))))

(declare-fun lt!233846 () (_ BitVec 64))

(declare-fun lt!233843 () (_ BitVec 64))

(assert (=> b!149770 (= res!125470 (= (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233847))) (currentByte!6423 (_2!7040 lt!233847)) (currentBit!6418 (_2!7040 lt!233847))) (bvadd lt!233843 lt!233846)))))

(assert (=> b!149770 (or (not (= (bvand lt!233843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233846 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!233843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!233843 lt!233846) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!233849 () (_ BitVec 64))

(assert (=> b!149770 (= lt!233846 (bvmul lt!233849 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!149770 (or (= lt!233849 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!233849 #b0000000000000000000000000000000000000000000000000000000000001000) lt!233849)))))

(assert (=> b!149770 (= lt!233849 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!149770 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!149770 (= lt!233843 (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233347))) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347))))))

(assert (= (and d!48624 res!125474) b!149770))

(assert (= (and b!149770 res!125470) b!149766))

(assert (= (and b!149766 res!125471) b!149768))

(assert (= (and b!149768 res!125473) b!149769))

(assert (= (and b!149768 res!125472) b!149767))

(declare-fun m!233197 () Bool)

(assert (=> d!48624 m!233197))

(declare-fun m!233199 () Bool)

(assert (=> b!149767 m!233199))

(declare-fun m!233201 () Bool)

(assert (=> b!149769 m!233201))

(declare-fun m!233203 () Bool)

(assert (=> b!149766 m!233203))

(declare-fun m!233205 () Bool)

(assert (=> b!149770 m!233205))

(assert (=> b!149770 m!232723))

(declare-fun m!233207 () Bool)

(assert (=> b!149768 m!233207))

(declare-fun m!233209 () Bool)

(assert (=> b!149768 m!233209))

(declare-fun m!233211 () Bool)

(assert (=> b!149768 m!233211))

(declare-fun m!233213 () Bool)

(assert (=> b!149768 m!233213))

(assert (=> b!149548 d!48624))

(declare-fun d!48644 () Bool)

(declare-fun lt!233851 () tuple2!13374)

(assert (=> d!48644 (= lt!233851 (readByte!0 (BitStream!5327 (buf!3509 (_2!7040 lt!233352)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634))))))

(assert (=> d!48644 (= (readBytePure!0 (BitStream!5327 (buf!3509 (_2!7040 lt!233352)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634))) (tuple2!13351 (_2!7052 lt!233851) (_1!7052 lt!233851)))))

(declare-fun bs!11878 () Bool)

(assert (= bs!11878 d!48644))

(declare-fun m!233215 () Bool)

(assert (=> bs!11878 m!233215))

(assert (=> b!149548 d!48644))

(declare-fun d!48646 () Bool)

(assert (=> d!48646 (= (array_inv!2823 arr!237) (bvsge (size!3034 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28782 d!48646))

(declare-fun d!48648 () Bool)

(assert (=> d!48648 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6418 thiss!1634) (currentByte!6423 thiss!1634) (size!3034 (buf!3509 thiss!1634))))))

(declare-fun bs!11879 () Bool)

(assert (= bs!11879 d!48648))

(assert (=> bs!11879 m!232721))

(assert (=> start!28782 d!48648))

(declare-fun d!48652 () Bool)

(declare-fun res!125479 () Bool)

(declare-fun e!99995 () Bool)

(assert (=> d!48652 (=> (not res!125479) (not e!99995))))

(assert (=> d!48652 (= res!125479 (= (size!3034 (buf!3509 thiss!1634)) (size!3034 (buf!3509 (_2!7040 lt!233347)))))))

(assert (=> d!48652 (= (isPrefixOf!0 thiss!1634 (_2!7040 lt!233347)) e!99995)))

(declare-fun b!149774 () Bool)

(declare-fun res!125478 () Bool)

(assert (=> b!149774 (=> (not res!125478) (not e!99995))))

(assert (=> b!149774 (= res!125478 (bvsle (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)) (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233347))) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347)))))))

(declare-fun b!149775 () Bool)

(declare-fun e!99994 () Bool)

(assert (=> b!149775 (= e!99995 e!99994)))

(declare-fun res!125480 () Bool)

(assert (=> b!149775 (=> res!125480 e!99994)))

(assert (=> b!149775 (= res!125480 (= (size!3034 (buf!3509 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!149776 () Bool)

(assert (=> b!149776 (= e!99994 (arrayBitRangesEq!0 (buf!3509 thiss!1634) (buf!3509 (_2!7040 lt!233347)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634))))))

(assert (= (and d!48652 res!125479) b!149774))

(assert (= (and b!149774 res!125478) b!149775))

(assert (= (and b!149775 (not res!125480)) b!149776))

(assert (=> b!149774 m!232725))

(assert (=> b!149774 m!232723))

(assert (=> b!149776 m!232725))

(assert (=> b!149776 m!232725))

(declare-fun m!233219 () Bool)

(assert (=> b!149776 m!233219))

(assert (=> b!149544 d!48652))

(declare-fun d!48656 () Bool)

(declare-fun lt!233852 () tuple2!13374)

(assert (=> d!48656 (= lt!233852 (readByte!0 (_1!7042 lt!233363)))))

(assert (=> d!48656 (= (readBytePure!0 (_1!7042 lt!233363)) (tuple2!13351 (_2!7052 lt!233852) (_1!7052 lt!233852)))))

(declare-fun bs!11880 () Bool)

(assert (= bs!11880 d!48656))

(declare-fun m!233221 () Bool)

(assert (=> bs!11880 m!233221))

(assert (=> b!149555 d!48656))

(declare-fun b!149779 () Bool)

(declare-fun res!125483 () Bool)

(declare-fun e!99999 () Bool)

(assert (=> b!149779 (=> (not res!125483) (not e!99999))))

(declare-fun lt!233869 () tuple2!13356)

(assert (=> b!149779 (= res!125483 (isPrefixOf!0 (_1!7042 lt!233869) thiss!1634))))

(declare-fun b!149780 () Bool)

(declare-fun res!125485 () Bool)

(assert (=> b!149780 (=> (not res!125485) (not e!99999))))

(assert (=> b!149780 (= res!125485 (isPrefixOf!0 (_2!7042 lt!233869) (_2!7040 lt!233347)))))

(declare-fun lt!233857 () (_ BitVec 64))

(declare-fun lt!233859 () (_ BitVec 64))

(declare-fun b!149781 () Bool)

(assert (=> b!149781 (= e!99999 (= (_1!7042 lt!233869) (withMovedBitIndex!0 (_2!7042 lt!233869) (bvsub lt!233857 lt!233859))))))

(assert (=> b!149781 (or (= (bvand lt!233857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!233859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!233857 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!233857 lt!233859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!149781 (= lt!233859 (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233347))) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347))))))

(assert (=> b!149781 (= lt!233857 (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)))))

(declare-fun b!149782 () Bool)

(declare-fun e!99998 () Unit!9459)

(declare-fun Unit!9467 () Unit!9459)

(assert (=> b!149782 (= e!99998 Unit!9467)))

(declare-fun b!149783 () Bool)

(declare-fun lt!233864 () Unit!9459)

(assert (=> b!149783 (= e!99998 lt!233864)))

(declare-fun lt!233862 () (_ BitVec 64))

(assert (=> b!149783 (= lt!233862 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!233860 () (_ BitVec 64))

(assert (=> b!149783 (= lt!233860 (bitIndex!0 (size!3034 (buf!3509 thiss!1634)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)))))

(assert (=> b!149783 (= lt!233864 (arrayBitRangesEqSymmetric!0 (buf!3509 thiss!1634) (buf!3509 (_2!7040 lt!233347)) lt!233862 lt!233860))))

(assert (=> b!149783 (arrayBitRangesEq!0 (buf!3509 (_2!7040 lt!233347)) (buf!3509 thiss!1634) lt!233862 lt!233860)))

(declare-fun d!48658 () Bool)

(assert (=> d!48658 e!99999))

(declare-fun res!125484 () Bool)

(assert (=> d!48658 (=> (not res!125484) (not e!99999))))

(assert (=> d!48658 (= res!125484 (isPrefixOf!0 (_1!7042 lt!233869) (_2!7042 lt!233869)))))

(declare-fun lt!233861 () BitStream!5326)

(assert (=> d!48658 (= lt!233869 (tuple2!13357 lt!233861 (_2!7040 lt!233347)))))

(declare-fun lt!233853 () Unit!9459)

(declare-fun lt!233867 () Unit!9459)

(assert (=> d!48658 (= lt!233853 lt!233867)))

(assert (=> d!48658 (isPrefixOf!0 lt!233861 (_2!7040 lt!233347))))

(assert (=> d!48658 (= lt!233867 (lemmaIsPrefixTransitive!0 lt!233861 (_2!7040 lt!233347) (_2!7040 lt!233347)))))

(declare-fun lt!233865 () Unit!9459)

(declare-fun lt!233871 () Unit!9459)

(assert (=> d!48658 (= lt!233865 lt!233871)))

(assert (=> d!48658 (isPrefixOf!0 lt!233861 (_2!7040 lt!233347))))

(assert (=> d!48658 (= lt!233871 (lemmaIsPrefixTransitive!0 lt!233861 thiss!1634 (_2!7040 lt!233347)))))

(declare-fun lt!233863 () Unit!9459)

(assert (=> d!48658 (= lt!233863 e!99998)))

(declare-fun c!8049 () Bool)

(assert (=> d!48658 (= c!8049 (not (= (size!3034 (buf!3509 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!233854 () Unit!9459)

(declare-fun lt!233866 () Unit!9459)

(assert (=> d!48658 (= lt!233854 lt!233866)))

(assert (=> d!48658 (isPrefixOf!0 (_2!7040 lt!233347) (_2!7040 lt!233347))))

(assert (=> d!48658 (= lt!233866 (lemmaIsPrefixRefl!0 (_2!7040 lt!233347)))))

(declare-fun lt!233870 () Unit!9459)

(declare-fun lt!233856 () Unit!9459)

(assert (=> d!48658 (= lt!233870 lt!233856)))

(assert (=> d!48658 (= lt!233856 (lemmaIsPrefixRefl!0 (_2!7040 lt!233347)))))

(declare-fun lt!233868 () Unit!9459)

(declare-fun lt!233855 () Unit!9459)

(assert (=> d!48658 (= lt!233868 lt!233855)))

(assert (=> d!48658 (isPrefixOf!0 lt!233861 lt!233861)))

(assert (=> d!48658 (= lt!233855 (lemmaIsPrefixRefl!0 lt!233861))))

(declare-fun lt!233872 () Unit!9459)

(declare-fun lt!233858 () Unit!9459)

(assert (=> d!48658 (= lt!233872 lt!233858)))

(assert (=> d!48658 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!48658 (= lt!233858 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!48658 (= lt!233861 (BitStream!5327 (buf!3509 (_2!7040 lt!233347)) (currentByte!6423 thiss!1634) (currentBit!6418 thiss!1634)))))

(assert (=> d!48658 (isPrefixOf!0 thiss!1634 (_2!7040 lt!233347))))

(assert (=> d!48658 (= (reader!0 thiss!1634 (_2!7040 lt!233347)) lt!233869)))

(assert (= (and d!48658 c!8049) b!149783))

(assert (= (and d!48658 (not c!8049)) b!149782))

(assert (= (and d!48658 res!125484) b!149779))

(assert (= (and b!149779 res!125483) b!149780))

(assert (= (and b!149780 res!125485) b!149781))

(declare-fun m!233227 () Bool)

(assert (=> b!149780 m!233227))

(declare-fun m!233229 () Bool)

(assert (=> b!149781 m!233229))

(assert (=> b!149781 m!232723))

(assert (=> b!149781 m!232725))

(assert (=> b!149783 m!232725))

(declare-fun m!233231 () Bool)

(assert (=> b!149783 m!233231))

(declare-fun m!233233 () Bool)

(assert (=> b!149783 m!233233))

(declare-fun m!233235 () Bool)

(assert (=> b!149779 m!233235))

(assert (=> d!48658 m!233057))

(declare-fun m!233237 () Bool)

(assert (=> d!48658 m!233237))

(declare-fun m!233239 () Bool)

(assert (=> d!48658 m!233239))

(assert (=> d!48658 m!232753))

(assert (=> d!48658 m!233127))

(assert (=> d!48658 m!233117))

(declare-fun m!233241 () Bool)

(assert (=> d!48658 m!233241))

(declare-fun m!233243 () Bool)

(assert (=> d!48658 m!233243))

(assert (=> d!48658 m!233071))

(declare-fun m!233245 () Bool)

(assert (=> d!48658 m!233245))

(declare-fun m!233247 () Bool)

(assert (=> d!48658 m!233247))

(assert (=> b!149555 d!48658))

(assert (=> b!149554 d!48567))

(assert (=> b!149554 d!48571))

(declare-fun d!48662 () Bool)

(declare-fun res!125486 () Bool)

(declare-fun e!100000 () Bool)

(assert (=> d!48662 (=> res!125486 e!100000)))

(assert (=> d!48662 (= res!125486 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48662 (= (arrayRangesEq!350 arr!237 (_2!7041 lt!233362) #b00000000000000000000000000000000 to!404) e!100000)))

(declare-fun b!149784 () Bool)

(declare-fun e!100001 () Bool)

(assert (=> b!149784 (= e!100000 e!100001)))

(declare-fun res!125487 () Bool)

(assert (=> b!149784 (=> (not res!125487) (not e!100001))))

(assert (=> b!149784 (= res!125487 (= (select (arr!3818 arr!237) #b00000000000000000000000000000000) (select (arr!3818 (_2!7041 lt!233362)) #b00000000000000000000000000000000)))))

(declare-fun b!149785 () Bool)

(assert (=> b!149785 (= e!100001 (arrayRangesEq!350 arr!237 (_2!7041 lt!233362) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48662 (not res!125486)) b!149784))

(assert (= (and b!149784 res!125487) b!149785))

(declare-fun m!233249 () Bool)

(assert (=> b!149784 m!233249))

(assert (=> b!149784 m!233025))

(declare-fun m!233251 () Bool)

(assert (=> b!149785 m!233251))

(assert (=> b!149545 d!48662))

(declare-fun d!48664 () Bool)

(assert (=> d!48664 (arrayRangesEq!350 arr!237 (_2!7041 lt!233362) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233878 () Unit!9459)

(declare-fun choose!86 (array!6704 array!6704 array!6704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9459)

(assert (=> d!48664 (= lt!233878 (choose!86 arr!237 (_2!7041 lt!233367) (_2!7041 lt!233362) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!48664 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!48664 (= (arrayRangesEqTransitive!65 arr!237 (_2!7041 lt!233367) (_2!7041 lt!233362) #b00000000000000000000000000000000 to!404 to!404) lt!233878)))

(declare-fun bs!11882 () Bool)

(assert (= bs!11882 d!48664))

(assert (=> bs!11882 m!232733))

(declare-fun m!233259 () Bool)

(assert (=> bs!11882 m!233259))

(assert (=> b!149545 d!48664))

(declare-fun d!48670 () Bool)

(declare-fun res!125490 () Bool)

(declare-fun e!100004 () Bool)

(assert (=> d!48670 (=> res!125490 e!100004)))

(assert (=> d!48670 (= res!125490 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48670 (= (arrayRangesEq!350 (_2!7041 lt!233367) (_2!7041 lt!233362) #b00000000000000000000000000000000 to!404) e!100004)))

(declare-fun b!149788 () Bool)

(declare-fun e!100005 () Bool)

(assert (=> b!149788 (= e!100004 e!100005)))

(declare-fun res!125491 () Bool)

(assert (=> b!149788 (=> (not res!125491) (not e!100005))))

(assert (=> b!149788 (= res!125491 (= (select (arr!3818 (_2!7041 lt!233367)) #b00000000000000000000000000000000) (select (arr!3818 (_2!7041 lt!233362)) #b00000000000000000000000000000000)))))

(declare-fun b!149789 () Bool)

(assert (=> b!149789 (= e!100005 (arrayRangesEq!350 (_2!7041 lt!233367) (_2!7041 lt!233362) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48670 (not res!125490)) b!149788))

(assert (= (and b!149788 res!125491) b!149789))

(assert (=> b!149788 m!233095))

(assert (=> b!149788 m!233025))

(declare-fun m!233261 () Bool)

(assert (=> b!149789 m!233261))

(assert (=> b!149545 d!48670))

(declare-fun d!48672 () Bool)

(assert (=> d!48672 (arrayRangesEq!350 (_2!7041 lt!233367) (_2!7041 lt!233362) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!233884 () Unit!9459)

(declare-fun choose!87 (array!6704 array!6704 (_ BitVec 32) (_ BitVec 32)) Unit!9459)

(assert (=> d!48672 (= lt!233884 (choose!87 (_2!7041 lt!233362) (_2!7041 lt!233367) #b00000000000000000000000000000000 to!404))))

(assert (=> d!48672 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3034 (_2!7041 lt!233362))))))

(assert (=> d!48672 (= (arrayRangesEqSymmetricLemma!82 (_2!7041 lt!233362) (_2!7041 lt!233367) #b00000000000000000000000000000000 to!404) lt!233884)))

(declare-fun bs!11884 () Bool)

(assert (= bs!11884 d!48672))

(assert (=> bs!11884 m!232737))

(declare-fun m!233265 () Bool)

(assert (=> bs!11884 m!233265))

(assert (=> b!149545 d!48672))

(declare-fun lt!233885 () tuple3!582)

(declare-fun d!48678 () Bool)

(assert (=> d!48678 (= lt!233885 (readByteArrayLoop!0 (_1!7042 lt!233338) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!48678 (= (readByteArrayLoopPure!0 (_1!7042 lt!233338) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13355 (_2!7051 lt!233885) (_3!364 lt!233885)))))

(declare-fun bs!11885 () Bool)

(assert (= bs!11885 d!48678))

(declare-fun m!233267 () Bool)

(assert (=> bs!11885 m!233267))

(assert (=> b!149552 d!48678))

(declare-fun d!48680 () Bool)

(assert (=> d!48680 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347))) lt!233360) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347)))) lt!233360))))

(declare-fun bs!11887 () Bool)

(assert (= bs!11887 d!48680))

(assert (=> bs!11887 m!233145))

(assert (=> b!149552 d!48680))

(declare-fun d!48684 () Bool)

(assert (=> d!48684 (validate_offset_bits!1 ((_ sign_extend 32) (size!3034 (buf!3509 (_2!7040 lt!233352)))) ((_ sign_extend 32) (currentByte!6423 (_2!7040 lt!233347))) ((_ sign_extend 32) (currentBit!6418 (_2!7040 lt!233347))) lt!233360)))

(declare-fun lt!233917 () Unit!9459)

(declare-fun choose!9 (BitStream!5326 array!6704 (_ BitVec 64) BitStream!5326) Unit!9459)

(assert (=> d!48684 (= lt!233917 (choose!9 (_2!7040 lt!233347) (buf!3509 (_2!7040 lt!233352)) lt!233360 (BitStream!5327 (buf!3509 (_2!7040 lt!233352)) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347)))))))

(assert (=> d!48684 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7040 lt!233347) (buf!3509 (_2!7040 lt!233352)) lt!233360) lt!233917)))

(declare-fun bs!11888 () Bool)

(assert (= bs!11888 d!48684))

(assert (=> bs!11888 m!232743))

(declare-fun m!233301 () Bool)

(assert (=> bs!11888 m!233301))

(assert (=> b!149552 d!48684))

(assert (=> b!149552 d!48613))

(declare-fun d!48692 () Bool)

(declare-fun res!125498 () Bool)

(declare-fun e!100010 () Bool)

(assert (=> d!48692 (=> (not res!125498) (not e!100010))))

(assert (=> d!48692 (= res!125498 (= (size!3034 (buf!3509 (_2!7040 lt!233347))) (size!3034 (buf!3509 (_2!7040 lt!233352)))))))

(assert (=> d!48692 (= (isPrefixOf!0 (_2!7040 lt!233347) (_2!7040 lt!233352)) e!100010)))

(declare-fun b!149797 () Bool)

(declare-fun res!125497 () Bool)

(assert (=> b!149797 (=> (not res!125497) (not e!100010))))

(assert (=> b!149797 (= res!125497 (bvsle (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233347))) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347))) (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233352))) (currentByte!6423 (_2!7040 lt!233352)) (currentBit!6418 (_2!7040 lt!233352)))))))

(declare-fun b!149798 () Bool)

(declare-fun e!100009 () Bool)

(assert (=> b!149798 (= e!100010 e!100009)))

(declare-fun res!125499 () Bool)

(assert (=> b!149798 (=> res!125499 e!100009)))

(assert (=> b!149798 (= res!125499 (= (size!3034 (buf!3509 (_2!7040 lt!233347))) #b00000000000000000000000000000000))))

(declare-fun b!149799 () Bool)

(assert (=> b!149799 (= e!100009 (arrayBitRangesEq!0 (buf!3509 (_2!7040 lt!233347)) (buf!3509 (_2!7040 lt!233352)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3034 (buf!3509 (_2!7040 lt!233347))) (currentByte!6423 (_2!7040 lt!233347)) (currentBit!6418 (_2!7040 lt!233347)))))))

(assert (= (and d!48692 res!125498) b!149797))

(assert (= (and b!149797 res!125497) b!149798))

(assert (= (and b!149798 (not res!125499)) b!149799))

(assert (=> b!149797 m!232723))

(assert (=> b!149797 m!232755))

(assert (=> b!149799 m!232723))

(assert (=> b!149799 m!232723))

(declare-fun m!233303 () Bool)

(assert (=> b!149799 m!233303))

(assert (=> b!149541 d!48692))

(declare-fun d!48694 () Bool)

(assert (=> d!48694 (= (invariant!0 (currentBit!6418 thiss!1634) (currentByte!6423 thiss!1634) (size!3034 (buf!3509 (_2!7040 lt!233347)))) (and (bvsge (currentBit!6418 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6418 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6423 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6423 thiss!1634) (size!3034 (buf!3509 (_2!7040 lt!233347)))) (and (= (currentBit!6418 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6423 thiss!1634) (size!3034 (buf!3509 (_2!7040 lt!233347))))))))))

(assert (=> b!149543 d!48694))

(declare-fun d!48696 () Bool)

(declare-fun res!125500 () Bool)

(declare-fun e!100011 () Bool)

(assert (=> d!48696 (=> res!125500 e!100011)))

(assert (=> d!48696 (= res!125500 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!48696 (= (arrayRangesEq!350 arr!237 (_2!7041 lt!233355) #b00000000000000000000000000000000 to!404) e!100011)))

(declare-fun b!149800 () Bool)

(declare-fun e!100012 () Bool)

(assert (=> b!149800 (= e!100011 e!100012)))

(declare-fun res!125501 () Bool)

(assert (=> b!149800 (=> (not res!125501) (not e!100012))))

(assert (=> b!149800 (= res!125501 (= (select (arr!3818 arr!237) #b00000000000000000000000000000000) (select (arr!3818 (_2!7041 lt!233355)) #b00000000000000000000000000000000)))))

(declare-fun b!149801 () Bool)

(assert (=> b!149801 (= e!100012 (arrayRangesEq!350 arr!237 (_2!7041 lt!233355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!48696 (not res!125500)) b!149800))

(assert (= (and b!149800 res!125501) b!149801))

(assert (=> b!149800 m!233249))

(declare-fun m!233305 () Bool)

(assert (=> b!149800 m!233305))

(declare-fun m!233307 () Bool)

(assert (=> b!149801 m!233307))

(assert (=> b!149542 d!48696))

(declare-fun d!48698 () Bool)

(assert (=> d!48698 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3034 (buf!3509 thiss!1634))) ((_ sign_extend 32) (currentByte!6423 thiss!1634)) ((_ sign_extend 32) (currentBit!6418 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3034 (buf!3509 thiss!1634))) ((_ sign_extend 32) (currentByte!6423 thiss!1634)) ((_ sign_extend 32) (currentBit!6418 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11889 () Bool)

(assert (= bs!11889 d!48698))

(assert (=> bs!11889 m!233015))

(assert (=> b!149553 d!48698))

(push 1)

(assert (not d!48680))

(assert (not b!149669))

(assert (not b!149770))

(assert (not b!149774))

(assert (not d!48579))

(assert (not b!149686))

(assert (not b!149711))

(assert (not b!149704))

(assert (not d!48644))

(assert (not d!48575))

(assert (not b!149684))

(assert (not b!149801))

(assert (not d!48585))

(assert (not b!149785))

(assert (not d!48658))

(assert (not b!149693))

(assert (not d!48587))

(assert (not d!48684))

(assert (not d!48593))

(assert (not d!48597))

(assert (not d!48648))

(assert (not b!149769))

(assert (not b!149708))

(assert (not b!149797))

(assert (not d!48589))

(assert (not d!48605))

(assert (not b!149799))

(assert (not d!48622))

(assert (not b!149702))

(assert (not d!48698))

(assert (not d!48613))

(assert (not b!149714))

(assert (not d!48595))

(assert (not d!48591))

(assert (not d!48565))

(assert (not b!149779))

(assert (not b!149683))

(assert (not b!149766))

(assert (not d!48577))

(assert (not b!149707))

(assert (not d!48571))

(assert (not b!149694))

(assert (not d!48615))

(assert (not d!48611))

(assert (not b!149695))

(assert (not d!48609))

(assert (not b!149767))

(assert (not d!48678))

(assert (not b!149709))

(assert (not d!48664))

(assert (not d!48672))

(assert (not d!48618))

(assert (not b!149706))

(assert (not d!48583))

(assert (not b!149780))

(assert (not d!48603))

(assert (not b!149682))

(assert (not b!149781))

(assert (not d!48656))

(assert (not b!149768))

(assert (not d!48567))

(assert (not d!48624))

(assert (not b!149783))

(assert (not d!48599))

(assert (not b!149776))

(assert (not b!149789))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

