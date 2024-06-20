; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27482 () Bool)

(assert start!27482)

(declare-fun b!141605 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((array!6497 0))(
  ( (array!6498 (arr!3649 (Array (_ BitVec 32) (_ BitVec 8))) (size!2942 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5142 0))(
  ( (BitStream!5143 (buf!3363 array!6497) (currentByte!6223 (_ BitVec 32)) (currentBit!6218 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12552 0))(
  ( (tuple2!12553 (_1!6606 BitStream!5142) (_2!6606 BitStream!5142)) )
))
(declare-fun lt!219664 () tuple2!12552)

(declare-datatypes ((tuple2!12554 0))(
  ( (tuple2!12555 (_1!6607 BitStream!5142) (_2!6607 (_ BitVec 8))) )
))
(declare-fun lt!219663 () tuple2!12554)

(declare-fun e!94342 () Bool)

(declare-fun arr!237 () array!6497)

(assert (=> b!141605 (= e!94342 (and (= (_2!6607 lt!219663) (select (arr!3649 arr!237) from!447)) (= (_1!6607 lt!219663) (_2!6606 lt!219664))))))

(declare-fun readBytePure!0 (BitStream!5142) tuple2!12554)

(assert (=> b!141605 (= lt!219663 (readBytePure!0 (_1!6606 lt!219664)))))

(declare-fun thiss!1634 () BitStream!5142)

(declare-datatypes ((Unit!8866 0))(
  ( (Unit!8867) )
))
(declare-datatypes ((tuple2!12556 0))(
  ( (tuple2!12557 (_1!6608 Unit!8866) (_2!6608 BitStream!5142)) )
))
(declare-fun lt!219660 () tuple2!12556)

(declare-fun reader!0 (BitStream!5142 BitStream!5142) tuple2!12552)

(assert (=> b!141605 (= lt!219664 (reader!0 thiss!1634 (_2!6608 lt!219660)))))

(declare-fun b!141606 () Bool)

(declare-fun res!118137 () Bool)

(declare-fun e!94341 () Bool)

(assert (=> b!141606 (=> (not res!118137) (not e!94341))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141606 (= res!118137 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2942 (buf!3363 thiss!1634))) ((_ sign_extend 32) (currentByte!6223 thiss!1634)) ((_ sign_extend 32) (currentBit!6218 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!118138 () Bool)

(assert (=> start!27482 (=> (not res!118138) (not e!94341))))

(assert (=> start!27482 (= res!118138 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2942 arr!237))))))

(assert (=> start!27482 e!94341))

(assert (=> start!27482 true))

(declare-fun array_inv!2731 (array!6497) Bool)

(assert (=> start!27482 (array_inv!2731 arr!237)))

(declare-fun e!94339 () Bool)

(declare-fun inv!12 (BitStream!5142) Bool)

(assert (=> start!27482 (and (inv!12 thiss!1634) e!94339)))

(declare-fun b!141607 () Bool)

(declare-fun res!118133 () Bool)

(assert (=> b!141607 (=> (not res!118133) (not e!94341))))

(assert (=> b!141607 (= res!118133 (bvslt from!447 to!404))))

(declare-fun b!141608 () Bool)

(declare-fun e!94340 () Bool)

(declare-datatypes ((tuple2!12558 0))(
  ( (tuple2!12559 (_1!6609 BitStream!5142) (_2!6609 array!6497)) )
))
(declare-fun lt!219666 () tuple2!12558)

(declare-fun arrayRangesEq!258 (array!6497 array!6497 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141608 (= e!94340 (not (arrayRangesEq!258 arr!237 (_2!6609 lt!219666) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141609 () Bool)

(declare-fun res!118134 () Bool)

(declare-fun e!94343 () Bool)

(assert (=> b!141609 (=> (not res!118134) (not e!94343))))

(declare-fun lt!219659 () tuple2!12556)

(declare-fun isPrefixOf!0 (BitStream!5142 BitStream!5142) Bool)

(assert (=> b!141609 (= res!118134 (isPrefixOf!0 (_2!6608 lt!219660) (_2!6608 lt!219659)))))

(declare-fun b!141610 () Bool)

(declare-fun res!118136 () Bool)

(assert (=> b!141610 (=> (not res!118136) (not e!94342))))

(assert (=> b!141610 (= res!118136 (isPrefixOf!0 thiss!1634 (_2!6608 lt!219660)))))

(declare-fun b!141611 () Bool)

(declare-fun res!118139 () Bool)

(assert (=> b!141611 (=> (not res!118139) (not e!94341))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141611 (= res!118139 (invariant!0 (currentBit!6218 thiss!1634) (currentByte!6223 thiss!1634) (size!2942 (buf!3363 thiss!1634))))))

(declare-fun b!141612 () Bool)

(declare-fun e!94346 () Bool)

(assert (=> b!141612 (= e!94346 (invariant!0 (currentBit!6218 thiss!1634) (currentByte!6223 thiss!1634) (size!2942 (buf!3363 (_2!6608 lt!219660)))))))

(declare-fun b!141613 () Bool)

(assert (=> b!141613 (= e!94343 (not e!94340))))

(declare-fun res!118140 () Bool)

(assert (=> b!141613 (=> res!118140 e!94340)))

(declare-fun lt!219662 () tuple2!12552)

(assert (=> b!141613 (= res!118140 (or (not (= (size!2942 (_2!6609 lt!219666)) (size!2942 arr!237))) (not (= (_1!6609 lt!219666) (_2!6606 lt!219662)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5142 array!6497 (_ BitVec 32) (_ BitVec 32)) tuple2!12558)

(assert (=> b!141613 (= lt!219666 (readByteArrayLoopPure!0 (_1!6606 lt!219662) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!219661 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141613 (validate_offset_bits!1 ((_ sign_extend 32) (size!2942 (buf!3363 (_2!6608 lt!219659)))) ((_ sign_extend 32) (currentByte!6223 (_2!6608 lt!219660))) ((_ sign_extend 32) (currentBit!6218 (_2!6608 lt!219660))) lt!219661)))

(declare-fun lt!219668 () Unit!8866)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5142 array!6497 (_ BitVec 64)) Unit!8866)

(assert (=> b!141613 (= lt!219668 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6608 lt!219660) (buf!3363 (_2!6608 lt!219659)) lt!219661))))

(assert (=> b!141613 (= lt!219662 (reader!0 (_2!6608 lt!219660) (_2!6608 lt!219659)))))

(declare-fun b!141614 () Bool)

(assert (=> b!141614 (= e!94339 (array_inv!2731 (buf!3363 thiss!1634)))))

(declare-fun b!141615 () Bool)

(declare-fun res!118131 () Bool)

(assert (=> b!141615 (=> (not res!118131) (not e!94342))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141615 (= res!118131 (= (bitIndex!0 (size!2942 (buf!3363 (_2!6608 lt!219660))) (currentByte!6223 (_2!6608 lt!219660)) (currentBit!6218 (_2!6608 lt!219660))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2942 (buf!3363 thiss!1634)) (currentByte!6223 thiss!1634) (currentBit!6218 thiss!1634)))))))

(declare-fun b!141616 () Bool)

(assert (=> b!141616 (= e!94341 (not true))))

(assert (=> b!141616 e!94346))

(declare-fun res!118135 () Bool)

(assert (=> b!141616 (=> (not res!118135) (not e!94346))))

(assert (=> b!141616 (= res!118135 (isPrefixOf!0 thiss!1634 (_2!6608 lt!219659)))))

(declare-fun lt!219665 () Unit!8866)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5142 BitStream!5142 BitStream!5142) Unit!8866)

(assert (=> b!141616 (= lt!219665 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6608 lt!219660) (_2!6608 lt!219659)))))

(declare-fun e!94347 () Bool)

(assert (=> b!141616 e!94347))

(declare-fun res!118130 () Bool)

(assert (=> b!141616 (=> (not res!118130) (not e!94347))))

(assert (=> b!141616 (= res!118130 (= (size!2942 (buf!3363 (_2!6608 lt!219660))) (size!2942 (buf!3363 (_2!6608 lt!219659)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5142 array!6497 (_ BitVec 32) (_ BitVec 32)) tuple2!12556)

(assert (=> b!141616 (= lt!219659 (appendByteArrayLoop!0 (_2!6608 lt!219660) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!141616 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2942 (buf!3363 (_2!6608 lt!219660)))) ((_ sign_extend 32) (currentByte!6223 (_2!6608 lt!219660))) ((_ sign_extend 32) (currentBit!6218 (_2!6608 lt!219660))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219667 () Unit!8866)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5142 BitStream!5142 (_ BitVec 64) (_ BitVec 32)) Unit!8866)

(assert (=> b!141616 (= lt!219667 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6608 lt!219660) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!141616 e!94342))

(declare-fun res!118132 () Bool)

(assert (=> b!141616 (=> (not res!118132) (not e!94342))))

(assert (=> b!141616 (= res!118132 (= (size!2942 (buf!3363 thiss!1634)) (size!2942 (buf!3363 (_2!6608 lt!219660)))))))

(declare-fun appendByte!0 (BitStream!5142 (_ BitVec 8)) tuple2!12556)

(assert (=> b!141616 (= lt!219660 (appendByte!0 thiss!1634 (select (arr!3649 arr!237) from!447)))))

(declare-fun b!141617 () Bool)

(assert (=> b!141617 (= e!94347 e!94343)))

(declare-fun res!118141 () Bool)

(assert (=> b!141617 (=> (not res!118141) (not e!94343))))

(assert (=> b!141617 (= res!118141 (= (bitIndex!0 (size!2942 (buf!3363 (_2!6608 lt!219659))) (currentByte!6223 (_2!6608 lt!219659)) (currentBit!6218 (_2!6608 lt!219659))) (bvadd (bitIndex!0 (size!2942 (buf!3363 (_2!6608 lt!219660))) (currentByte!6223 (_2!6608 lt!219660)) (currentBit!6218 (_2!6608 lt!219660))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219661))))))

(assert (=> b!141617 (= lt!219661 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!27482 res!118138) b!141606))

(assert (= (and b!141606 res!118137) b!141607))

(assert (= (and b!141607 res!118133) b!141611))

(assert (= (and b!141611 res!118139) b!141616))

(assert (= (and b!141616 res!118132) b!141615))

(assert (= (and b!141615 res!118131) b!141610))

(assert (= (and b!141610 res!118136) b!141605))

(assert (= (and b!141616 res!118130) b!141617))

(assert (= (and b!141617 res!118141) b!141609))

(assert (= (and b!141609 res!118134) b!141613))

(assert (= (and b!141613 (not res!118140)) b!141608))

(assert (= (and b!141616 res!118135) b!141612))

(assert (= start!27482 b!141614))

(declare-fun m!217531 () Bool)

(assert (=> b!141611 m!217531))

(declare-fun m!217533 () Bool)

(assert (=> b!141606 m!217533))

(declare-fun m!217535 () Bool)

(assert (=> b!141605 m!217535))

(declare-fun m!217537 () Bool)

(assert (=> b!141605 m!217537))

(declare-fun m!217539 () Bool)

(assert (=> b!141605 m!217539))

(declare-fun m!217541 () Bool)

(assert (=> b!141608 m!217541))

(declare-fun m!217543 () Bool)

(assert (=> start!27482 m!217543))

(declare-fun m!217545 () Bool)

(assert (=> start!27482 m!217545))

(declare-fun m!217547 () Bool)

(assert (=> b!141616 m!217547))

(declare-fun m!217549 () Bool)

(assert (=> b!141616 m!217549))

(declare-fun m!217551 () Bool)

(assert (=> b!141616 m!217551))

(declare-fun m!217553 () Bool)

(assert (=> b!141616 m!217553))

(declare-fun m!217555 () Bool)

(assert (=> b!141616 m!217555))

(assert (=> b!141616 m!217535))

(declare-fun m!217557 () Bool)

(assert (=> b!141616 m!217557))

(assert (=> b!141616 m!217535))

(declare-fun m!217559 () Bool)

(assert (=> b!141609 m!217559))

(declare-fun m!217561 () Bool)

(assert (=> b!141610 m!217561))

(declare-fun m!217563 () Bool)

(assert (=> b!141615 m!217563))

(declare-fun m!217565 () Bool)

(assert (=> b!141615 m!217565))

(declare-fun m!217567 () Bool)

(assert (=> b!141617 m!217567))

(assert (=> b!141617 m!217563))

(declare-fun m!217569 () Bool)

(assert (=> b!141612 m!217569))

(declare-fun m!217571 () Bool)

(assert (=> b!141614 m!217571))

(declare-fun m!217573 () Bool)

(assert (=> b!141613 m!217573))

(declare-fun m!217575 () Bool)

(assert (=> b!141613 m!217575))

(declare-fun m!217577 () Bool)

(assert (=> b!141613 m!217577))

(declare-fun m!217579 () Bool)

(assert (=> b!141613 m!217579))

(check-sat (not b!141617) (not b!141612) (not b!141615) (not b!141606) (not b!141616) (not b!141610) (not b!141608) (not start!27482) (not b!141614) (not b!141609) (not b!141611) (not b!141605) (not b!141613))
