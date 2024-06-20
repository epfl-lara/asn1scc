; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26358 () Bool)

(assert start!26358)

(declare-fun b!134931 () Bool)

(declare-fun res!112182 () Bool)

(declare-fun e!89550 () Bool)

(assert (=> b!134931 (=> (not res!112182) (not e!89550))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!134931 (= res!112182 (bvslt from!447 to!404))))

(declare-datatypes ((array!6158 0))(
  ( (array!6159 (arr!3452 (Array (_ BitVec 32) (_ BitVec 8))) (size!2787 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4838 0))(
  ( (BitStream!4839 (buf!3180 array!6158) (currentByte!5977 (_ BitVec 32)) (currentBit!5972 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11692 0))(
  ( (tuple2!11693 (_1!6162 BitStream!4838) (_2!6162 array!6158)) )
))
(declare-fun lt!209364 () tuple2!11692)

(declare-fun arr!237 () array!6158)

(declare-fun e!89546 () Bool)

(declare-fun b!134932 () Bool)

(declare-fun arrayRangesEq!190 (array!6158 array!6158 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134932 (= e!89546 (not (arrayRangesEq!190 arr!237 (_2!6162 lt!209364) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!134933 () Bool)

(declare-fun res!112180 () Bool)

(assert (=> b!134933 (=> (not res!112180) (not e!89550))))

(declare-fun thiss!1634 () BitStream!4838)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134933 (= res!112180 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2787 (buf!3180 thiss!1634))) ((_ sign_extend 32) (currentByte!5977 thiss!1634)) ((_ sign_extend 32) (currentBit!5972 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!134934 () Bool)

(declare-fun res!112181 () Bool)

(declare-fun e!89549 () Bool)

(assert (=> b!134934 (=> (not res!112181) (not e!89549))))

(declare-datatypes ((Unit!8412 0))(
  ( (Unit!8413) )
))
(declare-datatypes ((tuple2!11694 0))(
  ( (tuple2!11695 (_1!6163 Unit!8412) (_2!6163 BitStream!4838)) )
))
(declare-fun lt!209368 () tuple2!11694)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134934 (= res!112181 (= (bitIndex!0 (size!2787 (buf!3180 (_2!6163 lt!209368))) (currentByte!5977 (_2!6163 lt!209368)) (currentBit!5972 (_2!6163 lt!209368))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2787 (buf!3180 thiss!1634)) (currentByte!5977 thiss!1634) (currentBit!5972 thiss!1634)))))))

(declare-fun b!134935 () Bool)

(declare-fun e!89544 () Bool)

(assert (=> b!134935 (= e!89550 (not e!89544))))

(declare-fun res!112169 () Bool)

(assert (=> b!134935 (=> res!112169 e!89544)))

(declare-fun lt!209367 () tuple2!11692)

(declare-fun lt!209355 () tuple2!11692)

(assert (=> b!134935 (= res!112169 (not (arrayRangesEq!190 (_2!6162 lt!209367) (_2!6162 lt!209355) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!209350 () tuple2!11692)

(assert (=> b!134935 (arrayRangesEq!190 (_2!6162 lt!209367) (_2!6162 lt!209350) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((tuple2!11696 0))(
  ( (tuple2!11697 (_1!6164 BitStream!4838) (_2!6164 BitStream!4838)) )
))
(declare-fun lt!209359 () tuple2!11696)

(declare-fun lt!209349 () Unit!8412)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4838 array!6158 (_ BitVec 32) (_ BitVec 32)) Unit!8412)

(assert (=> b!134935 (= lt!209349 (readByteArrayLoopArrayPrefixLemma!0 (_1!6164 lt!209359) arr!237 from!447 to!404))))

(declare-fun lt!209351 () array!6158)

(declare-fun readByteArrayLoopPure!0 (BitStream!4838 array!6158 (_ BitVec 32) (_ BitVec 32)) tuple2!11692)

(declare-fun withMovedByteIndex!0 (BitStream!4838 (_ BitVec 32)) BitStream!4838)

(assert (=> b!134935 (= lt!209350 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6164 lt!209359) #b00000000000000000000000000000001) lt!209351 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209362 () tuple2!11696)

(assert (=> b!134935 (= lt!209355 (readByteArrayLoopPure!0 (_1!6164 lt!209362) lt!209351 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!11698 0))(
  ( (tuple2!11699 (_1!6165 BitStream!4838) (_2!6165 (_ BitVec 8))) )
))
(declare-fun lt!209346 () tuple2!11698)

(assert (=> b!134935 (= lt!209351 (array!6159 (store (arr!3452 arr!237) from!447 (_2!6165 lt!209346)) (size!2787 arr!237)))))

(declare-fun lt!209354 () tuple2!11694)

(declare-fun lt!209365 () (_ BitVec 32))

(assert (=> b!134935 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2787 (buf!3180 (_2!6163 lt!209354)))) ((_ sign_extend 32) (currentByte!5977 (_2!6163 lt!209368))) ((_ sign_extend 32) (currentBit!5972 (_2!6163 lt!209368))) lt!209365)))

(declare-fun lt!209347 () Unit!8412)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4838 array!6158 (_ BitVec 32)) Unit!8412)

(assert (=> b!134935 (= lt!209347 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6163 lt!209368) (buf!3180 (_2!6163 lt!209354)) lt!209365))))

(assert (=> b!134935 (= (_1!6162 lt!209367) (_2!6164 lt!209359))))

(assert (=> b!134935 (= lt!209367 (readByteArrayLoopPure!0 (_1!6164 lt!209359) arr!237 from!447 to!404))))

(assert (=> b!134935 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2787 (buf!3180 (_2!6163 lt!209354)))) ((_ sign_extend 32) (currentByte!5977 thiss!1634)) ((_ sign_extend 32) (currentBit!5972 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!209360 () Unit!8412)

(assert (=> b!134935 (= lt!209360 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3180 (_2!6163 lt!209354)) (bvsub to!404 from!447)))))

(assert (=> b!134935 (= (_2!6165 lt!209346) (select (arr!3452 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4838) tuple2!11698)

(assert (=> b!134935 (= lt!209346 (readBytePure!0 (_1!6164 lt!209359)))))

(declare-fun reader!0 (BitStream!4838 BitStream!4838) tuple2!11696)

(assert (=> b!134935 (= lt!209362 (reader!0 (_2!6163 lt!209368) (_2!6163 lt!209354)))))

(assert (=> b!134935 (= lt!209359 (reader!0 thiss!1634 (_2!6163 lt!209354)))))

(declare-fun e!89542 () Bool)

(assert (=> b!134935 e!89542))

(declare-fun res!112179 () Bool)

(assert (=> b!134935 (=> (not res!112179) (not e!89542))))

(declare-fun lt!209352 () tuple2!11698)

(declare-fun lt!209353 () tuple2!11698)

(assert (=> b!134935 (= res!112179 (= (bitIndex!0 (size!2787 (buf!3180 (_1!6165 lt!209352))) (currentByte!5977 (_1!6165 lt!209352)) (currentBit!5972 (_1!6165 lt!209352))) (bitIndex!0 (size!2787 (buf!3180 (_1!6165 lt!209353))) (currentByte!5977 (_1!6165 lt!209353)) (currentBit!5972 (_1!6165 lt!209353)))))))

(declare-fun lt!209358 () Unit!8412)

(declare-fun lt!209363 () BitStream!4838)

(declare-fun readBytePrefixLemma!0 (BitStream!4838 BitStream!4838) Unit!8412)

(assert (=> b!134935 (= lt!209358 (readBytePrefixLemma!0 lt!209363 (_2!6163 lt!209354)))))

(assert (=> b!134935 (= lt!209353 (readBytePure!0 (BitStream!4839 (buf!3180 (_2!6163 lt!209354)) (currentByte!5977 thiss!1634) (currentBit!5972 thiss!1634))))))

(assert (=> b!134935 (= lt!209352 (readBytePure!0 lt!209363))))

(assert (=> b!134935 (= lt!209363 (BitStream!4839 (buf!3180 (_2!6163 lt!209368)) (currentByte!5977 thiss!1634) (currentBit!5972 thiss!1634)))))

(declare-fun e!89540 () Bool)

(assert (=> b!134935 e!89540))

(declare-fun res!112171 () Bool)

(assert (=> b!134935 (=> (not res!112171) (not e!89540))))

(declare-fun isPrefixOf!0 (BitStream!4838 BitStream!4838) Bool)

(assert (=> b!134935 (= res!112171 (isPrefixOf!0 thiss!1634 (_2!6163 lt!209354)))))

(declare-fun lt!209366 () Unit!8412)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4838 BitStream!4838 BitStream!4838) Unit!8412)

(assert (=> b!134935 (= lt!209366 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6163 lt!209368) (_2!6163 lt!209354)))))

(declare-fun e!89543 () Bool)

(assert (=> b!134935 e!89543))

(declare-fun res!112174 () Bool)

(assert (=> b!134935 (=> (not res!112174) (not e!89543))))

(assert (=> b!134935 (= res!112174 (= (size!2787 (buf!3180 (_2!6163 lt!209368))) (size!2787 (buf!3180 (_2!6163 lt!209354)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4838 array!6158 (_ BitVec 32) (_ BitVec 32)) tuple2!11694)

(assert (=> b!134935 (= lt!209354 (appendByteArrayLoop!0 (_2!6163 lt!209368) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134935 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2787 (buf!3180 (_2!6163 lt!209368)))) ((_ sign_extend 32) (currentByte!5977 (_2!6163 lt!209368))) ((_ sign_extend 32) (currentBit!5972 (_2!6163 lt!209368))) lt!209365)))

(assert (=> b!134935 (= lt!209365 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!209371 () Unit!8412)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4838 BitStream!4838 (_ BitVec 64) (_ BitVec 32)) Unit!8412)

(assert (=> b!134935 (= lt!209371 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6163 lt!209368) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!134935 e!89549))

(declare-fun res!112170 () Bool)

(assert (=> b!134935 (=> (not res!112170) (not e!89549))))

(assert (=> b!134935 (= res!112170 (= (size!2787 (buf!3180 thiss!1634)) (size!2787 (buf!3180 (_2!6163 lt!209368)))))))

(declare-fun appendByte!0 (BitStream!4838 (_ BitVec 8)) tuple2!11694)

(assert (=> b!134935 (= lt!209368 (appendByte!0 thiss!1634 (select (arr!3452 arr!237) from!447)))))

(declare-fun b!134936 () Bool)

(declare-fun res!112172 () Bool)

(declare-fun e!89547 () Bool)

(assert (=> b!134936 (=> (not res!112172) (not e!89547))))

(assert (=> b!134936 (= res!112172 (isPrefixOf!0 (_2!6163 lt!209368) (_2!6163 lt!209354)))))

(declare-fun b!134937 () Bool)

(declare-fun res!112175 () Bool)

(assert (=> b!134937 (=> (not res!112175) (not e!89549))))

(assert (=> b!134937 (= res!112175 (isPrefixOf!0 thiss!1634 (_2!6163 lt!209368)))))

(declare-fun b!134938 () Bool)

(declare-fun e!89541 () Bool)

(declare-fun array_inv!2576 (array!6158) Bool)

(assert (=> b!134938 (= e!89541 (array_inv!2576 (buf!3180 thiss!1634)))))

(declare-fun b!134939 () Bool)

(assert (=> b!134939 (= e!89544 true)))

(assert (=> b!134939 (arrayRangesEq!190 (_2!6162 lt!209355) (_2!6162 lt!209367) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!209369 () Unit!8412)

(declare-fun arrayRangesEqSymmetricLemma!3 (array!6158 array!6158 (_ BitVec 32) (_ BitVec 32)) Unit!8412)

(assert (=> b!134939 (= lt!209369 (arrayRangesEqSymmetricLemma!3 (_2!6162 lt!209367) (_2!6162 lt!209355) #b00000000000000000000000000000000 to!404))))

(declare-fun b!134940 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134940 (= e!89540 (invariant!0 (currentBit!5972 thiss!1634) (currentByte!5977 thiss!1634) (size!2787 (buf!3180 (_2!6163 lt!209368)))))))

(declare-fun b!134941 () Bool)

(assert (=> b!134941 (= e!89542 (= (_2!6165 lt!209352) (_2!6165 lt!209353)))))

(declare-fun res!112178 () Bool)

(assert (=> start!26358 (=> (not res!112178) (not e!89550))))

(assert (=> start!26358 (= res!112178 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2787 arr!237))))))

(assert (=> start!26358 e!89550))

(assert (=> start!26358 true))

(assert (=> start!26358 (array_inv!2576 arr!237)))

(declare-fun inv!12 (BitStream!4838) Bool)

(assert (=> start!26358 (and (inv!12 thiss!1634) e!89541)))

(declare-fun b!134942 () Bool)

(assert (=> b!134942 (= e!89547 (not e!89546))))

(declare-fun res!112176 () Bool)

(assert (=> b!134942 (=> res!112176 e!89546)))

(declare-fun lt!209348 () tuple2!11696)

(assert (=> b!134942 (= res!112176 (or (not (= (size!2787 (_2!6162 lt!209364)) (size!2787 arr!237))) (not (= (_1!6162 lt!209364) (_2!6164 lt!209348)))))))

(assert (=> b!134942 (= lt!209364 (readByteArrayLoopPure!0 (_1!6164 lt!209348) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!209370 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134942 (validate_offset_bits!1 ((_ sign_extend 32) (size!2787 (buf!3180 (_2!6163 lt!209354)))) ((_ sign_extend 32) (currentByte!5977 (_2!6163 lt!209368))) ((_ sign_extend 32) (currentBit!5972 (_2!6163 lt!209368))) lt!209370)))

(declare-fun lt!209361 () Unit!8412)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4838 array!6158 (_ BitVec 64)) Unit!8412)

(assert (=> b!134942 (= lt!209361 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6163 lt!209368) (buf!3180 (_2!6163 lt!209354)) lt!209370))))

(assert (=> b!134942 (= lt!209348 (reader!0 (_2!6163 lt!209368) (_2!6163 lt!209354)))))

(declare-fun b!134943 () Bool)

(assert (=> b!134943 (= e!89543 e!89547)))

(declare-fun res!112173 () Bool)

(assert (=> b!134943 (=> (not res!112173) (not e!89547))))

(assert (=> b!134943 (= res!112173 (= (bitIndex!0 (size!2787 (buf!3180 (_2!6163 lt!209354))) (currentByte!5977 (_2!6163 lt!209354)) (currentBit!5972 (_2!6163 lt!209354))) (bvadd (bitIndex!0 (size!2787 (buf!3180 (_2!6163 lt!209368))) (currentByte!5977 (_2!6163 lt!209368)) (currentBit!5972 (_2!6163 lt!209368))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!209370))))))

(assert (=> b!134943 (= lt!209370 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!209356 () tuple2!11696)

(declare-fun lt!209357 () tuple2!11698)

(declare-fun b!134944 () Bool)

(assert (=> b!134944 (= e!89549 (and (= (_2!6165 lt!209357) (select (arr!3452 arr!237) from!447)) (= (_1!6165 lt!209357) (_2!6164 lt!209356))))))

(assert (=> b!134944 (= lt!209357 (readBytePure!0 (_1!6164 lt!209356)))))

(assert (=> b!134944 (= lt!209356 (reader!0 thiss!1634 (_2!6163 lt!209368)))))

(declare-fun b!134945 () Bool)

(declare-fun res!112177 () Bool)

(assert (=> b!134945 (=> (not res!112177) (not e!89550))))

(assert (=> b!134945 (= res!112177 (invariant!0 (currentBit!5972 thiss!1634) (currentByte!5977 thiss!1634) (size!2787 (buf!3180 thiss!1634))))))

(assert (= (and start!26358 res!112178) b!134933))

(assert (= (and b!134933 res!112180) b!134931))

(assert (= (and b!134931 res!112182) b!134945))

(assert (= (and b!134945 res!112177) b!134935))

(assert (= (and b!134935 res!112170) b!134934))

(assert (= (and b!134934 res!112181) b!134937))

(assert (= (and b!134937 res!112175) b!134944))

(assert (= (and b!134935 res!112174) b!134943))

(assert (= (and b!134943 res!112173) b!134936))

(assert (= (and b!134936 res!112172) b!134942))

(assert (= (and b!134942 (not res!112176)) b!134932))

(assert (= (and b!134935 res!112171) b!134940))

(assert (= (and b!134935 res!112179) b!134941))

(assert (= (and b!134935 (not res!112169)) b!134939))

(assert (= start!26358 b!134938))

(declare-fun m!205583 () Bool)

(assert (=> b!134944 m!205583))

(declare-fun m!205585 () Bool)

(assert (=> b!134944 m!205585))

(declare-fun m!205587 () Bool)

(assert (=> b!134944 m!205587))

(declare-fun m!205589 () Bool)

(assert (=> b!134942 m!205589))

(declare-fun m!205591 () Bool)

(assert (=> b!134942 m!205591))

(declare-fun m!205593 () Bool)

(assert (=> b!134942 m!205593))

(declare-fun m!205595 () Bool)

(assert (=> b!134942 m!205595))

(declare-fun m!205597 () Bool)

(assert (=> start!26358 m!205597))

(declare-fun m!205599 () Bool)

(assert (=> start!26358 m!205599))

(declare-fun m!205601 () Bool)

(assert (=> b!134939 m!205601))

(declare-fun m!205603 () Bool)

(assert (=> b!134939 m!205603))

(declare-fun m!205605 () Bool)

(assert (=> b!134932 m!205605))

(declare-fun m!205607 () Bool)

(assert (=> b!134934 m!205607))

(declare-fun m!205609 () Bool)

(assert (=> b!134934 m!205609))

(declare-fun m!205611 () Bool)

(assert (=> b!134943 m!205611))

(assert (=> b!134943 m!205607))

(declare-fun m!205613 () Bool)

(assert (=> b!134937 m!205613))

(declare-fun m!205615 () Bool)

(assert (=> b!134933 m!205615))

(declare-fun m!205617 () Bool)

(assert (=> b!134940 m!205617))

(declare-fun m!205619 () Bool)

(assert (=> b!134936 m!205619))

(declare-fun m!205621 () Bool)

(assert (=> b!134945 m!205621))

(declare-fun m!205623 () Bool)

(assert (=> b!134938 m!205623))

(declare-fun m!205625 () Bool)

(assert (=> b!134935 m!205625))

(declare-fun m!205627 () Bool)

(assert (=> b!134935 m!205627))

(declare-fun m!205629 () Bool)

(assert (=> b!134935 m!205629))

(declare-fun m!205631 () Bool)

(assert (=> b!134935 m!205631))

(declare-fun m!205633 () Bool)

(assert (=> b!134935 m!205633))

(assert (=> b!134935 m!205583))

(declare-fun m!205635 () Bool)

(assert (=> b!134935 m!205635))

(declare-fun m!205637 () Bool)

(assert (=> b!134935 m!205637))

(declare-fun m!205639 () Bool)

(assert (=> b!134935 m!205639))

(declare-fun m!205641 () Bool)

(assert (=> b!134935 m!205641))

(declare-fun m!205643 () Bool)

(assert (=> b!134935 m!205643))

(assert (=> b!134935 m!205635))

(declare-fun m!205645 () Bool)

(assert (=> b!134935 m!205645))

(declare-fun m!205647 () Bool)

(assert (=> b!134935 m!205647))

(declare-fun m!205649 () Bool)

(assert (=> b!134935 m!205649))

(declare-fun m!205651 () Bool)

(assert (=> b!134935 m!205651))

(declare-fun m!205653 () Bool)

(assert (=> b!134935 m!205653))

(declare-fun m!205655 () Bool)

(assert (=> b!134935 m!205655))

(declare-fun m!205657 () Bool)

(assert (=> b!134935 m!205657))

(declare-fun m!205659 () Bool)

(assert (=> b!134935 m!205659))

(declare-fun m!205661 () Bool)

(assert (=> b!134935 m!205661))

(declare-fun m!205663 () Bool)

(assert (=> b!134935 m!205663))

(declare-fun m!205665 () Bool)

(assert (=> b!134935 m!205665))

(declare-fun m!205667 () Bool)

(assert (=> b!134935 m!205667))

(assert (=> b!134935 m!205595))

(declare-fun m!205669 () Bool)

(assert (=> b!134935 m!205669))

(declare-fun m!205671 () Bool)

(assert (=> b!134935 m!205671))

(assert (=> b!134935 m!205583))

(declare-fun m!205673 () Bool)

(assert (=> b!134935 m!205673))

(push 1)

(assert (not b!134943))

(assert (not b!134933))

(assert (not b!134942))

(assert (not b!134935))

(assert (not b!134934))

(assert (not b!134932))

(assert (not b!134944))

(assert (not b!134936))

(assert (not b!134945))

(assert (not start!26358))

(assert (not b!134938))

(assert (not b!134937))

(assert (not b!134940))

(assert (not b!134939))

(check-sat)

(pop 1)

(push 1)

