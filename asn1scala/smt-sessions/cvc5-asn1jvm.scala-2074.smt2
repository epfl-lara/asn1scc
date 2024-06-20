; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52502 () Bool)

(assert start!52502)

(declare-fun b!242557 () Bool)

(declare-fun e!168167 () Bool)

(declare-datatypes ((array!13313 0))(
  ( (array!13314 (arr!6823 (Array (_ BitVec 32) (_ BitVec 8))) (size!5836 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10594 0))(
  ( (BitStream!10595 (buf!6302 array!13313) (currentByte!11665 (_ BitVec 32)) (currentBit!11660 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20766 0))(
  ( (tuple2!20767 (_1!11305 BitStream!10594) (_2!11305 Bool)) )
))
(declare-fun lt!377999 () tuple2!20766)

(declare-fun lt!377998 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242557 (= e!168167 (= (bitIndex!0 (size!5836 (buf!6302 (_1!11305 lt!377999))) (currentByte!11665 (_1!11305 lt!377999)) (currentBit!11660 (_1!11305 lt!377999))) lt!377998))))

(declare-fun b!242558 () Bool)

(declare-fun res!202581 () Bool)

(declare-fun e!168163 () Bool)

(assert (=> b!242558 (=> (not res!202581) (not e!168163))))

(declare-fun thiss!1005 () BitStream!10594)

(declare-datatypes ((Unit!17755 0))(
  ( (Unit!17756) )
))
(declare-datatypes ((tuple2!20768 0))(
  ( (tuple2!20769 (_1!11306 Unit!17755) (_2!11306 BitStream!10594)) )
))
(declare-fun lt!377997 () tuple2!20768)

(declare-fun isPrefixOf!0 (BitStream!10594 BitStream!10594) Bool)

(assert (=> b!242558 (= res!202581 (isPrefixOf!0 thiss!1005 (_2!11306 lt!377997)))))

(declare-fun b!242559 () Bool)

(declare-fun res!202579 () Bool)

(declare-fun e!168165 () Bool)

(assert (=> b!242559 (=> (not res!202579) (not e!168165))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242559 (= res!202579 (invariant!0 (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005) (size!5836 (buf!6302 (_2!11306 lt!377997)))))))

(declare-fun b!242560 () Bool)

(declare-fun e!168166 () Bool)

(declare-datatypes ((tuple2!20770 0))(
  ( (tuple2!20771 (_1!11307 BitStream!10594) (_2!11307 BitStream!10594)) )
))
(declare-fun lt!378003 () tuple2!20770)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242560 (= e!168166 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11307 lt!378003)))) ((_ sign_extend 32) (currentByte!11665 (_1!11307 lt!378003))) ((_ sign_extend 32) (currentBit!11660 (_1!11307 lt!378003))))))))

(declare-fun lt!378011 () tuple2!20770)

(declare-fun lt!377996 () tuple2!20768)

(declare-fun reader!0 (BitStream!10594 BitStream!10594) tuple2!20770)

(assert (=> b!242560 (= lt!378011 (reader!0 (_2!11306 lt!377997) (_2!11306 lt!377996)))))

(assert (=> b!242560 (= lt!378003 (reader!0 thiss!1005 (_2!11306 lt!377996)))))

(declare-fun e!168161 () Bool)

(assert (=> b!242560 e!168161))

(declare-fun res!202574 () Bool)

(assert (=> b!242560 (=> (not res!202574) (not e!168161))))

(declare-fun lt!378007 () tuple2!20766)

(declare-fun lt!378010 () tuple2!20766)

(assert (=> b!242560 (= res!202574 (= (bitIndex!0 (size!5836 (buf!6302 (_1!11305 lt!378007))) (currentByte!11665 (_1!11305 lt!378007)) (currentBit!11660 (_1!11305 lt!378007))) (bitIndex!0 (size!5836 (buf!6302 (_1!11305 lt!378010))) (currentByte!11665 (_1!11305 lt!378010)) (currentBit!11660 (_1!11305 lt!378010)))))))

(declare-fun lt!378004 () Unit!17755)

(declare-fun lt!378006 () BitStream!10594)

(declare-fun readBitPrefixLemma!0 (BitStream!10594 BitStream!10594) Unit!17755)

(assert (=> b!242560 (= lt!378004 (readBitPrefixLemma!0 lt!378006 (_2!11306 lt!377996)))))

(declare-fun readBitPure!0 (BitStream!10594) tuple2!20766)

(assert (=> b!242560 (= lt!378010 (readBitPure!0 (BitStream!10595 (buf!6302 (_2!11306 lt!377996)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005))))))

(assert (=> b!242560 (= lt!378007 (readBitPure!0 lt!378006))))

(assert (=> b!242560 (= lt!378006 (BitStream!10595 (buf!6302 (_2!11306 lt!377997)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005)))))

(assert (=> b!242560 e!168165))

(declare-fun res!202576 () Bool)

(assert (=> b!242560 (=> (not res!202576) (not e!168165))))

(assert (=> b!242560 (= res!202576 (isPrefixOf!0 thiss!1005 (_2!11306 lt!377996)))))

(declare-fun lt!378009 () Unit!17755)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10594 BitStream!10594 BitStream!10594) Unit!17755)

(assert (=> b!242560 (= lt!378009 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11306 lt!377997) (_2!11306 lt!377996)))))

(declare-fun e!168170 () Bool)

(assert (=> b!242560 e!168170))

(declare-fun res!202577 () Bool)

(assert (=> b!242560 (=> (not res!202577) (not e!168170))))

(assert (=> b!242560 (= res!202577 (= (size!5836 (buf!6302 (_2!11306 lt!377997))) (size!5836 (buf!6302 (_2!11306 lt!377996)))))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10594 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20768)

(assert (=> b!242560 (= lt!377996 (appendNBitsLoop!0 (_2!11306 lt!377997) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242560 (validate_offset_bits!1 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377997)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!378005 () Unit!17755)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10594 BitStream!10594 (_ BitVec 64) (_ BitVec 64)) Unit!17755)

(assert (=> b!242560 (= lt!378005 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11306 lt!377997) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168169 () Bool)

(assert (=> b!242560 e!168169))

(declare-fun res!202573 () Bool)

(assert (=> b!242560 (=> (not res!202573) (not e!168169))))

(assert (=> b!242560 (= res!202573 (= (size!5836 (buf!6302 thiss!1005)) (size!5836 (buf!6302 (_2!11306 lt!377997)))))))

(declare-fun appendBit!0 (BitStream!10594 Bool) tuple2!20768)

(assert (=> b!242560 (= lt!377997 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242562 () Bool)

(declare-fun e!168168 () Bool)

(declare-fun lt!378002 () tuple2!20766)

(declare-fun lt!378008 () tuple2!20770)

(assert (=> b!242562 (= e!168168 (not (or (not (_2!11305 lt!378002)) (not (= (_1!11305 lt!378002) (_2!11307 lt!378008))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10594 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20766)

(assert (=> b!242562 (= lt!378002 (checkBitsLoopPure!0 (_1!11307 lt!378008) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!378000 () (_ BitVec 64))

(assert (=> b!242562 (validate_offset_bits!1 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377996)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997))) lt!378000)))

(declare-fun lt!378012 () Unit!17755)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10594 array!13313 (_ BitVec 64)) Unit!17755)

(assert (=> b!242562 (= lt!378012 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11306 lt!377997) (buf!6302 (_2!11306 lt!377996)) lt!378000))))

(assert (=> b!242562 (= lt!378008 (reader!0 (_2!11306 lt!377997) (_2!11306 lt!377996)))))

(declare-fun b!242563 () Bool)

(declare-fun e!168164 () Bool)

(declare-fun array_inv!5577 (array!13313) Bool)

(assert (=> b!242563 (= e!168164 (array_inv!5577 (buf!6302 thiss!1005)))))

(declare-fun b!242564 () Bool)

(declare-fun res!202575 () Bool)

(assert (=> b!242564 (=> (not res!202575) (not e!168166))))

(assert (=> b!242564 (= res!202575 (validate_offset_bits!1 ((_ sign_extend 32) (size!5836 (buf!6302 thiss!1005))) ((_ sign_extend 32) (currentByte!11665 thiss!1005)) ((_ sign_extend 32) (currentBit!11660 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242565 () Bool)

(assert (=> b!242565 (= e!168163 e!168167)))

(declare-fun res!202580 () Bool)

(assert (=> b!242565 (=> (not res!202580) (not e!168167))))

(assert (=> b!242565 (= res!202580 (and (= (_2!11305 lt!377999) bit!26) (= (_1!11305 lt!377999) (_2!11306 lt!377997))))))

(declare-fun readerFrom!0 (BitStream!10594 (_ BitVec 32) (_ BitVec 32)) BitStream!10594)

(assert (=> b!242565 (= lt!377999 (readBitPure!0 (readerFrom!0 (_2!11306 lt!377997) (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005))))))

(declare-fun b!242566 () Bool)

(declare-fun res!202571 () Bool)

(assert (=> b!242566 (=> (not res!202571) (not e!168166))))

(assert (=> b!242566 (= res!202571 (bvslt from!289 nBits!297))))

(declare-fun b!242561 () Bool)

(assert (=> b!242561 (= e!168170 e!168168)))

(declare-fun res!202572 () Bool)

(assert (=> b!242561 (=> (not res!202572) (not e!168168))))

(assert (=> b!242561 (= res!202572 (= (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377996))) (currentByte!11665 (_2!11306 lt!377996)) (currentBit!11660 (_2!11306 lt!377996))) (bvadd (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377997))) (currentByte!11665 (_2!11306 lt!377997)) (currentBit!11660 (_2!11306 lt!377997))) lt!378000)))))

(assert (=> b!242561 (= lt!378000 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!202570 () Bool)

(assert (=> start!52502 (=> (not res!202570) (not e!168166))))

(assert (=> start!52502 (= res!202570 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52502 e!168166))

(assert (=> start!52502 true))

(declare-fun inv!12 (BitStream!10594) Bool)

(assert (=> start!52502 (and (inv!12 thiss!1005) e!168164)))

(declare-fun b!242567 () Bool)

(assert (=> b!242567 (= e!168169 e!168163)))

(declare-fun res!202578 () Bool)

(assert (=> b!242567 (=> (not res!202578) (not e!168163))))

(declare-fun lt!378001 () (_ BitVec 64))

(assert (=> b!242567 (= res!202578 (= lt!377998 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!378001)))))

(assert (=> b!242567 (= lt!377998 (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377997))) (currentByte!11665 (_2!11306 lt!377997)) (currentBit!11660 (_2!11306 lt!377997))))))

(assert (=> b!242567 (= lt!378001 (bitIndex!0 (size!5836 (buf!6302 thiss!1005)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005)))))

(declare-fun b!242568 () Bool)

(declare-fun res!202569 () Bool)

(assert (=> b!242568 (=> (not res!202569) (not e!168168))))

(assert (=> b!242568 (= res!202569 (isPrefixOf!0 (_2!11306 lt!377997) (_2!11306 lt!377996)))))

(declare-fun b!242569 () Bool)

(assert (=> b!242569 (= e!168161 (= (_2!11305 lt!378007) (_2!11305 lt!378010)))))

(declare-fun b!242570 () Bool)

(assert (=> b!242570 (= e!168165 (invariant!0 (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005) (size!5836 (buf!6302 (_2!11306 lt!377996)))))))

(assert (= (and start!52502 res!202570) b!242564))

(assert (= (and b!242564 res!202575) b!242566))

(assert (= (and b!242566 res!202571) b!242560))

(assert (= (and b!242560 res!202573) b!242567))

(assert (= (and b!242567 res!202578) b!242558))

(assert (= (and b!242558 res!202581) b!242565))

(assert (= (and b!242565 res!202580) b!242557))

(assert (= (and b!242560 res!202577) b!242561))

(assert (= (and b!242561 res!202572) b!242568))

(assert (= (and b!242568 res!202569) b!242562))

(assert (= (and b!242560 res!202576) b!242559))

(assert (= (and b!242559 res!202579) b!242570))

(assert (= (and b!242560 res!202574) b!242569))

(assert (= start!52502 b!242563))

(declare-fun m!365441 () Bool)

(assert (=> b!242564 m!365441))

(declare-fun m!365443 () Bool)

(assert (=> b!242557 m!365443))

(declare-fun m!365445 () Bool)

(assert (=> b!242558 m!365445))

(declare-fun m!365447 () Bool)

(assert (=> b!242567 m!365447))

(declare-fun m!365449 () Bool)

(assert (=> b!242567 m!365449))

(declare-fun m!365451 () Bool)

(assert (=> b!242562 m!365451))

(declare-fun m!365453 () Bool)

(assert (=> b!242562 m!365453))

(declare-fun m!365455 () Bool)

(assert (=> b!242562 m!365455))

(declare-fun m!365457 () Bool)

(assert (=> b!242562 m!365457))

(declare-fun m!365459 () Bool)

(assert (=> b!242570 m!365459))

(declare-fun m!365461 () Bool)

(assert (=> b!242561 m!365461))

(assert (=> b!242561 m!365447))

(declare-fun m!365463 () Bool)

(assert (=> b!242560 m!365463))

(declare-fun m!365465 () Bool)

(assert (=> b!242560 m!365465))

(declare-fun m!365467 () Bool)

(assert (=> b!242560 m!365467))

(declare-fun m!365469 () Bool)

(assert (=> b!242560 m!365469))

(declare-fun m!365471 () Bool)

(assert (=> b!242560 m!365471))

(declare-fun m!365473 () Bool)

(assert (=> b!242560 m!365473))

(declare-fun m!365475 () Bool)

(assert (=> b!242560 m!365475))

(declare-fun m!365477 () Bool)

(assert (=> b!242560 m!365477))

(declare-fun m!365479 () Bool)

(assert (=> b!242560 m!365479))

(assert (=> b!242560 m!365457))

(declare-fun m!365481 () Bool)

(assert (=> b!242560 m!365481))

(declare-fun m!365483 () Bool)

(assert (=> b!242560 m!365483))

(declare-fun m!365485 () Bool)

(assert (=> b!242560 m!365485))

(declare-fun m!365487 () Bool)

(assert (=> b!242560 m!365487))

(declare-fun m!365489 () Bool)

(assert (=> b!242565 m!365489))

(assert (=> b!242565 m!365489))

(declare-fun m!365491 () Bool)

(assert (=> b!242565 m!365491))

(declare-fun m!365493 () Bool)

(assert (=> start!52502 m!365493))

(declare-fun m!365495 () Bool)

(assert (=> b!242563 m!365495))

(declare-fun m!365497 () Bool)

(assert (=> b!242559 m!365497))

(declare-fun m!365499 () Bool)

(assert (=> b!242568 m!365499))

(push 1)

(assert (not b!242570))

(assert (not b!242561))

(assert (not b!242567))

(assert (not b!242564))

(assert (not b!242559))

(assert (not b!242560))

(assert (not b!242563))

(assert (not start!52502))

(assert (not b!242557))

(assert (not b!242558))

(assert (not b!242562))

(assert (not b!242565))

(assert (not b!242568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81556 () Bool)

(declare-fun res!202718 () Bool)

(declare-fun e!168267 () Bool)

(assert (=> d!81556 (=> (not res!202718) (not e!168267))))

(assert (=> d!81556 (= res!202718 (= (size!5836 (buf!6302 thiss!1005)) (size!5836 (buf!6302 (_2!11306 lt!377997)))))))

(assert (=> d!81556 (= (isPrefixOf!0 thiss!1005 (_2!11306 lt!377997)) e!168267)))

(declare-fun b!242721 () Bool)

(declare-fun res!202719 () Bool)

(assert (=> b!242721 (=> (not res!202719) (not e!168267))))

(assert (=> b!242721 (= res!202719 (bvsle (bitIndex!0 (size!5836 (buf!6302 thiss!1005)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005)) (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377997))) (currentByte!11665 (_2!11306 lt!377997)) (currentBit!11660 (_2!11306 lt!377997)))))))

(declare-fun b!242722 () Bool)

(declare-fun e!168268 () Bool)

(assert (=> b!242722 (= e!168267 e!168268)))

(declare-fun res!202717 () Bool)

(assert (=> b!242722 (=> res!202717 e!168268)))

(assert (=> b!242722 (= res!202717 (= (size!5836 (buf!6302 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!242723 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13313 array!13313 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242723 (= e!168268 (arrayBitRangesEq!0 (buf!6302 thiss!1005) (buf!6302 (_2!11306 lt!377997)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5836 (buf!6302 thiss!1005)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005))))))

(assert (= (and d!81556 res!202718) b!242721))

(assert (= (and b!242721 res!202719) b!242722))

(assert (= (and b!242722 (not res!202717)) b!242723))

(assert (=> b!242721 m!365449))

(assert (=> b!242721 m!365447))

(assert (=> b!242723 m!365449))

(assert (=> b!242723 m!365449))

(declare-fun m!365731 () Bool)

(assert (=> b!242723 m!365731))

(assert (=> b!242558 d!81556))

(declare-fun d!81558 () Bool)

(declare-fun e!168271 () Bool)

(assert (=> d!81558 e!168271))

(declare-fun res!202725 () Bool)

(assert (=> d!81558 (=> (not res!202725) (not e!168271))))

(declare-fun lt!378280 () (_ BitVec 64))

(declare-fun lt!378283 () (_ BitVec 64))

(declare-fun lt!378281 () (_ BitVec 64))

(assert (=> d!81558 (= res!202725 (= lt!378280 (bvsub lt!378283 lt!378281)))))

(assert (=> d!81558 (or (= (bvand lt!378283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378281 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378283 lt!378281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81558 (= lt!378281 (remainingBits!0 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11305 lt!377999)))) ((_ sign_extend 32) (currentByte!11665 (_1!11305 lt!377999))) ((_ sign_extend 32) (currentBit!11660 (_1!11305 lt!377999)))))))

(declare-fun lt!378282 () (_ BitVec 64))

(declare-fun lt!378279 () (_ BitVec 64))

(assert (=> d!81558 (= lt!378283 (bvmul lt!378282 lt!378279))))

(assert (=> d!81558 (or (= lt!378282 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378279 (bvsdiv (bvmul lt!378282 lt!378279) lt!378282)))))

(assert (=> d!81558 (= lt!378279 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81558 (= lt!378282 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11305 lt!377999)))))))

(assert (=> d!81558 (= lt!378280 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11665 (_1!11305 lt!377999))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11660 (_1!11305 lt!377999)))))))

(assert (=> d!81558 (invariant!0 (currentBit!11660 (_1!11305 lt!377999)) (currentByte!11665 (_1!11305 lt!377999)) (size!5836 (buf!6302 (_1!11305 lt!377999))))))

(assert (=> d!81558 (= (bitIndex!0 (size!5836 (buf!6302 (_1!11305 lt!377999))) (currentByte!11665 (_1!11305 lt!377999)) (currentBit!11660 (_1!11305 lt!377999))) lt!378280)))

(declare-fun b!242728 () Bool)

(declare-fun res!202724 () Bool)

(assert (=> b!242728 (=> (not res!202724) (not e!168271))))

(assert (=> b!242728 (= res!202724 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378280))))

(declare-fun b!242729 () Bool)

(declare-fun lt!378284 () (_ BitVec 64))

(assert (=> b!242729 (= e!168271 (bvsle lt!378280 (bvmul lt!378284 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242729 (or (= lt!378284 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378284 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378284)))))

(assert (=> b!242729 (= lt!378284 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11305 lt!377999)))))))

(assert (= (and d!81558 res!202725) b!242728))

(assert (= (and b!242728 res!202724) b!242729))

(declare-fun m!365733 () Bool)

(assert (=> d!81558 m!365733))

(declare-fun m!365735 () Bool)

(assert (=> d!81558 m!365735))

(assert (=> b!242557 d!81558))

(declare-fun d!81560 () Bool)

(declare-fun res!202727 () Bool)

(declare-fun e!168272 () Bool)

(assert (=> d!81560 (=> (not res!202727) (not e!168272))))

(assert (=> d!81560 (= res!202727 (= (size!5836 (buf!6302 (_2!11306 lt!377997))) (size!5836 (buf!6302 (_2!11306 lt!377996)))))))

(assert (=> d!81560 (= (isPrefixOf!0 (_2!11306 lt!377997) (_2!11306 lt!377996)) e!168272)))

(declare-fun b!242730 () Bool)

(declare-fun res!202728 () Bool)

(assert (=> b!242730 (=> (not res!202728) (not e!168272))))

(assert (=> b!242730 (= res!202728 (bvsle (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377997))) (currentByte!11665 (_2!11306 lt!377997)) (currentBit!11660 (_2!11306 lt!377997))) (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377996))) (currentByte!11665 (_2!11306 lt!377996)) (currentBit!11660 (_2!11306 lt!377996)))))))

(declare-fun b!242731 () Bool)

(declare-fun e!168273 () Bool)

(assert (=> b!242731 (= e!168272 e!168273)))

(declare-fun res!202726 () Bool)

(assert (=> b!242731 (=> res!202726 e!168273)))

(assert (=> b!242731 (= res!202726 (= (size!5836 (buf!6302 (_2!11306 lt!377997))) #b00000000000000000000000000000000))))

(declare-fun b!242732 () Bool)

(assert (=> b!242732 (= e!168273 (arrayBitRangesEq!0 (buf!6302 (_2!11306 lt!377997)) (buf!6302 (_2!11306 lt!377996)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377997))) (currentByte!11665 (_2!11306 lt!377997)) (currentBit!11660 (_2!11306 lt!377997)))))))

(assert (= (and d!81560 res!202727) b!242730))

(assert (= (and b!242730 res!202728) b!242731))

(assert (= (and b!242731 (not res!202726)) b!242732))

(assert (=> b!242730 m!365447))

(assert (=> b!242730 m!365461))

(assert (=> b!242732 m!365447))

(assert (=> b!242732 m!365447))

(declare-fun m!365737 () Bool)

(assert (=> b!242732 m!365737))

(assert (=> b!242568 d!81560))

(declare-fun d!81562 () Bool)

(declare-fun e!168274 () Bool)

(assert (=> d!81562 e!168274))

(declare-fun res!202730 () Bool)

(assert (=> d!81562 (=> (not res!202730) (not e!168274))))

(declare-fun lt!378287 () (_ BitVec 64))

(declare-fun lt!378289 () (_ BitVec 64))

(declare-fun lt!378286 () (_ BitVec 64))

(assert (=> d!81562 (= res!202730 (= lt!378286 (bvsub lt!378289 lt!378287)))))

(assert (=> d!81562 (or (= (bvand lt!378289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378287 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378289 lt!378287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81562 (= lt!378287 (remainingBits!0 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377997)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997)))))))

(declare-fun lt!378288 () (_ BitVec 64))

(declare-fun lt!378285 () (_ BitVec 64))

(assert (=> d!81562 (= lt!378289 (bvmul lt!378288 lt!378285))))

(assert (=> d!81562 (or (= lt!378288 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378285 (bvsdiv (bvmul lt!378288 lt!378285) lt!378288)))))

(assert (=> d!81562 (= lt!378285 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81562 (= lt!378288 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377997)))))))

(assert (=> d!81562 (= lt!378286 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997)))))))

(assert (=> d!81562 (invariant!0 (currentBit!11660 (_2!11306 lt!377997)) (currentByte!11665 (_2!11306 lt!377997)) (size!5836 (buf!6302 (_2!11306 lt!377997))))))

(assert (=> d!81562 (= (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377997))) (currentByte!11665 (_2!11306 lt!377997)) (currentBit!11660 (_2!11306 lt!377997))) lt!378286)))

(declare-fun b!242733 () Bool)

(declare-fun res!202729 () Bool)

(assert (=> b!242733 (=> (not res!202729) (not e!168274))))

(assert (=> b!242733 (= res!202729 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378286))))

(declare-fun b!242734 () Bool)

(declare-fun lt!378290 () (_ BitVec 64))

(assert (=> b!242734 (= e!168274 (bvsle lt!378286 (bvmul lt!378290 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242734 (or (= lt!378290 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378290 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378290)))))

(assert (=> b!242734 (= lt!378290 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377997)))))))

(assert (= (and d!81562 res!202730) b!242733))

(assert (= (and b!242733 res!202729) b!242734))

(declare-fun m!365739 () Bool)

(assert (=> d!81562 m!365739))

(declare-fun m!365741 () Bool)

(assert (=> d!81562 m!365741))

(assert (=> b!242567 d!81562))

(declare-fun d!81564 () Bool)

(declare-fun e!168275 () Bool)

(assert (=> d!81564 e!168275))

(declare-fun res!202732 () Bool)

(assert (=> d!81564 (=> (not res!202732) (not e!168275))))

(declare-fun lt!378293 () (_ BitVec 64))

(declare-fun lt!378292 () (_ BitVec 64))

(declare-fun lt!378295 () (_ BitVec 64))

(assert (=> d!81564 (= res!202732 (= lt!378292 (bvsub lt!378295 lt!378293)))))

(assert (=> d!81564 (or (= (bvand lt!378295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378293 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378295 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378295 lt!378293) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81564 (= lt!378293 (remainingBits!0 ((_ sign_extend 32) (size!5836 (buf!6302 thiss!1005))) ((_ sign_extend 32) (currentByte!11665 thiss!1005)) ((_ sign_extend 32) (currentBit!11660 thiss!1005))))))

(declare-fun lt!378294 () (_ BitVec 64))

(declare-fun lt!378291 () (_ BitVec 64))

(assert (=> d!81564 (= lt!378295 (bvmul lt!378294 lt!378291))))

(assert (=> d!81564 (or (= lt!378294 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378291 (bvsdiv (bvmul lt!378294 lt!378291) lt!378294)))))

(assert (=> d!81564 (= lt!378291 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81564 (= lt!378294 ((_ sign_extend 32) (size!5836 (buf!6302 thiss!1005))))))

(assert (=> d!81564 (= lt!378292 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11665 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11660 thiss!1005))))))

(assert (=> d!81564 (invariant!0 (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005) (size!5836 (buf!6302 thiss!1005)))))

(assert (=> d!81564 (= (bitIndex!0 (size!5836 (buf!6302 thiss!1005)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005)) lt!378292)))

(declare-fun b!242735 () Bool)

(declare-fun res!202731 () Bool)

(assert (=> b!242735 (=> (not res!202731) (not e!168275))))

(assert (=> b!242735 (= res!202731 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378292))))

(declare-fun b!242736 () Bool)

(declare-fun lt!378296 () (_ BitVec 64))

(assert (=> b!242736 (= e!168275 (bvsle lt!378292 (bvmul lt!378296 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242736 (or (= lt!378296 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378296 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378296)))))

(assert (=> b!242736 (= lt!378296 ((_ sign_extend 32) (size!5836 (buf!6302 thiss!1005))))))

(assert (= (and d!81564 res!202732) b!242735))

(assert (= (and b!242735 res!202731) b!242736))

(declare-fun m!365743 () Bool)

(assert (=> d!81564 m!365743))

(declare-fun m!365745 () Bool)

(assert (=> d!81564 m!365745))

(assert (=> b!242567 d!81564))

(declare-fun d!81566 () Bool)

(assert (=> d!81566 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005) (size!5836 (buf!6302 thiss!1005))))))

(declare-fun bs!20627 () Bool)

(assert (= bs!20627 d!81566))

(assert (=> bs!20627 m!365745))

(assert (=> start!52502 d!81566))

(declare-fun d!81568 () Bool)

(declare-datatypes ((tuple2!20786 0))(
  ( (tuple2!20787 (_1!11315 Bool) (_2!11315 BitStream!10594)) )
))
(declare-fun lt!378299 () tuple2!20786)

(declare-fun readBit!0 (BitStream!10594) tuple2!20786)

(assert (=> d!81568 (= lt!378299 (readBit!0 (readerFrom!0 (_2!11306 lt!377997) (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005))))))

(assert (=> d!81568 (= (readBitPure!0 (readerFrom!0 (_2!11306 lt!377997) (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005))) (tuple2!20767 (_2!11315 lt!378299) (_1!11315 lt!378299)))))

(declare-fun bs!20628 () Bool)

(assert (= bs!20628 d!81568))

(assert (=> bs!20628 m!365489))

(declare-fun m!365747 () Bool)

(assert (=> bs!20628 m!365747))

(assert (=> b!242565 d!81568))

(declare-fun d!81570 () Bool)

(declare-fun e!168278 () Bool)

(assert (=> d!81570 e!168278))

(declare-fun res!202736 () Bool)

(assert (=> d!81570 (=> (not res!202736) (not e!168278))))

(assert (=> d!81570 (= res!202736 (invariant!0 (currentBit!11660 (_2!11306 lt!377997)) (currentByte!11665 (_2!11306 lt!377997)) (size!5836 (buf!6302 (_2!11306 lt!377997)))))))

(assert (=> d!81570 (= (readerFrom!0 (_2!11306 lt!377997) (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005)) (BitStream!10595 (buf!6302 (_2!11306 lt!377997)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005)))))

(declare-fun b!242739 () Bool)

(assert (=> b!242739 (= e!168278 (invariant!0 (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005) (size!5836 (buf!6302 (_2!11306 lt!377997)))))))

(assert (= (and d!81570 res!202736) b!242739))

(assert (=> d!81570 m!365741))

(assert (=> b!242739 m!365497))

(assert (=> b!242565 d!81570))

(declare-fun d!81572 () Bool)

(assert (=> d!81572 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5836 (buf!6302 thiss!1005))) ((_ sign_extend 32) (currentByte!11665 thiss!1005)) ((_ sign_extend 32) (currentBit!11660 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5836 (buf!6302 thiss!1005))) ((_ sign_extend 32) (currentByte!11665 thiss!1005)) ((_ sign_extend 32) (currentBit!11660 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20629 () Bool)

(assert (= bs!20629 d!81572))

(assert (=> bs!20629 m!365743))

(assert (=> b!242564 d!81572))

(declare-fun d!81574 () Bool)

(assert (=> d!81574 (= (array_inv!5577 (buf!6302 thiss!1005)) (bvsge (size!5836 (buf!6302 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!242563 d!81574))

(declare-fun lt!378318 () tuple2!20786)

(declare-fun d!81576 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10594 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20786)

(assert (=> d!81576 (= lt!378318 (checkBitsLoop!0 (_1!11307 lt!378008) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81576 (= (checkBitsLoopPure!0 (_1!11307 lt!378008) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!20767 (_2!11315 lt!378318) (_1!11315 lt!378318)))))

(declare-fun bs!20630 () Bool)

(assert (= bs!20630 d!81576))

(declare-fun m!365749 () Bool)

(assert (=> bs!20630 m!365749))

(assert (=> b!242562 d!81576))

(declare-fun d!81578 () Bool)

(assert (=> d!81578 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377996)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997))) lt!378000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377996)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997)))) lt!378000))))

(declare-fun bs!20631 () Bool)

(assert (= bs!20631 d!81578))

(declare-fun m!365751 () Bool)

(assert (=> bs!20631 m!365751))

(assert (=> b!242562 d!81578))

(declare-fun d!81580 () Bool)

(assert (=> d!81580 (validate_offset_bits!1 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377996)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997))) lt!378000)))

(declare-fun lt!378329 () Unit!17755)

(declare-fun choose!9 (BitStream!10594 array!13313 (_ BitVec 64) BitStream!10594) Unit!17755)

(assert (=> d!81580 (= lt!378329 (choose!9 (_2!11306 lt!377997) (buf!6302 (_2!11306 lt!377996)) lt!378000 (BitStream!10595 (buf!6302 (_2!11306 lt!377996)) (currentByte!11665 (_2!11306 lt!377997)) (currentBit!11660 (_2!11306 lt!377997)))))))

(assert (=> d!81580 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11306 lt!377997) (buf!6302 (_2!11306 lt!377996)) lt!378000) lt!378329)))

(declare-fun bs!20632 () Bool)

(assert (= bs!20632 d!81580))

(assert (=> bs!20632 m!365453))

(declare-fun m!365753 () Bool)

(assert (=> bs!20632 m!365753))

(assert (=> b!242562 d!81580))

(declare-fun b!242775 () Bool)

(declare-fun e!168299 () Unit!17755)

(declare-fun lt!378390 () Unit!17755)

(assert (=> b!242775 (= e!168299 lt!378390)))

(declare-fun lt!378401 () (_ BitVec 64))

(assert (=> b!242775 (= lt!378401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!378404 () (_ BitVec 64))

(assert (=> b!242775 (= lt!378404 (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377997))) (currentByte!11665 (_2!11306 lt!377997)) (currentBit!11660 (_2!11306 lt!377997))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13313 array!13313 (_ BitVec 64) (_ BitVec 64)) Unit!17755)

(assert (=> b!242775 (= lt!378390 (arrayBitRangesEqSymmetric!0 (buf!6302 (_2!11306 lt!377997)) (buf!6302 (_2!11306 lt!377996)) lt!378401 lt!378404))))

(assert (=> b!242775 (arrayBitRangesEq!0 (buf!6302 (_2!11306 lt!377996)) (buf!6302 (_2!11306 lt!377997)) lt!378401 lt!378404)))

(declare-fun e!168298 () Bool)

(declare-fun lt!378399 () tuple2!20770)

(declare-fun lt!378392 () (_ BitVec 64))

(declare-fun b!242776 () Bool)

(declare-fun lt!378402 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10594 (_ BitVec 64)) BitStream!10594)

(assert (=> b!242776 (= e!168298 (= (_1!11307 lt!378399) (withMovedBitIndex!0 (_2!11307 lt!378399) (bvsub lt!378402 lt!378392))))))

(assert (=> b!242776 (or (= (bvand lt!378402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378392 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378402 lt!378392) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242776 (= lt!378392 (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377996))) (currentByte!11665 (_2!11306 lt!377996)) (currentBit!11660 (_2!11306 lt!377996))))))

(assert (=> b!242776 (= lt!378402 (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377997))) (currentByte!11665 (_2!11306 lt!377997)) (currentBit!11660 (_2!11306 lt!377997))))))

(declare-fun d!81582 () Bool)

(assert (=> d!81582 e!168298))

(declare-fun res!202769 () Bool)

(assert (=> d!81582 (=> (not res!202769) (not e!168298))))

(assert (=> d!81582 (= res!202769 (isPrefixOf!0 (_1!11307 lt!378399) (_2!11307 lt!378399)))))

(declare-fun lt!378389 () BitStream!10594)

(assert (=> d!81582 (= lt!378399 (tuple2!20771 lt!378389 (_2!11306 lt!377996)))))

(declare-fun lt!378406 () Unit!17755)

(declare-fun lt!378396 () Unit!17755)

(assert (=> d!81582 (= lt!378406 lt!378396)))

(assert (=> d!81582 (isPrefixOf!0 lt!378389 (_2!11306 lt!377996))))

(assert (=> d!81582 (= lt!378396 (lemmaIsPrefixTransitive!0 lt!378389 (_2!11306 lt!377996) (_2!11306 lt!377996)))))

(declare-fun lt!378394 () Unit!17755)

(declare-fun lt!378391 () Unit!17755)

(assert (=> d!81582 (= lt!378394 lt!378391)))

(assert (=> d!81582 (isPrefixOf!0 lt!378389 (_2!11306 lt!377996))))

(assert (=> d!81582 (= lt!378391 (lemmaIsPrefixTransitive!0 lt!378389 (_2!11306 lt!377997) (_2!11306 lt!377996)))))

(declare-fun lt!378388 () Unit!17755)

(assert (=> d!81582 (= lt!378388 e!168299)))

(declare-fun c!11447 () Bool)

(assert (=> d!81582 (= c!11447 (not (= (size!5836 (buf!6302 (_2!11306 lt!377997))) #b00000000000000000000000000000000)))))

(declare-fun lt!378395 () Unit!17755)

(declare-fun lt!378400 () Unit!17755)

(assert (=> d!81582 (= lt!378395 lt!378400)))

(assert (=> d!81582 (isPrefixOf!0 (_2!11306 lt!377996) (_2!11306 lt!377996))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10594) Unit!17755)

(assert (=> d!81582 (= lt!378400 (lemmaIsPrefixRefl!0 (_2!11306 lt!377996)))))

(declare-fun lt!378397 () Unit!17755)

(declare-fun lt!378405 () Unit!17755)

(assert (=> d!81582 (= lt!378397 lt!378405)))

(assert (=> d!81582 (= lt!378405 (lemmaIsPrefixRefl!0 (_2!11306 lt!377996)))))

(declare-fun lt!378403 () Unit!17755)

(declare-fun lt!378398 () Unit!17755)

(assert (=> d!81582 (= lt!378403 lt!378398)))

(assert (=> d!81582 (isPrefixOf!0 lt!378389 lt!378389)))

(assert (=> d!81582 (= lt!378398 (lemmaIsPrefixRefl!0 lt!378389))))

(declare-fun lt!378393 () Unit!17755)

(declare-fun lt!378387 () Unit!17755)

(assert (=> d!81582 (= lt!378393 lt!378387)))

(assert (=> d!81582 (isPrefixOf!0 (_2!11306 lt!377997) (_2!11306 lt!377997))))

(assert (=> d!81582 (= lt!378387 (lemmaIsPrefixRefl!0 (_2!11306 lt!377997)))))

(assert (=> d!81582 (= lt!378389 (BitStream!10595 (buf!6302 (_2!11306 lt!377996)) (currentByte!11665 (_2!11306 lt!377997)) (currentBit!11660 (_2!11306 lt!377997))))))

(assert (=> d!81582 (isPrefixOf!0 (_2!11306 lt!377997) (_2!11306 lt!377996))))

(assert (=> d!81582 (= (reader!0 (_2!11306 lt!377997) (_2!11306 lt!377996)) lt!378399)))

(declare-fun b!242777 () Bool)

(declare-fun res!202770 () Bool)

(assert (=> b!242777 (=> (not res!202770) (not e!168298))))

(assert (=> b!242777 (= res!202770 (isPrefixOf!0 (_2!11307 lt!378399) (_2!11306 lt!377996)))))

(declare-fun b!242778 () Bool)

(declare-fun res!202771 () Bool)

(assert (=> b!242778 (=> (not res!202771) (not e!168298))))

(assert (=> b!242778 (= res!202771 (isPrefixOf!0 (_1!11307 lt!378399) (_2!11306 lt!377997)))))

(declare-fun b!242779 () Bool)

(declare-fun Unit!17763 () Unit!17755)

(assert (=> b!242779 (= e!168299 Unit!17763)))

(assert (= (and d!81582 c!11447) b!242775))

(assert (= (and d!81582 (not c!11447)) b!242779))

(assert (= (and d!81582 res!202769) b!242778))

(assert (= (and b!242778 res!202771) b!242777))

(assert (= (and b!242777 res!202770) b!242776))

(declare-fun m!365789 () Bool)

(assert (=> b!242778 m!365789))

(declare-fun m!365791 () Bool)

(assert (=> b!242777 m!365791))

(assert (=> b!242775 m!365447))

(declare-fun m!365793 () Bool)

(assert (=> b!242775 m!365793))

(declare-fun m!365795 () Bool)

(assert (=> b!242775 m!365795))

(assert (=> d!81582 m!365499))

(declare-fun m!365797 () Bool)

(assert (=> d!81582 m!365797))

(declare-fun m!365799 () Bool)

(assert (=> d!81582 m!365799))

(declare-fun m!365801 () Bool)

(assert (=> d!81582 m!365801))

(declare-fun m!365803 () Bool)

(assert (=> d!81582 m!365803))

(declare-fun m!365805 () Bool)

(assert (=> d!81582 m!365805))

(declare-fun m!365807 () Bool)

(assert (=> d!81582 m!365807))

(declare-fun m!365809 () Bool)

(assert (=> d!81582 m!365809))

(declare-fun m!365811 () Bool)

(assert (=> d!81582 m!365811))

(declare-fun m!365813 () Bool)

(assert (=> d!81582 m!365813))

(declare-fun m!365815 () Bool)

(assert (=> d!81582 m!365815))

(declare-fun m!365817 () Bool)

(assert (=> b!242776 m!365817))

(assert (=> b!242776 m!365461))

(assert (=> b!242776 m!365447))

(assert (=> b!242562 d!81582))

(declare-fun d!81610 () Bool)

(declare-fun e!168300 () Bool)

(assert (=> d!81610 e!168300))

(declare-fun res!202773 () Bool)

(assert (=> d!81610 (=> (not res!202773) (not e!168300))))

(declare-fun lt!378409 () (_ BitVec 64))

(declare-fun lt!378411 () (_ BitVec 64))

(declare-fun lt!378408 () (_ BitVec 64))

(assert (=> d!81610 (= res!202773 (= lt!378408 (bvsub lt!378411 lt!378409)))))

(assert (=> d!81610 (or (= (bvand lt!378411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378409 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378411 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378411 lt!378409) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81610 (= lt!378409 (remainingBits!0 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377996)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377996))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377996)))))))

(declare-fun lt!378410 () (_ BitVec 64))

(declare-fun lt!378407 () (_ BitVec 64))

(assert (=> d!81610 (= lt!378411 (bvmul lt!378410 lt!378407))))

(assert (=> d!81610 (or (= lt!378410 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378407 (bvsdiv (bvmul lt!378410 lt!378407) lt!378410)))))

(assert (=> d!81610 (= lt!378407 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81610 (= lt!378410 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377996)))))))

(assert (=> d!81610 (= lt!378408 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377996))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377996)))))))

(assert (=> d!81610 (invariant!0 (currentBit!11660 (_2!11306 lt!377996)) (currentByte!11665 (_2!11306 lt!377996)) (size!5836 (buf!6302 (_2!11306 lt!377996))))))

(assert (=> d!81610 (= (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377996))) (currentByte!11665 (_2!11306 lt!377996)) (currentBit!11660 (_2!11306 lt!377996))) lt!378408)))

(declare-fun b!242780 () Bool)

(declare-fun res!202772 () Bool)

(assert (=> b!242780 (=> (not res!202772) (not e!168300))))

(assert (=> b!242780 (= res!202772 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378408))))

(declare-fun b!242781 () Bool)

(declare-fun lt!378412 () (_ BitVec 64))

(assert (=> b!242781 (= e!168300 (bvsle lt!378408 (bvmul lt!378412 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242781 (or (= lt!378412 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378412 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378412)))))

(assert (=> b!242781 (= lt!378412 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377996)))))))

(assert (= (and d!81610 res!202773) b!242780))

(assert (= (and b!242780 res!202772) b!242781))

(declare-fun m!365819 () Bool)

(assert (=> d!81610 m!365819))

(declare-fun m!365821 () Bool)

(assert (=> d!81610 m!365821))

(assert (=> b!242561 d!81610))

(assert (=> b!242561 d!81562))

(declare-fun b!242803 () Bool)

(declare-fun e!168311 () Bool)

(declare-fun e!168310 () Bool)

(assert (=> b!242803 (= e!168311 e!168310)))

(declare-fun res!202795 () Bool)

(assert (=> b!242803 (=> (not res!202795) (not e!168310))))

(declare-fun lt!378453 () tuple2!20766)

(declare-fun lt!378451 () tuple2!20768)

(assert (=> b!242803 (= res!202795 (and (= (_2!11305 lt!378453) bit!26) (= (_1!11305 lt!378453) (_2!11306 lt!378451))))))

(assert (=> b!242803 (= lt!378453 (readBitPure!0 (readerFrom!0 (_2!11306 lt!378451) (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005))))))

(declare-fun d!81612 () Bool)

(assert (=> d!81612 e!168311))

(declare-fun res!202793 () Bool)

(assert (=> d!81612 (=> (not res!202793) (not e!168311))))

(assert (=> d!81612 (= res!202793 (= (size!5836 (buf!6302 thiss!1005)) (size!5836 (buf!6302 (_2!11306 lt!378451)))))))

(declare-fun choose!16 (BitStream!10594 Bool) tuple2!20768)

(assert (=> d!81612 (= lt!378451 (choose!16 thiss!1005 bit!26))))

(assert (=> d!81612 (validate_offset_bit!0 ((_ sign_extend 32) (size!5836 (buf!6302 thiss!1005))) ((_ sign_extend 32) (currentByte!11665 thiss!1005)) ((_ sign_extend 32) (currentBit!11660 thiss!1005)))))

(assert (=> d!81612 (= (appendBit!0 thiss!1005 bit!26) lt!378451)))

(declare-fun b!242802 () Bool)

(declare-fun res!202792 () Bool)

(assert (=> b!242802 (=> (not res!202792) (not e!168311))))

(assert (=> b!242802 (= res!202792 (isPrefixOf!0 thiss!1005 (_2!11306 lt!378451)))))

(declare-fun b!242804 () Bool)

(assert (=> b!242804 (= e!168310 (= (bitIndex!0 (size!5836 (buf!6302 (_1!11305 lt!378453))) (currentByte!11665 (_1!11305 lt!378453)) (currentBit!11660 (_1!11305 lt!378453))) (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!378451))) (currentByte!11665 (_2!11306 lt!378451)) (currentBit!11660 (_2!11306 lt!378451)))))))

(declare-fun b!242801 () Bool)

(declare-fun res!202794 () Bool)

(assert (=> b!242801 (=> (not res!202794) (not e!168311))))

(declare-fun lt!378454 () (_ BitVec 64))

(declare-fun lt!378452 () (_ BitVec 64))

(assert (=> b!242801 (= res!202794 (= (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!378451))) (currentByte!11665 (_2!11306 lt!378451)) (currentBit!11660 (_2!11306 lt!378451))) (bvadd lt!378454 lt!378452)))))

(assert (=> b!242801 (or (not (= (bvand lt!378454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378452 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!378454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!378454 lt!378452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242801 (= lt!378452 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!242801 (= lt!378454 (bitIndex!0 (size!5836 (buf!6302 thiss!1005)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005)))))

(assert (= (and d!81612 res!202793) b!242801))

(assert (= (and b!242801 res!202794) b!242802))

(assert (= (and b!242802 res!202792) b!242803))

(assert (= (and b!242803 res!202795) b!242804))

(declare-fun m!365835 () Bool)

(assert (=> b!242804 m!365835))

(declare-fun m!365837 () Bool)

(assert (=> b!242804 m!365837))

(assert (=> b!242801 m!365837))

(assert (=> b!242801 m!365449))

(declare-fun m!365841 () Bool)

(assert (=> d!81612 m!365841))

(declare-fun m!365843 () Bool)

(assert (=> d!81612 m!365843))

(declare-fun m!365845 () Bool)

(assert (=> b!242803 m!365845))

(assert (=> b!242803 m!365845))

(declare-fun m!365847 () Bool)

(assert (=> b!242803 m!365847))

(declare-fun m!365849 () Bool)

(assert (=> b!242802 m!365849))

(assert (=> b!242560 d!81612))

(declare-fun d!81626 () Bool)

(declare-fun lt!378458 () tuple2!20786)

(assert (=> d!81626 (= lt!378458 (readBit!0 (BitStream!10595 (buf!6302 (_2!11306 lt!377996)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005))))))

(assert (=> d!81626 (= (readBitPure!0 (BitStream!10595 (buf!6302 (_2!11306 lt!377996)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005))) (tuple2!20767 (_2!11315 lt!378458) (_1!11315 lt!378458)))))

(declare-fun bs!20640 () Bool)

(assert (= bs!20640 d!81626))

(declare-fun m!365851 () Bool)

(assert (=> bs!20640 m!365851))

(assert (=> b!242560 d!81626))

(declare-fun d!81628 () Bool)

(assert (=> d!81628 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11307 lt!378003)))) ((_ sign_extend 32) (currentByte!11665 (_1!11307 lt!378003))) ((_ sign_extend 32) (currentBit!11660 (_1!11307 lt!378003)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11307 lt!378003)))) ((_ sign_extend 32) (currentByte!11665 (_1!11307 lt!378003))) ((_ sign_extend 32) (currentBit!11660 (_1!11307 lt!378003)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!20642 () Bool)

(assert (= bs!20642 d!81628))

(declare-fun m!365855 () Bool)

(assert (=> bs!20642 m!365855))

(assert (=> b!242560 d!81628))

(declare-fun b!242850 () Bool)

(declare-fun e!168336 () Bool)

(declare-fun lt!378553 () (_ BitVec 64))

(assert (=> b!242850 (= e!168336 (validate_offset_bits!1 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377997)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997))) lt!378553))))

(declare-fun b!242847 () Bool)

(declare-fun res!202834 () Bool)

(declare-fun e!168335 () Bool)

(assert (=> b!242847 (=> (not res!202834) (not e!168335))))

(declare-fun lt!378556 () (_ BitVec 64))

(declare-fun lt!378558 () (_ BitVec 64))

(declare-fun lt!378555 () tuple2!20768)

(assert (=> b!242847 (= res!202834 (= (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!378555))) (currentByte!11665 (_2!11306 lt!378555)) (currentBit!11660 (_2!11306 lt!378555))) (bvadd lt!378558 lt!378556)))))

(assert (=> b!242847 (or (not (= (bvand lt!378558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378556 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!378558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!378558 lt!378556) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242847 (= lt!378556 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242847 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242847 (= lt!378558 (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377997))) (currentByte!11665 (_2!11306 lt!377997)) (currentBit!11660 (_2!11306 lt!377997))))))

(declare-fun d!81632 () Bool)

(assert (=> d!81632 e!168335))

(declare-fun res!202833 () Bool)

(assert (=> d!81632 (=> (not res!202833) (not e!168335))))

(assert (=> d!81632 (= res!202833 (= (size!5836 (buf!6302 (_2!11306 lt!377997))) (size!5836 (buf!6302 (_2!11306 lt!378555)))))))

(declare-fun choose!51 (BitStream!10594 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20768)

(assert (=> d!81632 (= lt!378555 (choose!51 (_2!11306 lt!377997) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81632 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81632 (= (appendNBitsLoop!0 (_2!11306 lt!377997) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!378555)))

(declare-fun b!242849 () Bool)

(declare-fun lt!378559 () tuple2!20766)

(declare-fun lt!378554 () tuple2!20770)

(assert (=> b!242849 (= e!168335 (and (_2!11305 lt!378559) (= (_1!11305 lt!378559) (_2!11307 lt!378554))))))

(assert (=> b!242849 (= lt!378559 (checkBitsLoopPure!0 (_1!11307 lt!378554) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!378560 () Unit!17755)

(declare-fun lt!378557 () Unit!17755)

(assert (=> b!242849 (= lt!378560 lt!378557)))

(assert (=> b!242849 (validate_offset_bits!1 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!378555)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997))) lt!378553)))

(assert (=> b!242849 (= lt!378557 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11306 lt!377997) (buf!6302 (_2!11306 lt!378555)) lt!378553))))

(assert (=> b!242849 e!168336))

(declare-fun res!202836 () Bool)

(assert (=> b!242849 (=> (not res!202836) (not e!168336))))

(assert (=> b!242849 (= res!202836 (and (= (size!5836 (buf!6302 (_2!11306 lt!377997))) (size!5836 (buf!6302 (_2!11306 lt!378555)))) (bvsge lt!378553 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242849 (= lt!378553 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242849 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242849 (= lt!378554 (reader!0 (_2!11306 lt!377997) (_2!11306 lt!378555)))))

(declare-fun b!242848 () Bool)

(declare-fun res!202835 () Bool)

(assert (=> b!242848 (=> (not res!202835) (not e!168335))))

(assert (=> b!242848 (= res!202835 (isPrefixOf!0 (_2!11306 lt!377997) (_2!11306 lt!378555)))))

(assert (= (and d!81632 res!202833) b!242847))

(assert (= (and b!242847 res!202834) b!242848))

(assert (= (and b!242848 res!202835) b!242849))

(assert (= (and b!242849 res!202836) b!242850))

(declare-fun m!365903 () Bool)

(assert (=> b!242848 m!365903))

(declare-fun m!365905 () Bool)

(assert (=> b!242850 m!365905))

(declare-fun m!365907 () Bool)

(assert (=> b!242849 m!365907))

(declare-fun m!365909 () Bool)

(assert (=> b!242849 m!365909))

(declare-fun m!365911 () Bool)

(assert (=> b!242849 m!365911))

(declare-fun m!365913 () Bool)

(assert (=> b!242849 m!365913))

(declare-fun m!365915 () Bool)

(assert (=> b!242847 m!365915))

(assert (=> b!242847 m!365447))

(declare-fun m!365917 () Bool)

(assert (=> d!81632 m!365917))

(assert (=> b!242560 d!81632))

(declare-fun b!242851 () Bool)

(declare-fun e!168338 () Unit!17755)

(declare-fun lt!378564 () Unit!17755)

(assert (=> b!242851 (= e!168338 lt!378564)))

(declare-fun lt!378575 () (_ BitVec 64))

(assert (=> b!242851 (= lt!378575 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!378578 () (_ BitVec 64))

(assert (=> b!242851 (= lt!378578 (bitIndex!0 (size!5836 (buf!6302 thiss!1005)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005)))))

(assert (=> b!242851 (= lt!378564 (arrayBitRangesEqSymmetric!0 (buf!6302 thiss!1005) (buf!6302 (_2!11306 lt!377996)) lt!378575 lt!378578))))

(assert (=> b!242851 (arrayBitRangesEq!0 (buf!6302 (_2!11306 lt!377996)) (buf!6302 thiss!1005) lt!378575 lt!378578)))

(declare-fun lt!378573 () tuple2!20770)

(declare-fun e!168337 () Bool)

(declare-fun lt!378576 () (_ BitVec 64))

(declare-fun b!242852 () Bool)

(declare-fun lt!378566 () (_ BitVec 64))

(assert (=> b!242852 (= e!168337 (= (_1!11307 lt!378573) (withMovedBitIndex!0 (_2!11307 lt!378573) (bvsub lt!378576 lt!378566))))))

(assert (=> b!242852 (or (= (bvand lt!378576 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378566 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378576 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378576 lt!378566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242852 (= lt!378566 (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377996))) (currentByte!11665 (_2!11306 lt!377996)) (currentBit!11660 (_2!11306 lt!377996))))))

(assert (=> b!242852 (= lt!378576 (bitIndex!0 (size!5836 (buf!6302 thiss!1005)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005)))))

(declare-fun d!81656 () Bool)

(assert (=> d!81656 e!168337))

(declare-fun res!202837 () Bool)

(assert (=> d!81656 (=> (not res!202837) (not e!168337))))

(assert (=> d!81656 (= res!202837 (isPrefixOf!0 (_1!11307 lt!378573) (_2!11307 lt!378573)))))

(declare-fun lt!378563 () BitStream!10594)

(assert (=> d!81656 (= lt!378573 (tuple2!20771 lt!378563 (_2!11306 lt!377996)))))

(declare-fun lt!378580 () Unit!17755)

(declare-fun lt!378570 () Unit!17755)

(assert (=> d!81656 (= lt!378580 lt!378570)))

(assert (=> d!81656 (isPrefixOf!0 lt!378563 (_2!11306 lt!377996))))

(assert (=> d!81656 (= lt!378570 (lemmaIsPrefixTransitive!0 lt!378563 (_2!11306 lt!377996) (_2!11306 lt!377996)))))

(declare-fun lt!378568 () Unit!17755)

(declare-fun lt!378565 () Unit!17755)

(assert (=> d!81656 (= lt!378568 lt!378565)))

(assert (=> d!81656 (isPrefixOf!0 lt!378563 (_2!11306 lt!377996))))

(assert (=> d!81656 (= lt!378565 (lemmaIsPrefixTransitive!0 lt!378563 thiss!1005 (_2!11306 lt!377996)))))

(declare-fun lt!378562 () Unit!17755)

(assert (=> d!81656 (= lt!378562 e!168338)))

(declare-fun c!11451 () Bool)

(assert (=> d!81656 (= c!11451 (not (= (size!5836 (buf!6302 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!378569 () Unit!17755)

(declare-fun lt!378574 () Unit!17755)

(assert (=> d!81656 (= lt!378569 lt!378574)))

(assert (=> d!81656 (isPrefixOf!0 (_2!11306 lt!377996) (_2!11306 lt!377996))))

(assert (=> d!81656 (= lt!378574 (lemmaIsPrefixRefl!0 (_2!11306 lt!377996)))))

(declare-fun lt!378571 () Unit!17755)

(declare-fun lt!378579 () Unit!17755)

(assert (=> d!81656 (= lt!378571 lt!378579)))

(assert (=> d!81656 (= lt!378579 (lemmaIsPrefixRefl!0 (_2!11306 lt!377996)))))

(declare-fun lt!378577 () Unit!17755)

(declare-fun lt!378572 () Unit!17755)

(assert (=> d!81656 (= lt!378577 lt!378572)))

(assert (=> d!81656 (isPrefixOf!0 lt!378563 lt!378563)))

(assert (=> d!81656 (= lt!378572 (lemmaIsPrefixRefl!0 lt!378563))))

(declare-fun lt!378567 () Unit!17755)

(declare-fun lt!378561 () Unit!17755)

(assert (=> d!81656 (= lt!378567 lt!378561)))

(assert (=> d!81656 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!81656 (= lt!378561 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!81656 (= lt!378563 (BitStream!10595 (buf!6302 (_2!11306 lt!377996)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005)))))

(assert (=> d!81656 (isPrefixOf!0 thiss!1005 (_2!11306 lt!377996))))

(assert (=> d!81656 (= (reader!0 thiss!1005 (_2!11306 lt!377996)) lt!378573)))

(declare-fun b!242853 () Bool)

(declare-fun res!202838 () Bool)

(assert (=> b!242853 (=> (not res!202838) (not e!168337))))

(assert (=> b!242853 (= res!202838 (isPrefixOf!0 (_2!11307 lt!378573) (_2!11306 lt!377996)))))

(declare-fun b!242854 () Bool)

(declare-fun res!202839 () Bool)

(assert (=> b!242854 (=> (not res!202839) (not e!168337))))

(assert (=> b!242854 (= res!202839 (isPrefixOf!0 (_1!11307 lt!378573) thiss!1005))))

(declare-fun b!242855 () Bool)

(declare-fun Unit!17764 () Unit!17755)

(assert (=> b!242855 (= e!168338 Unit!17764)))

(assert (= (and d!81656 c!11451) b!242851))

(assert (= (and d!81656 (not c!11451)) b!242855))

(assert (= (and d!81656 res!202837) b!242854))

(assert (= (and b!242854 res!202839) b!242853))

(assert (= (and b!242853 res!202838) b!242852))

(declare-fun m!365919 () Bool)

(assert (=> b!242854 m!365919))

(declare-fun m!365921 () Bool)

(assert (=> b!242853 m!365921))

(assert (=> b!242851 m!365449))

(declare-fun m!365923 () Bool)

(assert (=> b!242851 m!365923))

(declare-fun m!365925 () Bool)

(assert (=> b!242851 m!365925))

(assert (=> d!81656 m!365477))

(assert (=> d!81656 m!365797))

(declare-fun m!365927 () Bool)

(assert (=> d!81656 m!365927))

(declare-fun m!365929 () Bool)

(assert (=> d!81656 m!365929))

(declare-fun m!365931 () Bool)

(assert (=> d!81656 m!365931))

(declare-fun m!365933 () Bool)

(assert (=> d!81656 m!365933))

(declare-fun m!365935 () Bool)

(assert (=> d!81656 m!365935))

(declare-fun m!365937 () Bool)

(assert (=> d!81656 m!365937))

(declare-fun m!365939 () Bool)

(assert (=> d!81656 m!365939))

(assert (=> d!81656 m!365813))

(declare-fun m!365941 () Bool)

(assert (=> d!81656 m!365941))

(declare-fun m!365943 () Bool)

(assert (=> b!242852 m!365943))

(assert (=> b!242852 m!365461))

(assert (=> b!242852 m!365449))

(assert (=> b!242560 d!81656))

(declare-fun d!81658 () Bool)

(assert (=> d!81658 (isPrefixOf!0 thiss!1005 (_2!11306 lt!377996))))

(declare-fun lt!378583 () Unit!17755)

(declare-fun choose!30 (BitStream!10594 BitStream!10594 BitStream!10594) Unit!17755)

(assert (=> d!81658 (= lt!378583 (choose!30 thiss!1005 (_2!11306 lt!377997) (_2!11306 lt!377996)))))

(assert (=> d!81658 (isPrefixOf!0 thiss!1005 (_2!11306 lt!377997))))

(assert (=> d!81658 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11306 lt!377997) (_2!11306 lt!377996)) lt!378583)))

(declare-fun bs!20646 () Bool)

(assert (= bs!20646 d!81658))

(assert (=> bs!20646 m!365477))

(declare-fun m!365945 () Bool)

(assert (=> bs!20646 m!365945))

(assert (=> bs!20646 m!365445))

(assert (=> b!242560 d!81658))

(declare-fun d!81660 () Bool)

(declare-fun res!202841 () Bool)

(declare-fun e!168339 () Bool)

(assert (=> d!81660 (=> (not res!202841) (not e!168339))))

(assert (=> d!81660 (= res!202841 (= (size!5836 (buf!6302 thiss!1005)) (size!5836 (buf!6302 (_2!11306 lt!377996)))))))

(assert (=> d!81660 (= (isPrefixOf!0 thiss!1005 (_2!11306 lt!377996)) e!168339)))

(declare-fun b!242856 () Bool)

(declare-fun res!202842 () Bool)

(assert (=> b!242856 (=> (not res!202842) (not e!168339))))

(assert (=> b!242856 (= res!202842 (bvsle (bitIndex!0 (size!5836 (buf!6302 thiss!1005)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005)) (bitIndex!0 (size!5836 (buf!6302 (_2!11306 lt!377996))) (currentByte!11665 (_2!11306 lt!377996)) (currentBit!11660 (_2!11306 lt!377996)))))))

(declare-fun b!242857 () Bool)

(declare-fun e!168340 () Bool)

(assert (=> b!242857 (= e!168339 e!168340)))

(declare-fun res!202840 () Bool)

(assert (=> b!242857 (=> res!202840 e!168340)))

(assert (=> b!242857 (= res!202840 (= (size!5836 (buf!6302 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!242858 () Bool)

(assert (=> b!242858 (= e!168340 (arrayBitRangesEq!0 (buf!6302 thiss!1005) (buf!6302 (_2!11306 lt!377996)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5836 (buf!6302 thiss!1005)) (currentByte!11665 thiss!1005) (currentBit!11660 thiss!1005))))))

(assert (= (and d!81660 res!202841) b!242856))

(assert (= (and b!242856 res!202842) b!242857))

(assert (= (and b!242857 (not res!202840)) b!242858))

(assert (=> b!242856 m!365449))

(assert (=> b!242856 m!365461))

(assert (=> b!242858 m!365449))

(assert (=> b!242858 m!365449))

(declare-fun m!365947 () Bool)

(assert (=> b!242858 m!365947))

(assert (=> b!242560 d!81660))

(declare-fun d!81662 () Bool)

(declare-fun e!168341 () Bool)

(assert (=> d!81662 e!168341))

(declare-fun res!202844 () Bool)

(assert (=> d!81662 (=> (not res!202844) (not e!168341))))

(declare-fun lt!378585 () (_ BitVec 64))

(declare-fun lt!378588 () (_ BitVec 64))

(declare-fun lt!378586 () (_ BitVec 64))

(assert (=> d!81662 (= res!202844 (= lt!378585 (bvsub lt!378588 lt!378586)))))

(assert (=> d!81662 (or (= (bvand lt!378588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378586 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378588 lt!378586) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81662 (= lt!378586 (remainingBits!0 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11305 lt!378010)))) ((_ sign_extend 32) (currentByte!11665 (_1!11305 lt!378010))) ((_ sign_extend 32) (currentBit!11660 (_1!11305 lt!378010)))))))

(declare-fun lt!378587 () (_ BitVec 64))

(declare-fun lt!378584 () (_ BitVec 64))

(assert (=> d!81662 (= lt!378588 (bvmul lt!378587 lt!378584))))

(assert (=> d!81662 (or (= lt!378587 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378584 (bvsdiv (bvmul lt!378587 lt!378584) lt!378587)))))

(assert (=> d!81662 (= lt!378584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81662 (= lt!378587 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11305 lt!378010)))))))

(assert (=> d!81662 (= lt!378585 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11665 (_1!11305 lt!378010))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11660 (_1!11305 lt!378010)))))))

(assert (=> d!81662 (invariant!0 (currentBit!11660 (_1!11305 lt!378010)) (currentByte!11665 (_1!11305 lt!378010)) (size!5836 (buf!6302 (_1!11305 lt!378010))))))

(assert (=> d!81662 (= (bitIndex!0 (size!5836 (buf!6302 (_1!11305 lt!378010))) (currentByte!11665 (_1!11305 lt!378010)) (currentBit!11660 (_1!11305 lt!378010))) lt!378585)))

(declare-fun b!242859 () Bool)

(declare-fun res!202843 () Bool)

(assert (=> b!242859 (=> (not res!202843) (not e!168341))))

(assert (=> b!242859 (= res!202843 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378585))))

(declare-fun b!242860 () Bool)

(declare-fun lt!378589 () (_ BitVec 64))

(assert (=> b!242860 (= e!168341 (bvsle lt!378585 (bvmul lt!378589 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242860 (or (= lt!378589 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378589 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378589)))))

(assert (=> b!242860 (= lt!378589 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11305 lt!378010)))))))

(assert (= (and d!81662 res!202844) b!242859))

(assert (= (and b!242859 res!202843) b!242860))

(declare-fun m!365949 () Bool)

(assert (=> d!81662 m!365949))

(declare-fun m!365951 () Bool)

(assert (=> d!81662 m!365951))

(assert (=> b!242560 d!81662))

(assert (=> b!242560 d!81582))

(declare-fun d!81664 () Bool)

(declare-fun e!168347 () Bool)

(assert (=> d!81664 e!168347))

(declare-fun res!202850 () Bool)

(assert (=> d!81664 (=> (not res!202850) (not e!168347))))

(assert (=> d!81664 (= res!202850 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!378604 () Unit!17755)

(declare-fun choose!27 (BitStream!10594 BitStream!10594 (_ BitVec 64) (_ BitVec 64)) Unit!17755)

(assert (=> d!81664 (= lt!378604 (choose!27 thiss!1005 (_2!11306 lt!377997) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!81664 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!81664 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11306 lt!377997) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!378604)))

(declare-fun b!242866 () Bool)

(assert (=> b!242866 (= e!168347 (validate_offset_bits!1 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377997)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!81664 res!202850) b!242866))

(declare-fun m!365963 () Bool)

(assert (=> d!81664 m!365963))

(assert (=> b!242866 m!365469))

(assert (=> b!242560 d!81664))

(declare-fun d!81668 () Bool)

(assert (=> d!81668 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377997)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5836 (buf!6302 (_2!11306 lt!377997)))) ((_ sign_extend 32) (currentByte!11665 (_2!11306 lt!377997))) ((_ sign_extend 32) (currentBit!11660 (_2!11306 lt!377997)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!20647 () Bool)

(assert (= bs!20647 d!81668))

(assert (=> bs!20647 m!365739))

(assert (=> b!242560 d!81668))

(declare-fun d!81670 () Bool)

(declare-fun e!168348 () Bool)

(assert (=> d!81670 e!168348))

(declare-fun res!202852 () Bool)

(assert (=> d!81670 (=> (not res!202852) (not e!168348))))

(declare-fun lt!378606 () (_ BitVec 64))

(declare-fun lt!378609 () (_ BitVec 64))

(declare-fun lt!378607 () (_ BitVec 64))

(assert (=> d!81670 (= res!202852 (= lt!378606 (bvsub lt!378609 lt!378607)))))

(assert (=> d!81670 (or (= (bvand lt!378609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378607 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378609 lt!378607) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81670 (= lt!378607 (remainingBits!0 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11305 lt!378007)))) ((_ sign_extend 32) (currentByte!11665 (_1!11305 lt!378007))) ((_ sign_extend 32) (currentBit!11660 (_1!11305 lt!378007)))))))

(declare-fun lt!378608 () (_ BitVec 64))

(declare-fun lt!378605 () (_ BitVec 64))

(assert (=> d!81670 (= lt!378609 (bvmul lt!378608 lt!378605))))

(assert (=> d!81670 (or (= lt!378608 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378605 (bvsdiv (bvmul lt!378608 lt!378605) lt!378608)))))

(assert (=> d!81670 (= lt!378605 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81670 (= lt!378608 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11305 lt!378007)))))))

(assert (=> d!81670 (= lt!378606 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11665 (_1!11305 lt!378007))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11660 (_1!11305 lt!378007)))))))

(assert (=> d!81670 (invariant!0 (currentBit!11660 (_1!11305 lt!378007)) (currentByte!11665 (_1!11305 lt!378007)) (size!5836 (buf!6302 (_1!11305 lt!378007))))))

(assert (=> d!81670 (= (bitIndex!0 (size!5836 (buf!6302 (_1!11305 lt!378007))) (currentByte!11665 (_1!11305 lt!378007)) (currentBit!11660 (_1!11305 lt!378007))) lt!378606)))

(declare-fun b!242867 () Bool)

(declare-fun res!202851 () Bool)

(assert (=> b!242867 (=> (not res!202851) (not e!168348))))

(assert (=> b!242867 (= res!202851 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378606))))

(declare-fun b!242868 () Bool)

(declare-fun lt!378610 () (_ BitVec 64))

(assert (=> b!242868 (= e!168348 (bvsle lt!378606 (bvmul lt!378610 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242868 (or (= lt!378610 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378610 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378610)))))

(assert (=> b!242868 (= lt!378610 ((_ sign_extend 32) (size!5836 (buf!6302 (_1!11305 lt!378007)))))))

(assert (= (and d!81670 res!202852) b!242867))

(assert (= (and b!242867 res!202851) b!242868))

(declare-fun m!365965 () Bool)

(assert (=> d!81670 m!365965))

(declare-fun m!365967 () Bool)

(assert (=> d!81670 m!365967))

(assert (=> b!242560 d!81670))

(declare-fun d!81672 () Bool)

(declare-fun lt!378611 () tuple2!20786)

(assert (=> d!81672 (= lt!378611 (readBit!0 lt!378006))))

(assert (=> d!81672 (= (readBitPure!0 lt!378006) (tuple2!20767 (_2!11315 lt!378611) (_1!11315 lt!378611)))))

(declare-fun bs!20648 () Bool)

(assert (= bs!20648 d!81672))

(declare-fun m!365969 () Bool)

(assert (=> bs!20648 m!365969))

(assert (=> b!242560 d!81672))

(declare-fun d!81674 () Bool)

(declare-fun e!168351 () Bool)

(assert (=> d!81674 e!168351))

(declare-fun res!202855 () Bool)

(assert (=> d!81674 (=> (not res!202855) (not e!168351))))

(declare-fun lt!378622 () tuple2!20766)

(declare-fun lt!378620 () tuple2!20766)

(assert (=> d!81674 (= res!202855 (= (bitIndex!0 (size!5836 (buf!6302 (_1!11305 lt!378622))) (currentByte!11665 (_1!11305 lt!378622)) (currentBit!11660 (_1!11305 lt!378622))) (bitIndex!0 (size!5836 (buf!6302 (_1!11305 lt!378620))) (currentByte!11665 (_1!11305 lt!378620)) (currentBit!11660 (_1!11305 lt!378620)))))))

(declare-fun lt!378621 () Unit!17755)

(declare-fun lt!378623 () BitStream!10594)

(declare-fun choose!50 (BitStream!10594 BitStream!10594 BitStream!10594 tuple2!20766 tuple2!20766 BitStream!10594 Bool tuple2!20766 tuple2!20766 BitStream!10594 Bool) Unit!17755)

(assert (=> d!81674 (= lt!378621 (choose!50 lt!378006 (_2!11306 lt!377996) lt!378623 lt!378622 (tuple2!20767 (_1!11305 lt!378622) (_2!11305 lt!378622)) (_1!11305 lt!378622) (_2!11305 lt!378622) lt!378620 (tuple2!20767 (_1!11305 lt!378620) (_2!11305 lt!378620)) (_1!11305 lt!378620) (_2!11305 lt!378620)))))

(assert (=> d!81674 (= lt!378620 (readBitPure!0 lt!378623))))

(assert (=> d!81674 (= lt!378622 (readBitPure!0 lt!378006))))

(assert (=> d!81674 (= lt!378623 (BitStream!10595 (buf!6302 (_2!11306 lt!377996)) (currentByte!11665 lt!378006) (currentBit!11660 lt!378006)))))

(assert (=> d!81674 (invariant!0 (currentBit!11660 lt!378006) (currentByte!11665 lt!378006) (size!5836 (buf!6302 (_2!11306 lt!377996))))))

(assert (=> d!81674 (= (readBitPrefixLemma!0 lt!378006 (_2!11306 lt!377996)) lt!378621)))

(declare-fun b!242871 () Bool)

(assert (=> b!242871 (= e!168351 (= (_2!11305 lt!378622) (_2!11305 lt!378620)))))

(assert (= (and d!81674 res!202855) b!242871))

(declare-fun m!365971 () Bool)

(assert (=> d!81674 m!365971))

(declare-fun m!365973 () Bool)

(assert (=> d!81674 m!365973))

(assert (=> d!81674 m!365483))

(declare-fun m!365975 () Bool)

(assert (=> d!81674 m!365975))

(declare-fun m!365977 () Bool)

(assert (=> d!81674 m!365977))

(declare-fun m!365979 () Bool)

(assert (=> d!81674 m!365979))

(assert (=> b!242560 d!81674))

(declare-fun d!81676 () Bool)

(assert (=> d!81676 (= (invariant!0 (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005) (size!5836 (buf!6302 (_2!11306 lt!377997)))) (and (bvsge (currentBit!11660 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11660 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11665 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11665 thiss!1005) (size!5836 (buf!6302 (_2!11306 lt!377997)))) (and (= (currentBit!11660 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11665 thiss!1005) (size!5836 (buf!6302 (_2!11306 lt!377997))))))))))

(assert (=> b!242559 d!81676))

(declare-fun d!81678 () Bool)

(assert (=> d!81678 (= (invariant!0 (currentBit!11660 thiss!1005) (currentByte!11665 thiss!1005) (size!5836 (buf!6302 (_2!11306 lt!377996)))) (and (bvsge (currentBit!11660 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11660 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11665 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11665 thiss!1005) (size!5836 (buf!6302 (_2!11306 lt!377996)))) (and (= (currentBit!11660 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11665 thiss!1005) (size!5836 (buf!6302 (_2!11306 lt!377996))))))))))

(assert (=> b!242570 d!81678))

(push 1)

(assert (not d!81576))

(assert (not d!81662))

(assert (not b!242804))

(assert (not d!81570))

(assert (not d!81612))

(assert (not d!81628))

(assert (not d!81568))

(assert (not d!81632))

(assert (not d!81656))

(assert (not d!81562))

(assert (not b!242850))

(assert (not b!242851))

(assert (not d!81564))

(assert (not d!81626))

(assert (not b!242730))

(assert (not d!81578))

(assert (not d!81658))

(assert (not b!242849))

(assert (not b!242848))

(assert (not d!81664))

(assert (not b!242803))

(assert (not d!81670))

(assert (not b!242723))

(assert (not b!242732))

(assert (not b!242853))

(assert (not b!242777))

(assert (not b!242802))

(assert (not b!242866))

(assert (not d!81558))

(assert (not b!242775))

(assert (not d!81610))

(assert (not d!81674))

(assert (not b!242854))

(assert (not d!81566))

(assert (not d!81580))

(assert (not d!81582))

(assert (not b!242852))

(assert (not d!81672))

(assert (not d!81572))

(assert (not b!242778))

(assert (not b!242721))

(assert (not d!81668))

(assert (not b!242739))

(assert (not b!242776))

(assert (not b!242858))

(assert (not b!242847))

(assert (not b!242856))

(assert (not b!242801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

