; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27598 () Bool)

(assert start!27598)

(declare-datatypes ((array!6520 0))(
  ( (array!6521 (arr!3665 (Array (_ BitVec 32) (_ BitVec 8))) (size!2952 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5162 0))(
  ( (BitStream!5163 (buf!3376 array!6520) (currentByte!6245 (_ BitVec 32)) (currentBit!6240 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12638 0))(
  ( (tuple2!12639 (_1!6652 BitStream!5162) (_2!6652 BitStream!5162)) )
))
(declare-fun lt!220517 () tuple2!12638)

(declare-datatypes ((tuple2!12640 0))(
  ( (tuple2!12641 (_1!6653 BitStream!5162) (_2!6653 (_ BitVec 8))) )
))
(declare-fun lt!220520 () tuple2!12640)

(declare-fun e!94761 () Bool)

(declare-fun arr!237 () array!6520)

(declare-fun b!142260 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!142260 (= e!94761 (and (= (_2!6653 lt!220520) (select (arr!3665 arr!237) from!447)) (= (_1!6653 lt!220520) (_2!6652 lt!220517))))))

(declare-fun readBytePure!0 (BitStream!5162) tuple2!12640)

(assert (=> b!142260 (= lt!220520 (readBytePure!0 (_1!6652 lt!220517)))))

(declare-fun thiss!1634 () BitStream!5162)

(declare-datatypes ((Unit!8892 0))(
  ( (Unit!8893) )
))
(declare-datatypes ((tuple2!12642 0))(
  ( (tuple2!12643 (_1!6654 Unit!8892) (_2!6654 BitStream!5162)) )
))
(declare-fun lt!220519 () tuple2!12642)

(declare-fun reader!0 (BitStream!5162 BitStream!5162) tuple2!12638)

(assert (=> b!142260 (= lt!220517 (reader!0 thiss!1634 (_2!6654 lt!220519)))))

(declare-fun b!142261 () Bool)

(declare-fun e!94763 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142261 (= e!94763 (invariant!0 (currentBit!6240 thiss!1634) (currentByte!6245 thiss!1634) (size!2952 (buf!3376 (_2!6654 lt!220519)))))))

(declare-fun b!142262 () Bool)

(declare-fun e!94770 () Bool)

(declare-fun array_inv!2741 (array!6520) Bool)

(assert (=> b!142262 (= e!94770 (array_inv!2741 (buf!3376 thiss!1634)))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!12644 0))(
  ( (tuple2!12645 (_1!6655 BitStream!5162) (_2!6655 array!6520)) )
))
(declare-fun lt!220518 () tuple2!12644)

(declare-fun e!94765 () Bool)

(declare-fun b!142263 () Bool)

(declare-fun arrayRangesEq!268 (array!6520 array!6520 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142263 (= e!94765 (not (arrayRangesEq!268 arr!237 (_2!6655 lt!220518) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!142264 () Bool)

(declare-fun res!118742 () Bool)

(declare-fun e!94769 () Bool)

(assert (=> b!142264 (=> (not res!118742) (not e!94769))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142264 (= res!118742 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2952 (buf!3376 thiss!1634))) ((_ sign_extend 32) (currentByte!6245 thiss!1634)) ((_ sign_extend 32) (currentBit!6240 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!142265 () Bool)

(declare-fun res!118737 () Bool)

(assert (=> b!142265 (=> (not res!118737) (not e!94769))))

(assert (=> b!142265 (= res!118737 (bvslt from!447 to!404))))

(declare-fun b!142266 () Bool)

(declare-fun e!94766 () Bool)

(assert (=> b!142266 (= e!94769 (not e!94766))))

(declare-fun res!118732 () Bool)

(assert (=> b!142266 (=> res!118732 e!94766)))

(declare-fun lt!220521 () (_ BitVec 64))

(assert (=> b!142266 (= res!118732 (bvsgt lt!220521 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142266 (= lt!220521 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634))))))

(assert (=> b!142266 e!94763))

(declare-fun res!118741 () Bool)

(assert (=> b!142266 (=> (not res!118741) (not e!94763))))

(declare-fun lt!220514 () tuple2!12642)

(declare-fun isPrefixOf!0 (BitStream!5162 BitStream!5162) Bool)

(assert (=> b!142266 (= res!118741 (isPrefixOf!0 thiss!1634 (_2!6654 lt!220514)))))

(declare-fun lt!220515 () Unit!8892)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5162 BitStream!5162 BitStream!5162) Unit!8892)

(assert (=> b!142266 (= lt!220515 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6654 lt!220519) (_2!6654 lt!220514)))))

(declare-fun e!94762 () Bool)

(assert (=> b!142266 e!94762))

(declare-fun res!118734 () Bool)

(assert (=> b!142266 (=> (not res!118734) (not e!94762))))

(assert (=> b!142266 (= res!118734 (= (size!2952 (buf!3376 (_2!6654 lt!220519))) (size!2952 (buf!3376 (_2!6654 lt!220514)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5162 array!6520 (_ BitVec 32) (_ BitVec 32)) tuple2!12642)

(assert (=> b!142266 (= lt!220514 (appendByteArrayLoop!0 (_2!6654 lt!220519) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!142266 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!220516 () Unit!8892)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5162 BitStream!5162 (_ BitVec 64) (_ BitVec 32)) Unit!8892)

(assert (=> b!142266 (= lt!220516 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6654 lt!220519) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!142266 e!94761))

(declare-fun res!118743 () Bool)

(assert (=> b!142266 (=> (not res!118743) (not e!94761))))

(assert (=> b!142266 (= res!118743 (= (size!2952 (buf!3376 thiss!1634)) (size!2952 (buf!3376 (_2!6654 lt!220519)))))))

(declare-fun appendByte!0 (BitStream!5162 (_ BitVec 8)) tuple2!12642)

(assert (=> b!142266 (= lt!220519 (appendByte!0 thiss!1634 (select (arr!3665 arr!237) from!447)))))

(declare-fun b!142267 () Bool)

(declare-fun res!118738 () Bool)

(assert (=> b!142267 (=> res!118738 e!94766)))

(assert (=> b!142267 (= res!118738 (bvsgt lt!220521 (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220514))) (currentByte!6245 (_2!6654 lt!220514)) (currentBit!6240 (_2!6654 lt!220514)))))))

(declare-fun b!142269 () Bool)

(declare-fun e!94767 () Bool)

(assert (=> b!142269 (= e!94762 e!94767)))

(declare-fun res!118731 () Bool)

(assert (=> b!142269 (=> (not res!118731) (not e!94767))))

(declare-fun lt!220522 () (_ BitVec 64))

(assert (=> b!142269 (= res!118731 (= (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220514))) (currentByte!6245 (_2!6654 lt!220514)) (currentBit!6240 (_2!6654 lt!220514))) (bvadd (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!220522))))))

(assert (=> b!142269 (= lt!220522 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!142270 () Bool)

(assert (=> b!142270 (= e!94767 (not e!94765))))

(declare-fun res!118735 () Bool)

(assert (=> b!142270 (=> res!118735 e!94765)))

(declare-fun lt!220523 () tuple2!12638)

(assert (=> b!142270 (= res!118735 (or (not (= (size!2952 (_2!6655 lt!220518)) (size!2952 arr!237))) (not (= (_1!6655 lt!220518) (_2!6652 lt!220523)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5162 array!6520 (_ BitVec 32) (_ BitVec 32)) tuple2!12644)

(assert (=> b!142270 (= lt!220518 (readByteArrayLoopPure!0 (_1!6652 lt!220523) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142270 (validate_offset_bits!1 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220514)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519))) lt!220522)))

(declare-fun lt!220513 () Unit!8892)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5162 array!6520 (_ BitVec 64)) Unit!8892)

(assert (=> b!142270 (= lt!220513 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6654 lt!220519) (buf!3376 (_2!6654 lt!220514)) lt!220522))))

(assert (=> b!142270 (= lt!220523 (reader!0 (_2!6654 lt!220519) (_2!6654 lt!220514)))))

(declare-fun b!142271 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6520 array!6520 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142271 (= e!94766 (arrayBitRangesEq!0 (buf!3376 (_2!6654 lt!220519)) (buf!3376 (_2!6654 lt!220514)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!220521))))

(declare-fun b!142272 () Bool)

(declare-fun res!118739 () Bool)

(assert (=> b!142272 (=> (not res!118739) (not e!94767))))

(assert (=> b!142272 (= res!118739 (isPrefixOf!0 (_2!6654 lt!220519) (_2!6654 lt!220514)))))

(declare-fun b!142273 () Bool)

(declare-fun res!118740 () Bool)

(assert (=> b!142273 (=> (not res!118740) (not e!94769))))

(assert (=> b!142273 (= res!118740 (invariant!0 (currentBit!6240 thiss!1634) (currentByte!6245 thiss!1634) (size!2952 (buf!3376 thiss!1634))))))

(declare-fun b!142274 () Bool)

(declare-fun res!118736 () Bool)

(assert (=> b!142274 (=> (not res!118736) (not e!94761))))

(assert (=> b!142274 (= res!118736 (= (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2952 (buf!3376 thiss!1634)) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634)))))))

(declare-fun b!142268 () Bool)

(declare-fun res!118744 () Bool)

(assert (=> b!142268 (=> (not res!118744) (not e!94761))))

(assert (=> b!142268 (= res!118744 (isPrefixOf!0 thiss!1634 (_2!6654 lt!220519)))))

(declare-fun res!118733 () Bool)

(assert (=> start!27598 (=> (not res!118733) (not e!94769))))

(assert (=> start!27598 (= res!118733 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2952 arr!237))))))

(assert (=> start!27598 e!94769))

(assert (=> start!27598 true))

(assert (=> start!27598 (array_inv!2741 arr!237)))

(declare-fun inv!12 (BitStream!5162) Bool)

(assert (=> start!27598 (and (inv!12 thiss!1634) e!94770)))

(assert (= (and start!27598 res!118733) b!142264))

(assert (= (and b!142264 res!118742) b!142265))

(assert (= (and b!142265 res!118737) b!142273))

(assert (= (and b!142273 res!118740) b!142266))

(assert (= (and b!142266 res!118743) b!142274))

(assert (= (and b!142274 res!118736) b!142268))

(assert (= (and b!142268 res!118744) b!142260))

(assert (= (and b!142266 res!118734) b!142269))

(assert (= (and b!142269 res!118731) b!142272))

(assert (= (and b!142272 res!118739) b!142270))

(assert (= (and b!142270 (not res!118735)) b!142263))

(assert (= (and b!142266 res!118741) b!142261))

(assert (= (and b!142266 (not res!118732)) b!142267))

(assert (= (and b!142267 (not res!118738)) b!142271))

(assert (= start!27598 b!142262))

(declare-fun m!218423 () Bool)

(assert (=> b!142260 m!218423))

(declare-fun m!218425 () Bool)

(assert (=> b!142260 m!218425))

(declare-fun m!218427 () Bool)

(assert (=> b!142260 m!218427))

(declare-fun m!218429 () Bool)

(assert (=> b!142266 m!218429))

(declare-fun m!218431 () Bool)

(assert (=> b!142266 m!218431))

(declare-fun m!218433 () Bool)

(assert (=> b!142266 m!218433))

(declare-fun m!218435 () Bool)

(assert (=> b!142266 m!218435))

(declare-fun m!218437 () Bool)

(assert (=> b!142266 m!218437))

(declare-fun m!218439 () Bool)

(assert (=> b!142266 m!218439))

(assert (=> b!142266 m!218423))

(declare-fun m!218441 () Bool)

(assert (=> b!142266 m!218441))

(assert (=> b!142266 m!218423))

(declare-fun m!218443 () Bool)

(assert (=> b!142272 m!218443))

(declare-fun m!218445 () Bool)

(assert (=> b!142269 m!218445))

(declare-fun m!218447 () Bool)

(assert (=> b!142269 m!218447))

(declare-fun m!218449 () Bool)

(assert (=> start!27598 m!218449))

(declare-fun m!218451 () Bool)

(assert (=> start!27598 m!218451))

(declare-fun m!218453 () Bool)

(assert (=> b!142261 m!218453))

(declare-fun m!218455 () Bool)

(assert (=> b!142262 m!218455))

(assert (=> b!142267 m!218445))

(declare-fun m!218457 () Bool)

(assert (=> b!142263 m!218457))

(assert (=> b!142274 m!218447))

(declare-fun m!218459 () Bool)

(assert (=> b!142274 m!218459))

(declare-fun m!218461 () Bool)

(assert (=> b!142270 m!218461))

(declare-fun m!218463 () Bool)

(assert (=> b!142270 m!218463))

(declare-fun m!218465 () Bool)

(assert (=> b!142270 m!218465))

(declare-fun m!218467 () Bool)

(assert (=> b!142270 m!218467))

(declare-fun m!218469 () Bool)

(assert (=> b!142271 m!218469))

(declare-fun m!218471 () Bool)

(assert (=> b!142264 m!218471))

(declare-fun m!218473 () Bool)

(assert (=> b!142273 m!218473))

(declare-fun m!218475 () Bool)

(assert (=> b!142268 m!218475))

(push 1)

(assert (not b!142272))

(assert (not b!142263))

(assert (not b!142271))

(assert (not b!142269))

(assert (not b!142264))

(assert (not b!142273))

(assert (not b!142267))

(assert (not b!142274))

(assert (not b!142262))

(assert (not b!142270))

(assert (not b!142266))

(assert (not start!27598))

(assert (not b!142261))

(assert (not b!142260))

(assert (not b!142268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45549 () Bool)

(declare-fun e!94773 () Bool)

(assert (=> d!45549 e!94773))

(declare-fun res!118750 () Bool)

(assert (=> d!45549 (=> (not res!118750) (not e!94773))))

(declare-fun lt!220540 () (_ BitVec 64))

(declare-fun lt!220541 () (_ BitVec 64))

(declare-fun lt!220537 () (_ BitVec 64))

(assert (=> d!45549 (= res!118750 (= lt!220541 (bvsub lt!220537 lt!220540)))))

(assert (=> d!45549 (or (= (bvand lt!220537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220540 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220537 lt!220540) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45549 (= lt!220540 (remainingBits!0 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220514)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220514))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220514)))))))

(declare-fun lt!220539 () (_ BitVec 64))

(declare-fun lt!220536 () (_ BitVec 64))

(assert (=> d!45549 (= lt!220537 (bvmul lt!220539 lt!220536))))

(assert (=> d!45549 (or (= lt!220539 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220536 (bvsdiv (bvmul lt!220539 lt!220536) lt!220539)))))

(assert (=> d!45549 (= lt!220536 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45549 (= lt!220539 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220514)))))))

(assert (=> d!45549 (= lt!220541 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220514))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220514)))))))

(assert (=> d!45549 (invariant!0 (currentBit!6240 (_2!6654 lt!220514)) (currentByte!6245 (_2!6654 lt!220514)) (size!2952 (buf!3376 (_2!6654 lt!220514))))))

(assert (=> d!45549 (= (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220514))) (currentByte!6245 (_2!6654 lt!220514)) (currentBit!6240 (_2!6654 lt!220514))) lt!220541)))

(declare-fun b!142279 () Bool)

(declare-fun res!118749 () Bool)

(assert (=> b!142279 (=> (not res!118749) (not e!94773))))

(assert (=> b!142279 (= res!118749 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220541))))

(declare-fun b!142280 () Bool)

(declare-fun lt!220538 () (_ BitVec 64))

(assert (=> b!142280 (= e!94773 (bvsle lt!220541 (bvmul lt!220538 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142280 (or (= lt!220538 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220538 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220538)))))

(assert (=> b!142280 (= lt!220538 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220514)))))))

(assert (= (and d!45549 res!118750) b!142279))

(assert (= (and b!142279 res!118749) b!142280))

(declare-fun m!218477 () Bool)

(assert (=> d!45549 m!218477))

(declare-fun m!218479 () Bool)

(assert (=> d!45549 m!218479))

(assert (=> b!142267 d!45549))

(assert (=> b!142269 d!45549))

(declare-fun d!45553 () Bool)

(declare-fun e!94774 () Bool)

(assert (=> d!45553 e!94774))

(declare-fun res!118752 () Bool)

(assert (=> d!45553 (=> (not res!118752) (not e!94774))))

(declare-fun lt!220546 () (_ BitVec 64))

(declare-fun lt!220547 () (_ BitVec 64))

(declare-fun lt!220543 () (_ BitVec 64))

(assert (=> d!45553 (= res!118752 (= lt!220547 (bvsub lt!220543 lt!220546)))))

(assert (=> d!45553 (or (= (bvand lt!220543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220543 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220543 lt!220546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45553 (= lt!220546 (remainingBits!0 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519)))))))

(declare-fun lt!220545 () (_ BitVec 64))

(declare-fun lt!220542 () (_ BitVec 64))

(assert (=> d!45553 (= lt!220543 (bvmul lt!220545 lt!220542))))

(assert (=> d!45553 (or (= lt!220545 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220542 (bvsdiv (bvmul lt!220545 lt!220542) lt!220545)))))

(assert (=> d!45553 (= lt!220542 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45553 (= lt!220545 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))))))

(assert (=> d!45553 (= lt!220547 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519)))))))

(assert (=> d!45553 (invariant!0 (currentBit!6240 (_2!6654 lt!220519)) (currentByte!6245 (_2!6654 lt!220519)) (size!2952 (buf!3376 (_2!6654 lt!220519))))))

(assert (=> d!45553 (= (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519))) lt!220547)))

(declare-fun b!142281 () Bool)

(declare-fun res!118751 () Bool)

(assert (=> b!142281 (=> (not res!118751) (not e!94774))))

(assert (=> b!142281 (= res!118751 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220547))))

(declare-fun b!142282 () Bool)

(declare-fun lt!220544 () (_ BitVec 64))

(assert (=> b!142282 (= e!94774 (bvsle lt!220547 (bvmul lt!220544 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142282 (or (= lt!220544 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220544 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220544)))))

(assert (=> b!142282 (= lt!220544 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))))))

(assert (= (and d!45553 res!118752) b!142281))

(assert (= (and b!142281 res!118751) b!142282))

(declare-fun m!218481 () Bool)

(assert (=> d!45553 m!218481))

(declare-fun m!218483 () Bool)

(assert (=> d!45553 m!218483))

(assert (=> b!142269 d!45553))

(declare-fun d!45555 () Bool)

(declare-fun res!118769 () Bool)

(declare-fun e!94792 () Bool)

(assert (=> d!45555 (=> (not res!118769) (not e!94792))))

(assert (=> d!45555 (= res!118769 (= (size!2952 (buf!3376 thiss!1634)) (size!2952 (buf!3376 (_2!6654 lt!220519)))))))

(assert (=> d!45555 (= (isPrefixOf!0 thiss!1634 (_2!6654 lt!220519)) e!94792)))

(declare-fun b!142303 () Bool)

(declare-fun res!118771 () Bool)

(assert (=> b!142303 (=> (not res!118771) (not e!94792))))

(assert (=> b!142303 (= res!118771 (bvsle (bitIndex!0 (size!2952 (buf!3376 thiss!1634)) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634)) (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519)))))))

(declare-fun b!142304 () Bool)

(declare-fun e!94791 () Bool)

(assert (=> b!142304 (= e!94792 e!94791)))

(declare-fun res!118770 () Bool)

(assert (=> b!142304 (=> res!118770 e!94791)))

(assert (=> b!142304 (= res!118770 (= (size!2952 (buf!3376 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!142305 () Bool)

(assert (=> b!142305 (= e!94791 (arrayBitRangesEq!0 (buf!3376 thiss!1634) (buf!3376 (_2!6654 lt!220519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2952 (buf!3376 thiss!1634)) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634))))))

(assert (= (and d!45555 res!118769) b!142303))

(assert (= (and b!142303 res!118771) b!142304))

(assert (= (and b!142304 (not res!118770)) b!142305))

(assert (=> b!142303 m!218459))

(assert (=> b!142303 m!218447))

(assert (=> b!142305 m!218459))

(assert (=> b!142305 m!218459))

(declare-fun m!218485 () Bool)

(assert (=> b!142305 m!218485))

(assert (=> b!142268 d!45555))

(declare-datatypes ((tuple3!542 0))(
  ( (tuple3!543 (_1!6657 Unit!8892) (_2!6657 BitStream!5162) (_3!334 array!6520)) )
))
(declare-fun lt!220559 () tuple3!542)

(declare-fun d!45557 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5162 array!6520 (_ BitVec 32) (_ BitVec 32)) tuple3!542)

(assert (=> d!45557 (= lt!220559 (readByteArrayLoop!0 (_1!6652 lt!220523) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45557 (= (readByteArrayLoopPure!0 (_1!6652 lt!220523) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12645 (_2!6657 lt!220559) (_3!334 lt!220559)))))

(declare-fun bs!11192 () Bool)

(assert (= bs!11192 d!45557))

(declare-fun m!218503 () Bool)

(assert (=> bs!11192 m!218503))

(assert (=> b!142270 d!45557))

(declare-fun d!45561 () Bool)

(assert (=> d!45561 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220514)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519))) lt!220522) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220514)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519)))) lt!220522))))

(declare-fun bs!11193 () Bool)

(assert (= bs!11193 d!45561))

(declare-fun m!218507 () Bool)

(assert (=> bs!11193 m!218507))

(assert (=> b!142270 d!45561))

(declare-fun d!45565 () Bool)

(assert (=> d!45565 (validate_offset_bits!1 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220514)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519))) lt!220522)))

(declare-fun lt!220562 () Unit!8892)

(declare-fun choose!9 (BitStream!5162 array!6520 (_ BitVec 64) BitStream!5162) Unit!8892)

(assert (=> d!45565 (= lt!220562 (choose!9 (_2!6654 lt!220519) (buf!3376 (_2!6654 lt!220514)) lt!220522 (BitStream!5163 (buf!3376 (_2!6654 lt!220514)) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519)))))))

(assert (=> d!45565 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6654 lt!220519) (buf!3376 (_2!6654 lt!220514)) lt!220522) lt!220562)))

(declare-fun bs!11194 () Bool)

(assert (= bs!11194 d!45565))

(assert (=> bs!11194 m!218463))

(declare-fun m!218509 () Bool)

(assert (=> bs!11194 m!218509))

(assert (=> b!142270 d!45565))

(declare-fun d!45567 () Bool)

(declare-fun e!94825 () Bool)

(assert (=> d!45567 e!94825))

(declare-fun res!118814 () Bool)

(assert (=> d!45567 (=> (not res!118814) (not e!94825))))

(declare-fun lt!220636 () tuple2!12638)

(assert (=> d!45567 (= res!118814 (isPrefixOf!0 (_1!6652 lt!220636) (_2!6652 lt!220636)))))

(declare-fun lt!220651 () BitStream!5162)

(assert (=> d!45567 (= lt!220636 (tuple2!12639 lt!220651 (_2!6654 lt!220514)))))

(declare-fun lt!220649 () Unit!8892)

(declare-fun lt!220643 () Unit!8892)

(assert (=> d!45567 (= lt!220649 lt!220643)))

(assert (=> d!45567 (isPrefixOf!0 lt!220651 (_2!6654 lt!220514))))

(assert (=> d!45567 (= lt!220643 (lemmaIsPrefixTransitive!0 lt!220651 (_2!6654 lt!220514) (_2!6654 lt!220514)))))

(declare-fun lt!220650 () Unit!8892)

(declare-fun lt!220637 () Unit!8892)

(assert (=> d!45567 (= lt!220650 lt!220637)))

(assert (=> d!45567 (isPrefixOf!0 lt!220651 (_2!6654 lt!220514))))

(assert (=> d!45567 (= lt!220637 (lemmaIsPrefixTransitive!0 lt!220651 (_2!6654 lt!220519) (_2!6654 lt!220514)))))

(declare-fun lt!220652 () Unit!8892)

(declare-fun e!94824 () Unit!8892)

(assert (=> d!45567 (= lt!220652 e!94824)))

(declare-fun c!7817 () Bool)

(assert (=> d!45567 (= c!7817 (not (= (size!2952 (buf!3376 (_2!6654 lt!220519))) #b00000000000000000000000000000000)))))

(declare-fun lt!220639 () Unit!8892)

(declare-fun lt!220635 () Unit!8892)

(assert (=> d!45567 (= lt!220639 lt!220635)))

(assert (=> d!45567 (isPrefixOf!0 (_2!6654 lt!220514) (_2!6654 lt!220514))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5162) Unit!8892)

(assert (=> d!45567 (= lt!220635 (lemmaIsPrefixRefl!0 (_2!6654 lt!220514)))))

(declare-fun lt!220646 () Unit!8892)

(declare-fun lt!220634 () Unit!8892)

(assert (=> d!45567 (= lt!220646 lt!220634)))

(assert (=> d!45567 (= lt!220634 (lemmaIsPrefixRefl!0 (_2!6654 lt!220514)))))

(declare-fun lt!220641 () Unit!8892)

(declare-fun lt!220633 () Unit!8892)

(assert (=> d!45567 (= lt!220641 lt!220633)))

(assert (=> d!45567 (isPrefixOf!0 lt!220651 lt!220651)))

(assert (=> d!45567 (= lt!220633 (lemmaIsPrefixRefl!0 lt!220651))))

(declare-fun lt!220644 () Unit!8892)

(declare-fun lt!220648 () Unit!8892)

(assert (=> d!45567 (= lt!220644 lt!220648)))

(assert (=> d!45567 (isPrefixOf!0 (_2!6654 lt!220519) (_2!6654 lt!220519))))

(assert (=> d!45567 (= lt!220648 (lemmaIsPrefixRefl!0 (_2!6654 lt!220519)))))

(assert (=> d!45567 (= lt!220651 (BitStream!5163 (buf!3376 (_2!6654 lt!220514)) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519))))))

(assert (=> d!45567 (isPrefixOf!0 (_2!6654 lt!220519) (_2!6654 lt!220514))))

(assert (=> d!45567 (= (reader!0 (_2!6654 lt!220519) (_2!6654 lt!220514)) lt!220636)))

(declare-fun b!142354 () Bool)

(declare-fun Unit!8894 () Unit!8892)

(assert (=> b!142354 (= e!94824 Unit!8894)))

(declare-fun b!142355 () Bool)

(declare-fun lt!220642 () Unit!8892)

(assert (=> b!142355 (= e!94824 lt!220642)))

(declare-fun lt!220645 () (_ BitVec 64))

(assert (=> b!142355 (= lt!220645 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!220640 () (_ BitVec 64))

(assert (=> b!142355 (= lt!220640 (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6520 array!6520 (_ BitVec 64) (_ BitVec 64)) Unit!8892)

(assert (=> b!142355 (= lt!220642 (arrayBitRangesEqSymmetric!0 (buf!3376 (_2!6654 lt!220519)) (buf!3376 (_2!6654 lt!220514)) lt!220645 lt!220640))))

(assert (=> b!142355 (arrayBitRangesEq!0 (buf!3376 (_2!6654 lt!220514)) (buf!3376 (_2!6654 lt!220519)) lt!220645 lt!220640)))

(declare-fun lt!220647 () (_ BitVec 64))

(declare-fun lt!220638 () (_ BitVec 64))

(declare-fun b!142356 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5162 (_ BitVec 64)) BitStream!5162)

(assert (=> b!142356 (= e!94825 (= (_1!6652 lt!220636) (withMovedBitIndex!0 (_2!6652 lt!220636) (bvsub lt!220647 lt!220638))))))

(assert (=> b!142356 (or (= (bvand lt!220647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220638 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220647 lt!220638) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142356 (= lt!220638 (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220514))) (currentByte!6245 (_2!6654 lt!220514)) (currentBit!6240 (_2!6654 lt!220514))))))

(assert (=> b!142356 (= lt!220647 (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519))))))

(declare-fun b!142357 () Bool)

(declare-fun res!118816 () Bool)

(assert (=> b!142357 (=> (not res!118816) (not e!94825))))

(assert (=> b!142357 (= res!118816 (isPrefixOf!0 (_2!6652 lt!220636) (_2!6654 lt!220514)))))

(declare-fun b!142358 () Bool)

(declare-fun res!118815 () Bool)

(assert (=> b!142358 (=> (not res!118815) (not e!94825))))

(assert (=> b!142358 (= res!118815 (isPrefixOf!0 (_1!6652 lt!220636) (_2!6654 lt!220519)))))

(assert (= (and d!45567 c!7817) b!142355))

(assert (= (and d!45567 (not c!7817)) b!142354))

(assert (= (and d!45567 res!118814) b!142358))

(assert (= (and b!142358 res!118815) b!142357))

(assert (= (and b!142357 res!118816) b!142356))

(assert (=> b!142355 m!218447))

(declare-fun m!218531 () Bool)

(assert (=> b!142355 m!218531))

(declare-fun m!218533 () Bool)

(assert (=> b!142355 m!218533))

(declare-fun m!218535 () Bool)

(assert (=> b!142356 m!218535))

(assert (=> b!142356 m!218445))

(assert (=> b!142356 m!218447))

(declare-fun m!218537 () Bool)

(assert (=> b!142358 m!218537))

(declare-fun m!218539 () Bool)

(assert (=> b!142357 m!218539))

(declare-fun m!218541 () Bool)

(assert (=> d!45567 m!218541))

(declare-fun m!218543 () Bool)

(assert (=> d!45567 m!218543))

(declare-fun m!218545 () Bool)

(assert (=> d!45567 m!218545))

(declare-fun m!218547 () Bool)

(assert (=> d!45567 m!218547))

(declare-fun m!218549 () Bool)

(assert (=> d!45567 m!218549))

(declare-fun m!218551 () Bool)

(assert (=> d!45567 m!218551))

(declare-fun m!218553 () Bool)

(assert (=> d!45567 m!218553))

(declare-fun m!218555 () Bool)

(assert (=> d!45567 m!218555))

(declare-fun m!218557 () Bool)

(assert (=> d!45567 m!218557))

(assert (=> d!45567 m!218443))

(declare-fun m!218559 () Bool)

(assert (=> d!45567 m!218559))

(assert (=> b!142270 d!45567))

(declare-fun d!45581 () Bool)

(assert (=> d!45581 (= (invariant!0 (currentBit!6240 thiss!1634) (currentByte!6245 thiss!1634) (size!2952 (buf!3376 (_2!6654 lt!220519)))) (and (bvsge (currentBit!6240 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6240 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6245 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6245 thiss!1634) (size!2952 (buf!3376 (_2!6654 lt!220519)))) (and (= (currentBit!6240 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6245 thiss!1634) (size!2952 (buf!3376 (_2!6654 lt!220519))))))))))

(assert (=> b!142261 d!45581))

(declare-fun b!142373 () Bool)

(declare-fun e!94839 () Bool)

(declare-fun call!1851 () Bool)

(assert (=> b!142373 (= e!94839 call!1851)))

(declare-fun b!142374 () Bool)

(declare-fun e!94840 () Bool)

(declare-fun e!94838 () Bool)

(assert (=> b!142374 (= e!94840 e!94838)))

(declare-fun c!7820 () Bool)

(declare-datatypes ((tuple4!126 0))(
  ( (tuple4!127 (_1!6658 (_ BitVec 32)) (_2!6658 (_ BitVec 32)) (_3!335 (_ BitVec 32)) (_4!63 (_ BitVec 32))) )
))
(declare-fun lt!220660 () tuple4!126)

(assert (=> b!142374 (= c!7820 (= (_3!335 lt!220660) (_4!63 lt!220660)))))

(declare-fun b!142375 () Bool)

(declare-fun e!94841 () Bool)

(assert (=> b!142375 (= e!94838 e!94841)))

(declare-fun lt!220659 () (_ BitVec 32))

(declare-fun res!118831 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142375 (= res!118831 (byteRangesEq!0 (select (arr!3665 (buf!3376 (_2!6654 lt!220519))) (_3!335 lt!220660)) (select (arr!3665 (buf!3376 (_2!6654 lt!220514))) (_3!335 lt!220660)) lt!220659 #b00000000000000000000000000001000))))

(assert (=> b!142375 (=> (not res!118831) (not e!94841))))

(declare-fun b!142376 () Bool)

(declare-fun e!94842 () Bool)

(assert (=> b!142376 (= e!94842 e!94840)))

(declare-fun res!118827 () Bool)

(assert (=> b!142376 (=> (not res!118827) (not e!94840))))

(declare-fun e!94843 () Bool)

(assert (=> b!142376 (= res!118827 e!94843)))

(declare-fun res!118828 () Bool)

(assert (=> b!142376 (=> res!118828 e!94843)))

(assert (=> b!142376 (= res!118828 (bvsge (_1!6658 lt!220660) (_2!6658 lt!220660)))))

(declare-fun lt!220661 () (_ BitVec 32))

(assert (=> b!142376 (= lt!220661 ((_ extract 31 0) (bvsrem lt!220521 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142376 (= lt!220659 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!126)

(assert (=> b!142376 (= lt!220660 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!220521))))

(declare-fun d!45583 () Bool)

(declare-fun res!118830 () Bool)

(assert (=> d!45583 (=> res!118830 e!94842)))

(assert (=> d!45583 (= res!118830 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!220521))))

(assert (=> d!45583 (= (arrayBitRangesEq!0 (buf!3376 (_2!6654 lt!220519)) (buf!3376 (_2!6654 lt!220514)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!220521) e!94842)))

(declare-fun b!142377 () Bool)

(declare-fun res!118829 () Bool)

(assert (=> b!142377 (= res!118829 (= lt!220661 #b00000000000000000000000000000000))))

(assert (=> b!142377 (=> res!118829 e!94839)))

(assert (=> b!142377 (= e!94841 e!94839)))

(declare-fun b!142378 () Bool)

(assert (=> b!142378 (= e!94843 (arrayRangesEq!268 (buf!3376 (_2!6654 lt!220519)) (buf!3376 (_2!6654 lt!220514)) (_1!6658 lt!220660) (_2!6658 lt!220660)))))

(declare-fun bm!1848 () Bool)

(assert (=> bm!1848 (= call!1851 (byteRangesEq!0 (ite c!7820 (select (arr!3665 (buf!3376 (_2!6654 lt!220519))) (_3!335 lt!220660)) (select (arr!3665 (buf!3376 (_2!6654 lt!220519))) (_4!63 lt!220660))) (ite c!7820 (select (arr!3665 (buf!3376 (_2!6654 lt!220514))) (_3!335 lt!220660)) (select (arr!3665 (buf!3376 (_2!6654 lt!220514))) (_4!63 lt!220660))) (ite c!7820 lt!220659 #b00000000000000000000000000000000) lt!220661))))

(declare-fun b!142379 () Bool)

(assert (=> b!142379 (= e!94838 call!1851)))

(assert (= (and d!45583 (not res!118830)) b!142376))

(assert (= (and b!142376 (not res!118828)) b!142378))

(assert (= (and b!142376 res!118827) b!142374))

(assert (= (and b!142374 c!7820) b!142379))

(assert (= (and b!142374 (not c!7820)) b!142375))

(assert (= (and b!142375 res!118831) b!142377))

(assert (= (and b!142377 (not res!118829)) b!142373))

(assert (= (or b!142379 b!142373) bm!1848))

(declare-fun m!218561 () Bool)

(assert (=> b!142375 m!218561))

(declare-fun m!218563 () Bool)

(assert (=> b!142375 m!218563))

(assert (=> b!142375 m!218561))

(assert (=> b!142375 m!218563))

(declare-fun m!218565 () Bool)

(assert (=> b!142375 m!218565))

(declare-fun m!218567 () Bool)

(assert (=> b!142376 m!218567))

(declare-fun m!218569 () Bool)

(assert (=> b!142378 m!218569))

(assert (=> bm!1848 m!218561))

(assert (=> bm!1848 m!218563))

(declare-fun m!218571 () Bool)

(assert (=> bm!1848 m!218571))

(declare-fun m!218573 () Bool)

(assert (=> bm!1848 m!218573))

(declare-fun m!218575 () Bool)

(assert (=> bm!1848 m!218575))

(assert (=> b!142271 d!45583))

(declare-fun d!45585 () Bool)

(declare-datatypes ((tuple2!12646 0))(
  ( (tuple2!12647 (_1!6660 (_ BitVec 8)) (_2!6660 BitStream!5162)) )
))
(declare-fun lt!220664 () tuple2!12646)

(declare-fun readByte!0 (BitStream!5162) tuple2!12646)

(assert (=> d!45585 (= lt!220664 (readByte!0 (_1!6652 lt!220517)))))

(assert (=> d!45585 (= (readBytePure!0 (_1!6652 lt!220517)) (tuple2!12641 (_2!6660 lt!220664) (_1!6660 lt!220664)))))

(declare-fun bs!11195 () Bool)

(assert (= bs!11195 d!45585))

(declare-fun m!218577 () Bool)

(assert (=> bs!11195 m!218577))

(assert (=> b!142260 d!45585))

(declare-fun d!45587 () Bool)

(declare-fun e!94845 () Bool)

(assert (=> d!45587 e!94845))

(declare-fun res!118832 () Bool)

(assert (=> d!45587 (=> (not res!118832) (not e!94845))))

(declare-fun lt!220668 () tuple2!12638)

(assert (=> d!45587 (= res!118832 (isPrefixOf!0 (_1!6652 lt!220668) (_2!6652 lt!220668)))))

(declare-fun lt!220683 () BitStream!5162)

(assert (=> d!45587 (= lt!220668 (tuple2!12639 lt!220683 (_2!6654 lt!220519)))))

(declare-fun lt!220681 () Unit!8892)

(declare-fun lt!220675 () Unit!8892)

(assert (=> d!45587 (= lt!220681 lt!220675)))

(assert (=> d!45587 (isPrefixOf!0 lt!220683 (_2!6654 lt!220519))))

(assert (=> d!45587 (= lt!220675 (lemmaIsPrefixTransitive!0 lt!220683 (_2!6654 lt!220519) (_2!6654 lt!220519)))))

(declare-fun lt!220682 () Unit!8892)

(declare-fun lt!220669 () Unit!8892)

(assert (=> d!45587 (= lt!220682 lt!220669)))

(assert (=> d!45587 (isPrefixOf!0 lt!220683 (_2!6654 lt!220519))))

(assert (=> d!45587 (= lt!220669 (lemmaIsPrefixTransitive!0 lt!220683 thiss!1634 (_2!6654 lt!220519)))))

(declare-fun lt!220684 () Unit!8892)

(declare-fun e!94844 () Unit!8892)

(assert (=> d!45587 (= lt!220684 e!94844)))

(declare-fun c!7821 () Bool)

(assert (=> d!45587 (= c!7821 (not (= (size!2952 (buf!3376 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!220671 () Unit!8892)

(declare-fun lt!220667 () Unit!8892)

(assert (=> d!45587 (= lt!220671 lt!220667)))

(assert (=> d!45587 (isPrefixOf!0 (_2!6654 lt!220519) (_2!6654 lt!220519))))

(assert (=> d!45587 (= lt!220667 (lemmaIsPrefixRefl!0 (_2!6654 lt!220519)))))

(declare-fun lt!220678 () Unit!8892)

(declare-fun lt!220666 () Unit!8892)

(assert (=> d!45587 (= lt!220678 lt!220666)))

(assert (=> d!45587 (= lt!220666 (lemmaIsPrefixRefl!0 (_2!6654 lt!220519)))))

(declare-fun lt!220673 () Unit!8892)

(declare-fun lt!220665 () Unit!8892)

(assert (=> d!45587 (= lt!220673 lt!220665)))

(assert (=> d!45587 (isPrefixOf!0 lt!220683 lt!220683)))

(assert (=> d!45587 (= lt!220665 (lemmaIsPrefixRefl!0 lt!220683))))

(declare-fun lt!220676 () Unit!8892)

(declare-fun lt!220680 () Unit!8892)

(assert (=> d!45587 (= lt!220676 lt!220680)))

(assert (=> d!45587 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45587 (= lt!220680 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45587 (= lt!220683 (BitStream!5163 (buf!3376 (_2!6654 lt!220519)) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634)))))

(assert (=> d!45587 (isPrefixOf!0 thiss!1634 (_2!6654 lt!220519))))

(assert (=> d!45587 (= (reader!0 thiss!1634 (_2!6654 lt!220519)) lt!220668)))

(declare-fun b!142380 () Bool)

(declare-fun Unit!8897 () Unit!8892)

(assert (=> b!142380 (= e!94844 Unit!8897)))

(declare-fun b!142381 () Bool)

(declare-fun lt!220674 () Unit!8892)

(assert (=> b!142381 (= e!94844 lt!220674)))

(declare-fun lt!220677 () (_ BitVec 64))

(assert (=> b!142381 (= lt!220677 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!220672 () (_ BitVec 64))

(assert (=> b!142381 (= lt!220672 (bitIndex!0 (size!2952 (buf!3376 thiss!1634)) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634)))))

(assert (=> b!142381 (= lt!220674 (arrayBitRangesEqSymmetric!0 (buf!3376 thiss!1634) (buf!3376 (_2!6654 lt!220519)) lt!220677 lt!220672))))

(assert (=> b!142381 (arrayBitRangesEq!0 (buf!3376 (_2!6654 lt!220519)) (buf!3376 thiss!1634) lt!220677 lt!220672)))

(declare-fun lt!220679 () (_ BitVec 64))

(declare-fun b!142382 () Bool)

(declare-fun lt!220670 () (_ BitVec 64))

(assert (=> b!142382 (= e!94845 (= (_1!6652 lt!220668) (withMovedBitIndex!0 (_2!6652 lt!220668) (bvsub lt!220679 lt!220670))))))

(assert (=> b!142382 (or (= (bvand lt!220679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220670 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220679 lt!220670) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142382 (= lt!220670 (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519))))))

(assert (=> b!142382 (= lt!220679 (bitIndex!0 (size!2952 (buf!3376 thiss!1634)) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634)))))

(declare-fun b!142383 () Bool)

(declare-fun res!118834 () Bool)

(assert (=> b!142383 (=> (not res!118834) (not e!94845))))

(assert (=> b!142383 (= res!118834 (isPrefixOf!0 (_2!6652 lt!220668) (_2!6654 lt!220519)))))

(declare-fun b!142384 () Bool)

(declare-fun res!118833 () Bool)

(assert (=> b!142384 (=> (not res!118833) (not e!94845))))

(assert (=> b!142384 (= res!118833 (isPrefixOf!0 (_1!6652 lt!220668) thiss!1634))))

(assert (= (and d!45587 c!7821) b!142381))

(assert (= (and d!45587 (not c!7821)) b!142380))

(assert (= (and d!45587 res!118832) b!142384))

(assert (= (and b!142384 res!118833) b!142383))

(assert (= (and b!142383 res!118834) b!142382))

(assert (=> b!142381 m!218459))

(declare-fun m!218579 () Bool)

(assert (=> b!142381 m!218579))

(declare-fun m!218581 () Bool)

(assert (=> b!142381 m!218581))

(declare-fun m!218583 () Bool)

(assert (=> b!142382 m!218583))

(assert (=> b!142382 m!218447))

(assert (=> b!142382 m!218459))

(declare-fun m!218585 () Bool)

(assert (=> b!142384 m!218585))

(declare-fun m!218587 () Bool)

(assert (=> b!142383 m!218587))

(declare-fun m!218589 () Bool)

(assert (=> d!45587 m!218589))

(assert (=> d!45587 m!218541))

(assert (=> d!45587 m!218547))

(declare-fun m!218591 () Bool)

(assert (=> d!45587 m!218591))

(declare-fun m!218593 () Bool)

(assert (=> d!45587 m!218593))

(declare-fun m!218595 () Bool)

(assert (=> d!45587 m!218595))

(declare-fun m!218597 () Bool)

(assert (=> d!45587 m!218597))

(declare-fun m!218599 () Bool)

(assert (=> d!45587 m!218599))

(declare-fun m!218601 () Bool)

(assert (=> d!45587 m!218601))

(assert (=> d!45587 m!218475))

(declare-fun m!218603 () Bool)

(assert (=> d!45587 m!218603))

(assert (=> b!142260 d!45587))

(declare-fun d!45589 () Bool)

(assert (=> d!45589 (= (invariant!0 (currentBit!6240 thiss!1634) (currentByte!6245 thiss!1634) (size!2952 (buf!3376 thiss!1634))) (and (bvsge (currentBit!6240 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6240 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6245 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6245 thiss!1634) (size!2952 (buf!3376 thiss!1634))) (and (= (currentBit!6240 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6245 thiss!1634) (size!2952 (buf!3376 thiss!1634)))))))))

(assert (=> b!142273 d!45589))

(declare-fun d!45591 () Bool)

(assert (=> d!45591 (= (array_inv!2741 (buf!3376 thiss!1634)) (bvsge (size!2952 (buf!3376 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!142262 d!45591))

(declare-fun d!45593 () Bool)

(declare-fun res!118835 () Bool)

(declare-fun e!94847 () Bool)

(assert (=> d!45593 (=> (not res!118835) (not e!94847))))

(assert (=> d!45593 (= res!118835 (= (size!2952 (buf!3376 (_2!6654 lt!220519))) (size!2952 (buf!3376 (_2!6654 lt!220514)))))))

(assert (=> d!45593 (= (isPrefixOf!0 (_2!6654 lt!220519) (_2!6654 lt!220514)) e!94847)))

(declare-fun b!142385 () Bool)

(declare-fun res!118837 () Bool)

(assert (=> b!142385 (=> (not res!118837) (not e!94847))))

(assert (=> b!142385 (= res!118837 (bvsle (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519))) (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220514))) (currentByte!6245 (_2!6654 lt!220514)) (currentBit!6240 (_2!6654 lt!220514)))))))

(declare-fun b!142386 () Bool)

(declare-fun e!94846 () Bool)

(assert (=> b!142386 (= e!94847 e!94846)))

(declare-fun res!118836 () Bool)

(assert (=> b!142386 (=> res!118836 e!94846)))

(assert (=> b!142386 (= res!118836 (= (size!2952 (buf!3376 (_2!6654 lt!220519))) #b00000000000000000000000000000000))))

(declare-fun b!142387 () Bool)

(assert (=> b!142387 (= e!94846 (arrayBitRangesEq!0 (buf!3376 (_2!6654 lt!220519)) (buf!3376 (_2!6654 lt!220514)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519)))))))

(assert (= (and d!45593 res!118835) b!142385))

(assert (= (and b!142385 res!118837) b!142386))

(assert (= (and b!142386 (not res!118836)) b!142387))

(assert (=> b!142385 m!218447))

(assert (=> b!142385 m!218445))

(assert (=> b!142387 m!218447))

(assert (=> b!142387 m!218447))

(declare-fun m!218605 () Bool)

(assert (=> b!142387 m!218605))

(assert (=> b!142272 d!45593))

(assert (=> b!142274 d!45553))

(declare-fun d!45595 () Bool)

(declare-fun e!94848 () Bool)

(assert (=> d!45595 e!94848))

(declare-fun res!118839 () Bool)

(assert (=> d!45595 (=> (not res!118839) (not e!94848))))

(declare-fun lt!220686 () (_ BitVec 64))

(declare-fun lt!220689 () (_ BitVec 64))

(declare-fun lt!220690 () (_ BitVec 64))

(assert (=> d!45595 (= res!118839 (= lt!220690 (bvsub lt!220686 lt!220689)))))

(assert (=> d!45595 (or (= (bvand lt!220686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220689 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220686 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220686 lt!220689) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45595 (= lt!220689 (remainingBits!0 ((_ sign_extend 32) (size!2952 (buf!3376 thiss!1634))) ((_ sign_extend 32) (currentByte!6245 thiss!1634)) ((_ sign_extend 32) (currentBit!6240 thiss!1634))))))

(declare-fun lt!220688 () (_ BitVec 64))

(declare-fun lt!220685 () (_ BitVec 64))

(assert (=> d!45595 (= lt!220686 (bvmul lt!220688 lt!220685))))

(assert (=> d!45595 (or (= lt!220688 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220685 (bvsdiv (bvmul lt!220688 lt!220685) lt!220688)))))

(assert (=> d!45595 (= lt!220685 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45595 (= lt!220688 ((_ sign_extend 32) (size!2952 (buf!3376 thiss!1634))))))

(assert (=> d!45595 (= lt!220690 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6245 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6240 thiss!1634))))))

(assert (=> d!45595 (invariant!0 (currentBit!6240 thiss!1634) (currentByte!6245 thiss!1634) (size!2952 (buf!3376 thiss!1634)))))

(assert (=> d!45595 (= (bitIndex!0 (size!2952 (buf!3376 thiss!1634)) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634)) lt!220690)))

(declare-fun b!142388 () Bool)

(declare-fun res!118838 () Bool)

(assert (=> b!142388 (=> (not res!118838) (not e!94848))))

(assert (=> b!142388 (= res!118838 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220690))))

(declare-fun b!142389 () Bool)

(declare-fun lt!220687 () (_ BitVec 64))

(assert (=> b!142389 (= e!94848 (bvsle lt!220690 (bvmul lt!220687 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142389 (or (= lt!220687 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220687 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220687)))))

(assert (=> b!142389 (= lt!220687 ((_ sign_extend 32) (size!2952 (buf!3376 thiss!1634))))))

(assert (= (and d!45595 res!118839) b!142388))

(assert (= (and b!142388 res!118838) b!142389))

(declare-fun m!218607 () Bool)

(assert (=> d!45595 m!218607))

(assert (=> d!45595 m!218473))

(assert (=> b!142274 d!45595))

(declare-fun d!45597 () Bool)

(declare-fun res!118844 () Bool)

(declare-fun e!94853 () Bool)

(assert (=> d!45597 (=> res!118844 e!94853)))

(assert (=> d!45597 (= res!118844 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45597 (= (arrayRangesEq!268 arr!237 (_2!6655 lt!220518) #b00000000000000000000000000000000 to!404) e!94853)))

(declare-fun b!142394 () Bool)

(declare-fun e!94854 () Bool)

(assert (=> b!142394 (= e!94853 e!94854)))

(declare-fun res!118845 () Bool)

(assert (=> b!142394 (=> (not res!118845) (not e!94854))))

(assert (=> b!142394 (= res!118845 (= (select (arr!3665 arr!237) #b00000000000000000000000000000000) (select (arr!3665 (_2!6655 lt!220518)) #b00000000000000000000000000000000)))))

(declare-fun b!142395 () Bool)

(assert (=> b!142395 (= e!94854 (arrayRangesEq!268 arr!237 (_2!6655 lt!220518) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45597 (not res!118844)) b!142394))

(assert (= (and b!142394 res!118845) b!142395))

(declare-fun m!218609 () Bool)

(assert (=> b!142394 m!218609))

(declare-fun m!218611 () Bool)

(assert (=> b!142394 m!218611))

(declare-fun m!218613 () Bool)

(assert (=> b!142395 m!218613))

(assert (=> b!142263 d!45597))

(declare-fun d!45601 () Bool)

(assert (=> d!45601 (= (array_inv!2741 arr!237) (bvsge (size!2952 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27598 d!45601))

(declare-fun d!45603 () Bool)

(assert (=> d!45603 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6240 thiss!1634) (currentByte!6245 thiss!1634) (size!2952 (buf!3376 thiss!1634))))))

(declare-fun bs!11197 () Bool)

(assert (= bs!11197 d!45603))

(assert (=> bs!11197 m!218473))

(assert (=> start!27598 d!45603))

(declare-fun d!45607 () Bool)

(assert (=> d!45607 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2952 (buf!3376 thiss!1634))) ((_ sign_extend 32) (currentByte!6245 thiss!1634)) ((_ sign_extend 32) (currentBit!6240 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2952 (buf!3376 thiss!1634))) ((_ sign_extend 32) (currentByte!6245 thiss!1634)) ((_ sign_extend 32) (currentBit!6240 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11198 () Bool)

(assert (= bs!11198 d!45607))

(assert (=> bs!11198 m!218607))

(assert (=> b!142264 d!45607))

(declare-fun d!45609 () Bool)

(assert (=> d!45609 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11199 () Bool)

(assert (= bs!11199 d!45609))

(assert (=> bs!11199 m!218481))

(assert (=> b!142266 d!45609))

(declare-fun d!45611 () Bool)

(declare-fun e!94866 () Bool)

(assert (=> d!45611 e!94866))

(declare-fun res!118863 () Bool)

(assert (=> d!45611 (=> (not res!118863) (not e!94866))))

(assert (=> d!45611 (= res!118863 (and (or (let ((rhs!3185 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3185 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3185) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!45612 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!45612 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!45612 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3184 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3184 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!220727 () Unit!8892)

(declare-fun choose!57 (BitStream!5162 BitStream!5162 (_ BitVec 64) (_ BitVec 32)) Unit!8892)

(assert (=> d!45611 (= lt!220727 (choose!57 thiss!1634 (_2!6654 lt!220519) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!45611 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6654 lt!220519) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!220727)))

(declare-fun lt!220729 () (_ BitVec 32))

(declare-fun b!142413 () Bool)

(assert (=> b!142413 (= e!94866 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519))) (bvsub (bvsub to!404 from!447) lt!220729)))))

(assert (=> b!142413 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!220729 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!220729) #b10000000000000000000000000000000)))))

(declare-fun lt!220728 () (_ BitVec 64))

(assert (=> b!142413 (= lt!220729 ((_ extract 31 0) lt!220728))))

(assert (=> b!142413 (and (bvslt lt!220728 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!220728 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!142413 (= lt!220728 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!45611 res!118863) b!142413))

(declare-fun m!218635 () Bool)

(assert (=> d!45611 m!218635))

(declare-fun m!218637 () Bool)

(assert (=> b!142413 m!218637))

(assert (=> b!142266 d!45611))

(declare-fun d!45617 () Bool)

(declare-fun res!118864 () Bool)

(declare-fun e!94868 () Bool)

(assert (=> d!45617 (=> (not res!118864) (not e!94868))))

(assert (=> d!45617 (= res!118864 (= (size!2952 (buf!3376 thiss!1634)) (size!2952 (buf!3376 (_2!6654 lt!220514)))))))

(assert (=> d!45617 (= (isPrefixOf!0 thiss!1634 (_2!6654 lt!220514)) e!94868)))

(declare-fun b!142414 () Bool)

(declare-fun res!118866 () Bool)

(assert (=> b!142414 (=> (not res!118866) (not e!94868))))

(assert (=> b!142414 (= res!118866 (bvsle (bitIndex!0 (size!2952 (buf!3376 thiss!1634)) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634)) (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220514))) (currentByte!6245 (_2!6654 lt!220514)) (currentBit!6240 (_2!6654 lt!220514)))))))

(declare-fun b!142415 () Bool)

(declare-fun e!94867 () Bool)

(assert (=> b!142415 (= e!94868 e!94867)))

(declare-fun res!118865 () Bool)

(assert (=> b!142415 (=> res!118865 e!94867)))

(assert (=> b!142415 (= res!118865 (= (size!2952 (buf!3376 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!142416 () Bool)

(assert (=> b!142416 (= e!94867 (arrayBitRangesEq!0 (buf!3376 thiss!1634) (buf!3376 (_2!6654 lt!220514)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2952 (buf!3376 thiss!1634)) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634))))))

(assert (= (and d!45617 res!118864) b!142414))

(assert (= (and b!142414 res!118866) b!142415))

(assert (= (and b!142415 (not res!118865)) b!142416))

(assert (=> b!142414 m!218459))

(assert (=> b!142414 m!218445))

(assert (=> b!142416 m!218459))

(assert (=> b!142416 m!218459))

(declare-fun m!218639 () Bool)

(assert (=> b!142416 m!218639))

(assert (=> b!142266 d!45617))

(declare-fun d!45619 () Bool)

(declare-fun e!94869 () Bool)

(assert (=> d!45619 e!94869))

(declare-fun res!118868 () Bool)

(assert (=> d!45619 (=> (not res!118868) (not e!94869))))

(declare-fun lt!220731 () (_ BitVec 64))

(declare-fun lt!220734 () (_ BitVec 64))

(declare-fun lt!220735 () (_ BitVec 64))

(assert (=> d!45619 (= res!118868 (= lt!220735 (bvsub lt!220731 lt!220734)))))

(assert (=> d!45619 (or (= (bvand lt!220731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220734 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220731 lt!220734) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45619 (= lt!220734 (remainingBits!0 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))) ((_ sign_extend 32) (currentByte!6245 thiss!1634)) ((_ sign_extend 32) (currentBit!6240 thiss!1634))))))

(declare-fun lt!220733 () (_ BitVec 64))

(declare-fun lt!220730 () (_ BitVec 64))

(assert (=> d!45619 (= lt!220731 (bvmul lt!220733 lt!220730))))

(assert (=> d!45619 (or (= lt!220733 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220730 (bvsdiv (bvmul lt!220733 lt!220730) lt!220733)))))

(assert (=> d!45619 (= lt!220730 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45619 (= lt!220733 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))))))

(assert (=> d!45619 (= lt!220735 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6245 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6240 thiss!1634))))))

(assert (=> d!45619 (invariant!0 (currentBit!6240 thiss!1634) (currentByte!6245 thiss!1634) (size!2952 (buf!3376 (_2!6654 lt!220519))))))

(assert (=> d!45619 (= (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634)) lt!220735)))

(declare-fun b!142417 () Bool)

(declare-fun res!118867 () Bool)

(assert (=> b!142417 (=> (not res!118867) (not e!94869))))

(assert (=> b!142417 (= res!118867 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220735))))

(declare-fun b!142418 () Bool)

(declare-fun lt!220732 () (_ BitVec 64))

(assert (=> b!142418 (= e!94869 (bvsle lt!220735 (bvmul lt!220732 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142418 (or (= lt!220732 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220732 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220732)))))

(assert (=> b!142418 (= lt!220732 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))))))

(assert (= (and d!45619 res!118868) b!142417))

(assert (= (and b!142417 res!118867) b!142418))

(declare-fun m!218641 () Bool)

(assert (=> d!45619 m!218641))

(assert (=> d!45619 m!218453))

(assert (=> b!142266 d!45619))

(declare-fun d!45621 () Bool)

(declare-fun e!94882 () Bool)

(assert (=> d!45621 e!94882))

(declare-fun res!118890 () Bool)

(assert (=> d!45621 (=> (not res!118890) (not e!94882))))

(declare-fun lt!220827 () tuple2!12642)

(assert (=> d!45621 (= res!118890 (= (size!2952 (buf!3376 thiss!1634)) (size!2952 (buf!3376 (_2!6654 lt!220827)))))))

(declare-fun choose!6 (BitStream!5162 (_ BitVec 8)) tuple2!12642)

(assert (=> d!45621 (= lt!220827 (choose!6 thiss!1634 (select (arr!3665 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45621 (validate_offset_byte!0 ((_ sign_extend 32) (size!2952 (buf!3376 thiss!1634))) ((_ sign_extend 32) (currentByte!6245 thiss!1634)) ((_ sign_extend 32) (currentBit!6240 thiss!1634)))))

(assert (=> d!45621 (= (appendByte!0 thiss!1634 (select (arr!3665 arr!237) from!447)) lt!220827)))

(declare-fun b!142445 () Bool)

(declare-fun res!118889 () Bool)

(assert (=> b!142445 (=> (not res!118889) (not e!94882))))

(declare-fun lt!220828 () (_ BitVec 64))

(declare-fun lt!220824 () (_ BitVec 64))

(assert (=> b!142445 (= res!118889 (= (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220827))) (currentByte!6245 (_2!6654 lt!220827)) (currentBit!6240 (_2!6654 lt!220827))) (bvadd lt!220828 lt!220824)))))

(assert (=> b!142445 (or (not (= (bvand lt!220828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220824 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!220828 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!220828 lt!220824) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142445 (= lt!220824 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!142445 (= lt!220828 (bitIndex!0 (size!2952 (buf!3376 thiss!1634)) (currentByte!6245 thiss!1634) (currentBit!6240 thiss!1634)))))

(declare-fun b!142446 () Bool)

(declare-fun res!118891 () Bool)

(assert (=> b!142446 (=> (not res!118891) (not e!94882))))

(assert (=> b!142446 (= res!118891 (isPrefixOf!0 thiss!1634 (_2!6654 lt!220827)))))

(declare-fun lt!220826 () tuple2!12638)

(declare-fun lt!220825 () tuple2!12640)

(declare-fun b!142447 () Bool)

(assert (=> b!142447 (= e!94882 (and (= (_2!6653 lt!220825) (select (arr!3665 arr!237) from!447)) (= (_1!6653 lt!220825) (_2!6652 lt!220826))))))

(assert (=> b!142447 (= lt!220825 (readBytePure!0 (_1!6652 lt!220826)))))

(assert (=> b!142447 (= lt!220826 (reader!0 thiss!1634 (_2!6654 lt!220827)))))

(assert (= (and d!45621 res!118890) b!142445))

(assert (= (and b!142445 res!118889) b!142446))

(assert (= (and b!142446 res!118891) b!142447))

(assert (=> d!45621 m!218423))

(declare-fun m!218681 () Bool)

(assert (=> d!45621 m!218681))

(declare-fun m!218683 () Bool)

(assert (=> d!45621 m!218683))

(declare-fun m!218685 () Bool)

(assert (=> b!142445 m!218685))

(assert (=> b!142445 m!218459))

(declare-fun m!218687 () Bool)

(assert (=> b!142446 m!218687))

(declare-fun m!218689 () Bool)

(assert (=> b!142447 m!218689))

(declare-fun m!218691 () Bool)

(assert (=> b!142447 m!218691))

(assert (=> b!142266 d!45621))

(declare-fun b!142539 () Bool)

(declare-fun res!118971 () Bool)

(declare-fun e!94942 () Bool)

(assert (=> b!142539 (=> (not res!118971) (not e!94942))))

(declare-fun lt!220992 () tuple2!12642)

(assert (=> b!142539 (= res!118971 (isPrefixOf!0 (_2!6654 lt!220519) (_2!6654 lt!220992)))))

(declare-fun b!142540 () Bool)

(declare-fun e!94941 () Bool)

(assert (=> b!142540 (= e!94942 e!94941)))

(declare-fun res!118972 () Bool)

(assert (=> b!142540 (=> (not res!118972) (not e!94941))))

(declare-fun lt!220986 () tuple2!12638)

(declare-fun lt!220993 () tuple2!12644)

(assert (=> b!142540 (= res!118972 (and (= (size!2952 (_2!6655 lt!220993)) (size!2952 arr!237)) (= (_1!6655 lt!220993) (_2!6652 lt!220986))))))

(assert (=> b!142540 (= lt!220993 (readByteArrayLoopPure!0 (_1!6652 lt!220986) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!220988 () Unit!8892)

(declare-fun lt!220990 () Unit!8892)

(assert (=> b!142540 (= lt!220988 lt!220990)))

(declare-fun lt!220987 () (_ BitVec 64))

(assert (=> b!142540 (validate_offset_bits!1 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220992)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519))) lt!220987)))

(assert (=> b!142540 (= lt!220990 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6654 lt!220519) (buf!3376 (_2!6654 lt!220992)) lt!220987))))

(declare-fun e!94943 () Bool)

(assert (=> b!142540 e!94943))

(declare-fun res!118974 () Bool)

(assert (=> b!142540 (=> (not res!118974) (not e!94943))))

(assert (=> b!142540 (= res!118974 (and (= (size!2952 (buf!3376 (_2!6654 lt!220519))) (size!2952 (buf!3376 (_2!6654 lt!220992)))) (bvsge lt!220987 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142540 (= lt!220987 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!142540 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!142540 (= lt!220986 (reader!0 (_2!6654 lt!220519) (_2!6654 lt!220992)))))

(declare-fun b!142541 () Bool)

(assert (=> b!142541 (= e!94941 (arrayRangesEq!268 arr!237 (_2!6655 lt!220993) #b00000000000000000000000000000000 to!404))))

(declare-fun b!142542 () Bool)

(assert (=> b!142542 (= e!94943 (validate_offset_bits!1 ((_ sign_extend 32) (size!2952 (buf!3376 (_2!6654 lt!220519)))) ((_ sign_extend 32) (currentByte!6245 (_2!6654 lt!220519))) ((_ sign_extend 32) (currentBit!6240 (_2!6654 lt!220519))) lt!220987))))

(declare-fun b!142543 () Bool)

(declare-fun res!118975 () Bool)

(assert (=> b!142543 (=> (not res!118975) (not e!94942))))

(declare-fun lt!220991 () (_ BitVec 64))

(declare-fun lt!220985 () (_ BitVec 64))

(assert (=> b!142543 (= res!118975 (= (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220992))) (currentByte!6245 (_2!6654 lt!220992)) (currentBit!6240 (_2!6654 lt!220992))) (bvadd lt!220985 lt!220991)))))

(assert (=> b!142543 (or (not (= (bvand lt!220985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220991 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!220985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!220985 lt!220991) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!220989 () (_ BitVec 64))

(assert (=> b!142543 (= lt!220991 (bvmul lt!220989 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!142543 (or (= lt!220989 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220989 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220989)))))

(assert (=> b!142543 (= lt!220989 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!142543 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!142543 (= lt!220985 (bitIndex!0 (size!2952 (buf!3376 (_2!6654 lt!220519))) (currentByte!6245 (_2!6654 lt!220519)) (currentBit!6240 (_2!6654 lt!220519))))))

(declare-fun d!45635 () Bool)

(assert (=> d!45635 e!94942))

(declare-fun res!118973 () Bool)

(assert (=> d!45635 (=> (not res!118973) (not e!94942))))

(assert (=> d!45635 (= res!118973 (= (size!2952 (buf!3376 (_2!6654 lt!220519))) (size!2952 (buf!3376 (_2!6654 lt!220992)))))))

(declare-fun choose!64 (BitStream!5162 array!6520 (_ BitVec 32) (_ BitVec 32)) tuple2!12642)

(assert (=> d!45635 (= lt!220992 (choose!64 (_2!6654 lt!220519) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45635 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2952 arr!237)))))

(assert (=> d!45635 (= (appendByteArrayLoop!0 (_2!6654 lt!220519) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!220992)))

(assert (= (and d!45635 res!118973) b!142543))

(assert (= (and b!142543 res!118975) b!142539))

(assert (= (and b!142539 res!118971) b!142540))

(assert (= (and b!142540 res!118974) b!142542))

(assert (= (and b!142540 res!118972) b!142541))

(declare-fun m!218787 () Bool)

(assert (=> d!45635 m!218787))

(declare-fun m!218789 () Bool)

(assert (=> b!142541 m!218789))

(declare-fun m!218791 () Bool)

(assert (=> b!142540 m!218791))

(declare-fun m!218793 () Bool)

(assert (=> b!142540 m!218793))

(declare-fun m!218795 () Bool)

(assert (=> b!142540 m!218795))

(declare-fun m!218797 () Bool)

(assert (=> b!142540 m!218797))

(declare-fun m!218799 () Bool)

(assert (=> b!142542 m!218799))

(declare-fun m!218801 () Bool)

(assert (=> b!142543 m!218801))

(assert (=> b!142543 m!218447))

(declare-fun m!218803 () Bool)

(assert (=> b!142539 m!218803))

(assert (=> b!142266 d!45635))

(declare-fun d!45688 () Bool)

(assert (=> d!45688 (isPrefixOf!0 thiss!1634 (_2!6654 lt!220514))))

(declare-fun lt!221019 () Unit!8892)

(declare-fun choose!30 (BitStream!5162 BitStream!5162 BitStream!5162) Unit!8892)

(assert (=> d!45688 (= lt!221019 (choose!30 thiss!1634 (_2!6654 lt!220519) (_2!6654 lt!220514)))))

(assert (=> d!45688 (isPrefixOf!0 thiss!1634 (_2!6654 lt!220519))))

(assert (=> d!45688 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6654 lt!220519) (_2!6654 lt!220514)) lt!221019)))

(declare-fun bs!11212 () Bool)

(assert (= bs!11212 d!45688))

(assert (=> bs!11212 m!218431))

(declare-fun m!218827 () Bool)

(assert (=> bs!11212 m!218827))

(assert (=> bs!11212 m!218475))

(assert (=> b!142266 d!45688))

(push 1)

(assert (not b!142541))

(assert (not b!142542))

(assert (not b!142384))

(assert (not b!142446))

(assert (not b!142376))

(assert (not b!142355))

(assert (not d!45565))

(assert (not b!142383))

(assert (not d!45585))

(assert (not d!45595))

(assert (not d!45603))

(assert (not b!142357))

(assert (not b!142414))

(assert (not bm!1848))

(assert (not b!142375))

(assert (not b!142385))

(assert (not b!142305))

(assert (not b!142356))

(assert (not b!142378))

(assert (not b!142395))

(assert (not b!142387))

(assert (not d!45561))

(assert (not b!142540))

(assert (not b!142539))

(assert (not b!142416))

(assert (not d!45609))

(assert (not d!45557))

(assert (not b!142382))

(assert (not b!142445))

(assert (not d!45567))

(assert (not b!142358))

(assert (not d!45635))

(assert (not d!45688))

(assert (not b!142413))

(assert (not d!45619))

(assert (not b!142543))

(assert (not d!45587))

(assert (not d!45611))

(assert (not d!45621))

(assert (not b!142447))

(assert (not d!45607))

(assert (not b!142303))

(assert (not d!45549))

(assert (not b!142381))

(assert (not d!45553))

(check-sat)

(pop 1)

(push 1)

(check-sat)

