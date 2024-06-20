; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24172 () Bool)

(assert start!24172)

(declare-datatypes ((array!5422 0))(
  ( (array!5423 (arr!3046 (Array (_ BitVec 32) (_ BitVec 8))) (size!2453 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4380 0))(
  ( (BitStream!4381 (buf!2893 array!5422) (currentByte!5590 (_ BitVec 32)) (currentBit!5585 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10344 0))(
  ( (tuple2!10345 (_1!5437 BitStream!4380) (_2!5437 BitStream!4380)) )
))
(declare-fun lt!192790 () tuple2!10344)

(declare-fun e!80297 () Bool)

(declare-fun b!122532 () Bool)

(declare-fun thiss!1305 () BitStream!4380)

(declare-fun lt!192789 () (_ BitVec 64))

(declare-fun lt!192781 () (_ BitVec 64))

(declare-fun lt!192786 () BitStream!4380)

(declare-datatypes ((Unit!7545 0))(
  ( (Unit!7546) )
))
(declare-datatypes ((tuple2!10346 0))(
  ( (tuple2!10347 (_1!5438 Unit!7545) (_2!5438 BitStream!4380)) )
))
(declare-fun lt!192773 () tuple2!10346)

(declare-fun lt!192784 () (_ BitVec 64))

(assert (=> b!122532 (= e!80297 (or (not (= (_1!5437 lt!192790) lt!192786)) (not (= (size!2453 (buf!2893 thiss!1305)) (size!2453 (buf!2893 (_2!5438 lt!192773))))) (not (= lt!192789 (bvadd lt!192781 lt!192784))) (bvsge lt!192784 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!80301 () Bool)

(assert (=> b!122532 e!80301))

(declare-fun res!101550 () Bool)

(assert (=> b!122532 (=> (not res!101550) (not e!80301))))

(declare-fun lt!192799 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4380 (_ BitVec 64)) BitStream!4380)

(assert (=> b!122532 (= res!101550 (= (_1!5437 lt!192790) (withMovedBitIndex!0 (_2!5437 lt!192790) (bvsub lt!192799 lt!192789))))))

(declare-fun lt!192792 () tuple2!10346)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122532 (= lt!192799 (bitIndex!0 (size!2453 (buf!2893 (_2!5438 lt!192792))) (currentByte!5590 (_2!5438 lt!192792)) (currentBit!5585 (_2!5438 lt!192792))))))

(declare-fun lt!192787 () tuple2!10344)

(assert (=> b!122532 (= (_1!5437 lt!192787) (withMovedBitIndex!0 (_2!5437 lt!192787) (bvsub lt!192781 lt!192789)))))

(assert (=> b!122532 (= lt!192789 (bitIndex!0 (size!2453 (buf!2893 (_2!5438 lt!192773))) (currentByte!5590 (_2!5438 lt!192773)) (currentBit!5585 (_2!5438 lt!192773))))))

(assert (=> b!122532 (= lt!192781 (bitIndex!0 (size!2453 (buf!2893 thiss!1305)) (currentByte!5590 thiss!1305) (currentBit!5585 thiss!1305)))))

(declare-datatypes ((tuple2!10348 0))(
  ( (tuple2!10349 (_1!5439 BitStream!4380) (_2!5439 (_ BitVec 64))) )
))
(declare-fun lt!192777 () tuple2!10348)

(declare-fun lt!192794 () tuple2!10348)

(assert (=> b!122532 (and (= (_2!5439 lt!192777) (_2!5439 lt!192794)) (= (_1!5439 lt!192777) (_1!5439 lt!192794)))))

(declare-fun lt!192791 () Unit!7545)

(declare-fun lt!192775 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7545)

(assert (=> b!122532 (= lt!192791 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5437 lt!192787) nBits!396 i!615 lt!192775))))

(declare-fun lt!192776 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10348)

(assert (=> b!122532 (= lt!192794 (readNLeastSignificantBitsLoopPure!0 lt!192786 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192776))))

(assert (=> b!122532 (= lt!192786 (withMovedBitIndex!0 (_1!5437 lt!192787) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!192800 () tuple2!10348)

(declare-fun b!122533 () Bool)

(assert (=> b!122533 (= e!80301 (and (= lt!192781 (bvsub lt!192799 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5437 lt!192790) lt!192786)) (and (= (_2!5439 lt!192777) (_2!5439 lt!192800)) (= (_1!5439 lt!192777) (_2!5437 lt!192787))))))))

(declare-fun b!122534 () Bool)

(declare-fun e!80307 () Bool)

(declare-fun e!80298 () Bool)

(assert (=> b!122534 (= e!80307 e!80298)))

(declare-fun res!101553 () Bool)

(assert (=> b!122534 (=> (not res!101553) (not e!80298))))

(declare-datatypes ((tuple2!10350 0))(
  ( (tuple2!10351 (_1!5440 BitStream!4380) (_2!5440 Bool)) )
))
(declare-fun lt!192779 () tuple2!10350)

(declare-fun lt!192774 () Bool)

(assert (=> b!122534 (= res!101553 (and (= (_2!5440 lt!192779) lt!192774) (= (_1!5440 lt!192779) (_2!5438 lt!192792))))))

(declare-fun readBitPure!0 (BitStream!4380) tuple2!10350)

(declare-fun readerFrom!0 (BitStream!4380 (_ BitVec 32) (_ BitVec 32)) BitStream!4380)

(assert (=> b!122534 (= lt!192779 (readBitPure!0 (readerFrom!0 (_2!5438 lt!192792) (currentBit!5585 thiss!1305) (currentByte!5590 thiss!1305))))))

(declare-fun b!122535 () Bool)

(declare-fun e!80304 () Bool)

(assert (=> b!122535 (= e!80304 (not e!80297))))

(declare-fun res!101556 () Bool)

(assert (=> b!122535 (=> res!101556 e!80297)))

(assert (=> b!122535 (= res!101556 (not (= (_1!5439 lt!192800) (_2!5437 lt!192790))))))

(assert (=> b!122535 (= lt!192800 (readNLeastSignificantBitsLoopPure!0 (_1!5437 lt!192790) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!192776))))

(declare-fun lt!192795 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!122535 (validate_offset_bits!1 ((_ sign_extend 32) (size!2453 (buf!2893 (_2!5438 lt!192773)))) ((_ sign_extend 32) (currentByte!5590 (_2!5438 lt!192792))) ((_ sign_extend 32) (currentBit!5585 (_2!5438 lt!192792))) lt!192795)))

(declare-fun lt!192778 () Unit!7545)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4380 array!5422 (_ BitVec 64)) Unit!7545)

(assert (=> b!122535 (= lt!192778 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5438 lt!192792) (buf!2893 (_2!5438 lt!192773)) lt!192795))))

(assert (=> b!122535 (= lt!192795 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!192797 () (_ BitVec 64))

(declare-fun lt!192788 () tuple2!10350)

(assert (=> b!122535 (= lt!192776 (bvor lt!192775 (ite (_2!5440 lt!192788) lt!192797 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122535 (= lt!192777 (readNLeastSignificantBitsLoopPure!0 (_1!5437 lt!192787) nBits!396 i!615 lt!192775))))

(assert (=> b!122535 (validate_offset_bits!1 ((_ sign_extend 32) (size!2453 (buf!2893 (_2!5438 lt!192773)))) ((_ sign_extend 32) (currentByte!5590 thiss!1305)) ((_ sign_extend 32) (currentBit!5585 thiss!1305)) lt!192784)))

(declare-fun lt!192782 () Unit!7545)

(assert (=> b!122535 (= lt!192782 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2893 (_2!5438 lt!192773)) lt!192784))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!122535 (= lt!192775 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!122535 (= (_2!5440 lt!192788) lt!192774)))

(assert (=> b!122535 (= lt!192788 (readBitPure!0 (_1!5437 lt!192787)))))

(declare-fun reader!0 (BitStream!4380 BitStream!4380) tuple2!10344)

(assert (=> b!122535 (= lt!192790 (reader!0 (_2!5438 lt!192792) (_2!5438 lt!192773)))))

(assert (=> b!122535 (= lt!192787 (reader!0 thiss!1305 (_2!5438 lt!192773)))))

(declare-fun e!80303 () Bool)

(assert (=> b!122535 e!80303))

(declare-fun res!101549 () Bool)

(assert (=> b!122535 (=> (not res!101549) (not e!80303))))

(declare-fun lt!192793 () tuple2!10350)

(declare-fun lt!192780 () tuple2!10350)

(assert (=> b!122535 (= res!101549 (= (bitIndex!0 (size!2453 (buf!2893 (_1!5440 lt!192793))) (currentByte!5590 (_1!5440 lt!192793)) (currentBit!5585 (_1!5440 lt!192793))) (bitIndex!0 (size!2453 (buf!2893 (_1!5440 lt!192780))) (currentByte!5590 (_1!5440 lt!192780)) (currentBit!5585 (_1!5440 lt!192780)))))))

(declare-fun lt!192801 () Unit!7545)

(declare-fun lt!192783 () BitStream!4380)

(declare-fun readBitPrefixLemma!0 (BitStream!4380 BitStream!4380) Unit!7545)

(assert (=> b!122535 (= lt!192801 (readBitPrefixLemma!0 lt!192783 (_2!5438 lt!192773)))))

(assert (=> b!122535 (= lt!192780 (readBitPure!0 (BitStream!4381 (buf!2893 (_2!5438 lt!192773)) (currentByte!5590 thiss!1305) (currentBit!5585 thiss!1305))))))

(assert (=> b!122535 (= lt!192793 (readBitPure!0 lt!192783))))

(assert (=> b!122535 (= lt!192783 (BitStream!4381 (buf!2893 (_2!5438 lt!192792)) (currentByte!5590 thiss!1305) (currentBit!5585 thiss!1305)))))

(declare-fun e!80305 () Bool)

(assert (=> b!122535 e!80305))

(declare-fun res!101559 () Bool)

(assert (=> b!122535 (=> (not res!101559) (not e!80305))))

(declare-fun isPrefixOf!0 (BitStream!4380 BitStream!4380) Bool)

(assert (=> b!122535 (= res!101559 (isPrefixOf!0 thiss!1305 (_2!5438 lt!192773)))))

(declare-fun lt!192796 () Unit!7545)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4380 BitStream!4380 BitStream!4380) Unit!7545)

(assert (=> b!122535 (= lt!192796 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5438 lt!192792) (_2!5438 lt!192773)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4380 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10346)

(assert (=> b!122535 (= lt!192773 (appendNLeastSignificantBitsLoop!0 (_2!5438 lt!192792) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!80300 () Bool)

(assert (=> b!122535 e!80300))

(declare-fun res!101554 () Bool)

(assert (=> b!122535 (=> (not res!101554) (not e!80300))))

(assert (=> b!122535 (= res!101554 (= (size!2453 (buf!2893 thiss!1305)) (size!2453 (buf!2893 (_2!5438 lt!192792)))))))

(declare-fun appendBit!0 (BitStream!4380 Bool) tuple2!10346)

(assert (=> b!122535 (= lt!192792 (appendBit!0 thiss!1305 lt!192774))))

(assert (=> b!122535 (= lt!192774 (not (= (bvand v!199 lt!192797) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122535 (= lt!192797 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!122536 () Bool)

(declare-fun res!101552 () Bool)

(assert (=> b!122536 (=> (not res!101552) (not e!80304))))

(assert (=> b!122536 (= res!101552 (bvslt i!615 nBits!396))))

(declare-fun b!122537 () Bool)

(declare-fun e!80306 () Bool)

(declare-fun array_inv!2255 (array!5422) Bool)

(assert (=> b!122537 (= e!80306 (array_inv!2255 (buf!2893 thiss!1305)))))

(declare-fun b!122538 () Bool)

(assert (=> b!122538 (= e!80300 e!80307)))

(declare-fun res!101547 () Bool)

(assert (=> b!122538 (=> (not res!101547) (not e!80307))))

(declare-fun lt!192785 () (_ BitVec 64))

(declare-fun lt!192798 () (_ BitVec 64))

(assert (=> b!122538 (= res!101547 (= lt!192785 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!192798)))))

(assert (=> b!122538 (= lt!192785 (bitIndex!0 (size!2453 (buf!2893 (_2!5438 lt!192792))) (currentByte!5590 (_2!5438 lt!192792)) (currentBit!5585 (_2!5438 lt!192792))))))

(assert (=> b!122538 (= lt!192798 (bitIndex!0 (size!2453 (buf!2893 thiss!1305)) (currentByte!5590 thiss!1305) (currentBit!5585 thiss!1305)))))

(declare-fun b!122539 () Bool)

(declare-fun res!101548 () Bool)

(assert (=> b!122539 (=> (not res!101548) (not e!80304))))

(assert (=> b!122539 (= res!101548 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!122540 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!122540 (= e!80305 (invariant!0 (currentBit!5585 thiss!1305) (currentByte!5590 thiss!1305) (size!2453 (buf!2893 (_2!5438 lt!192773)))))))

(declare-fun b!122541 () Bool)

(assert (=> b!122541 (= e!80298 (= (bitIndex!0 (size!2453 (buf!2893 (_1!5440 lt!192779))) (currentByte!5590 (_1!5440 lt!192779)) (currentBit!5585 (_1!5440 lt!192779))) lt!192785))))

(declare-fun b!122542 () Bool)

(declare-fun res!101557 () Bool)

(assert (=> b!122542 (=> (not res!101557) (not e!80305))))

(assert (=> b!122542 (= res!101557 (invariant!0 (currentBit!5585 thiss!1305) (currentByte!5590 thiss!1305) (size!2453 (buf!2893 (_2!5438 lt!192792)))))))

(declare-fun res!101555 () Bool)

(declare-fun e!80302 () Bool)

(assert (=> start!24172 (=> (not res!101555) (not e!80302))))

(assert (=> start!24172 (= res!101555 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24172 e!80302))

(assert (=> start!24172 true))

(declare-fun inv!12 (BitStream!4380) Bool)

(assert (=> start!24172 (and (inv!12 thiss!1305) e!80306)))

(declare-fun b!122543 () Bool)

(assert (=> b!122543 (= e!80302 e!80304)))

(declare-fun res!101551 () Bool)

(assert (=> b!122543 (=> (not res!101551) (not e!80304))))

(assert (=> b!122543 (= res!101551 (validate_offset_bits!1 ((_ sign_extend 32) (size!2453 (buf!2893 thiss!1305))) ((_ sign_extend 32) (currentByte!5590 thiss!1305)) ((_ sign_extend 32) (currentBit!5585 thiss!1305)) lt!192784))))

(assert (=> b!122543 (= lt!192784 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!122544 () Bool)

(declare-fun res!101558 () Bool)

(assert (=> b!122544 (=> (not res!101558) (not e!80307))))

(assert (=> b!122544 (= res!101558 (isPrefixOf!0 thiss!1305 (_2!5438 lt!192792)))))

(declare-fun b!122545 () Bool)

(assert (=> b!122545 (= e!80303 (= (_2!5440 lt!192793) (_2!5440 lt!192780)))))

(assert (= (and start!24172 res!101555) b!122543))

(assert (= (and b!122543 res!101551) b!122539))

(assert (= (and b!122539 res!101548) b!122536))

(assert (= (and b!122536 res!101552) b!122535))

(assert (= (and b!122535 res!101554) b!122538))

(assert (= (and b!122538 res!101547) b!122544))

(assert (= (and b!122544 res!101558) b!122534))

(assert (= (and b!122534 res!101553) b!122541))

(assert (= (and b!122535 res!101559) b!122542))

(assert (= (and b!122542 res!101557) b!122540))

(assert (= (and b!122535 res!101549) b!122545))

(assert (= (and b!122535 (not res!101556)) b!122532))

(assert (= (and b!122532 res!101550) b!122533))

(assert (= start!24172 b!122537))

(declare-fun m!186121 () Bool)

(assert (=> b!122532 m!186121))

(declare-fun m!186123 () Bool)

(assert (=> b!122532 m!186123))

(declare-fun m!186125 () Bool)

(assert (=> b!122532 m!186125))

(declare-fun m!186127 () Bool)

(assert (=> b!122532 m!186127))

(declare-fun m!186129 () Bool)

(assert (=> b!122532 m!186129))

(declare-fun m!186131 () Bool)

(assert (=> b!122532 m!186131))

(declare-fun m!186133 () Bool)

(assert (=> b!122532 m!186133))

(declare-fun m!186135 () Bool)

(assert (=> b!122532 m!186135))

(declare-fun m!186137 () Bool)

(assert (=> start!24172 m!186137))

(declare-fun m!186139 () Bool)

(assert (=> b!122544 m!186139))

(declare-fun m!186141 () Bool)

(assert (=> b!122539 m!186141))

(declare-fun m!186143 () Bool)

(assert (=> b!122541 m!186143))

(declare-fun m!186145 () Bool)

(assert (=> b!122543 m!186145))

(declare-fun m!186147 () Bool)

(assert (=> b!122534 m!186147))

(assert (=> b!122534 m!186147))

(declare-fun m!186149 () Bool)

(assert (=> b!122534 m!186149))

(declare-fun m!186151 () Bool)

(assert (=> b!122540 m!186151))

(assert (=> b!122538 m!186131))

(assert (=> b!122538 m!186133))

(declare-fun m!186153 () Bool)

(assert (=> b!122535 m!186153))

(declare-fun m!186155 () Bool)

(assert (=> b!122535 m!186155))

(declare-fun m!186157 () Bool)

(assert (=> b!122535 m!186157))

(declare-fun m!186159 () Bool)

(assert (=> b!122535 m!186159))

(declare-fun m!186161 () Bool)

(assert (=> b!122535 m!186161))

(declare-fun m!186163 () Bool)

(assert (=> b!122535 m!186163))

(declare-fun m!186165 () Bool)

(assert (=> b!122535 m!186165))

(declare-fun m!186167 () Bool)

(assert (=> b!122535 m!186167))

(declare-fun m!186169 () Bool)

(assert (=> b!122535 m!186169))

(declare-fun m!186171 () Bool)

(assert (=> b!122535 m!186171))

(declare-fun m!186173 () Bool)

(assert (=> b!122535 m!186173))

(declare-fun m!186175 () Bool)

(assert (=> b!122535 m!186175))

(declare-fun m!186177 () Bool)

(assert (=> b!122535 m!186177))

(declare-fun m!186179 () Bool)

(assert (=> b!122535 m!186179))

(declare-fun m!186181 () Bool)

(assert (=> b!122535 m!186181))

(declare-fun m!186183 () Bool)

(assert (=> b!122535 m!186183))

(declare-fun m!186185 () Bool)

(assert (=> b!122535 m!186185))

(declare-fun m!186187 () Bool)

(assert (=> b!122535 m!186187))

(declare-fun m!186189 () Bool)

(assert (=> b!122535 m!186189))

(declare-fun m!186191 () Bool)

(assert (=> b!122542 m!186191))

(declare-fun m!186193 () Bool)

(assert (=> b!122537 m!186193))

(check-sat (not b!122539) (not b!122540) (not b!122544) (not b!122538) (not start!24172) (not b!122543) (not b!122532) (not b!122534) (not b!122542) (not b!122541) (not b!122537) (not b!122535))
(check-sat)
