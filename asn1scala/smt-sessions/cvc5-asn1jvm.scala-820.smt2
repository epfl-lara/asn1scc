; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24182 () Bool)

(assert start!24182)

(declare-fun b!122743 () Bool)

(declare-fun res!101753 () Bool)

(declare-fun e!80469 () Bool)

(assert (=> b!122743 (=> (not res!101753) (not e!80469))))

(declare-datatypes ((array!5432 0))(
  ( (array!5433 (arr!3051 (Array (_ BitVec 32) (_ BitVec 8))) (size!2458 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4390 0))(
  ( (BitStream!4391 (buf!2898 array!5432) (currentByte!5595 (_ BitVec 32)) (currentBit!5590 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4390)

(declare-datatypes ((Unit!7555 0))(
  ( (Unit!7556) )
))
(declare-datatypes ((tuple2!10384 0))(
  ( (tuple2!10385 (_1!5457 Unit!7555) (_2!5457 BitStream!4390)) )
))
(declare-fun lt!193212 () tuple2!10384)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122743 (= res!101753 (invariant!0 (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305) (size!2458 (buf!2898 (_2!5457 lt!193212)))))))

(declare-fun b!122744 () Bool)

(declare-fun e!80468 () Bool)

(declare-datatypes ((tuple2!10386 0))(
  ( (tuple2!10387 (_1!5458 BitStream!4390) (_2!5458 Bool)) )
))
(declare-fun lt!193216 () tuple2!10386)

(declare-fun lt!193213 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122744 (= e!80468 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!193216))) (currentByte!5595 (_1!5458 lt!193216)) (currentBit!5590 (_1!5458 lt!193216))) lt!193213))))

(declare-fun b!122745 () Bool)

(declare-fun e!80464 () Bool)

(declare-fun e!80465 () Bool)

(assert (=> b!122745 (= e!80464 e!80465)))

(declare-fun res!101754 () Bool)

(assert (=> b!122745 (=> (not res!101754) (not e!80465))))

(declare-fun lt!193234 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122745 (= res!101754 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 thiss!1305))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305)) lt!193234))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!122745 (= lt!193234 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122746 () Bool)

(declare-fun res!101746 () Bool)

(assert (=> b!122746 (=> (not res!101746) (not e!80465))))

(assert (=> b!122746 (= res!101746 (bvslt i!615 nBits!396))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun e!80470 () Bool)

(declare-fun lt!193210 () (_ BitVec 64))

(declare-fun lt!193209 () tuple2!10384)

(declare-datatypes ((tuple2!10388 0))(
  ( (tuple2!10389 (_1!5459 BitStream!4390) (_2!5459 BitStream!4390)) )
))
(declare-fun lt!193224 () tuple2!10388)

(declare-fun lt!193236 () BitStream!4390)

(declare-fun b!122747 () Bool)

(declare-fun lt!193225 () (_ BitVec 64))

(declare-datatypes ((tuple2!10390 0))(
  ( (tuple2!10391 (_1!5460 BitStream!4390) (_2!5460 (_ BitVec 64))) )
))
(declare-fun lt!193235 () tuple2!10390)

(assert (=> b!122747 (= e!80470 (or (not (= (_1!5459 lt!193224) lt!193236)) (and (= (size!2458 (buf!2898 thiss!1305)) (size!2458 (buf!2898 (_2!5457 lt!193209)))) (= lt!193210 (bvadd lt!193225 lt!193234)) (= (_2!5460 lt!193235) v!199))))))

(declare-fun e!80467 () Bool)

(assert (=> b!122747 e!80467))

(declare-fun res!101747 () Bool)

(assert (=> b!122747 (=> (not res!101747) (not e!80467))))

(declare-fun lt!193233 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4390 (_ BitVec 64)) BitStream!4390)

(assert (=> b!122747 (= res!101747 (= (_1!5459 lt!193224) (withMovedBitIndex!0 (_2!5459 lt!193224) (bvsub lt!193233 lt!193210))))))

(assert (=> b!122747 (= lt!193233 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(declare-fun lt!193219 () tuple2!10388)

(assert (=> b!122747 (= (_1!5459 lt!193219) (withMovedBitIndex!0 (_2!5459 lt!193219) (bvsub lt!193225 lt!193210)))))

(assert (=> b!122747 (= lt!193210 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209))))))

(assert (=> b!122747 (= lt!193225 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))

(declare-fun lt!193208 () tuple2!10390)

(assert (=> b!122747 (and (= (_2!5460 lt!193235) (_2!5460 lt!193208)) (= (_1!5460 lt!193235) (_1!5460 lt!193208)))))

(declare-fun lt!193223 () (_ BitVec 64))

(declare-fun lt!193214 () Unit!7555)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7555)

(assert (=> b!122747 (= lt!193214 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5459 lt!193219) nBits!396 i!615 lt!193223))))

(declare-fun lt!193230 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10390)

(assert (=> b!122747 (= lt!193208 (readNLeastSignificantBitsLoopPure!0 lt!193236 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193230))))

(assert (=> b!122747 (= lt!193236 (withMovedBitIndex!0 (_1!5459 lt!193219) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!122748 () Bool)

(declare-fun e!80466 () Bool)

(declare-fun lt!193228 () tuple2!10386)

(declare-fun lt!193232 () tuple2!10386)

(assert (=> b!122748 (= e!80466 (= (_2!5458 lt!193228) (_2!5458 lt!193232)))))

(declare-fun b!122749 () Bool)

(declare-fun e!80472 () Bool)

(assert (=> b!122749 (= e!80472 e!80468)))

(declare-fun res!101743 () Bool)

(assert (=> b!122749 (=> (not res!101743) (not e!80468))))

(declare-fun lt!193222 () Bool)

(assert (=> b!122749 (= res!101743 (and (= (_2!5458 lt!193216) lt!193222) (= (_1!5458 lt!193216) (_2!5457 lt!193212))))))

(declare-fun readBitPure!0 (BitStream!4390) tuple2!10386)

(declare-fun readerFrom!0 (BitStream!4390 (_ BitVec 32) (_ BitVec 32)) BitStream!4390)

(assert (=> b!122749 (= lt!193216 (readBitPure!0 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))))

(declare-fun b!122750 () Bool)

(declare-fun e!80471 () Bool)

(declare-fun array_inv!2260 (array!5432) Bool)

(assert (=> b!122750 (= e!80471 (array_inv!2260 (buf!2898 thiss!1305)))))

(declare-fun b!122751 () Bool)

(declare-fun res!101742 () Bool)

(assert (=> b!122751 (=> (not res!101742) (not e!80472))))

(declare-fun isPrefixOf!0 (BitStream!4390 BitStream!4390) Bool)

(assert (=> b!122751 (= res!101742 (isPrefixOf!0 thiss!1305 (_2!5457 lt!193212)))))

(declare-fun b!122752 () Bool)

(declare-fun res!101750 () Bool)

(assert (=> b!122752 (=> (not res!101750) (not e!80465))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122752 (= res!101750 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122753 () Bool)

(assert (=> b!122753 (= e!80469 (invariant!0 (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305) (size!2458 (buf!2898 (_2!5457 lt!193209)))))))

(declare-fun b!122754 () Bool)

(declare-fun e!80462 () Bool)

(assert (=> b!122754 (= e!80462 e!80472)))

(declare-fun res!101748 () Bool)

(assert (=> b!122754 (=> (not res!101748) (not e!80472))))

(declare-fun lt!193227 () (_ BitVec 64))

(assert (=> b!122754 (= res!101748 (= lt!193213 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!193227)))))

(assert (=> b!122754 (= lt!193213 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(assert (=> b!122754 (= lt!193227 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))

(declare-fun lt!193221 () tuple2!10390)

(declare-fun b!122755 () Bool)

(assert (=> b!122755 (= e!80467 (and (= lt!193225 (bvsub lt!193233 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5459 lt!193224) lt!193236)) (and (= (_2!5460 lt!193235) (_2!5460 lt!193221)) (= (_1!5460 lt!193235) (_2!5459 lt!193219))))))))

(declare-fun b!122742 () Bool)

(assert (=> b!122742 (= e!80465 (not e!80470))))

(declare-fun res!101751 () Bool)

(assert (=> b!122742 (=> res!101751 e!80470)))

(assert (=> b!122742 (= res!101751 (not (= (_1!5460 lt!193221) (_2!5459 lt!193224))))))

(assert (=> b!122742 (= lt!193221 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!193224) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193230))))

(declare-fun lt!193215 () (_ BitVec 64))

(assert (=> b!122742 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!193215)))

(declare-fun lt!193226 () Unit!7555)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4390 array!5432 (_ BitVec 64)) Unit!7555)

(assert (=> b!122742 (= lt!193226 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5457 lt!193212) (buf!2898 (_2!5457 lt!193209)) lt!193215))))

(assert (=> b!122742 (= lt!193215 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!193211 () (_ BitVec 64))

(declare-fun lt!193217 () tuple2!10386)

(assert (=> b!122742 (= lt!193230 (bvor lt!193223 (ite (_2!5458 lt!193217) lt!193211 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122742 (= lt!193235 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!193219) nBits!396 i!615 lt!193223))))

(assert (=> b!122742 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305)) lt!193234)))

(declare-fun lt!193220 () Unit!7555)

(assert (=> b!122742 (= lt!193220 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2898 (_2!5457 lt!193209)) lt!193234))))

(assert (=> b!122742 (= lt!193223 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!122742 (= (_2!5458 lt!193217) lt!193222)))

(assert (=> b!122742 (= lt!193217 (readBitPure!0 (_1!5459 lt!193219)))))

(declare-fun reader!0 (BitStream!4390 BitStream!4390) tuple2!10388)

(assert (=> b!122742 (= lt!193224 (reader!0 (_2!5457 lt!193212) (_2!5457 lt!193209)))))

(assert (=> b!122742 (= lt!193219 (reader!0 thiss!1305 (_2!5457 lt!193209)))))

(assert (=> b!122742 e!80466))

(declare-fun res!101745 () Bool)

(assert (=> b!122742 (=> (not res!101745) (not e!80466))))

(assert (=> b!122742 (= res!101745 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!193228))) (currentByte!5595 (_1!5458 lt!193228)) (currentBit!5590 (_1!5458 lt!193228))) (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!193232))) (currentByte!5595 (_1!5458 lt!193232)) (currentBit!5590 (_1!5458 lt!193232)))))))

(declare-fun lt!193229 () Unit!7555)

(declare-fun lt!193231 () BitStream!4390)

(declare-fun readBitPrefixLemma!0 (BitStream!4390 BitStream!4390) Unit!7555)

(assert (=> b!122742 (= lt!193229 (readBitPrefixLemma!0 lt!193231 (_2!5457 lt!193209)))))

(assert (=> b!122742 (= lt!193232 (readBitPure!0 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(assert (=> b!122742 (= lt!193228 (readBitPure!0 lt!193231))))

(assert (=> b!122742 (= lt!193231 (BitStream!4391 (buf!2898 (_2!5457 lt!193212)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))

(assert (=> b!122742 e!80469))

(declare-fun res!101752 () Bool)

(assert (=> b!122742 (=> (not res!101752) (not e!80469))))

(assert (=> b!122742 (= res!101752 (isPrefixOf!0 thiss!1305 (_2!5457 lt!193209)))))

(declare-fun lt!193218 () Unit!7555)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4390 BitStream!4390 BitStream!4390) Unit!7555)

(assert (=> b!122742 (= lt!193218 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5457 lt!193212) (_2!5457 lt!193209)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4390 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10384)

(assert (=> b!122742 (= lt!193209 (appendNLeastSignificantBitsLoop!0 (_2!5457 lt!193212) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!122742 e!80462))

(declare-fun res!101749 () Bool)

(assert (=> b!122742 (=> (not res!101749) (not e!80462))))

(assert (=> b!122742 (= res!101749 (= (size!2458 (buf!2898 thiss!1305)) (size!2458 (buf!2898 (_2!5457 lt!193212)))))))

(declare-fun appendBit!0 (BitStream!4390 Bool) tuple2!10384)

(assert (=> b!122742 (= lt!193212 (appendBit!0 thiss!1305 lt!193222))))

(assert (=> b!122742 (= lt!193222 (not (= (bvand v!199 lt!193211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122742 (= lt!193211 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun res!101744 () Bool)

(assert (=> start!24182 (=> (not res!101744) (not e!80464))))

(assert (=> start!24182 (= res!101744 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24182 e!80464))

(assert (=> start!24182 true))

(declare-fun inv!12 (BitStream!4390) Bool)

(assert (=> start!24182 (and (inv!12 thiss!1305) e!80471)))

(assert (= (and start!24182 res!101744) b!122745))

(assert (= (and b!122745 res!101754) b!122752))

(assert (= (and b!122752 res!101750) b!122746))

(assert (= (and b!122746 res!101746) b!122742))

(assert (= (and b!122742 res!101749) b!122754))

(assert (= (and b!122754 res!101748) b!122751))

(assert (= (and b!122751 res!101742) b!122749))

(assert (= (and b!122749 res!101743) b!122744))

(assert (= (and b!122742 res!101752) b!122743))

(assert (= (and b!122743 res!101753) b!122753))

(assert (= (and b!122742 res!101745) b!122748))

(assert (= (and b!122742 (not res!101751)) b!122747))

(assert (= (and b!122747 res!101747) b!122755))

(assert (= start!24182 b!122750))

(declare-fun m!186491 () Bool)

(assert (=> b!122749 m!186491))

(assert (=> b!122749 m!186491))

(declare-fun m!186493 () Bool)

(assert (=> b!122749 m!186493))

(declare-fun m!186495 () Bool)

(assert (=> b!122753 m!186495))

(declare-fun m!186497 () Bool)

(assert (=> b!122744 m!186497))

(declare-fun m!186499 () Bool)

(assert (=> b!122752 m!186499))

(declare-fun m!186501 () Bool)

(assert (=> start!24182 m!186501))

(declare-fun m!186503 () Bool)

(assert (=> b!122747 m!186503))

(declare-fun m!186505 () Bool)

(assert (=> b!122747 m!186505))

(declare-fun m!186507 () Bool)

(assert (=> b!122747 m!186507))

(declare-fun m!186509 () Bool)

(assert (=> b!122747 m!186509))

(declare-fun m!186511 () Bool)

(assert (=> b!122747 m!186511))

(declare-fun m!186513 () Bool)

(assert (=> b!122747 m!186513))

(declare-fun m!186515 () Bool)

(assert (=> b!122747 m!186515))

(declare-fun m!186517 () Bool)

(assert (=> b!122747 m!186517))

(declare-fun m!186519 () Bool)

(assert (=> b!122751 m!186519))

(assert (=> b!122754 m!186513))

(assert (=> b!122754 m!186517))

(declare-fun m!186521 () Bool)

(assert (=> b!122743 m!186521))

(declare-fun m!186523 () Bool)

(assert (=> b!122750 m!186523))

(declare-fun m!186525 () Bool)

(assert (=> b!122742 m!186525))

(declare-fun m!186527 () Bool)

(assert (=> b!122742 m!186527))

(declare-fun m!186529 () Bool)

(assert (=> b!122742 m!186529))

(declare-fun m!186531 () Bool)

(assert (=> b!122742 m!186531))

(declare-fun m!186533 () Bool)

(assert (=> b!122742 m!186533))

(declare-fun m!186535 () Bool)

(assert (=> b!122742 m!186535))

(declare-fun m!186537 () Bool)

(assert (=> b!122742 m!186537))

(declare-fun m!186539 () Bool)

(assert (=> b!122742 m!186539))

(declare-fun m!186541 () Bool)

(assert (=> b!122742 m!186541))

(declare-fun m!186543 () Bool)

(assert (=> b!122742 m!186543))

(declare-fun m!186545 () Bool)

(assert (=> b!122742 m!186545))

(declare-fun m!186547 () Bool)

(assert (=> b!122742 m!186547))

(declare-fun m!186549 () Bool)

(assert (=> b!122742 m!186549))

(declare-fun m!186551 () Bool)

(assert (=> b!122742 m!186551))

(declare-fun m!186553 () Bool)

(assert (=> b!122742 m!186553))

(declare-fun m!186555 () Bool)

(assert (=> b!122742 m!186555))

(declare-fun m!186557 () Bool)

(assert (=> b!122742 m!186557))

(declare-fun m!186559 () Bool)

(assert (=> b!122742 m!186559))

(declare-fun m!186561 () Bool)

(assert (=> b!122742 m!186561))

(declare-fun m!186563 () Bool)

(assert (=> b!122745 m!186563))

(push 1)

(assert (not b!122753))

(assert (not b!122744))

(assert (not b!122754))

(assert (not b!122750))

(assert (not b!122743))

(assert (not b!122747))

(assert (not b!122749))

(assert (not start!24182))

(assert (not b!122745))

(assert (not b!122742))

(assert (not b!122752))

(assert (not b!122751))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!39490 () Bool)

(declare-fun lt!193465 () tuple2!10390)

(declare-fun lt!193463 () tuple2!10390)

(assert (=> d!39490 (and (= (_2!5460 lt!193465) (_2!5460 lt!193463)) (= (_1!5460 lt!193465) (_1!5460 lt!193463)))))

(declare-fun lt!193466 () Bool)

(declare-fun lt!193462 () (_ BitVec 64))

(declare-fun lt!193464 () BitStream!4390)

(declare-fun lt!193461 () Unit!7555)

(declare-fun choose!45 (BitStream!4390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10390 tuple2!10390 BitStream!4390 (_ BitVec 64) Bool BitStream!4390 (_ BitVec 64) tuple2!10390 tuple2!10390 BitStream!4390 (_ BitVec 64)) Unit!7555)

(assert (=> d!39490 (= lt!193461 (choose!45 (_1!5459 lt!193219) nBits!396 i!615 lt!193223 lt!193465 (tuple2!10391 (_1!5460 lt!193465) (_2!5460 lt!193465)) (_1!5460 lt!193465) (_2!5460 lt!193465) lt!193466 lt!193464 lt!193462 lt!193463 (tuple2!10391 (_1!5460 lt!193463) (_2!5460 lt!193463)) (_1!5460 lt!193463) (_2!5460 lt!193463)))))

(assert (=> d!39490 (= lt!193463 (readNLeastSignificantBitsLoopPure!0 lt!193464 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!193462))))

(assert (=> d!39490 (= lt!193462 (bvor lt!193223 (ite lt!193466 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39490 (= lt!193464 (withMovedBitIndex!0 (_1!5459 lt!193219) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!39490 (= lt!193466 (_2!5458 (readBitPure!0 (_1!5459 lt!193219))))))

(assert (=> d!39490 (= lt!193465 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!193219) nBits!396 i!615 lt!193223))))

(assert (=> d!39490 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5459 lt!193219) nBits!396 i!615 lt!193223) lt!193461)))

(declare-fun bs!9564 () Bool)

(assert (= bs!9564 d!39490))

(assert (=> bs!9564 m!186557))

(declare-fun m!186739 () Bool)

(assert (=> bs!9564 m!186739))

(assert (=> bs!9564 m!186531))

(declare-fun m!186741 () Bool)

(assert (=> bs!9564 m!186741))

(assert (=> bs!9564 m!186505))

(assert (=> b!122747 d!39490))

(declare-fun d!39492 () Bool)

(declare-fun e!80559 () Bool)

(assert (=> d!39492 e!80559))

(declare-fun res!101867 () Bool)

(assert (=> d!39492 (=> (not res!101867) (not e!80559))))

(declare-fun lt!193484 () (_ BitVec 64))

(declare-fun lt!193483 () (_ BitVec 64))

(declare-fun lt!193479 () (_ BitVec 64))

(assert (=> d!39492 (= res!101867 (= lt!193484 (bvsub lt!193479 lt!193483)))))

(assert (=> d!39492 (or (= (bvand lt!193479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193483 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193479 lt!193483) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!39492 (= lt!193483 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193209))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193209)))))))

(declare-fun lt!193481 () (_ BitVec 64))

(declare-fun lt!193482 () (_ BitVec 64))

(assert (=> d!39492 (= lt!193479 (bvmul lt!193481 lt!193482))))

(assert (=> d!39492 (or (= lt!193481 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193482 (bvsdiv (bvmul lt!193481 lt!193482) lt!193481)))))

(assert (=> d!39492 (= lt!193482 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39492 (= lt!193481 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))))))

(assert (=> d!39492 (= lt!193484 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193209))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193209)))))))

(assert (=> d!39492 (invariant!0 (currentBit!5590 (_2!5457 lt!193209)) (currentByte!5595 (_2!5457 lt!193209)) (size!2458 (buf!2898 (_2!5457 lt!193209))))))

(assert (=> d!39492 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209))) lt!193484)))

(declare-fun b!122872 () Bool)

(declare-fun res!101866 () Bool)

(assert (=> b!122872 (=> (not res!101866) (not e!80559))))

(assert (=> b!122872 (= res!101866 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193484))))

(declare-fun b!122873 () Bool)

(declare-fun lt!193480 () (_ BitVec 64))

(assert (=> b!122873 (= e!80559 (bvsle lt!193484 (bvmul lt!193480 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122873 (or (= lt!193480 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193480 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193480)))))

(assert (=> b!122873 (= lt!193480 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))))))

(assert (= (and d!39492 res!101867) b!122872))

(assert (= (and b!122872 res!101866) b!122873))

(declare-fun m!186743 () Bool)

(assert (=> d!39492 m!186743))

(declare-fun m!186745 () Bool)

(assert (=> d!39492 m!186745))

(assert (=> b!122747 d!39492))

(declare-fun d!39500 () Bool)

(declare-datatypes ((tuple2!10414 0))(
  ( (tuple2!10415 (_1!5472 (_ BitVec 64)) (_2!5472 BitStream!4390)) )
))
(declare-fun lt!193487 () tuple2!10414)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10414)

(assert (=> d!39500 (= lt!193487 (readNLeastSignificantBitsLoop!0 lt!193236 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193230))))

(assert (=> d!39500 (= (readNLeastSignificantBitsLoopPure!0 lt!193236 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193230) (tuple2!10391 (_2!5472 lt!193487) (_1!5472 lt!193487)))))

(declare-fun bs!9565 () Bool)

(assert (= bs!9565 d!39500))

(declare-fun m!186749 () Bool)

(assert (=> bs!9565 m!186749))

(assert (=> b!122747 d!39500))

(declare-fun d!39504 () Bool)

(declare-fun e!80562 () Bool)

(assert (=> d!39504 e!80562))

(declare-fun res!101872 () Bool)

(assert (=> d!39504 (=> (not res!101872) (not e!80562))))

(declare-fun lt!193492 () (_ BitVec 64))

(declare-fun lt!193488 () (_ BitVec 64))

(declare-fun lt!193493 () (_ BitVec 64))

(assert (=> d!39504 (= res!101872 (= lt!193493 (bvsub lt!193488 lt!193492)))))

(assert (=> d!39504 (or (= (bvand lt!193488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193488 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193488 lt!193492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39504 (= lt!193492 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193212)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212)))))))

(declare-fun lt!193490 () (_ BitVec 64))

(declare-fun lt!193491 () (_ BitVec 64))

(assert (=> d!39504 (= lt!193488 (bvmul lt!193490 lt!193491))))

(assert (=> d!39504 (or (= lt!193490 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193491 (bvsdiv (bvmul lt!193490 lt!193491) lt!193490)))))

(assert (=> d!39504 (= lt!193491 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39504 (= lt!193490 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193212)))))))

(assert (=> d!39504 (= lt!193493 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212)))))))

(assert (=> d!39504 (invariant!0 (currentBit!5590 (_2!5457 lt!193212)) (currentByte!5595 (_2!5457 lt!193212)) (size!2458 (buf!2898 (_2!5457 lt!193212))))))

(assert (=> d!39504 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) lt!193493)))

(declare-fun b!122877 () Bool)

(declare-fun res!101871 () Bool)

(assert (=> b!122877 (=> (not res!101871) (not e!80562))))

(assert (=> b!122877 (= res!101871 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193493))))

(declare-fun b!122878 () Bool)

(declare-fun lt!193489 () (_ BitVec 64))

(assert (=> b!122878 (= e!80562 (bvsle lt!193493 (bvmul lt!193489 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122878 (or (= lt!193489 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193489 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193489)))))

(assert (=> b!122878 (= lt!193489 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193212)))))))

(assert (= (and d!39504 res!101872) b!122877))

(assert (= (and b!122877 res!101871) b!122878))

(declare-fun m!186751 () Bool)

(assert (=> d!39504 m!186751))

(declare-fun m!186753 () Bool)

(assert (=> d!39504 m!186753))

(assert (=> b!122747 d!39504))

(declare-fun d!39506 () Bool)

(declare-fun e!80568 () Bool)

(assert (=> d!39506 e!80568))

(declare-fun res!101881 () Bool)

(assert (=> d!39506 (=> (not res!101881) (not e!80568))))

(declare-fun lt!193517 () (_ BitVec 64))

(declare-fun lt!193516 () BitStream!4390)

(assert (=> d!39506 (= res!101881 (= (bvadd lt!193517 (bvsub lt!193233 lt!193210)) (bitIndex!0 (size!2458 (buf!2898 lt!193516)) (currentByte!5595 lt!193516) (currentBit!5590 lt!193516))))))

(assert (=> d!39506 (or (not (= (bvand lt!193517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193233 lt!193210) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193517 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193517 (bvsub lt!193233 lt!193210)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39506 (= lt!193517 (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!193224))) (currentByte!5595 (_2!5459 lt!193224)) (currentBit!5590 (_2!5459 lt!193224))))))

(declare-fun moveBitIndex!0 (BitStream!4390 (_ BitVec 64)) tuple2!10384)

(assert (=> d!39506 (= lt!193516 (_2!5457 (moveBitIndex!0 (_2!5459 lt!193224) (bvsub lt!193233 lt!193210))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4390 (_ BitVec 64)) Bool)

(assert (=> d!39506 (moveBitIndexPrecond!0 (_2!5459 lt!193224) (bvsub lt!193233 lt!193210))))

(assert (=> d!39506 (= (withMovedBitIndex!0 (_2!5459 lt!193224) (bvsub lt!193233 lt!193210)) lt!193516)))

(declare-fun b!122887 () Bool)

(assert (=> b!122887 (= e!80568 (= (size!2458 (buf!2898 (_2!5459 lt!193224))) (size!2458 (buf!2898 lt!193516))))))

(assert (= (and d!39506 res!101881) b!122887))

(declare-fun m!186759 () Bool)

(assert (=> d!39506 m!186759))

(declare-fun m!186761 () Bool)

(assert (=> d!39506 m!186761))

(declare-fun m!186763 () Bool)

(assert (=> d!39506 m!186763))

(declare-fun m!186765 () Bool)

(assert (=> d!39506 m!186765))

(assert (=> b!122747 d!39506))

(declare-fun d!39510 () Bool)

(declare-fun e!80569 () Bool)

(assert (=> d!39510 e!80569))

(declare-fun res!101882 () Bool)

(assert (=> d!39510 (=> (not res!101882) (not e!80569))))

(declare-fun lt!193519 () (_ BitVec 64))

(declare-fun lt!193518 () BitStream!4390)

(assert (=> d!39510 (= res!101882 (= (bvadd lt!193519 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2458 (buf!2898 lt!193518)) (currentByte!5595 lt!193518) (currentBit!5590 lt!193518))))))

(assert (=> d!39510 (or (not (= (bvand lt!193519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193519 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39510 (= lt!193519 (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!193219))) (currentByte!5595 (_1!5459 lt!193219)) (currentBit!5590 (_1!5459 lt!193219))))))

(assert (=> d!39510 (= lt!193518 (_2!5457 (moveBitIndex!0 (_1!5459 lt!193219) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!39510 (moveBitIndexPrecond!0 (_1!5459 lt!193219) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!39510 (= (withMovedBitIndex!0 (_1!5459 lt!193219) #b0000000000000000000000000000000000000000000000000000000000000001) lt!193518)))

(declare-fun b!122888 () Bool)

(assert (=> b!122888 (= e!80569 (= (size!2458 (buf!2898 (_1!5459 lt!193219))) (size!2458 (buf!2898 lt!193518))))))

(assert (= (and d!39510 res!101882) b!122888))

(declare-fun m!186769 () Bool)

(assert (=> d!39510 m!186769))

(declare-fun m!186771 () Bool)

(assert (=> d!39510 m!186771))

(declare-fun m!186773 () Bool)

(assert (=> d!39510 m!186773))

(declare-fun m!186775 () Bool)

(assert (=> d!39510 m!186775))

(assert (=> b!122747 d!39510))

(declare-fun d!39514 () Bool)

(declare-fun e!80570 () Bool)

(assert (=> d!39514 e!80570))

(declare-fun res!101883 () Bool)

(assert (=> d!39514 (=> (not res!101883) (not e!80570))))

(declare-fun lt!193521 () (_ BitVec 64))

(declare-fun lt!193520 () BitStream!4390)

(assert (=> d!39514 (= res!101883 (= (bvadd lt!193521 (bvsub lt!193225 lt!193210)) (bitIndex!0 (size!2458 (buf!2898 lt!193520)) (currentByte!5595 lt!193520) (currentBit!5590 lt!193520))))))

(assert (=> d!39514 (or (not (= (bvand lt!193521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193225 lt!193210) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!193521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!193521 (bvsub lt!193225 lt!193210)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39514 (= lt!193521 (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!193219))) (currentByte!5595 (_2!5459 lt!193219)) (currentBit!5590 (_2!5459 lt!193219))))))

(assert (=> d!39514 (= lt!193520 (_2!5457 (moveBitIndex!0 (_2!5459 lt!193219) (bvsub lt!193225 lt!193210))))))

(assert (=> d!39514 (moveBitIndexPrecond!0 (_2!5459 lt!193219) (bvsub lt!193225 lt!193210))))

(assert (=> d!39514 (= (withMovedBitIndex!0 (_2!5459 lt!193219) (bvsub lt!193225 lt!193210)) lt!193520)))

(declare-fun b!122889 () Bool)

(assert (=> b!122889 (= e!80570 (= (size!2458 (buf!2898 (_2!5459 lt!193219))) (size!2458 (buf!2898 lt!193520))))))

(assert (= (and d!39514 res!101883) b!122889))

(declare-fun m!186777 () Bool)

(assert (=> d!39514 m!186777))

(declare-fun m!186779 () Bool)

(assert (=> d!39514 m!186779))

(declare-fun m!186781 () Bool)

(assert (=> d!39514 m!186781))

(declare-fun m!186783 () Bool)

(assert (=> d!39514 m!186783))

(assert (=> b!122747 d!39514))

(declare-fun d!39518 () Bool)

(declare-fun e!80571 () Bool)

(assert (=> d!39518 e!80571))

(declare-fun res!101885 () Bool)

(assert (=> d!39518 (=> (not res!101885) (not e!80571))))

(declare-fun lt!193527 () (_ BitVec 64))

(declare-fun lt!193526 () (_ BitVec 64))

(declare-fun lt!193522 () (_ BitVec 64))

(assert (=> d!39518 (= res!101885 (= lt!193527 (bvsub lt!193522 lt!193526)))))

(assert (=> d!39518 (or (= (bvand lt!193522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!193526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!193522 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193522 lt!193526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39518 (= lt!193526 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 thiss!1305))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305))))))

(declare-fun lt!193524 () (_ BitVec 64))

(declare-fun lt!193525 () (_ BitVec 64))

(assert (=> d!39518 (= lt!193522 (bvmul lt!193524 lt!193525))))

(assert (=> d!39518 (or (= lt!193524 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!193525 (bvsdiv (bvmul lt!193524 lt!193525) lt!193524)))))

(assert (=> d!39518 (= lt!193525 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39518 (= lt!193524 ((_ sign_extend 32) (size!2458 (buf!2898 thiss!1305))))))

(assert (=> d!39518 (= lt!193527 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 thiss!1305))))))

(assert (=> d!39518 (invariant!0 (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305) (size!2458 (buf!2898 thiss!1305)))))

(assert (=> d!39518 (= (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)) lt!193527)))

(declare-fun b!122890 () Bool)

(declare-fun res!101884 () Bool)

(assert (=> b!122890 (=> (not res!101884) (not e!80571))))

(assert (=> b!122890 (= res!101884 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!193527))))

(declare-fun b!122891 () Bool)

(declare-fun lt!193523 () (_ BitVec 64))

(assert (=> b!122891 (= e!80571 (bvsle lt!193527 (bvmul lt!193523 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122891 (or (= lt!193523 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!193523 #b0000000000000000000000000000000000000000000000000000000000001000) lt!193523)))))

(assert (=> b!122891 (= lt!193523 ((_ sign_extend 32) (size!2458 (buf!2898 thiss!1305))))))

(assert (= (and d!39518 res!101885) b!122890))

(assert (= (and b!122890 res!101884) b!122891))

(declare-fun m!186787 () Bool)

(assert (=> d!39518 m!186787))

(declare-fun m!186789 () Bool)

(assert (=> d!39518 m!186789))

(assert (=> b!122747 d!39518))

(declare-fun d!39522 () Bool)

(declare-datatypes ((tuple2!10416 0))(
  ( (tuple2!10417 (_1!5473 Bool) (_2!5473 BitStream!4390)) )
))
(declare-fun lt!193536 () tuple2!10416)

(declare-fun readBit!0 (BitStream!4390) tuple2!10416)

(assert (=> d!39522 (= lt!193536 (readBit!0 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))))

(assert (=> d!39522 (= (readBitPure!0 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))) (tuple2!10387 (_2!5473 lt!193536) (_1!5473 lt!193536)))))

(declare-fun bs!9568 () Bool)

(assert (= bs!9568 d!39522))

(assert (=> bs!9568 m!186491))

(declare-fun m!186795 () Bool)

(assert (=> bs!9568 m!186795))

(assert (=> b!122749 d!39522))

(declare-fun d!39526 () Bool)

(declare-fun e!80575 () Bool)

(assert (=> d!39526 e!80575))

(declare-fun res!101891 () Bool)

(assert (=> d!39526 (=> (not res!101891) (not e!80575))))

(assert (=> d!39526 (= res!101891 (invariant!0 (currentBit!5590 (_2!5457 lt!193212)) (currentByte!5595 (_2!5457 lt!193212)) (size!2458 (buf!2898 (_2!5457 lt!193212)))))))

(assert (=> d!39526 (= (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)) (BitStream!4391 (buf!2898 (_2!5457 lt!193212)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))

(declare-fun b!122896 () Bool)

(assert (=> b!122896 (= e!80575 (invariant!0 (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305) (size!2458 (buf!2898 (_2!5457 lt!193212)))))))

(assert (= (and d!39526 res!101891) b!122896))

(assert (=> d!39526 m!186753))

(assert (=> b!122896 m!186521))

(assert (=> b!122749 d!39526))

(declare-fun d!39530 () Bool)

(assert (=> d!39530 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 thiss!1305))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305)) lt!193234) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 thiss!1305))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305))) lt!193234))))

(declare-fun bs!9570 () Bool)

(assert (= bs!9570 d!39530))

(assert (=> bs!9570 m!186787))

(assert (=> b!122745 d!39530))

(declare-fun d!39532 () Bool)

(assert (=> d!39532 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305) (size!2458 (buf!2898 thiss!1305))))))

(declare-fun bs!9571 () Bool)

(assert (= bs!9571 d!39532))

(assert (=> bs!9571 m!186789))

(assert (=> start!24182 d!39532))

(declare-fun d!39534 () Bool)

(assert (=> d!39534 (= (invariant!0 (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305) (size!2458 (buf!2898 (_2!5457 lt!193209)))) (and (bvsge (currentBit!5590 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5590 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5595 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5595 thiss!1305) (size!2458 (buf!2898 (_2!5457 lt!193209)))) (and (= (currentBit!5590 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5595 thiss!1305) (size!2458 (buf!2898 (_2!5457 lt!193209))))))))))

(assert (=> b!122753 d!39534))

(declare-fun d!39536 () Bool)

(assert (=> d!39536 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!122742 d!39536))

(declare-fun d!39538 () Bool)

(declare-fun lt!193542 () tuple2!10416)

(assert (=> d!39538 (= lt!193542 (readBit!0 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(assert (=> d!39538 (= (readBitPure!0 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))) (tuple2!10387 (_2!5473 lt!193542) (_1!5473 lt!193542)))))

(declare-fun bs!9572 () Bool)

(assert (= bs!9572 d!39538))

(declare-fun m!186799 () Bool)

(assert (=> bs!9572 m!186799))

(assert (=> b!122742 d!39538))

(declare-fun d!39540 () Bool)

(assert (=> d!39540 (isPrefixOf!0 thiss!1305 (_2!5457 lt!193209))))

(declare-fun lt!193549 () Unit!7555)

(declare-fun choose!30 (BitStream!4390 BitStream!4390 BitStream!4390) Unit!7555)

(assert (=> d!39540 (= lt!193549 (choose!30 thiss!1305 (_2!5457 lt!193212) (_2!5457 lt!193209)))))

(assert (=> d!39540 (isPrefixOf!0 thiss!1305 (_2!5457 lt!193212))))

(assert (=> d!39540 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5457 lt!193212) (_2!5457 lt!193209)) lt!193549)))

(declare-fun bs!9573 () Bool)

(assert (= bs!9573 d!39540))

(assert (=> bs!9573 m!186545))

(declare-fun m!186809 () Bool)

(assert (=> bs!9573 m!186809))

(assert (=> bs!9573 m!186519))

(assert (=> b!122742 d!39540))

(declare-fun b!123062 () Bool)

(declare-fun e!80669 () (_ BitVec 64))

(assert (=> b!123062 (= e!80669 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!123063 () Bool)

(declare-fun res!102024 () Bool)

(declare-fun e!80667 () Bool)

(assert (=> b!123063 (=> (not res!102024) (not e!80667))))

(declare-fun lt!194099 () (_ BitVec 64))

(declare-fun lt!194127 () tuple2!10384)

(declare-fun lt!194096 () (_ BitVec 64))

(assert (=> b!123063 (= res!102024 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194127))) (currentByte!5595 (_2!5457 lt!194127)) (currentBit!5590 (_2!5457 lt!194127))) (bvadd lt!194096 lt!194099)))))

(assert (=> b!123063 (or (not (= (bvand lt!194096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194099 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194096 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194096 lt!194099) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123063 (= lt!194099 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123063 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123063 (= lt!194096 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(declare-fun b!123064 () Bool)

(declare-fun res!102023 () Bool)

(declare-fun lt!194093 () tuple2!10384)

(assert (=> b!123064 (= res!102023 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194093))) (currentByte!5595 (_2!5457 lt!194093)) (currentBit!5590 (_2!5457 lt!194093))) (bvadd (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!80671 () Bool)

(assert (=> b!123064 (=> (not res!102023) (not e!80671))))

(declare-fun b!123065 () Bool)

(assert (=> b!123065 (= e!80669 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!123066 () Bool)

(declare-fun e!80665 () tuple2!10384)

(declare-fun lt!194094 () tuple2!10384)

(declare-fun Unit!7569 () Unit!7555)

(assert (=> b!123066 (= e!80665 (tuple2!10385 Unit!7569 (_2!5457 lt!194094)))))

(declare-fun lt!194128 () Bool)

(assert (=> b!123066 (= lt!194128 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123066 (= lt!194093 (appendBit!0 (_2!5457 lt!193212) lt!194128))))

(declare-fun res!102025 () Bool)

(assert (=> b!123066 (= res!102025 (= (size!2458 (buf!2898 (_2!5457 lt!193212))) (size!2458 (buf!2898 (_2!5457 lt!194093)))))))

(assert (=> b!123066 (=> (not res!102025) (not e!80671))))

(assert (=> b!123066 e!80671))

(declare-fun lt!194126 () tuple2!10384)

(assert (=> b!123066 (= lt!194126 lt!194093)))

(assert (=> b!123066 (= lt!194094 (appendNLeastSignificantBitsLoop!0 (_2!5457 lt!194126) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!194132 () Unit!7555)

(assert (=> b!123066 (= lt!194132 (lemmaIsPrefixTransitive!0 (_2!5457 lt!193212) (_2!5457 lt!194126) (_2!5457 lt!194094)))))

(assert (=> b!123066 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!194094))))

(declare-fun lt!194103 () Unit!7555)

(assert (=> b!123066 (= lt!194103 lt!194132)))

(assert (=> b!123066 (invariant!0 (currentBit!5590 (_2!5457 lt!193212)) (currentByte!5595 (_2!5457 lt!193212)) (size!2458 (buf!2898 (_2!5457 lt!194126))))))

(declare-fun lt!194135 () BitStream!4390)

(assert (=> b!123066 (= lt!194135 (BitStream!4391 (buf!2898 (_2!5457 lt!194126)) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(assert (=> b!123066 (invariant!0 (currentBit!5590 lt!194135) (currentByte!5595 lt!194135) (size!2458 (buf!2898 (_2!5457 lt!194094))))))

(declare-fun lt!194129 () BitStream!4390)

(assert (=> b!123066 (= lt!194129 (BitStream!4391 (buf!2898 (_2!5457 lt!194094)) (currentByte!5595 lt!194135) (currentBit!5590 lt!194135)))))

(declare-fun lt!194101 () tuple2!10386)

(assert (=> b!123066 (= lt!194101 (readBitPure!0 lt!194135))))

(declare-fun lt!194095 () tuple2!10386)

(assert (=> b!123066 (= lt!194095 (readBitPure!0 lt!194129))))

(declare-fun lt!194133 () Unit!7555)

(assert (=> b!123066 (= lt!194133 (readBitPrefixLemma!0 lt!194135 (_2!5457 lt!194094)))))

(declare-fun res!102026 () Bool)

(assert (=> b!123066 (= res!102026 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194101))) (currentByte!5595 (_1!5458 lt!194101)) (currentBit!5590 (_1!5458 lt!194101))) (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194095))) (currentByte!5595 (_1!5458 lt!194095)) (currentBit!5590 (_1!5458 lt!194095)))))))

(declare-fun e!80666 () Bool)

(assert (=> b!123066 (=> (not res!102026) (not e!80666))))

(assert (=> b!123066 e!80666))

(declare-fun lt!194116 () Unit!7555)

(assert (=> b!123066 (= lt!194116 lt!194133)))

(declare-fun lt!194113 () tuple2!10388)

(assert (=> b!123066 (= lt!194113 (reader!0 (_2!5457 lt!193212) (_2!5457 lt!194094)))))

(declare-fun lt!194102 () tuple2!10388)

(assert (=> b!123066 (= lt!194102 (reader!0 (_2!5457 lt!194126) (_2!5457 lt!194094)))))

(declare-fun lt!194112 () tuple2!10386)

(assert (=> b!123066 (= lt!194112 (readBitPure!0 (_1!5459 lt!194113)))))

(assert (=> b!123066 (= (_2!5458 lt!194112) lt!194128)))

(declare-fun lt!194097 () Unit!7555)

(declare-fun Unit!7570 () Unit!7555)

(assert (=> b!123066 (= lt!194097 Unit!7570)))

(declare-fun lt!194098 () (_ BitVec 64))

(assert (=> b!123066 (= lt!194098 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!194114 () (_ BitVec 64))

(assert (=> b!123066 (= lt!194114 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!194125 () Unit!7555)

(assert (=> b!123066 (= lt!194125 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5457 lt!193212) (buf!2898 (_2!5457 lt!194094)) lt!194114))))

(assert (=> b!123066 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194094)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!194114)))

(declare-fun lt!194120 () Unit!7555)

(assert (=> b!123066 (= lt!194120 lt!194125)))

(declare-fun lt!194115 () tuple2!10390)

(assert (=> b!123066 (= lt!194115 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!194113) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194098))))

(declare-fun lt!194122 () (_ BitVec 64))

(assert (=> b!123066 (= lt!194122 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!194131 () Unit!7555)

(assert (=> b!123066 (= lt!194131 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5457 lt!194126) (buf!2898 (_2!5457 lt!194094)) lt!194122))))

(assert (=> b!123066 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194094)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194126))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194126))) lt!194122)))

(declare-fun lt!194118 () Unit!7555)

(assert (=> b!123066 (= lt!194118 lt!194131)))

(declare-fun lt!194106 () tuple2!10390)

(assert (=> b!123066 (= lt!194106 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!194102) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194098 (ite (_2!5458 lt!194112) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!194136 () tuple2!10390)

(assert (=> b!123066 (= lt!194136 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!194113) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194098))))

(declare-fun c!7349 () Bool)

(assert (=> b!123066 (= c!7349 (_2!5458 (readBitPure!0 (_1!5459 lt!194113))))))

(declare-fun lt!194123 () tuple2!10390)

(assert (=> b!123066 (= lt!194123 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5459 lt!194113) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194098 e!80669)))))

(declare-fun lt!194108 () Unit!7555)

(assert (=> b!123066 (= lt!194108 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5459 lt!194113) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194098))))

(assert (=> b!123066 (and (= (_2!5460 lt!194136) (_2!5460 lt!194123)) (= (_1!5460 lt!194136) (_1!5460 lt!194123)))))

(declare-fun lt!194109 () Unit!7555)

(assert (=> b!123066 (= lt!194109 lt!194108)))

(assert (=> b!123066 (= (_1!5459 lt!194113) (withMovedBitIndex!0 (_2!5459 lt!194113) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094))))))))

(declare-fun lt!194119 () Unit!7555)

(declare-fun Unit!7571 () Unit!7555)

(assert (=> b!123066 (= lt!194119 Unit!7571)))

(assert (=> b!123066 (= (_1!5459 lt!194102) (withMovedBitIndex!0 (_2!5459 lt!194102) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094))))))))

(declare-fun lt!194124 () Unit!7555)

(declare-fun Unit!7572 () Unit!7555)

(assert (=> b!123066 (= lt!194124 Unit!7572)))

(assert (=> b!123066 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!194121 () Unit!7555)

(declare-fun Unit!7573 () Unit!7555)

(assert (=> b!123066 (= lt!194121 Unit!7573)))

(assert (=> b!123066 (= (_2!5460 lt!194115) (_2!5460 lt!194106))))

(declare-fun lt!194107 () Unit!7555)

(declare-fun Unit!7574 () Unit!7555)

(assert (=> b!123066 (= lt!194107 Unit!7574)))

(assert (=> b!123066 (= (_1!5460 lt!194115) (_2!5459 lt!194113))))

(declare-fun b!123067 () Bool)

(declare-fun e!80670 () Bool)

(declare-fun lt!194134 () (_ BitVec 64))

(assert (=> b!123067 (= e!80670 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193212)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!194134))))

(declare-fun b!123068 () Bool)

(declare-fun e!80668 () Bool)

(declare-fun lt!194130 () tuple2!10386)

(assert (=> b!123068 (= e!80668 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194130))) (currentByte!5595 (_1!5458 lt!194130)) (currentBit!5590 (_1!5458 lt!194130))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194093))) (currentByte!5595 (_2!5457 lt!194093)) (currentBit!5590 (_2!5457 lt!194093)))))))

(declare-fun lt!194105 () tuple2!10388)

(declare-fun b!123069 () Bool)

(declare-fun lt!194104 () tuple2!10390)

(assert (=> b!123069 (= e!80667 (and (= (_2!5460 lt!194104) v!199) (= (_1!5460 lt!194104) (_2!5459 lt!194105))))))

(declare-fun lt!194110 () (_ BitVec 64))

(assert (=> b!123069 (= lt!194104 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!194105) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194110))))

(declare-fun lt!194100 () Unit!7555)

(declare-fun lt!194117 () Unit!7555)

(assert (=> b!123069 (= lt!194100 lt!194117)))

(assert (=> b!123069 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194127)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!194134)))

(assert (=> b!123069 (= lt!194117 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5457 lt!193212) (buf!2898 (_2!5457 lt!194127)) lt!194134))))

(assert (=> b!123069 e!80670))

(declare-fun res!102027 () Bool)

(assert (=> b!123069 (=> (not res!102027) (not e!80670))))

(assert (=> b!123069 (= res!102027 (and (= (size!2458 (buf!2898 (_2!5457 lt!193212))) (size!2458 (buf!2898 (_2!5457 lt!194127)))) (bvsge lt!194134 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123069 (= lt!194134 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123069 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123069 (= lt!194110 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!123069 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123069 (= lt!194105 (reader!0 (_2!5457 lt!193212) (_2!5457 lt!194127)))))

(declare-fun d!39544 () Bool)

(assert (=> d!39544 e!80667))

(declare-fun res!102020 () Bool)

(assert (=> d!39544 (=> (not res!102020) (not e!80667))))

(assert (=> d!39544 (= res!102020 (= (size!2458 (buf!2898 (_2!5457 lt!193212))) (size!2458 (buf!2898 (_2!5457 lt!194127)))))))

(assert (=> d!39544 (= lt!194127 e!80665)))

(declare-fun c!7350 () Bool)

(assert (=> d!39544 (= c!7350 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!39544 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39544 (= (appendNLeastSignificantBitsLoop!0 (_2!5457 lt!193212) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!194127)))

(declare-fun b!123070 () Bool)

(assert (=> b!123070 (= e!80666 (= (_2!5458 lt!194101) (_2!5458 lt!194095)))))

(declare-fun b!123071 () Bool)

(declare-fun res!102021 () Bool)

(declare-fun call!1604 () Bool)

(assert (=> b!123071 (= res!102021 call!1604)))

(assert (=> b!123071 (=> (not res!102021) (not e!80671))))

(declare-fun lt!194137 () BitStream!4390)

(declare-fun bm!1601 () Bool)

(assert (=> bm!1601 (= call!1604 (isPrefixOf!0 (ite c!7350 (_2!5457 lt!193212) lt!194137) (ite c!7350 (_2!5457 lt!194093) lt!194137)))))

(declare-fun b!123072 () Bool)

(declare-fun res!102022 () Bool)

(assert (=> b!123072 (=> (not res!102022) (not e!80667))))

(assert (=> b!123072 (= res!102022 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!194127)))))

(declare-fun b!123073 () Bool)

(declare-fun lt!194111 () Unit!7555)

(assert (=> b!123073 (= e!80665 (tuple2!10385 lt!194111 (_2!5457 lt!193212)))))

(assert (=> b!123073 (= lt!194137 (_2!5457 lt!193212))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4390) Unit!7555)

(assert (=> b!123073 (= lt!194111 (lemmaIsPrefixRefl!0 lt!194137))))

(assert (=> b!123073 call!1604))

(declare-fun b!123074 () Bool)

(assert (=> b!123074 (= lt!194130 (readBitPure!0 (readerFrom!0 (_2!5457 lt!194093) (currentBit!5590 (_2!5457 lt!193212)) (currentByte!5595 (_2!5457 lt!193212)))))))

(declare-fun res!102019 () Bool)

(assert (=> b!123074 (= res!102019 (and (= (_2!5458 lt!194130) lt!194128) (= (_1!5458 lt!194130) (_2!5457 lt!194093))))))

(assert (=> b!123074 (=> (not res!102019) (not e!80668))))

(assert (=> b!123074 (= e!80671 e!80668)))

(assert (= (and d!39544 c!7350) b!123066))

(assert (= (and d!39544 (not c!7350)) b!123073))

(assert (= (and b!123066 res!102025) b!123064))

(assert (= (and b!123064 res!102023) b!123071))

(assert (= (and b!123071 res!102021) b!123074))

(assert (= (and b!123074 res!102019) b!123068))

(assert (= (and b!123066 res!102026) b!123070))

(assert (= (and b!123066 c!7349) b!123065))

(assert (= (and b!123066 (not c!7349)) b!123062))

(assert (= (or b!123071 b!123073) bm!1601))

(assert (= (and d!39544 res!102020) b!123063))

(assert (= (and b!123063 res!102024) b!123072))

(assert (= (and b!123072 res!102022) b!123069))

(assert (= (and b!123069 res!102027) b!123067))

(declare-fun m!187161 () Bool)

(assert (=> b!123069 m!187161))

(declare-fun m!187163 () Bool)

(assert (=> b!123069 m!187163))

(declare-fun m!187165 () Bool)

(assert (=> b!123069 m!187165))

(declare-fun m!187167 () Bool)

(assert (=> b!123069 m!187167))

(declare-fun m!187169 () Bool)

(assert (=> b!123069 m!187169))

(declare-fun m!187171 () Bool)

(assert (=> b!123073 m!187171))

(declare-fun m!187173 () Bool)

(assert (=> b!123066 m!187173))

(declare-fun m!187175 () Bool)

(assert (=> b!123066 m!187175))

(declare-fun m!187177 () Bool)

(assert (=> b!123066 m!187177))

(declare-fun m!187179 () Bool)

(assert (=> b!123066 m!187179))

(declare-fun m!187181 () Bool)

(assert (=> b!123066 m!187181))

(declare-fun m!187183 () Bool)

(assert (=> b!123066 m!187183))

(declare-fun m!187185 () Bool)

(assert (=> b!123066 m!187185))

(declare-fun m!187187 () Bool)

(assert (=> b!123066 m!187187))

(declare-fun m!187189 () Bool)

(assert (=> b!123066 m!187189))

(declare-fun m!187191 () Bool)

(assert (=> b!123066 m!187191))

(declare-fun m!187193 () Bool)

(assert (=> b!123066 m!187193))

(declare-fun m!187195 () Bool)

(assert (=> b!123066 m!187195))

(assert (=> b!123066 m!187165))

(declare-fun m!187197 () Bool)

(assert (=> b!123066 m!187197))

(declare-fun m!187199 () Bool)

(assert (=> b!123066 m!187199))

(declare-fun m!187201 () Bool)

(assert (=> b!123066 m!187201))

(declare-fun m!187203 () Bool)

(assert (=> b!123066 m!187203))

(declare-fun m!187205 () Bool)

(assert (=> b!123066 m!187205))

(declare-fun m!187207 () Bool)

(assert (=> b!123066 m!187207))

(declare-fun m!187209 () Bool)

(assert (=> b!123066 m!187209))

(assert (=> b!123066 m!187193))

(declare-fun m!187211 () Bool)

(assert (=> b!123066 m!187211))

(declare-fun m!187213 () Bool)

(assert (=> b!123066 m!187213))

(assert (=> b!123066 m!186513))

(declare-fun m!187215 () Bool)

(assert (=> b!123066 m!187215))

(declare-fun m!187217 () Bool)

(assert (=> b!123066 m!187217))

(declare-fun m!187219 () Bool)

(assert (=> b!123066 m!187219))

(declare-fun m!187221 () Bool)

(assert (=> b!123066 m!187221))

(declare-fun m!187223 () Bool)

(assert (=> b!123066 m!187223))

(declare-fun m!187225 () Bool)

(assert (=> b!123066 m!187225))

(declare-fun m!187227 () Bool)

(assert (=> b!123063 m!187227))

(assert (=> b!123063 m!186513))

(declare-fun m!187229 () Bool)

(assert (=> b!123074 m!187229))

(assert (=> b!123074 m!187229))

(declare-fun m!187231 () Bool)

(assert (=> b!123074 m!187231))

(declare-fun m!187233 () Bool)

(assert (=> b!123072 m!187233))

(declare-fun m!187235 () Bool)

(assert (=> b!123068 m!187235))

(declare-fun m!187237 () Bool)

(assert (=> b!123068 m!187237))

(declare-fun m!187239 () Bool)

(assert (=> b!123067 m!187239))

(declare-fun m!187241 () Bool)

(assert (=> bm!1601 m!187241))

(assert (=> b!123064 m!187237))

(assert (=> b!123064 m!186513))

(assert (=> b!122742 d!39544))

(declare-fun d!39636 () Bool)

(declare-fun lt!194138 () tuple2!10416)

(assert (=> d!39636 (= lt!194138 (readBit!0 (_1!5459 lt!193219)))))

(assert (=> d!39636 (= (readBitPure!0 (_1!5459 lt!193219)) (tuple2!10387 (_2!5473 lt!194138) (_1!5473 lt!194138)))))

(declare-fun bs!9596 () Bool)

(assert (= bs!9596 d!39636))

(declare-fun m!187243 () Bool)

(assert (=> bs!9596 m!187243))

(assert (=> b!122742 d!39636))

(declare-fun d!39638 () Bool)

(assert (=> d!39638 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305)) lt!193234) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305))) lt!193234))))

(declare-fun bs!9597 () Bool)

(assert (= bs!9597 d!39638))

(declare-fun m!187245 () Bool)

(assert (=> bs!9597 m!187245))

(assert (=> b!122742 d!39638))

(declare-fun d!39640 () Bool)

(declare-fun e!80674 () Bool)

(assert (=> d!39640 e!80674))

(declare-fun res!102030 () Bool)

(assert (=> d!39640 (=> (not res!102030) (not e!80674))))

(declare-fun lt!194150 () tuple2!10386)

(declare-fun lt!194147 () tuple2!10386)

(assert (=> d!39640 (= res!102030 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194150))) (currentByte!5595 (_1!5458 lt!194150)) (currentBit!5590 (_1!5458 lt!194150))) (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194147))) (currentByte!5595 (_1!5458 lt!194147)) (currentBit!5590 (_1!5458 lt!194147)))))))

(declare-fun lt!194148 () BitStream!4390)

(declare-fun lt!194149 () Unit!7555)

(declare-fun choose!50 (BitStream!4390 BitStream!4390 BitStream!4390 tuple2!10386 tuple2!10386 BitStream!4390 Bool tuple2!10386 tuple2!10386 BitStream!4390 Bool) Unit!7555)

(assert (=> d!39640 (= lt!194149 (choose!50 lt!193231 (_2!5457 lt!193209) lt!194148 lt!194150 (tuple2!10387 (_1!5458 lt!194150) (_2!5458 lt!194150)) (_1!5458 lt!194150) (_2!5458 lt!194150) lt!194147 (tuple2!10387 (_1!5458 lt!194147) (_2!5458 lt!194147)) (_1!5458 lt!194147) (_2!5458 lt!194147)))))

(assert (=> d!39640 (= lt!194147 (readBitPure!0 lt!194148))))

(assert (=> d!39640 (= lt!194150 (readBitPure!0 lt!193231))))

(assert (=> d!39640 (= lt!194148 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 lt!193231) (currentBit!5590 lt!193231)))))

(assert (=> d!39640 (invariant!0 (currentBit!5590 lt!193231) (currentByte!5595 lt!193231) (size!2458 (buf!2898 (_2!5457 lt!193209))))))

(assert (=> d!39640 (= (readBitPrefixLemma!0 lt!193231 (_2!5457 lt!193209)) lt!194149)))

(declare-fun b!123077 () Bool)

(assert (=> b!123077 (= e!80674 (= (_2!5458 lt!194150) (_2!5458 lt!194147)))))

(assert (= (and d!39640 res!102030) b!123077))

(assert (=> d!39640 m!186555))

(declare-fun m!187247 () Bool)

(assert (=> d!39640 m!187247))

(declare-fun m!187249 () Bool)

(assert (=> d!39640 m!187249))

(declare-fun m!187251 () Bool)

(assert (=> d!39640 m!187251))

(declare-fun m!187253 () Bool)

(assert (=> d!39640 m!187253))

(declare-fun m!187255 () Bool)

(assert (=> d!39640 m!187255))

(assert (=> b!122742 d!39640))

(declare-fun d!39642 () Bool)

(assert (=> d!39642 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!193215) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212)))) lt!193215))))

(declare-fun bs!9598 () Bool)

(assert (= bs!9598 d!39642))

(declare-fun m!187257 () Bool)

(assert (=> bs!9598 m!187257))

(assert (=> b!122742 d!39642))

(declare-fun d!39644 () Bool)

(declare-fun e!80690 () Bool)

(assert (=> d!39644 e!80690))

(declare-fun res!102051 () Bool)

(assert (=> d!39644 (=> (not res!102051) (not e!80690))))

(declare-fun lt!194235 () tuple2!10384)

(assert (=> d!39644 (= res!102051 (= (size!2458 (buf!2898 thiss!1305)) (size!2458 (buf!2898 (_2!5457 lt!194235)))))))

(declare-fun choose!16 (BitStream!4390 Bool) tuple2!10384)

(assert (=> d!39644 (= lt!194235 (choose!16 thiss!1305 lt!193222))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!39644 (validate_offset_bit!0 ((_ sign_extend 32) (size!2458 (buf!2898 thiss!1305))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305)))))

(assert (=> d!39644 (= (appendBit!0 thiss!1305 lt!193222) lt!194235)))

(declare-fun b!123108 () Bool)

(declare-fun e!80689 () Bool)

(declare-fun lt!194233 () tuple2!10386)

(assert (=> b!123108 (= e!80689 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194233))) (currentByte!5595 (_1!5458 lt!194233)) (currentBit!5590 (_1!5458 lt!194233))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194235))) (currentByte!5595 (_2!5457 lt!194235)) (currentBit!5590 (_2!5457 lt!194235)))))))

(declare-fun b!123106 () Bool)

(declare-fun res!102050 () Bool)

(assert (=> b!123106 (=> (not res!102050) (not e!80690))))

(assert (=> b!123106 (= res!102050 (isPrefixOf!0 thiss!1305 (_2!5457 lt!194235)))))

(declare-fun b!123107 () Bool)

(assert (=> b!123107 (= e!80690 e!80689)))

(declare-fun res!102049 () Bool)

(assert (=> b!123107 (=> (not res!102049) (not e!80689))))

(assert (=> b!123107 (= res!102049 (and (= (_2!5458 lt!194233) lt!193222) (= (_1!5458 lt!194233) (_2!5457 lt!194235))))))

(assert (=> b!123107 (= lt!194233 (readBitPure!0 (readerFrom!0 (_2!5457 lt!194235) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))))

(declare-fun b!123105 () Bool)

(declare-fun res!102052 () Bool)

(assert (=> b!123105 (=> (not res!102052) (not e!80690))))

(declare-fun lt!194234 () (_ BitVec 64))

(declare-fun lt!194236 () (_ BitVec 64))

(assert (=> b!123105 (= res!102052 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194235))) (currentByte!5595 (_2!5457 lt!194235)) (currentBit!5590 (_2!5457 lt!194235))) (bvadd lt!194236 lt!194234)))))

(assert (=> b!123105 (or (not (= (bvand lt!194236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194234 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!194236 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!194236 lt!194234) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123105 (= lt!194234 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123105 (= lt!194236 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))

(assert (= (and d!39644 res!102051) b!123105))

(assert (= (and b!123105 res!102052) b!123106))

(assert (= (and b!123106 res!102050) b!123107))

(assert (= (and b!123107 res!102049) b!123108))

(declare-fun m!187259 () Bool)

(assert (=> b!123106 m!187259))

(declare-fun m!187261 () Bool)

(assert (=> b!123107 m!187261))

(assert (=> b!123107 m!187261))

(declare-fun m!187263 () Bool)

(assert (=> b!123107 m!187263))

(declare-fun m!187265 () Bool)

(assert (=> d!39644 m!187265))

(declare-fun m!187267 () Bool)

(assert (=> d!39644 m!187267))

(declare-fun m!187269 () Bool)

(assert (=> b!123105 m!187269))

(assert (=> b!123105 m!186517))

(declare-fun m!187271 () Bool)

(assert (=> b!123108 m!187271))

(assert (=> b!123108 m!187269))

(assert (=> b!122742 d!39644))

(declare-fun b!123145 () Bool)

(declare-fun e!80710 () Unit!7555)

(declare-fun Unit!7576 () Unit!7555)

(assert (=> b!123145 (= e!80710 Unit!7576)))

(declare-fun lt!194347 () tuple2!10388)

(declare-fun lt!194364 () (_ BitVec 64))

(declare-fun lt!194358 () (_ BitVec 64))

(declare-fun e!80711 () Bool)

(declare-fun b!123146 () Bool)

(assert (=> b!123146 (= e!80711 (= (_1!5459 lt!194347) (withMovedBitIndex!0 (_2!5459 lt!194347) (bvsub lt!194358 lt!194364))))))

(assert (=> b!123146 (or (= (bvand lt!194358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194364 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194358 lt!194364) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123146 (= lt!194364 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209))))))

(assert (=> b!123146 (= lt!194358 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(declare-fun d!39646 () Bool)

(assert (=> d!39646 e!80711))

(declare-fun res!102083 () Bool)

(assert (=> d!39646 (=> (not res!102083) (not e!80711))))

(assert (=> d!39646 (= res!102083 (isPrefixOf!0 (_1!5459 lt!194347) (_2!5459 lt!194347)))))

(declare-fun lt!194363 () BitStream!4390)

(assert (=> d!39646 (= lt!194347 (tuple2!10389 lt!194363 (_2!5457 lt!193209)))))

(declare-fun lt!194346 () Unit!7555)

(declare-fun lt!194355 () Unit!7555)

(assert (=> d!39646 (= lt!194346 lt!194355)))

(assert (=> d!39646 (isPrefixOf!0 lt!194363 (_2!5457 lt!193209))))

(assert (=> d!39646 (= lt!194355 (lemmaIsPrefixTransitive!0 lt!194363 (_2!5457 lt!193209) (_2!5457 lt!193209)))))

(declare-fun lt!194351 () Unit!7555)

(declare-fun lt!194349 () Unit!7555)

(assert (=> d!39646 (= lt!194351 lt!194349)))

(assert (=> d!39646 (isPrefixOf!0 lt!194363 (_2!5457 lt!193209))))

(assert (=> d!39646 (= lt!194349 (lemmaIsPrefixTransitive!0 lt!194363 (_2!5457 lt!193212) (_2!5457 lt!193209)))))

(declare-fun lt!194359 () Unit!7555)

(assert (=> d!39646 (= lt!194359 e!80710)))

(declare-fun c!7359 () Bool)

(assert (=> d!39646 (= c!7359 (not (= (size!2458 (buf!2898 (_2!5457 lt!193212))) #b00000000000000000000000000000000)))))

(declare-fun lt!194353 () Unit!7555)

(declare-fun lt!194360 () Unit!7555)

(assert (=> d!39646 (= lt!194353 lt!194360)))

(assert (=> d!39646 (isPrefixOf!0 (_2!5457 lt!193209) (_2!5457 lt!193209))))

(assert (=> d!39646 (= lt!194360 (lemmaIsPrefixRefl!0 (_2!5457 lt!193209)))))

(declare-fun lt!194362 () Unit!7555)

(declare-fun lt!194356 () Unit!7555)

(assert (=> d!39646 (= lt!194362 lt!194356)))

(assert (=> d!39646 (= lt!194356 (lemmaIsPrefixRefl!0 (_2!5457 lt!193209)))))

(declare-fun lt!194348 () Unit!7555)

(declare-fun lt!194361 () Unit!7555)

(assert (=> d!39646 (= lt!194348 lt!194361)))

(assert (=> d!39646 (isPrefixOf!0 lt!194363 lt!194363)))

(assert (=> d!39646 (= lt!194361 (lemmaIsPrefixRefl!0 lt!194363))))

(declare-fun lt!194357 () Unit!7555)

(declare-fun lt!194350 () Unit!7555)

(assert (=> d!39646 (= lt!194357 lt!194350)))

(assert (=> d!39646 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!193212))))

(assert (=> d!39646 (= lt!194350 (lemmaIsPrefixRefl!0 (_2!5457 lt!193212)))))

(assert (=> d!39646 (= lt!194363 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(assert (=> d!39646 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!193209))))

(assert (=> d!39646 (= (reader!0 (_2!5457 lt!193212) (_2!5457 lt!193209)) lt!194347)))

(declare-fun b!123147 () Bool)

(declare-fun res!102084 () Bool)

(assert (=> b!123147 (=> (not res!102084) (not e!80711))))

(assert (=> b!123147 (= res!102084 (isPrefixOf!0 (_2!5459 lt!194347) (_2!5457 lt!193209)))))

(declare-fun b!123148 () Bool)

(declare-fun lt!194345 () Unit!7555)

(assert (=> b!123148 (= e!80710 lt!194345)))

(declare-fun lt!194354 () (_ BitVec 64))

(assert (=> b!123148 (= lt!194354 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!194352 () (_ BitVec 64))

(assert (=> b!123148 (= lt!194352 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5432 array!5432 (_ BitVec 64) (_ BitVec 64)) Unit!7555)

(assert (=> b!123148 (= lt!194345 (arrayBitRangesEqSymmetric!0 (buf!2898 (_2!5457 lt!193212)) (buf!2898 (_2!5457 lt!193209)) lt!194354 lt!194352))))

(declare-fun arrayBitRangesEq!0 (array!5432 array!5432 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!123148 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!193209)) (buf!2898 (_2!5457 lt!193212)) lt!194354 lt!194352)))

(declare-fun b!123149 () Bool)

(declare-fun res!102082 () Bool)

(assert (=> b!123149 (=> (not res!102082) (not e!80711))))

(assert (=> b!123149 (= res!102082 (isPrefixOf!0 (_1!5459 lt!194347) (_2!5457 lt!193212)))))

(assert (= (and d!39646 c!7359) b!123148))

(assert (= (and d!39646 (not c!7359)) b!123145))

(assert (= (and d!39646 res!102083) b!123149))

(assert (= (and b!123149 res!102082) b!123147))

(assert (= (and b!123147 res!102084) b!123146))

(declare-fun m!187361 () Bool)

(assert (=> b!123147 m!187361))

(declare-fun m!187363 () Bool)

(assert (=> b!123149 m!187363))

(assert (=> b!123148 m!186513))

(declare-fun m!187365 () Bool)

(assert (=> b!123148 m!187365))

(declare-fun m!187367 () Bool)

(assert (=> b!123148 m!187367))

(declare-fun m!187369 () Bool)

(assert (=> b!123146 m!187369))

(assert (=> b!123146 m!186503))

(assert (=> b!123146 m!186513))

(declare-fun m!187371 () Bool)

(assert (=> d!39646 m!187371))

(declare-fun m!187373 () Bool)

(assert (=> d!39646 m!187373))

(declare-fun m!187375 () Bool)

(assert (=> d!39646 m!187375))

(declare-fun m!187377 () Bool)

(assert (=> d!39646 m!187377))

(declare-fun m!187379 () Bool)

(assert (=> d!39646 m!187379))

(declare-fun m!187381 () Bool)

(assert (=> d!39646 m!187381))

(declare-fun m!187383 () Bool)

(assert (=> d!39646 m!187383))

(declare-fun m!187385 () Bool)

(assert (=> d!39646 m!187385))

(declare-fun m!187387 () Bool)

(assert (=> d!39646 m!187387))

(declare-fun m!187389 () Bool)

(assert (=> d!39646 m!187389))

(declare-fun m!187391 () Bool)

(assert (=> d!39646 m!187391))

(assert (=> b!122742 d!39646))

(declare-fun d!39656 () Bool)

(declare-fun lt!194365 () tuple2!10416)

(assert (=> d!39656 (= lt!194365 (readBit!0 lt!193231))))

(assert (=> d!39656 (= (readBitPure!0 lt!193231) (tuple2!10387 (_2!5473 lt!194365) (_1!5473 lt!194365)))))

(declare-fun bs!9600 () Bool)

(assert (= bs!9600 d!39656))

(declare-fun m!187393 () Bool)

(assert (=> bs!9600 m!187393))

(assert (=> b!122742 d!39656))

(declare-fun d!39658 () Bool)

(declare-fun lt!194366 () tuple2!10414)

(assert (=> d!39658 (= lt!194366 (readNLeastSignificantBitsLoop!0 (_1!5459 lt!193219) nBits!396 i!615 lt!193223))))

(assert (=> d!39658 (= (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!193219) nBits!396 i!615 lt!193223) (tuple2!10391 (_2!5472 lt!194366) (_1!5472 lt!194366)))))

(declare-fun bs!9601 () Bool)

(assert (= bs!9601 d!39658))

(declare-fun m!187395 () Bool)

(assert (=> bs!9601 m!187395))

(assert (=> b!122742 d!39658))

(declare-fun d!39660 () Bool)

(declare-fun e!80712 () Bool)

(assert (=> d!39660 e!80712))

(declare-fun res!102086 () Bool)

(assert (=> d!39660 (=> (not res!102086) (not e!80712))))

(declare-fun lt!194372 () (_ BitVec 64))

(declare-fun lt!194367 () (_ BitVec 64))

(declare-fun lt!194371 () (_ BitVec 64))

(assert (=> d!39660 (= res!102086 (= lt!194372 (bvsub lt!194367 lt!194371)))))

(assert (=> d!39660 (or (= (bvand lt!194367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194371 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194367 lt!194371) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39660 (= lt!194371 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193228)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193228))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193228)))))))

(declare-fun lt!194369 () (_ BitVec 64))

(declare-fun lt!194370 () (_ BitVec 64))

(assert (=> d!39660 (= lt!194367 (bvmul lt!194369 lt!194370))))

(assert (=> d!39660 (or (= lt!194369 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194370 (bvsdiv (bvmul lt!194369 lt!194370) lt!194369)))))

(assert (=> d!39660 (= lt!194370 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39660 (= lt!194369 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193228)))))))

(assert (=> d!39660 (= lt!194372 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193228))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193228)))))))

(assert (=> d!39660 (invariant!0 (currentBit!5590 (_1!5458 lt!193228)) (currentByte!5595 (_1!5458 lt!193228)) (size!2458 (buf!2898 (_1!5458 lt!193228))))))

(assert (=> d!39660 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!193228))) (currentByte!5595 (_1!5458 lt!193228)) (currentBit!5590 (_1!5458 lt!193228))) lt!194372)))

(declare-fun b!123150 () Bool)

(declare-fun res!102085 () Bool)

(assert (=> b!123150 (=> (not res!102085) (not e!80712))))

(assert (=> b!123150 (= res!102085 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194372))))

(declare-fun b!123151 () Bool)

(declare-fun lt!194368 () (_ BitVec 64))

(assert (=> b!123151 (= e!80712 (bvsle lt!194372 (bvmul lt!194368 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123151 (or (= lt!194368 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194368 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194368)))))

(assert (=> b!123151 (= lt!194368 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193228)))))))

(assert (= (and d!39660 res!102086) b!123150))

(assert (= (and b!123150 res!102085) b!123151))

(declare-fun m!187397 () Bool)

(assert (=> d!39660 m!187397))

(declare-fun m!187399 () Bool)

(assert (=> d!39660 m!187399))

(assert (=> b!122742 d!39660))

(declare-fun d!39662 () Bool)

(assert (=> d!39662 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305)) lt!193234)))

(declare-fun lt!194375 () Unit!7555)

(declare-fun choose!9 (BitStream!4390 array!5432 (_ BitVec 64) BitStream!4390) Unit!7555)

(assert (=> d!39662 (= lt!194375 (choose!9 thiss!1305 (buf!2898 (_2!5457 lt!193209)) lt!193234 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(assert (=> d!39662 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2898 (_2!5457 lt!193209)) lt!193234) lt!194375)))

(declare-fun bs!9602 () Bool)

(assert (= bs!9602 d!39662))

(assert (=> bs!9602 m!186543))

(declare-fun m!187401 () Bool)

(assert (=> bs!9602 m!187401))

(assert (=> b!122742 d!39662))

(declare-fun d!39664 () Bool)

(assert (=> d!39664 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!193215)))

(declare-fun lt!194376 () Unit!7555)

(assert (=> d!39664 (= lt!194376 (choose!9 (_2!5457 lt!193212) (buf!2898 (_2!5457 lt!193209)) lt!193215 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212)))))))

(assert (=> d!39664 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5457 lt!193212) (buf!2898 (_2!5457 lt!193209)) lt!193215) lt!194376)))

(declare-fun bs!9603 () Bool)

(assert (= bs!9603 d!39664))

(assert (=> bs!9603 m!186561))

(declare-fun m!187403 () Bool)

(assert (=> bs!9603 m!187403))

(assert (=> b!122742 d!39664))

(declare-fun lt!194377 () tuple2!10414)

(declare-fun d!39666 () Bool)

(assert (=> d!39666 (= lt!194377 (readNLeastSignificantBitsLoop!0 (_1!5459 lt!193224) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193230))))

(assert (=> d!39666 (= (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!193224) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193230) (tuple2!10391 (_2!5472 lt!194377) (_1!5472 lt!194377)))))

(declare-fun bs!9604 () Bool)

(assert (= bs!9604 d!39666))

(declare-fun m!187405 () Bool)

(assert (=> bs!9604 m!187405))

(assert (=> b!122742 d!39666))

(declare-fun d!39668 () Bool)

(declare-fun res!102094 () Bool)

(declare-fun e!80717 () Bool)

(assert (=> d!39668 (=> (not res!102094) (not e!80717))))

(assert (=> d!39668 (= res!102094 (= (size!2458 (buf!2898 thiss!1305)) (size!2458 (buf!2898 (_2!5457 lt!193209)))))))

(assert (=> d!39668 (= (isPrefixOf!0 thiss!1305 (_2!5457 lt!193209)) e!80717)))

(declare-fun b!123158 () Bool)

(declare-fun res!102095 () Bool)

(assert (=> b!123158 (=> (not res!102095) (not e!80717))))

(assert (=> b!123158 (= res!102095 (bvsle (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209)))))))

(declare-fun b!123159 () Bool)

(declare-fun e!80718 () Bool)

(assert (=> b!123159 (= e!80717 e!80718)))

(declare-fun res!102093 () Bool)

(assert (=> b!123159 (=> res!102093 e!80718)))

(assert (=> b!123159 (= res!102093 (= (size!2458 (buf!2898 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!123160 () Bool)

(assert (=> b!123160 (= e!80718 (arrayBitRangesEq!0 (buf!2898 thiss!1305) (buf!2898 (_2!5457 lt!193209)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(assert (= (and d!39668 res!102094) b!123158))

(assert (= (and b!123158 res!102095) b!123159))

(assert (= (and b!123159 (not res!102093)) b!123160))

(assert (=> b!123158 m!186517))

(assert (=> b!123158 m!186503))

(assert (=> b!123160 m!186517))

(assert (=> b!123160 m!186517))

(declare-fun m!187407 () Bool)

(assert (=> b!123160 m!187407))

(assert (=> b!122742 d!39668))

(declare-fun b!123161 () Bool)

(declare-fun e!80719 () Unit!7555)

(declare-fun Unit!7578 () Unit!7555)

(assert (=> b!123161 (= e!80719 Unit!7578)))

(declare-fun lt!194391 () (_ BitVec 64))

(declare-fun e!80720 () Bool)

(declare-fun b!123162 () Bool)

(declare-fun lt!194380 () tuple2!10388)

(declare-fun lt!194397 () (_ BitVec 64))

(assert (=> b!123162 (= e!80720 (= (_1!5459 lt!194380) (withMovedBitIndex!0 (_2!5459 lt!194380) (bvsub lt!194391 lt!194397))))))

(assert (=> b!123162 (or (= (bvand lt!194391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194397 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194391 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194391 lt!194397) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123162 (= lt!194397 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209))))))

(assert (=> b!123162 (= lt!194391 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))

(declare-fun d!39670 () Bool)

(assert (=> d!39670 e!80720))

(declare-fun res!102097 () Bool)

(assert (=> d!39670 (=> (not res!102097) (not e!80720))))

(assert (=> d!39670 (= res!102097 (isPrefixOf!0 (_1!5459 lt!194380) (_2!5459 lt!194380)))))

(declare-fun lt!194396 () BitStream!4390)

(assert (=> d!39670 (= lt!194380 (tuple2!10389 lt!194396 (_2!5457 lt!193209)))))

(declare-fun lt!194379 () Unit!7555)

(declare-fun lt!194388 () Unit!7555)

(assert (=> d!39670 (= lt!194379 lt!194388)))

(assert (=> d!39670 (isPrefixOf!0 lt!194396 (_2!5457 lt!193209))))

(assert (=> d!39670 (= lt!194388 (lemmaIsPrefixTransitive!0 lt!194396 (_2!5457 lt!193209) (_2!5457 lt!193209)))))

(declare-fun lt!194384 () Unit!7555)

(declare-fun lt!194382 () Unit!7555)

(assert (=> d!39670 (= lt!194384 lt!194382)))

(assert (=> d!39670 (isPrefixOf!0 lt!194396 (_2!5457 lt!193209))))

(assert (=> d!39670 (= lt!194382 (lemmaIsPrefixTransitive!0 lt!194396 thiss!1305 (_2!5457 lt!193209)))))

(declare-fun lt!194392 () Unit!7555)

(assert (=> d!39670 (= lt!194392 e!80719)))

(declare-fun c!7360 () Bool)

(assert (=> d!39670 (= c!7360 (not (= (size!2458 (buf!2898 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!194386 () Unit!7555)

(declare-fun lt!194393 () Unit!7555)

(assert (=> d!39670 (= lt!194386 lt!194393)))

(assert (=> d!39670 (isPrefixOf!0 (_2!5457 lt!193209) (_2!5457 lt!193209))))

(assert (=> d!39670 (= lt!194393 (lemmaIsPrefixRefl!0 (_2!5457 lt!193209)))))

(declare-fun lt!194395 () Unit!7555)

(declare-fun lt!194389 () Unit!7555)

(assert (=> d!39670 (= lt!194395 lt!194389)))

(assert (=> d!39670 (= lt!194389 (lemmaIsPrefixRefl!0 (_2!5457 lt!193209)))))

(declare-fun lt!194381 () Unit!7555)

(declare-fun lt!194394 () Unit!7555)

(assert (=> d!39670 (= lt!194381 lt!194394)))

(assert (=> d!39670 (isPrefixOf!0 lt!194396 lt!194396)))

(assert (=> d!39670 (= lt!194394 (lemmaIsPrefixRefl!0 lt!194396))))

(declare-fun lt!194390 () Unit!7555)

(declare-fun lt!194383 () Unit!7555)

(assert (=> d!39670 (= lt!194390 lt!194383)))

(assert (=> d!39670 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!39670 (= lt!194383 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!39670 (= lt!194396 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))

(assert (=> d!39670 (isPrefixOf!0 thiss!1305 (_2!5457 lt!193209))))

(assert (=> d!39670 (= (reader!0 thiss!1305 (_2!5457 lt!193209)) lt!194380)))

(declare-fun b!123163 () Bool)

(declare-fun res!102098 () Bool)

(assert (=> b!123163 (=> (not res!102098) (not e!80720))))

(assert (=> b!123163 (= res!102098 (isPrefixOf!0 (_2!5459 lt!194380) (_2!5457 lt!193209)))))

(declare-fun b!123164 () Bool)

(declare-fun lt!194378 () Unit!7555)

(assert (=> b!123164 (= e!80719 lt!194378)))

(declare-fun lt!194387 () (_ BitVec 64))

(assert (=> b!123164 (= lt!194387 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!194385 () (_ BitVec 64))

(assert (=> b!123164 (= lt!194385 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))

(assert (=> b!123164 (= lt!194378 (arrayBitRangesEqSymmetric!0 (buf!2898 thiss!1305) (buf!2898 (_2!5457 lt!193209)) lt!194387 lt!194385))))

(assert (=> b!123164 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!193209)) (buf!2898 thiss!1305) lt!194387 lt!194385)))

(declare-fun b!123165 () Bool)

(declare-fun res!102096 () Bool)

(assert (=> b!123165 (=> (not res!102096) (not e!80720))))

(assert (=> b!123165 (= res!102096 (isPrefixOf!0 (_1!5459 lt!194380) thiss!1305))))

(assert (= (and d!39670 c!7360) b!123164))

(assert (= (and d!39670 (not c!7360)) b!123161))

(assert (= (and d!39670 res!102097) b!123165))

(assert (= (and b!123165 res!102096) b!123163))

(assert (= (and b!123163 res!102098) b!123162))

(declare-fun m!187409 () Bool)

(assert (=> b!123163 m!187409))

(declare-fun m!187411 () Bool)

(assert (=> b!123165 m!187411))

(assert (=> b!123164 m!186517))

(declare-fun m!187413 () Bool)

(assert (=> b!123164 m!187413))

(declare-fun m!187415 () Bool)

(assert (=> b!123164 m!187415))

(declare-fun m!187417 () Bool)

(assert (=> b!123162 m!187417))

(assert (=> b!123162 m!186503))

(assert (=> b!123162 m!186517))

(declare-fun m!187419 () Bool)

(assert (=> d!39670 m!187419))

(declare-fun m!187421 () Bool)

(assert (=> d!39670 m!187421))

(declare-fun m!187423 () Bool)

(assert (=> d!39670 m!187423))

(declare-fun m!187425 () Bool)

(assert (=> d!39670 m!187425))

(declare-fun m!187427 () Bool)

(assert (=> d!39670 m!187427))

(declare-fun m!187429 () Bool)

(assert (=> d!39670 m!187429))

(declare-fun m!187431 () Bool)

(assert (=> d!39670 m!187431))

(assert (=> d!39670 m!187385))

(declare-fun m!187433 () Bool)

(assert (=> d!39670 m!187433))

(assert (=> d!39670 m!187389))

(assert (=> d!39670 m!186545))

(assert (=> b!122742 d!39670))

(declare-fun d!39672 () Bool)

(declare-fun e!80721 () Bool)

(assert (=> d!39672 e!80721))

(declare-fun res!102100 () Bool)

(assert (=> d!39672 (=> (not res!102100) (not e!80721))))

(declare-fun lt!194398 () (_ BitVec 64))

(declare-fun lt!194403 () (_ BitVec 64))

(declare-fun lt!194402 () (_ BitVec 64))

(assert (=> d!39672 (= res!102100 (= lt!194403 (bvsub lt!194398 lt!194402)))))

(assert (=> d!39672 (or (= (bvand lt!194398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194402 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194398 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194398 lt!194402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39672 (= lt!194402 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193232)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193232))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193232)))))))

(declare-fun lt!194400 () (_ BitVec 64))

(declare-fun lt!194401 () (_ BitVec 64))

(assert (=> d!39672 (= lt!194398 (bvmul lt!194400 lt!194401))))

(assert (=> d!39672 (or (= lt!194400 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194401 (bvsdiv (bvmul lt!194400 lt!194401) lt!194400)))))

(assert (=> d!39672 (= lt!194401 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39672 (= lt!194400 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193232)))))))

(assert (=> d!39672 (= lt!194403 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193232))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193232)))))))

(assert (=> d!39672 (invariant!0 (currentBit!5590 (_1!5458 lt!193232)) (currentByte!5595 (_1!5458 lt!193232)) (size!2458 (buf!2898 (_1!5458 lt!193232))))))

(assert (=> d!39672 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!193232))) (currentByte!5595 (_1!5458 lt!193232)) (currentBit!5590 (_1!5458 lt!193232))) lt!194403)))

(declare-fun b!123166 () Bool)

(declare-fun res!102099 () Bool)

(assert (=> b!123166 (=> (not res!102099) (not e!80721))))

(assert (=> b!123166 (= res!102099 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194403))))

(declare-fun b!123167 () Bool)

(declare-fun lt!194399 () (_ BitVec 64))

(assert (=> b!123167 (= e!80721 (bvsle lt!194403 (bvmul lt!194399 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123167 (or (= lt!194399 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194399 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194399)))))

(assert (=> b!123167 (= lt!194399 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193232)))))))

(assert (= (and d!39672 res!102100) b!123166))

(assert (= (and b!123166 res!102099) b!123167))

(declare-fun m!187435 () Bool)

(assert (=> d!39672 m!187435))

(declare-fun m!187437 () Bool)

(assert (=> d!39672 m!187437))

(assert (=> b!122742 d!39672))

(declare-fun d!39674 () Bool)

(declare-fun e!80722 () Bool)

(assert (=> d!39674 e!80722))

(declare-fun res!102102 () Bool)

(assert (=> d!39674 (=> (not res!102102) (not e!80722))))

(declare-fun lt!194408 () (_ BitVec 64))

(declare-fun lt!194404 () (_ BitVec 64))

(declare-fun lt!194409 () (_ BitVec 64))

(assert (=> d!39674 (= res!102102 (= lt!194409 (bvsub lt!194404 lt!194408)))))

(assert (=> d!39674 (or (= (bvand lt!194404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!194408 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!194404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194404 lt!194408) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39674 (= lt!194408 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193216)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193216))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193216)))))))

(declare-fun lt!194406 () (_ BitVec 64))

(declare-fun lt!194407 () (_ BitVec 64))

(assert (=> d!39674 (= lt!194404 (bvmul lt!194406 lt!194407))))

(assert (=> d!39674 (or (= lt!194406 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!194407 (bvsdiv (bvmul lt!194406 lt!194407) lt!194406)))))

(assert (=> d!39674 (= lt!194407 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39674 (= lt!194406 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193216)))))))

(assert (=> d!39674 (= lt!194409 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193216))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193216)))))))

(assert (=> d!39674 (invariant!0 (currentBit!5590 (_1!5458 lt!193216)) (currentByte!5595 (_1!5458 lt!193216)) (size!2458 (buf!2898 (_1!5458 lt!193216))))))

(assert (=> d!39674 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!193216))) (currentByte!5595 (_1!5458 lt!193216)) (currentBit!5590 (_1!5458 lt!193216))) lt!194409)))

(declare-fun b!123168 () Bool)

(declare-fun res!102101 () Bool)

(assert (=> b!123168 (=> (not res!102101) (not e!80722))))

(assert (=> b!123168 (= res!102101 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194409))))

(declare-fun b!123169 () Bool)

(declare-fun lt!194405 () (_ BitVec 64))

(assert (=> b!123169 (= e!80722 (bvsle lt!194409 (bvmul lt!194405 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123169 (or (= lt!194405 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!194405 #b0000000000000000000000000000000000000000000000000000000000001000) lt!194405)))))

(assert (=> b!123169 (= lt!194405 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193216)))))))

(assert (= (and d!39674 res!102102) b!123168))

(assert (= (and b!123168 res!102101) b!123169))

(declare-fun m!187439 () Bool)

(assert (=> d!39674 m!187439))

(declare-fun m!187441 () Bool)

(assert (=> d!39674 m!187441))

(assert (=> b!122744 d!39674))

(assert (=> b!122754 d!39504))

(assert (=> b!122754 d!39518))

(declare-fun d!39676 () Bool)

(assert (=> d!39676 (= (invariant!0 (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305) (size!2458 (buf!2898 (_2!5457 lt!193212)))) (and (bvsge (currentBit!5590 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5590 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5595 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5595 thiss!1305) (size!2458 (buf!2898 (_2!5457 lt!193212)))) (and (= (currentBit!5590 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5595 thiss!1305) (size!2458 (buf!2898 (_2!5457 lt!193212))))))))))

(assert (=> b!122743 d!39676))

(declare-fun d!39678 () Bool)

(assert (=> d!39678 (= (array_inv!2260 (buf!2898 thiss!1305)) (bvsge (size!2458 (buf!2898 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!122750 d!39678))

(declare-fun d!39680 () Bool)

(assert (=> d!39680 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!122752 d!39680))

(declare-fun d!39682 () Bool)

(declare-fun res!102104 () Bool)

(declare-fun e!80723 () Bool)

(assert (=> d!39682 (=> (not res!102104) (not e!80723))))

(assert (=> d!39682 (= res!102104 (= (size!2458 (buf!2898 thiss!1305)) (size!2458 (buf!2898 (_2!5457 lt!193212)))))))

(assert (=> d!39682 (= (isPrefixOf!0 thiss!1305 (_2!5457 lt!193212)) e!80723)))

(declare-fun b!123170 () Bool)

(declare-fun res!102105 () Bool)

(assert (=> b!123170 (=> (not res!102105) (not e!80723))))

(assert (=> b!123170 (= res!102105 (bvsle (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212)))))))

(declare-fun b!123171 () Bool)

(declare-fun e!80724 () Bool)

(assert (=> b!123171 (= e!80723 e!80724)))

(declare-fun res!102103 () Bool)

(assert (=> b!123171 (=> res!102103 e!80724)))

(assert (=> b!123171 (= res!102103 (= (size!2458 (buf!2898 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!123172 () Bool)

(assert (=> b!123172 (= e!80724 (arrayBitRangesEq!0 (buf!2898 thiss!1305) (buf!2898 (_2!5457 lt!193212)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(assert (= (and d!39682 res!102104) b!123170))

(assert (= (and b!123170 res!102105) b!123171))

(assert (= (and b!123171 (not res!102103)) b!123172))

(assert (=> b!123170 m!186517))

(assert (=> b!123170 m!186513))

(assert (=> b!123172 m!186517))

(assert (=> b!123172 m!186517))

(declare-fun m!187443 () Bool)

(assert (=> b!123172 m!187443))

(assert (=> b!122751 d!39682))

(push 1)

(assert (not b!122896))

(assert (not d!39638))

(assert (not d!39656))

(assert (not d!39490))

(assert (not b!123073))

(assert (not d!39658))

(assert (not b!123162))

(assert (not d!39540))

(assert (not b!123163))

(assert (not d!39500))

(assert (not d!39670))

(assert (not d!39506))

(assert (not d!39504))

(assert (not d!39518))

(assert (not b!123172))

(assert (not d!39636))

(assert (not b!123108))

(assert (not d!39674))

(assert (not d!39672))

(assert (not d!39526))

(assert (not d!39522))

(assert (not b!123074))

(assert (not d!39664))

(assert (not b!123068))

(assert (not b!123165))

(assert (not b!123158))

(assert (not b!123146))

(assert (not b!123072))

(assert (not bm!1601))

(assert (not b!123149))

(assert (not b!123148))

(assert (not d!39514))

(assert (not b!123069))

(assert (not d!39510))

(assert (not b!123160))

(assert (not b!123066))

(assert (not d!39666))

(assert (not d!39644))

(assert (not b!123105))

(assert (not d!39532))

(assert (not d!39662))

(assert (not d!39640))

(assert (not b!123164))

(assert (not b!123067))

(assert (not d!39646))

(assert (not d!39660))

(assert (not d!39492))

(assert (not b!123147))

(assert (not d!39538))

(assert (not b!123107))

(assert (not d!39530))

(assert (not b!123106))

(assert (not b!123064))

(assert (not b!123170))

(assert (not d!39642))

(assert (not b!123063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!122896 d!39676))

(declare-fun d!40176 () Bool)

(declare-fun e!81065 () Bool)

(assert (=> d!40176 e!81065))

(declare-fun res!102525 () Bool)

(assert (=> d!40176 (=> (not res!102525) (not e!81065))))

(declare-fun lt!195250 () (_ BitVec 64))

(declare-fun lt!195255 () (_ BitVec 64))

(declare-fun lt!195254 () (_ BitVec 64))

(assert (=> d!40176 (= res!102525 (= lt!195255 (bvsub lt!195250 lt!195254)))))

(assert (=> d!40176 (or (= (bvand lt!195250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195250 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195250 lt!195254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40176 (= lt!195254 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194233)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194233))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194233)))))))

(declare-fun lt!195252 () (_ BitVec 64))

(declare-fun lt!195253 () (_ BitVec 64))

(assert (=> d!40176 (= lt!195250 (bvmul lt!195252 lt!195253))))

(assert (=> d!40176 (or (= lt!195252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195253 (bvsdiv (bvmul lt!195252 lt!195253) lt!195252)))))

(assert (=> d!40176 (= lt!195253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40176 (= lt!195252 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194233)))))))

(assert (=> d!40176 (= lt!195255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194233))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194233)))))))

(assert (=> d!40176 (invariant!0 (currentBit!5590 (_1!5458 lt!194233)) (currentByte!5595 (_1!5458 lt!194233)) (size!2458 (buf!2898 (_1!5458 lt!194233))))))

(assert (=> d!40176 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194233))) (currentByte!5595 (_1!5458 lt!194233)) (currentBit!5590 (_1!5458 lt!194233))) lt!195255)))

(declare-fun b!123677 () Bool)

(declare-fun res!102524 () Bool)

(assert (=> b!123677 (=> (not res!102524) (not e!81065))))

(assert (=> b!123677 (= res!102524 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195255))))

(declare-fun b!123678 () Bool)

(declare-fun lt!195251 () (_ BitVec 64))

(assert (=> b!123678 (= e!81065 (bvsle lt!195255 (bvmul lt!195251 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123678 (or (= lt!195251 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195251 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195251)))))

(assert (=> b!123678 (= lt!195251 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194233)))))))

(assert (= (and d!40176 res!102525) b!123677))

(assert (= (and b!123677 res!102524) b!123678))

(declare-fun m!188599 () Bool)

(assert (=> d!40176 m!188599))

(declare-fun m!188601 () Bool)

(assert (=> d!40176 m!188601))

(assert (=> b!123108 d!40176))

(declare-fun d!40178 () Bool)

(declare-fun e!81066 () Bool)

(assert (=> d!40178 e!81066))

(declare-fun res!102527 () Bool)

(assert (=> d!40178 (=> (not res!102527) (not e!81066))))

(declare-fun lt!195260 () (_ BitVec 64))

(declare-fun lt!195261 () (_ BitVec 64))

(declare-fun lt!195256 () (_ BitVec 64))

(assert (=> d!40178 (= res!102527 (= lt!195261 (bvsub lt!195256 lt!195260)))))

(assert (=> d!40178 (or (= (bvand lt!195256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195260 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195256 lt!195260) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40178 (= lt!195260 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194235)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194235))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194235)))))))

(declare-fun lt!195258 () (_ BitVec 64))

(declare-fun lt!195259 () (_ BitVec 64))

(assert (=> d!40178 (= lt!195256 (bvmul lt!195258 lt!195259))))

(assert (=> d!40178 (or (= lt!195258 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195259 (bvsdiv (bvmul lt!195258 lt!195259) lt!195258)))))

(assert (=> d!40178 (= lt!195259 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40178 (= lt!195258 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194235)))))))

(assert (=> d!40178 (= lt!195261 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194235))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194235)))))))

(assert (=> d!40178 (invariant!0 (currentBit!5590 (_2!5457 lt!194235)) (currentByte!5595 (_2!5457 lt!194235)) (size!2458 (buf!2898 (_2!5457 lt!194235))))))

(assert (=> d!40178 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194235))) (currentByte!5595 (_2!5457 lt!194235)) (currentBit!5590 (_2!5457 lt!194235))) lt!195261)))

(declare-fun b!123679 () Bool)

(declare-fun res!102526 () Bool)

(assert (=> b!123679 (=> (not res!102526) (not e!81066))))

(assert (=> b!123679 (= res!102526 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195261))))

(declare-fun b!123680 () Bool)

(declare-fun lt!195257 () (_ BitVec 64))

(assert (=> b!123680 (= e!81066 (bvsle lt!195261 (bvmul lt!195257 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123680 (or (= lt!195257 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195257 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195257)))))

(assert (=> b!123680 (= lt!195257 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194235)))))))

(assert (= (and d!40178 res!102527) b!123679))

(assert (= (and b!123679 res!102526) b!123680))

(declare-fun m!188603 () Bool)

(assert (=> d!40178 m!188603))

(declare-fun m!188605 () Bool)

(assert (=> d!40178 m!188605))

(assert (=> b!123108 d!40178))

(declare-fun d!40180 () Bool)

(assert (=> d!40180 (isPrefixOf!0 lt!194137 lt!194137)))

(declare-fun lt!195264 () Unit!7555)

(declare-fun choose!11 (BitStream!4390) Unit!7555)

(assert (=> d!40180 (= lt!195264 (choose!11 lt!194137))))

(assert (=> d!40180 (= (lemmaIsPrefixRefl!0 lt!194137) lt!195264)))

(declare-fun bs!9682 () Bool)

(assert (= bs!9682 d!40180))

(declare-fun m!188607 () Bool)

(assert (=> bs!9682 m!188607))

(declare-fun m!188609 () Bool)

(assert (=> bs!9682 m!188609))

(assert (=> b!123073 d!40180))

(declare-fun b!123695 () Bool)

(declare-fun e!81080 () Bool)

(declare-fun e!81081 () Bool)

(assert (=> b!123695 (= e!81080 e!81081)))

(declare-fun res!102539 () Bool)

(declare-fun lt!195273 () (_ BitVec 32))

(declare-datatypes ((tuple4!92 0))(
  ( (tuple4!93 (_1!5477 (_ BitVec 32)) (_2!5477 (_ BitVec 32)) (_3!267 (_ BitVec 32)) (_4!46 (_ BitVec 32))) )
))
(declare-fun lt!195271 () tuple4!92)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!123695 (= res!102539 (byteRangesEq!0 (select (arr!3051 (buf!2898 thiss!1305)) (_3!267 lt!195271)) (select (arr!3051 (buf!2898 (_2!5457 lt!193209))) (_3!267 lt!195271)) lt!195273 #b00000000000000000000000000001000))))

(assert (=> b!123695 (=> (not res!102539) (not e!81081))))

(declare-fun b!123696 () Bool)

(declare-fun res!102542 () Bool)

(declare-fun lt!195272 () (_ BitVec 32))

(assert (=> b!123696 (= res!102542 (= lt!195272 #b00000000000000000000000000000000))))

(declare-fun e!81082 () Bool)

(assert (=> b!123696 (=> res!102542 e!81082)))

(assert (=> b!123696 (= e!81081 e!81082)))

(declare-fun b!123697 () Bool)

(declare-fun call!1624 () Bool)

(assert (=> b!123697 (= e!81080 call!1624)))

(declare-fun b!123698 () Bool)

(declare-fun e!81083 () Bool)

(assert (=> b!123698 (= e!81083 e!81080)))

(declare-fun c!7401 () Bool)

(assert (=> b!123698 (= c!7401 (= (_3!267 lt!195271) (_4!46 lt!195271)))))

(declare-fun d!40182 () Bool)

(declare-fun res!102540 () Bool)

(declare-fun e!81079 () Bool)

(assert (=> d!40182 (=> res!102540 e!81079)))

(assert (=> d!40182 (= res!102540 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(assert (=> d!40182 (= (arrayBitRangesEq!0 (buf!2898 thiss!1305) (buf!2898 (_2!5457 lt!193209)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))) e!81079)))

(declare-fun e!81084 () Bool)

(declare-fun b!123699 () Bool)

(declare-fun arrayRangesEq!47 (array!5432 array!5432 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!123699 (= e!81084 (arrayRangesEq!47 (buf!2898 thiss!1305) (buf!2898 (_2!5457 lt!193209)) (_1!5477 lt!195271) (_2!5477 lt!195271)))))

(declare-fun b!123700 () Bool)

(assert (=> b!123700 (= e!81079 e!81083)))

(declare-fun res!102541 () Bool)

(assert (=> b!123700 (=> (not res!102541) (not e!81083))))

(assert (=> b!123700 (= res!102541 e!81084)))

(declare-fun res!102538 () Bool)

(assert (=> b!123700 (=> res!102538 e!81084)))

(assert (=> b!123700 (= res!102538 (bvsge (_1!5477 lt!195271) (_2!5477 lt!195271)))))

(assert (=> b!123700 (= lt!195272 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123700 (= lt!195273 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!92)

(assert (=> b!123700 (= lt!195271 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(declare-fun b!123701 () Bool)

(assert (=> b!123701 (= e!81082 call!1624)))

(declare-fun bm!1621 () Bool)

(assert (=> bm!1621 (= call!1624 (byteRangesEq!0 (ite c!7401 (select (arr!3051 (buf!2898 thiss!1305)) (_3!267 lt!195271)) (select (arr!3051 (buf!2898 thiss!1305)) (_4!46 lt!195271))) (ite c!7401 (select (arr!3051 (buf!2898 (_2!5457 lt!193209))) (_3!267 lt!195271)) (select (arr!3051 (buf!2898 (_2!5457 lt!193209))) (_4!46 lt!195271))) (ite c!7401 lt!195273 #b00000000000000000000000000000000) lt!195272))))

(assert (= (and d!40182 (not res!102540)) b!123700))

(assert (= (and b!123700 (not res!102538)) b!123699))

(assert (= (and b!123700 res!102541) b!123698))

(assert (= (and b!123698 c!7401) b!123697))

(assert (= (and b!123698 (not c!7401)) b!123695))

(assert (= (and b!123695 res!102539) b!123696))

(assert (= (and b!123696 (not res!102542)) b!123701))

(assert (= (or b!123697 b!123701) bm!1621))

(declare-fun m!188611 () Bool)

(assert (=> b!123695 m!188611))

(declare-fun m!188613 () Bool)

(assert (=> b!123695 m!188613))

(assert (=> b!123695 m!188611))

(assert (=> b!123695 m!188613))

(declare-fun m!188615 () Bool)

(assert (=> b!123695 m!188615))

(declare-fun m!188617 () Bool)

(assert (=> b!123699 m!188617))

(assert (=> b!123700 m!186517))

(declare-fun m!188619 () Bool)

(assert (=> b!123700 m!188619))

(assert (=> bm!1621 m!188611))

(assert (=> bm!1621 m!188613))

(declare-fun m!188621 () Bool)

(assert (=> bm!1621 m!188621))

(declare-fun m!188623 () Bool)

(assert (=> bm!1621 m!188623))

(declare-fun m!188625 () Bool)

(assert (=> bm!1621 m!188625))

(assert (=> b!123160 d!40182))

(assert (=> b!123160 d!39518))

(declare-fun d!40184 () Bool)

(declare-fun e!81091 () Bool)

(assert (=> d!40184 e!81091))

(declare-fun res!102545 () Bool)

(assert (=> d!40184 (=> (not res!102545) (not e!81091))))

(declare-fun increaseBitIndex!0 (BitStream!4390) tuple2!10384)

(assert (=> d!40184 (= res!102545 (= (buf!2898 (_2!5457 (increaseBitIndex!0 lt!193231))) (buf!2898 lt!193231)))))

(declare-fun lt!195291 () Bool)

(assert (=> d!40184 (= lt!195291 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 lt!193231)) (currentByte!5595 lt!193231))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 lt!193231)))) #b00000000000000000000000000000000)))))

(declare-fun lt!195288 () tuple2!10416)

(assert (=> d!40184 (= lt!195288 (tuple2!10417 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 lt!193231)) (currentByte!5595 lt!193231))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 lt!193231)))) #b00000000000000000000000000000000)) (_2!5457 (increaseBitIndex!0 lt!193231))))))

(assert (=> d!40184 (validate_offset_bit!0 ((_ sign_extend 32) (size!2458 (buf!2898 lt!193231))) ((_ sign_extend 32) (currentByte!5595 lt!193231)) ((_ sign_extend 32) (currentBit!5590 lt!193231)))))

(assert (=> d!40184 (= (readBit!0 lt!193231) lt!195288)))

(declare-fun lt!195290 () (_ BitVec 64))

(declare-fun lt!195293 () (_ BitVec 64))

(declare-fun b!123704 () Bool)

(assert (=> b!123704 (= e!81091 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 (increaseBitIndex!0 lt!193231)))) (currentByte!5595 (_2!5457 (increaseBitIndex!0 lt!193231))) (currentBit!5590 (_2!5457 (increaseBitIndex!0 lt!193231)))) (bvadd lt!195293 lt!195290)))))

(assert (=> b!123704 (or (not (= (bvand lt!195293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195290 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195293 lt!195290) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123704 (= lt!195290 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123704 (= lt!195293 (bitIndex!0 (size!2458 (buf!2898 lt!193231)) (currentByte!5595 lt!193231) (currentBit!5590 lt!193231)))))

(declare-fun lt!195294 () Bool)

(assert (=> b!123704 (= lt!195294 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 lt!193231)) (currentByte!5595 lt!193231))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 lt!193231)))) #b00000000000000000000000000000000)))))

(declare-fun lt!195289 () Bool)

(assert (=> b!123704 (= lt!195289 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 lt!193231)) (currentByte!5595 lt!193231))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 lt!193231)))) #b00000000000000000000000000000000)))))

(declare-fun lt!195292 () Bool)

(assert (=> b!123704 (= lt!195292 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 lt!193231)) (currentByte!5595 lt!193231))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 lt!193231)))) #b00000000000000000000000000000000)))))

(assert (= (and d!40184 res!102545) b!123704))

(declare-fun m!188627 () Bool)

(assert (=> d!40184 m!188627))

(declare-fun m!188629 () Bool)

(assert (=> d!40184 m!188629))

(declare-fun m!188631 () Bool)

(assert (=> d!40184 m!188631))

(declare-fun m!188633 () Bool)

(assert (=> d!40184 m!188633))

(assert (=> b!123704 m!188631))

(assert (=> b!123704 m!188627))

(declare-fun m!188635 () Bool)

(assert (=> b!123704 m!188635))

(assert (=> b!123704 m!188629))

(declare-fun m!188637 () Bool)

(assert (=> b!123704 m!188637))

(assert (=> d!39656 d!40184))

(declare-fun d!40186 () Bool)

(assert (=> d!40186 (= (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193232)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193232))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193232)))) (bvsub (bvmul ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193232)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193232))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193232))))))))

(assert (=> d!39672 d!40186))

(declare-fun d!40188 () Bool)

(assert (=> d!40188 (= (invariant!0 (currentBit!5590 (_1!5458 lt!193232)) (currentByte!5595 (_1!5458 lt!193232)) (size!2458 (buf!2898 (_1!5458 lt!193232)))) (and (bvsge (currentBit!5590 (_1!5458 lt!193232)) #b00000000000000000000000000000000) (bvslt (currentBit!5590 (_1!5458 lt!193232)) #b00000000000000000000000000001000) (bvsge (currentByte!5595 (_1!5458 lt!193232)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5595 (_1!5458 lt!193232)) (size!2458 (buf!2898 (_1!5458 lt!193232)))) (and (= (currentBit!5590 (_1!5458 lt!193232)) #b00000000000000000000000000000000) (= (currentByte!5595 (_1!5458 lt!193232)) (size!2458 (buf!2898 (_1!5458 lt!193232))))))))))

(assert (=> d!39672 d!40188))

(declare-fun d!40190 () Bool)

(declare-fun e!81092 () Bool)

(assert (=> d!40190 e!81092))

(declare-fun res!102546 () Bool)

(assert (=> d!40190 (=> (not res!102546) (not e!81092))))

(assert (=> d!40190 (= res!102546 (= (buf!2898 (_2!5457 (increaseBitIndex!0 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))) (buf!2898 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))))))

(declare-fun lt!195298 () Bool)

(assert (=> d!40190 (= lt!195298 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))) (currentByte!5595 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195295 () tuple2!10416)

(assert (=> d!40190 (= lt!195295 (tuple2!10417 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))) (currentByte!5595 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!5457 (increaseBitIndex!0 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))))))

(assert (=> d!40190 (validate_offset_bit!0 ((_ sign_extend 32) (size!2458 (buf!2898 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))) ((_ sign_extend 32) (currentByte!5595 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))) ((_ sign_extend 32) (currentBit!5590 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))))))

(assert (=> d!40190 (= (readBit!0 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))) lt!195295)))

(declare-fun b!123705 () Bool)

(declare-fun lt!195297 () (_ BitVec 64))

(declare-fun lt!195300 () (_ BitVec 64))

(assert (=> b!123705 (= e!81092 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 (increaseBitIndex!0 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))))) (currentByte!5595 (_2!5457 (increaseBitIndex!0 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))) (currentBit!5590 (_2!5457 (increaseBitIndex!0 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))))) (bvadd lt!195300 lt!195297)))))

(assert (=> b!123705 (or (not (= (bvand lt!195300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195297 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195300 lt!195297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123705 (= lt!195297 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123705 (= lt!195300 (bitIndex!0 (size!2458 (buf!2898 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))) (currentByte!5595 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))) (currentBit!5590 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))))))

(declare-fun lt!195301 () Bool)

(assert (=> b!123705 (= lt!195301 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))) (currentByte!5595 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195296 () Bool)

(assert (=> b!123705 (= lt!195296 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))) (currentByte!5595 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195299 () Bool)

(assert (=> b!123705 (= lt!195299 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))) (currentByte!5595 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (readerFrom!0 (_2!5457 lt!193212) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!40190 res!102546) b!123705))

(assert (=> d!40190 m!186491))

(declare-fun m!188639 () Bool)

(assert (=> d!40190 m!188639))

(declare-fun m!188641 () Bool)

(assert (=> d!40190 m!188641))

(declare-fun m!188643 () Bool)

(assert (=> d!40190 m!188643))

(declare-fun m!188645 () Bool)

(assert (=> d!40190 m!188645))

(assert (=> b!123705 m!188643))

(assert (=> b!123705 m!186491))

(assert (=> b!123705 m!188639))

(declare-fun m!188647 () Bool)

(assert (=> b!123705 m!188647))

(assert (=> b!123705 m!188641))

(declare-fun m!188649 () Bool)

(assert (=> b!123705 m!188649))

(assert (=> d!39522 d!40190))

(declare-fun d!40192 () Bool)

(declare-fun res!102548 () Bool)

(declare-fun e!81093 () Bool)

(assert (=> d!40192 (=> (not res!102548) (not e!81093))))

(assert (=> d!40192 (= res!102548 (= (size!2458 (buf!2898 thiss!1305)) (size!2458 (buf!2898 (_2!5457 lt!194235)))))))

(assert (=> d!40192 (= (isPrefixOf!0 thiss!1305 (_2!5457 lt!194235)) e!81093)))

(declare-fun b!123706 () Bool)

(declare-fun res!102549 () Bool)

(assert (=> b!123706 (=> (not res!102549) (not e!81093))))

(assert (=> b!123706 (= res!102549 (bvsle (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194235))) (currentByte!5595 (_2!5457 lt!194235)) (currentBit!5590 (_2!5457 lt!194235)))))))

(declare-fun b!123707 () Bool)

(declare-fun e!81094 () Bool)

(assert (=> b!123707 (= e!81093 e!81094)))

(declare-fun res!102547 () Bool)

(assert (=> b!123707 (=> res!102547 e!81094)))

(assert (=> b!123707 (= res!102547 (= (size!2458 (buf!2898 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!123708 () Bool)

(assert (=> b!123708 (= e!81094 (arrayBitRangesEq!0 (buf!2898 thiss!1305) (buf!2898 (_2!5457 lt!194235)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(assert (= (and d!40192 res!102548) b!123706))

(assert (= (and b!123706 res!102549) b!123707))

(assert (= (and b!123707 (not res!102547)) b!123708))

(assert (=> b!123706 m!186517))

(assert (=> b!123706 m!187269))

(assert (=> b!123708 m!186517))

(assert (=> b!123708 m!186517))

(declare-fun m!188651 () Bool)

(assert (=> b!123708 m!188651))

(assert (=> b!123106 d!40192))

(assert (=> d!39664 d!39642))

(declare-fun d!40194 () Bool)

(assert (=> d!40194 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!193215)))

(assert (=> d!40194 true))

(declare-fun _$6!264 () Unit!7555)

(assert (=> d!40194 (= (choose!9 (_2!5457 lt!193212) (buf!2898 (_2!5457 lt!193209)) lt!193215 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212)))) _$6!264)))

(declare-fun bs!9683 () Bool)

(assert (= bs!9683 d!40194))

(assert (=> bs!9683 m!186561))

(assert (=> d!39664 d!40194))

(declare-fun d!40196 () Bool)

(declare-fun res!102551 () Bool)

(declare-fun e!81095 () Bool)

(assert (=> d!40196 (=> (not res!102551) (not e!81095))))

(assert (=> d!40196 (= res!102551 (= (size!2458 (buf!2898 (ite c!7350 (_2!5457 lt!193212) lt!194137))) (size!2458 (buf!2898 (ite c!7350 (_2!5457 lt!194093) lt!194137)))))))

(assert (=> d!40196 (= (isPrefixOf!0 (ite c!7350 (_2!5457 lt!193212) lt!194137) (ite c!7350 (_2!5457 lt!194093) lt!194137)) e!81095)))

(declare-fun b!123709 () Bool)

(declare-fun res!102552 () Bool)

(assert (=> b!123709 (=> (not res!102552) (not e!81095))))

(assert (=> b!123709 (= res!102552 (bvsle (bitIndex!0 (size!2458 (buf!2898 (ite c!7350 (_2!5457 lt!193212) lt!194137))) (currentByte!5595 (ite c!7350 (_2!5457 lt!193212) lt!194137)) (currentBit!5590 (ite c!7350 (_2!5457 lt!193212) lt!194137))) (bitIndex!0 (size!2458 (buf!2898 (ite c!7350 (_2!5457 lt!194093) lt!194137))) (currentByte!5595 (ite c!7350 (_2!5457 lt!194093) lt!194137)) (currentBit!5590 (ite c!7350 (_2!5457 lt!194093) lt!194137)))))))

(declare-fun b!123710 () Bool)

(declare-fun e!81096 () Bool)

(assert (=> b!123710 (= e!81095 e!81096)))

(declare-fun res!102550 () Bool)

(assert (=> b!123710 (=> res!102550 e!81096)))

(assert (=> b!123710 (= res!102550 (= (size!2458 (buf!2898 (ite c!7350 (_2!5457 lt!193212) lt!194137))) #b00000000000000000000000000000000))))

(declare-fun b!123711 () Bool)

(assert (=> b!123711 (= e!81096 (arrayBitRangesEq!0 (buf!2898 (ite c!7350 (_2!5457 lt!193212) lt!194137)) (buf!2898 (ite c!7350 (_2!5457 lt!194093) lt!194137)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (ite c!7350 (_2!5457 lt!193212) lt!194137))) (currentByte!5595 (ite c!7350 (_2!5457 lt!193212) lt!194137)) (currentBit!5590 (ite c!7350 (_2!5457 lt!193212) lt!194137)))))))

(assert (= (and d!40196 res!102551) b!123709))

(assert (= (and b!123709 res!102552) b!123710))

(assert (= (and b!123710 (not res!102550)) b!123711))

(declare-fun m!188653 () Bool)

(assert (=> b!123709 m!188653))

(declare-fun m!188655 () Bool)

(assert (=> b!123709 m!188655))

(assert (=> b!123711 m!188653))

(assert (=> b!123711 m!188653))

(declare-fun m!188657 () Bool)

(assert (=> b!123711 m!188657))

(assert (=> bm!1601 d!40196))

(declare-fun d!40198 () Bool)

(declare-fun e!81097 () Bool)

(assert (=> d!40198 e!81097))

(declare-fun res!102554 () Bool)

(assert (=> d!40198 (=> (not res!102554) (not e!81097))))

(declare-fun lt!195307 () (_ BitVec 64))

(declare-fun lt!195306 () (_ BitVec 64))

(declare-fun lt!195302 () (_ BitVec 64))

(assert (=> d!40198 (= res!102554 (= lt!195307 (bvsub lt!195302 lt!195306)))))

(assert (=> d!40198 (or (= (bvand lt!195302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195306 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195302 lt!195306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40198 (= lt!195306 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194130)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194130))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194130)))))))

(declare-fun lt!195304 () (_ BitVec 64))

(declare-fun lt!195305 () (_ BitVec 64))

(assert (=> d!40198 (= lt!195302 (bvmul lt!195304 lt!195305))))

(assert (=> d!40198 (or (= lt!195304 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195305 (bvsdiv (bvmul lt!195304 lt!195305) lt!195304)))))

(assert (=> d!40198 (= lt!195305 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40198 (= lt!195304 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194130)))))))

(assert (=> d!40198 (= lt!195307 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194130))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194130)))))))

(assert (=> d!40198 (invariant!0 (currentBit!5590 (_1!5458 lt!194130)) (currentByte!5595 (_1!5458 lt!194130)) (size!2458 (buf!2898 (_1!5458 lt!194130))))))

(assert (=> d!40198 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194130))) (currentByte!5595 (_1!5458 lt!194130)) (currentBit!5590 (_1!5458 lt!194130))) lt!195307)))

(declare-fun b!123712 () Bool)

(declare-fun res!102553 () Bool)

(assert (=> b!123712 (=> (not res!102553) (not e!81097))))

(assert (=> b!123712 (= res!102553 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195307))))

(declare-fun b!123713 () Bool)

(declare-fun lt!195303 () (_ BitVec 64))

(assert (=> b!123713 (= e!81097 (bvsle lt!195307 (bvmul lt!195303 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123713 (or (= lt!195303 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195303 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195303)))))

(assert (=> b!123713 (= lt!195303 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194130)))))))

(assert (= (and d!40198 res!102554) b!123712))

(assert (= (and b!123712 res!102553) b!123713))

(declare-fun m!188659 () Bool)

(assert (=> d!40198 m!188659))

(declare-fun m!188661 () Bool)

(assert (=> d!40198 m!188661))

(assert (=> b!123068 d!40198))

(declare-fun d!40200 () Bool)

(declare-fun e!81098 () Bool)

(assert (=> d!40200 e!81098))

(declare-fun res!102556 () Bool)

(assert (=> d!40200 (=> (not res!102556) (not e!81098))))

(declare-fun lt!195313 () (_ BitVec 64))

(declare-fun lt!195308 () (_ BitVec 64))

(declare-fun lt!195312 () (_ BitVec 64))

(assert (=> d!40200 (= res!102556 (= lt!195313 (bvsub lt!195308 lt!195312)))))

(assert (=> d!40200 (or (= (bvand lt!195308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195312 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195308 lt!195312) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40200 (= lt!195312 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194093)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194093))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194093)))))))

(declare-fun lt!195310 () (_ BitVec 64))

(declare-fun lt!195311 () (_ BitVec 64))

(assert (=> d!40200 (= lt!195308 (bvmul lt!195310 lt!195311))))

(assert (=> d!40200 (or (= lt!195310 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195311 (bvsdiv (bvmul lt!195310 lt!195311) lt!195310)))))

(assert (=> d!40200 (= lt!195311 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40200 (= lt!195310 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194093)))))))

(assert (=> d!40200 (= lt!195313 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194093))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194093)))))))

(assert (=> d!40200 (invariant!0 (currentBit!5590 (_2!5457 lt!194093)) (currentByte!5595 (_2!5457 lt!194093)) (size!2458 (buf!2898 (_2!5457 lt!194093))))))

(assert (=> d!40200 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194093))) (currentByte!5595 (_2!5457 lt!194093)) (currentBit!5590 (_2!5457 lt!194093))) lt!195313)))

(declare-fun b!123714 () Bool)

(declare-fun res!102555 () Bool)

(assert (=> b!123714 (=> (not res!102555) (not e!81098))))

(assert (=> b!123714 (= res!102555 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195313))))

(declare-fun b!123715 () Bool)

(declare-fun lt!195309 () (_ BitVec 64))

(assert (=> b!123715 (= e!81098 (bvsle lt!195313 (bvmul lt!195309 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123715 (or (= lt!195309 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195309 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195309)))))

(assert (=> b!123715 (= lt!195309 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194093)))))))

(assert (= (and d!40200 res!102556) b!123714))

(assert (= (and b!123714 res!102555) b!123715))

(declare-fun m!188663 () Bool)

(assert (=> d!40200 m!188663))

(declare-fun m!188665 () Bool)

(assert (=> d!40200 m!188665))

(assert (=> b!123068 d!40200))

(declare-fun d!40202 () Bool)

(assert (=> d!40202 (= (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193216)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193216))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193216)))) (bvsub (bvmul ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193216)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193216))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193216))))))))

(assert (=> d!39674 d!40202))

(declare-fun d!40204 () Bool)

(assert (=> d!40204 (= (invariant!0 (currentBit!5590 (_1!5458 lt!193216)) (currentByte!5595 (_1!5458 lt!193216)) (size!2458 (buf!2898 (_1!5458 lt!193216)))) (and (bvsge (currentBit!5590 (_1!5458 lt!193216)) #b00000000000000000000000000000000) (bvslt (currentBit!5590 (_1!5458 lt!193216)) #b00000000000000000000000000001000) (bvsge (currentByte!5595 (_1!5458 lt!193216)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5595 (_1!5458 lt!193216)) (size!2458 (buf!2898 (_1!5458 lt!193216)))) (and (= (currentBit!5590 (_1!5458 lt!193216)) #b00000000000000000000000000000000) (= (currentByte!5595 (_1!5458 lt!193216)) (size!2458 (buf!2898 (_1!5458 lt!193216))))))))))

(assert (=> d!39674 d!40204))

(declare-fun d!40206 () Bool)

(assert (=> d!40206 (= (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193212)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212)))) (bvsub (bvmul ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193212)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))))))))

(assert (=> d!39504 d!40206))

(declare-fun d!40208 () Bool)

(assert (=> d!40208 (= (invariant!0 (currentBit!5590 (_2!5457 lt!193212)) (currentByte!5595 (_2!5457 lt!193212)) (size!2458 (buf!2898 (_2!5457 lt!193212)))) (and (bvsge (currentBit!5590 (_2!5457 lt!193212)) #b00000000000000000000000000000000) (bvslt (currentBit!5590 (_2!5457 lt!193212)) #b00000000000000000000000000001000) (bvsge (currentByte!5595 (_2!5457 lt!193212)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5595 (_2!5457 lt!193212)) (size!2458 (buf!2898 (_2!5457 lt!193212)))) (and (= (currentBit!5590 (_2!5457 lt!193212)) #b00000000000000000000000000000000) (= (currentByte!5595 (_2!5457 lt!193212)) (size!2458 (buf!2898 (_2!5457 lt!193212))))))))))

(assert (=> d!39504 d!40208))

(assert (=> d!39526 d!40208))

(assert (=> b!123158 d!39518))

(assert (=> b!123158 d!39492))

(declare-fun d!40210 () Bool)

(declare-fun lt!195314 () tuple2!10416)

(assert (=> d!40210 (= lt!195314 (readBit!0 lt!194129))))

(assert (=> d!40210 (= (readBitPure!0 lt!194129) (tuple2!10387 (_2!5473 lt!195314) (_1!5473 lt!195314)))))

(declare-fun bs!9684 () Bool)

(assert (= bs!9684 d!40210))

(declare-fun m!188667 () Bool)

(assert (=> bs!9684 m!188667))

(assert (=> b!123066 d!40210))

(declare-fun d!40212 () Bool)

(declare-fun lt!195315 () tuple2!10416)

(assert (=> d!40212 (= lt!195315 (readBit!0 (_1!5459 lt!194113)))))

(assert (=> d!40212 (= (readBitPure!0 (_1!5459 lt!194113)) (tuple2!10387 (_2!5473 lt!195315) (_1!5473 lt!195315)))))

(declare-fun bs!9685 () Bool)

(assert (= bs!9685 d!40212))

(declare-fun m!188669 () Bool)

(assert (=> bs!9685 m!188669))

(assert (=> b!123066 d!40212))

(declare-fun d!40214 () Bool)

(assert (=> d!40214 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194094)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!194114)))

(declare-fun lt!195316 () Unit!7555)

(assert (=> d!40214 (= lt!195316 (choose!9 (_2!5457 lt!193212) (buf!2898 (_2!5457 lt!194094)) lt!194114 (BitStream!4391 (buf!2898 (_2!5457 lt!194094)) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212)))))))

(assert (=> d!40214 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5457 lt!193212) (buf!2898 (_2!5457 lt!194094)) lt!194114) lt!195316)))

(declare-fun bs!9686 () Bool)

(assert (= bs!9686 d!40214))

(assert (=> bs!9686 m!187215))

(declare-fun m!188671 () Bool)

(assert (=> bs!9686 m!188671))

(assert (=> b!123066 d!40214))

(declare-fun d!40216 () Bool)

(declare-fun lt!195317 () tuple2!10414)

(assert (=> d!40216 (= lt!195317 (readNLeastSignificantBitsLoop!0 (_1!5459 lt!194113) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194098))))

(assert (=> d!40216 (= (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!194113) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194098) (tuple2!10391 (_2!5472 lt!195317) (_1!5472 lt!195317)))))

(declare-fun bs!9687 () Bool)

(assert (= bs!9687 d!40216))

(declare-fun m!188673 () Bool)

(assert (=> bs!9687 m!188673))

(assert (=> b!123066 d!40216))

(declare-fun d!40218 () Bool)

(declare-fun e!81099 () Bool)

(assert (=> d!40218 e!81099))

(declare-fun res!102557 () Bool)

(assert (=> d!40218 (=> (not res!102557) (not e!81099))))

(declare-fun lt!195319 () (_ BitVec 64))

(declare-fun lt!195318 () BitStream!4390)

(assert (=> d!40218 (= res!102557 (= (bvadd lt!195319 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2458 (buf!2898 lt!195318)) (currentByte!5595 lt!195318) (currentBit!5590 lt!195318))))))

(assert (=> d!40218 (or (not (= (bvand lt!195319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195319 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40218 (= lt!195319 (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!194113))) (currentByte!5595 (_1!5459 lt!194113)) (currentBit!5590 (_1!5459 lt!194113))))))

(assert (=> d!40218 (= lt!195318 (_2!5457 (moveBitIndex!0 (_1!5459 lt!194113) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!40218 (moveBitIndexPrecond!0 (_1!5459 lt!194113) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!40218 (= (withMovedBitIndex!0 (_1!5459 lt!194113) #b0000000000000000000000000000000000000000000000000000000000000001) lt!195318)))

(declare-fun b!123716 () Bool)

(assert (=> b!123716 (= e!81099 (= (size!2458 (buf!2898 (_1!5459 lt!194113))) (size!2458 (buf!2898 lt!195318))))))

(assert (= (and d!40218 res!102557) b!123716))

(declare-fun m!188675 () Bool)

(assert (=> d!40218 m!188675))

(declare-fun m!188677 () Bool)

(assert (=> d!40218 m!188677))

(declare-fun m!188679 () Bool)

(assert (=> d!40218 m!188679))

(declare-fun m!188681 () Bool)

(assert (=> d!40218 m!188681))

(assert (=> b!123066 d!40218))

(declare-fun d!40220 () Bool)

(assert (=> d!40220 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194094)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!194114) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194094)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212)))) lt!194114))))

(declare-fun bs!9688 () Bool)

(assert (= bs!9688 d!40220))

(declare-fun m!188683 () Bool)

(assert (=> bs!9688 m!188683))

(assert (=> b!123066 d!40220))

(declare-fun d!40222 () Bool)

(assert (=> d!40222 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194094)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194126))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194126))) lt!194122)))

(declare-fun lt!195320 () Unit!7555)

(assert (=> d!40222 (= lt!195320 (choose!9 (_2!5457 lt!194126) (buf!2898 (_2!5457 lt!194094)) lt!194122 (BitStream!4391 (buf!2898 (_2!5457 lt!194094)) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126)))))))

(assert (=> d!40222 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5457 lt!194126) (buf!2898 (_2!5457 lt!194094)) lt!194122) lt!195320)))

(declare-fun bs!9689 () Bool)

(assert (= bs!9689 d!40222))

(assert (=> bs!9689 m!187185))

(declare-fun m!188685 () Bool)

(assert (=> bs!9689 m!188685))

(assert (=> b!123066 d!40222))

(declare-fun lt!195321 () tuple2!10414)

(declare-fun d!40224 () Bool)

(assert (=> d!40224 (= lt!195321 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5459 lt!194113) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194098 e!80669)))))

(assert (=> d!40224 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5459 lt!194113) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194098 e!80669)) (tuple2!10391 (_2!5472 lt!195321) (_1!5472 lt!195321)))))

(declare-fun bs!9690 () Bool)

(assert (= bs!9690 d!40224))

(assert (=> bs!9690 m!187193))

(declare-fun m!188687 () Bool)

(assert (=> bs!9690 m!188687))

(assert (=> b!123066 d!40224))

(declare-fun b!123717 () Bool)

(declare-fun e!81100 () Unit!7555)

(declare-fun Unit!7639 () Unit!7555)

(assert (=> b!123717 (= e!81100 Unit!7639)))

(declare-fun e!81101 () Bool)

(declare-fun b!123718 () Bool)

(declare-fun lt!195341 () (_ BitVec 64))

(declare-fun lt!195324 () tuple2!10388)

(declare-fun lt!195335 () (_ BitVec 64))

(assert (=> b!123718 (= e!81101 (= (_1!5459 lt!195324) (withMovedBitIndex!0 (_2!5459 lt!195324) (bvsub lt!195335 lt!195341))))))

(assert (=> b!123718 (or (= (bvand lt!195335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195341 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195335 lt!195341) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123718 (= lt!195341 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094))))))

(assert (=> b!123718 (= lt!195335 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))))))

(declare-fun d!40226 () Bool)

(assert (=> d!40226 e!81101))

(declare-fun res!102559 () Bool)

(assert (=> d!40226 (=> (not res!102559) (not e!81101))))

(assert (=> d!40226 (= res!102559 (isPrefixOf!0 (_1!5459 lt!195324) (_2!5459 lt!195324)))))

(declare-fun lt!195340 () BitStream!4390)

(assert (=> d!40226 (= lt!195324 (tuple2!10389 lt!195340 (_2!5457 lt!194094)))))

(declare-fun lt!195323 () Unit!7555)

(declare-fun lt!195332 () Unit!7555)

(assert (=> d!40226 (= lt!195323 lt!195332)))

(assert (=> d!40226 (isPrefixOf!0 lt!195340 (_2!5457 lt!194094))))

(assert (=> d!40226 (= lt!195332 (lemmaIsPrefixTransitive!0 lt!195340 (_2!5457 lt!194094) (_2!5457 lt!194094)))))

(declare-fun lt!195328 () Unit!7555)

(declare-fun lt!195326 () Unit!7555)

(assert (=> d!40226 (= lt!195328 lt!195326)))

(assert (=> d!40226 (isPrefixOf!0 lt!195340 (_2!5457 lt!194094))))

(assert (=> d!40226 (= lt!195326 (lemmaIsPrefixTransitive!0 lt!195340 (_2!5457 lt!194126) (_2!5457 lt!194094)))))

(declare-fun lt!195336 () Unit!7555)

(assert (=> d!40226 (= lt!195336 e!81100)))

(declare-fun c!7402 () Bool)

(assert (=> d!40226 (= c!7402 (not (= (size!2458 (buf!2898 (_2!5457 lt!194126))) #b00000000000000000000000000000000)))))

(declare-fun lt!195330 () Unit!7555)

(declare-fun lt!195337 () Unit!7555)

(assert (=> d!40226 (= lt!195330 lt!195337)))

(assert (=> d!40226 (isPrefixOf!0 (_2!5457 lt!194094) (_2!5457 lt!194094))))

(assert (=> d!40226 (= lt!195337 (lemmaIsPrefixRefl!0 (_2!5457 lt!194094)))))

(declare-fun lt!195339 () Unit!7555)

(declare-fun lt!195333 () Unit!7555)

(assert (=> d!40226 (= lt!195339 lt!195333)))

(assert (=> d!40226 (= lt!195333 (lemmaIsPrefixRefl!0 (_2!5457 lt!194094)))))

(declare-fun lt!195325 () Unit!7555)

(declare-fun lt!195338 () Unit!7555)

(assert (=> d!40226 (= lt!195325 lt!195338)))

(assert (=> d!40226 (isPrefixOf!0 lt!195340 lt!195340)))

(assert (=> d!40226 (= lt!195338 (lemmaIsPrefixRefl!0 lt!195340))))

(declare-fun lt!195334 () Unit!7555)

(declare-fun lt!195327 () Unit!7555)

(assert (=> d!40226 (= lt!195334 lt!195327)))

(assert (=> d!40226 (isPrefixOf!0 (_2!5457 lt!194126) (_2!5457 lt!194126))))

(assert (=> d!40226 (= lt!195327 (lemmaIsPrefixRefl!0 (_2!5457 lt!194126)))))

(assert (=> d!40226 (= lt!195340 (BitStream!4391 (buf!2898 (_2!5457 lt!194094)) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))))))

(assert (=> d!40226 (isPrefixOf!0 (_2!5457 lt!194126) (_2!5457 lt!194094))))

(assert (=> d!40226 (= (reader!0 (_2!5457 lt!194126) (_2!5457 lt!194094)) lt!195324)))

(declare-fun b!123719 () Bool)

(declare-fun res!102560 () Bool)

(assert (=> b!123719 (=> (not res!102560) (not e!81101))))

(assert (=> b!123719 (= res!102560 (isPrefixOf!0 (_2!5459 lt!195324) (_2!5457 lt!194094)))))

(declare-fun b!123720 () Bool)

(declare-fun lt!195322 () Unit!7555)

(assert (=> b!123720 (= e!81100 lt!195322)))

(declare-fun lt!195331 () (_ BitVec 64))

(assert (=> b!123720 (= lt!195331 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!195329 () (_ BitVec 64))

(assert (=> b!123720 (= lt!195329 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))))))

(assert (=> b!123720 (= lt!195322 (arrayBitRangesEqSymmetric!0 (buf!2898 (_2!5457 lt!194126)) (buf!2898 (_2!5457 lt!194094)) lt!195331 lt!195329))))

(assert (=> b!123720 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!194094)) (buf!2898 (_2!5457 lt!194126)) lt!195331 lt!195329)))

(declare-fun b!123721 () Bool)

(declare-fun res!102558 () Bool)

(assert (=> b!123721 (=> (not res!102558) (not e!81101))))

(assert (=> b!123721 (= res!102558 (isPrefixOf!0 (_1!5459 lt!195324) (_2!5457 lt!194126)))))

(assert (= (and d!40226 c!7402) b!123720))

(assert (= (and d!40226 (not c!7402)) b!123717))

(assert (= (and d!40226 res!102559) b!123721))

(assert (= (and b!123721 res!102558) b!123719))

(assert (= (and b!123719 res!102560) b!123718))

(declare-fun m!188689 () Bool)

(assert (=> b!123719 m!188689))

(declare-fun m!188691 () Bool)

(assert (=> b!123721 m!188691))

(assert (=> b!123720 m!187223))

(declare-fun m!188693 () Bool)

(assert (=> b!123720 m!188693))

(declare-fun m!188695 () Bool)

(assert (=> b!123720 m!188695))

(declare-fun m!188697 () Bool)

(assert (=> b!123718 m!188697))

(assert (=> b!123718 m!187191))

(assert (=> b!123718 m!187223))

(declare-fun m!188699 () Bool)

(assert (=> d!40226 m!188699))

(declare-fun m!188701 () Bool)

(assert (=> d!40226 m!188701))

(declare-fun m!188703 () Bool)

(assert (=> d!40226 m!188703))

(declare-fun m!188705 () Bool)

(assert (=> d!40226 m!188705))

(declare-fun m!188707 () Bool)

(assert (=> d!40226 m!188707))

(declare-fun m!188709 () Bool)

(assert (=> d!40226 m!188709))

(declare-fun m!188711 () Bool)

(assert (=> d!40226 m!188711))

(declare-fun m!188713 () Bool)

(assert (=> d!40226 m!188713))

(declare-fun m!188715 () Bool)

(assert (=> d!40226 m!188715))

(declare-fun m!188717 () Bool)

(assert (=> d!40226 m!188717))

(declare-fun m!188719 () Bool)

(assert (=> d!40226 m!188719))

(assert (=> b!123066 d!40226))

(declare-fun d!40228 () Bool)

(assert (=> d!40228 (= (invariant!0 (currentBit!5590 (_2!5457 lt!193212)) (currentByte!5595 (_2!5457 lt!193212)) (size!2458 (buf!2898 (_2!5457 lt!194126)))) (and (bvsge (currentBit!5590 (_2!5457 lt!193212)) #b00000000000000000000000000000000) (bvslt (currentBit!5590 (_2!5457 lt!193212)) #b00000000000000000000000000001000) (bvsge (currentByte!5595 (_2!5457 lt!193212)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5595 (_2!5457 lt!193212)) (size!2458 (buf!2898 (_2!5457 lt!194126)))) (and (= (currentBit!5590 (_2!5457 lt!193212)) #b00000000000000000000000000000000) (= (currentByte!5595 (_2!5457 lt!193212)) (size!2458 (buf!2898 (_2!5457 lt!194126))))))))))

(assert (=> b!123066 d!40228))

(declare-fun d!40230 () Bool)

(declare-fun lt!195346 () tuple2!10390)

(declare-fun lt!195344 () tuple2!10390)

(assert (=> d!40230 (and (= (_2!5460 lt!195346) (_2!5460 lt!195344)) (= (_1!5460 lt!195346) (_1!5460 lt!195344)))))

(declare-fun lt!195343 () (_ BitVec 64))

(declare-fun lt!195347 () Bool)

(declare-fun lt!195345 () BitStream!4390)

(declare-fun lt!195342 () Unit!7555)

(assert (=> d!40230 (= lt!195342 (choose!45 (_1!5459 lt!194113) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194098 lt!195346 (tuple2!10391 (_1!5460 lt!195346) (_2!5460 lt!195346)) (_1!5460 lt!195346) (_2!5460 lt!195346) lt!195347 lt!195345 lt!195343 lt!195344 (tuple2!10391 (_1!5460 lt!195344) (_2!5460 lt!195344)) (_1!5460 lt!195344) (_2!5460 lt!195344)))))

(assert (=> d!40230 (= lt!195344 (readNLeastSignificantBitsLoopPure!0 lt!195345 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!195343))))

(assert (=> d!40230 (= lt!195343 (bvor lt!194098 (ite lt!195347 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40230 (= lt!195345 (withMovedBitIndex!0 (_1!5459 lt!194113) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!40230 (= lt!195347 (_2!5458 (readBitPure!0 (_1!5459 lt!194113))))))

(assert (=> d!40230 (= lt!195346 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!194113) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194098))))

(assert (=> d!40230 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5459 lt!194113) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194098) lt!195342)))

(declare-fun bs!9691 () Bool)

(assert (= bs!9691 d!40230))

(assert (=> bs!9691 m!187199))

(declare-fun m!188721 () Bool)

(assert (=> bs!9691 m!188721))

(assert (=> bs!9691 m!187213))

(declare-fun m!188723 () Bool)

(assert (=> bs!9691 m!188723))

(assert (=> bs!9691 m!187193))

(assert (=> b!123066 d!40230))

(declare-fun d!40232 () Bool)

(declare-fun lt!195348 () tuple2!10416)

(assert (=> d!40232 (= lt!195348 (readBit!0 lt!194135))))

(assert (=> d!40232 (= (readBitPure!0 lt!194135) (tuple2!10387 (_2!5473 lt!195348) (_1!5473 lt!195348)))))

(declare-fun bs!9692 () Bool)

(assert (= bs!9692 d!40232))

(declare-fun m!188725 () Bool)

(assert (=> bs!9692 m!188725))

(assert (=> b!123066 d!40232))

(declare-fun d!40234 () Bool)

(assert (=> d!40234 (= (invariant!0 (currentBit!5590 lt!194135) (currentByte!5595 lt!194135) (size!2458 (buf!2898 (_2!5457 lt!194094)))) (and (bvsge (currentBit!5590 lt!194135) #b00000000000000000000000000000000) (bvslt (currentBit!5590 lt!194135) #b00000000000000000000000000001000) (bvsge (currentByte!5595 lt!194135) #b00000000000000000000000000000000) (or (bvslt (currentByte!5595 lt!194135) (size!2458 (buf!2898 (_2!5457 lt!194094)))) (and (= (currentBit!5590 lt!194135) #b00000000000000000000000000000000) (= (currentByte!5595 lt!194135) (size!2458 (buf!2898 (_2!5457 lt!194094))))))))))

(assert (=> b!123066 d!40234))

(assert (=> b!123066 d!39504))

(declare-fun d!40236 () Bool)

(declare-fun e!81102 () Bool)

(assert (=> d!40236 e!81102))

(declare-fun res!102561 () Bool)

(assert (=> d!40236 (=> (not res!102561) (not e!81102))))

(declare-fun lt!195349 () BitStream!4390)

(declare-fun lt!195350 () (_ BitVec 64))

(assert (=> d!40236 (= res!102561 (= (bvadd lt!195350 (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094))))) (bitIndex!0 (size!2458 (buf!2898 lt!195349)) (currentByte!5595 lt!195349) (currentBit!5590 lt!195349))))))

(assert (=> d!40236 (or (not (= (bvand lt!195350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195350 (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40236 (= lt!195350 (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!194102))) (currentByte!5595 (_2!5459 lt!194102)) (currentBit!5590 (_2!5459 lt!194102))))))

(assert (=> d!40236 (= lt!195349 (_2!5457 (moveBitIndex!0 (_2!5459 lt!194102) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094)))))))))

(assert (=> d!40236 (moveBitIndexPrecond!0 (_2!5459 lt!194102) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094)))))))

(assert (=> d!40236 (= (withMovedBitIndex!0 (_2!5459 lt!194102) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094))))) lt!195349)))

(declare-fun b!123722 () Bool)

(assert (=> b!123722 (= e!81102 (= (size!2458 (buf!2898 (_2!5459 lt!194102))) (size!2458 (buf!2898 lt!195349))))))

(assert (= (and d!40236 res!102561) b!123722))

(declare-fun m!188727 () Bool)

(assert (=> d!40236 m!188727))

(declare-fun m!188729 () Bool)

(assert (=> d!40236 m!188729))

(declare-fun m!188731 () Bool)

(assert (=> d!40236 m!188731))

(declare-fun m!188733 () Bool)

(assert (=> d!40236 m!188733))

(assert (=> b!123066 d!40236))

(declare-fun d!40238 () Bool)

(assert (=> d!40238 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194094)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194126))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194126))) lt!194122) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194094)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194126))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194126)))) lt!194122))))

(declare-fun bs!9693 () Bool)

(assert (= bs!9693 d!40238))

(declare-fun m!188735 () Bool)

(assert (=> bs!9693 m!188735))

(assert (=> b!123066 d!40238))

(declare-fun d!40240 () Bool)

(declare-fun res!102563 () Bool)

(declare-fun e!81103 () Bool)

(assert (=> d!40240 (=> (not res!102563) (not e!81103))))

(assert (=> d!40240 (= res!102563 (= (size!2458 (buf!2898 (_2!5457 lt!193212))) (size!2458 (buf!2898 (_2!5457 lt!194094)))))))

(assert (=> d!40240 (= (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!194094)) e!81103)))

(declare-fun b!123723 () Bool)

(declare-fun res!102564 () Bool)

(assert (=> b!123723 (=> (not res!102564) (not e!81103))))

(assert (=> b!123723 (= res!102564 (bvsle (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094)))))))

(declare-fun b!123724 () Bool)

(declare-fun e!81104 () Bool)

(assert (=> b!123724 (= e!81103 e!81104)))

(declare-fun res!102562 () Bool)

(assert (=> b!123724 (=> res!102562 e!81104)))

(assert (=> b!123724 (= res!102562 (= (size!2458 (buf!2898 (_2!5457 lt!193212))) #b00000000000000000000000000000000))))

(declare-fun b!123725 () Bool)

(assert (=> b!123725 (= e!81104 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!193212)) (buf!2898 (_2!5457 lt!194094)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212)))))))

(assert (= (and d!40240 res!102563) b!123723))

(assert (= (and b!123723 res!102564) b!123724))

(assert (= (and b!123724 (not res!102562)) b!123725))

(assert (=> b!123723 m!186513))

(assert (=> b!123723 m!187191))

(assert (=> b!123725 m!186513))

(assert (=> b!123725 m!186513))

(declare-fun m!188737 () Bool)

(assert (=> b!123725 m!188737))

(assert (=> b!123066 d!40240))

(declare-fun d!40242 () Bool)

(declare-fun e!81105 () Bool)

(assert (=> d!40242 e!81105))

(declare-fun res!102566 () Bool)

(assert (=> d!40242 (=> (not res!102566) (not e!81105))))

(declare-fun lt!195356 () (_ BitVec 64))

(declare-fun lt!195351 () (_ BitVec 64))

(declare-fun lt!195355 () (_ BitVec 64))

(assert (=> d!40242 (= res!102566 (= lt!195356 (bvsub lt!195351 lt!195355)))))

(assert (=> d!40242 (or (= (bvand lt!195351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195355 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195351 lt!195355) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40242 (= lt!195355 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194126)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194126))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194126)))))))

(declare-fun lt!195353 () (_ BitVec 64))

(declare-fun lt!195354 () (_ BitVec 64))

(assert (=> d!40242 (= lt!195351 (bvmul lt!195353 lt!195354))))

(assert (=> d!40242 (or (= lt!195353 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195354 (bvsdiv (bvmul lt!195353 lt!195354) lt!195353)))))

(assert (=> d!40242 (= lt!195354 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40242 (= lt!195353 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194126)))))))

(assert (=> d!40242 (= lt!195356 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194126))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194126)))))))

(assert (=> d!40242 (invariant!0 (currentBit!5590 (_2!5457 lt!194126)) (currentByte!5595 (_2!5457 lt!194126)) (size!2458 (buf!2898 (_2!5457 lt!194126))))))

(assert (=> d!40242 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) lt!195356)))

(declare-fun b!123726 () Bool)

(declare-fun res!102565 () Bool)

(assert (=> b!123726 (=> (not res!102565) (not e!81105))))

(assert (=> b!123726 (= res!102565 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195356))))

(declare-fun b!123727 () Bool)

(declare-fun lt!195352 () (_ BitVec 64))

(assert (=> b!123727 (= e!81105 (bvsle lt!195356 (bvmul lt!195352 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123727 (or (= lt!195352 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195352 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195352)))))

(assert (=> b!123727 (= lt!195352 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194126)))))))

(assert (= (and d!40242 res!102566) b!123726))

(assert (= (and b!123726 res!102565) b!123727))

(declare-fun m!188739 () Bool)

(assert (=> d!40242 m!188739))

(declare-fun m!188741 () Bool)

(assert (=> d!40242 m!188741))

(assert (=> b!123066 d!40242))

(declare-fun lt!195357 () tuple2!10414)

(declare-fun d!40244 () Bool)

(assert (=> d!40244 (= lt!195357 (readNLeastSignificantBitsLoop!0 (_1!5459 lt!194102) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194098 (ite (_2!5458 lt!194112) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!40244 (= (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!194102) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!194098 (ite (_2!5458 lt!194112) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!10391 (_2!5472 lt!195357) (_1!5472 lt!195357)))))

(declare-fun bs!9694 () Bool)

(assert (= bs!9694 d!40244))

(declare-fun m!188743 () Bool)

(assert (=> bs!9694 m!188743))

(assert (=> b!123066 d!40244))

(declare-fun d!40246 () Bool)

(declare-fun e!81106 () Bool)

(assert (=> d!40246 e!81106))

(declare-fun res!102568 () Bool)

(assert (=> d!40246 (=> (not res!102568) (not e!81106))))

(declare-fun lt!195363 () (_ BitVec 64))

(declare-fun lt!195358 () (_ BitVec 64))

(declare-fun lt!195362 () (_ BitVec 64))

(assert (=> d!40246 (= res!102568 (= lt!195363 (bvsub lt!195358 lt!195362)))))

(assert (=> d!40246 (or (= (bvand lt!195358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195362 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195358 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195358 lt!195362) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40246 (= lt!195362 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194101)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194101))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194101)))))))

(declare-fun lt!195360 () (_ BitVec 64))

(declare-fun lt!195361 () (_ BitVec 64))

(assert (=> d!40246 (= lt!195358 (bvmul lt!195360 lt!195361))))

(assert (=> d!40246 (or (= lt!195360 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195361 (bvsdiv (bvmul lt!195360 lt!195361) lt!195360)))))

(assert (=> d!40246 (= lt!195361 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40246 (= lt!195360 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194101)))))))

(assert (=> d!40246 (= lt!195363 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194101))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194101)))))))

(assert (=> d!40246 (invariant!0 (currentBit!5590 (_1!5458 lt!194101)) (currentByte!5595 (_1!5458 lt!194101)) (size!2458 (buf!2898 (_1!5458 lt!194101))))))

(assert (=> d!40246 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194101))) (currentByte!5595 (_1!5458 lt!194101)) (currentBit!5590 (_1!5458 lt!194101))) lt!195363)))

(declare-fun b!123728 () Bool)

(declare-fun res!102567 () Bool)

(assert (=> b!123728 (=> (not res!102567) (not e!81106))))

(assert (=> b!123728 (= res!102567 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195363))))

(declare-fun b!123729 () Bool)

(declare-fun lt!195359 () (_ BitVec 64))

(assert (=> b!123729 (= e!81106 (bvsle lt!195363 (bvmul lt!195359 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123729 (or (= lt!195359 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195359 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195359)))))

(assert (=> b!123729 (= lt!195359 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194101)))))))

(assert (= (and d!40246 res!102568) b!123728))

(assert (= (and b!123728 res!102567) b!123729))

(declare-fun m!188745 () Bool)

(assert (=> d!40246 m!188745))

(declare-fun m!188747 () Bool)

(assert (=> d!40246 m!188747))

(assert (=> b!123066 d!40246))

(declare-fun d!40248 () Bool)

(declare-fun e!81107 () Bool)

(assert (=> d!40248 e!81107))

(declare-fun res!102569 () Bool)

(assert (=> d!40248 (=> (not res!102569) (not e!81107))))

(declare-fun lt!195365 () (_ BitVec 64))

(declare-fun lt!195364 () BitStream!4390)

(assert (=> d!40248 (= res!102569 (= (bvadd lt!195365 (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094))))) (bitIndex!0 (size!2458 (buf!2898 lt!195364)) (currentByte!5595 lt!195364) (currentBit!5590 lt!195364))))))

(assert (=> d!40248 (or (not (= (bvand lt!195365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195365 (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40248 (= lt!195365 (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!194113))) (currentByte!5595 (_2!5459 lt!194113)) (currentBit!5590 (_2!5459 lt!194113))))))

(assert (=> d!40248 (= lt!195364 (_2!5457 (moveBitIndex!0 (_2!5459 lt!194113) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094)))))))))

(assert (=> d!40248 (moveBitIndexPrecond!0 (_2!5459 lt!194113) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094)))))))

(assert (=> d!40248 (= (withMovedBitIndex!0 (_2!5459 lt!194113) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094))))) lt!195364)))

(declare-fun b!123730 () Bool)

(assert (=> b!123730 (= e!81107 (= (size!2458 (buf!2898 (_2!5459 lt!194113))) (size!2458 (buf!2898 lt!195364))))))

(assert (= (and d!40248 res!102569) b!123730))

(declare-fun m!188749 () Bool)

(assert (=> d!40248 m!188749))

(declare-fun m!188751 () Bool)

(assert (=> d!40248 m!188751))

(declare-fun m!188753 () Bool)

(assert (=> d!40248 m!188753))

(declare-fun m!188755 () Bool)

(assert (=> d!40248 m!188755))

(assert (=> b!123066 d!40248))

(declare-fun d!40250 () Bool)

(declare-fun e!81108 () Bool)

(assert (=> d!40250 e!81108))

(declare-fun res!102570 () Bool)

(assert (=> d!40250 (=> (not res!102570) (not e!81108))))

(declare-fun lt!195369 () tuple2!10386)

(declare-fun lt!195366 () tuple2!10386)

(assert (=> d!40250 (= res!102570 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!195369))) (currentByte!5595 (_1!5458 lt!195369)) (currentBit!5590 (_1!5458 lt!195369))) (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!195366))) (currentByte!5595 (_1!5458 lt!195366)) (currentBit!5590 (_1!5458 lt!195366)))))))

(declare-fun lt!195367 () BitStream!4390)

(declare-fun lt!195368 () Unit!7555)

(assert (=> d!40250 (= lt!195368 (choose!50 lt!194135 (_2!5457 lt!194094) lt!195367 lt!195369 (tuple2!10387 (_1!5458 lt!195369) (_2!5458 lt!195369)) (_1!5458 lt!195369) (_2!5458 lt!195369) lt!195366 (tuple2!10387 (_1!5458 lt!195366) (_2!5458 lt!195366)) (_1!5458 lt!195366) (_2!5458 lt!195366)))))

(assert (=> d!40250 (= lt!195366 (readBitPure!0 lt!195367))))

(assert (=> d!40250 (= lt!195369 (readBitPure!0 lt!194135))))

(assert (=> d!40250 (= lt!195367 (BitStream!4391 (buf!2898 (_2!5457 lt!194094)) (currentByte!5595 lt!194135) (currentBit!5590 lt!194135)))))

(assert (=> d!40250 (invariant!0 (currentBit!5590 lt!194135) (currentByte!5595 lt!194135) (size!2458 (buf!2898 (_2!5457 lt!194094))))))

(assert (=> d!40250 (= (readBitPrefixLemma!0 lt!194135 (_2!5457 lt!194094)) lt!195368)))

(declare-fun b!123731 () Bool)

(assert (=> b!123731 (= e!81108 (= (_2!5458 lt!195369) (_2!5458 lt!195366)))))

(assert (= (and d!40250 res!102570) b!123731))

(assert (=> d!40250 m!187203))

(declare-fun m!188757 () Bool)

(assert (=> d!40250 m!188757))

(declare-fun m!188759 () Bool)

(assert (=> d!40250 m!188759))

(assert (=> d!40250 m!187183))

(declare-fun m!188761 () Bool)

(assert (=> d!40250 m!188761))

(declare-fun m!188763 () Bool)

(assert (=> d!40250 m!188763))

(assert (=> b!123066 d!40250))

(declare-fun d!40252 () Bool)

(declare-fun e!81109 () Bool)

(assert (=> d!40252 e!81109))

(declare-fun res!102572 () Bool)

(assert (=> d!40252 (=> (not res!102572) (not e!81109))))

(declare-fun lt!195375 () (_ BitVec 64))

(declare-fun lt!195374 () (_ BitVec 64))

(declare-fun lt!195370 () (_ BitVec 64))

(assert (=> d!40252 (= res!102572 (= lt!195375 (bvsub lt!195370 lt!195374)))))

(assert (=> d!40252 (or (= (bvand lt!195370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195374 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195370 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195370 lt!195374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40252 (= lt!195374 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194095)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194095))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194095)))))))

(declare-fun lt!195372 () (_ BitVec 64))

(declare-fun lt!195373 () (_ BitVec 64))

(assert (=> d!40252 (= lt!195370 (bvmul lt!195372 lt!195373))))

(assert (=> d!40252 (or (= lt!195372 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195373 (bvsdiv (bvmul lt!195372 lt!195373) lt!195372)))))

(assert (=> d!40252 (= lt!195373 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40252 (= lt!195372 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194095)))))))

(assert (=> d!40252 (= lt!195375 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194095))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194095)))))))

(assert (=> d!40252 (invariant!0 (currentBit!5590 (_1!5458 lt!194095)) (currentByte!5595 (_1!5458 lt!194095)) (size!2458 (buf!2898 (_1!5458 lt!194095))))))

(assert (=> d!40252 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194095))) (currentByte!5595 (_1!5458 lt!194095)) (currentBit!5590 (_1!5458 lt!194095))) lt!195375)))

(declare-fun b!123732 () Bool)

(declare-fun res!102571 () Bool)

(assert (=> b!123732 (=> (not res!102571) (not e!81109))))

(assert (=> b!123732 (= res!102571 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195375))))

(declare-fun b!123733 () Bool)

(declare-fun lt!195371 () (_ BitVec 64))

(assert (=> b!123733 (= e!81109 (bvsle lt!195375 (bvmul lt!195371 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123733 (or (= lt!195371 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195371 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195371)))))

(assert (=> b!123733 (= lt!195371 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194095)))))))

(assert (= (and d!40252 res!102572) b!123732))

(assert (= (and b!123732 res!102571) b!123733))

(declare-fun m!188765 () Bool)

(assert (=> d!40252 m!188765))

(declare-fun m!188767 () Bool)

(assert (=> d!40252 m!188767))

(assert (=> b!123066 d!40252))

(declare-fun d!40254 () Bool)

(assert (=> d!40254 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!194094))))

(declare-fun lt!195376 () Unit!7555)

(assert (=> d!40254 (= lt!195376 (choose!30 (_2!5457 lt!193212) (_2!5457 lt!194126) (_2!5457 lt!194094)))))

(assert (=> d!40254 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!194126))))

(assert (=> d!40254 (= (lemmaIsPrefixTransitive!0 (_2!5457 lt!193212) (_2!5457 lt!194126) (_2!5457 lt!194094)) lt!195376)))

(declare-fun bs!9695 () Bool)

(assert (= bs!9695 d!40254))

(assert (=> bs!9695 m!187187))

(declare-fun m!188769 () Bool)

(assert (=> bs!9695 m!188769))

(declare-fun m!188771 () Bool)

(assert (=> bs!9695 m!188771))

(assert (=> b!123066 d!40254))

(declare-fun d!40256 () Bool)

(assert (=> d!40256 (= (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!123066 d!40256))

(declare-fun b!123734 () Bool)

(declare-fun e!81114 () (_ BitVec 64))

(assert (=> b!123734 (= e!81114 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!123735 () Bool)

(declare-fun res!102578 () Bool)

(declare-fun e!81112 () Bool)

(assert (=> b!123735 (=> (not res!102578) (not e!81112))))

(declare-fun lt!195411 () tuple2!10384)

(declare-fun lt!195383 () (_ BitVec 64))

(declare-fun lt!195380 () (_ BitVec 64))

(assert (=> b!123735 (= res!102578 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195411))) (currentByte!5595 (_2!5457 lt!195411)) (currentBit!5590 (_2!5457 lt!195411))) (bvadd lt!195380 lt!195383)))))

(assert (=> b!123735 (or (not (= (bvand lt!195380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195383 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195380 lt!195383) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123735 (= lt!195383 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!123735 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!123735 (= lt!195380 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))))))

(declare-fun b!123736 () Bool)

(declare-fun res!102577 () Bool)

(declare-fun lt!195377 () tuple2!10384)

(assert (=> b!123736 (= res!102577 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195377))) (currentByte!5595 (_2!5457 lt!195377)) (currentBit!5590 (_2!5457 lt!195377))) (bvadd (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!81116 () Bool)

(assert (=> b!123736 (=> (not res!102577) (not e!81116))))

(declare-fun b!123737 () Bool)

(assert (=> b!123737 (= e!81114 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))))

(declare-fun b!123738 () Bool)

(declare-fun e!81110 () tuple2!10384)

(declare-fun lt!195378 () tuple2!10384)

(declare-fun Unit!7640 () Unit!7555)

(assert (=> b!123738 (= e!81110 (tuple2!10385 Unit!7640 (_2!5457 lt!195378)))))

(declare-fun lt!195412 () Bool)

(assert (=> b!123738 (= lt!195412 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123738 (= lt!195377 (appendBit!0 (_2!5457 lt!194126) lt!195412))))

(declare-fun res!102579 () Bool)

(assert (=> b!123738 (= res!102579 (= (size!2458 (buf!2898 (_2!5457 lt!194126))) (size!2458 (buf!2898 (_2!5457 lt!195377)))))))

(assert (=> b!123738 (=> (not res!102579) (not e!81116))))

(assert (=> b!123738 e!81116))

(declare-fun lt!195410 () tuple2!10384)

(assert (=> b!123738 (= lt!195410 lt!195377)))

(assert (=> b!123738 (= lt!195378 (appendNLeastSignificantBitsLoop!0 (_2!5457 lt!195410) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!195416 () Unit!7555)

(assert (=> b!123738 (= lt!195416 (lemmaIsPrefixTransitive!0 (_2!5457 lt!194126) (_2!5457 lt!195410) (_2!5457 lt!195378)))))

(assert (=> b!123738 (isPrefixOf!0 (_2!5457 lt!194126) (_2!5457 lt!195378))))

(declare-fun lt!195387 () Unit!7555)

(assert (=> b!123738 (= lt!195387 lt!195416)))

(assert (=> b!123738 (invariant!0 (currentBit!5590 (_2!5457 lt!194126)) (currentByte!5595 (_2!5457 lt!194126)) (size!2458 (buf!2898 (_2!5457 lt!195410))))))

(declare-fun lt!195419 () BitStream!4390)

(assert (=> b!123738 (= lt!195419 (BitStream!4391 (buf!2898 (_2!5457 lt!195410)) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))))))

(assert (=> b!123738 (invariant!0 (currentBit!5590 lt!195419) (currentByte!5595 lt!195419) (size!2458 (buf!2898 (_2!5457 lt!195378))))))

(declare-fun lt!195413 () BitStream!4390)

(assert (=> b!123738 (= lt!195413 (BitStream!4391 (buf!2898 (_2!5457 lt!195378)) (currentByte!5595 lt!195419) (currentBit!5590 lt!195419)))))

(declare-fun lt!195385 () tuple2!10386)

(assert (=> b!123738 (= lt!195385 (readBitPure!0 lt!195419))))

(declare-fun lt!195379 () tuple2!10386)

(assert (=> b!123738 (= lt!195379 (readBitPure!0 lt!195413))))

(declare-fun lt!195417 () Unit!7555)

(assert (=> b!123738 (= lt!195417 (readBitPrefixLemma!0 lt!195419 (_2!5457 lt!195378)))))

(declare-fun res!102580 () Bool)

(assert (=> b!123738 (= res!102580 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!195385))) (currentByte!5595 (_1!5458 lt!195385)) (currentBit!5590 (_1!5458 lt!195385))) (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!195379))) (currentByte!5595 (_1!5458 lt!195379)) (currentBit!5590 (_1!5458 lt!195379)))))))

(declare-fun e!81111 () Bool)

(assert (=> b!123738 (=> (not res!102580) (not e!81111))))

(assert (=> b!123738 e!81111))

(declare-fun lt!195400 () Unit!7555)

(assert (=> b!123738 (= lt!195400 lt!195417)))

(declare-fun lt!195397 () tuple2!10388)

(assert (=> b!123738 (= lt!195397 (reader!0 (_2!5457 lt!194126) (_2!5457 lt!195378)))))

(declare-fun lt!195386 () tuple2!10388)

(assert (=> b!123738 (= lt!195386 (reader!0 (_2!5457 lt!195410) (_2!5457 lt!195378)))))

(declare-fun lt!195396 () tuple2!10386)

(assert (=> b!123738 (= lt!195396 (readBitPure!0 (_1!5459 lt!195397)))))

(assert (=> b!123738 (= (_2!5458 lt!195396) lt!195412)))

(declare-fun lt!195381 () Unit!7555)

(declare-fun Unit!7641 () Unit!7555)

(assert (=> b!123738 (= lt!195381 Unit!7641)))

(declare-fun lt!195382 () (_ BitVec 64))

(assert (=> b!123738 (= lt!195382 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(declare-fun lt!195398 () (_ BitVec 64))

(assert (=> b!123738 (= lt!195398 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(declare-fun lt!195409 () Unit!7555)

(assert (=> b!123738 (= lt!195409 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5457 lt!194126) (buf!2898 (_2!5457 lt!195378)) lt!195398))))

(assert (=> b!123738 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!195378)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194126))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194126))) lt!195398)))

(declare-fun lt!195404 () Unit!7555)

(assert (=> b!123738 (= lt!195404 lt!195409)))

(declare-fun lt!195399 () tuple2!10390)

(assert (=> b!123738 (= lt!195399 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!195397) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!195382))))

(declare-fun lt!195406 () (_ BitVec 64))

(assert (=> b!123738 (= lt!195406 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!195415 () Unit!7555)

(assert (=> b!123738 (= lt!195415 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5457 lt!195410) (buf!2898 (_2!5457 lt!195378)) lt!195406))))

(assert (=> b!123738 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!195378)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!195410))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!195410))) lt!195406)))

(declare-fun lt!195402 () Unit!7555)

(assert (=> b!123738 (= lt!195402 lt!195415)))

(declare-fun lt!195390 () tuple2!10390)

(assert (=> b!123738 (= lt!195390 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!195386) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!195382 (ite (_2!5458 lt!195396) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!195420 () tuple2!10390)

(assert (=> b!123738 (= lt!195420 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!195397) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!195382))))

(declare-fun c!7403 () Bool)

(assert (=> b!123738 (= c!7403 (_2!5458 (readBitPure!0 (_1!5459 lt!195397))))))

(declare-fun lt!195407 () tuple2!10390)

(assert (=> b!123738 (= lt!195407 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5459 lt!195397) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!195382 e!81114)))))

(declare-fun lt!195392 () Unit!7555)

(assert (=> b!123738 (= lt!195392 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5459 lt!195397) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!195382))))

(assert (=> b!123738 (and (= (_2!5460 lt!195420) (_2!5460 lt!195407)) (= (_1!5460 lt!195420) (_1!5460 lt!195407)))))

(declare-fun lt!195393 () Unit!7555)

(assert (=> b!123738 (= lt!195393 lt!195392)))

(assert (=> b!123738 (= (_1!5459 lt!195397) (withMovedBitIndex!0 (_2!5459 lt!195397) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195378))) (currentByte!5595 (_2!5457 lt!195378)) (currentBit!5590 (_2!5457 lt!195378))))))))

(declare-fun lt!195403 () Unit!7555)

(declare-fun Unit!7642 () Unit!7555)

(assert (=> b!123738 (= lt!195403 Unit!7642)))

(assert (=> b!123738 (= (_1!5459 lt!195386) (withMovedBitIndex!0 (_2!5459 lt!195386) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195410))) (currentByte!5595 (_2!5457 lt!195410)) (currentBit!5590 (_2!5457 lt!195410))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195378))) (currentByte!5595 (_2!5457 lt!195378)) (currentBit!5590 (_2!5457 lt!195378))))))))

(declare-fun lt!195408 () Unit!7555)

(declare-fun Unit!7643 () Unit!7555)

(assert (=> b!123738 (= lt!195408 Unit!7643)))

(assert (=> b!123738 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194126))) (currentByte!5595 (_2!5457 lt!194126)) (currentBit!5590 (_2!5457 lt!194126))) (bvsub (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195410))) (currentByte!5595 (_2!5457 lt!195410)) (currentBit!5590 (_2!5457 lt!195410))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!195405 () Unit!7555)

(declare-fun Unit!7644 () Unit!7555)

(assert (=> b!123738 (= lt!195405 Unit!7644)))

(assert (=> b!123738 (= (_2!5460 lt!195399) (_2!5460 lt!195390))))

(declare-fun lt!195391 () Unit!7555)

(declare-fun Unit!7645 () Unit!7555)

(assert (=> b!123738 (= lt!195391 Unit!7645)))

(assert (=> b!123738 (= (_1!5460 lt!195399) (_2!5459 lt!195397))))

(declare-fun b!123739 () Bool)

(declare-fun e!81115 () Bool)

(declare-fun lt!195418 () (_ BitVec 64))

(assert (=> b!123739 (= e!81115 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194126)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194126))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194126))) lt!195418))))

(declare-fun b!123740 () Bool)

(declare-fun e!81113 () Bool)

(declare-fun lt!195414 () tuple2!10386)

(assert (=> b!123740 (= e!81113 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!195414))) (currentByte!5595 (_1!5458 lt!195414)) (currentBit!5590 (_1!5458 lt!195414))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195377))) (currentByte!5595 (_2!5457 lt!195377)) (currentBit!5590 (_2!5457 lt!195377)))))))

(declare-fun lt!195389 () tuple2!10388)

(declare-fun lt!195388 () tuple2!10390)

(declare-fun b!123741 () Bool)

(assert (=> b!123741 (= e!81112 (and (= (_2!5460 lt!195388) v!199) (= (_1!5460 lt!195388) (_2!5459 lt!195389))))))

(declare-fun lt!195394 () (_ BitVec 64))

(assert (=> b!123741 (= lt!195388 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!195389) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) lt!195394))))

(declare-fun lt!195384 () Unit!7555)

(declare-fun lt!195401 () Unit!7555)

(assert (=> b!123741 (= lt!195384 lt!195401)))

(assert (=> b!123741 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!195411)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194126))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194126))) lt!195418)))

(assert (=> b!123741 (= lt!195401 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5457 lt!194126) (buf!2898 (_2!5457 lt!195411)) lt!195418))))

(assert (=> b!123741 e!81115))

(declare-fun res!102581 () Bool)

(assert (=> b!123741 (=> (not res!102581) (not e!81115))))

(assert (=> b!123741 (= res!102581 (and (= (size!2458 (buf!2898 (_2!5457 lt!194126))) (size!2458 (buf!2898 (_2!5457 lt!195411)))) (bvsge lt!195418 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123741 (= lt!195418 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))

(assert (=> b!123741 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!123741 (= lt!195394 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001))))))))

(assert (=> b!123741 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!123741 (= lt!195389 (reader!0 (_2!5457 lt!194126) (_2!5457 lt!195411)))))

(declare-fun d!40258 () Bool)

(assert (=> d!40258 e!81112))

(declare-fun res!102574 () Bool)

(assert (=> d!40258 (=> (not res!102574) (not e!81112))))

(assert (=> d!40258 (= res!102574 (= (size!2458 (buf!2898 (_2!5457 lt!194126))) (size!2458 (buf!2898 (_2!5457 lt!195411)))))))

(assert (=> d!40258 (= lt!195411 e!81110)))

(declare-fun c!7404 () Bool)

(assert (=> d!40258 (= c!7404 (bvslt (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396))))

(assert (=> d!40258 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!40258 (= (appendNLeastSignificantBitsLoop!0 (_2!5457 lt!194126) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)) lt!195411)))

(declare-fun b!123742 () Bool)

(assert (=> b!123742 (= e!81111 (= (_2!5458 lt!195385) (_2!5458 lt!195379)))))

(declare-fun b!123743 () Bool)

(declare-fun res!102575 () Bool)

(declare-fun call!1625 () Bool)

(assert (=> b!123743 (= res!102575 call!1625)))

(assert (=> b!123743 (=> (not res!102575) (not e!81116))))

(declare-fun lt!195421 () BitStream!4390)

(declare-fun bm!1622 () Bool)

(assert (=> bm!1622 (= call!1625 (isPrefixOf!0 (ite c!7404 (_2!5457 lt!194126) lt!195421) (ite c!7404 (_2!5457 lt!195377) lt!195421)))))

(declare-fun b!123744 () Bool)

(declare-fun res!102576 () Bool)

(assert (=> b!123744 (=> (not res!102576) (not e!81112))))

(assert (=> b!123744 (= res!102576 (isPrefixOf!0 (_2!5457 lt!194126) (_2!5457 lt!195411)))))

(declare-fun b!123745 () Bool)

(declare-fun lt!195395 () Unit!7555)

(assert (=> b!123745 (= e!81110 (tuple2!10385 lt!195395 (_2!5457 lt!194126)))))

(assert (=> b!123745 (= lt!195421 (_2!5457 lt!194126))))

(assert (=> b!123745 (= lt!195395 (lemmaIsPrefixRefl!0 lt!195421))))

(assert (=> b!123745 call!1625))

(declare-fun b!123746 () Bool)

(assert (=> b!123746 (= lt!195414 (readBitPure!0 (readerFrom!0 (_2!5457 lt!195377) (currentBit!5590 (_2!5457 lt!194126)) (currentByte!5595 (_2!5457 lt!194126)))))))

(declare-fun res!102573 () Bool)

(assert (=> b!123746 (= res!102573 (and (= (_2!5458 lt!195414) lt!195412) (= (_1!5458 lt!195414) (_2!5457 lt!195377))))))

(assert (=> b!123746 (=> (not res!102573) (not e!81113))))

(assert (=> b!123746 (= e!81116 e!81113)))

(assert (= (and d!40258 c!7404) b!123738))

(assert (= (and d!40258 (not c!7404)) b!123745))

(assert (= (and b!123738 res!102579) b!123736))

(assert (= (and b!123736 res!102577) b!123743))

(assert (= (and b!123743 res!102575) b!123746))

(assert (= (and b!123746 res!102573) b!123740))

(assert (= (and b!123738 res!102580) b!123742))

(assert (= (and b!123738 c!7403) b!123737))

(assert (= (and b!123738 (not c!7403)) b!123734))

(assert (= (or b!123743 b!123745) bm!1622))

(assert (= (and d!40258 res!102574) b!123735))

(assert (= (and b!123735 res!102578) b!123744))

(assert (= (and b!123744 res!102576) b!123741))

(assert (= (and b!123741 res!102581) b!123739))

(declare-fun m!188773 () Bool)

(assert (=> b!123741 m!188773))

(declare-fun m!188775 () Bool)

(assert (=> b!123741 m!188775))

(declare-fun m!188777 () Bool)

(assert (=> b!123741 m!188777))

(declare-fun m!188779 () Bool)

(assert (=> b!123741 m!188779))

(declare-fun m!188781 () Bool)

(assert (=> b!123741 m!188781))

(declare-fun m!188783 () Bool)

(assert (=> b!123745 m!188783))

(declare-fun m!188785 () Bool)

(assert (=> b!123738 m!188785))

(declare-fun m!188787 () Bool)

(assert (=> b!123738 m!188787))

(declare-fun m!188789 () Bool)

(assert (=> b!123738 m!188789))

(declare-fun m!188791 () Bool)

(assert (=> b!123738 m!188791))

(declare-fun m!188793 () Bool)

(assert (=> b!123738 m!188793))

(declare-fun m!188795 () Bool)

(assert (=> b!123738 m!188795))

(declare-fun m!188797 () Bool)

(assert (=> b!123738 m!188797))

(declare-fun m!188799 () Bool)

(assert (=> b!123738 m!188799))

(declare-fun m!188801 () Bool)

(assert (=> b!123738 m!188801))

(declare-fun m!188803 () Bool)

(assert (=> b!123738 m!188803))

(declare-fun m!188805 () Bool)

(assert (=> b!123738 m!188805))

(declare-fun m!188807 () Bool)

(assert (=> b!123738 m!188807))

(assert (=> b!123738 m!188777))

(declare-fun m!188809 () Bool)

(assert (=> b!123738 m!188809))

(declare-fun m!188811 () Bool)

(assert (=> b!123738 m!188811))

(declare-fun m!188813 () Bool)

(assert (=> b!123738 m!188813))

(declare-fun m!188815 () Bool)

(assert (=> b!123738 m!188815))

(declare-fun m!188817 () Bool)

(assert (=> b!123738 m!188817))

(declare-fun m!188819 () Bool)

(assert (=> b!123738 m!188819))

(declare-fun m!188821 () Bool)

(assert (=> b!123738 m!188821))

(assert (=> b!123738 m!188805))

(declare-fun m!188823 () Bool)

(assert (=> b!123738 m!188823))

(declare-fun m!188825 () Bool)

(assert (=> b!123738 m!188825))

(assert (=> b!123738 m!187223))

(declare-fun m!188827 () Bool)

(assert (=> b!123738 m!188827))

(declare-fun m!188829 () Bool)

(assert (=> b!123738 m!188829))

(declare-fun m!188831 () Bool)

(assert (=> b!123738 m!188831))

(declare-fun m!188833 () Bool)

(assert (=> b!123738 m!188833))

(declare-fun m!188835 () Bool)

(assert (=> b!123738 m!188835))

(declare-fun m!188837 () Bool)

(assert (=> b!123738 m!188837))

(declare-fun m!188839 () Bool)

(assert (=> b!123735 m!188839))

(assert (=> b!123735 m!187223))

(declare-fun m!188841 () Bool)

(assert (=> b!123746 m!188841))

(assert (=> b!123746 m!188841))

(declare-fun m!188843 () Bool)

(assert (=> b!123746 m!188843))

(declare-fun m!188845 () Bool)

(assert (=> b!123744 m!188845))

(declare-fun m!188847 () Bool)

(assert (=> b!123740 m!188847))

(declare-fun m!188849 () Bool)

(assert (=> b!123740 m!188849))

(declare-fun m!188851 () Bool)

(assert (=> b!123739 m!188851))

(declare-fun m!188853 () Bool)

(assert (=> bm!1622 m!188853))

(assert (=> b!123736 m!188849))

(assert (=> b!123736 m!187223))

(assert (=> b!123066 d!40258))

(declare-fun d!40260 () Bool)

(declare-fun e!81118 () Bool)

(assert (=> d!40260 e!81118))

(declare-fun res!102584 () Bool)

(assert (=> d!40260 (=> (not res!102584) (not e!81118))))

(declare-fun lt!195424 () tuple2!10384)

(assert (=> d!40260 (= res!102584 (= (size!2458 (buf!2898 (_2!5457 lt!193212))) (size!2458 (buf!2898 (_2!5457 lt!195424)))))))

(assert (=> d!40260 (= lt!195424 (choose!16 (_2!5457 lt!193212) lt!194128))))

(assert (=> d!40260 (validate_offset_bit!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193212)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))))))

(assert (=> d!40260 (= (appendBit!0 (_2!5457 lt!193212) lt!194128) lt!195424)))

(declare-fun b!123750 () Bool)

(declare-fun e!81117 () Bool)

(declare-fun lt!195422 () tuple2!10386)

(assert (=> b!123750 (= e!81117 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!195422))) (currentByte!5595 (_1!5458 lt!195422)) (currentBit!5590 (_1!5458 lt!195422))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195424))) (currentByte!5595 (_2!5457 lt!195424)) (currentBit!5590 (_2!5457 lt!195424)))))))

(declare-fun b!123748 () Bool)

(declare-fun res!102583 () Bool)

(assert (=> b!123748 (=> (not res!102583) (not e!81118))))

(assert (=> b!123748 (= res!102583 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!195424)))))

(declare-fun b!123749 () Bool)

(assert (=> b!123749 (= e!81118 e!81117)))

(declare-fun res!102582 () Bool)

(assert (=> b!123749 (=> (not res!102582) (not e!81117))))

(assert (=> b!123749 (= res!102582 (and (= (_2!5458 lt!195422) lt!194128) (= (_1!5458 lt!195422) (_2!5457 lt!195424))))))

(assert (=> b!123749 (= lt!195422 (readBitPure!0 (readerFrom!0 (_2!5457 lt!195424) (currentBit!5590 (_2!5457 lt!193212)) (currentByte!5595 (_2!5457 lt!193212)))))))

(declare-fun b!123747 () Bool)

(declare-fun res!102585 () Bool)

(assert (=> b!123747 (=> (not res!102585) (not e!81118))))

(declare-fun lt!195423 () (_ BitVec 64))

(declare-fun lt!195425 () (_ BitVec 64))

(assert (=> b!123747 (= res!102585 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195424))) (currentByte!5595 (_2!5457 lt!195424)) (currentBit!5590 (_2!5457 lt!195424))) (bvadd lt!195425 lt!195423)))))

(assert (=> b!123747 (or (not (= (bvand lt!195425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195423 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195425 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195425 lt!195423) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123747 (= lt!195423 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123747 (= lt!195425 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(assert (= (and d!40260 res!102584) b!123747))

(assert (= (and b!123747 res!102585) b!123748))

(assert (= (and b!123748 res!102583) b!123749))

(assert (= (and b!123749 res!102582) b!123750))

(declare-fun m!188855 () Bool)

(assert (=> b!123748 m!188855))

(declare-fun m!188857 () Bool)

(assert (=> b!123749 m!188857))

(assert (=> b!123749 m!188857))

(declare-fun m!188859 () Bool)

(assert (=> b!123749 m!188859))

(declare-fun m!188861 () Bool)

(assert (=> d!40260 m!188861))

(declare-fun m!188863 () Bool)

(assert (=> d!40260 m!188863))

(declare-fun m!188865 () Bool)

(assert (=> b!123747 m!188865))

(assert (=> b!123747 m!186513))

(declare-fun m!188867 () Bool)

(assert (=> b!123750 m!188867))

(assert (=> b!123750 m!188865))

(assert (=> b!123066 d!40260))

(declare-fun b!123751 () Bool)

(declare-fun e!81119 () Unit!7555)

(declare-fun Unit!7646 () Unit!7555)

(assert (=> b!123751 (= e!81119 Unit!7646)))

(declare-fun lt!195428 () tuple2!10388)

(declare-fun e!81120 () Bool)

(declare-fun lt!195445 () (_ BitVec 64))

(declare-fun lt!195439 () (_ BitVec 64))

(declare-fun b!123752 () Bool)

(assert (=> b!123752 (= e!81120 (= (_1!5459 lt!195428) (withMovedBitIndex!0 (_2!5459 lt!195428) (bvsub lt!195439 lt!195445))))))

(assert (=> b!123752 (or (= (bvand lt!195439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195445 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195439 lt!195445) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123752 (= lt!195445 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094))))))

(assert (=> b!123752 (= lt!195439 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(declare-fun d!40262 () Bool)

(assert (=> d!40262 e!81120))

(declare-fun res!102587 () Bool)

(assert (=> d!40262 (=> (not res!102587) (not e!81120))))

(assert (=> d!40262 (= res!102587 (isPrefixOf!0 (_1!5459 lt!195428) (_2!5459 lt!195428)))))

(declare-fun lt!195444 () BitStream!4390)

(assert (=> d!40262 (= lt!195428 (tuple2!10389 lt!195444 (_2!5457 lt!194094)))))

(declare-fun lt!195427 () Unit!7555)

(declare-fun lt!195436 () Unit!7555)

(assert (=> d!40262 (= lt!195427 lt!195436)))

(assert (=> d!40262 (isPrefixOf!0 lt!195444 (_2!5457 lt!194094))))

(assert (=> d!40262 (= lt!195436 (lemmaIsPrefixTransitive!0 lt!195444 (_2!5457 lt!194094) (_2!5457 lt!194094)))))

(declare-fun lt!195432 () Unit!7555)

(declare-fun lt!195430 () Unit!7555)

(assert (=> d!40262 (= lt!195432 lt!195430)))

(assert (=> d!40262 (isPrefixOf!0 lt!195444 (_2!5457 lt!194094))))

(assert (=> d!40262 (= lt!195430 (lemmaIsPrefixTransitive!0 lt!195444 (_2!5457 lt!193212) (_2!5457 lt!194094)))))

(declare-fun lt!195440 () Unit!7555)

(assert (=> d!40262 (= lt!195440 e!81119)))

(declare-fun c!7405 () Bool)

(assert (=> d!40262 (= c!7405 (not (= (size!2458 (buf!2898 (_2!5457 lt!193212))) #b00000000000000000000000000000000)))))

(declare-fun lt!195434 () Unit!7555)

(declare-fun lt!195441 () Unit!7555)

(assert (=> d!40262 (= lt!195434 lt!195441)))

(assert (=> d!40262 (isPrefixOf!0 (_2!5457 lt!194094) (_2!5457 lt!194094))))

(assert (=> d!40262 (= lt!195441 (lemmaIsPrefixRefl!0 (_2!5457 lt!194094)))))

(declare-fun lt!195443 () Unit!7555)

(declare-fun lt!195437 () Unit!7555)

(assert (=> d!40262 (= lt!195443 lt!195437)))

(assert (=> d!40262 (= lt!195437 (lemmaIsPrefixRefl!0 (_2!5457 lt!194094)))))

(declare-fun lt!195429 () Unit!7555)

(declare-fun lt!195442 () Unit!7555)

(assert (=> d!40262 (= lt!195429 lt!195442)))

(assert (=> d!40262 (isPrefixOf!0 lt!195444 lt!195444)))

(assert (=> d!40262 (= lt!195442 (lemmaIsPrefixRefl!0 lt!195444))))

(declare-fun lt!195438 () Unit!7555)

(declare-fun lt!195431 () Unit!7555)

(assert (=> d!40262 (= lt!195438 lt!195431)))

(assert (=> d!40262 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!193212))))

(assert (=> d!40262 (= lt!195431 (lemmaIsPrefixRefl!0 (_2!5457 lt!193212)))))

(assert (=> d!40262 (= lt!195444 (BitStream!4391 (buf!2898 (_2!5457 lt!194094)) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(assert (=> d!40262 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!194094))))

(assert (=> d!40262 (= (reader!0 (_2!5457 lt!193212) (_2!5457 lt!194094)) lt!195428)))

(declare-fun b!123753 () Bool)

(declare-fun res!102588 () Bool)

(assert (=> b!123753 (=> (not res!102588) (not e!81120))))

(assert (=> b!123753 (= res!102588 (isPrefixOf!0 (_2!5459 lt!195428) (_2!5457 lt!194094)))))

(declare-fun b!123754 () Bool)

(declare-fun lt!195426 () Unit!7555)

(assert (=> b!123754 (= e!81119 lt!195426)))

(declare-fun lt!195435 () (_ BitVec 64))

(assert (=> b!123754 (= lt!195435 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!195433 () (_ BitVec 64))

(assert (=> b!123754 (= lt!195433 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(assert (=> b!123754 (= lt!195426 (arrayBitRangesEqSymmetric!0 (buf!2898 (_2!5457 lt!193212)) (buf!2898 (_2!5457 lt!194094)) lt!195435 lt!195433))))

(assert (=> b!123754 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!194094)) (buf!2898 (_2!5457 lt!193212)) lt!195435 lt!195433)))

(declare-fun b!123755 () Bool)

(declare-fun res!102586 () Bool)

(assert (=> b!123755 (=> (not res!102586) (not e!81120))))

(assert (=> b!123755 (= res!102586 (isPrefixOf!0 (_1!5459 lt!195428) (_2!5457 lt!193212)))))

(assert (= (and d!40262 c!7405) b!123754))

(assert (= (and d!40262 (not c!7405)) b!123751))

(assert (= (and d!40262 res!102587) b!123755))

(assert (= (and b!123755 res!102586) b!123753))

(assert (= (and b!123753 res!102588) b!123752))

(declare-fun m!188869 () Bool)

(assert (=> b!123753 m!188869))

(declare-fun m!188871 () Bool)

(assert (=> b!123755 m!188871))

(assert (=> b!123754 m!186513))

(declare-fun m!188873 () Bool)

(assert (=> b!123754 m!188873))

(declare-fun m!188875 () Bool)

(assert (=> b!123754 m!188875))

(declare-fun m!188877 () Bool)

(assert (=> b!123752 m!188877))

(assert (=> b!123752 m!187191))

(assert (=> b!123752 m!186513))

(declare-fun m!188879 () Bool)

(assert (=> d!40262 m!188879))

(declare-fun m!188881 () Bool)

(assert (=> d!40262 m!188881))

(declare-fun m!188883 () Bool)

(assert (=> d!40262 m!188883))

(declare-fun m!188885 () Bool)

(assert (=> d!40262 m!188885))

(declare-fun m!188887 () Bool)

(assert (=> d!40262 m!188887))

(assert (=> d!40262 m!187381))

(declare-fun m!188889 () Bool)

(assert (=> d!40262 m!188889))

(assert (=> d!40262 m!188713))

(assert (=> d!40262 m!187387))

(assert (=> d!40262 m!188717))

(assert (=> d!40262 m!187187))

(assert (=> b!123066 d!40262))

(declare-fun d!40264 () Bool)

(declare-fun e!81121 () Bool)

(assert (=> d!40264 e!81121))

(declare-fun res!102590 () Bool)

(assert (=> d!40264 (=> (not res!102590) (not e!81121))))

(declare-fun lt!195451 () (_ BitVec 64))

(declare-fun lt!195450 () (_ BitVec 64))

(declare-fun lt!195446 () (_ BitVec 64))

(assert (=> d!40264 (= res!102590 (= lt!195451 (bvsub lt!195446 lt!195450)))))

(assert (=> d!40264 (or (= (bvand lt!195446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195450 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195446 lt!195450) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40264 (= lt!195450 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194094)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194094))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194094)))))))

(declare-fun lt!195448 () (_ BitVec 64))

(declare-fun lt!195449 () (_ BitVec 64))

(assert (=> d!40264 (= lt!195446 (bvmul lt!195448 lt!195449))))

(assert (=> d!40264 (or (= lt!195448 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195449 (bvsdiv (bvmul lt!195448 lt!195449) lt!195448)))))

(assert (=> d!40264 (= lt!195449 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40264 (= lt!195448 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194094)))))))

(assert (=> d!40264 (= lt!195451 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194094))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194094)))))))

(assert (=> d!40264 (invariant!0 (currentBit!5590 (_2!5457 lt!194094)) (currentByte!5595 (_2!5457 lt!194094)) (size!2458 (buf!2898 (_2!5457 lt!194094))))))

(assert (=> d!40264 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194094))) (currentByte!5595 (_2!5457 lt!194094)) (currentBit!5590 (_2!5457 lt!194094))) lt!195451)))

(declare-fun b!123756 () Bool)

(declare-fun res!102589 () Bool)

(assert (=> b!123756 (=> (not res!102589) (not e!81121))))

(assert (=> b!123756 (= res!102589 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195451))))

(declare-fun b!123757 () Bool)

(declare-fun lt!195447 () (_ BitVec 64))

(assert (=> b!123757 (= e!81121 (bvsle lt!195451 (bvmul lt!195447 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123757 (or (= lt!195447 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195447 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195447)))))

(assert (=> b!123757 (= lt!195447 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194094)))))))

(assert (= (and d!40264 res!102590) b!123756))

(assert (= (and b!123756 res!102589) b!123757))

(declare-fun m!188891 () Bool)

(assert (=> d!40264 m!188891))

(declare-fun m!188893 () Bool)

(assert (=> d!40264 m!188893))

(assert (=> b!123066 d!40264))

(declare-fun d!40266 () Bool)

(declare-fun res!102592 () Bool)

(declare-fun e!81122 () Bool)

(assert (=> d!40266 (=> (not res!102592) (not e!81122))))

(assert (=> d!40266 (= res!102592 (= (size!2458 (buf!2898 (_1!5459 lt!194347))) (size!2458 (buf!2898 (_2!5457 lt!193212)))))))

(assert (=> d!40266 (= (isPrefixOf!0 (_1!5459 lt!194347) (_2!5457 lt!193212)) e!81122)))

(declare-fun b!123758 () Bool)

(declare-fun res!102593 () Bool)

(assert (=> b!123758 (=> (not res!102593) (not e!81122))))

(assert (=> b!123758 (= res!102593 (bvsle (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!194347))) (currentByte!5595 (_1!5459 lt!194347)) (currentBit!5590 (_1!5459 lt!194347))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212)))))))

(declare-fun b!123759 () Bool)

(declare-fun e!81123 () Bool)

(assert (=> b!123759 (= e!81122 e!81123)))

(declare-fun res!102591 () Bool)

(assert (=> b!123759 (=> res!102591 e!81123)))

(assert (=> b!123759 (= res!102591 (= (size!2458 (buf!2898 (_1!5459 lt!194347))) #b00000000000000000000000000000000))))

(declare-fun b!123760 () Bool)

(assert (=> b!123760 (= e!81123 (arrayBitRangesEq!0 (buf!2898 (_1!5459 lt!194347)) (buf!2898 (_2!5457 lt!193212)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!194347))) (currentByte!5595 (_1!5459 lt!194347)) (currentBit!5590 (_1!5459 lt!194347)))))))

(assert (= (and d!40266 res!102592) b!123758))

(assert (= (and b!123758 res!102593) b!123759))

(assert (= (and b!123759 (not res!102591)) b!123760))

(declare-fun m!188895 () Bool)

(assert (=> b!123758 m!188895))

(assert (=> b!123758 m!186513))

(assert (=> b!123760 m!188895))

(assert (=> b!123760 m!188895))

(declare-fun m!188897 () Bool)

(assert (=> b!123760 m!188897))

(assert (=> b!123149 d!40266))

(declare-fun d!40268 () Bool)

(declare-fun res!102595 () Bool)

(declare-fun e!81124 () Bool)

(assert (=> d!40268 (=> (not res!102595) (not e!81124))))

(assert (=> d!40268 (= res!102595 (= (size!2458 (buf!2898 (_2!5459 lt!194380))) (size!2458 (buf!2898 (_2!5457 lt!193209)))))))

(assert (=> d!40268 (= (isPrefixOf!0 (_2!5459 lt!194380) (_2!5457 lt!193209)) e!81124)))

(declare-fun b!123761 () Bool)

(declare-fun res!102596 () Bool)

(assert (=> b!123761 (=> (not res!102596) (not e!81124))))

(assert (=> b!123761 (= res!102596 (bvsle (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!194380))) (currentByte!5595 (_2!5459 lt!194380)) (currentBit!5590 (_2!5459 lt!194380))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209)))))))

(declare-fun b!123762 () Bool)

(declare-fun e!81125 () Bool)

(assert (=> b!123762 (= e!81124 e!81125)))

(declare-fun res!102594 () Bool)

(assert (=> b!123762 (=> res!102594 e!81125)))

(assert (=> b!123762 (= res!102594 (= (size!2458 (buf!2898 (_2!5459 lt!194380))) #b00000000000000000000000000000000))))

(declare-fun b!123763 () Bool)

(assert (=> b!123763 (= e!81125 (arrayBitRangesEq!0 (buf!2898 (_2!5459 lt!194380)) (buf!2898 (_2!5457 lt!193209)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!194380))) (currentByte!5595 (_2!5459 lt!194380)) (currentBit!5590 (_2!5459 lt!194380)))))))

(assert (= (and d!40268 res!102595) b!123761))

(assert (= (and b!123761 res!102596) b!123762))

(assert (= (and b!123762 (not res!102594)) b!123763))

(declare-fun m!188899 () Bool)

(assert (=> b!123761 m!188899))

(assert (=> b!123761 m!186503))

(assert (=> b!123763 m!188899))

(assert (=> b!123763 m!188899))

(declare-fun m!188901 () Bool)

(assert (=> b!123763 m!188901))

(assert (=> b!123163 d!40268))

(declare-fun d!40270 () Bool)

(declare-fun e!81126 () Bool)

(assert (=> d!40270 e!81126))

(declare-fun res!102598 () Bool)

(assert (=> d!40270 (=> (not res!102598) (not e!81126))))

(declare-fun lt!195456 () (_ BitVec 64))

(declare-fun lt!195452 () (_ BitVec 64))

(declare-fun lt!195457 () (_ BitVec 64))

(assert (=> d!40270 (= res!102598 (= lt!195457 (bvsub lt!195452 lt!195456)))))

(assert (=> d!40270 (or (= (bvand lt!195452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195456 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195452 lt!195456) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40270 (= lt!195456 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194127)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194127))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194127)))))))

(declare-fun lt!195454 () (_ BitVec 64))

(declare-fun lt!195455 () (_ BitVec 64))

(assert (=> d!40270 (= lt!195452 (bvmul lt!195454 lt!195455))))

(assert (=> d!40270 (or (= lt!195454 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195455 (bvsdiv (bvmul lt!195454 lt!195455) lt!195454)))))

(assert (=> d!40270 (= lt!195455 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40270 (= lt!195454 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194127)))))))

(assert (=> d!40270 (= lt!195457 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!194127))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!194127)))))))

(assert (=> d!40270 (invariant!0 (currentBit!5590 (_2!5457 lt!194127)) (currentByte!5595 (_2!5457 lt!194127)) (size!2458 (buf!2898 (_2!5457 lt!194127))))))

(assert (=> d!40270 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194127))) (currentByte!5595 (_2!5457 lt!194127)) (currentBit!5590 (_2!5457 lt!194127))) lt!195457)))

(declare-fun b!123764 () Bool)

(declare-fun res!102597 () Bool)

(assert (=> b!123764 (=> (not res!102597) (not e!81126))))

(assert (=> b!123764 (= res!102597 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195457))))

(declare-fun b!123765 () Bool)

(declare-fun lt!195453 () (_ BitVec 64))

(assert (=> b!123765 (= e!81126 (bvsle lt!195457 (bvmul lt!195453 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123765 (or (= lt!195453 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195453 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195453)))))

(assert (=> b!123765 (= lt!195453 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194127)))))))

(assert (= (and d!40270 res!102598) b!123764))

(assert (= (and b!123764 res!102597) b!123765))

(declare-fun m!188903 () Bool)

(assert (=> d!40270 m!188903))

(declare-fun m!188905 () Bool)

(assert (=> d!40270 m!188905))

(assert (=> b!123063 d!40270))

(assert (=> b!123063 d!39504))

(assert (=> d!39662 d!39638))

(declare-fun d!40272 () Bool)

(assert (=> d!40272 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305)) lt!193234)))

(assert (=> d!40272 true))

(declare-fun _$6!265 () Unit!7555)

(assert (=> d!40272 (= (choose!9 thiss!1305 (buf!2898 (_2!5457 lt!193209)) lt!193234 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))) _$6!265)))

(declare-fun bs!9696 () Bool)

(assert (= bs!9696 d!40272))

(assert (=> bs!9696 m!186543))

(assert (=> d!39662 d!40272))

(declare-fun lt!195478 () (_ BitVec 64))

(declare-fun b!123780 () Bool)

(declare-fun e!81133 () Bool)

(declare-fun lt!195480 () tuple2!10414)

(assert (=> b!123780 (= e!81133 (= (= (bvand (bvlshr (_1!5472 lt!195480) lt!195478) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!5458 (readBitPure!0 (_1!5459 lt!193219)))))))

(assert (=> b!123780 (and (bvsge lt!195478 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195478 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!195476 () (_ BitVec 32))

(assert (=> b!123780 (= lt!195478 ((_ sign_extend 32) (bvsub lt!195476 i!615)))))

(assert (=> b!123780 (or (= (bvand lt!195476 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand lt!195476 #b10000000000000000000000000000000) (bvand (bvsub lt!195476 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!123780 (= lt!195476 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!123780 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!123781 () Bool)

(declare-fun e!81134 () tuple2!10414)

(assert (=> b!123781 (= e!81134 (tuple2!10415 lt!193223 (_1!5459 lt!193219)))))

(declare-fun b!123782 () Bool)

(declare-fun res!102611 () Bool)

(declare-fun e!81135 () Bool)

(assert (=> b!123782 (=> (not res!102611) (not e!81135))))

(assert (=> b!123782 (= res!102611 (= (bvand (_1!5472 lt!195480) (onesLSBLong!0 nBits!396)) (_1!5472 lt!195480)))))

(declare-fun d!40274 () Bool)

(assert (=> d!40274 e!81135))

(declare-fun res!102610 () Bool)

(assert (=> d!40274 (=> (not res!102610) (not e!81135))))

(assert (=> d!40274 (= res!102610 (= (buf!2898 (_2!5472 lt!195480)) (buf!2898 (_1!5459 lt!193219))))))

(assert (=> d!40274 (= lt!195480 e!81134)))

(declare-fun c!7408 () Bool)

(assert (=> d!40274 (= c!7408 (= nBits!396 i!615))))

(assert (=> d!40274 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!40274 (= (readNLeastSignificantBitsLoop!0 (_1!5459 lt!193219) nBits!396 i!615 lt!193223) lt!195480)))

(declare-fun b!123783 () Bool)

(declare-fun res!102612 () Bool)

(assert (=> b!123783 (=> (not res!102612) (not e!81135))))

(declare-fun lt!195479 () (_ BitVec 64))

(declare-fun lt!195484 () (_ BitVec 64))

(assert (=> b!123783 (= res!102612 (= (bvlshr (_1!5472 lt!195480) lt!195484) (bvlshr lt!193223 lt!195479)))))

(assert (=> b!123783 (and (bvsge lt!195479 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195479 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123783 (= lt!195479 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!123783 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!123783 (and (bvsge lt!195484 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195484 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123783 (= lt!195484 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!123783 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(declare-fun b!123784 () Bool)

(assert (=> b!123784 (= e!81135 e!81133)))

(declare-fun res!102609 () Bool)

(assert (=> b!123784 (=> res!102609 e!81133)))

(assert (=> b!123784 (= res!102609 (bvsge i!615 nBits!396))))

(declare-fun b!123785 () Bool)

(declare-fun res!102613 () Bool)

(assert (=> b!123785 (=> (not res!102613) (not e!81135))))

(declare-fun lt!195481 () (_ BitVec 64))

(declare-fun lt!195483 () (_ BitVec 64))

(assert (=> b!123785 (= res!102613 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5472 lt!195480))) (currentByte!5595 (_2!5472 lt!195480)) (currentBit!5590 (_2!5472 lt!195480))) (bvadd lt!195483 lt!195481)))))

(assert (=> b!123785 (or (not (= (bvand lt!195483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195481 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195483 lt!195481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123785 (= lt!195481 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (=> b!123785 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))

(assert (=> b!123785 (= lt!195483 (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!193219))) (currentByte!5595 (_1!5459 lt!193219)) (currentBit!5590 (_1!5459 lt!193219))))))

(declare-fun b!123786 () Bool)

(declare-fun lt!195482 () tuple2!10414)

(assert (=> b!123786 (= e!81134 (tuple2!10415 (_1!5472 lt!195482) (_2!5472 lt!195482)))))

(declare-fun lt!195477 () tuple2!10416)

(assert (=> b!123786 (= lt!195477 (readBit!0 (_1!5459 lt!193219)))))

(assert (=> b!123786 (= lt!195482 (readNLeastSignificantBitsLoop!0 (_2!5473 lt!195477) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!193223 (ite (_1!5473 lt!195477) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!40274 c!7408) b!123781))

(assert (= (and d!40274 (not c!7408)) b!123786))

(assert (= (and d!40274 res!102610) b!123785))

(assert (= (and b!123785 res!102613) b!123783))

(assert (= (and b!123783 res!102612) b!123782))

(assert (= (and b!123782 res!102611) b!123784))

(assert (= (and b!123784 (not res!102609)) b!123780))

(assert (=> b!123780 m!186531))

(assert (=> b!123782 m!186499))

(declare-fun m!188907 () Bool)

(assert (=> b!123785 m!188907))

(assert (=> b!123785 m!186771))

(assert (=> b!123786 m!187243))

(declare-fun m!188909 () Bool)

(assert (=> b!123786 m!188909))

(assert (=> d!39658 d!40274))

(declare-fun d!40276 () Bool)

(declare-fun res!102615 () Bool)

(declare-fun e!81136 () Bool)

(assert (=> d!40276 (=> (not res!102615) (not e!81136))))

(assert (=> d!40276 (= res!102615 (= (size!2458 (buf!2898 (_2!5459 lt!194347))) (size!2458 (buf!2898 (_2!5457 lt!193209)))))))

(assert (=> d!40276 (= (isPrefixOf!0 (_2!5459 lt!194347) (_2!5457 lt!193209)) e!81136)))

(declare-fun b!123787 () Bool)

(declare-fun res!102616 () Bool)

(assert (=> b!123787 (=> (not res!102616) (not e!81136))))

(assert (=> b!123787 (= res!102616 (bvsle (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!194347))) (currentByte!5595 (_2!5459 lt!194347)) (currentBit!5590 (_2!5459 lt!194347))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209)))))))

(declare-fun b!123788 () Bool)

(declare-fun e!81137 () Bool)

(assert (=> b!123788 (= e!81136 e!81137)))

(declare-fun res!102614 () Bool)

(assert (=> b!123788 (=> res!102614 e!81137)))

(assert (=> b!123788 (= res!102614 (= (size!2458 (buf!2898 (_2!5459 lt!194347))) #b00000000000000000000000000000000))))

(declare-fun b!123789 () Bool)

(assert (=> b!123789 (= e!81137 (arrayBitRangesEq!0 (buf!2898 (_2!5459 lt!194347)) (buf!2898 (_2!5457 lt!193209)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!194347))) (currentByte!5595 (_2!5459 lt!194347)) (currentBit!5590 (_2!5459 lt!194347)))))))

(assert (= (and d!40276 res!102615) b!123787))

(assert (= (and b!123787 res!102616) b!123788))

(assert (= (and b!123788 (not res!102614)) b!123789))

(declare-fun m!188911 () Bool)

(assert (=> b!123787 m!188911))

(assert (=> b!123787 m!186503))

(assert (=> b!123789 m!188911))

(assert (=> b!123789 m!188911))

(declare-fun m!188913 () Bool)

(assert (=> b!123789 m!188913))

(assert (=> b!123147 d!40276))

(declare-fun d!40278 () Bool)

(declare-fun res!102618 () Bool)

(declare-fun e!81138 () Bool)

(assert (=> d!40278 (=> (not res!102618) (not e!81138))))

(assert (=> d!40278 (= res!102618 (= (size!2458 (buf!2898 (_1!5459 lt!194380))) (size!2458 (buf!2898 thiss!1305))))))

(assert (=> d!40278 (= (isPrefixOf!0 (_1!5459 lt!194380) thiss!1305) e!81138)))

(declare-fun b!123790 () Bool)

(declare-fun res!102619 () Bool)

(assert (=> b!123790 (=> (not res!102619) (not e!81138))))

(assert (=> b!123790 (= res!102619 (bvsle (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!194380))) (currentByte!5595 (_1!5459 lt!194380)) (currentBit!5590 (_1!5459 lt!194380))) (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(declare-fun b!123791 () Bool)

(declare-fun e!81139 () Bool)

(assert (=> b!123791 (= e!81138 e!81139)))

(declare-fun res!102617 () Bool)

(assert (=> b!123791 (=> res!102617 e!81139)))

(assert (=> b!123791 (= res!102617 (= (size!2458 (buf!2898 (_1!5459 lt!194380))) #b00000000000000000000000000000000))))

(declare-fun b!123792 () Bool)

(assert (=> b!123792 (= e!81139 (arrayBitRangesEq!0 (buf!2898 (_1!5459 lt!194380)) (buf!2898 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!194380))) (currentByte!5595 (_1!5459 lt!194380)) (currentBit!5590 (_1!5459 lt!194380)))))))

(assert (= (and d!40278 res!102618) b!123790))

(assert (= (and b!123790 res!102619) b!123791))

(assert (= (and b!123791 (not res!102617)) b!123792))

(declare-fun m!188915 () Bool)

(assert (=> b!123790 m!188915))

(assert (=> b!123790 m!186517))

(assert (=> b!123792 m!188915))

(assert (=> b!123792 m!188915))

(declare-fun m!188917 () Bool)

(assert (=> b!123792 m!188917))

(assert (=> b!123165 d!40278))

(declare-fun d!40280 () Bool)

(declare-fun lt!195489 () tuple2!10390)

(declare-fun lt!195490 () tuple2!10390)

(assert (=> d!40280 (and (= (_2!5460 lt!195489) (_2!5460 lt!195490)) (= (_1!5460 lt!195489) (_1!5460 lt!195490)))))

(declare-fun e!81142 () (_ BitVec 64))

(assert (=> d!40280 (= lt!195490 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5459 lt!193219) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd i!615 #b00000000000000000000000000000001) (bvor lt!193223 e!81142)))))

(declare-fun c!7411 () Bool)

(assert (=> d!40280 (= c!7411 (_2!5458 (readBitPure!0 (_1!5459 lt!193219))))))

(assert (=> d!40280 (= lt!195489 (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!193219) nBits!396 i!615 lt!193223))))

(assert (=> d!40280 true))

(declare-fun _$11!53 () Unit!7555)

(assert (=> d!40280 (= (choose!45 (_1!5459 lt!193219) nBits!396 i!615 lt!193223 lt!193465 (tuple2!10391 (_1!5460 lt!193465) (_2!5460 lt!193465)) (_1!5460 lt!193465) (_2!5460 lt!193465) lt!193466 lt!193464 lt!193462 lt!193463 (tuple2!10391 (_1!5460 lt!193463) (_2!5460 lt!193463)) (_1!5460 lt!193463) (_2!5460 lt!193463)) _$11!53)))

(declare-fun b!123797 () Bool)

(assert (=> b!123797 (= e!81142 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!123798 () Bool)

(assert (=> b!123798 (= e!81142 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!40280 c!7411) b!123797))

(assert (= (and d!40280 (not c!7411)) b!123798))

(assert (=> d!40280 m!186505))

(assert (=> d!40280 m!186505))

(declare-fun m!188919 () Bool)

(assert (=> d!40280 m!188919))

(assert (=> d!40280 m!186531))

(assert (=> d!40280 m!186557))

(assert (=> d!39490 d!40280))

(assert (=> d!39490 d!39636))

(declare-fun lt!195491 () tuple2!10414)

(declare-fun d!40282 () Bool)

(assert (=> d!40282 (= lt!195491 (readNLeastSignificantBitsLoop!0 lt!193464 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!193462))))

(assert (=> d!40282 (= (readNLeastSignificantBitsLoopPure!0 lt!193464 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!193462) (tuple2!10391 (_2!5472 lt!195491) (_1!5472 lt!195491)))))

(declare-fun bs!9698 () Bool)

(assert (= bs!9698 d!40282))

(declare-fun m!188921 () Bool)

(assert (=> bs!9698 m!188921))

(assert (=> d!39490 d!40282))

(assert (=> d!39490 d!39510))

(assert (=> d!39490 d!39658))

(assert (=> d!39670 d!39668))

(declare-fun d!40284 () Bool)

(assert (=> d!40284 (isPrefixOf!0 lt!194396 (_2!5457 lt!193209))))

(declare-fun lt!195492 () Unit!7555)

(assert (=> d!40284 (= lt!195492 (choose!30 lt!194396 (_2!5457 lt!193209) (_2!5457 lt!193209)))))

(assert (=> d!40284 (isPrefixOf!0 lt!194396 (_2!5457 lt!193209))))

(assert (=> d!40284 (= (lemmaIsPrefixTransitive!0 lt!194396 (_2!5457 lt!193209) (_2!5457 lt!193209)) lt!195492)))

(declare-fun bs!9699 () Bool)

(assert (= bs!9699 d!40284))

(assert (=> bs!9699 m!187421))

(declare-fun m!188923 () Bool)

(assert (=> bs!9699 m!188923))

(assert (=> bs!9699 m!187421))

(assert (=> d!39670 d!40284))

(declare-fun d!40286 () Bool)

(assert (=> d!40286 (isPrefixOf!0 (_2!5457 lt!193209) (_2!5457 lt!193209))))

(declare-fun lt!195493 () Unit!7555)

(assert (=> d!40286 (= lt!195493 (choose!11 (_2!5457 lt!193209)))))

(assert (=> d!40286 (= (lemmaIsPrefixRefl!0 (_2!5457 lt!193209)) lt!195493)))

(declare-fun bs!9700 () Bool)

(assert (= bs!9700 d!40286))

(assert (=> bs!9700 m!187389))

(declare-fun m!188925 () Bool)

(assert (=> bs!9700 m!188925))

(assert (=> d!39670 d!40286))

(declare-fun d!40288 () Bool)

(declare-fun res!102621 () Bool)

(declare-fun e!81143 () Bool)

(assert (=> d!40288 (=> (not res!102621) (not e!81143))))

(assert (=> d!40288 (= res!102621 (= (size!2458 (buf!2898 (_1!5459 lt!194380))) (size!2458 (buf!2898 (_2!5459 lt!194380)))))))

(assert (=> d!40288 (= (isPrefixOf!0 (_1!5459 lt!194380) (_2!5459 lt!194380)) e!81143)))

(declare-fun b!123799 () Bool)

(declare-fun res!102622 () Bool)

(assert (=> b!123799 (=> (not res!102622) (not e!81143))))

(assert (=> b!123799 (= res!102622 (bvsle (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!194380))) (currentByte!5595 (_1!5459 lt!194380)) (currentBit!5590 (_1!5459 lt!194380))) (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!194380))) (currentByte!5595 (_2!5459 lt!194380)) (currentBit!5590 (_2!5459 lt!194380)))))))

(declare-fun b!123800 () Bool)

(declare-fun e!81144 () Bool)

(assert (=> b!123800 (= e!81143 e!81144)))

(declare-fun res!102620 () Bool)

(assert (=> b!123800 (=> res!102620 e!81144)))

(assert (=> b!123800 (= res!102620 (= (size!2458 (buf!2898 (_1!5459 lt!194380))) #b00000000000000000000000000000000))))

(declare-fun b!123801 () Bool)

(assert (=> b!123801 (= e!81144 (arrayBitRangesEq!0 (buf!2898 (_1!5459 lt!194380)) (buf!2898 (_2!5459 lt!194380)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!194380))) (currentByte!5595 (_1!5459 lt!194380)) (currentBit!5590 (_1!5459 lt!194380)))))))

(assert (= (and d!40288 res!102621) b!123799))

(assert (= (and b!123799 res!102622) b!123800))

(assert (= (and b!123800 (not res!102620)) b!123801))

(assert (=> b!123799 m!188915))

(assert (=> b!123799 m!188899))

(assert (=> b!123801 m!188915))

(assert (=> b!123801 m!188915))

(declare-fun m!188927 () Bool)

(assert (=> b!123801 m!188927))

(assert (=> d!39670 d!40288))

(declare-fun d!40290 () Bool)

(declare-fun res!102624 () Bool)

(declare-fun e!81145 () Bool)

(assert (=> d!40290 (=> (not res!102624) (not e!81145))))

(assert (=> d!40290 (= res!102624 (= (size!2458 (buf!2898 (_2!5457 lt!193209))) (size!2458 (buf!2898 (_2!5457 lt!193209)))))))

(assert (=> d!40290 (= (isPrefixOf!0 (_2!5457 lt!193209) (_2!5457 lt!193209)) e!81145)))

(declare-fun b!123802 () Bool)

(declare-fun res!102625 () Bool)

(assert (=> b!123802 (=> (not res!102625) (not e!81145))))

(assert (=> b!123802 (= res!102625 (bvsle (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209)))))))

(declare-fun b!123803 () Bool)

(declare-fun e!81146 () Bool)

(assert (=> b!123803 (= e!81145 e!81146)))

(declare-fun res!102623 () Bool)

(assert (=> b!123803 (=> res!102623 e!81146)))

(assert (=> b!123803 (= res!102623 (= (size!2458 (buf!2898 (_2!5457 lt!193209))) #b00000000000000000000000000000000))))

(declare-fun b!123804 () Bool)

(assert (=> b!123804 (= e!81146 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!193209)) (buf!2898 (_2!5457 lt!193209)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209)))))))

(assert (= (and d!40290 res!102624) b!123802))

(assert (= (and b!123802 res!102625) b!123803))

(assert (= (and b!123803 (not res!102623)) b!123804))

(assert (=> b!123802 m!186503))

(assert (=> b!123802 m!186503))

(assert (=> b!123804 m!186503))

(assert (=> b!123804 m!186503))

(declare-fun m!188929 () Bool)

(assert (=> b!123804 m!188929))

(assert (=> d!39670 d!40290))

(declare-fun d!40292 () Bool)

(assert (=> d!40292 (isPrefixOf!0 lt!194396 (_2!5457 lt!193209))))

(declare-fun lt!195494 () Unit!7555)

(assert (=> d!40292 (= lt!195494 (choose!30 lt!194396 thiss!1305 (_2!5457 lt!193209)))))

(assert (=> d!40292 (isPrefixOf!0 lt!194396 thiss!1305)))

(assert (=> d!40292 (= (lemmaIsPrefixTransitive!0 lt!194396 thiss!1305 (_2!5457 lt!193209)) lt!195494)))

(declare-fun bs!9701 () Bool)

(assert (= bs!9701 d!40292))

(assert (=> bs!9701 m!187421))

(declare-fun m!188931 () Bool)

(assert (=> bs!9701 m!188931))

(declare-fun m!188933 () Bool)

(assert (=> bs!9701 m!188933))

(assert (=> d!39670 d!40292))

(declare-fun d!40294 () Bool)

(declare-fun res!102627 () Bool)

(declare-fun e!81147 () Bool)

(assert (=> d!40294 (=> (not res!102627) (not e!81147))))

(assert (=> d!40294 (= res!102627 (= (size!2458 (buf!2898 thiss!1305)) (size!2458 (buf!2898 thiss!1305))))))

(assert (=> d!40294 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!81147)))

(declare-fun b!123805 () Bool)

(declare-fun res!102628 () Bool)

(assert (=> b!123805 (=> (not res!102628) (not e!81147))))

(assert (=> b!123805 (= res!102628 (bvsle (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)) (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(declare-fun b!123806 () Bool)

(declare-fun e!81148 () Bool)

(assert (=> b!123806 (= e!81147 e!81148)))

(declare-fun res!102626 () Bool)

(assert (=> b!123806 (=> res!102626 e!81148)))

(assert (=> b!123806 (= res!102626 (= (size!2458 (buf!2898 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!123807 () Bool)

(assert (=> b!123807 (= e!81148 (arrayBitRangesEq!0 (buf!2898 thiss!1305) (buf!2898 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(assert (= (and d!40294 res!102627) b!123805))

(assert (= (and b!123805 res!102628) b!123806))

(assert (= (and b!123806 (not res!102626)) b!123807))

(assert (=> b!123805 m!186517))

(assert (=> b!123805 m!186517))

(assert (=> b!123807 m!186517))

(assert (=> b!123807 m!186517))

(declare-fun m!188935 () Bool)

(assert (=> b!123807 m!188935))

(assert (=> d!39670 d!40294))

(declare-fun d!40296 () Bool)

(declare-fun res!102630 () Bool)

(declare-fun e!81149 () Bool)

(assert (=> d!40296 (=> (not res!102630) (not e!81149))))

(assert (=> d!40296 (= res!102630 (= (size!2458 (buf!2898 lt!194396)) (size!2458 (buf!2898 (_2!5457 lt!193209)))))))

(assert (=> d!40296 (= (isPrefixOf!0 lt!194396 (_2!5457 lt!193209)) e!81149)))

(declare-fun b!123808 () Bool)

(declare-fun res!102631 () Bool)

(assert (=> b!123808 (=> (not res!102631) (not e!81149))))

(assert (=> b!123808 (= res!102631 (bvsle (bitIndex!0 (size!2458 (buf!2898 lt!194396)) (currentByte!5595 lt!194396) (currentBit!5590 lt!194396)) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209)))))))

(declare-fun b!123809 () Bool)

(declare-fun e!81150 () Bool)

(assert (=> b!123809 (= e!81149 e!81150)))

(declare-fun res!102629 () Bool)

(assert (=> b!123809 (=> res!102629 e!81150)))

(assert (=> b!123809 (= res!102629 (= (size!2458 (buf!2898 lt!194396)) #b00000000000000000000000000000000))))

(declare-fun b!123810 () Bool)

(assert (=> b!123810 (= e!81150 (arrayBitRangesEq!0 (buf!2898 lt!194396) (buf!2898 (_2!5457 lt!193209)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 lt!194396)) (currentByte!5595 lt!194396) (currentBit!5590 lt!194396))))))

(assert (= (and d!40296 res!102630) b!123808))

(assert (= (and b!123808 res!102631) b!123809))

(assert (= (and b!123809 (not res!102629)) b!123810))

(declare-fun m!188937 () Bool)

(assert (=> b!123808 m!188937))

(assert (=> b!123808 m!186503))

(assert (=> b!123810 m!188937))

(assert (=> b!123810 m!188937))

(declare-fun m!188939 () Bool)

(assert (=> b!123810 m!188939))

(assert (=> d!39670 d!40296))

(declare-fun d!40298 () Bool)

(assert (=> d!40298 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!195495 () Unit!7555)

(assert (=> d!40298 (= lt!195495 (choose!11 thiss!1305))))

(assert (=> d!40298 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!195495)))

(declare-fun bs!9702 () Bool)

(assert (= bs!9702 d!40298))

(assert (=> bs!9702 m!187433))

(declare-fun m!188941 () Bool)

(assert (=> bs!9702 m!188941))

(assert (=> d!39670 d!40298))

(declare-fun d!40300 () Bool)

(assert (=> d!40300 (isPrefixOf!0 lt!194396 lt!194396)))

(declare-fun lt!195496 () Unit!7555)

(assert (=> d!40300 (= lt!195496 (choose!11 lt!194396))))

(assert (=> d!40300 (= (lemmaIsPrefixRefl!0 lt!194396) lt!195496)))

(declare-fun bs!9703 () Bool)

(assert (= bs!9703 d!40300))

(assert (=> bs!9703 m!187423))

(declare-fun m!188943 () Bool)

(assert (=> bs!9703 m!188943))

(assert (=> d!39670 d!40300))

(declare-fun d!40302 () Bool)

(declare-fun res!102633 () Bool)

(declare-fun e!81151 () Bool)

(assert (=> d!40302 (=> (not res!102633) (not e!81151))))

(assert (=> d!40302 (= res!102633 (= (size!2458 (buf!2898 lt!194396)) (size!2458 (buf!2898 lt!194396))))))

(assert (=> d!40302 (= (isPrefixOf!0 lt!194396 lt!194396) e!81151)))

(declare-fun b!123811 () Bool)

(declare-fun res!102634 () Bool)

(assert (=> b!123811 (=> (not res!102634) (not e!81151))))

(assert (=> b!123811 (= res!102634 (bvsle (bitIndex!0 (size!2458 (buf!2898 lt!194396)) (currentByte!5595 lt!194396) (currentBit!5590 lt!194396)) (bitIndex!0 (size!2458 (buf!2898 lt!194396)) (currentByte!5595 lt!194396) (currentBit!5590 lt!194396))))))

(declare-fun b!123812 () Bool)

(declare-fun e!81152 () Bool)

(assert (=> b!123812 (= e!81151 e!81152)))

(declare-fun res!102632 () Bool)

(assert (=> b!123812 (=> res!102632 e!81152)))

(assert (=> b!123812 (= res!102632 (= (size!2458 (buf!2898 lt!194396)) #b00000000000000000000000000000000))))

(declare-fun b!123813 () Bool)

(assert (=> b!123813 (= e!81152 (arrayBitRangesEq!0 (buf!2898 lt!194396) (buf!2898 lt!194396) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 lt!194396)) (currentByte!5595 lt!194396) (currentBit!5590 lt!194396))))))

(assert (= (and d!40302 res!102633) b!123811))

(assert (= (and b!123811 res!102634) b!123812))

(assert (= (and b!123812 (not res!102632)) b!123813))

(assert (=> b!123811 m!188937))

(assert (=> b!123811 m!188937))

(assert (=> b!123813 m!188937))

(assert (=> b!123813 m!188937))

(declare-fun m!188945 () Bool)

(assert (=> b!123813 m!188945))

(assert (=> d!39670 d!40302))

(declare-fun b!123814 () Bool)

(declare-fun e!81153 () Bool)

(declare-fun lt!195501 () tuple2!10414)

(declare-fun lt!195499 () (_ BitVec 64))

(assert (=> b!123814 (= e!81153 (= (= (bvand (bvlshr (_1!5472 lt!195501) lt!195499) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!5458 (readBitPure!0 (_1!5459 lt!193224)))))))

(assert (=> b!123814 (and (bvsge lt!195499 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195499 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!195497 () (_ BitVec 32))

(assert (=> b!123814 (= lt!195499 ((_ sign_extend 32) (bvsub lt!195497 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123814 (or (= (bvand lt!195497 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!195497 #b10000000000000000000000000000000) (bvand (bvsub lt!195497 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123814 (= lt!195497 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!123814 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!123815 () Bool)

(declare-fun e!81154 () tuple2!10414)

(assert (=> b!123815 (= e!81154 (tuple2!10415 lt!193230 (_1!5459 lt!193224)))))

(declare-fun b!123816 () Bool)

(declare-fun res!102637 () Bool)

(declare-fun e!81155 () Bool)

(assert (=> b!123816 (=> (not res!102637) (not e!81155))))

(assert (=> b!123816 (= res!102637 (= (bvand (_1!5472 lt!195501) (onesLSBLong!0 nBits!396)) (_1!5472 lt!195501)))))

(declare-fun d!40304 () Bool)

(assert (=> d!40304 e!81155))

(declare-fun res!102636 () Bool)

(assert (=> d!40304 (=> (not res!102636) (not e!81155))))

(assert (=> d!40304 (= res!102636 (= (buf!2898 (_2!5472 lt!195501)) (buf!2898 (_1!5459 lt!193224))))))

(assert (=> d!40304 (= lt!195501 e!81154)))

(declare-fun c!7412 () Bool)

(assert (=> d!40304 (= c!7412 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!40304 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!40304 (= (readNLeastSignificantBitsLoop!0 (_1!5459 lt!193224) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193230) lt!195501)))

(declare-fun b!123817 () Bool)

(declare-fun res!102638 () Bool)

(assert (=> b!123817 (=> (not res!102638) (not e!81155))))

(declare-fun lt!195505 () (_ BitVec 64))

(declare-fun lt!195500 () (_ BitVec 64))

(assert (=> b!123817 (= res!102638 (= (bvlshr (_1!5472 lt!195501) lt!195505) (bvlshr lt!193230 lt!195500)))))

(assert (=> b!123817 (and (bvsge lt!195500 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195500 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123817 (= lt!195500 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123817 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123817 (and (bvsge lt!195505 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195505 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123817 (= lt!195505 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123817 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!123818 () Bool)

(assert (=> b!123818 (= e!81155 e!81153)))

(declare-fun res!102635 () Bool)

(assert (=> b!123818 (=> res!102635 e!81153)))

(assert (=> b!123818 (= res!102635 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!123819 () Bool)

(declare-fun res!102639 () Bool)

(assert (=> b!123819 (=> (not res!102639) (not e!81155))))

(declare-fun lt!195504 () (_ BitVec 64))

(declare-fun lt!195502 () (_ BitVec 64))

(assert (=> b!123819 (= res!102639 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5472 lt!195501))) (currentByte!5595 (_2!5472 lt!195501)) (currentBit!5590 (_2!5472 lt!195501))) (bvadd lt!195504 lt!195502)))))

(assert (=> b!123819 (or (not (= (bvand lt!195504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195502 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195504 lt!195502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123819 (= lt!195502 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123819 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123819 (= lt!195504 (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!193224))) (currentByte!5595 (_1!5459 lt!193224)) (currentBit!5590 (_1!5459 lt!193224))))))

(declare-fun b!123820 () Bool)

(declare-fun lt!195503 () tuple2!10414)

(assert (=> b!123820 (= e!81154 (tuple2!10415 (_1!5472 lt!195503) (_2!5472 lt!195503)))))

(declare-fun lt!195498 () tuple2!10416)

(assert (=> b!123820 (= lt!195498 (readBit!0 (_1!5459 lt!193224)))))

(assert (=> b!123820 (= lt!195503 (readNLeastSignificantBitsLoop!0 (_2!5473 lt!195498) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193230 (ite (_1!5473 lt!195498) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!40304 c!7412) b!123815))

(assert (= (and d!40304 (not c!7412)) b!123820))

(assert (= (and d!40304 res!102636) b!123819))

(assert (= (and b!123819 res!102639) b!123817))

(assert (= (and b!123817 res!102638) b!123816))

(assert (= (and b!123816 res!102637) b!123818))

(assert (= (and b!123818 (not res!102635)) b!123814))

(declare-fun m!188947 () Bool)

(assert (=> b!123814 m!188947))

(assert (=> b!123816 m!186499))

(declare-fun m!188949 () Bool)

(assert (=> b!123819 m!188949))

(declare-fun m!188951 () Bool)

(assert (=> b!123819 m!188951))

(declare-fun m!188953 () Bool)

(assert (=> b!123820 m!188953))

(declare-fun m!188955 () Bool)

(assert (=> b!123820 m!188955))

(assert (=> d!39666 d!40304))

(declare-fun d!40306 () Bool)

(assert (=> d!40306 (= (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 thiss!1305))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2458 (buf!2898 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 thiss!1305)))))))

(assert (=> d!39530 d!40306))

(declare-fun d!40308 () Bool)

(declare-fun res!102641 () Bool)

(declare-fun e!81156 () Bool)

(assert (=> d!40308 (=> (not res!102641) (not e!81156))))

(assert (=> d!40308 (= res!102641 (= (size!2458 (buf!2898 (_2!5457 lt!193212))) (size!2458 (buf!2898 (_2!5457 lt!194127)))))))

(assert (=> d!40308 (= (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!194127)) e!81156)))

(declare-fun b!123821 () Bool)

(declare-fun res!102642 () Bool)

(assert (=> b!123821 (=> (not res!102642) (not e!81156))))

(assert (=> b!123821 (= res!102642 (bvsle (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194127))) (currentByte!5595 (_2!5457 lt!194127)) (currentBit!5590 (_2!5457 lt!194127)))))))

(declare-fun b!123822 () Bool)

(declare-fun e!81157 () Bool)

(assert (=> b!123822 (= e!81156 e!81157)))

(declare-fun res!102640 () Bool)

(assert (=> b!123822 (=> res!102640 e!81157)))

(assert (=> b!123822 (= res!102640 (= (size!2458 (buf!2898 (_2!5457 lt!193212))) #b00000000000000000000000000000000))))

(declare-fun b!123823 () Bool)

(assert (=> b!123823 (= e!81157 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!193212)) (buf!2898 (_2!5457 lt!194127)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212)))))))

(assert (= (and d!40308 res!102641) b!123821))

(assert (= (and b!123821 res!102642) b!123822))

(assert (= (and b!123822 (not res!102640)) b!123823))

(assert (=> b!123821 m!186513))

(assert (=> b!123821 m!187227))

(assert (=> b!123823 m!186513))

(assert (=> b!123823 m!186513))

(declare-fun m!188957 () Bool)

(assert (=> b!123823 m!188957))

(assert (=> b!123072 d!40308))

(assert (=> d!39518 d!40306))

(declare-fun d!40310 () Bool)

(assert (=> d!40310 (= (invariant!0 (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305) (size!2458 (buf!2898 thiss!1305))) (and (bvsge (currentBit!5590 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5590 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5595 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5595 thiss!1305) (size!2458 (buf!2898 thiss!1305))) (and (= (currentBit!5590 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5595 thiss!1305) (size!2458 (buf!2898 thiss!1305)))))))))

(assert (=> d!39518 d!40310))

(declare-fun d!40312 () Bool)

(declare-fun lt!195506 () tuple2!10416)

(assert (=> d!40312 (= lt!195506 (readBit!0 (readerFrom!0 (_2!5457 lt!194093) (currentBit!5590 (_2!5457 lt!193212)) (currentByte!5595 (_2!5457 lt!193212)))))))

(assert (=> d!40312 (= (readBitPure!0 (readerFrom!0 (_2!5457 lt!194093) (currentBit!5590 (_2!5457 lt!193212)) (currentByte!5595 (_2!5457 lt!193212)))) (tuple2!10387 (_2!5473 lt!195506) (_1!5473 lt!195506)))))

(declare-fun bs!9704 () Bool)

(assert (= bs!9704 d!40312))

(assert (=> bs!9704 m!187229))

(declare-fun m!188959 () Bool)

(assert (=> bs!9704 m!188959))

(assert (=> b!123074 d!40312))

(declare-fun d!40314 () Bool)

(declare-fun e!81158 () Bool)

(assert (=> d!40314 e!81158))

(declare-fun res!102643 () Bool)

(assert (=> d!40314 (=> (not res!102643) (not e!81158))))

(assert (=> d!40314 (= res!102643 (invariant!0 (currentBit!5590 (_2!5457 lt!194093)) (currentByte!5595 (_2!5457 lt!194093)) (size!2458 (buf!2898 (_2!5457 lt!194093)))))))

(assert (=> d!40314 (= (readerFrom!0 (_2!5457 lt!194093) (currentBit!5590 (_2!5457 lt!193212)) (currentByte!5595 (_2!5457 lt!193212))) (BitStream!4391 (buf!2898 (_2!5457 lt!194093)) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(declare-fun b!123824 () Bool)

(assert (=> b!123824 (= e!81158 (invariant!0 (currentBit!5590 (_2!5457 lt!193212)) (currentByte!5595 (_2!5457 lt!193212)) (size!2458 (buf!2898 (_2!5457 lt!194093)))))))

(assert (= (and d!40314 res!102643) b!123824))

(assert (=> d!40314 m!188665))

(declare-fun m!188961 () Bool)

(assert (=> b!123824 m!188961))

(assert (=> b!123074 d!40314))

(declare-fun b!123825 () Bool)

(declare-fun lt!195511 () tuple2!10414)

(declare-fun e!81159 () Bool)

(declare-fun lt!195509 () (_ BitVec 64))

(assert (=> b!123825 (= e!81159 (= (= (bvand (bvlshr (_1!5472 lt!195511) lt!195509) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!5458 (readBitPure!0 lt!193236))))))

(assert (=> b!123825 (and (bvsge lt!195509 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195509 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!195507 () (_ BitVec 32))

(assert (=> b!123825 (= lt!195509 ((_ sign_extend 32) (bvsub lt!195507 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123825 (or (= (bvand lt!195507 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand lt!195507 #b10000000000000000000000000000000) (bvand (bvsub lt!195507 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123825 (= lt!195507 (bvsub nBits!396 #b00000000000000000000000000000001))))

(assert (=> b!123825 (or (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!123826 () Bool)

(declare-fun e!81160 () tuple2!10414)

(assert (=> b!123826 (= e!81160 (tuple2!10415 lt!193230 lt!193236))))

(declare-fun b!123827 () Bool)

(declare-fun res!102646 () Bool)

(declare-fun e!81161 () Bool)

(assert (=> b!123827 (=> (not res!102646) (not e!81161))))

(assert (=> b!123827 (= res!102646 (= (bvand (_1!5472 lt!195511) (onesLSBLong!0 nBits!396)) (_1!5472 lt!195511)))))

(declare-fun d!40316 () Bool)

(assert (=> d!40316 e!81161))

(declare-fun res!102645 () Bool)

(assert (=> d!40316 (=> (not res!102645) (not e!81161))))

(assert (=> d!40316 (= res!102645 (= (buf!2898 (_2!5472 lt!195511)) (buf!2898 lt!193236)))))

(assert (=> d!40316 (= lt!195511 e!81160)))

(declare-fun c!7413 () Bool)

(assert (=> d!40316 (= c!7413 (= nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> d!40316 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!40316 (= (readNLeastSignificantBitsLoop!0 lt!193236 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!193230) lt!195511)))

(declare-fun b!123828 () Bool)

(declare-fun res!102647 () Bool)

(assert (=> b!123828 (=> (not res!102647) (not e!81161))))

(declare-fun lt!195515 () (_ BitVec 64))

(declare-fun lt!195510 () (_ BitVec 64))

(assert (=> b!123828 (= res!102647 (= (bvlshr (_1!5472 lt!195511) lt!195515) (bvlshr lt!193230 lt!195510)))))

(assert (=> b!123828 (and (bvsge lt!195510 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195510 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123828 (= lt!195510 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123828 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123828 (and (bvsge lt!195515 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!195515 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!123828 (= lt!195515 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123828 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun b!123829 () Bool)

(assert (=> b!123829 (= e!81161 e!81159)))

(declare-fun res!102644 () Bool)

(assert (=> b!123829 (=> res!102644 e!81159)))

(assert (=> b!123829 (= res!102644 (bvsge (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(declare-fun b!123830 () Bool)

(declare-fun res!102648 () Bool)

(assert (=> b!123830 (=> (not res!102648) (not e!81161))))

(declare-fun lt!195514 () (_ BitVec 64))

(declare-fun lt!195512 () (_ BitVec 64))

(assert (=> b!123830 (= res!102648 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5472 lt!195511))) (currentByte!5595 (_2!5472 lt!195511)) (currentBit!5590 (_2!5472 lt!195511))) (bvadd lt!195514 lt!195512)))))

(assert (=> b!123830 (or (not (= (bvand lt!195514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195512 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195514 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195514 lt!195512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123830 (= lt!195512 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!123830 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!123830 (= lt!195514 (bitIndex!0 (size!2458 (buf!2898 lt!193236)) (currentByte!5595 lt!193236) (currentBit!5590 lt!193236)))))

(declare-fun b!123831 () Bool)

(declare-fun lt!195513 () tuple2!10414)

(assert (=> b!123831 (= e!81160 (tuple2!10415 (_1!5472 lt!195513) (_2!5472 lt!195513)))))

(declare-fun lt!195508 () tuple2!10416)

(assert (=> b!123831 (= lt!195508 (readBit!0 lt!193236))))

(assert (=> b!123831 (= lt!195513 (readNLeastSignificantBitsLoop!0 (_2!5473 lt!195508) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!193230 (ite (_1!5473 lt!195508) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!40316 c!7413) b!123826))

(assert (= (and d!40316 (not c!7413)) b!123831))

(assert (= (and d!40316 res!102645) b!123830))

(assert (= (and b!123830 res!102648) b!123828))

(assert (= (and b!123828 res!102647) b!123827))

(assert (= (and b!123827 res!102646) b!123829))

(assert (= (and b!123829 (not res!102644)) b!123825))

(declare-fun m!188963 () Bool)

(assert (=> b!123825 m!188963))

(assert (=> b!123827 m!186499))

(declare-fun m!188965 () Bool)

(assert (=> b!123830 m!188965))

(declare-fun m!188967 () Bool)

(assert (=> b!123830 m!188967))

(declare-fun m!188969 () Bool)

(assert (=> b!123831 m!188969))

(declare-fun m!188971 () Bool)

(assert (=> b!123831 m!188971))

(assert (=> d!39500 d!40316))

(declare-fun d!40318 () Bool)

(declare-fun lt!195516 () tuple2!10416)

(assert (=> d!40318 (= lt!195516 (readBit!0 (readerFrom!0 (_2!5457 lt!194235) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))))

(assert (=> d!40318 (= (readBitPure!0 (readerFrom!0 (_2!5457 lt!194235) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))) (tuple2!10387 (_2!5473 lt!195516) (_1!5473 lt!195516)))))

(declare-fun bs!9705 () Bool)

(assert (= bs!9705 d!40318))

(assert (=> bs!9705 m!187261))

(declare-fun m!188973 () Bool)

(assert (=> bs!9705 m!188973))

(assert (=> b!123107 d!40318))

(declare-fun d!40320 () Bool)

(declare-fun e!81162 () Bool)

(assert (=> d!40320 e!81162))

(declare-fun res!102649 () Bool)

(assert (=> d!40320 (=> (not res!102649) (not e!81162))))

(assert (=> d!40320 (= res!102649 (invariant!0 (currentBit!5590 (_2!5457 lt!194235)) (currentByte!5595 (_2!5457 lt!194235)) (size!2458 (buf!2898 (_2!5457 lt!194235)))))))

(assert (=> d!40320 (= (readerFrom!0 (_2!5457 lt!194235) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305)) (BitStream!4391 (buf!2898 (_2!5457 lt!194235)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))

(declare-fun b!123832 () Bool)

(assert (=> b!123832 (= e!81162 (invariant!0 (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305) (size!2458 (buf!2898 (_2!5457 lt!194235)))))))

(assert (= (and d!40320 res!102649) b!123832))

(assert (=> d!40320 m!188605))

(declare-fun m!188975 () Bool)

(assert (=> b!123832 m!188975))

(assert (=> b!123107 d!40320))

(declare-fun d!40322 () Bool)

(assert (=> d!40322 (= (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193209))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193209)))) (bvsub (bvmul ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193209))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193209))))))))

(assert (=> d!39492 d!40322))

(declare-fun d!40324 () Bool)

(assert (=> d!40324 (= (invariant!0 (currentBit!5590 (_2!5457 lt!193209)) (currentByte!5595 (_2!5457 lt!193209)) (size!2458 (buf!2898 (_2!5457 lt!193209)))) (and (bvsge (currentBit!5590 (_2!5457 lt!193209)) #b00000000000000000000000000000000) (bvslt (currentBit!5590 (_2!5457 lt!193209)) #b00000000000000000000000000001000) (bvsge (currentByte!5595 (_2!5457 lt!193209)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5595 (_2!5457 lt!193209)) (size!2458 (buf!2898 (_2!5457 lt!193209)))) (and (= (currentBit!5590 (_2!5457 lt!193209)) #b00000000000000000000000000000000) (= (currentByte!5595 (_2!5457 lt!193209)) (size!2458 (buf!2898 (_2!5457 lt!193209))))))))))

(assert (=> d!39492 d!40324))

(declare-fun b!123833 () Bool)

(declare-fun e!81163 () Unit!7555)

(declare-fun Unit!7647 () Unit!7555)

(assert (=> b!123833 (= e!81163 Unit!7647)))

(declare-fun lt!195530 () (_ BitVec 64))

(declare-fun b!123834 () Bool)

(declare-fun lt!195519 () tuple2!10388)

(declare-fun e!81164 () Bool)

(declare-fun lt!195536 () (_ BitVec 64))

(assert (=> b!123834 (= e!81164 (= (_1!5459 lt!195519) (withMovedBitIndex!0 (_2!5459 lt!195519) (bvsub lt!195530 lt!195536))))))

(assert (=> b!123834 (or (= (bvand lt!195530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195536 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195530 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195530 lt!195536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123834 (= lt!195536 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!194127))) (currentByte!5595 (_2!5457 lt!194127)) (currentBit!5590 (_2!5457 lt!194127))))))

(assert (=> b!123834 (= lt!195530 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(declare-fun d!40326 () Bool)

(assert (=> d!40326 e!81164))

(declare-fun res!102651 () Bool)

(assert (=> d!40326 (=> (not res!102651) (not e!81164))))

(assert (=> d!40326 (= res!102651 (isPrefixOf!0 (_1!5459 lt!195519) (_2!5459 lt!195519)))))

(declare-fun lt!195535 () BitStream!4390)

(assert (=> d!40326 (= lt!195519 (tuple2!10389 lt!195535 (_2!5457 lt!194127)))))

(declare-fun lt!195518 () Unit!7555)

(declare-fun lt!195527 () Unit!7555)

(assert (=> d!40326 (= lt!195518 lt!195527)))

(assert (=> d!40326 (isPrefixOf!0 lt!195535 (_2!5457 lt!194127))))

(assert (=> d!40326 (= lt!195527 (lemmaIsPrefixTransitive!0 lt!195535 (_2!5457 lt!194127) (_2!5457 lt!194127)))))

(declare-fun lt!195523 () Unit!7555)

(declare-fun lt!195521 () Unit!7555)

(assert (=> d!40326 (= lt!195523 lt!195521)))

(assert (=> d!40326 (isPrefixOf!0 lt!195535 (_2!5457 lt!194127))))

(assert (=> d!40326 (= lt!195521 (lemmaIsPrefixTransitive!0 lt!195535 (_2!5457 lt!193212) (_2!5457 lt!194127)))))

(declare-fun lt!195531 () Unit!7555)

(assert (=> d!40326 (= lt!195531 e!81163)))

(declare-fun c!7414 () Bool)

(assert (=> d!40326 (= c!7414 (not (= (size!2458 (buf!2898 (_2!5457 lt!193212))) #b00000000000000000000000000000000)))))

(declare-fun lt!195525 () Unit!7555)

(declare-fun lt!195532 () Unit!7555)

(assert (=> d!40326 (= lt!195525 lt!195532)))

(assert (=> d!40326 (isPrefixOf!0 (_2!5457 lt!194127) (_2!5457 lt!194127))))

(assert (=> d!40326 (= lt!195532 (lemmaIsPrefixRefl!0 (_2!5457 lt!194127)))))

(declare-fun lt!195534 () Unit!7555)

(declare-fun lt!195528 () Unit!7555)

(assert (=> d!40326 (= lt!195534 lt!195528)))

(assert (=> d!40326 (= lt!195528 (lemmaIsPrefixRefl!0 (_2!5457 lt!194127)))))

(declare-fun lt!195520 () Unit!7555)

(declare-fun lt!195533 () Unit!7555)

(assert (=> d!40326 (= lt!195520 lt!195533)))

(assert (=> d!40326 (isPrefixOf!0 lt!195535 lt!195535)))

(assert (=> d!40326 (= lt!195533 (lemmaIsPrefixRefl!0 lt!195535))))

(declare-fun lt!195529 () Unit!7555)

(declare-fun lt!195522 () Unit!7555)

(assert (=> d!40326 (= lt!195529 lt!195522)))

(assert (=> d!40326 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!193212))))

(assert (=> d!40326 (= lt!195522 (lemmaIsPrefixRefl!0 (_2!5457 lt!193212)))))

(assert (=> d!40326 (= lt!195535 (BitStream!4391 (buf!2898 (_2!5457 lt!194127)) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(assert (=> d!40326 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!194127))))

(assert (=> d!40326 (= (reader!0 (_2!5457 lt!193212) (_2!5457 lt!194127)) lt!195519)))

(declare-fun b!123835 () Bool)

(declare-fun res!102652 () Bool)

(assert (=> b!123835 (=> (not res!102652) (not e!81164))))

(assert (=> b!123835 (= res!102652 (isPrefixOf!0 (_2!5459 lt!195519) (_2!5457 lt!194127)))))

(declare-fun b!123836 () Bool)

(declare-fun lt!195517 () Unit!7555)

(assert (=> b!123836 (= e!81163 lt!195517)))

(declare-fun lt!195526 () (_ BitVec 64))

(assert (=> b!123836 (= lt!195526 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!195524 () (_ BitVec 64))

(assert (=> b!123836 (= lt!195524 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))))))

(assert (=> b!123836 (= lt!195517 (arrayBitRangesEqSymmetric!0 (buf!2898 (_2!5457 lt!193212)) (buf!2898 (_2!5457 lt!194127)) lt!195526 lt!195524))))

(assert (=> b!123836 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!194127)) (buf!2898 (_2!5457 lt!193212)) lt!195526 lt!195524)))

(declare-fun b!123837 () Bool)

(declare-fun res!102650 () Bool)

(assert (=> b!123837 (=> (not res!102650) (not e!81164))))

(assert (=> b!123837 (= res!102650 (isPrefixOf!0 (_1!5459 lt!195519) (_2!5457 lt!193212)))))

(assert (= (and d!40326 c!7414) b!123836))

(assert (= (and d!40326 (not c!7414)) b!123833))

(assert (= (and d!40326 res!102651) b!123837))

(assert (= (and b!123837 res!102650) b!123835))

(assert (= (and b!123835 res!102652) b!123834))

(declare-fun m!188977 () Bool)

(assert (=> b!123835 m!188977))

(declare-fun m!188979 () Bool)

(assert (=> b!123837 m!188979))

(assert (=> b!123836 m!186513))

(declare-fun m!188981 () Bool)

(assert (=> b!123836 m!188981))

(declare-fun m!188983 () Bool)

(assert (=> b!123836 m!188983))

(declare-fun m!188985 () Bool)

(assert (=> b!123834 m!188985))

(assert (=> b!123834 m!187227))

(assert (=> b!123834 m!186513))

(declare-fun m!188987 () Bool)

(assert (=> d!40326 m!188987))

(declare-fun m!188989 () Bool)

(assert (=> d!40326 m!188989))

(declare-fun m!188991 () Bool)

(assert (=> d!40326 m!188991))

(declare-fun m!188993 () Bool)

(assert (=> d!40326 m!188993))

(declare-fun m!188995 () Bool)

(assert (=> d!40326 m!188995))

(assert (=> d!40326 m!187381))

(declare-fun m!188997 () Bool)

(assert (=> d!40326 m!188997))

(declare-fun m!188999 () Bool)

(assert (=> d!40326 m!188999))

(assert (=> d!40326 m!187387))

(declare-fun m!189001 () Bool)

(assert (=> d!40326 m!189001))

(assert (=> d!40326 m!187233))

(assert (=> b!123069 d!40326))

(declare-fun d!40328 () Bool)

(assert (=> d!40328 (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194127)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!194134)))

(declare-fun lt!195537 () Unit!7555)

(assert (=> d!40328 (= lt!195537 (choose!9 (_2!5457 lt!193212) (buf!2898 (_2!5457 lt!194127)) lt!194134 (BitStream!4391 (buf!2898 (_2!5457 lt!194127)) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212)))))))

(assert (=> d!40328 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5457 lt!193212) (buf!2898 (_2!5457 lt!194127)) lt!194134) lt!195537)))

(declare-fun bs!9706 () Bool)

(assert (= bs!9706 d!40328))

(assert (=> bs!9706 m!187167))

(declare-fun m!189003 () Bool)

(assert (=> bs!9706 m!189003))

(assert (=> b!123069 d!40328))

(declare-fun lt!195538 () tuple2!10414)

(declare-fun d!40330 () Bool)

(assert (=> d!40330 (= lt!195538 (readNLeastSignificantBitsLoop!0 (_1!5459 lt!194105) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194110))))

(assert (=> d!40330 (= (readNLeastSignificantBitsLoopPure!0 (_1!5459 lt!194105) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!194110) (tuple2!10391 (_2!5472 lt!195538) (_1!5472 lt!195538)))))

(declare-fun bs!9707 () Bool)

(assert (= bs!9707 d!40330))

(declare-fun m!189005 () Bool)

(assert (=> bs!9707 m!189005))

(assert (=> b!123069 d!40330))

(declare-fun d!40332 () Bool)

(assert (=> d!40332 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194127)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!194134) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!194127)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212)))) lt!194134))))

(declare-fun bs!9708 () Bool)

(assert (= bs!9708 d!40332))

(declare-fun m!189007 () Bool)

(assert (=> bs!9708 m!189007))

(assert (=> b!123069 d!40332))

(assert (=> b!123069 d!40256))

(assert (=> b!123105 d!40178))

(assert (=> b!123105 d!39518))

(declare-fun d!40334 () Bool)

(declare-fun e!81165 () Bool)

(assert (=> d!40334 e!81165))

(declare-fun res!102653 () Bool)

(assert (=> d!40334 (=> (not res!102653) (not e!81165))))

(assert (=> d!40334 (= res!102653 (= (buf!2898 (_2!5457 (increaseBitIndex!0 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))) (buf!2898 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))))

(declare-fun lt!195542 () Bool)

(assert (=> d!40334 (= lt!195542 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))) (currentByte!5595 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195539 () tuple2!10416)

(assert (=> d!40334 (= lt!195539 (tuple2!10417 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))) (currentByte!5595 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))) #b00000000000000000000000000000000)) (_2!5457 (increaseBitIndex!0 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))))

(assert (=> d!40334 (validate_offset_bit!0 ((_ sign_extend 32) (size!2458 (buf!2898 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))) ((_ sign_extend 32) (currentByte!5595 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))) ((_ sign_extend 32) (currentBit!5590 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))))

(assert (=> d!40334 (= (readBit!0 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))) lt!195539)))

(declare-fun b!123838 () Bool)

(declare-fun lt!195544 () (_ BitVec 64))

(declare-fun lt!195541 () (_ BitVec 64))

(assert (=> b!123838 (= e!81165 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 (increaseBitIndex!0 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))) (currentByte!5595 (_2!5457 (increaseBitIndex!0 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))) (currentBit!5590 (_2!5457 (increaseBitIndex!0 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))) (bvadd lt!195544 lt!195541)))))

(assert (=> b!123838 (or (not (= (bvand lt!195544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195541 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195544 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195544 lt!195541) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123838 (= lt!195541 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123838 (= lt!195544 (bitIndex!0 (size!2458 (buf!2898 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))) (currentByte!5595 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))) (currentBit!5590 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))))

(declare-fun lt!195545 () Bool)

(assert (=> b!123838 (= lt!195545 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))) (currentByte!5595 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195540 () Bool)

(assert (=> b!123838 (= lt!195540 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))) (currentByte!5595 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195543 () Bool)

(assert (=> b!123838 (= lt!195543 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))) (currentByte!5595 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!40334 res!102653) b!123838))

(declare-fun m!189009 () Bool)

(assert (=> d!40334 m!189009))

(declare-fun m!189011 () Bool)

(assert (=> d!40334 m!189011))

(declare-fun m!189013 () Bool)

(assert (=> d!40334 m!189013))

(declare-fun m!189015 () Bool)

(assert (=> d!40334 m!189015))

(assert (=> b!123838 m!189013))

(assert (=> b!123838 m!189009))

(declare-fun m!189017 () Bool)

(assert (=> b!123838 m!189017))

(assert (=> b!123838 m!189011))

(declare-fun m!189019 () Bool)

(assert (=> b!123838 m!189019))

(assert (=> d!39538 d!40334))

(declare-fun d!40336 () Bool)

(assert (=> d!40336 (= (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193228)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193228))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193228)))) (bvsub (bvmul ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!193228)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!193228))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!193228))))))))

(assert (=> d!39660 d!40336))

(declare-fun d!40338 () Bool)

(assert (=> d!40338 (= (invariant!0 (currentBit!5590 (_1!5458 lt!193228)) (currentByte!5595 (_1!5458 lt!193228)) (size!2458 (buf!2898 (_1!5458 lt!193228)))) (and (bvsge (currentBit!5590 (_1!5458 lt!193228)) #b00000000000000000000000000000000) (bvslt (currentBit!5590 (_1!5458 lt!193228)) #b00000000000000000000000000001000) (bvsge (currentByte!5595 (_1!5458 lt!193228)) #b00000000000000000000000000000000) (or (bvslt (currentByte!5595 (_1!5458 lt!193228)) (size!2458 (buf!2898 (_1!5458 lt!193228)))) (and (= (currentBit!5590 (_1!5458 lt!193228)) #b00000000000000000000000000000000) (= (currentByte!5595 (_1!5458 lt!193228)) (size!2458 (buf!2898 (_1!5458 lt!193228))))))))))

(assert (=> d!39660 d!40338))

(declare-fun b!123850 () Bool)

(declare-fun e!81174 () Bool)

(declare-fun _$19!123 () tuple2!10384)

(assert (=> b!123850 (= e!81174 (array_inv!2260 (buf!2898 (_2!5457 _$19!123))))))

(declare-fun b!123851 () Bool)

(declare-fun e!81175 () Bool)

(declare-fun lt!195548 () tuple2!10386)

(assert (=> b!123851 (= e!81175 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!195548))) (currentByte!5595 (_1!5458 lt!195548)) (currentBit!5590 (_1!5458 lt!195548))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 _$19!123))) (currentByte!5595 (_2!5457 _$19!123)) (currentBit!5590 (_2!5457 _$19!123)))))))

(declare-fun b!123852 () Bool)

(declare-fun res!102662 () Bool)

(declare-fun e!81176 () Bool)

(assert (=> b!123852 (=> (not res!102662) (not e!81176))))

(assert (=> b!123852 (= res!102662 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 _$19!123))) (currentByte!5595 (_2!5457 _$19!123)) (currentBit!5590 (_2!5457 _$19!123))) (bvadd (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!123853 () Bool)

(assert (=> b!123853 (= e!81176 e!81175)))

(declare-fun res!102665 () Bool)

(assert (=> b!123853 (=> (not res!102665) (not e!81175))))

(assert (=> b!123853 (= res!102665 (and (= (_2!5458 lt!195548) lt!193222) (= (_1!5458 lt!195548) (_2!5457 _$19!123))))))

(assert (=> b!123853 (= lt!195548 (readBitPure!0 (readerFrom!0 (_2!5457 _$19!123) (currentBit!5590 thiss!1305) (currentByte!5595 thiss!1305))))))

(declare-fun b!123854 () Bool)

(declare-fun res!102664 () Bool)

(assert (=> b!123854 (=> (not res!102664) (not e!81176))))

(assert (=> b!123854 (= res!102664 (isPrefixOf!0 thiss!1305 (_2!5457 _$19!123)))))

(declare-fun d!40340 () Bool)

(assert (=> d!40340 e!81176))

(declare-fun res!102663 () Bool)

(assert (=> d!40340 (=> (not res!102663) (not e!81176))))

(assert (=> d!40340 (= res!102663 (= (size!2458 (buf!2898 thiss!1305)) (size!2458 (buf!2898 (_2!5457 _$19!123)))))))

(assert (=> d!40340 (and (inv!12 (_2!5457 _$19!123)) e!81174)))

(assert (=> d!40340 (= (choose!16 thiss!1305 lt!193222) _$19!123)))

(assert (= d!40340 b!123850))

(assert (= (and d!40340 res!102663) b!123852))

(assert (= (and b!123852 res!102662) b!123854))

(assert (= (and b!123854 res!102664) b!123853))

(assert (= (and b!123853 res!102665) b!123851))

(declare-fun m!189021 () Bool)

(assert (=> d!40340 m!189021))

(declare-fun m!189023 () Bool)

(assert (=> b!123854 m!189023))

(declare-fun m!189025 () Bool)

(assert (=> b!123850 m!189025))

(declare-fun m!189027 () Bool)

(assert (=> b!123851 m!189027))

(declare-fun m!189029 () Bool)

(assert (=> b!123851 m!189029))

(declare-fun m!189031 () Bool)

(assert (=> b!123853 m!189031))

(assert (=> b!123853 m!189031))

(declare-fun m!189033 () Bool)

(assert (=> b!123853 m!189033))

(assert (=> b!123852 m!189029))

(assert (=> b!123852 m!186517))

(assert (=> d!39644 d!40340))

(declare-fun d!40342 () Bool)

(assert (=> d!40342 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2458 (buf!2898 thiss!1305))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 thiss!1305))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!9709 () Bool)

(assert (= bs!9709 d!40342))

(assert (=> bs!9709 m!186787))

(assert (=> d!39644 d!40342))

(declare-fun d!40344 () Bool)

(assert (=> d!40344 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193212)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))) lt!194134) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193212)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212)))) lt!194134))))

(declare-fun bs!9710 () Bool)

(assert (= bs!9710 d!40344))

(assert (=> bs!9710 m!186751))

(assert (=> b!123067 d!40344))

(declare-fun d!40346 () Bool)

(declare-fun e!81178 () Bool)

(assert (=> d!40346 e!81178))

(declare-fun res!102667 () Bool)

(assert (=> d!40346 (=> (not res!102667) (not e!81178))))

(declare-fun lt!195553 () (_ BitVec 64))

(declare-fun lt!195554 () (_ BitVec 64))

(declare-fun lt!195549 () (_ BitVec 64))

(assert (=> d!40346 (= res!102667 (= lt!195554 (bvsub lt!195549 lt!195553)))))

(assert (=> d!40346 (or (= (bvand lt!195549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195553 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195549 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195549 lt!195553) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40346 (= lt!195553 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194147)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194147))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194147)))))))

(declare-fun lt!195551 () (_ BitVec 64))

(declare-fun lt!195552 () (_ BitVec 64))

(assert (=> d!40346 (= lt!195549 (bvmul lt!195551 lt!195552))))

(assert (=> d!40346 (or (= lt!195551 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195552 (bvsdiv (bvmul lt!195551 lt!195552) lt!195551)))))

(assert (=> d!40346 (= lt!195552 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40346 (= lt!195551 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194147)))))))

(assert (=> d!40346 (= lt!195554 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194147))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194147)))))))

(assert (=> d!40346 (invariant!0 (currentBit!5590 (_1!5458 lt!194147)) (currentByte!5595 (_1!5458 lt!194147)) (size!2458 (buf!2898 (_1!5458 lt!194147))))))

(assert (=> d!40346 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194147))) (currentByte!5595 (_1!5458 lt!194147)) (currentBit!5590 (_1!5458 lt!194147))) lt!195554)))

(declare-fun b!123855 () Bool)

(declare-fun res!102666 () Bool)

(assert (=> b!123855 (=> (not res!102666) (not e!81178))))

(assert (=> b!123855 (= res!102666 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195554))))

(declare-fun b!123856 () Bool)

(declare-fun lt!195550 () (_ BitVec 64))

(assert (=> b!123856 (= e!81178 (bvsle lt!195554 (bvmul lt!195550 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123856 (or (= lt!195550 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195550 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195550)))))

(assert (=> b!123856 (= lt!195550 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194147)))))))

(assert (= (and d!40346 res!102667) b!123855))

(assert (= (and b!123855 res!102666) b!123856))

(declare-fun m!189035 () Bool)

(assert (=> d!40346 m!189035))

(declare-fun m!189037 () Bool)

(assert (=> d!40346 m!189037))

(assert (=> d!39640 d!40346))

(declare-fun d!40348 () Bool)

(assert (=> d!40348 (= (invariant!0 (currentBit!5590 lt!193231) (currentByte!5595 lt!193231) (size!2458 (buf!2898 (_2!5457 lt!193209)))) (and (bvsge (currentBit!5590 lt!193231) #b00000000000000000000000000000000) (bvslt (currentBit!5590 lt!193231) #b00000000000000000000000000001000) (bvsge (currentByte!5595 lt!193231) #b00000000000000000000000000000000) (or (bvslt (currentByte!5595 lt!193231) (size!2458 (buf!2898 (_2!5457 lt!193209)))) (and (= (currentBit!5590 lt!193231) #b00000000000000000000000000000000) (= (currentByte!5595 lt!193231) (size!2458 (buf!2898 (_2!5457 lt!193209))))))))))

(assert (=> d!39640 d!40348))

(declare-fun d!40350 () Bool)

(declare-fun lt!195555 () tuple2!10416)

(assert (=> d!40350 (= lt!195555 (readBit!0 lt!194148))))

(assert (=> d!40350 (= (readBitPure!0 lt!194148) (tuple2!10387 (_2!5473 lt!195555) (_1!5473 lt!195555)))))

(declare-fun bs!9711 () Bool)

(assert (= bs!9711 d!40350))

(declare-fun m!189039 () Bool)

(assert (=> bs!9711 m!189039))

(assert (=> d!39640 d!40350))

(declare-fun d!40352 () Bool)

(declare-fun e!81179 () Bool)

(assert (=> d!40352 e!81179))

(declare-fun res!102669 () Bool)

(assert (=> d!40352 (=> (not res!102669) (not e!81179))))

(declare-fun lt!195556 () (_ BitVec 64))

(declare-fun lt!195561 () (_ BitVec 64))

(declare-fun lt!195560 () (_ BitVec 64))

(assert (=> d!40352 (= res!102669 (= lt!195561 (bvsub lt!195556 lt!195560)))))

(assert (=> d!40352 (or (= (bvand lt!195556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195560 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195556 lt!195560) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40352 (= lt!195560 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194150)))) ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194150))) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194150)))))))

(declare-fun lt!195558 () (_ BitVec 64))

(declare-fun lt!195559 () (_ BitVec 64))

(assert (=> d!40352 (= lt!195556 (bvmul lt!195558 lt!195559))))

(assert (=> d!40352 (or (= lt!195558 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195559 (bvsdiv (bvmul lt!195558 lt!195559) lt!195558)))))

(assert (=> d!40352 (= lt!195559 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40352 (= lt!195558 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194150)))))))

(assert (=> d!40352 (= lt!195561 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5458 lt!194150))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5458 lt!194150)))))))

(assert (=> d!40352 (invariant!0 (currentBit!5590 (_1!5458 lt!194150)) (currentByte!5595 (_1!5458 lt!194150)) (size!2458 (buf!2898 (_1!5458 lt!194150))))))

(assert (=> d!40352 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!194150))) (currentByte!5595 (_1!5458 lt!194150)) (currentBit!5590 (_1!5458 lt!194150))) lt!195561)))

(declare-fun b!123857 () Bool)

(declare-fun res!102668 () Bool)

(assert (=> b!123857 (=> (not res!102668) (not e!81179))))

(assert (=> b!123857 (= res!102668 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195561))))

(declare-fun b!123858 () Bool)

(declare-fun lt!195557 () (_ BitVec 64))

(assert (=> b!123858 (= e!81179 (bvsle lt!195561 (bvmul lt!195557 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123858 (or (= lt!195557 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195557 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195557)))))

(assert (=> b!123858 (= lt!195557 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5458 lt!194150)))))))

(assert (= (and d!40352 res!102669) b!123857))

(assert (= (and b!123857 res!102668) b!123858))

(declare-fun m!189041 () Bool)

(assert (=> d!40352 m!189041))

(declare-fun m!189043 () Bool)

(assert (=> d!40352 m!189043))

(assert (=> d!39640 d!40352))

(assert (=> d!39640 d!39656))

(declare-fun d!40354 () Bool)

(declare-fun e!81182 () Bool)

(assert (=> d!40354 e!81182))

(declare-fun res!102672 () Bool)

(assert (=> d!40354 (=> (not res!102672) (not e!81182))))

(declare-fun lt!195568 () tuple2!10386)

(declare-fun lt!195570 () tuple2!10386)

(assert (=> d!40354 (= res!102672 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!195568))) (currentByte!5595 (_1!5458 lt!195568)) (currentBit!5590 (_1!5458 lt!195568))) (bitIndex!0 (size!2458 (buf!2898 (_1!5458 lt!195570))) (currentByte!5595 (_1!5458 lt!195570)) (currentBit!5590 (_1!5458 lt!195570)))))))

(declare-fun lt!195569 () BitStream!4390)

(assert (=> d!40354 (= lt!195570 (readBitPure!0 lt!195569))))

(assert (=> d!40354 (= lt!195568 (readBitPure!0 lt!193231))))

(assert (=> d!40354 (= lt!195569 (BitStream!4391 (buf!2898 (_2!5457 lt!193209)) (currentByte!5595 lt!193231) (currentBit!5590 lt!193231)))))

(assert (=> d!40354 (invariant!0 (currentBit!5590 lt!193231) (currentByte!5595 lt!193231) (size!2458 (buf!2898 (_2!5457 lt!193209))))))

(assert (=> d!40354 true))

(declare-fun _$9!66 () Unit!7555)

(assert (=> d!40354 (= (choose!50 lt!193231 (_2!5457 lt!193209) lt!194148 lt!194150 (tuple2!10387 (_1!5458 lt!194150) (_2!5458 lt!194150)) (_1!5458 lt!194150) (_2!5458 lt!194150) lt!194147 (tuple2!10387 (_1!5458 lt!194147) (_2!5458 lt!194147)) (_1!5458 lt!194147) (_2!5458 lt!194147)) _$9!66)))

(declare-fun b!123861 () Bool)

(assert (=> b!123861 (= e!81182 (= (_2!5458 lt!195568) (_2!5458 lt!195570)))))

(assert (= (and d!40354 res!102672) b!123861))

(declare-fun m!189045 () Bool)

(assert (=> d!40354 m!189045))

(declare-fun m!189047 () Bool)

(assert (=> d!40354 m!189047))

(assert (=> d!40354 m!186555))

(declare-fun m!189049 () Bool)

(assert (=> d!40354 m!189049))

(assert (=> d!40354 m!187251))

(assert (=> d!39640 d!40354))

(declare-fun d!40356 () Bool)

(assert (=> d!40356 (= (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 thiss!1305)) ((_ sign_extend 32) (currentBit!5590 thiss!1305))) (bvsub (bvmul ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 thiss!1305)))))))

(assert (=> d!39638 d!40356))

(assert (=> d!39532 d!40310))

(declare-fun d!40358 () Bool)

(declare-fun e!81183 () Bool)

(assert (=> d!40358 e!81183))

(declare-fun res!102673 () Bool)

(assert (=> d!40358 (=> (not res!102673) (not e!81183))))

(declare-fun lt!195571 () BitStream!4390)

(declare-fun lt!195572 () (_ BitVec 64))

(assert (=> d!40358 (= res!102673 (= (bvadd lt!195572 (bvsub lt!194391 lt!194397)) (bitIndex!0 (size!2458 (buf!2898 lt!195571)) (currentByte!5595 lt!195571) (currentBit!5590 lt!195571))))))

(assert (=> d!40358 (or (not (= (bvand lt!195572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194391 lt!194397) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195572 (bvsub lt!194391 lt!194397)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40358 (= lt!195572 (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!194380))) (currentByte!5595 (_2!5459 lt!194380)) (currentBit!5590 (_2!5459 lt!194380))))))

(assert (=> d!40358 (= lt!195571 (_2!5457 (moveBitIndex!0 (_2!5459 lt!194380) (bvsub lt!194391 lt!194397))))))

(assert (=> d!40358 (moveBitIndexPrecond!0 (_2!5459 lt!194380) (bvsub lt!194391 lt!194397))))

(assert (=> d!40358 (= (withMovedBitIndex!0 (_2!5459 lt!194380) (bvsub lt!194391 lt!194397)) lt!195571)))

(declare-fun b!123862 () Bool)

(assert (=> b!123862 (= e!81183 (= (size!2458 (buf!2898 (_2!5459 lt!194380))) (size!2458 (buf!2898 lt!195571))))))

(assert (= (and d!40358 res!102673) b!123862))

(declare-fun m!189051 () Bool)

(assert (=> d!40358 m!189051))

(assert (=> d!40358 m!188899))

(declare-fun m!189053 () Bool)

(assert (=> d!40358 m!189053))

(declare-fun m!189055 () Bool)

(assert (=> d!40358 m!189055))

(assert (=> b!123162 d!40358))

(assert (=> b!123162 d!39492))

(assert (=> b!123162 d!39518))

(declare-fun d!40360 () Bool)

(declare-fun e!81184 () Bool)

(assert (=> d!40360 e!81184))

(declare-fun res!102675 () Bool)

(assert (=> d!40360 (=> (not res!102675) (not e!81184))))

(declare-fun lt!195577 () (_ BitVec 64))

(declare-fun lt!195573 () (_ BitVec 64))

(declare-fun lt!195578 () (_ BitVec 64))

(assert (=> d!40360 (= res!102675 (= lt!195578 (bvsub lt!195573 lt!195577)))))

(assert (=> d!40360 (or (= (bvand lt!195573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195577 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195573 lt!195577) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40360 (= lt!195577 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 lt!193516))) ((_ sign_extend 32) (currentByte!5595 lt!193516)) ((_ sign_extend 32) (currentBit!5590 lt!193516))))))

(declare-fun lt!195575 () (_ BitVec 64))

(declare-fun lt!195576 () (_ BitVec 64))

(assert (=> d!40360 (= lt!195573 (bvmul lt!195575 lt!195576))))

(assert (=> d!40360 (or (= lt!195575 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195576 (bvsdiv (bvmul lt!195575 lt!195576) lt!195575)))))

(assert (=> d!40360 (= lt!195576 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40360 (= lt!195575 ((_ sign_extend 32) (size!2458 (buf!2898 lt!193516))))))

(assert (=> d!40360 (= lt!195578 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 lt!193516)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 lt!193516))))))

(assert (=> d!40360 (invariant!0 (currentBit!5590 lt!193516) (currentByte!5595 lt!193516) (size!2458 (buf!2898 lt!193516)))))

(assert (=> d!40360 (= (bitIndex!0 (size!2458 (buf!2898 lt!193516)) (currentByte!5595 lt!193516) (currentBit!5590 lt!193516)) lt!195578)))

(declare-fun b!123863 () Bool)

(declare-fun res!102674 () Bool)

(assert (=> b!123863 (=> (not res!102674) (not e!81184))))

(assert (=> b!123863 (= res!102674 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195578))))

(declare-fun b!123864 () Bool)

(declare-fun lt!195574 () (_ BitVec 64))

(assert (=> b!123864 (= e!81184 (bvsle lt!195578 (bvmul lt!195574 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123864 (or (= lt!195574 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195574 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195574)))))

(assert (=> b!123864 (= lt!195574 ((_ sign_extend 32) (size!2458 (buf!2898 lt!193516))))))

(assert (= (and d!40360 res!102675) b!123863))

(assert (= (and b!123863 res!102674) b!123864))

(declare-fun m!189057 () Bool)

(assert (=> d!40360 m!189057))

(declare-fun m!189059 () Bool)

(assert (=> d!40360 m!189059))

(assert (=> d!39506 d!40360))

(declare-fun d!40362 () Bool)

(declare-fun e!81185 () Bool)

(assert (=> d!40362 e!81185))

(declare-fun res!102677 () Bool)

(assert (=> d!40362 (=> (not res!102677) (not e!81185))))

(declare-fun lt!195583 () (_ BitVec 64))

(declare-fun lt!195579 () (_ BitVec 64))

(declare-fun lt!195584 () (_ BitVec 64))

(assert (=> d!40362 (= res!102677 (= lt!195584 (bvsub lt!195579 lt!195583)))))

(assert (=> d!40362 (or (= (bvand lt!195579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195583 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195579 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195579 lt!195583) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40362 (= lt!195583 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193224)))) ((_ sign_extend 32) (currentByte!5595 (_2!5459 lt!193224))) ((_ sign_extend 32) (currentBit!5590 (_2!5459 lt!193224)))))))

(declare-fun lt!195581 () (_ BitVec 64))

(declare-fun lt!195582 () (_ BitVec 64))

(assert (=> d!40362 (= lt!195579 (bvmul lt!195581 lt!195582))))

(assert (=> d!40362 (or (= lt!195581 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195582 (bvsdiv (bvmul lt!195581 lt!195582) lt!195581)))))

(assert (=> d!40362 (= lt!195582 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40362 (= lt!195581 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193224)))))))

(assert (=> d!40362 (= lt!195584 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5459 lt!193224))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5459 lt!193224)))))))

(assert (=> d!40362 (invariant!0 (currentBit!5590 (_2!5459 lt!193224)) (currentByte!5595 (_2!5459 lt!193224)) (size!2458 (buf!2898 (_2!5459 lt!193224))))))

(assert (=> d!40362 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!193224))) (currentByte!5595 (_2!5459 lt!193224)) (currentBit!5590 (_2!5459 lt!193224))) lt!195584)))

(declare-fun b!123865 () Bool)

(declare-fun res!102676 () Bool)

(assert (=> b!123865 (=> (not res!102676) (not e!81185))))

(assert (=> b!123865 (= res!102676 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195584))))

(declare-fun b!123866 () Bool)

(declare-fun lt!195580 () (_ BitVec 64))

(assert (=> b!123866 (= e!81185 (bvsle lt!195584 (bvmul lt!195580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123866 (or (= lt!195580 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195580 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195580)))))

(assert (=> b!123866 (= lt!195580 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193224)))))))

(assert (= (and d!40362 res!102677) b!123865))

(assert (= (and b!123865 res!102676) b!123866))

(declare-fun m!189061 () Bool)

(assert (=> d!40362 m!189061))

(declare-fun m!189063 () Bool)

(assert (=> d!40362 m!189063))

(assert (=> d!39506 d!40362))

(declare-fun d!40364 () Bool)

(declare-fun lt!195599 () (_ BitVec 32))

(assert (=> d!40364 (= lt!195599 ((_ extract 31 0) (bvsrem (bvsub lt!193233 lt!193210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!195598 () (_ BitVec 32))

(assert (=> d!40364 (= lt!195598 ((_ extract 31 0) (bvsdiv (bvsub lt!193233 lt!193210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!81190 () Bool)

(assert (=> d!40364 e!81190))

(declare-fun res!102682 () Bool)

(assert (=> d!40364 (=> (not res!102682) (not e!81190))))

(assert (=> d!40364 (= res!102682 (moveBitIndexPrecond!0 (_2!5459 lt!193224) (bvsub lt!193233 lt!193210)))))

(declare-fun Unit!7648 () Unit!7555)

(declare-fun Unit!7649 () Unit!7555)

(declare-fun Unit!7650 () Unit!7555)

(assert (=> d!40364 (= (moveBitIndex!0 (_2!5459 lt!193224) (bvsub lt!193233 lt!193210)) (ite (bvslt (bvadd (currentBit!5590 (_2!5459 lt!193224)) lt!195599) #b00000000000000000000000000000000) (tuple2!10385 Unit!7648 (BitStream!4391 (buf!2898 (_2!5459 lt!193224)) (bvsub (bvadd (currentByte!5595 (_2!5459 lt!193224)) lt!195598) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195599 (currentBit!5590 (_2!5459 lt!193224))))) (ite (bvsge (bvadd (currentBit!5590 (_2!5459 lt!193224)) lt!195599) #b00000000000000000000000000001000) (tuple2!10385 Unit!7649 (BitStream!4391 (buf!2898 (_2!5459 lt!193224)) (bvadd (currentByte!5595 (_2!5459 lt!193224)) lt!195598 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5590 (_2!5459 lt!193224)) lt!195599) #b00000000000000000000000000001000))) (tuple2!10385 Unit!7650 (BitStream!4391 (buf!2898 (_2!5459 lt!193224)) (bvadd (currentByte!5595 (_2!5459 lt!193224)) lt!195598) (bvadd (currentBit!5590 (_2!5459 lt!193224)) lt!195599))))))))

(declare-fun b!123871 () Bool)

(declare-fun e!81191 () Bool)

(assert (=> b!123871 (= e!81190 e!81191)))

(declare-fun res!102683 () Bool)

(assert (=> b!123871 (=> (not res!102683) (not e!81191))))

(declare-fun lt!195602 () tuple2!10384)

(declare-fun lt!195601 () (_ BitVec 64))

(assert (=> b!123871 (= res!102683 (= (bvadd lt!195601 (bvsub lt!193233 lt!193210)) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195602))) (currentByte!5595 (_2!5457 lt!195602)) (currentBit!5590 (_2!5457 lt!195602)))))))

(assert (=> b!123871 (or (not (= (bvand lt!195601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193233 lt!193210) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195601 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195601 (bvsub lt!193233 lt!193210)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123871 (= lt!195601 (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!193224))) (currentByte!5595 (_2!5459 lt!193224)) (currentBit!5590 (_2!5459 lt!193224))))))

(declare-fun lt!195600 () (_ BitVec 32))

(declare-fun lt!195597 () (_ BitVec 32))

(declare-fun Unit!7651 () Unit!7555)

(declare-fun Unit!7652 () Unit!7555)

(declare-fun Unit!7653 () Unit!7555)

(assert (=> b!123871 (= lt!195602 (ite (bvslt (bvadd (currentBit!5590 (_2!5459 lt!193224)) lt!195600) #b00000000000000000000000000000000) (tuple2!10385 Unit!7651 (BitStream!4391 (buf!2898 (_2!5459 lt!193224)) (bvsub (bvadd (currentByte!5595 (_2!5459 lt!193224)) lt!195597) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195600 (currentBit!5590 (_2!5459 lt!193224))))) (ite (bvsge (bvadd (currentBit!5590 (_2!5459 lt!193224)) lt!195600) #b00000000000000000000000000001000) (tuple2!10385 Unit!7652 (BitStream!4391 (buf!2898 (_2!5459 lt!193224)) (bvadd (currentByte!5595 (_2!5459 lt!193224)) lt!195597 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5590 (_2!5459 lt!193224)) lt!195600) #b00000000000000000000000000001000))) (tuple2!10385 Unit!7653 (BitStream!4391 (buf!2898 (_2!5459 lt!193224)) (bvadd (currentByte!5595 (_2!5459 lt!193224)) lt!195597) (bvadd (currentBit!5590 (_2!5459 lt!193224)) lt!195600))))))))

(assert (=> b!123871 (= lt!195600 ((_ extract 31 0) (bvsrem (bvsub lt!193233 lt!193210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123871 (= lt!195597 ((_ extract 31 0) (bvsdiv (bvsub lt!193233 lt!193210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!123872 () Bool)

(assert (=> b!123872 (= e!81191 (and (= (size!2458 (buf!2898 (_2!5459 lt!193224))) (size!2458 (buf!2898 (_2!5457 lt!195602)))) (= (buf!2898 (_2!5459 lt!193224)) (buf!2898 (_2!5457 lt!195602)))))))

(assert (= (and d!40364 res!102682) b!123871))

(assert (= (and b!123871 res!102683) b!123872))

(assert (=> d!40364 m!186765))

(declare-fun m!189065 () Bool)

(assert (=> b!123871 m!189065))

(assert (=> b!123871 m!186761))

(assert (=> d!39506 d!40364))

(declare-fun d!40368 () Bool)

(declare-fun res!102686 () Bool)

(declare-fun e!81194 () Bool)

(assert (=> d!40368 (=> (not res!102686) (not e!81194))))

(assert (=> d!40368 (= res!102686 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193224))))) (bvsub lt!193233 lt!193210)) (bvsle (bvsub lt!193233 lt!193210) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193224))))))))))

(assert (=> d!40368 (= (moveBitIndexPrecond!0 (_2!5459 lt!193224) (bvsub lt!193233 lt!193210)) e!81194)))

(declare-fun b!123876 () Bool)

(declare-fun lt!195605 () (_ BitVec 64))

(assert (=> b!123876 (= e!81194 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195605) (bvsle lt!195605 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193224))))))))))

(assert (=> b!123876 (= lt!195605 (bvadd (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!193224))) (currentByte!5595 (_2!5459 lt!193224)) (currentBit!5590 (_2!5459 lt!193224))) (bvsub lt!193233 lt!193210)))))

(assert (= (and d!40368 res!102686) b!123876))

(assert (=> b!123876 m!186761))

(assert (=> d!39506 d!40368))

(assert (=> b!123064 d!40200))

(assert (=> b!123064 d!39504))

(assert (=> b!123148 d!39504))

(declare-fun d!40370 () Bool)

(assert (=> d!40370 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!193209)) (buf!2898 (_2!5457 lt!193212)) lt!194354 lt!194352)))

(declare-fun lt!195608 () Unit!7555)

(declare-fun choose!8 (array!5432 array!5432 (_ BitVec 64) (_ BitVec 64)) Unit!7555)

(assert (=> d!40370 (= lt!195608 (choose!8 (buf!2898 (_2!5457 lt!193212)) (buf!2898 (_2!5457 lt!193209)) lt!194354 lt!194352))))

(assert (=> d!40370 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194354) (bvsle lt!194354 lt!194352))))

(assert (=> d!40370 (= (arrayBitRangesEqSymmetric!0 (buf!2898 (_2!5457 lt!193212)) (buf!2898 (_2!5457 lt!193209)) lt!194354 lt!194352) lt!195608)))

(declare-fun bs!9712 () Bool)

(assert (= bs!9712 d!40370))

(assert (=> bs!9712 m!187367))

(declare-fun m!189067 () Bool)

(assert (=> bs!9712 m!189067))

(assert (=> b!123148 d!40370))

(declare-fun b!123877 () Bool)

(declare-fun e!81196 () Bool)

(declare-fun e!81197 () Bool)

(assert (=> b!123877 (= e!81196 e!81197)))

(declare-fun lt!195609 () tuple4!92)

(declare-fun lt!195611 () (_ BitVec 32))

(declare-fun res!102688 () Bool)

(assert (=> b!123877 (= res!102688 (byteRangesEq!0 (select (arr!3051 (buf!2898 (_2!5457 lt!193209))) (_3!267 lt!195609)) (select (arr!3051 (buf!2898 (_2!5457 lt!193212))) (_3!267 lt!195609)) lt!195611 #b00000000000000000000000000001000))))

(assert (=> b!123877 (=> (not res!102688) (not e!81197))))

(declare-fun b!123878 () Bool)

(declare-fun res!102691 () Bool)

(declare-fun lt!195610 () (_ BitVec 32))

(assert (=> b!123878 (= res!102691 (= lt!195610 #b00000000000000000000000000000000))))

(declare-fun e!81198 () Bool)

(assert (=> b!123878 (=> res!102691 e!81198)))

(assert (=> b!123878 (= e!81197 e!81198)))

(declare-fun b!123879 () Bool)

(declare-fun call!1626 () Bool)

(assert (=> b!123879 (= e!81196 call!1626)))

(declare-fun b!123880 () Bool)

(declare-fun e!81199 () Bool)

(assert (=> b!123880 (= e!81199 e!81196)))

(declare-fun c!7415 () Bool)

(assert (=> b!123880 (= c!7415 (= (_3!267 lt!195609) (_4!46 lt!195609)))))

(declare-fun d!40372 () Bool)

(declare-fun res!102689 () Bool)

(declare-fun e!81195 () Bool)

(assert (=> d!40372 (=> res!102689 e!81195)))

(assert (=> d!40372 (= res!102689 (bvsge lt!194354 lt!194352))))

(assert (=> d!40372 (= (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!193209)) (buf!2898 (_2!5457 lt!193212)) lt!194354 lt!194352) e!81195)))

(declare-fun b!123881 () Bool)

(declare-fun e!81200 () Bool)

(assert (=> b!123881 (= e!81200 (arrayRangesEq!47 (buf!2898 (_2!5457 lt!193209)) (buf!2898 (_2!5457 lt!193212)) (_1!5477 lt!195609) (_2!5477 lt!195609)))))

(declare-fun b!123882 () Bool)

(assert (=> b!123882 (= e!81195 e!81199)))

(declare-fun res!102690 () Bool)

(assert (=> b!123882 (=> (not res!102690) (not e!81199))))

(assert (=> b!123882 (= res!102690 e!81200)))

(declare-fun res!102687 () Bool)

(assert (=> b!123882 (=> res!102687 e!81200)))

(assert (=> b!123882 (= res!102687 (bvsge (_1!5477 lt!195609) (_2!5477 lt!195609)))))

(assert (=> b!123882 (= lt!195610 ((_ extract 31 0) (bvsrem lt!194352 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123882 (= lt!195611 ((_ extract 31 0) (bvsrem lt!194354 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123882 (= lt!195609 (arrayBitIndices!0 lt!194354 lt!194352))))

(declare-fun b!123883 () Bool)

(assert (=> b!123883 (= e!81198 call!1626)))

(declare-fun bm!1623 () Bool)

(assert (=> bm!1623 (= call!1626 (byteRangesEq!0 (ite c!7415 (select (arr!3051 (buf!2898 (_2!5457 lt!193209))) (_3!267 lt!195609)) (select (arr!3051 (buf!2898 (_2!5457 lt!193209))) (_4!46 lt!195609))) (ite c!7415 (select (arr!3051 (buf!2898 (_2!5457 lt!193212))) (_3!267 lt!195609)) (select (arr!3051 (buf!2898 (_2!5457 lt!193212))) (_4!46 lt!195609))) (ite c!7415 lt!195611 #b00000000000000000000000000000000) lt!195610))))

(assert (= (and d!40372 (not res!102689)) b!123882))

(assert (= (and b!123882 (not res!102687)) b!123881))

(assert (= (and b!123882 res!102690) b!123880))

(assert (= (and b!123880 c!7415) b!123879))

(assert (= (and b!123880 (not c!7415)) b!123877))

(assert (= (and b!123877 res!102688) b!123878))

(assert (= (and b!123878 (not res!102691)) b!123883))

(assert (= (or b!123879 b!123883) bm!1623))

(declare-fun m!189069 () Bool)

(assert (=> b!123877 m!189069))

(declare-fun m!189071 () Bool)

(assert (=> b!123877 m!189071))

(assert (=> b!123877 m!189069))

(assert (=> b!123877 m!189071))

(declare-fun m!189073 () Bool)

(assert (=> b!123877 m!189073))

(declare-fun m!189075 () Bool)

(assert (=> b!123881 m!189075))

(declare-fun m!189077 () Bool)

(assert (=> b!123882 m!189077))

(assert (=> bm!1623 m!189069))

(assert (=> bm!1623 m!189071))

(declare-fun m!189079 () Bool)

(assert (=> bm!1623 m!189079))

(declare-fun m!189081 () Bool)

(assert (=> bm!1623 m!189081))

(declare-fun m!189083 () Bool)

(assert (=> bm!1623 m!189083))

(assert (=> b!123148 d!40372))

(assert (=> b!123164 d!39518))

(declare-fun d!40374 () Bool)

(assert (=> d!40374 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!193209)) (buf!2898 thiss!1305) lt!194387 lt!194385)))

(declare-fun lt!195612 () Unit!7555)

(assert (=> d!40374 (= lt!195612 (choose!8 (buf!2898 thiss!1305) (buf!2898 (_2!5457 lt!193209)) lt!194387 lt!194385))))

(assert (=> d!40374 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!194387) (bvsle lt!194387 lt!194385))))

(assert (=> d!40374 (= (arrayBitRangesEqSymmetric!0 (buf!2898 thiss!1305) (buf!2898 (_2!5457 lt!193209)) lt!194387 lt!194385) lt!195612)))

(declare-fun bs!9713 () Bool)

(assert (= bs!9713 d!40374))

(assert (=> bs!9713 m!187415))

(declare-fun m!189085 () Bool)

(assert (=> bs!9713 m!189085))

(assert (=> b!123164 d!40374))

(declare-fun b!123884 () Bool)

(declare-fun e!81202 () Bool)

(declare-fun e!81203 () Bool)

(assert (=> b!123884 (= e!81202 e!81203)))

(declare-fun lt!195613 () tuple4!92)

(declare-fun lt!195615 () (_ BitVec 32))

(declare-fun res!102693 () Bool)

(assert (=> b!123884 (= res!102693 (byteRangesEq!0 (select (arr!3051 (buf!2898 (_2!5457 lt!193209))) (_3!267 lt!195613)) (select (arr!3051 (buf!2898 thiss!1305)) (_3!267 lt!195613)) lt!195615 #b00000000000000000000000000001000))))

(assert (=> b!123884 (=> (not res!102693) (not e!81203))))

(declare-fun b!123885 () Bool)

(declare-fun res!102696 () Bool)

(declare-fun lt!195614 () (_ BitVec 32))

(assert (=> b!123885 (= res!102696 (= lt!195614 #b00000000000000000000000000000000))))

(declare-fun e!81204 () Bool)

(assert (=> b!123885 (=> res!102696 e!81204)))

(assert (=> b!123885 (= e!81203 e!81204)))

(declare-fun b!123886 () Bool)

(declare-fun call!1627 () Bool)

(assert (=> b!123886 (= e!81202 call!1627)))

(declare-fun b!123887 () Bool)

(declare-fun e!81205 () Bool)

(assert (=> b!123887 (= e!81205 e!81202)))

(declare-fun c!7416 () Bool)

(assert (=> b!123887 (= c!7416 (= (_3!267 lt!195613) (_4!46 lt!195613)))))

(declare-fun d!40376 () Bool)

(declare-fun res!102694 () Bool)

(declare-fun e!81201 () Bool)

(assert (=> d!40376 (=> res!102694 e!81201)))

(assert (=> d!40376 (= res!102694 (bvsge lt!194387 lt!194385))))

(assert (=> d!40376 (= (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!193209)) (buf!2898 thiss!1305) lt!194387 lt!194385) e!81201)))

(declare-fun e!81206 () Bool)

(declare-fun b!123888 () Bool)

(assert (=> b!123888 (= e!81206 (arrayRangesEq!47 (buf!2898 (_2!5457 lt!193209)) (buf!2898 thiss!1305) (_1!5477 lt!195613) (_2!5477 lt!195613)))))

(declare-fun b!123889 () Bool)

(assert (=> b!123889 (= e!81201 e!81205)))

(declare-fun res!102695 () Bool)

(assert (=> b!123889 (=> (not res!102695) (not e!81205))))

(assert (=> b!123889 (= res!102695 e!81206)))

(declare-fun res!102692 () Bool)

(assert (=> b!123889 (=> res!102692 e!81206)))

(assert (=> b!123889 (= res!102692 (bvsge (_1!5477 lt!195613) (_2!5477 lt!195613)))))

(assert (=> b!123889 (= lt!195614 ((_ extract 31 0) (bvsrem lt!194385 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123889 (= lt!195615 ((_ extract 31 0) (bvsrem lt!194387 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123889 (= lt!195613 (arrayBitIndices!0 lt!194387 lt!194385))))

(declare-fun b!123890 () Bool)

(assert (=> b!123890 (= e!81204 call!1627)))

(declare-fun bm!1624 () Bool)

(assert (=> bm!1624 (= call!1627 (byteRangesEq!0 (ite c!7416 (select (arr!3051 (buf!2898 (_2!5457 lt!193209))) (_3!267 lt!195613)) (select (arr!3051 (buf!2898 (_2!5457 lt!193209))) (_4!46 lt!195613))) (ite c!7416 (select (arr!3051 (buf!2898 thiss!1305)) (_3!267 lt!195613)) (select (arr!3051 (buf!2898 thiss!1305)) (_4!46 lt!195613))) (ite c!7416 lt!195615 #b00000000000000000000000000000000) lt!195614))))

(assert (= (and d!40376 (not res!102694)) b!123889))

(assert (= (and b!123889 (not res!102692)) b!123888))

(assert (= (and b!123889 res!102695) b!123887))

(assert (= (and b!123887 c!7416) b!123886))

(assert (= (and b!123887 (not c!7416)) b!123884))

(assert (= (and b!123884 res!102693) b!123885))

(assert (= (and b!123885 (not res!102696)) b!123890))

(assert (= (or b!123886 b!123890) bm!1624))

(declare-fun m!189087 () Bool)

(assert (=> b!123884 m!189087))

(declare-fun m!189089 () Bool)

(assert (=> b!123884 m!189089))

(assert (=> b!123884 m!189087))

(assert (=> b!123884 m!189089))

(declare-fun m!189091 () Bool)

(assert (=> b!123884 m!189091))

(declare-fun m!189093 () Bool)

(assert (=> b!123888 m!189093))

(declare-fun m!189095 () Bool)

(assert (=> b!123889 m!189095))

(assert (=> bm!1624 m!189087))

(assert (=> bm!1624 m!189089))

(declare-fun m!189097 () Bool)

(assert (=> bm!1624 m!189097))

(declare-fun m!189099 () Bool)

(assert (=> bm!1624 m!189099))

(declare-fun m!189101 () Bool)

(assert (=> bm!1624 m!189101))

(assert (=> b!123164 d!40376))

(declare-fun d!40378 () Bool)

(assert (=> d!40378 (= (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212)))) (bvsub (bvmul ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5457 lt!193209)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5457 lt!193212))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5457 lt!193212))))))))

(assert (=> d!39642 d!40378))

(declare-fun d!40380 () Bool)

(declare-fun e!81207 () Bool)

(assert (=> d!40380 e!81207))

(declare-fun res!102698 () Bool)

(assert (=> d!40380 (=> (not res!102698) (not e!81207))))

(declare-fun lt!195616 () (_ BitVec 64))

(declare-fun lt!195620 () (_ BitVec 64))

(declare-fun lt!195621 () (_ BitVec 64))

(assert (=> d!40380 (= res!102698 (= lt!195621 (bvsub lt!195616 lt!195620)))))

(assert (=> d!40380 (or (= (bvand lt!195616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195616 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195616 lt!195620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40380 (= lt!195620 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 lt!193520))) ((_ sign_extend 32) (currentByte!5595 lt!193520)) ((_ sign_extend 32) (currentBit!5590 lt!193520))))))

(declare-fun lt!195618 () (_ BitVec 64))

(declare-fun lt!195619 () (_ BitVec 64))

(assert (=> d!40380 (= lt!195616 (bvmul lt!195618 lt!195619))))

(assert (=> d!40380 (or (= lt!195618 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195619 (bvsdiv (bvmul lt!195618 lt!195619) lt!195618)))))

(assert (=> d!40380 (= lt!195619 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40380 (= lt!195618 ((_ sign_extend 32) (size!2458 (buf!2898 lt!193520))))))

(assert (=> d!40380 (= lt!195621 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 lt!193520)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 lt!193520))))))

(assert (=> d!40380 (invariant!0 (currentBit!5590 lt!193520) (currentByte!5595 lt!193520) (size!2458 (buf!2898 lt!193520)))))

(assert (=> d!40380 (= (bitIndex!0 (size!2458 (buf!2898 lt!193520)) (currentByte!5595 lt!193520) (currentBit!5590 lt!193520)) lt!195621)))

(declare-fun b!123891 () Bool)

(declare-fun res!102697 () Bool)

(assert (=> b!123891 (=> (not res!102697) (not e!81207))))

(assert (=> b!123891 (= res!102697 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195621))))

(declare-fun b!123892 () Bool)

(declare-fun lt!195617 () (_ BitVec 64))

(assert (=> b!123892 (= e!81207 (bvsle lt!195621 (bvmul lt!195617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123892 (or (= lt!195617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195617)))))

(assert (=> b!123892 (= lt!195617 ((_ sign_extend 32) (size!2458 (buf!2898 lt!193520))))))

(assert (= (and d!40380 res!102698) b!123891))

(assert (= (and b!123891 res!102697) b!123892))

(declare-fun m!189103 () Bool)

(assert (=> d!40380 m!189103))

(declare-fun m!189105 () Bool)

(assert (=> d!40380 m!189105))

(assert (=> d!39514 d!40380))

(declare-fun d!40382 () Bool)

(declare-fun e!81208 () Bool)

(assert (=> d!40382 e!81208))

(declare-fun res!102700 () Bool)

(assert (=> d!40382 (=> (not res!102700) (not e!81208))))

(declare-fun lt!195626 () (_ BitVec 64))

(declare-fun lt!195627 () (_ BitVec 64))

(declare-fun lt!195622 () (_ BitVec 64))

(assert (=> d!40382 (= res!102700 (= lt!195627 (bvsub lt!195622 lt!195626)))))

(assert (=> d!40382 (or (= (bvand lt!195622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195626 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195622 lt!195626) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40382 (= lt!195626 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193219)))) ((_ sign_extend 32) (currentByte!5595 (_2!5459 lt!193219))) ((_ sign_extend 32) (currentBit!5590 (_2!5459 lt!193219)))))))

(declare-fun lt!195624 () (_ BitVec 64))

(declare-fun lt!195625 () (_ BitVec 64))

(assert (=> d!40382 (= lt!195622 (bvmul lt!195624 lt!195625))))

(assert (=> d!40382 (or (= lt!195624 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195625 (bvsdiv (bvmul lt!195624 lt!195625) lt!195624)))))

(assert (=> d!40382 (= lt!195625 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40382 (= lt!195624 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193219)))))))

(assert (=> d!40382 (= lt!195627 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_2!5459 lt!193219))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_2!5459 lt!193219)))))))

(assert (=> d!40382 (invariant!0 (currentBit!5590 (_2!5459 lt!193219)) (currentByte!5595 (_2!5459 lt!193219)) (size!2458 (buf!2898 (_2!5459 lt!193219))))))

(assert (=> d!40382 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!193219))) (currentByte!5595 (_2!5459 lt!193219)) (currentBit!5590 (_2!5459 lt!193219))) lt!195627)))

(declare-fun b!123893 () Bool)

(declare-fun res!102699 () Bool)

(assert (=> b!123893 (=> (not res!102699) (not e!81208))))

(assert (=> b!123893 (= res!102699 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195627))))

(declare-fun b!123894 () Bool)

(declare-fun lt!195623 () (_ BitVec 64))

(assert (=> b!123894 (= e!81208 (bvsle lt!195627 (bvmul lt!195623 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123894 (or (= lt!195623 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195623 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195623)))))

(assert (=> b!123894 (= lt!195623 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193219)))))))

(assert (= (and d!40382 res!102700) b!123893))

(assert (= (and b!123893 res!102699) b!123894))

(declare-fun m!189107 () Bool)

(assert (=> d!40382 m!189107))

(declare-fun m!189109 () Bool)

(assert (=> d!40382 m!189109))

(assert (=> d!39514 d!40382))

(declare-fun d!40384 () Bool)

(declare-fun lt!195630 () (_ BitVec 32))

(assert (=> d!40384 (= lt!195630 ((_ extract 31 0) (bvsrem (bvsub lt!193225 lt!193210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!195629 () (_ BitVec 32))

(assert (=> d!40384 (= lt!195629 ((_ extract 31 0) (bvsdiv (bvsub lt!193225 lt!193210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!81209 () Bool)

(assert (=> d!40384 e!81209))

(declare-fun res!102701 () Bool)

(assert (=> d!40384 (=> (not res!102701) (not e!81209))))

(assert (=> d!40384 (= res!102701 (moveBitIndexPrecond!0 (_2!5459 lt!193219) (bvsub lt!193225 lt!193210)))))

(declare-fun Unit!7654 () Unit!7555)

(declare-fun Unit!7655 () Unit!7555)

(declare-fun Unit!7656 () Unit!7555)

(assert (=> d!40384 (= (moveBitIndex!0 (_2!5459 lt!193219) (bvsub lt!193225 lt!193210)) (ite (bvslt (bvadd (currentBit!5590 (_2!5459 lt!193219)) lt!195630) #b00000000000000000000000000000000) (tuple2!10385 Unit!7654 (BitStream!4391 (buf!2898 (_2!5459 lt!193219)) (bvsub (bvadd (currentByte!5595 (_2!5459 lt!193219)) lt!195629) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195630 (currentBit!5590 (_2!5459 lt!193219))))) (ite (bvsge (bvadd (currentBit!5590 (_2!5459 lt!193219)) lt!195630) #b00000000000000000000000000001000) (tuple2!10385 Unit!7655 (BitStream!4391 (buf!2898 (_2!5459 lt!193219)) (bvadd (currentByte!5595 (_2!5459 lt!193219)) lt!195629 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5590 (_2!5459 lt!193219)) lt!195630) #b00000000000000000000000000001000))) (tuple2!10385 Unit!7656 (BitStream!4391 (buf!2898 (_2!5459 lt!193219)) (bvadd (currentByte!5595 (_2!5459 lt!193219)) lt!195629) (bvadd (currentBit!5590 (_2!5459 lt!193219)) lt!195630))))))))

(declare-fun b!123895 () Bool)

(declare-fun e!81210 () Bool)

(assert (=> b!123895 (= e!81209 e!81210)))

(declare-fun res!102702 () Bool)

(assert (=> b!123895 (=> (not res!102702) (not e!81210))))

(declare-fun lt!195633 () tuple2!10384)

(declare-fun lt!195632 () (_ BitVec 64))

(assert (=> b!123895 (= res!102702 (= (bvadd lt!195632 (bvsub lt!193225 lt!193210)) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195633))) (currentByte!5595 (_2!5457 lt!195633)) (currentBit!5590 (_2!5457 lt!195633)))))))

(assert (=> b!123895 (or (not (= (bvand lt!195632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!193225 lt!193210) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195632 (bvsub lt!193225 lt!193210)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123895 (= lt!195632 (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!193219))) (currentByte!5595 (_2!5459 lt!193219)) (currentBit!5590 (_2!5459 lt!193219))))))

(declare-fun lt!195631 () (_ BitVec 32))

(declare-fun lt!195628 () (_ BitVec 32))

(declare-fun Unit!7657 () Unit!7555)

(declare-fun Unit!7658 () Unit!7555)

(declare-fun Unit!7659 () Unit!7555)

(assert (=> b!123895 (= lt!195633 (ite (bvslt (bvadd (currentBit!5590 (_2!5459 lt!193219)) lt!195631) #b00000000000000000000000000000000) (tuple2!10385 Unit!7657 (BitStream!4391 (buf!2898 (_2!5459 lt!193219)) (bvsub (bvadd (currentByte!5595 (_2!5459 lt!193219)) lt!195628) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195631 (currentBit!5590 (_2!5459 lt!193219))))) (ite (bvsge (bvadd (currentBit!5590 (_2!5459 lt!193219)) lt!195631) #b00000000000000000000000000001000) (tuple2!10385 Unit!7658 (BitStream!4391 (buf!2898 (_2!5459 lt!193219)) (bvadd (currentByte!5595 (_2!5459 lt!193219)) lt!195628 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5590 (_2!5459 lt!193219)) lt!195631) #b00000000000000000000000000001000))) (tuple2!10385 Unit!7659 (BitStream!4391 (buf!2898 (_2!5459 lt!193219)) (bvadd (currentByte!5595 (_2!5459 lt!193219)) lt!195628) (bvadd (currentBit!5590 (_2!5459 lt!193219)) lt!195631))))))))

(assert (=> b!123895 (= lt!195631 ((_ extract 31 0) (bvsrem (bvsub lt!193225 lt!193210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123895 (= lt!195628 ((_ extract 31 0) (bvsdiv (bvsub lt!193225 lt!193210) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!123896 () Bool)

(assert (=> b!123896 (= e!81210 (and (= (size!2458 (buf!2898 (_2!5459 lt!193219))) (size!2458 (buf!2898 (_2!5457 lt!195633)))) (= (buf!2898 (_2!5459 lt!193219)) (buf!2898 (_2!5457 lt!195633)))))))

(assert (= (and d!40384 res!102701) b!123895))

(assert (= (and b!123895 res!102702) b!123896))

(assert (=> d!40384 m!186783))

(declare-fun m!189111 () Bool)

(assert (=> b!123895 m!189111))

(assert (=> b!123895 m!186779))

(assert (=> d!39514 d!40384))

(declare-fun d!40386 () Bool)

(declare-fun res!102703 () Bool)

(declare-fun e!81211 () Bool)

(assert (=> d!40386 (=> (not res!102703) (not e!81211))))

(assert (=> d!40386 (= res!102703 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193219))))) (bvsub lt!193225 lt!193210)) (bvsle (bvsub lt!193225 lt!193210) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193219))))))))))

(assert (=> d!40386 (= (moveBitIndexPrecond!0 (_2!5459 lt!193219) (bvsub lt!193225 lt!193210)) e!81211)))

(declare-fun b!123897 () Bool)

(declare-fun lt!195634 () (_ BitVec 64))

(assert (=> b!123897 (= e!81211 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195634) (bvsle lt!195634 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2458 (buf!2898 (_2!5459 lt!193219))))))))))

(assert (=> b!123897 (= lt!195634 (bvadd (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!193219))) (currentByte!5595 (_2!5459 lt!193219)) (currentBit!5590 (_2!5459 lt!193219))) (bvsub lt!193225 lt!193210)))))

(assert (= (and d!40386 res!102703) b!123897))

(assert (=> b!123897 m!186779))

(assert (=> d!39514 d!40386))

(assert (=> b!123170 d!39518))

(assert (=> b!123170 d!39504))

(assert (=> d!39646 d!40286))

(assert (=> d!39646 d!40290))

(declare-fun d!40388 () Bool)

(declare-fun res!102705 () Bool)

(declare-fun e!81212 () Bool)

(assert (=> d!40388 (=> (not res!102705) (not e!81212))))

(assert (=> d!40388 (= res!102705 (= (size!2458 (buf!2898 lt!194363)) (size!2458 (buf!2898 (_2!5457 lt!193209)))))))

(assert (=> d!40388 (= (isPrefixOf!0 lt!194363 (_2!5457 lt!193209)) e!81212)))

(declare-fun b!123898 () Bool)

(declare-fun res!102706 () Bool)

(assert (=> b!123898 (=> (not res!102706) (not e!81212))))

(assert (=> b!123898 (= res!102706 (bvsle (bitIndex!0 (size!2458 (buf!2898 lt!194363)) (currentByte!5595 lt!194363) (currentBit!5590 lt!194363)) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209)))))))

(declare-fun b!123899 () Bool)

(declare-fun e!81213 () Bool)

(assert (=> b!123899 (= e!81212 e!81213)))

(declare-fun res!102704 () Bool)

(assert (=> b!123899 (=> res!102704 e!81213)))

(assert (=> b!123899 (= res!102704 (= (size!2458 (buf!2898 lt!194363)) #b00000000000000000000000000000000))))

(declare-fun b!123900 () Bool)

(assert (=> b!123900 (= e!81213 (arrayBitRangesEq!0 (buf!2898 lt!194363) (buf!2898 (_2!5457 lt!193209)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 lt!194363)) (currentByte!5595 lt!194363) (currentBit!5590 lt!194363))))))

(assert (= (and d!40388 res!102705) b!123898))

(assert (= (and b!123898 res!102706) b!123899))

(assert (= (and b!123899 (not res!102704)) b!123900))

(declare-fun m!189113 () Bool)

(assert (=> b!123898 m!189113))

(assert (=> b!123898 m!186503))

(assert (=> b!123900 m!189113))

(assert (=> b!123900 m!189113))

(declare-fun m!189115 () Bool)

(assert (=> b!123900 m!189115))

(assert (=> d!39646 d!40388))

(declare-fun d!40390 () Bool)

(assert (=> d!40390 (isPrefixOf!0 lt!194363 lt!194363)))

(declare-fun lt!195635 () Unit!7555)

(assert (=> d!40390 (= lt!195635 (choose!11 lt!194363))))

(assert (=> d!40390 (= (lemmaIsPrefixRefl!0 lt!194363) lt!195635)))

(declare-fun bs!9714 () Bool)

(assert (= bs!9714 d!40390))

(assert (=> bs!9714 m!187375))

(declare-fun m!189117 () Bool)

(assert (=> bs!9714 m!189117))

(assert (=> d!39646 d!40390))

(declare-fun d!40392 () Bool)

(assert (=> d!40392 (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!193212))))

(declare-fun lt!195636 () Unit!7555)

(assert (=> d!40392 (= lt!195636 (choose!11 (_2!5457 lt!193212)))))

(assert (=> d!40392 (= (lemmaIsPrefixRefl!0 (_2!5457 lt!193212)) lt!195636)))

(declare-fun bs!9715 () Bool)

(assert (= bs!9715 d!40392))

(assert (=> bs!9715 m!187387))

(declare-fun m!189119 () Bool)

(assert (=> bs!9715 m!189119))

(assert (=> d!39646 d!40392))

(declare-fun d!40394 () Bool)

(declare-fun res!102708 () Bool)

(declare-fun e!81214 () Bool)

(assert (=> d!40394 (=> (not res!102708) (not e!81214))))

(assert (=> d!40394 (= res!102708 (= (size!2458 (buf!2898 (_2!5457 lt!193212))) (size!2458 (buf!2898 (_2!5457 lt!193209)))))))

(assert (=> d!40394 (= (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!193209)) e!81214)))

(declare-fun b!123901 () Bool)

(declare-fun res!102709 () Bool)

(assert (=> b!123901 (=> (not res!102709) (not e!81214))))

(assert (=> b!123901 (= res!102709 (bvsle (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193209))) (currentByte!5595 (_2!5457 lt!193209)) (currentBit!5590 (_2!5457 lt!193209)))))))

(declare-fun b!123902 () Bool)

(declare-fun e!81215 () Bool)

(assert (=> b!123902 (= e!81214 e!81215)))

(declare-fun res!102707 () Bool)

(assert (=> b!123902 (=> res!102707 e!81215)))

(assert (=> b!123902 (= res!102707 (= (size!2458 (buf!2898 (_2!5457 lt!193212))) #b00000000000000000000000000000000))))

(declare-fun b!123903 () Bool)

(assert (=> b!123903 (= e!81215 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!193212)) (buf!2898 (_2!5457 lt!193209)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212)))))))

(assert (= (and d!40394 res!102708) b!123901))

(assert (= (and b!123901 res!102709) b!123902))

(assert (= (and b!123902 (not res!102707)) b!123903))

(assert (=> b!123901 m!186513))

(assert (=> b!123901 m!186503))

(assert (=> b!123903 m!186513))

(assert (=> b!123903 m!186513))

(declare-fun m!189121 () Bool)

(assert (=> b!123903 m!189121))

(assert (=> d!39646 d!40394))

(declare-fun d!40396 () Bool)

(declare-fun res!102711 () Bool)

(declare-fun e!81216 () Bool)

(assert (=> d!40396 (=> (not res!102711) (not e!81216))))

(assert (=> d!40396 (= res!102711 (= (size!2458 (buf!2898 lt!194363)) (size!2458 (buf!2898 lt!194363))))))

(assert (=> d!40396 (= (isPrefixOf!0 lt!194363 lt!194363) e!81216)))

(declare-fun b!123904 () Bool)

(declare-fun res!102712 () Bool)

(assert (=> b!123904 (=> (not res!102712) (not e!81216))))

(assert (=> b!123904 (= res!102712 (bvsle (bitIndex!0 (size!2458 (buf!2898 lt!194363)) (currentByte!5595 lt!194363) (currentBit!5590 lt!194363)) (bitIndex!0 (size!2458 (buf!2898 lt!194363)) (currentByte!5595 lt!194363) (currentBit!5590 lt!194363))))))

(declare-fun b!123905 () Bool)

(declare-fun e!81217 () Bool)

(assert (=> b!123905 (= e!81216 e!81217)))

(declare-fun res!102710 () Bool)

(assert (=> b!123905 (=> res!102710 e!81217)))

(assert (=> b!123905 (= res!102710 (= (size!2458 (buf!2898 lt!194363)) #b00000000000000000000000000000000))))

(declare-fun b!123906 () Bool)

(assert (=> b!123906 (= e!81217 (arrayBitRangesEq!0 (buf!2898 lt!194363) (buf!2898 lt!194363) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 lt!194363)) (currentByte!5595 lt!194363) (currentBit!5590 lt!194363))))))

(assert (= (and d!40396 res!102711) b!123904))

(assert (= (and b!123904 res!102712) b!123905))

(assert (= (and b!123905 (not res!102710)) b!123906))

(assert (=> b!123904 m!189113))

(assert (=> b!123904 m!189113))

(assert (=> b!123906 m!189113))

(assert (=> b!123906 m!189113))

(declare-fun m!189123 () Bool)

(assert (=> b!123906 m!189123))

(assert (=> d!39646 d!40396))

(declare-fun d!40398 () Bool)

(assert (=> d!40398 (isPrefixOf!0 lt!194363 (_2!5457 lt!193209))))

(declare-fun lt!195637 () Unit!7555)

(assert (=> d!40398 (= lt!195637 (choose!30 lt!194363 (_2!5457 lt!193209) (_2!5457 lt!193209)))))

(assert (=> d!40398 (isPrefixOf!0 lt!194363 (_2!5457 lt!193209))))

(assert (=> d!40398 (= (lemmaIsPrefixTransitive!0 lt!194363 (_2!5457 lt!193209) (_2!5457 lt!193209)) lt!195637)))

(declare-fun bs!9716 () Bool)

(assert (= bs!9716 d!40398))

(assert (=> bs!9716 m!187373))

(declare-fun m!189125 () Bool)

(assert (=> bs!9716 m!189125))

(assert (=> bs!9716 m!187373))

(assert (=> d!39646 d!40398))

(declare-fun d!40400 () Bool)

(declare-fun res!102714 () Bool)

(declare-fun e!81218 () Bool)

(assert (=> d!40400 (=> (not res!102714) (not e!81218))))

(assert (=> d!40400 (= res!102714 (= (size!2458 (buf!2898 (_1!5459 lt!194347))) (size!2458 (buf!2898 (_2!5459 lt!194347)))))))

(assert (=> d!40400 (= (isPrefixOf!0 (_1!5459 lt!194347) (_2!5459 lt!194347)) e!81218)))

(declare-fun b!123907 () Bool)

(declare-fun res!102715 () Bool)

(assert (=> b!123907 (=> (not res!102715) (not e!81218))))

(assert (=> b!123907 (= res!102715 (bvsle (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!194347))) (currentByte!5595 (_1!5459 lt!194347)) (currentBit!5590 (_1!5459 lt!194347))) (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!194347))) (currentByte!5595 (_2!5459 lt!194347)) (currentBit!5590 (_2!5459 lt!194347)))))))

(declare-fun b!123908 () Bool)

(declare-fun e!81219 () Bool)

(assert (=> b!123908 (= e!81218 e!81219)))

(declare-fun res!102713 () Bool)

(assert (=> b!123908 (=> res!102713 e!81219)))

(assert (=> b!123908 (= res!102713 (= (size!2458 (buf!2898 (_1!5459 lt!194347))) #b00000000000000000000000000000000))))

(declare-fun b!123909 () Bool)

(assert (=> b!123909 (= e!81219 (arrayBitRangesEq!0 (buf!2898 (_1!5459 lt!194347)) (buf!2898 (_2!5459 lt!194347)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!194347))) (currentByte!5595 (_1!5459 lt!194347)) (currentBit!5590 (_1!5459 lt!194347)))))))

(assert (= (and d!40400 res!102714) b!123907))

(assert (= (and b!123907 res!102715) b!123908))

(assert (= (and b!123908 (not res!102713)) b!123909))

(assert (=> b!123907 m!188895))

(assert (=> b!123907 m!188911))

(assert (=> b!123909 m!188895))

(assert (=> b!123909 m!188895))

(declare-fun m!189127 () Bool)

(assert (=> b!123909 m!189127))

(assert (=> d!39646 d!40400))

(declare-fun d!40402 () Bool)

(assert (=> d!40402 (isPrefixOf!0 lt!194363 (_2!5457 lt!193209))))

(declare-fun lt!195638 () Unit!7555)

(assert (=> d!40402 (= lt!195638 (choose!30 lt!194363 (_2!5457 lt!193212) (_2!5457 lt!193209)))))

(assert (=> d!40402 (isPrefixOf!0 lt!194363 (_2!5457 lt!193212))))

(assert (=> d!40402 (= (lemmaIsPrefixTransitive!0 lt!194363 (_2!5457 lt!193212) (_2!5457 lt!193209)) lt!195638)))

(declare-fun bs!9717 () Bool)

(assert (= bs!9717 d!40402))

(assert (=> bs!9717 m!187373))

(declare-fun m!189129 () Bool)

(assert (=> bs!9717 m!189129))

(declare-fun m!189131 () Bool)

(assert (=> bs!9717 m!189131))

(assert (=> d!39646 d!40402))

(declare-fun d!40404 () Bool)

(declare-fun res!102717 () Bool)

(declare-fun e!81220 () Bool)

(assert (=> d!40404 (=> (not res!102717) (not e!81220))))

(assert (=> d!40404 (= res!102717 (= (size!2458 (buf!2898 (_2!5457 lt!193212))) (size!2458 (buf!2898 (_2!5457 lt!193212)))))))

(assert (=> d!40404 (= (isPrefixOf!0 (_2!5457 lt!193212) (_2!5457 lt!193212)) e!81220)))

(declare-fun b!123910 () Bool)

(declare-fun res!102718 () Bool)

(assert (=> b!123910 (=> (not res!102718) (not e!81220))))

(assert (=> b!123910 (= res!102718 (bvsle (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212))) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212)))))))

(declare-fun b!123911 () Bool)

(declare-fun e!81221 () Bool)

(assert (=> b!123911 (= e!81220 e!81221)))

(declare-fun res!102716 () Bool)

(assert (=> b!123911 (=> res!102716 e!81221)))

(assert (=> b!123911 (= res!102716 (= (size!2458 (buf!2898 (_2!5457 lt!193212))) #b00000000000000000000000000000000))))

(declare-fun b!123912 () Bool)

(assert (=> b!123912 (= e!81221 (arrayBitRangesEq!0 (buf!2898 (_2!5457 lt!193212)) (buf!2898 (_2!5457 lt!193212)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!193212))) (currentByte!5595 (_2!5457 lt!193212)) (currentBit!5590 (_2!5457 lt!193212)))))))

(assert (= (and d!40404 res!102717) b!123910))

(assert (= (and b!123910 res!102718) b!123911))

(assert (= (and b!123911 (not res!102716)) b!123912))

(assert (=> b!123910 m!186513))

(assert (=> b!123910 m!186513))

(assert (=> b!123912 m!186513))

(assert (=> b!123912 m!186513))

(declare-fun m!189133 () Bool)

(assert (=> b!123912 m!189133))

(assert (=> d!39646 d!40404))

(declare-fun d!40406 () Bool)

(declare-fun e!81222 () Bool)

(assert (=> d!40406 e!81222))

(declare-fun res!102719 () Bool)

(assert (=> d!40406 (=> (not res!102719) (not e!81222))))

(declare-fun lt!195640 () (_ BitVec 64))

(declare-fun lt!195639 () BitStream!4390)

(assert (=> d!40406 (= res!102719 (= (bvadd lt!195640 (bvsub lt!194358 lt!194364)) (bitIndex!0 (size!2458 (buf!2898 lt!195639)) (currentByte!5595 lt!195639) (currentBit!5590 lt!195639))))))

(assert (=> d!40406 (or (not (= (bvand lt!195640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!194358 lt!194364) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195640 (bvsub lt!194358 lt!194364)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40406 (= lt!195640 (bitIndex!0 (size!2458 (buf!2898 (_2!5459 lt!194347))) (currentByte!5595 (_2!5459 lt!194347)) (currentBit!5590 (_2!5459 lt!194347))))))

(assert (=> d!40406 (= lt!195639 (_2!5457 (moveBitIndex!0 (_2!5459 lt!194347) (bvsub lt!194358 lt!194364))))))

(assert (=> d!40406 (moveBitIndexPrecond!0 (_2!5459 lt!194347) (bvsub lt!194358 lt!194364))))

(assert (=> d!40406 (= (withMovedBitIndex!0 (_2!5459 lt!194347) (bvsub lt!194358 lt!194364)) lt!195639)))

(declare-fun b!123913 () Bool)

(assert (=> b!123913 (= e!81222 (= (size!2458 (buf!2898 (_2!5459 lt!194347))) (size!2458 (buf!2898 lt!195639))))))

(assert (= (and d!40406 res!102719) b!123913))

(declare-fun m!189135 () Bool)

(assert (=> d!40406 m!189135))

(assert (=> d!40406 m!188911))

(declare-fun m!189137 () Bool)

(assert (=> d!40406 m!189137))

(declare-fun m!189139 () Bool)

(assert (=> d!40406 m!189139))

(assert (=> b!123146 d!40406))

(assert (=> b!123146 d!39492))

(assert (=> b!123146 d!39504))

(declare-fun d!40408 () Bool)

(declare-fun e!81223 () Bool)

(assert (=> d!40408 e!81223))

(declare-fun res!102721 () Bool)

(assert (=> d!40408 (=> (not res!102721) (not e!81223))))

(declare-fun lt!195641 () (_ BitVec 64))

(declare-fun lt!195646 () (_ BitVec 64))

(declare-fun lt!195645 () (_ BitVec 64))

(assert (=> d!40408 (= res!102721 (= lt!195646 (bvsub lt!195641 lt!195645)))))

(assert (=> d!40408 (or (= (bvand lt!195641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195645 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195641 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195641 lt!195645) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40408 (= lt!195645 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 lt!193518))) ((_ sign_extend 32) (currentByte!5595 lt!193518)) ((_ sign_extend 32) (currentBit!5590 lt!193518))))))

(declare-fun lt!195643 () (_ BitVec 64))

(declare-fun lt!195644 () (_ BitVec 64))

(assert (=> d!40408 (= lt!195641 (bvmul lt!195643 lt!195644))))

(assert (=> d!40408 (or (= lt!195643 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195644 (bvsdiv (bvmul lt!195643 lt!195644) lt!195643)))))

(assert (=> d!40408 (= lt!195644 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40408 (= lt!195643 ((_ sign_extend 32) (size!2458 (buf!2898 lt!193518))))))

(assert (=> d!40408 (= lt!195646 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 lt!193518)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 lt!193518))))))

(assert (=> d!40408 (invariant!0 (currentBit!5590 lt!193518) (currentByte!5595 lt!193518) (size!2458 (buf!2898 lt!193518)))))

(assert (=> d!40408 (= (bitIndex!0 (size!2458 (buf!2898 lt!193518)) (currentByte!5595 lt!193518) (currentBit!5590 lt!193518)) lt!195646)))

(declare-fun b!123914 () Bool)

(declare-fun res!102720 () Bool)

(assert (=> b!123914 (=> (not res!102720) (not e!81223))))

(assert (=> b!123914 (= res!102720 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195646))))

(declare-fun b!123915 () Bool)

(declare-fun lt!195642 () (_ BitVec 64))

(assert (=> b!123915 (= e!81223 (bvsle lt!195646 (bvmul lt!195642 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123915 (or (= lt!195642 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195642 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195642)))))

(assert (=> b!123915 (= lt!195642 ((_ sign_extend 32) (size!2458 (buf!2898 lt!193518))))))

(assert (= (and d!40408 res!102721) b!123914))

(assert (= (and b!123914 res!102720) b!123915))

(declare-fun m!189141 () Bool)

(assert (=> d!40408 m!189141))

(declare-fun m!189143 () Bool)

(assert (=> d!40408 m!189143))

(assert (=> d!39510 d!40408))

(declare-fun d!40410 () Bool)

(declare-fun e!81224 () Bool)

(assert (=> d!40410 e!81224))

(declare-fun res!102723 () Bool)

(assert (=> d!40410 (=> (not res!102723) (not e!81224))))

(declare-fun lt!195651 () (_ BitVec 64))

(declare-fun lt!195647 () (_ BitVec 64))

(declare-fun lt!195652 () (_ BitVec 64))

(assert (=> d!40410 (= res!102723 (= lt!195652 (bvsub lt!195647 lt!195651)))))

(assert (=> d!40410 (or (= (bvand lt!195647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195651 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!195647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!195647 lt!195651) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40410 (= lt!195651 (remainingBits!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5459 lt!193219)))) ((_ sign_extend 32) (currentByte!5595 (_1!5459 lt!193219))) ((_ sign_extend 32) (currentBit!5590 (_1!5459 lt!193219)))))))

(declare-fun lt!195649 () (_ BitVec 64))

(declare-fun lt!195650 () (_ BitVec 64))

(assert (=> d!40410 (= lt!195647 (bvmul lt!195649 lt!195650))))

(assert (=> d!40410 (or (= lt!195649 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!195650 (bvsdiv (bvmul lt!195649 lt!195650) lt!195649)))))

(assert (=> d!40410 (= lt!195650 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40410 (= lt!195649 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5459 lt!193219)))))))

(assert (=> d!40410 (= lt!195652 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5595 (_1!5459 lt!193219))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5590 (_1!5459 lt!193219)))))))

(assert (=> d!40410 (invariant!0 (currentBit!5590 (_1!5459 lt!193219)) (currentByte!5595 (_1!5459 lt!193219)) (size!2458 (buf!2898 (_1!5459 lt!193219))))))

(assert (=> d!40410 (= (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!193219))) (currentByte!5595 (_1!5459 lt!193219)) (currentBit!5590 (_1!5459 lt!193219))) lt!195652)))

(declare-fun b!123916 () Bool)

(declare-fun res!102722 () Bool)

(assert (=> b!123916 (=> (not res!102722) (not e!81224))))

(assert (=> b!123916 (= res!102722 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195652))))

(declare-fun b!123917 () Bool)

(declare-fun lt!195648 () (_ BitVec 64))

(assert (=> b!123917 (= e!81224 (bvsle lt!195652 (bvmul lt!195648 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123917 (or (= lt!195648 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!195648 #b0000000000000000000000000000000000000000000000000000000000001000) lt!195648)))))

(assert (=> b!123917 (= lt!195648 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5459 lt!193219)))))))

(assert (= (and d!40410 res!102723) b!123916))

(assert (= (and b!123916 res!102722) b!123917))

(declare-fun m!189145 () Bool)

(assert (=> d!40410 m!189145))

(declare-fun m!189147 () Bool)

(assert (=> d!40410 m!189147))

(assert (=> d!39510 d!40410))

(declare-fun d!40412 () Bool)

(declare-fun lt!195655 () (_ BitVec 32))

(assert (=> d!40412 (= lt!195655 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!195654 () (_ BitVec 32))

(assert (=> d!40412 (= lt!195654 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!81225 () Bool)

(assert (=> d!40412 e!81225))

(declare-fun res!102724 () Bool)

(assert (=> d!40412 (=> (not res!102724) (not e!81225))))

(assert (=> d!40412 (= res!102724 (moveBitIndexPrecond!0 (_1!5459 lt!193219) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun Unit!7660 () Unit!7555)

(declare-fun Unit!7661 () Unit!7555)

(declare-fun Unit!7662 () Unit!7555)

(assert (=> d!40412 (= (moveBitIndex!0 (_1!5459 lt!193219) #b0000000000000000000000000000000000000000000000000000000000000001) (ite (bvslt (bvadd (currentBit!5590 (_1!5459 lt!193219)) lt!195655) #b00000000000000000000000000000000) (tuple2!10385 Unit!7660 (BitStream!4391 (buf!2898 (_1!5459 lt!193219)) (bvsub (bvadd (currentByte!5595 (_1!5459 lt!193219)) lt!195654) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195655 (currentBit!5590 (_1!5459 lt!193219))))) (ite (bvsge (bvadd (currentBit!5590 (_1!5459 lt!193219)) lt!195655) #b00000000000000000000000000001000) (tuple2!10385 Unit!7661 (BitStream!4391 (buf!2898 (_1!5459 lt!193219)) (bvadd (currentByte!5595 (_1!5459 lt!193219)) lt!195654 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5590 (_1!5459 lt!193219)) lt!195655) #b00000000000000000000000000001000))) (tuple2!10385 Unit!7662 (BitStream!4391 (buf!2898 (_1!5459 lt!193219)) (bvadd (currentByte!5595 (_1!5459 lt!193219)) lt!195654) (bvadd (currentBit!5590 (_1!5459 lt!193219)) lt!195655))))))))

(declare-fun b!123918 () Bool)

(declare-fun e!81226 () Bool)

(assert (=> b!123918 (= e!81225 e!81226)))

(declare-fun res!102725 () Bool)

(assert (=> b!123918 (=> (not res!102725) (not e!81226))))

(declare-fun lt!195657 () (_ BitVec 64))

(declare-fun lt!195658 () tuple2!10384)

(assert (=> b!123918 (= res!102725 (= (bvadd lt!195657 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2458 (buf!2898 (_2!5457 lt!195658))) (currentByte!5595 (_2!5457 lt!195658)) (currentBit!5590 (_2!5457 lt!195658)))))))

(assert (=> b!123918 (or (not (= (bvand lt!195657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195657 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195657 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123918 (= lt!195657 (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!193219))) (currentByte!5595 (_1!5459 lt!193219)) (currentBit!5590 (_1!5459 lt!193219))))))

(declare-fun lt!195656 () (_ BitVec 32))

(declare-fun lt!195653 () (_ BitVec 32))

(declare-fun Unit!7663 () Unit!7555)

(declare-fun Unit!7664 () Unit!7555)

(declare-fun Unit!7665 () Unit!7555)

(assert (=> b!123918 (= lt!195658 (ite (bvslt (bvadd (currentBit!5590 (_1!5459 lt!193219)) lt!195656) #b00000000000000000000000000000000) (tuple2!10385 Unit!7663 (BitStream!4391 (buf!2898 (_1!5459 lt!193219)) (bvsub (bvadd (currentByte!5595 (_1!5459 lt!193219)) lt!195653) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!195656 (currentBit!5590 (_1!5459 lt!193219))))) (ite (bvsge (bvadd (currentBit!5590 (_1!5459 lt!193219)) lt!195656) #b00000000000000000000000000001000) (tuple2!10385 Unit!7664 (BitStream!4391 (buf!2898 (_1!5459 lt!193219)) (bvadd (currentByte!5595 (_1!5459 lt!193219)) lt!195653 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!5590 (_1!5459 lt!193219)) lt!195656) #b00000000000000000000000000001000))) (tuple2!10385 Unit!7665 (BitStream!4391 (buf!2898 (_1!5459 lt!193219)) (bvadd (currentByte!5595 (_1!5459 lt!193219)) lt!195653) (bvadd (currentBit!5590 (_1!5459 lt!193219)) lt!195656))))))))

(assert (=> b!123918 (= lt!195656 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123918 (= lt!195653 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!123919 () Bool)

(assert (=> b!123919 (= e!81226 (and (= (size!2458 (buf!2898 (_1!5459 lt!193219))) (size!2458 (buf!2898 (_2!5457 lt!195658)))) (= (buf!2898 (_1!5459 lt!193219)) (buf!2898 (_2!5457 lt!195658)))))))

(assert (= (and d!40412 res!102724) b!123918))

(assert (= (and b!123918 res!102725) b!123919))

(assert (=> d!40412 m!186775))

(declare-fun m!189149 () Bool)

(assert (=> b!123918 m!189149))

(assert (=> b!123918 m!186771))

(assert (=> d!39510 d!40412))

(declare-fun d!40414 () Bool)

(declare-fun res!102726 () Bool)

(declare-fun e!81227 () Bool)

(assert (=> d!40414 (=> (not res!102726) (not e!81227))))

(assert (=> d!40414 (= res!102726 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5459 lt!193219))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5459 lt!193219))))))))))

(assert (=> d!40414 (= (moveBitIndexPrecond!0 (_1!5459 lt!193219) #b0000000000000000000000000000000000000000000000000000000000000001) e!81227)))

(declare-fun b!123920 () Bool)

(declare-fun lt!195659 () (_ BitVec 64))

(assert (=> b!123920 (= e!81227 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!195659) (bvsle lt!195659 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5459 lt!193219))))))))))

(assert (=> b!123920 (= lt!195659 (bvadd (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!193219))) (currentByte!5595 (_1!5459 lt!193219)) (currentBit!5590 (_1!5459 lt!193219))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!40414 res!102726) b!123920))

(assert (=> b!123920 m!186771))

(assert (=> d!39510 d!40414))

(assert (=> d!39540 d!39668))

(declare-fun d!40416 () Bool)

(assert (=> d!40416 (isPrefixOf!0 thiss!1305 (_2!5457 lt!193209))))

(assert (=> d!40416 true))

(declare-fun _$15!198 () Unit!7555)

(assert (=> d!40416 (= (choose!30 thiss!1305 (_2!5457 lt!193212) (_2!5457 lt!193209)) _$15!198)))

(declare-fun bs!9718 () Bool)

(assert (= bs!9718 d!40416))

(assert (=> bs!9718 m!186545))

(assert (=> d!39540 d!40416))

(assert (=> d!39540 d!39682))

(declare-fun b!123921 () Bool)

(declare-fun e!81229 () Bool)

(declare-fun e!81230 () Bool)

(assert (=> b!123921 (= e!81229 e!81230)))

(declare-fun res!102728 () Bool)

(declare-fun lt!195662 () (_ BitVec 32))

(declare-fun lt!195660 () tuple4!92)

(assert (=> b!123921 (= res!102728 (byteRangesEq!0 (select (arr!3051 (buf!2898 thiss!1305)) (_3!267 lt!195660)) (select (arr!3051 (buf!2898 (_2!5457 lt!193212))) (_3!267 lt!195660)) lt!195662 #b00000000000000000000000000001000))))

(assert (=> b!123921 (=> (not res!102728) (not e!81230))))

(declare-fun b!123922 () Bool)

(declare-fun res!102731 () Bool)

(declare-fun lt!195661 () (_ BitVec 32))

(assert (=> b!123922 (= res!102731 (= lt!195661 #b00000000000000000000000000000000))))

(declare-fun e!81231 () Bool)

(assert (=> b!123922 (=> res!102731 e!81231)))

(assert (=> b!123922 (= e!81230 e!81231)))

(declare-fun b!123923 () Bool)

(declare-fun call!1628 () Bool)

(assert (=> b!123923 (= e!81229 call!1628)))

(declare-fun b!123924 () Bool)

(declare-fun e!81232 () Bool)

(assert (=> b!123924 (= e!81232 e!81229)))

(declare-fun c!7417 () Bool)

(assert (=> b!123924 (= c!7417 (= (_3!267 lt!195660) (_4!46 lt!195660)))))

(declare-fun d!40418 () Bool)

(declare-fun res!102729 () Bool)

(declare-fun e!81228 () Bool)

(assert (=> d!40418 (=> res!102729 e!81228)))

(assert (=> d!40418 (= res!102729 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(assert (=> d!40418 (= (arrayBitRangesEq!0 (buf!2898 thiss!1305) (buf!2898 (_2!5457 lt!193212)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))) e!81228)))

(declare-fun e!81233 () Bool)

(declare-fun b!123925 () Bool)

(assert (=> b!123925 (= e!81233 (arrayRangesEq!47 (buf!2898 thiss!1305) (buf!2898 (_2!5457 lt!193212)) (_1!5477 lt!195660) (_2!5477 lt!195660)))))

(declare-fun b!123926 () Bool)

(assert (=> b!123926 (= e!81228 e!81232)))

(declare-fun res!102730 () Bool)

(assert (=> b!123926 (=> (not res!102730) (not e!81232))))

(assert (=> b!123926 (= res!102730 e!81233)))

(declare-fun res!102727 () Bool)

(assert (=> b!123926 (=> res!102727 e!81233)))

(assert (=> b!123926 (= res!102727 (bvsge (_1!5477 lt!195660) (_2!5477 lt!195660)))))

(assert (=> b!123926 (= lt!195661 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123926 (= lt!195662 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!123926 (= lt!195660 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2458 (buf!2898 thiss!1305)) (currentByte!5595 thiss!1305) (currentBit!5590 thiss!1305))))))

(declare-fun b!123927 () Bool)

(assert (=> b!123927 (= e!81231 call!1628)))

(declare-fun bm!1625 () Bool)

(assert (=> bm!1625 (= call!1628 (byteRangesEq!0 (ite c!7417 (select (arr!3051 (buf!2898 thiss!1305)) (_3!267 lt!195660)) (select (arr!3051 (buf!2898 thiss!1305)) (_4!46 lt!195660))) (ite c!7417 (select (arr!3051 (buf!2898 (_2!5457 lt!193212))) (_3!267 lt!195660)) (select (arr!3051 (buf!2898 (_2!5457 lt!193212))) (_4!46 lt!195660))) (ite c!7417 lt!195662 #b00000000000000000000000000000000) lt!195661))))

(assert (= (and d!40418 (not res!102729)) b!123926))

(assert (= (and b!123926 (not res!102727)) b!123925))

(assert (= (and b!123926 res!102730) b!123924))

(assert (= (and b!123924 c!7417) b!123923))

(assert (= (and b!123924 (not c!7417)) b!123921))

(assert (= (and b!123921 res!102728) b!123922))

(assert (= (and b!123922 (not res!102731)) b!123927))

(assert (= (or b!123923 b!123927) bm!1625))

(declare-fun m!189151 () Bool)

(assert (=> b!123921 m!189151))

(declare-fun m!189153 () Bool)

(assert (=> b!123921 m!189153))

(assert (=> b!123921 m!189151))

(assert (=> b!123921 m!189153))

(declare-fun m!189155 () Bool)

(assert (=> b!123921 m!189155))

(declare-fun m!189157 () Bool)

(assert (=> b!123925 m!189157))

(assert (=> b!123926 m!186517))

(assert (=> b!123926 m!188619))

(assert (=> bm!1625 m!189151))

(assert (=> bm!1625 m!189153))

(declare-fun m!189159 () Bool)

(assert (=> bm!1625 m!189159))

(declare-fun m!189161 () Bool)

(assert (=> bm!1625 m!189161))

(declare-fun m!189163 () Bool)

(assert (=> bm!1625 m!189163))

(assert (=> b!123172 d!40418))

(assert (=> b!123172 d!39518))

(declare-fun d!40420 () Bool)

(declare-fun e!81234 () Bool)

(assert (=> d!40420 e!81234))

(declare-fun res!102732 () Bool)

(assert (=> d!40420 (=> (not res!102732) (not e!81234))))

(assert (=> d!40420 (= res!102732 (= (buf!2898 (_2!5457 (increaseBitIndex!0 (_1!5459 lt!193219)))) (buf!2898 (_1!5459 lt!193219))))))

(declare-fun lt!195666 () Bool)

(assert (=> d!40420 (= lt!195666 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (_1!5459 lt!193219))) (currentByte!5595 (_1!5459 lt!193219)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (_1!5459 lt!193219))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195663 () tuple2!10416)

(assert (=> d!40420 (= lt!195663 (tuple2!10417 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (_1!5459 lt!193219))) (currentByte!5595 (_1!5459 lt!193219)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (_1!5459 lt!193219))))) #b00000000000000000000000000000000)) (_2!5457 (increaseBitIndex!0 (_1!5459 lt!193219)))))))

(assert (=> d!40420 (validate_offset_bit!0 ((_ sign_extend 32) (size!2458 (buf!2898 (_1!5459 lt!193219)))) ((_ sign_extend 32) (currentByte!5595 (_1!5459 lt!193219))) ((_ sign_extend 32) (currentBit!5590 (_1!5459 lt!193219))))))

(assert (=> d!40420 (= (readBit!0 (_1!5459 lt!193219)) lt!195663)))

(declare-fun lt!195668 () (_ BitVec 64))

(declare-fun lt!195665 () (_ BitVec 64))

(declare-fun b!123928 () Bool)

(assert (=> b!123928 (= e!81234 (= (bitIndex!0 (size!2458 (buf!2898 (_2!5457 (increaseBitIndex!0 (_1!5459 lt!193219))))) (currentByte!5595 (_2!5457 (increaseBitIndex!0 (_1!5459 lt!193219)))) (currentBit!5590 (_2!5457 (increaseBitIndex!0 (_1!5459 lt!193219))))) (bvadd lt!195668 lt!195665)))))

(assert (=> b!123928 (or (not (= (bvand lt!195668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!195665 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!195668 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!195668 lt!195665) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!123928 (= lt!195665 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!123928 (= lt!195668 (bitIndex!0 (size!2458 (buf!2898 (_1!5459 lt!193219))) (currentByte!5595 (_1!5459 lt!193219)) (currentBit!5590 (_1!5459 lt!193219))))))

(declare-fun lt!195669 () Bool)

(assert (=> b!123928 (= lt!195669 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (_1!5459 lt!193219))) (currentByte!5595 (_1!5459 lt!193219)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (_1!5459 lt!193219))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195664 () Bool)

(assert (=> b!123928 (= lt!195664 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (_1!5459 lt!193219))) (currentByte!5595 (_1!5459 lt!193219)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (_1!5459 lt!193219))))) #b00000000000000000000000000000000)))))

(declare-fun lt!195667 () Bool)

(assert (=> b!123928 (= lt!195667 (not (= (bvand ((_ sign_extend 24) (select (arr!3051 (buf!2898 (_1!5459 lt!193219))) (currentByte!5595 (_1!5459 lt!193219)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!5590 (_1!5459 lt!193219))))) #b00000000000000000000000000000000)))))

(assert (= (and d!40420 res!102732) b!123928))

(declare-fun m!189165 () Bool)

(assert (=> d!40420 m!189165))

(declare-fun m!189167 () Bool)

(assert (=> d!40420 m!189167))

(declare-fun m!189169 () Bool)

(assert (=> d!40420 m!189169))

(declare-fun m!189171 () Bool)

(assert (=> d!40420 m!189171))

(assert (=> b!123928 m!189169))

(assert (=> b!123928 m!189165))

(declare-fun m!189173 () Bool)

(assert (=> b!123928 m!189173))

(assert (=> b!123928 m!189167))

(assert (=> b!123928 m!186771))

(assert (=> d!39636 d!40420))

(push 1)

(assert (not b!123904))

(assert (not b!123928))

(assert (not d!40220))

(assert (not b!123832))

(assert (not d!40244))

(assert (not b!123810))

(assert (not b!123926))

(assert (not b!123921))

(assert (not b!123763))

(assert (not b!123704))

(assert (not b!123721))

(assert (not b!123897))

(assert (not d!40364))

(assert (not b!123741))

(assert (not b!123881))

(assert (not b!123877))

(assert (not b!123925))

(assert (not b!123738))

(assert (not b!123811))

(assert (not b!123705))

(assert (not d!40222))

(assert (not b!123805))

(assert (not b!123804))

(assert (not d!40292))

(assert (not d!40320))

(assert (not d!40242))

(assert (not d!40330))

(assert (not b!123901))

(assert (not b!123834))

(assert (not d!40238))

(assert (not d!40200))

(assert (not d!40212))

(assert (not b!123920))

(assert (not d!40262))

(assert (not b!123821))

(assert (not b!123711))

(assert (not d!40210))

(assert (not b!123700))

(assert (not b!123709))

(assert (not d!40384))

(assert (not b!123824))

(assert (not d!40402))

(assert (not d!40328))

(assert (not b!123786))

(assert (not b!123853))

(assert (not b!123718))

(assert (not b!123814))

(assert (not b!123876))

(assert (not d!40416))

(assert (not b!123723))

(assert (not b!123898))

(assert (not d!40370))

(assert (not d!40406))

(assert (not b!123827))

(assert (not d!40198))

(assert (not b!123816))

(assert (not d!40190))

(assert (not d!40218))

(assert (not d!40300))

(assert (not bm!1625))

(assert (not d!40354))

(assert (not d!40284))

(assert (not d!40382))

(assert (not b!123736))

(assert (not b!123785))

(assert (not d!40250))

(assert (not b!123825))

(assert (not d!40374))

(assert (not bm!1621))

(assert (not d!40342))

(assert (not d!40178))

(assert (not b!123735))

(assert (not d!40272))

(assert (not bm!1623))

(assert (not d!40312))

(assert (not b!123906))

(assert (not d!40214))

(assert (not d!40410))

(assert (not d!40298))

(assert (not d!40226))

(assert (not d!40390))

(assert (not bm!1622))

(assert (not b!123909))

(assert (not b!123699))

(assert (not b!123851))

(assert (not d!40398))

(assert (not d!40264))

(assert (not b!123789))

(assert (not d!40282))

(assert (not b!123758))

(assert (not b!123744))

(assert (not b!123850))

(assert (not d!40236))

(assert (not b!123837))

(assert (not b!123882))

(assert (not b!123907))

(assert (not b!123918))

(assert (not d!40362))

(assert (not b!123745))

(assert (not d!40332))

(assert (not b!123799))

(assert (not b!123801))

(assert (not bm!1624))

(assert (not b!123747))

(assert (not d!40380))

(assert (not d!40412))

(assert (not d!40216))

(assert (not d!40230))

(assert (not b!123836))

(assert (not d!40270))

(assert (not b!123706))

(assert (not d!40326))

(assert (not d!40334))

(assert (not d!40224))

(assert (not b!123889))

(assert (not d!40176))

(assert (not d!40248))

(assert (not b!123819))

(assert (not b!123823))

(assert (not b!123739))

(assert (not b!123749))

(assert (not b!123740))

(assert (not b!123831))

(assert (not b!123813))

(assert (not b!123752))

(assert (not b!123838))

(assert (not b!123903))

(assert (not b!123802))

(assert (not b!123761))

(assert (not d!40252))

(assert (not b!123753))

(assert (not b!123780))

(assert (not b!123820))

(assert (not b!123854))

(assert (not d!40340))

(assert (not b!123760))

(assert (not b!123695))

(assert (not b!123792))

(assert (not d!40346))

(assert (not b!123835))

(assert (not d!40184))

(assert (not d!40350))

(assert (not d!40260))

(assert (not d!40280))

(assert (not d!40194))

(assert (not d!40232))

(assert (not b!123719))

(assert (not b!123852))

(assert (not d!40408))

(assert (not d!40314))

(assert (not b!123900))

(assert (not b!123708))

(assert (not b!123912))

(assert (not b!123787))

(assert (not b!123755))

(assert (not b!123750))

(assert (not d!40392))

(assert (not b!123746))

(assert (not b!123830))

(assert (not d!40286))

(assert (not b!123790))

(assert (not d!40254))

(assert (not d!40358))

(assert (not b!123884))

(assert (not b!123720))

(assert (not b!123725))

(assert (not d!40246))

(assert (not d!40420))

(assert (not b!123807))

(assert (not d!40352))

(assert (not d!40344))

(assert (not d!40180))

(assert (not b!123871))

(assert (not b!123748))

(assert (not d!40318))

(assert (not b!123808))

(assert (not b!123754))

(assert (not d!40360))

(assert (not b!123888))

(assert (not b!123782))

(assert (not b!123910))

(assert (not b!123895))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

