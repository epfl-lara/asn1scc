; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21234 () Bool)

(assert start!21234)

(declare-fun b!106936 () Bool)

(declare-fun e!69999 () Bool)

(declare-fun e!69998 () Bool)

(assert (=> b!106936 (= e!69999 (not e!69998))))

(declare-fun res!88100 () Bool)

(assert (=> b!106936 (=> res!88100 e!69998)))

(declare-fun lt!159472 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((array!4912 0))(
  ( (array!4913 (arr!2830 (Array (_ BitVec 32) (_ BitVec 8))) (size!2237 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3948 0))(
  ( (BitStream!3949 (buf!2619 array!4912) (currentByte!5137 (_ BitVec 32)) (currentBit!5132 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8796 0))(
  ( (tuple2!8797 (_1!4655 BitStream!3948) (_2!4655 BitStream!3948)) )
))
(declare-fun lt!159470 () tuple2!8796)

(declare-datatypes ((tuple2!8798 0))(
  ( (tuple2!8799 (_1!4656 BitStream!3948) (_2!4656 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8798)

(assert (=> b!106936 (= res!88100 (not (= (_1!4656 (readNLeastSignificantBitsLoopPure!0 (_1!4655 lt!159470) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159472)) (_2!4655 lt!159470))))))

(declare-datatypes ((Unit!6552 0))(
  ( (Unit!6553) )
))
(declare-datatypes ((tuple2!8800 0))(
  ( (tuple2!8801 (_1!4657 Unit!6552) (_2!4657 BitStream!3948)) )
))
(declare-fun lt!159466 () tuple2!8800)

(declare-fun lt!159462 () tuple2!8800)

(declare-fun lt!159467 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106936 (validate_offset_bits!1 ((_ sign_extend 32) (size!2237 (buf!2619 (_2!4657 lt!159466)))) ((_ sign_extend 32) (currentByte!5137 (_2!4657 lt!159462))) ((_ sign_extend 32) (currentBit!5132 (_2!4657 lt!159462))) lt!159467)))

(declare-fun lt!159469 () Unit!6552)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3948 array!4912 (_ BitVec 64)) Unit!6552)

(assert (=> b!106936 (= lt!159469 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4657 lt!159462) (buf!2619 (_2!4657 lt!159466)) lt!159467))))

(assert (=> b!106936 (= lt!159467 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!159485 () (_ BitVec 64))

(declare-datatypes ((tuple2!8802 0))(
  ( (tuple2!8803 (_1!4658 BitStream!3948) (_2!4658 Bool)) )
))
(declare-fun lt!159463 () tuple2!8802)

(declare-fun lt!159482 () (_ BitVec 64))

(assert (=> b!106936 (= lt!159472 (bvor lt!159482 (ite (_2!4658 lt!159463) lt!159485 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!159483 () tuple2!8798)

(declare-fun lt!159480 () tuple2!8796)

(assert (=> b!106936 (= lt!159483 (readNLeastSignificantBitsLoopPure!0 (_1!4655 lt!159480) nBits!396 i!615 lt!159482))))

(declare-fun thiss!1305 () BitStream!3948)

(declare-fun lt!159484 () (_ BitVec 64))

(assert (=> b!106936 (validate_offset_bits!1 ((_ sign_extend 32) (size!2237 (buf!2619 (_2!4657 lt!159466)))) ((_ sign_extend 32) (currentByte!5137 thiss!1305)) ((_ sign_extend 32) (currentBit!5132 thiss!1305)) lt!159484)))

(declare-fun lt!159471 () Unit!6552)

(assert (=> b!106936 (= lt!159471 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2619 (_2!4657 lt!159466)) lt!159484))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106936 (= lt!159482 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!159464 () Bool)

(assert (=> b!106936 (= (_2!4658 lt!159463) lt!159464)))

(declare-fun readBitPure!0 (BitStream!3948) tuple2!8802)

(assert (=> b!106936 (= lt!159463 (readBitPure!0 (_1!4655 lt!159480)))))

(declare-fun reader!0 (BitStream!3948 BitStream!3948) tuple2!8796)

(assert (=> b!106936 (= lt!159470 (reader!0 (_2!4657 lt!159462) (_2!4657 lt!159466)))))

(assert (=> b!106936 (= lt!159480 (reader!0 thiss!1305 (_2!4657 lt!159466)))))

(declare-fun e!69991 () Bool)

(assert (=> b!106936 e!69991))

(declare-fun res!88104 () Bool)

(assert (=> b!106936 (=> (not res!88104) (not e!69991))))

(declare-fun lt!159477 () tuple2!8802)

(declare-fun lt!159465 () tuple2!8802)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106936 (= res!88104 (= (bitIndex!0 (size!2237 (buf!2619 (_1!4658 lt!159477))) (currentByte!5137 (_1!4658 lt!159477)) (currentBit!5132 (_1!4658 lt!159477))) (bitIndex!0 (size!2237 (buf!2619 (_1!4658 lt!159465))) (currentByte!5137 (_1!4658 lt!159465)) (currentBit!5132 (_1!4658 lt!159465)))))))

(declare-fun lt!159476 () Unit!6552)

(declare-fun lt!159479 () BitStream!3948)

(declare-fun readBitPrefixLemma!0 (BitStream!3948 BitStream!3948) Unit!6552)

(assert (=> b!106936 (= lt!159476 (readBitPrefixLemma!0 lt!159479 (_2!4657 lt!159466)))))

(assert (=> b!106936 (= lt!159465 (readBitPure!0 (BitStream!3949 (buf!2619 (_2!4657 lt!159466)) (currentByte!5137 thiss!1305) (currentBit!5132 thiss!1305))))))

(assert (=> b!106936 (= lt!159477 (readBitPure!0 lt!159479))))

(assert (=> b!106936 (= lt!159479 (BitStream!3949 (buf!2619 (_2!4657 lt!159462)) (currentByte!5137 thiss!1305) (currentBit!5132 thiss!1305)))))

(declare-fun e!69996 () Bool)

(assert (=> b!106936 e!69996))

(declare-fun res!88097 () Bool)

(assert (=> b!106936 (=> (not res!88097) (not e!69996))))

(declare-fun isPrefixOf!0 (BitStream!3948 BitStream!3948) Bool)

(assert (=> b!106936 (= res!88097 (isPrefixOf!0 thiss!1305 (_2!4657 lt!159466)))))

(declare-fun lt!159475 () Unit!6552)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3948 BitStream!3948 BitStream!3948) Unit!6552)

(assert (=> b!106936 (= lt!159475 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4657 lt!159462) (_2!4657 lt!159466)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3948 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8800)

(assert (=> b!106936 (= lt!159466 (appendNLeastSignificantBitsLoop!0 (_2!4657 lt!159462) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!69997 () Bool)

(assert (=> b!106936 e!69997))

(declare-fun res!88095 () Bool)

(assert (=> b!106936 (=> (not res!88095) (not e!69997))))

(assert (=> b!106936 (= res!88095 (= (size!2237 (buf!2619 thiss!1305)) (size!2237 (buf!2619 (_2!4657 lt!159462)))))))

(declare-fun appendBit!0 (BitStream!3948 Bool) tuple2!8800)

(assert (=> b!106936 (= lt!159462 (appendBit!0 thiss!1305 lt!159464))))

(assert (=> b!106936 (= lt!159464 (not (= (bvand v!199 lt!159485) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106936 (= lt!159485 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!106937 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!106937 (= e!69998 (invariant!0 (currentBit!5132 thiss!1305) (currentByte!5137 thiss!1305) (size!2237 (buf!2619 thiss!1305))))))

(declare-fun e!69993 () Bool)

(assert (=> b!106937 e!69993))

(declare-fun res!88107 () Bool)

(assert (=> b!106937 (=> (not res!88107) (not e!69993))))

(declare-fun lt!159481 () (_ BitVec 64))

(declare-fun lt!159461 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3948 (_ BitVec 64)) BitStream!3948)

(assert (=> b!106937 (= res!88107 (= (_1!4655 lt!159480) (withMovedBitIndex!0 (_2!4655 lt!159480) (bvsub lt!159481 lt!159461))))))

(assert (=> b!106937 (= lt!159461 (bitIndex!0 (size!2237 (buf!2619 (_2!4657 lt!159466))) (currentByte!5137 (_2!4657 lt!159466)) (currentBit!5132 (_2!4657 lt!159466))))))

(assert (=> b!106937 (= lt!159481 (bitIndex!0 (size!2237 (buf!2619 thiss!1305)) (currentByte!5137 thiss!1305) (currentBit!5132 thiss!1305)))))

(declare-fun lt!159486 () tuple2!8798)

(assert (=> b!106937 (and (= (_2!4656 lt!159483) (_2!4656 lt!159486)) (= (_1!4656 lt!159483) (_1!4656 lt!159486)))))

(declare-fun lt!159478 () Unit!6552)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6552)

(assert (=> b!106937 (= lt!159478 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4655 lt!159480) nBits!396 i!615 lt!159482))))

(assert (=> b!106937 (= lt!159486 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4655 lt!159480) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!159472))))

(declare-fun b!106938 () Bool)

(declare-fun res!88102 () Bool)

(assert (=> b!106938 (=> (not res!88102) (not e!69999))))

(assert (=> b!106938 (= res!88102 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!106939 () Bool)

(assert (=> b!106939 (= e!69991 (= (_2!4658 lt!159477) (_2!4658 lt!159465)))))

(declare-fun b!106940 () Bool)

(declare-fun res!88099 () Bool)

(assert (=> b!106940 (=> (not res!88099) (not e!69996))))

(assert (=> b!106940 (= res!88099 (invariant!0 (currentBit!5132 thiss!1305) (currentByte!5137 thiss!1305) (size!2237 (buf!2619 (_2!4657 lt!159462)))))))

(declare-fun b!106941 () Bool)

(assert (=> b!106941 (= e!69993 (= (_1!4655 lt!159470) (withMovedBitIndex!0 (_2!4655 lt!159470) (bvsub (bitIndex!0 (size!2237 (buf!2619 (_2!4657 lt!159462))) (currentByte!5137 (_2!4657 lt!159462)) (currentBit!5132 (_2!4657 lt!159462))) lt!159461))))))

(declare-fun b!106942 () Bool)

(assert (=> b!106942 (= e!69996 (invariant!0 (currentBit!5132 thiss!1305) (currentByte!5137 thiss!1305) (size!2237 (buf!2619 (_2!4657 lt!159466)))))))

(declare-fun b!106943 () Bool)

(declare-fun e!69994 () Bool)

(assert (=> b!106943 (= e!69994 e!69999)))

(declare-fun res!88106 () Bool)

(assert (=> b!106943 (=> (not res!88106) (not e!69999))))

(assert (=> b!106943 (= res!88106 (validate_offset_bits!1 ((_ sign_extend 32) (size!2237 (buf!2619 thiss!1305))) ((_ sign_extend 32) (currentByte!5137 thiss!1305)) ((_ sign_extend 32) (currentBit!5132 thiss!1305)) lt!159484))))

(assert (=> b!106943 (= lt!159484 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!88098 () Bool)

(assert (=> start!21234 (=> (not res!88098) (not e!69994))))

(assert (=> start!21234 (= res!88098 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21234 e!69994))

(assert (=> start!21234 true))

(declare-fun e!69989 () Bool)

(declare-fun inv!12 (BitStream!3948) Bool)

(assert (=> start!21234 (and (inv!12 thiss!1305) e!69989)))

(declare-fun b!106944 () Bool)

(declare-fun res!88103 () Bool)

(assert (=> b!106944 (=> (not res!88103) (not e!69999))))

(assert (=> b!106944 (= res!88103 (bvslt i!615 nBits!396))))

(declare-fun b!106945 () Bool)

(declare-fun res!88096 () Bool)

(declare-fun e!69995 () Bool)

(assert (=> b!106945 (=> (not res!88096) (not e!69995))))

(assert (=> b!106945 (= res!88096 (isPrefixOf!0 thiss!1305 (_2!4657 lt!159462)))))

(declare-fun b!106946 () Bool)

(declare-fun e!69992 () Bool)

(assert (=> b!106946 (= e!69995 e!69992)))

(declare-fun res!88101 () Bool)

(assert (=> b!106946 (=> (not res!88101) (not e!69992))))

(declare-fun lt!159474 () tuple2!8802)

(assert (=> b!106946 (= res!88101 (and (= (_2!4658 lt!159474) lt!159464) (= (_1!4658 lt!159474) (_2!4657 lt!159462))))))

(declare-fun readerFrom!0 (BitStream!3948 (_ BitVec 32) (_ BitVec 32)) BitStream!3948)

(assert (=> b!106946 (= lt!159474 (readBitPure!0 (readerFrom!0 (_2!4657 lt!159462) (currentBit!5132 thiss!1305) (currentByte!5137 thiss!1305))))))

(declare-fun b!106947 () Bool)

(assert (=> b!106947 (= e!69997 e!69995)))

(declare-fun res!88105 () Bool)

(assert (=> b!106947 (=> (not res!88105) (not e!69995))))

(declare-fun lt!159468 () (_ BitVec 64))

(declare-fun lt!159473 () (_ BitVec 64))

(assert (=> b!106947 (= res!88105 (= lt!159468 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!159473)))))

(assert (=> b!106947 (= lt!159468 (bitIndex!0 (size!2237 (buf!2619 (_2!4657 lt!159462))) (currentByte!5137 (_2!4657 lt!159462)) (currentBit!5132 (_2!4657 lt!159462))))))

(assert (=> b!106947 (= lt!159473 (bitIndex!0 (size!2237 (buf!2619 thiss!1305)) (currentByte!5137 thiss!1305) (currentBit!5132 thiss!1305)))))

(declare-fun b!106948 () Bool)

(declare-fun array_inv!2039 (array!4912) Bool)

(assert (=> b!106948 (= e!69989 (array_inv!2039 (buf!2619 thiss!1305)))))

(declare-fun b!106949 () Bool)

(assert (=> b!106949 (= e!69992 (= (bitIndex!0 (size!2237 (buf!2619 (_1!4658 lt!159474))) (currentByte!5137 (_1!4658 lt!159474)) (currentBit!5132 (_1!4658 lt!159474))) lt!159468))))

(assert (= (and start!21234 res!88098) b!106943))

(assert (= (and b!106943 res!88106) b!106938))

(assert (= (and b!106938 res!88102) b!106944))

(assert (= (and b!106944 res!88103) b!106936))

(assert (= (and b!106936 res!88095) b!106947))

(assert (= (and b!106947 res!88105) b!106945))

(assert (= (and b!106945 res!88096) b!106946))

(assert (= (and b!106946 res!88101) b!106949))

(assert (= (and b!106936 res!88097) b!106940))

(assert (= (and b!106940 res!88099) b!106942))

(assert (= (and b!106936 res!88104) b!106939))

(assert (= (and b!106936 (not res!88100)) b!106937))

(assert (= (and b!106937 res!88107) b!106941))

(assert (= start!21234 b!106948))

(declare-fun m!157747 () Bool)

(assert (=> b!106948 m!157747))

(declare-fun m!157749 () Bool)

(assert (=> b!106940 m!157749))

(declare-fun m!157751 () Bool)

(assert (=> b!106938 m!157751))

(declare-fun m!157753 () Bool)

(assert (=> b!106945 m!157753))

(declare-fun m!157755 () Bool)

(assert (=> b!106946 m!157755))

(assert (=> b!106946 m!157755))

(declare-fun m!157757 () Bool)

(assert (=> b!106946 m!157757))

(declare-fun m!157759 () Bool)

(assert (=> b!106943 m!157759))

(declare-fun m!157761 () Bool)

(assert (=> start!21234 m!157761))

(declare-fun m!157763 () Bool)

(assert (=> b!106947 m!157763))

(declare-fun m!157765 () Bool)

(assert (=> b!106947 m!157765))

(assert (=> b!106941 m!157763))

(declare-fun m!157767 () Bool)

(assert (=> b!106941 m!157767))

(declare-fun m!157769 () Bool)

(assert (=> b!106936 m!157769))

(declare-fun m!157771 () Bool)

(assert (=> b!106936 m!157771))

(declare-fun m!157773 () Bool)

(assert (=> b!106936 m!157773))

(declare-fun m!157775 () Bool)

(assert (=> b!106936 m!157775))

(declare-fun m!157777 () Bool)

(assert (=> b!106936 m!157777))

(declare-fun m!157779 () Bool)

(assert (=> b!106936 m!157779))

(declare-fun m!157781 () Bool)

(assert (=> b!106936 m!157781))

(declare-fun m!157783 () Bool)

(assert (=> b!106936 m!157783))

(declare-fun m!157785 () Bool)

(assert (=> b!106936 m!157785))

(declare-fun m!157787 () Bool)

(assert (=> b!106936 m!157787))

(declare-fun m!157789 () Bool)

(assert (=> b!106936 m!157789))

(declare-fun m!157791 () Bool)

(assert (=> b!106936 m!157791))

(declare-fun m!157793 () Bool)

(assert (=> b!106936 m!157793))

(declare-fun m!157795 () Bool)

(assert (=> b!106936 m!157795))

(declare-fun m!157797 () Bool)

(assert (=> b!106936 m!157797))

(declare-fun m!157799 () Bool)

(assert (=> b!106936 m!157799))

(declare-fun m!157801 () Bool)

(assert (=> b!106936 m!157801))

(declare-fun m!157803 () Bool)

(assert (=> b!106936 m!157803))

(declare-fun m!157805 () Bool)

(assert (=> b!106936 m!157805))

(declare-fun m!157807 () Bool)

(assert (=> b!106937 m!157807))

(declare-fun m!157809 () Bool)

(assert (=> b!106937 m!157809))

(assert (=> b!106937 m!157765))

(assert (=> b!106937 m!157807))

(declare-fun m!157811 () Bool)

(assert (=> b!106937 m!157811))

(declare-fun m!157813 () Bool)

(assert (=> b!106937 m!157813))

(declare-fun m!157815 () Bool)

(assert (=> b!106937 m!157815))

(declare-fun m!157817 () Bool)

(assert (=> b!106937 m!157817))

(declare-fun m!157819 () Bool)

(assert (=> b!106949 m!157819))

(declare-fun m!157821 () Bool)

(assert (=> b!106942 m!157821))

(check-sat (not b!106943) (not b!106938) (not b!106936) (not b!106946) (not start!21234) (not b!106947) (not b!106942) (not b!106945) (not b!106937) (not b!106940) (not b!106941) (not b!106948) (not b!106949))
