; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26604 () Bool)

(assert start!26604)

(declare-fun b!136536 () Bool)

(declare-fun res!113626 () Bool)

(declare-fun e!90694 () Bool)

(assert (=> b!136536 (=> (not res!113626) (not e!90694))))

(declare-datatypes ((array!6199 0))(
  ( (array!6200 (arr!3486 (Array (_ BitVec 32) (_ BitVec 8))) (size!2806 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4876 0))(
  ( (BitStream!4877 (buf!3209 array!6199) (currentByte!6012 (_ BitVec 32)) (currentBit!6007 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4876)

(declare-datatypes ((Unit!8553 0))(
  ( (Unit!8554) )
))
(declare-datatypes ((tuple2!11854 0))(
  ( (tuple2!11855 (_1!6248 Unit!8553) (_2!6248 BitStream!4876)) )
))
(declare-fun lt!212399 () tuple2!11854)

(declare-fun isPrefixOf!0 (BitStream!4876 BitStream!4876) Bool)

(assert (=> b!136536 (= res!113626 (isPrefixOf!0 thiss!1634 (_2!6248 lt!212399)))))

(declare-fun b!136537 () Bool)

(declare-fun e!90688 () Bool)

(declare-datatypes ((tuple2!11856 0))(
  ( (tuple2!11857 (_1!6249 BitStream!4876) (_2!6249 (_ BitVec 8))) )
))
(declare-fun lt!212411 () tuple2!11856)

(declare-fun lt!212418 () tuple2!11856)

(assert (=> b!136537 (= e!90688 (= (_2!6249 lt!212411) (_2!6249 lt!212418)))))

(declare-datatypes ((tuple2!11858 0))(
  ( (tuple2!11859 (_1!6250 BitStream!4876) (_2!6250 array!6199)) )
))
(declare-fun lt!212404 () tuple2!11858)

(declare-fun b!136538 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun e!90692 () Bool)

(declare-fun arr!237 () array!6199)

(declare-fun arrayRangesEq!209 (array!6199 array!6199 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!136538 (= e!90692 (not (arrayRangesEq!209 arr!237 (_2!6250 lt!212404) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!136539 () Bool)

(declare-fun res!113617 () Bool)

(declare-fun e!90689 () Bool)

(assert (=> b!136539 (=> (not res!113617) (not e!90689))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!136539 (= res!113617 (invariant!0 (currentBit!6007 thiss!1634) (currentByte!6012 thiss!1634) (size!2806 (buf!3209 thiss!1634))))))

(declare-fun b!136540 () Bool)

(declare-fun res!113615 () Bool)

(assert (=> b!136540 (=> (not res!113615) (not e!90689))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!136540 (= res!113615 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2806 (buf!3209 thiss!1634))) ((_ sign_extend 32) (currentByte!6012 thiss!1634)) ((_ sign_extend 32) (currentBit!6007 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!136541 () Bool)

(declare-fun e!90690 () Bool)

(assert (=> b!136541 (= e!90690 (not e!90692))))

(declare-fun res!113614 () Bool)

(assert (=> b!136541 (=> res!113614 e!90692)))

(declare-datatypes ((tuple2!11860 0))(
  ( (tuple2!11861 (_1!6251 BitStream!4876) (_2!6251 BitStream!4876)) )
))
(declare-fun lt!212422 () tuple2!11860)

(assert (=> b!136541 (= res!113614 (or (not (= (size!2806 (_2!6250 lt!212404)) (size!2806 arr!237))) (not (= (_1!6250 lt!212404) (_2!6251 lt!212422)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4876 array!6199 (_ BitVec 32) (_ BitVec 32)) tuple2!11858)

(assert (=> b!136541 (= lt!212404 (readByteArrayLoopPure!0 (_1!6251 lt!212422) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212419 () tuple2!11854)

(declare-fun lt!212412 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!136541 (validate_offset_bits!1 ((_ sign_extend 32) (size!2806 (buf!3209 (_2!6248 lt!212419)))) ((_ sign_extend 32) (currentByte!6012 (_2!6248 lt!212399))) ((_ sign_extend 32) (currentBit!6007 (_2!6248 lt!212399))) lt!212412)))

(declare-fun lt!212409 () Unit!8553)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4876 array!6199 (_ BitVec 64)) Unit!8553)

(assert (=> b!136541 (= lt!212409 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6248 lt!212399) (buf!3209 (_2!6248 lt!212419)) lt!212412))))

(declare-fun reader!0 (BitStream!4876 BitStream!4876) tuple2!11860)

(assert (=> b!136541 (= lt!212422 (reader!0 (_2!6248 lt!212399) (_2!6248 lt!212419)))))

(declare-fun b!136542 () Bool)

(declare-fun e!90691 () Bool)

(assert (=> b!136542 (= e!90691 e!90690)))

(declare-fun res!113625 () Bool)

(assert (=> b!136542 (=> (not res!113625) (not e!90690))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!136542 (= res!113625 (= (bitIndex!0 (size!2806 (buf!3209 (_2!6248 lt!212419))) (currentByte!6012 (_2!6248 lt!212419)) (currentBit!6007 (_2!6248 lt!212419))) (bvadd (bitIndex!0 (size!2806 (buf!3209 (_2!6248 lt!212399))) (currentByte!6012 (_2!6248 lt!212399)) (currentBit!6007 (_2!6248 lt!212399))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!212412))))))

(assert (=> b!136542 (= lt!212412 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!212417 () tuple2!11860)

(declare-fun b!136544 () Bool)

(declare-fun lt!212397 () tuple2!11856)

(assert (=> b!136544 (= e!90694 (and (= (_2!6249 lt!212397) (select (arr!3486 arr!237) from!447)) (= (_1!6249 lt!212397) (_2!6251 lt!212417))))))

(declare-fun readBytePure!0 (BitStream!4876) tuple2!11856)

(assert (=> b!136544 (= lt!212397 (readBytePure!0 (_1!6251 lt!212417)))))

(assert (=> b!136544 (= lt!212417 (reader!0 thiss!1634 (_2!6248 lt!212399)))))

(declare-fun b!136545 () Bool)

(declare-fun res!113616 () Bool)

(assert (=> b!136545 (=> (not res!113616) (not e!90694))))

(assert (=> b!136545 (= res!113616 (= (bitIndex!0 (size!2806 (buf!3209 (_2!6248 lt!212399))) (currentByte!6012 (_2!6248 lt!212399)) (currentBit!6007 (_2!6248 lt!212399))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2806 (buf!3209 thiss!1634)) (currentByte!6012 thiss!1634) (currentBit!6007 thiss!1634)))))))

(declare-fun b!136546 () Bool)

(declare-fun res!113624 () Bool)

(assert (=> b!136546 (=> (not res!113624) (not e!90690))))

(assert (=> b!136546 (= res!113624 (isPrefixOf!0 (_2!6248 lt!212399) (_2!6248 lt!212419)))))

(declare-fun b!136547 () Bool)

(declare-fun e!90693 () Bool)

(declare-fun array_inv!2595 (array!6199) Bool)

(assert (=> b!136547 (= e!90693 (array_inv!2595 (buf!3209 thiss!1634)))))

(declare-fun b!136548 () Bool)

(declare-fun res!113619 () Bool)

(assert (=> b!136548 (=> (not res!113619) (not e!90689))))

(assert (=> b!136548 (= res!113619 (bvslt from!447 to!404))))

(declare-fun b!136549 () Bool)

(declare-fun e!90698 () Bool)

(assert (=> b!136549 (= e!90698 true)))

(declare-fun lt!212410 () tuple2!11858)

(assert (=> b!136549 (arrayRangesEq!209 arr!237 (_2!6250 lt!212410) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212414 () tuple2!11858)

(declare-fun lt!212421 () Unit!8553)

(declare-fun arrayRangesEqTransitive!11 (array!6199 array!6199 array!6199 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8553)

(assert (=> b!136549 (= lt!212421 (arrayRangesEqTransitive!11 arr!237 (_2!6250 lt!212414) (_2!6250 lt!212410) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!136549 (arrayRangesEq!209 (_2!6250 lt!212414) (_2!6250 lt!212410) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212398 () Unit!8553)

(declare-fun arrayRangesEqSymmetricLemma!22 (array!6199 array!6199 (_ BitVec 32) (_ BitVec 32)) Unit!8553)

(assert (=> b!136549 (= lt!212398 (arrayRangesEqSymmetricLemma!22 (_2!6250 lt!212410) (_2!6250 lt!212414) #b00000000000000000000000000000000 to!404))))

(declare-fun b!136550 () Bool)

(declare-fun e!90696 () Bool)

(assert (=> b!136550 (= e!90696 (invariant!0 (currentBit!6007 thiss!1634) (currentByte!6012 thiss!1634) (size!2806 (buf!3209 (_2!6248 lt!212399)))))))

(declare-fun b!136543 () Bool)

(assert (=> b!136543 (= e!90689 (not e!90698))))

(declare-fun res!113613 () Bool)

(assert (=> b!136543 (=> res!113613 e!90698)))

(assert (=> b!136543 (= res!113613 (not (arrayRangesEq!209 (_2!6250 lt!212410) (_2!6250 lt!212414) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!212408 () tuple2!11858)

(assert (=> b!136543 (arrayRangesEq!209 (_2!6250 lt!212410) (_2!6250 lt!212408) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!212403 () tuple2!11860)

(declare-fun lt!212423 () Unit!8553)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4876 array!6199 (_ BitVec 32) (_ BitVec 32)) Unit!8553)

(assert (=> b!136543 (= lt!212423 (readByteArrayLoopArrayPrefixLemma!0 (_1!6251 lt!212403) arr!237 from!447 to!404))))

(declare-fun lt!212400 () array!6199)

(declare-fun withMovedByteIndex!0 (BitStream!4876 (_ BitVec 32)) BitStream!4876)

(assert (=> b!136543 (= lt!212408 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6251 lt!212403) #b00000000000000000000000000000001) lt!212400 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212406 () tuple2!11860)

(assert (=> b!136543 (= lt!212414 (readByteArrayLoopPure!0 (_1!6251 lt!212406) lt!212400 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!212415 () tuple2!11856)

(assert (=> b!136543 (= lt!212400 (array!6200 (store (arr!3486 arr!237) from!447 (_2!6249 lt!212415)) (size!2806 arr!237)))))

(declare-fun lt!212401 () (_ BitVec 32))

(assert (=> b!136543 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2806 (buf!3209 (_2!6248 lt!212419)))) ((_ sign_extend 32) (currentByte!6012 (_2!6248 lt!212399))) ((_ sign_extend 32) (currentBit!6007 (_2!6248 lt!212399))) lt!212401)))

(declare-fun lt!212407 () Unit!8553)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4876 array!6199 (_ BitVec 32)) Unit!8553)

(assert (=> b!136543 (= lt!212407 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6248 lt!212399) (buf!3209 (_2!6248 lt!212419)) lt!212401))))

(assert (=> b!136543 (= (_1!6250 lt!212410) (_2!6251 lt!212403))))

(assert (=> b!136543 (= lt!212410 (readByteArrayLoopPure!0 (_1!6251 lt!212403) arr!237 from!447 to!404))))

(assert (=> b!136543 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2806 (buf!3209 (_2!6248 lt!212419)))) ((_ sign_extend 32) (currentByte!6012 thiss!1634)) ((_ sign_extend 32) (currentBit!6007 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!212413 () Unit!8553)

(assert (=> b!136543 (= lt!212413 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3209 (_2!6248 lt!212419)) (bvsub to!404 from!447)))))

(assert (=> b!136543 (= (_2!6249 lt!212415) (select (arr!3486 arr!237) from!447))))

(assert (=> b!136543 (= lt!212415 (readBytePure!0 (_1!6251 lt!212403)))))

(assert (=> b!136543 (= lt!212406 (reader!0 (_2!6248 lt!212399) (_2!6248 lt!212419)))))

(assert (=> b!136543 (= lt!212403 (reader!0 thiss!1634 (_2!6248 lt!212419)))))

(assert (=> b!136543 e!90688))

(declare-fun res!113621 () Bool)

(assert (=> b!136543 (=> (not res!113621) (not e!90688))))

(assert (=> b!136543 (= res!113621 (= (bitIndex!0 (size!2806 (buf!3209 (_1!6249 lt!212411))) (currentByte!6012 (_1!6249 lt!212411)) (currentBit!6007 (_1!6249 lt!212411))) (bitIndex!0 (size!2806 (buf!3209 (_1!6249 lt!212418))) (currentByte!6012 (_1!6249 lt!212418)) (currentBit!6007 (_1!6249 lt!212418)))))))

(declare-fun lt!212416 () Unit!8553)

(declare-fun lt!212420 () BitStream!4876)

(declare-fun readBytePrefixLemma!0 (BitStream!4876 BitStream!4876) Unit!8553)

(assert (=> b!136543 (= lt!212416 (readBytePrefixLemma!0 lt!212420 (_2!6248 lt!212419)))))

(assert (=> b!136543 (= lt!212418 (readBytePure!0 (BitStream!4877 (buf!3209 (_2!6248 lt!212419)) (currentByte!6012 thiss!1634) (currentBit!6007 thiss!1634))))))

(assert (=> b!136543 (= lt!212411 (readBytePure!0 lt!212420))))

(assert (=> b!136543 (= lt!212420 (BitStream!4877 (buf!3209 (_2!6248 lt!212399)) (currentByte!6012 thiss!1634) (currentBit!6007 thiss!1634)))))

(assert (=> b!136543 e!90696))

(declare-fun res!113620 () Bool)

(assert (=> b!136543 (=> (not res!113620) (not e!90696))))

(assert (=> b!136543 (= res!113620 (isPrefixOf!0 thiss!1634 (_2!6248 lt!212419)))))

(declare-fun lt!212402 () Unit!8553)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4876 BitStream!4876 BitStream!4876) Unit!8553)

(assert (=> b!136543 (= lt!212402 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6248 lt!212399) (_2!6248 lt!212419)))))

(assert (=> b!136543 e!90691))

(declare-fun res!113618 () Bool)

(assert (=> b!136543 (=> (not res!113618) (not e!90691))))

(assert (=> b!136543 (= res!113618 (= (size!2806 (buf!3209 (_2!6248 lt!212399))) (size!2806 (buf!3209 (_2!6248 lt!212419)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4876 array!6199 (_ BitVec 32) (_ BitVec 32)) tuple2!11854)

(assert (=> b!136543 (= lt!212419 (appendByteArrayLoop!0 (_2!6248 lt!212399) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!136543 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2806 (buf!3209 (_2!6248 lt!212399)))) ((_ sign_extend 32) (currentByte!6012 (_2!6248 lt!212399))) ((_ sign_extend 32) (currentBit!6007 (_2!6248 lt!212399))) lt!212401)))

(assert (=> b!136543 (= lt!212401 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!212405 () Unit!8553)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4876 BitStream!4876 (_ BitVec 64) (_ BitVec 32)) Unit!8553)

(assert (=> b!136543 (= lt!212405 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6248 lt!212399) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!136543 e!90694))

(declare-fun res!113623 () Bool)

(assert (=> b!136543 (=> (not res!113623) (not e!90694))))

(assert (=> b!136543 (= res!113623 (= (size!2806 (buf!3209 thiss!1634)) (size!2806 (buf!3209 (_2!6248 lt!212399)))))))

(declare-fun appendByte!0 (BitStream!4876 (_ BitVec 8)) tuple2!11854)

(assert (=> b!136543 (= lt!212399 (appendByte!0 thiss!1634 (select (arr!3486 arr!237) from!447)))))

(declare-fun res!113622 () Bool)

(assert (=> start!26604 (=> (not res!113622) (not e!90689))))

(assert (=> start!26604 (= res!113622 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2806 arr!237))))))

(assert (=> start!26604 e!90689))

(assert (=> start!26604 true))

(assert (=> start!26604 (array_inv!2595 arr!237)))

(declare-fun inv!12 (BitStream!4876) Bool)

(assert (=> start!26604 (and (inv!12 thiss!1634) e!90693)))

(assert (= (and start!26604 res!113622) b!136540))

(assert (= (and b!136540 res!113615) b!136548))

(assert (= (and b!136548 res!113619) b!136539))

(assert (= (and b!136539 res!113617) b!136543))

(assert (= (and b!136543 res!113623) b!136545))

(assert (= (and b!136545 res!113616) b!136536))

(assert (= (and b!136536 res!113626) b!136544))

(assert (= (and b!136543 res!113618) b!136542))

(assert (= (and b!136542 res!113625) b!136546))

(assert (= (and b!136546 res!113624) b!136541))

(assert (= (and b!136541 (not res!113614)) b!136538))

(assert (= (and b!136543 res!113620) b!136550))

(assert (= (and b!136543 res!113621) b!136537))

(assert (= (and b!136543 (not res!113613)) b!136549))

(assert (= start!26604 b!136547))

(declare-fun m!209105 () Bool)

(assert (=> b!136540 m!209105))

(declare-fun m!209107 () Bool)

(assert (=> b!136541 m!209107))

(declare-fun m!209109 () Bool)

(assert (=> b!136541 m!209109))

(declare-fun m!209111 () Bool)

(assert (=> b!136541 m!209111))

(declare-fun m!209113 () Bool)

(assert (=> b!136541 m!209113))

(declare-fun m!209115 () Bool)

(assert (=> b!136549 m!209115))

(declare-fun m!209117 () Bool)

(assert (=> b!136549 m!209117))

(declare-fun m!209119 () Bool)

(assert (=> b!136549 m!209119))

(declare-fun m!209121 () Bool)

(assert (=> b!136549 m!209121))

(declare-fun m!209123 () Bool)

(assert (=> b!136550 m!209123))

(declare-fun m!209125 () Bool)

(assert (=> b!136539 m!209125))

(declare-fun m!209127 () Bool)

(assert (=> b!136547 m!209127))

(declare-fun m!209129 () Bool)

(assert (=> b!136545 m!209129))

(declare-fun m!209131 () Bool)

(assert (=> b!136545 m!209131))

(declare-fun m!209133 () Bool)

(assert (=> b!136542 m!209133))

(assert (=> b!136542 m!209129))

(declare-fun m!209135 () Bool)

(assert (=> b!136546 m!209135))

(declare-fun m!209137 () Bool)

(assert (=> start!26604 m!209137))

(declare-fun m!209139 () Bool)

(assert (=> start!26604 m!209139))

(declare-fun m!209141 () Bool)

(assert (=> b!136538 m!209141))

(declare-fun m!209143 () Bool)

(assert (=> b!136543 m!209143))

(declare-fun m!209145 () Bool)

(assert (=> b!136543 m!209145))

(declare-fun m!209147 () Bool)

(assert (=> b!136543 m!209147))

(declare-fun m!209149 () Bool)

(assert (=> b!136543 m!209149))

(declare-fun m!209151 () Bool)

(assert (=> b!136543 m!209151))

(declare-fun m!209153 () Bool)

(assert (=> b!136543 m!209153))

(declare-fun m!209155 () Bool)

(assert (=> b!136543 m!209155))

(declare-fun m!209157 () Bool)

(assert (=> b!136543 m!209157))

(declare-fun m!209159 () Bool)

(assert (=> b!136543 m!209159))

(declare-fun m!209161 () Bool)

(assert (=> b!136543 m!209161))

(declare-fun m!209163 () Bool)

(assert (=> b!136543 m!209163))

(declare-fun m!209165 () Bool)

(assert (=> b!136543 m!209165))

(declare-fun m!209167 () Bool)

(assert (=> b!136543 m!209167))

(assert (=> b!136543 m!209113))

(declare-fun m!209169 () Bool)

(assert (=> b!136543 m!209169))

(declare-fun m!209171 () Bool)

(assert (=> b!136543 m!209171))

(declare-fun m!209173 () Bool)

(assert (=> b!136543 m!209173))

(declare-fun m!209175 () Bool)

(assert (=> b!136543 m!209175))

(declare-fun m!209177 () Bool)

(assert (=> b!136543 m!209177))

(declare-fun m!209179 () Bool)

(assert (=> b!136543 m!209179))

(declare-fun m!209181 () Bool)

(assert (=> b!136543 m!209181))

(assert (=> b!136543 m!209163))

(declare-fun m!209183 () Bool)

(assert (=> b!136543 m!209183))

(declare-fun m!209185 () Bool)

(assert (=> b!136543 m!209185))

(declare-fun m!209187 () Bool)

(assert (=> b!136543 m!209187))

(declare-fun m!209189 () Bool)

(assert (=> b!136543 m!209189))

(declare-fun m!209191 () Bool)

(assert (=> b!136543 m!209191))

(declare-fun m!209193 () Bool)

(assert (=> b!136543 m!209193))

(assert (=> b!136543 m!209189))

(declare-fun m!209195 () Bool)

(assert (=> b!136536 m!209195))

(assert (=> b!136544 m!209189))

(declare-fun m!209197 () Bool)

(assert (=> b!136544 m!209197))

(declare-fun m!209199 () Bool)

(assert (=> b!136544 m!209199))

(push 1)

(assert (not b!136547))

(assert (not b!136540))

(assert (not b!136539))

(assert (not b!136543))

(assert (not b!136549))

(assert (not b!136542))

(assert (not b!136538))

(assert (not b!136546))

(assert (not b!136545))

(assert (not start!26604))

(assert (not b!136541))

(assert (not b!136544))

(assert (not b!136536))

(assert (not b!136550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

