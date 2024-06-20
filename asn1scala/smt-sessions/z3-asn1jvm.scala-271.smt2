; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5376 () Bool)

(assert start!5376)

(declare-fun b!21671 () Bool)

(declare-fun e!14697 () Bool)

(assert (=> b!21671 (= e!14697 true)))

(declare-datatypes ((array!1525 0))(
  ( (array!1526 (arr!1100 (Array (_ BitVec 32) (_ BitVec 8))) (size!650 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1134 0))(
  ( (BitStream!1135 (buf!965 array!1525) (currentByte!2266 (_ BitVec 32)) (currentBit!2261 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1894 0))(
  ( (Unit!1895) )
))
(declare-datatypes ((tuple2!2542 0))(
  ( (tuple2!2543 (_1!1356 Unit!1894) (_2!1356 BitStream!1134)) )
))
(declare-fun lt!31342 () tuple2!2542)

(declare-fun thiss!1379 () BitStream!1134)

(assert (=> b!21671 (= (size!650 (buf!965 (_2!1356 lt!31342))) (size!650 (buf!965 thiss!1379)))))

(declare-fun b!21672 () Bool)

(declare-fun e!14691 () Bool)

(declare-fun e!14695 () Bool)

(assert (=> b!21672 (= e!14691 (not e!14695))))

(declare-fun res!18716 () Bool)

(assert (=> b!21672 (=> res!18716 e!14695)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!21672 (= res!18716 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1134 BitStream!1134) Bool)

(assert (=> b!21672 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!31343 () Unit!1894)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1134) Unit!1894)

(assert (=> b!21672 (= lt!31343 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!31345 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!21672 (= lt!31345 (bitIndex!0 (size!650 (buf!965 thiss!1379)) (currentByte!2266 thiss!1379) (currentBit!2261 thiss!1379)))))

(declare-fun b!21673 () Bool)

(declare-fun res!18713 () Bool)

(assert (=> b!21673 (=> res!18713 e!14697)))

(assert (=> b!21673 (= res!18713 (not (= (bitIndex!0 (size!650 (buf!965 (_2!1356 lt!31342))) (currentByte!2266 (_2!1356 lt!31342)) (currentBit!2261 (_2!1356 lt!31342))) (bvsub (bvadd lt!31345 to!314) i!635))))))

(declare-fun b!21674 () Bool)

(declare-fun e!14692 () Bool)

(declare-fun array_inv!620 (array!1525) Bool)

(assert (=> b!21674 (= e!14692 (array_inv!620 (buf!965 thiss!1379)))))

(declare-fun b!21675 () Bool)

(declare-fun res!18712 () Bool)

(assert (=> b!21675 (=> res!18712 e!14697)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!21675 (= res!18712 (not (invariant!0 (currentBit!2261 (_2!1356 lt!31342)) (currentByte!2266 (_2!1356 lt!31342)) (size!650 (buf!965 (_2!1356 lt!31342))))))))

(declare-fun res!18719 () Bool)

(assert (=> start!5376 (=> (not res!18719) (not e!14691))))

(declare-fun srcBuffer!2 () array!1525)

(assert (=> start!5376 (= res!18719 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!650 srcBuffer!2))))))))

(assert (=> start!5376 e!14691))

(assert (=> start!5376 true))

(assert (=> start!5376 (array_inv!620 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1134) Bool)

(assert (=> start!5376 (and (inv!12 thiss!1379) e!14692)))

(declare-fun b!21676 () Bool)

(declare-fun e!14694 () Bool)

(assert (=> b!21676 (= e!14694 e!14697)))

(declare-fun res!18714 () Bool)

(assert (=> b!21676 (=> res!18714 e!14697)))

(declare-fun lt!31340 () tuple2!2542)

(assert (=> b!21676 (= res!18714 (not (isPrefixOf!0 (_2!1356 lt!31340) (_2!1356 lt!31342))))))

(assert (=> b!21676 (isPrefixOf!0 thiss!1379 (_2!1356 lt!31342))))

(declare-fun lt!31344 () Unit!1894)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1134 BitStream!1134 BitStream!1134) Unit!1894)

(assert (=> b!21676 (= lt!31344 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1356 lt!31340) (_2!1356 lt!31342)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1134 array!1525 (_ BitVec 64) (_ BitVec 64)) tuple2!2542)

(assert (=> b!21676 (= lt!31342 (appendBitsMSBFirstLoop!0 (_2!1356 lt!31340) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!14693 () Bool)

(assert (=> b!21676 e!14693))

(declare-fun res!18718 () Bool)

(assert (=> b!21676 (=> (not res!18718) (not e!14693))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21676 (= res!18718 (validate_offset_bits!1 ((_ sign_extend 32) (size!650 (buf!965 (_2!1356 lt!31340)))) ((_ sign_extend 32) (currentByte!2266 thiss!1379)) ((_ sign_extend 32) (currentBit!2261 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31338 () Unit!1894)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1134 array!1525 (_ BitVec 64)) Unit!1894)

(assert (=> b!21676 (= lt!31338 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!965 (_2!1356 lt!31340)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2544 0))(
  ( (tuple2!2545 (_1!1357 BitStream!1134) (_2!1357 BitStream!1134)) )
))
(declare-fun lt!31339 () tuple2!2544)

(declare-fun reader!0 (BitStream!1134 BitStream!1134) tuple2!2544)

(assert (=> b!21676 (= lt!31339 (reader!0 thiss!1379 (_2!1356 lt!31340)))))

(declare-fun b!21677 () Bool)

(declare-fun res!18717 () Bool)

(assert (=> b!21677 (=> (not res!18717) (not e!14691))))

(assert (=> b!21677 (= res!18717 (validate_offset_bits!1 ((_ sign_extend 32) (size!650 (buf!965 thiss!1379))) ((_ sign_extend 32) (currentByte!2266 thiss!1379)) ((_ sign_extend 32) (currentBit!2261 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!21678 () Bool)

(assert (=> b!21678 (= e!14695 e!14694)))

(declare-fun res!18711 () Bool)

(assert (=> b!21678 (=> res!18711 e!14694)))

(assert (=> b!21678 (= res!18711 (not (isPrefixOf!0 thiss!1379 (_2!1356 lt!31340))))))

(assert (=> b!21678 (validate_offset_bits!1 ((_ sign_extend 32) (size!650 (buf!965 (_2!1356 lt!31340)))) ((_ sign_extend 32) (currentByte!2266 (_2!1356 lt!31340))) ((_ sign_extend 32) (currentBit!2261 (_2!1356 lt!31340))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31341 () Unit!1894)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1134 BitStream!1134 (_ BitVec 64) (_ BitVec 64)) Unit!1894)

(assert (=> b!21678 (= lt!31341 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1356 lt!31340) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1134 (_ BitVec 8) (_ BitVec 32)) tuple2!2542)

(assert (=> b!21678 (= lt!31340 (appendBitFromByte!0 thiss!1379 (select (arr!1100 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!21679 () Bool)

(declare-fun res!18715 () Bool)

(assert (=> b!21679 (=> res!18715 e!14697)))

(assert (=> b!21679 (= res!18715 (not (= (size!650 (buf!965 thiss!1379)) (size!650 (buf!965 (_2!1356 lt!31342))))))))

(declare-fun b!21680 () Bool)

(declare-datatypes ((List!268 0))(
  ( (Nil!265) (Cons!264 (h!383 Bool) (t!1018 List!268)) )
))
(declare-fun head!105 (List!268) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1134 array!1525 (_ BitVec 64) (_ BitVec 64)) List!268)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1134 BitStream!1134 (_ BitVec 64)) List!268)

(assert (=> b!21680 (= e!14693 (= (head!105 (byteArrayBitContentToList!0 (_2!1356 lt!31340) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!105 (bitStreamReadBitsIntoList!0 (_2!1356 lt!31340) (_1!1357 lt!31339) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5376 res!18719) b!21677))

(assert (= (and b!21677 res!18717) b!21672))

(assert (= (and b!21672 (not res!18716)) b!21678))

(assert (= (and b!21678 (not res!18711)) b!21676))

(assert (= (and b!21676 res!18718) b!21680))

(assert (= (and b!21676 (not res!18714)) b!21673))

(assert (= (and b!21673 (not res!18713)) b!21675))

(assert (= (and b!21675 (not res!18712)) b!21679))

(assert (= (and b!21679 (not res!18715)) b!21671))

(assert (= start!5376 b!21674))

(declare-fun m!30005 () Bool)

(assert (=> b!21673 m!30005))

(declare-fun m!30007 () Bool)

(assert (=> start!5376 m!30007))

(declare-fun m!30009 () Bool)

(assert (=> start!5376 m!30009))

(declare-fun m!30011 () Bool)

(assert (=> b!21678 m!30011))

(declare-fun m!30013 () Bool)

(assert (=> b!21678 m!30013))

(declare-fun m!30015 () Bool)

(assert (=> b!21678 m!30015))

(assert (=> b!21678 m!30011))

(declare-fun m!30017 () Bool)

(assert (=> b!21678 m!30017))

(declare-fun m!30019 () Bool)

(assert (=> b!21678 m!30019))

(declare-fun m!30021 () Bool)

(assert (=> b!21680 m!30021))

(assert (=> b!21680 m!30021))

(declare-fun m!30023 () Bool)

(assert (=> b!21680 m!30023))

(declare-fun m!30025 () Bool)

(assert (=> b!21680 m!30025))

(assert (=> b!21680 m!30025))

(declare-fun m!30027 () Bool)

(assert (=> b!21680 m!30027))

(declare-fun m!30029 () Bool)

(assert (=> b!21674 m!30029))

(declare-fun m!30031 () Bool)

(assert (=> b!21677 m!30031))

(declare-fun m!30033 () Bool)

(assert (=> b!21675 m!30033))

(declare-fun m!30035 () Bool)

(assert (=> b!21676 m!30035))

(declare-fun m!30037 () Bool)

(assert (=> b!21676 m!30037))

(declare-fun m!30039 () Bool)

(assert (=> b!21676 m!30039))

(declare-fun m!30041 () Bool)

(assert (=> b!21676 m!30041))

(declare-fun m!30043 () Bool)

(assert (=> b!21676 m!30043))

(declare-fun m!30045 () Bool)

(assert (=> b!21676 m!30045))

(declare-fun m!30047 () Bool)

(assert (=> b!21676 m!30047))

(declare-fun m!30049 () Bool)

(assert (=> b!21672 m!30049))

(declare-fun m!30051 () Bool)

(assert (=> b!21672 m!30051))

(declare-fun m!30053 () Bool)

(assert (=> b!21672 m!30053))

(check-sat (not b!21676) (not b!21674) (not b!21672) (not b!21675) (not b!21680) (not b!21678) (not b!21677) (not b!21673) (not start!5376))
