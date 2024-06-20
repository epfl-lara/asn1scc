; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26894 () Bool)

(assert start!26894)

(declare-fun b!138734 () Bool)

(declare-fun res!115671 () Bool)

(declare-fun e!92277 () Bool)

(assert (=> b!138734 (=> (not res!115671) (not e!92277))))

(declare-datatypes ((array!6274 0))(
  ( (array!6275 (arr!3536 (Array (_ BitVec 32) (_ BitVec 8))) (size!2841 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4946 0))(
  ( (BitStream!4947 (buf!3254 array!6274) (currentByte!6067 (_ BitVec 32)) (currentBit!6062 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8638 0))(
  ( (Unit!8639) )
))
(declare-datatypes ((tuple2!12144 0))(
  ( (tuple2!12145 (_1!6398 Unit!8638) (_2!6398 BitStream!4946)) )
))
(declare-fun lt!216625 () tuple2!12144)

(declare-fun thiss!1634 () BitStream!4946)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!138734 (= res!115671 (= (bitIndex!0 (size!2841 (buf!3254 (_2!6398 lt!216625))) (currentByte!6067 (_2!6398 lt!216625)) (currentBit!6062 (_2!6398 lt!216625))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2841 (buf!3254 thiss!1634)) (currentByte!6067 thiss!1634) (currentBit!6062 thiss!1634)))))))

(declare-fun b!138735 () Bool)

(declare-fun e!92275 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138735 (= e!92275 (invariant!0 (currentBit!6062 thiss!1634) (currentByte!6067 thiss!1634) (size!2841 (buf!3254 (_2!6398 lt!216625)))))))

(declare-fun b!138736 () Bool)

(declare-fun e!92272 () Bool)

(declare-fun e!92274 () Bool)

(assert (=> b!138736 (= e!92272 e!92274)))

(declare-fun res!115666 () Bool)

(assert (=> b!138736 (=> res!115666 e!92274)))

(declare-fun lt!216629 () tuple2!12144)

(declare-fun lt!216624 () (_ BitVec 64))

(assert (=> b!138736 (= res!115666 (not (= (bitIndex!0 (size!2841 (buf!3254 (_2!6398 lt!216629))) (currentByte!6067 (_2!6398 lt!216629)) (currentBit!6062 (_2!6398 lt!216629))) (bvadd (bitIndex!0 (size!2841 (buf!3254 thiss!1634)) (currentByte!6067 thiss!1634) (currentBit!6062 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216624)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!138736 (= lt!216624 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!138737 () Bool)

(declare-fun res!115662 () Bool)

(declare-fun e!92279 () Bool)

(assert (=> b!138737 (=> (not res!115662) (not e!92279))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!138737 (= res!115662 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2841 (buf!3254 thiss!1634))) ((_ sign_extend 32) (currentByte!6067 thiss!1634)) ((_ sign_extend 32) (currentBit!6062 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!138738 () Bool)

(declare-fun e!92278 () Bool)

(declare-datatypes ((tuple2!12146 0))(
  ( (tuple2!12147 (_1!6399 BitStream!4946) (_2!6399 (_ BitVec 8))) )
))
(declare-fun lt!216634 () tuple2!12146)

(declare-fun lt!216644 () tuple2!12146)

(assert (=> b!138738 (= e!92278 (= (_2!6399 lt!216634) (_2!6399 lt!216644)))))

(declare-fun b!138739 () Bool)

(declare-fun e!92281 () Bool)

(assert (=> b!138739 (= e!92279 (not e!92281))))

(declare-fun res!115664 () Bool)

(assert (=> b!138739 (=> res!115664 e!92281)))

(declare-datatypes ((tuple2!12148 0))(
  ( (tuple2!12149 (_1!6400 BitStream!4946) (_2!6400 array!6274)) )
))
(declare-fun lt!216622 () tuple2!12148)

(declare-fun lt!216626 () tuple2!12148)

(declare-fun arrayRangesEq!244 (array!6274 array!6274 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!138739 (= res!115664 (not (arrayRangesEq!244 (_2!6400 lt!216626) (_2!6400 lt!216622) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!216630 () tuple2!12148)

(assert (=> b!138739 (arrayRangesEq!244 (_2!6400 lt!216626) (_2!6400 lt!216630) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216643 () Unit!8638)

(declare-fun arr!237 () array!6274)

(declare-datatypes ((tuple2!12150 0))(
  ( (tuple2!12151 (_1!6401 BitStream!4946) (_2!6401 BitStream!4946)) )
))
(declare-fun lt!216623 () tuple2!12150)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4946 array!6274 (_ BitVec 32) (_ BitVec 32)) Unit!8638)

(assert (=> b!138739 (= lt!216643 (readByteArrayLoopArrayPrefixLemma!0 (_1!6401 lt!216623) arr!237 from!447 to!404))))

(declare-fun lt!216636 () array!6274)

(declare-fun readByteArrayLoopPure!0 (BitStream!4946 array!6274 (_ BitVec 32) (_ BitVec 32)) tuple2!12148)

(declare-fun withMovedByteIndex!0 (BitStream!4946 (_ BitVec 32)) BitStream!4946)

(assert (=> b!138739 (= lt!216630 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6401 lt!216623) #b00000000000000000000000000000001) lt!216636 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!216646 () tuple2!12150)

(assert (=> b!138739 (= lt!216622 (readByteArrayLoopPure!0 (_1!6401 lt!216646) lt!216636 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!216627 () tuple2!12146)

(assert (=> b!138739 (= lt!216636 (array!6275 (store (arr!3536 arr!237) from!447 (_2!6399 lt!216627)) (size!2841 arr!237)))))

(declare-fun lt!216621 () (_ BitVec 32))

(assert (=> b!138739 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2841 (buf!3254 (_2!6398 lt!216629)))) ((_ sign_extend 32) (currentByte!6067 (_2!6398 lt!216625))) ((_ sign_extend 32) (currentBit!6062 (_2!6398 lt!216625))) lt!216621)))

(declare-fun lt!216628 () Unit!8638)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4946 array!6274 (_ BitVec 32)) Unit!8638)

(assert (=> b!138739 (= lt!216628 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6398 lt!216625) (buf!3254 (_2!6398 lt!216629)) lt!216621))))

(assert (=> b!138739 (= (_1!6400 lt!216626) (_2!6401 lt!216623))))

(assert (=> b!138739 (= lt!216626 (readByteArrayLoopPure!0 (_1!6401 lt!216623) arr!237 from!447 to!404))))

(assert (=> b!138739 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2841 (buf!3254 (_2!6398 lt!216629)))) ((_ sign_extend 32) (currentByte!6067 thiss!1634)) ((_ sign_extend 32) (currentBit!6062 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!216635 () Unit!8638)

(assert (=> b!138739 (= lt!216635 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3254 (_2!6398 lt!216629)) (bvsub to!404 from!447)))))

(assert (=> b!138739 (= (_2!6399 lt!216627) (select (arr!3536 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4946) tuple2!12146)

(assert (=> b!138739 (= lt!216627 (readBytePure!0 (_1!6401 lt!216623)))))

(declare-fun reader!0 (BitStream!4946 BitStream!4946) tuple2!12150)

(assert (=> b!138739 (= lt!216646 (reader!0 (_2!6398 lt!216625) (_2!6398 lt!216629)))))

(assert (=> b!138739 (= lt!216623 (reader!0 thiss!1634 (_2!6398 lt!216629)))))

(assert (=> b!138739 e!92278))

(declare-fun res!115668 () Bool)

(assert (=> b!138739 (=> (not res!115668) (not e!92278))))

(assert (=> b!138739 (= res!115668 (= (bitIndex!0 (size!2841 (buf!3254 (_1!6399 lt!216634))) (currentByte!6067 (_1!6399 lt!216634)) (currentBit!6062 (_1!6399 lt!216634))) (bitIndex!0 (size!2841 (buf!3254 (_1!6399 lt!216644))) (currentByte!6067 (_1!6399 lt!216644)) (currentBit!6062 (_1!6399 lt!216644)))))))

(declare-fun lt!216639 () Unit!8638)

(declare-fun lt!216631 () BitStream!4946)

(declare-fun readBytePrefixLemma!0 (BitStream!4946 BitStream!4946) Unit!8638)

(assert (=> b!138739 (= lt!216639 (readBytePrefixLemma!0 lt!216631 (_2!6398 lt!216629)))))

(assert (=> b!138739 (= lt!216644 (readBytePure!0 (BitStream!4947 (buf!3254 (_2!6398 lt!216629)) (currentByte!6067 thiss!1634) (currentBit!6062 thiss!1634))))))

(assert (=> b!138739 (= lt!216634 (readBytePure!0 lt!216631))))

(assert (=> b!138739 (= lt!216631 (BitStream!4947 (buf!3254 (_2!6398 lt!216625)) (currentByte!6067 thiss!1634) (currentBit!6062 thiss!1634)))))

(assert (=> b!138739 e!92275))

(declare-fun res!115658 () Bool)

(assert (=> b!138739 (=> (not res!115658) (not e!92275))))

(declare-fun isPrefixOf!0 (BitStream!4946 BitStream!4946) Bool)

(assert (=> b!138739 (= res!115658 (isPrefixOf!0 thiss!1634 (_2!6398 lt!216629)))))

(declare-fun lt!216637 () Unit!8638)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4946 BitStream!4946 BitStream!4946) Unit!8638)

(assert (=> b!138739 (= lt!216637 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6398 lt!216625) (_2!6398 lt!216629)))))

(declare-fun e!92280 () Bool)

(assert (=> b!138739 e!92280))

(declare-fun res!115661 () Bool)

(assert (=> b!138739 (=> (not res!115661) (not e!92280))))

(assert (=> b!138739 (= res!115661 (= (size!2841 (buf!3254 (_2!6398 lt!216625))) (size!2841 (buf!3254 (_2!6398 lt!216629)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4946 array!6274 (_ BitVec 32) (_ BitVec 32)) tuple2!12144)

(assert (=> b!138739 (= lt!216629 (appendByteArrayLoop!0 (_2!6398 lt!216625) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!138739 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2841 (buf!3254 (_2!6398 lt!216625)))) ((_ sign_extend 32) (currentByte!6067 (_2!6398 lt!216625))) ((_ sign_extend 32) (currentBit!6062 (_2!6398 lt!216625))) lt!216621)))

(assert (=> b!138739 (= lt!216621 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!216620 () Unit!8638)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4946 BitStream!4946 (_ BitVec 64) (_ BitVec 32)) Unit!8638)

(assert (=> b!138739 (= lt!216620 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6398 lt!216625) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!138739 e!92277))

(declare-fun res!115656 () Bool)

(assert (=> b!138739 (=> (not res!115656) (not e!92277))))

(assert (=> b!138739 (= res!115656 (= (size!2841 (buf!3254 thiss!1634)) (size!2841 (buf!3254 (_2!6398 lt!216625)))))))

(declare-fun appendByte!0 (BitStream!4946 (_ BitVec 8)) tuple2!12144)

(assert (=> b!138739 (= lt!216625 (appendByte!0 thiss!1634 (select (arr!3536 arr!237) from!447)))))

(declare-fun b!138741 () Bool)

(declare-fun e!92283 () Bool)

(assert (=> b!138741 (= e!92280 e!92283)))

(declare-fun res!115663 () Bool)

(assert (=> b!138741 (=> (not res!115663) (not e!92283))))

(declare-fun lt!216633 () (_ BitVec 64))

(assert (=> b!138741 (= res!115663 (= (bitIndex!0 (size!2841 (buf!3254 (_2!6398 lt!216629))) (currentByte!6067 (_2!6398 lt!216629)) (currentBit!6062 (_2!6398 lt!216629))) (bvadd (bitIndex!0 (size!2841 (buf!3254 (_2!6398 lt!216625))) (currentByte!6067 (_2!6398 lt!216625)) (currentBit!6062 (_2!6398 lt!216625))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!216633))))))

(assert (=> b!138741 (= lt!216633 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!138742 () Bool)

(declare-fun res!115667 () Bool)

(assert (=> b!138742 (=> (not res!115667) (not e!92279))))

(assert (=> b!138742 (= res!115667 (bvslt from!447 to!404))))

(declare-fun lt!216632 () tuple2!12148)

(declare-fun e!92273 () Bool)

(declare-fun b!138743 () Bool)

(assert (=> b!138743 (= e!92273 (not (arrayRangesEq!244 arr!237 (_2!6400 lt!216632) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!138744 () Bool)

(assert (=> b!138744 (= e!92283 (not e!92273))))

(declare-fun res!115670 () Bool)

(assert (=> b!138744 (=> res!115670 e!92273)))

(declare-fun lt!216645 () tuple2!12150)

(assert (=> b!138744 (= res!115670 (or (not (= (size!2841 (_2!6400 lt!216632)) (size!2841 arr!237))) (not (= (_1!6400 lt!216632) (_2!6401 lt!216645)))))))

(assert (=> b!138744 (= lt!216632 (readByteArrayLoopPure!0 (_1!6401 lt!216645) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!138744 (validate_offset_bits!1 ((_ sign_extend 32) (size!2841 (buf!3254 (_2!6398 lt!216629)))) ((_ sign_extend 32) (currentByte!6067 (_2!6398 lt!216625))) ((_ sign_extend 32) (currentBit!6062 (_2!6398 lt!216625))) lt!216633)))

(declare-fun lt!216648 () Unit!8638)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4946 array!6274 (_ BitVec 64)) Unit!8638)

(assert (=> b!138744 (= lt!216648 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6398 lt!216625) (buf!3254 (_2!6398 lt!216629)) lt!216633))))

(assert (=> b!138744 (= lt!216645 (reader!0 (_2!6398 lt!216625) (_2!6398 lt!216629)))))

(declare-fun res!115665 () Bool)

(assert (=> start!26894 (=> (not res!115665) (not e!92279))))

(assert (=> start!26894 (= res!115665 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2841 arr!237))))))

(assert (=> start!26894 e!92279))

(assert (=> start!26894 true))

(declare-fun array_inv!2630 (array!6274) Bool)

(assert (=> start!26894 (array_inv!2630 arr!237)))

(declare-fun e!92276 () Bool)

(declare-fun inv!12 (BitStream!4946) Bool)

(assert (=> start!26894 (and (inv!12 thiss!1634) e!92276)))

(declare-fun b!138740 () Bool)

(assert (=> b!138740 (= e!92274 true)))

(assert (=> b!138740 (validate_offset_bits!1 ((_ sign_extend 32) (size!2841 (buf!3254 (_2!6398 lt!216629)))) ((_ sign_extend 32) (currentByte!6067 thiss!1634)) ((_ sign_extend 32) (currentBit!6062 thiss!1634)) lt!216624)))

(declare-fun lt!216641 () Unit!8638)

(assert (=> b!138740 (= lt!216641 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3254 (_2!6398 lt!216629)) lt!216624))))

(declare-fun b!138745 () Bool)

(assert (=> b!138745 (= e!92281 e!92272)))

(declare-fun res!115660 () Bool)

(assert (=> b!138745 (=> res!115660 e!92272)))

(assert (=> b!138745 (= res!115660 (not (= (size!2841 (buf!3254 thiss!1634)) (size!2841 (buf!3254 (_2!6398 lt!216629))))))))

(assert (=> b!138745 (arrayRangesEq!244 arr!237 (_2!6400 lt!216626) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216638 () Unit!8638)

(declare-fun arrayRangesEqTransitive!46 (array!6274 array!6274 array!6274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8638)

(assert (=> b!138745 (= lt!216638 (arrayRangesEqTransitive!46 arr!237 (_2!6400 lt!216622) (_2!6400 lt!216626) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!138745 (arrayRangesEq!244 (_2!6400 lt!216622) (_2!6400 lt!216626) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!216647 () Unit!8638)

(declare-fun arrayRangesEqSymmetricLemma!57 (array!6274 array!6274 (_ BitVec 32) (_ BitVec 32)) Unit!8638)

(assert (=> b!138745 (= lt!216647 (arrayRangesEqSymmetricLemma!57 (_2!6400 lt!216626) (_2!6400 lt!216622) #b00000000000000000000000000000000 to!404))))

(declare-fun b!138746 () Bool)

(declare-fun res!115659 () Bool)

(assert (=> b!138746 (=> (not res!115659) (not e!92277))))

(assert (=> b!138746 (= res!115659 (isPrefixOf!0 thiss!1634 (_2!6398 lt!216625)))))

(declare-fun lt!216640 () tuple2!12150)

(declare-fun b!138747 () Bool)

(declare-fun lt!216642 () tuple2!12146)

(assert (=> b!138747 (= e!92277 (and (= (_2!6399 lt!216642) (select (arr!3536 arr!237) from!447)) (= (_1!6399 lt!216642) (_2!6401 lt!216640))))))

(assert (=> b!138747 (= lt!216642 (readBytePure!0 (_1!6401 lt!216640)))))

(assert (=> b!138747 (= lt!216640 (reader!0 thiss!1634 (_2!6398 lt!216625)))))

(declare-fun b!138748 () Bool)

(declare-fun res!115657 () Bool)

(assert (=> b!138748 (=> (not res!115657) (not e!92279))))

(assert (=> b!138748 (= res!115657 (invariant!0 (currentBit!6062 thiss!1634) (currentByte!6067 thiss!1634) (size!2841 (buf!3254 thiss!1634))))))

(declare-fun b!138749 () Bool)

(assert (=> b!138749 (= e!92276 (array_inv!2630 (buf!3254 thiss!1634)))))

(declare-fun b!138750 () Bool)

(declare-fun res!115669 () Bool)

(assert (=> b!138750 (=> (not res!115669) (not e!92283))))

(assert (=> b!138750 (= res!115669 (isPrefixOf!0 (_2!6398 lt!216625) (_2!6398 lt!216629)))))

(assert (= (and start!26894 res!115665) b!138737))

(assert (= (and b!138737 res!115662) b!138742))

(assert (= (and b!138742 res!115667) b!138748))

(assert (= (and b!138748 res!115657) b!138739))

(assert (= (and b!138739 res!115656) b!138734))

(assert (= (and b!138734 res!115671) b!138746))

(assert (= (and b!138746 res!115659) b!138747))

(assert (= (and b!138739 res!115661) b!138741))

(assert (= (and b!138741 res!115663) b!138750))

(assert (= (and b!138750 res!115669) b!138744))

(assert (= (and b!138744 (not res!115670)) b!138743))

(assert (= (and b!138739 res!115658) b!138735))

(assert (= (and b!138739 res!115668) b!138738))

(assert (= (and b!138739 (not res!115664)) b!138745))

(assert (= (and b!138745 (not res!115660)) b!138736))

(assert (= (and b!138736 (not res!115666)) b!138740))

(assert (= start!26894 b!138749))

(declare-fun m!213571 () Bool)

(assert (=> b!138744 m!213571))

(declare-fun m!213573 () Bool)

(assert (=> b!138744 m!213573))

(declare-fun m!213575 () Bool)

(assert (=> b!138744 m!213575))

(declare-fun m!213577 () Bool)

(assert (=> b!138744 m!213577))

(declare-fun m!213579 () Bool)

(assert (=> b!138747 m!213579))

(declare-fun m!213581 () Bool)

(assert (=> b!138747 m!213581))

(declare-fun m!213583 () Bool)

(assert (=> b!138747 m!213583))

(declare-fun m!213585 () Bool)

(assert (=> b!138737 m!213585))

(declare-fun m!213587 () Bool)

(assert (=> b!138746 m!213587))

(declare-fun m!213589 () Bool)

(assert (=> b!138748 m!213589))

(declare-fun m!213591 () Bool)

(assert (=> b!138735 m!213591))

(declare-fun m!213593 () Bool)

(assert (=> b!138739 m!213593))

(declare-fun m!213595 () Bool)

(assert (=> b!138739 m!213595))

(declare-fun m!213597 () Bool)

(assert (=> b!138739 m!213597))

(declare-fun m!213599 () Bool)

(assert (=> b!138739 m!213599))

(declare-fun m!213601 () Bool)

(assert (=> b!138739 m!213601))

(declare-fun m!213603 () Bool)

(assert (=> b!138739 m!213603))

(declare-fun m!213605 () Bool)

(assert (=> b!138739 m!213605))

(declare-fun m!213607 () Bool)

(assert (=> b!138739 m!213607))

(declare-fun m!213609 () Bool)

(assert (=> b!138739 m!213609))

(declare-fun m!213611 () Bool)

(assert (=> b!138739 m!213611))

(declare-fun m!213613 () Bool)

(assert (=> b!138739 m!213613))

(assert (=> b!138739 m!213577))

(assert (=> b!138739 m!213601))

(declare-fun m!213615 () Bool)

(assert (=> b!138739 m!213615))

(declare-fun m!213617 () Bool)

(assert (=> b!138739 m!213617))

(declare-fun m!213619 () Bool)

(assert (=> b!138739 m!213619))

(declare-fun m!213621 () Bool)

(assert (=> b!138739 m!213621))

(declare-fun m!213623 () Bool)

(assert (=> b!138739 m!213623))

(declare-fun m!213625 () Bool)

(assert (=> b!138739 m!213625))

(declare-fun m!213627 () Bool)

(assert (=> b!138739 m!213627))

(declare-fun m!213629 () Bool)

(assert (=> b!138739 m!213629))

(declare-fun m!213631 () Bool)

(assert (=> b!138739 m!213631))

(assert (=> b!138739 m!213579))

(declare-fun m!213633 () Bool)

(assert (=> b!138739 m!213633))

(declare-fun m!213635 () Bool)

(assert (=> b!138739 m!213635))

(declare-fun m!213637 () Bool)

(assert (=> b!138739 m!213637))

(declare-fun m!213639 () Bool)

(assert (=> b!138739 m!213639))

(declare-fun m!213641 () Bool)

(assert (=> b!138739 m!213641))

(assert (=> b!138739 m!213579))

(declare-fun m!213643 () Bool)

(assert (=> b!138745 m!213643))

(declare-fun m!213645 () Bool)

(assert (=> b!138745 m!213645))

(declare-fun m!213647 () Bool)

(assert (=> b!138745 m!213647))

(declare-fun m!213649 () Bool)

(assert (=> b!138745 m!213649))

(declare-fun m!213651 () Bool)

(assert (=> start!26894 m!213651))

(declare-fun m!213653 () Bool)

(assert (=> start!26894 m!213653))

(declare-fun m!213655 () Bool)

(assert (=> b!138741 m!213655))

(declare-fun m!213657 () Bool)

(assert (=> b!138741 m!213657))

(assert (=> b!138736 m!213655))

(declare-fun m!213659 () Bool)

(assert (=> b!138736 m!213659))

(declare-fun m!213661 () Bool)

(assert (=> b!138750 m!213661))

(declare-fun m!213663 () Bool)

(assert (=> b!138740 m!213663))

(declare-fun m!213665 () Bool)

(assert (=> b!138740 m!213665))

(declare-fun m!213667 () Bool)

(assert (=> b!138749 m!213667))

(declare-fun m!213669 () Bool)

(assert (=> b!138743 m!213669))

(assert (=> b!138734 m!213657))

(assert (=> b!138734 m!213659))

(push 1)

(assert (not start!26894))

(assert (not b!138745))

(assert (not b!138747))

(assert (not b!138734))

(assert (not b!138736))

(assert (not b!138748))

(assert (not b!138746))

(assert (not b!138739))

(assert (not b!138735))

(assert (not b!138750))

(assert (not b!138740))

(assert (not b!138741))

(assert (not b!138743))

(assert (not b!138744))

(assert (not b!138737))

(assert (not b!138749))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

