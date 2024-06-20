; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54092 () Bool)

(assert start!54092)

(declare-fun b!252209 () Bool)

(declare-fun res!211286 () Bool)

(declare-fun e!174764 () Bool)

(assert (=> b!252209 (=> (not res!211286) (not e!174764))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!252209 (= res!211286 (bvslt from!289 nBits!297))))

(declare-fun b!252210 () Bool)

(declare-fun res!211280 () Bool)

(declare-fun e!174761 () Bool)

(assert (=> b!252210 (=> (not res!211280) (not e!174761))))

(declare-datatypes ((array!13716 0))(
  ( (array!13717 (arr!7004 (Array (_ BitVec 32) (_ BitVec 8))) (size!6017 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10956 0))(
  ( (BitStream!10957 (buf!6519 array!13716) (currentByte!11974 (_ BitVec 32)) (currentBit!11969 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10956)

(declare-datatypes ((Unit!18182 0))(
  ( (Unit!18183) )
))
(declare-datatypes ((tuple2!21672 0))(
  ( (tuple2!21673 (_1!11764 Unit!18182) (_2!11764 BitStream!10956)) )
))
(declare-fun lt!391769 () tuple2!21672)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252210 (= res!211280 (invariant!0 (currentBit!11969 thiss!1005) (currentByte!11974 thiss!1005) (size!6017 (buf!6519 (_2!11764 lt!391769)))))))

(declare-fun b!252211 () Bool)

(declare-fun res!211283 () Bool)

(declare-fun e!174763 () Bool)

(assert (=> b!252211 (=> (not res!211283) (not e!174763))))

(declare-fun lt!391768 () tuple2!21672)

(declare-fun isPrefixOf!0 (BitStream!10956 BitStream!10956) Bool)

(assert (=> b!252211 (= res!211283 (isPrefixOf!0 (_2!11764 lt!391769) (_2!11764 lt!391768)))))

(declare-fun b!252212 () Bool)

(declare-fun res!211278 () Bool)

(declare-fun e!174769 () Bool)

(assert (=> b!252212 (=> (not res!211278) (not e!174769))))

(assert (=> b!252212 (= res!211278 (isPrefixOf!0 thiss!1005 (_2!11764 lt!391769)))))

(declare-fun b!252213 () Bool)

(declare-fun e!174766 () Bool)

(declare-fun array_inv!5758 (array!13716) Bool)

(assert (=> b!252213 (= e!174766 (array_inv!5758 (buf!6519 thiss!1005)))))

(declare-fun b!252214 () Bool)

(declare-fun e!174765 () Bool)

(declare-datatypes ((tuple2!21674 0))(
  ( (tuple2!21675 (_1!11765 BitStream!10956) (_2!11765 Bool)) )
))
(declare-fun lt!391765 () tuple2!21674)

(declare-fun lt!391764 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252214 (= e!174765 (= (bitIndex!0 (size!6017 (buf!6519 (_1!11765 lt!391765))) (currentByte!11974 (_1!11765 lt!391765)) (currentBit!11969 (_1!11765 lt!391765))) lt!391764))))

(declare-fun b!252215 () Bool)

(assert (=> b!252215 (= e!174769 e!174765)))

(declare-fun res!211288 () Bool)

(assert (=> b!252215 (=> (not res!211288) (not e!174765))))

(declare-fun bit!26 () Bool)

(assert (=> b!252215 (= res!211288 (and (= (_2!11765 lt!391765) bit!26) (= (_1!11765 lt!391765) (_2!11764 lt!391769))))))

(declare-fun readBitPure!0 (BitStream!10956) tuple2!21674)

(declare-fun readerFrom!0 (BitStream!10956 (_ BitVec 32) (_ BitVec 32)) BitStream!10956)

(assert (=> b!252215 (= lt!391765 (readBitPure!0 (readerFrom!0 (_2!11764 lt!391769) (currentBit!11969 thiss!1005) (currentByte!11974 thiss!1005))))))

(declare-fun b!252216 () Bool)

(declare-fun lt!391773 () tuple2!21674)

(declare-datatypes ((tuple2!21676 0))(
  ( (tuple2!21677 (_1!11766 BitStream!10956) (_2!11766 BitStream!10956)) )
))
(declare-fun lt!391780 () tuple2!21676)

(assert (=> b!252216 (= e!174763 (not (or (not (_2!11765 lt!391773)) (not (= (_1!11765 lt!391773) (_2!11766 lt!391780))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10956 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21674)

(assert (=> b!252216 (= lt!391773 (checkBitsLoopPure!0 (_1!11766 lt!391780) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!391770 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252216 (validate_offset_bits!1 ((_ sign_extend 32) (size!6017 (buf!6519 (_2!11764 lt!391768)))) ((_ sign_extend 32) (currentByte!11974 (_2!11764 lt!391769))) ((_ sign_extend 32) (currentBit!11969 (_2!11764 lt!391769))) lt!391770)))

(declare-fun lt!391775 () Unit!18182)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10956 array!13716 (_ BitVec 64)) Unit!18182)

(assert (=> b!252216 (= lt!391775 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11764 lt!391769) (buf!6519 (_2!11764 lt!391768)) lt!391770))))

(declare-fun reader!0 (BitStream!10956 BitStream!10956) tuple2!21676)

(assert (=> b!252216 (= lt!391780 (reader!0 (_2!11764 lt!391769) (_2!11764 lt!391768)))))

(declare-fun b!252217 () Bool)

(declare-fun e!174770 () Bool)

(assert (=> b!252217 (= e!174770 e!174769)))

(declare-fun res!211279 () Bool)

(assert (=> b!252217 (=> (not res!211279) (not e!174769))))

(declare-fun lt!391766 () (_ BitVec 64))

(assert (=> b!252217 (= res!211279 (= lt!391764 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391766)))))

(assert (=> b!252217 (= lt!391764 (bitIndex!0 (size!6017 (buf!6519 (_2!11764 lt!391769))) (currentByte!11974 (_2!11764 lt!391769)) (currentBit!11969 (_2!11764 lt!391769))))))

(assert (=> b!252217 (= lt!391766 (bitIndex!0 (size!6017 (buf!6519 thiss!1005)) (currentByte!11974 thiss!1005) (currentBit!11969 thiss!1005)))))

(declare-fun b!252218 () Bool)

(assert (=> b!252218 (= e!174761 (invariant!0 (currentBit!11969 thiss!1005) (currentByte!11974 thiss!1005) (size!6017 (buf!6519 (_2!11764 lt!391768)))))))

(declare-fun b!252219 () Bool)

(declare-fun e!174767 () Bool)

(declare-fun lt!391772 () tuple2!21674)

(declare-fun lt!391778 () tuple2!21674)

(assert (=> b!252219 (= e!174767 (= (_2!11765 lt!391772) (_2!11765 lt!391778)))))

(declare-fun b!252208 () Bool)

(assert (=> b!252208 (= e!174764 (not true))))

(declare-fun lt!391782 () tuple2!21674)

(declare-fun lt!391771 () tuple2!21676)

(assert (=> b!252208 (= lt!391782 (checkBitsLoopPure!0 (_1!11766 lt!391771) nBits!297 bit!26 from!289))))

(assert (=> b!252208 (validate_offset_bits!1 ((_ sign_extend 32) (size!6017 (buf!6519 (_2!11764 lt!391768)))) ((_ sign_extend 32) (currentByte!11974 thiss!1005)) ((_ sign_extend 32) (currentBit!11969 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!391774 () Unit!18182)

(assert (=> b!252208 (= lt!391774 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6519 (_2!11764 lt!391768)) (bvsub nBits!297 from!289)))))

(assert (=> b!252208 (= (_2!11765 (readBitPure!0 (_1!11766 lt!391771))) bit!26)))

(declare-fun lt!391767 () tuple2!21676)

(assert (=> b!252208 (= lt!391767 (reader!0 (_2!11764 lt!391769) (_2!11764 lt!391768)))))

(assert (=> b!252208 (= lt!391771 (reader!0 thiss!1005 (_2!11764 lt!391768)))))

(assert (=> b!252208 e!174767))

(declare-fun res!211287 () Bool)

(assert (=> b!252208 (=> (not res!211287) (not e!174767))))

(assert (=> b!252208 (= res!211287 (= (bitIndex!0 (size!6017 (buf!6519 (_1!11765 lt!391772))) (currentByte!11974 (_1!11765 lt!391772)) (currentBit!11969 (_1!11765 lt!391772))) (bitIndex!0 (size!6017 (buf!6519 (_1!11765 lt!391778))) (currentByte!11974 (_1!11765 lt!391778)) (currentBit!11969 (_1!11765 lt!391778)))))))

(declare-fun lt!391777 () Unit!18182)

(declare-fun lt!391781 () BitStream!10956)

(declare-fun readBitPrefixLemma!0 (BitStream!10956 BitStream!10956) Unit!18182)

(assert (=> b!252208 (= lt!391777 (readBitPrefixLemma!0 lt!391781 (_2!11764 lt!391768)))))

(assert (=> b!252208 (= lt!391778 (readBitPure!0 (BitStream!10957 (buf!6519 (_2!11764 lt!391768)) (currentByte!11974 thiss!1005) (currentBit!11969 thiss!1005))))))

(assert (=> b!252208 (= lt!391772 (readBitPure!0 lt!391781))))

(assert (=> b!252208 (= lt!391781 (BitStream!10957 (buf!6519 (_2!11764 lt!391769)) (currentByte!11974 thiss!1005) (currentBit!11969 thiss!1005)))))

(assert (=> b!252208 e!174761))

(declare-fun res!211285 () Bool)

(assert (=> b!252208 (=> (not res!211285) (not e!174761))))

(assert (=> b!252208 (= res!211285 (isPrefixOf!0 thiss!1005 (_2!11764 lt!391768)))))

(declare-fun lt!391779 () Unit!18182)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10956 BitStream!10956 BitStream!10956) Unit!18182)

(assert (=> b!252208 (= lt!391779 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11764 lt!391769) (_2!11764 lt!391768)))))

(declare-fun e!174768 () Bool)

(assert (=> b!252208 e!174768))

(declare-fun res!211289 () Bool)

(assert (=> b!252208 (=> (not res!211289) (not e!174768))))

(assert (=> b!252208 (= res!211289 (= (size!6017 (buf!6519 (_2!11764 lt!391769))) (size!6017 (buf!6519 (_2!11764 lt!391768)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10956 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21672)

(assert (=> b!252208 (= lt!391768 (appendNBitsLoop!0 (_2!11764 lt!391769) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252208 (validate_offset_bits!1 ((_ sign_extend 32) (size!6017 (buf!6519 (_2!11764 lt!391769)))) ((_ sign_extend 32) (currentByte!11974 (_2!11764 lt!391769))) ((_ sign_extend 32) (currentBit!11969 (_2!11764 lt!391769))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391776 () Unit!18182)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10956 BitStream!10956 (_ BitVec 64) (_ BitVec 64)) Unit!18182)

(assert (=> b!252208 (= lt!391776 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11764 lt!391769) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!252208 e!174770))

(declare-fun res!211282 () Bool)

(assert (=> b!252208 (=> (not res!211282) (not e!174770))))

(assert (=> b!252208 (= res!211282 (= (size!6017 (buf!6519 thiss!1005)) (size!6017 (buf!6519 (_2!11764 lt!391769)))))))

(declare-fun appendBit!0 (BitStream!10956 Bool) tuple2!21672)

(assert (=> b!252208 (= lt!391769 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!211290 () Bool)

(assert (=> start!54092 (=> (not res!211290) (not e!174764))))

(assert (=> start!54092 (= res!211290 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54092 e!174764))

(assert (=> start!54092 true))

(declare-fun inv!12 (BitStream!10956) Bool)

(assert (=> start!54092 (and (inv!12 thiss!1005) e!174766)))

(declare-fun b!252220 () Bool)

(assert (=> b!252220 (= e!174768 e!174763)))

(declare-fun res!211284 () Bool)

(assert (=> b!252220 (=> (not res!211284) (not e!174763))))

(assert (=> b!252220 (= res!211284 (= (bitIndex!0 (size!6017 (buf!6519 (_2!11764 lt!391768))) (currentByte!11974 (_2!11764 lt!391768)) (currentBit!11969 (_2!11764 lt!391768))) (bvadd (bitIndex!0 (size!6017 (buf!6519 (_2!11764 lt!391769))) (currentByte!11974 (_2!11764 lt!391769)) (currentBit!11969 (_2!11764 lt!391769))) lt!391770)))))

(assert (=> b!252220 (= lt!391770 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252221 () Bool)

(declare-fun res!211281 () Bool)

(assert (=> b!252221 (=> (not res!211281) (not e!174764))))

(assert (=> b!252221 (= res!211281 (validate_offset_bits!1 ((_ sign_extend 32) (size!6017 (buf!6519 thiss!1005))) ((_ sign_extend 32) (currentByte!11974 thiss!1005)) ((_ sign_extend 32) (currentBit!11969 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!54092 res!211290) b!252221))

(assert (= (and b!252221 res!211281) b!252209))

(assert (= (and b!252209 res!211286) b!252208))

(assert (= (and b!252208 res!211282) b!252217))

(assert (= (and b!252217 res!211279) b!252212))

(assert (= (and b!252212 res!211278) b!252215))

(assert (= (and b!252215 res!211288) b!252214))

(assert (= (and b!252208 res!211289) b!252220))

(assert (= (and b!252220 res!211284) b!252211))

(assert (= (and b!252211 res!211283) b!252216))

(assert (= (and b!252208 res!211285) b!252210))

(assert (= (and b!252210 res!211280) b!252218))

(assert (= (and b!252208 res!211287) b!252219))

(assert (= start!54092 b!252213))

(declare-fun m!379449 () Bool)

(assert (=> b!252220 m!379449))

(declare-fun m!379451 () Bool)

(assert (=> b!252220 m!379451))

(assert (=> b!252217 m!379451))

(declare-fun m!379453 () Bool)

(assert (=> b!252217 m!379453))

(declare-fun m!379455 () Bool)

(assert (=> b!252212 m!379455))

(declare-fun m!379457 () Bool)

(assert (=> b!252215 m!379457))

(assert (=> b!252215 m!379457))

(declare-fun m!379459 () Bool)

(assert (=> b!252215 m!379459))

(declare-fun m!379461 () Bool)

(assert (=> b!252211 m!379461))

(declare-fun m!379463 () Bool)

(assert (=> b!252221 m!379463))

(declare-fun m!379465 () Bool)

(assert (=> b!252208 m!379465))

(declare-fun m!379467 () Bool)

(assert (=> b!252208 m!379467))

(declare-fun m!379469 () Bool)

(assert (=> b!252208 m!379469))

(declare-fun m!379471 () Bool)

(assert (=> b!252208 m!379471))

(declare-fun m!379473 () Bool)

(assert (=> b!252208 m!379473))

(declare-fun m!379475 () Bool)

(assert (=> b!252208 m!379475))

(declare-fun m!379477 () Bool)

(assert (=> b!252208 m!379477))

(declare-fun m!379479 () Bool)

(assert (=> b!252208 m!379479))

(declare-fun m!379481 () Bool)

(assert (=> b!252208 m!379481))

(declare-fun m!379483 () Bool)

(assert (=> b!252208 m!379483))

(declare-fun m!379485 () Bool)

(assert (=> b!252208 m!379485))

(declare-fun m!379487 () Bool)

(assert (=> b!252208 m!379487))

(declare-fun m!379489 () Bool)

(assert (=> b!252208 m!379489))

(declare-fun m!379491 () Bool)

(assert (=> b!252208 m!379491))

(declare-fun m!379493 () Bool)

(assert (=> b!252208 m!379493))

(declare-fun m!379495 () Bool)

(assert (=> b!252208 m!379495))

(declare-fun m!379497 () Bool)

(assert (=> b!252208 m!379497))

(declare-fun m!379499 () Bool)

(assert (=> b!252213 m!379499))

(declare-fun m!379501 () Bool)

(assert (=> b!252216 m!379501))

(declare-fun m!379503 () Bool)

(assert (=> b!252216 m!379503))

(declare-fun m!379505 () Bool)

(assert (=> b!252216 m!379505))

(assert (=> b!252216 m!379487))

(declare-fun m!379507 () Bool)

(assert (=> b!252218 m!379507))

(declare-fun m!379509 () Bool)

(assert (=> start!54092 m!379509))

(declare-fun m!379511 () Bool)

(assert (=> b!252210 m!379511))

(declare-fun m!379513 () Bool)

(assert (=> b!252214 m!379513))

(check-sat (not b!252213) (not b!252215) (not b!252221) (not b!252217) (not b!252216) (not b!252220) (not b!252214) (not b!252210) (not b!252212) (not b!252211) (not b!252218) (not b!252208) (not start!54092))
