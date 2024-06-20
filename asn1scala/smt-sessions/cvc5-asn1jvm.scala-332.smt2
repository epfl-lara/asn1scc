; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7760 () Bool)

(assert start!7760)

(declare-fun b!37715 () Bool)

(declare-fun res!32020 () Bool)

(declare-fun e!24775 () Bool)

(assert (=> b!37715 (=> res!32020 e!24775)))

(declare-datatypes ((array!1940 0))(
  ( (array!1941 (arr!1364 (Array (_ BitVec 32) (_ BitVec 8))) (size!871 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1498 0))(
  ( (BitStream!1499 (buf!1199 array!1940) (currentByte!2605 (_ BitVec 32)) (currentBit!2600 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1498)

(declare-datatypes ((Unit!2739 0))(
  ( (Unit!2740) )
))
(declare-datatypes ((tuple2!3670 0))(
  ( (tuple2!3671 (_1!1922 Unit!2739) (_2!1922 BitStream!1498)) )
))
(declare-fun lt!57298 () tuple2!3670)

(assert (=> b!37715 (= res!32020 (not (= (size!871 (buf!1199 thiss!1379)) (size!871 (buf!1199 (_2!1922 lt!57298))))))))

(declare-fun b!37716 () Bool)

(declare-fun e!24778 () Bool)

(declare-fun e!24784 () Bool)

(assert (=> b!37716 (= e!24778 e!24784)))

(declare-fun res!32019 () Bool)

(assert (=> b!37716 (=> res!32019 e!24784)))

(declare-fun lt!57294 () Bool)

(declare-fun lt!57302 () Bool)

(assert (=> b!37716 (= res!32019 (not (= lt!57294 lt!57302)))))

(declare-fun lt!57309 () tuple2!3670)

(declare-fun lt!57293 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1940 (_ BitVec 64)) Bool)

(assert (=> b!37716 (= lt!57294 (bitAt!0 (buf!1199 (_2!1922 lt!57309)) lt!57293))))

(declare-fun b!37717 () Bool)

(declare-fun e!24781 () Bool)

(declare-fun e!24789 () Bool)

(assert (=> b!37717 (= e!24781 (not e!24789))))

(declare-fun res!32033 () Bool)

(assert (=> b!37717 (=> res!32033 e!24789)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!37717 (= res!32033 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1498 BitStream!1498) Bool)

(assert (=> b!37717 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!57300 () Unit!2739)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1498) Unit!2739)

(assert (=> b!37717 (= lt!57300 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!37717 (= lt!57293 (bitIndex!0 (size!871 (buf!1199 thiss!1379)) (currentByte!2605 thiss!1379) (currentBit!2600 thiss!1379)))))

(declare-fun res!32021 () Bool)

(assert (=> start!7760 (=> (not res!32021) (not e!24781))))

(declare-fun srcBuffer!2 () array!1940)

(assert (=> start!7760 (= res!32021 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!871 srcBuffer!2))))))))

(assert (=> start!7760 e!24781))

(assert (=> start!7760 true))

(declare-fun array_inv!802 (array!1940) Bool)

(assert (=> start!7760 (array_inv!802 srcBuffer!2)))

(declare-fun e!24776 () Bool)

(declare-fun inv!12 (BitStream!1498) Bool)

(assert (=> start!7760 (and (inv!12 thiss!1379) e!24776)))

(declare-fun b!37718 () Bool)

(declare-fun res!32029 () Bool)

(assert (=> b!37718 (=> res!32029 e!24775)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!37718 (= res!32029 (not (invariant!0 (currentBit!2600 (_2!1922 lt!57298)) (currentByte!2605 (_2!1922 lt!57298)) (size!871 (buf!1199 (_2!1922 lt!57298))))))))

(declare-fun b!37719 () Bool)

(declare-fun e!24790 () Bool)

(declare-fun e!24785 () Bool)

(assert (=> b!37719 (= e!24790 e!24785)))

(declare-fun res!32032 () Bool)

(assert (=> b!37719 (=> res!32032 e!24785)))

(assert (=> b!37719 (= res!32032 (not (isPrefixOf!0 (_2!1922 lt!57309) (_2!1922 lt!57298))))))

(assert (=> b!37719 (isPrefixOf!0 thiss!1379 (_2!1922 lt!57298))))

(declare-fun lt!57288 () Unit!2739)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1498 BitStream!1498 BitStream!1498) Unit!2739)

(assert (=> b!37719 (= lt!57288 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1922 lt!57309) (_2!1922 lt!57298)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1498 array!1940 (_ BitVec 64) (_ BitVec 64)) tuple2!3670)

(assert (=> b!37719 (= lt!57298 (appendBitsMSBFirstLoop!0 (_2!1922 lt!57309) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!24782 () Bool)

(assert (=> b!37719 e!24782))

(declare-fun res!32022 () Bool)

(assert (=> b!37719 (=> (not res!32022) (not e!24782))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!37719 (= res!32022 (validate_offset_bits!1 ((_ sign_extend 32) (size!871 (buf!1199 (_2!1922 lt!57309)))) ((_ sign_extend 32) (currentByte!2605 thiss!1379)) ((_ sign_extend 32) (currentBit!2600 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57289 () Unit!2739)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1498 array!1940 (_ BitVec 64)) Unit!2739)

(assert (=> b!37719 (= lt!57289 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1199 (_2!1922 lt!57309)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3672 0))(
  ( (tuple2!3673 (_1!1923 BitStream!1498) (_2!1923 BitStream!1498)) )
))
(declare-fun lt!57292 () tuple2!3672)

(declare-fun reader!0 (BitStream!1498 BitStream!1498) tuple2!3672)

(assert (=> b!37719 (= lt!57292 (reader!0 thiss!1379 (_2!1922 lt!57309)))))

(declare-fun b!37720 () Bool)

(declare-fun res!32025 () Bool)

(assert (=> b!37720 (=> (not res!32025) (not e!24781))))

(assert (=> b!37720 (= res!32025 (validate_offset_bits!1 ((_ sign_extend 32) (size!871 (buf!1199 thiss!1379))) ((_ sign_extend 32) (currentByte!2605 thiss!1379)) ((_ sign_extend 32) (currentBit!2600 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!37721 () Bool)

(declare-fun e!24783 () Bool)

(assert (=> b!37721 (= e!24775 e!24783)))

(declare-fun res!32030 () Bool)

(assert (=> b!37721 (=> res!32030 e!24783)))

(assert (=> b!37721 (= res!32030 (not (= (size!871 (buf!1199 (_2!1922 lt!57309))) (size!871 (buf!1199 (_2!1922 lt!57298))))))))

(declare-fun lt!57296 () (_ BitVec 64))

(declare-fun lt!57295 () (_ BitVec 64))

(assert (=> b!37721 (= lt!57296 (bvsub (bvsub (bvadd lt!57295 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!37721 (= lt!57295 (bitIndex!0 (size!871 (buf!1199 (_2!1922 lt!57309))) (currentByte!2605 (_2!1922 lt!57309)) (currentBit!2600 (_2!1922 lt!57309))))))

(assert (=> b!37721 (= (size!871 (buf!1199 (_2!1922 lt!57298))) (size!871 (buf!1199 thiss!1379)))))

(declare-fun b!37722 () Bool)

(declare-fun res!32028 () Bool)

(assert (=> b!37722 (=> res!32028 e!24783)))

(assert (=> b!37722 (= res!32028 (not (invariant!0 (currentBit!2600 (_2!1922 lt!57309)) (currentByte!2605 (_2!1922 lt!57309)) (size!871 (buf!1199 (_2!1922 lt!57298))))))))

(declare-fun b!37723 () Bool)

(declare-fun e!24788 () Bool)

(declare-fun e!24779 () Bool)

(assert (=> b!37723 (= e!24788 e!24779)))

(declare-fun res!32037 () Bool)

(assert (=> b!37723 (=> res!32037 e!24779)))

(declare-datatypes ((List!450 0))(
  ( (Nil!447) (Cons!446 (h!565 Bool) (t!1200 List!450)) )
))
(declare-fun lt!57307 () List!450)

(declare-fun lt!57299 () List!450)

(assert (=> b!37723 (= res!32037 (not (= lt!57307 lt!57299)))))

(assert (=> b!37723 (= lt!57299 lt!57307)))

(declare-fun lt!57297 () List!450)

(declare-fun tail!167 (List!450) List!450)

(assert (=> b!37723 (= lt!57307 (tail!167 lt!57297))))

(declare-fun lt!57287 () tuple2!3672)

(declare-fun lt!57306 () tuple2!3672)

(declare-fun lt!57308 () Unit!2739)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1498 BitStream!1498 BitStream!1498 BitStream!1498 (_ BitVec 64) List!450) Unit!2739)

(assert (=> b!37723 (= lt!57308 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1922 lt!57298) (_2!1922 lt!57298) (_1!1923 lt!57306) (_1!1923 lt!57287) (bvsub to!314 i!635) lt!57297))))

(declare-fun b!37724 () Bool)

(declare-fun e!24786 () Bool)

(assert (=> b!37724 (= e!24786 true)))

(declare-datatypes ((tuple2!3674 0))(
  ( (tuple2!3675 (_1!1924 BitStream!1498) (_2!1924 Bool)) )
))
(declare-fun lt!57310 () tuple2!3674)

(declare-fun readBitPure!0 (BitStream!1498) tuple2!3674)

(assert (=> b!37724 (= lt!57310 (readBitPure!0 (_1!1923 lt!57306)))))

(declare-fun b!37725 () Bool)

(assert (=> b!37725 (= e!24785 e!24775)))

(declare-fun res!32018 () Bool)

(assert (=> b!37725 (=> res!32018 e!24775)))

(assert (=> b!37725 (= res!32018 (not (= lt!57296 (bvsub (bvadd lt!57293 to!314) i!635))))))

(assert (=> b!37725 (= lt!57296 (bitIndex!0 (size!871 (buf!1199 (_2!1922 lt!57298))) (currentByte!2605 (_2!1922 lt!57298)) (currentBit!2600 (_2!1922 lt!57298))))))

(declare-fun b!37726 () Bool)

(declare-fun head!287 (List!450) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1498 array!1940 (_ BitVec 64) (_ BitVec 64)) List!450)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1498 BitStream!1498 (_ BitVec 64)) List!450)

(assert (=> b!37726 (= e!24782 (= (head!287 (byteArrayBitContentToList!0 (_2!1922 lt!57309) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!287 (bitStreamReadBitsIntoList!0 (_2!1922 lt!57309) (_1!1923 lt!57292) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!37727 () Bool)

(assert (=> b!37727 (= e!24789 e!24790)))

(declare-fun res!32023 () Bool)

(assert (=> b!37727 (=> res!32023 e!24790)))

(assert (=> b!37727 (= res!32023 (not (isPrefixOf!0 thiss!1379 (_2!1922 lt!57309))))))

(declare-fun lt!57291 () (_ BitVec 64))

(assert (=> b!37727 (validate_offset_bits!1 ((_ sign_extend 32) (size!871 (buf!1199 (_2!1922 lt!57309)))) ((_ sign_extend 32) (currentByte!2605 (_2!1922 lt!57309))) ((_ sign_extend 32) (currentBit!2600 (_2!1922 lt!57309))) lt!57291)))

(assert (=> b!37727 (= lt!57291 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57286 () Unit!2739)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1498 BitStream!1498 (_ BitVec 64) (_ BitVec 64)) Unit!2739)

(assert (=> b!37727 (= lt!57286 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1922 lt!57309) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1498 (_ BitVec 8) (_ BitVec 32)) tuple2!3670)

(assert (=> b!37727 (= lt!57309 (appendBitFromByte!0 thiss!1379 (select (arr!1364 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!37728 () Bool)

(assert (=> b!37728 (= e!24784 e!24786)))

(declare-fun res!32036 () Bool)

(assert (=> b!37728 (=> res!32036 e!24786)))

(declare-fun lt!57303 () Bool)

(assert (=> b!37728 (= res!32036 (not (= lt!57303 lt!57302)))))

(assert (=> b!37728 (= lt!57294 lt!57303)))

(assert (=> b!37728 (= lt!57303 (bitAt!0 (buf!1199 (_2!1922 lt!57298)) lt!57293))))

(declare-fun lt!57290 () Unit!2739)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1940 array!1940 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2739)

(assert (=> b!37728 (= lt!57290 (arrayBitRangesEqImpliesEq!0 (buf!1199 (_2!1922 lt!57309)) (buf!1199 (_2!1922 lt!57298)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57293 lt!57295))))

(declare-fun b!37729 () Bool)

(declare-fun res!32027 () Bool)

(assert (=> b!37729 (=> res!32027 e!24788)))

(declare-fun length!176 (List!450) Int)

(assert (=> b!37729 (= res!32027 (<= (length!176 lt!57297) 0))))

(declare-fun b!37730 () Bool)

(assert (=> b!37730 (= e!24783 e!24788)))

(declare-fun res!32026 () Bool)

(assert (=> b!37730 (=> res!32026 e!24788)))

(assert (=> b!37730 (= res!32026 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!37730 (= lt!57299 (bitStreamReadBitsIntoList!0 (_2!1922 lt!57298) (_1!1923 lt!57287) lt!57291))))

(assert (=> b!37730 (= lt!57297 (bitStreamReadBitsIntoList!0 (_2!1922 lt!57298) (_1!1923 lt!57306) (bvsub to!314 i!635)))))

(assert (=> b!37730 (validate_offset_bits!1 ((_ sign_extend 32) (size!871 (buf!1199 (_2!1922 lt!57298)))) ((_ sign_extend 32) (currentByte!2605 (_2!1922 lt!57309))) ((_ sign_extend 32) (currentBit!2600 (_2!1922 lt!57309))) lt!57291)))

(declare-fun lt!57301 () Unit!2739)

(assert (=> b!37730 (= lt!57301 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1922 lt!57309) (buf!1199 (_2!1922 lt!57298)) lt!57291))))

(assert (=> b!37730 (= lt!57287 (reader!0 (_2!1922 lt!57309) (_2!1922 lt!57298)))))

(assert (=> b!37730 (validate_offset_bits!1 ((_ sign_extend 32) (size!871 (buf!1199 (_2!1922 lt!57298)))) ((_ sign_extend 32) (currentByte!2605 thiss!1379)) ((_ sign_extend 32) (currentBit!2600 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!57304 () Unit!2739)

(assert (=> b!37730 (= lt!57304 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1199 (_2!1922 lt!57298)) (bvsub to!314 i!635)))))

(assert (=> b!37730 (= lt!57306 (reader!0 thiss!1379 (_2!1922 lt!57298)))))

(declare-fun b!37731 () Bool)

(assert (=> b!37731 (= e!24776 (array_inv!802 (buf!1199 thiss!1379)))))

(declare-fun b!37732 () Bool)

(declare-fun e!24780 () Bool)

(assert (=> b!37732 (= e!24779 e!24780)))

(declare-fun res!32031 () Bool)

(assert (=> b!37732 (=> res!32031 e!24780)))

(declare-fun lt!57305 () Bool)

(assert (=> b!37732 (= res!32031 (not (= lt!57305 (bitAt!0 (buf!1199 (_1!1923 lt!57287)) lt!57293))))))

(assert (=> b!37732 (= lt!57305 (bitAt!0 (buf!1199 (_1!1923 lt!57306)) lt!57293))))

(declare-fun b!37733 () Bool)

(assert (=> b!37733 (= e!24780 e!24778)))

(declare-fun res!32035 () Bool)

(assert (=> b!37733 (=> res!32035 e!24778)))

(assert (=> b!37733 (= res!32035 (not (= (head!287 (byteArrayBitContentToList!0 (_2!1922 lt!57298) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!57302)))))

(assert (=> b!37733 (= lt!57302 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!37734 () Bool)

(declare-fun res!32034 () Bool)

(assert (=> b!37734 (=> res!32034 e!24783)))

(assert (=> b!37734 (= res!32034 (not (invariant!0 (currentBit!2600 (_2!1922 lt!57309)) (currentByte!2605 (_2!1922 lt!57309)) (size!871 (buf!1199 (_2!1922 lt!57309))))))))

(declare-fun b!37735 () Bool)

(declare-fun res!32024 () Bool)

(assert (=> b!37735 (=> res!32024 e!24780)))

(assert (=> b!37735 (= res!32024 (not (= (head!287 lt!57297) lt!57305)))))

(assert (= (and start!7760 res!32021) b!37720))

(assert (= (and b!37720 res!32025) b!37717))

(assert (= (and b!37717 (not res!32033)) b!37727))

(assert (= (and b!37727 (not res!32023)) b!37719))

(assert (= (and b!37719 res!32022) b!37726))

(assert (= (and b!37719 (not res!32032)) b!37725))

(assert (= (and b!37725 (not res!32018)) b!37718))

(assert (= (and b!37718 (not res!32029)) b!37715))

(assert (= (and b!37715 (not res!32020)) b!37721))

(assert (= (and b!37721 (not res!32030)) b!37734))

(assert (= (and b!37734 (not res!32034)) b!37722))

(assert (= (and b!37722 (not res!32028)) b!37730))

(assert (= (and b!37730 (not res!32026)) b!37729))

(assert (= (and b!37729 (not res!32027)) b!37723))

(assert (= (and b!37723 (not res!32037)) b!37732))

(assert (= (and b!37732 (not res!32031)) b!37735))

(assert (= (and b!37735 (not res!32024)) b!37733))

(assert (= (and b!37733 (not res!32035)) b!37716))

(assert (= (and b!37716 (not res!32019)) b!37728))

(assert (= (and b!37728 (not res!32036)) b!37724))

(assert (= start!7760 b!37731))

(declare-fun m!57297 () Bool)

(assert (=> b!37723 m!57297))

(declare-fun m!57299 () Bool)

(assert (=> b!37723 m!57299))

(declare-fun m!57301 () Bool)

(assert (=> b!37716 m!57301))

(declare-fun m!57303 () Bool)

(assert (=> b!37726 m!57303))

(assert (=> b!37726 m!57303))

(declare-fun m!57305 () Bool)

(assert (=> b!37726 m!57305))

(declare-fun m!57307 () Bool)

(assert (=> b!37726 m!57307))

(assert (=> b!37726 m!57307))

(declare-fun m!57309 () Bool)

(assert (=> b!37726 m!57309))

(declare-fun m!57311 () Bool)

(assert (=> b!37725 m!57311))

(declare-fun m!57313 () Bool)

(assert (=> b!37720 m!57313))

(declare-fun m!57315 () Bool)

(assert (=> b!37734 m!57315))

(declare-fun m!57317 () Bool)

(assert (=> start!7760 m!57317))

(declare-fun m!57319 () Bool)

(assert (=> start!7760 m!57319))

(declare-fun m!57321 () Bool)

(assert (=> b!37735 m!57321))

(declare-fun m!57323 () Bool)

(assert (=> b!37722 m!57323))

(declare-fun m!57325 () Bool)

(assert (=> b!37727 m!57325))

(declare-fun m!57327 () Bool)

(assert (=> b!37727 m!57327))

(declare-fun m!57329 () Bool)

(assert (=> b!37727 m!57329))

(declare-fun m!57331 () Bool)

(assert (=> b!37727 m!57331))

(assert (=> b!37727 m!57327))

(declare-fun m!57333 () Bool)

(assert (=> b!37727 m!57333))

(declare-fun m!57335 () Bool)

(assert (=> b!37719 m!57335))

(declare-fun m!57337 () Bool)

(assert (=> b!37719 m!57337))

(declare-fun m!57339 () Bool)

(assert (=> b!37719 m!57339))

(declare-fun m!57341 () Bool)

(assert (=> b!37719 m!57341))

(declare-fun m!57343 () Bool)

(assert (=> b!37719 m!57343))

(declare-fun m!57345 () Bool)

(assert (=> b!37719 m!57345))

(declare-fun m!57347 () Bool)

(assert (=> b!37719 m!57347))

(declare-fun m!57349 () Bool)

(assert (=> b!37731 m!57349))

(declare-fun m!57351 () Bool)

(assert (=> b!37717 m!57351))

(declare-fun m!57353 () Bool)

(assert (=> b!37717 m!57353))

(declare-fun m!57355 () Bool)

(assert (=> b!37717 m!57355))

(declare-fun m!57357 () Bool)

(assert (=> b!37724 m!57357))

(declare-fun m!57359 () Bool)

(assert (=> b!37732 m!57359))

(declare-fun m!57361 () Bool)

(assert (=> b!37732 m!57361))

(declare-fun m!57363 () Bool)

(assert (=> b!37729 m!57363))

(declare-fun m!57365 () Bool)

(assert (=> b!37733 m!57365))

(assert (=> b!37733 m!57365))

(declare-fun m!57367 () Bool)

(assert (=> b!37733 m!57367))

(declare-fun m!57369 () Bool)

(assert (=> b!37733 m!57369))

(declare-fun m!57371 () Bool)

(assert (=> b!37730 m!57371))

(declare-fun m!57373 () Bool)

(assert (=> b!37730 m!57373))

(declare-fun m!57375 () Bool)

(assert (=> b!37730 m!57375))

(declare-fun m!57377 () Bool)

(assert (=> b!37730 m!57377))

(declare-fun m!57379 () Bool)

(assert (=> b!37730 m!57379))

(declare-fun m!57381 () Bool)

(assert (=> b!37730 m!57381))

(declare-fun m!57383 () Bool)

(assert (=> b!37730 m!57383))

(declare-fun m!57385 () Bool)

(assert (=> b!37730 m!57385))

(declare-fun m!57387 () Bool)

(assert (=> b!37718 m!57387))

(declare-fun m!57389 () Bool)

(assert (=> b!37721 m!57389))

(declare-fun m!57391 () Bool)

(assert (=> b!37728 m!57391))

(declare-fun m!57393 () Bool)

(assert (=> b!37728 m!57393))

(push 1)

(assert (not b!37716))

(assert (not b!37719))

(assert (not b!37720))

(assert (not b!37722))

(assert (not b!37728))

(assert (not b!37718))

(assert (not b!37730))

(assert (not b!37732))

(assert (not b!37725))

(assert (not b!37735))

(assert (not b!37729))

(assert (not start!7760))

(assert (not b!37717))

(assert (not b!37731))

(assert (not b!37723))

(assert (not b!37734))

(assert (not b!37733))

(assert (not b!37726))

(assert (not b!37724))

(assert (not b!37727))

(assert (not b!37721))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

