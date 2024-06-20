; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54082 () Bool)

(assert start!54082)

(declare-fun b!251998 () Bool)

(declare-fun e!174617 () Bool)

(declare-fun e!174612 () Bool)

(assert (=> b!251998 (= e!174617 e!174612)))

(declare-fun res!211093 () Bool)

(assert (=> b!251998 (=> (not res!211093) (not e!174612))))

(declare-fun lt!391472 () (_ BitVec 64))

(declare-datatypes ((array!13706 0))(
  ( (array!13707 (arr!6999 (Array (_ BitVec 32) (_ BitVec 8))) (size!6012 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10946 0))(
  ( (BitStream!10947 (buf!6514 array!13706) (currentByte!11969 (_ BitVec 32)) (currentBit!11964 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18172 0))(
  ( (Unit!18173) )
))
(declare-datatypes ((tuple2!21642 0))(
  ( (tuple2!21643 (_1!11749 Unit!18172) (_2!11749 BitStream!10946)) )
))
(declare-fun lt!391471 () tuple2!21642)

(declare-fun lt!391462 () tuple2!21642)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251998 (= res!211093 (= (bitIndex!0 (size!6012 (buf!6514 (_2!11749 lt!391471))) (currentByte!11969 (_2!11749 lt!391471)) (currentBit!11964 (_2!11749 lt!391471))) (bvadd (bitIndex!0 (size!6012 (buf!6514 (_2!11749 lt!391462))) (currentByte!11969 (_2!11749 lt!391462)) (currentBit!11964 (_2!11749 lt!391462))) lt!391472)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!251998 (= lt!391472 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251999 () Bool)

(declare-fun e!174620 () Bool)

(declare-fun e!174613 () Bool)

(assert (=> b!251999 (= e!174620 e!174613)))

(declare-fun res!211087 () Bool)

(assert (=> b!251999 (=> (not res!211087) (not e!174613))))

(declare-fun lt!391473 () (_ BitVec 64))

(declare-fun lt!391463 () (_ BitVec 64))

(assert (=> b!251999 (= res!211087 (= lt!391473 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391463)))))

(assert (=> b!251999 (= lt!391473 (bitIndex!0 (size!6012 (buf!6514 (_2!11749 lt!391462))) (currentByte!11969 (_2!11749 lt!391462)) (currentBit!11964 (_2!11749 lt!391462))))))

(declare-fun thiss!1005 () BitStream!10946)

(assert (=> b!251999 (= lt!391463 (bitIndex!0 (size!6012 (buf!6514 thiss!1005)) (currentByte!11969 thiss!1005) (currentBit!11964 thiss!1005)))))

(declare-fun b!252000 () Bool)

(declare-fun e!174615 () Bool)

(declare-datatypes ((tuple2!21644 0))(
  ( (tuple2!21645 (_1!11750 BitStream!10946) (_2!11750 Bool)) )
))
(declare-fun lt!391468 () tuple2!21644)

(assert (=> b!252000 (= e!174615 (= (bitIndex!0 (size!6012 (buf!6514 (_1!11750 lt!391468))) (currentByte!11969 (_1!11750 lt!391468)) (currentBit!11964 (_1!11750 lt!391468))) lt!391473))))

(declare-fun b!252001 () Bool)

(declare-fun e!174616 () Bool)

(declare-fun array_inv!5753 (array!13706) Bool)

(assert (=> b!252001 (= e!174616 (array_inv!5753 (buf!6514 thiss!1005)))))

(declare-fun b!252002 () Bool)

(declare-fun res!211088 () Bool)

(assert (=> b!252002 (=> (not res!211088) (not e!174612))))

(declare-fun isPrefixOf!0 (BitStream!10946 BitStream!10946) Bool)

(assert (=> b!252002 (= res!211088 (isPrefixOf!0 (_2!11749 lt!391462) (_2!11749 lt!391471)))))

(declare-fun b!252003 () Bool)

(declare-fun res!211091 () Bool)

(assert (=> b!252003 (=> (not res!211091) (not e!174613))))

(assert (=> b!252003 (= res!211091 (isPrefixOf!0 thiss!1005 (_2!11749 lt!391462)))))

(declare-fun b!252004 () Bool)

(declare-fun e!174614 () Bool)

(declare-fun lt!391475 () tuple2!21644)

(declare-fun lt!391470 () tuple2!21644)

(assert (=> b!252004 (= e!174614 (= (_2!11750 lt!391475) (_2!11750 lt!391470)))))

(declare-fun b!252005 () Bool)

(declare-fun res!211089 () Bool)

(declare-fun e!174619 () Bool)

(assert (=> b!252005 (=> (not res!211089) (not e!174619))))

(assert (=> b!252005 (= res!211089 (bvslt from!289 nBits!297))))

(declare-fun res!211090 () Bool)

(assert (=> start!54082 (=> (not res!211090) (not e!174619))))

(assert (=> start!54082 (= res!211090 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54082 e!174619))

(assert (=> start!54082 true))

(declare-fun inv!12 (BitStream!10946) Bool)

(assert (=> start!54082 (and (inv!12 thiss!1005) e!174616)))

(declare-fun b!252006 () Bool)

(assert (=> b!252006 (= e!174619 (not (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!21646 0))(
  ( (tuple2!21647 (_1!11751 BitStream!10946) (_2!11751 BitStream!10946)) )
))
(declare-fun lt!391469 () tuple2!21646)

(declare-fun lt!391465 () tuple2!21644)

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10946 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21644)

(assert (=> b!252006 (= lt!391465 (checkBitsLoopPure!0 (_1!11751 lt!391469) nBits!297 bit!26 from!289))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252006 (validate_offset_bits!1 ((_ sign_extend 32) (size!6012 (buf!6514 (_2!11749 lt!391471)))) ((_ sign_extend 32) (currentByte!11969 thiss!1005)) ((_ sign_extend 32) (currentBit!11964 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!391461 () Unit!18172)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10946 array!13706 (_ BitVec 64)) Unit!18172)

(assert (=> b!252006 (= lt!391461 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6514 (_2!11749 lt!391471)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10946) tuple2!21644)

(assert (=> b!252006 (= (_2!11750 (readBitPure!0 (_1!11751 lt!391469))) bit!26)))

(declare-fun lt!391467 () tuple2!21646)

(declare-fun reader!0 (BitStream!10946 BitStream!10946) tuple2!21646)

(assert (=> b!252006 (= lt!391467 (reader!0 (_2!11749 lt!391462) (_2!11749 lt!391471)))))

(assert (=> b!252006 (= lt!391469 (reader!0 thiss!1005 (_2!11749 lt!391471)))))

(assert (=> b!252006 e!174614))

(declare-fun res!211095 () Bool)

(assert (=> b!252006 (=> (not res!211095) (not e!174614))))

(assert (=> b!252006 (= res!211095 (= (bitIndex!0 (size!6012 (buf!6514 (_1!11750 lt!391475))) (currentByte!11969 (_1!11750 lt!391475)) (currentBit!11964 (_1!11750 lt!391475))) (bitIndex!0 (size!6012 (buf!6514 (_1!11750 lt!391470))) (currentByte!11969 (_1!11750 lt!391470)) (currentBit!11964 (_1!11750 lt!391470)))))))

(declare-fun lt!391474 () Unit!18172)

(declare-fun lt!391476 () BitStream!10946)

(declare-fun readBitPrefixLemma!0 (BitStream!10946 BitStream!10946) Unit!18172)

(assert (=> b!252006 (= lt!391474 (readBitPrefixLemma!0 lt!391476 (_2!11749 lt!391471)))))

(assert (=> b!252006 (= lt!391470 (readBitPure!0 (BitStream!10947 (buf!6514 (_2!11749 lt!391471)) (currentByte!11969 thiss!1005) (currentBit!11964 thiss!1005))))))

(assert (=> b!252006 (= lt!391475 (readBitPure!0 lt!391476))))

(assert (=> b!252006 (= lt!391476 (BitStream!10947 (buf!6514 (_2!11749 lt!391462)) (currentByte!11969 thiss!1005) (currentBit!11964 thiss!1005)))))

(declare-fun e!174618 () Bool)

(assert (=> b!252006 e!174618))

(declare-fun res!211085 () Bool)

(assert (=> b!252006 (=> (not res!211085) (not e!174618))))

(assert (=> b!252006 (= res!211085 (isPrefixOf!0 thiss!1005 (_2!11749 lt!391471)))))

(declare-fun lt!391464 () Unit!18172)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10946 BitStream!10946 BitStream!10946) Unit!18172)

(assert (=> b!252006 (= lt!391464 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11749 lt!391462) (_2!11749 lt!391471)))))

(assert (=> b!252006 e!174617))

(declare-fun res!211086 () Bool)

(assert (=> b!252006 (=> (not res!211086) (not e!174617))))

(assert (=> b!252006 (= res!211086 (= (size!6012 (buf!6514 (_2!11749 lt!391462))) (size!6012 (buf!6514 (_2!11749 lt!391471)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10946 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21642)

(assert (=> b!252006 (= lt!391471 (appendNBitsLoop!0 (_2!11749 lt!391462) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252006 (validate_offset_bits!1 ((_ sign_extend 32) (size!6012 (buf!6514 (_2!11749 lt!391462)))) ((_ sign_extend 32) (currentByte!11969 (_2!11749 lt!391462))) ((_ sign_extend 32) (currentBit!11964 (_2!11749 lt!391462))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391479 () Unit!18172)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10946 BitStream!10946 (_ BitVec 64) (_ BitVec 64)) Unit!18172)

(assert (=> b!252006 (= lt!391479 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11749 lt!391462) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!252006 e!174620))

(declare-fun res!211084 () Bool)

(assert (=> b!252006 (=> (not res!211084) (not e!174620))))

(assert (=> b!252006 (= res!211084 (= (size!6012 (buf!6514 thiss!1005)) (size!6012 (buf!6514 (_2!11749 lt!391462)))))))

(declare-fun appendBit!0 (BitStream!10946 Bool) tuple2!21642)

(assert (=> b!252006 (= lt!391462 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252007 () Bool)

(declare-fun res!211092 () Bool)

(assert (=> b!252007 (=> (not res!211092) (not e!174618))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252007 (= res!211092 (invariant!0 (currentBit!11964 thiss!1005) (currentByte!11969 thiss!1005) (size!6012 (buf!6514 (_2!11749 lt!391462)))))))

(declare-fun b!252008 () Bool)

(assert (=> b!252008 (= e!174613 e!174615)))

(declare-fun res!211083 () Bool)

(assert (=> b!252008 (=> (not res!211083) (not e!174615))))

(assert (=> b!252008 (= res!211083 (and (= (_2!11750 lt!391468) bit!26) (= (_1!11750 lt!391468) (_2!11749 lt!391462))))))

(declare-fun readerFrom!0 (BitStream!10946 (_ BitVec 32) (_ BitVec 32)) BitStream!10946)

(assert (=> b!252008 (= lt!391468 (readBitPure!0 (readerFrom!0 (_2!11749 lt!391462) (currentBit!11964 thiss!1005) (currentByte!11969 thiss!1005))))))

(declare-fun b!252009 () Bool)

(assert (=> b!252009 (= e!174618 (invariant!0 (currentBit!11964 thiss!1005) (currentByte!11969 thiss!1005) (size!6012 (buf!6514 (_2!11749 lt!391471)))))))

(declare-fun b!252010 () Bool)

(declare-fun lt!391477 () tuple2!21644)

(declare-fun lt!391466 () tuple2!21646)

(assert (=> b!252010 (= e!174612 (not (or (not (_2!11750 lt!391477)) (not (= (_1!11750 lt!391477) (_2!11751 lt!391466))))))))

(assert (=> b!252010 (= lt!391477 (checkBitsLoopPure!0 (_1!11751 lt!391466) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252010 (validate_offset_bits!1 ((_ sign_extend 32) (size!6012 (buf!6514 (_2!11749 lt!391471)))) ((_ sign_extend 32) (currentByte!11969 (_2!11749 lt!391462))) ((_ sign_extend 32) (currentBit!11964 (_2!11749 lt!391462))) lt!391472)))

(declare-fun lt!391478 () Unit!18172)

(assert (=> b!252010 (= lt!391478 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11749 lt!391462) (buf!6514 (_2!11749 lt!391471)) lt!391472))))

(assert (=> b!252010 (= lt!391466 (reader!0 (_2!11749 lt!391462) (_2!11749 lt!391471)))))

(declare-fun b!252011 () Bool)

(declare-fun res!211094 () Bool)

(assert (=> b!252011 (=> (not res!211094) (not e!174619))))

(assert (=> b!252011 (= res!211094 (validate_offset_bits!1 ((_ sign_extend 32) (size!6012 (buf!6514 thiss!1005))) ((_ sign_extend 32) (currentByte!11969 thiss!1005)) ((_ sign_extend 32) (currentBit!11964 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!54082 res!211090) b!252011))

(assert (= (and b!252011 res!211094) b!252005))

(assert (= (and b!252005 res!211089) b!252006))

(assert (= (and b!252006 res!211084) b!251999))

(assert (= (and b!251999 res!211087) b!252003))

(assert (= (and b!252003 res!211091) b!252008))

(assert (= (and b!252008 res!211083) b!252000))

(assert (= (and b!252006 res!211086) b!251998))

(assert (= (and b!251998 res!211093) b!252002))

(assert (= (and b!252002 res!211088) b!252010))

(assert (= (and b!252006 res!211085) b!252007))

(assert (= (and b!252007 res!211092) b!252009))

(assert (= (and b!252006 res!211095) b!252004))

(assert (= start!54082 b!252001))

(declare-fun m!379119 () Bool)

(assert (=> start!54082 m!379119))

(declare-fun m!379121 () Bool)

(assert (=> b!252007 m!379121))

(declare-fun m!379123 () Bool)

(assert (=> b!252008 m!379123))

(assert (=> b!252008 m!379123))

(declare-fun m!379125 () Bool)

(assert (=> b!252008 m!379125))

(declare-fun m!379127 () Bool)

(assert (=> b!252001 m!379127))

(declare-fun m!379129 () Bool)

(assert (=> b!252011 m!379129))

(declare-fun m!379131 () Bool)

(assert (=> b!252003 m!379131))

(declare-fun m!379133 () Bool)

(assert (=> b!252002 m!379133))

(declare-fun m!379135 () Bool)

(assert (=> b!252009 m!379135))

(declare-fun m!379137 () Bool)

(assert (=> b!252010 m!379137))

(declare-fun m!379139 () Bool)

(assert (=> b!252010 m!379139))

(declare-fun m!379141 () Bool)

(assert (=> b!252010 m!379141))

(declare-fun m!379143 () Bool)

(assert (=> b!252010 m!379143))

(declare-fun m!379145 () Bool)

(assert (=> b!251998 m!379145))

(declare-fun m!379147 () Bool)

(assert (=> b!251998 m!379147))

(declare-fun m!379149 () Bool)

(assert (=> b!252000 m!379149))

(assert (=> b!251999 m!379147))

(declare-fun m!379151 () Bool)

(assert (=> b!251999 m!379151))

(declare-fun m!379153 () Bool)

(assert (=> b!252006 m!379153))

(declare-fun m!379155 () Bool)

(assert (=> b!252006 m!379155))

(declare-fun m!379157 () Bool)

(assert (=> b!252006 m!379157))

(declare-fun m!379159 () Bool)

(assert (=> b!252006 m!379159))

(declare-fun m!379161 () Bool)

(assert (=> b!252006 m!379161))

(declare-fun m!379163 () Bool)

(assert (=> b!252006 m!379163))

(declare-fun m!379165 () Bool)

(assert (=> b!252006 m!379165))

(declare-fun m!379167 () Bool)

(assert (=> b!252006 m!379167))

(declare-fun m!379169 () Bool)

(assert (=> b!252006 m!379169))

(assert (=> b!252006 m!379143))

(declare-fun m!379171 () Bool)

(assert (=> b!252006 m!379171))

(declare-fun m!379173 () Bool)

(assert (=> b!252006 m!379173))

(declare-fun m!379175 () Bool)

(assert (=> b!252006 m!379175))

(declare-fun m!379177 () Bool)

(assert (=> b!252006 m!379177))

(declare-fun m!379179 () Bool)

(assert (=> b!252006 m!379179))

(declare-fun m!379181 () Bool)

(assert (=> b!252006 m!379181))

(declare-fun m!379183 () Bool)

(assert (=> b!252006 m!379183))

(push 1)

(assert (not b!252010))

(assert (not b!251998))

(assert (not b!252002))

(assert (not b!252003))

(assert (not b!252007))

(assert (not b!252011))

(assert (not b!252006))

(assert (not b!252000))

(assert (not b!252001))

(assert (not b!252008))

(assert (not b!252009))

(assert (not b!251999))

(assert (not start!54082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

