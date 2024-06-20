; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26338 () Bool)

(assert start!26338)

(declare-fun b!134503 () Bool)

(declare-fun e!89234 () Bool)

(declare-datatypes ((array!6138 0))(
  ( (array!6139 (arr!3442 (Array (_ BitVec 32) (_ BitVec 8))) (size!2777 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4818 0))(
  ( (BitStream!4819 (buf!3170 array!6138) (currentByte!5967 (_ BitVec 32)) (currentBit!5962 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11612 0))(
  ( (tuple2!11613 (_1!6122 BitStream!4818) (_2!6122 (_ BitVec 8))) )
))
(declare-fun lt!208611 () tuple2!11612)

(declare-fun lt!208596 () tuple2!11612)

(assert (=> b!134503 (= e!89234 (= (_2!6122 lt!208611) (_2!6122 lt!208596)))))

(declare-fun b!134504 () Bool)

(declare-fun e!89232 () Bool)

(declare-fun thiss!1634 () BitStream!4818)

(declare-datatypes ((Unit!8392 0))(
  ( (Unit!8393) )
))
(declare-datatypes ((tuple2!11614 0))(
  ( (tuple2!11615 (_1!6123 Unit!8392) (_2!6123 BitStream!4818)) )
))
(declare-fun lt!208606 () tuple2!11614)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134504 (= e!89232 (invariant!0 (currentBit!5962 thiss!1634) (currentByte!5967 thiss!1634) (size!2777 (buf!3170 (_2!6123 lt!208606)))))))

(declare-fun b!134505 () Bool)

(declare-fun res!111773 () Bool)

(declare-fun e!89239 () Bool)

(assert (=> b!134505 (=> (not res!111773) (not e!89239))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134505 (= res!111773 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2777 (buf!3170 thiss!1634))) ((_ sign_extend 32) (currentByte!5967 thiss!1634)) ((_ sign_extend 32) (currentBit!5962 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!111778 () Bool)

(assert (=> start!26338 (=> (not res!111778) (not e!89239))))

(declare-fun arr!237 () array!6138)

(assert (=> start!26338 (= res!111778 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2777 arr!237))))))

(assert (=> start!26338 e!89239))

(assert (=> start!26338 true))

(declare-fun array_inv!2566 (array!6138) Bool)

(assert (=> start!26338 (array_inv!2566 arr!237)))

(declare-fun e!89235 () Bool)

(declare-fun inv!12 (BitStream!4818) Bool)

(assert (=> start!26338 (and (inv!12 thiss!1634) e!89235)))

(declare-fun b!134506 () Bool)

(declare-fun res!111782 () Bool)

(assert (=> b!134506 (=> (not res!111782) (not e!89239))))

(assert (=> b!134506 (= res!111782 (invariant!0 (currentBit!5962 thiss!1634) (currentByte!5967 thiss!1634) (size!2777 (buf!3170 thiss!1634))))))

(declare-fun b!134507 () Bool)

(declare-fun res!111783 () Bool)

(declare-fun e!89236 () Bool)

(assert (=> b!134507 (=> (not res!111783) (not e!89236))))

(declare-fun isPrefixOf!0 (BitStream!4818 BitStream!4818) Bool)

(assert (=> b!134507 (= res!111783 (isPrefixOf!0 thiss!1634 (_2!6123 lt!208606)))))

(declare-datatypes ((tuple2!11616 0))(
  ( (tuple2!11617 (_1!6124 BitStream!4818) (_2!6124 BitStream!4818)) )
))
(declare-fun lt!208605 () tuple2!11616)

(declare-fun b!134508 () Bool)

(declare-fun lt!208612 () tuple2!11612)

(assert (=> b!134508 (= e!89236 (and (= (_2!6122 lt!208612) (select (arr!3442 arr!237) from!447)) (= (_1!6122 lt!208612) (_2!6124 lt!208605))))))

(declare-fun readBytePure!0 (BitStream!4818) tuple2!11612)

(assert (=> b!134508 (= lt!208612 (readBytePure!0 (_1!6124 lt!208605)))))

(declare-fun reader!0 (BitStream!4818 BitStream!4818) tuple2!11616)

(assert (=> b!134508 (= lt!208605 (reader!0 thiss!1634 (_2!6123 lt!208606)))))

(declare-fun b!134509 () Bool)

(assert (=> b!134509 (= e!89239 (not true))))

(declare-datatypes ((tuple2!11618 0))(
  ( (tuple2!11619 (_1!6125 BitStream!4818) (_2!6125 array!6138)) )
))
(declare-fun lt!208610 () tuple2!11618)

(declare-fun lt!208595 () tuple2!11618)

(declare-fun arrayRangesEq!180 (array!6138 array!6138 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134509 (arrayRangesEq!180 (_2!6125 lt!208610) (_2!6125 lt!208595) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!208601 () Unit!8392)

(declare-fun lt!208593 () tuple2!11616)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4818 array!6138 (_ BitVec 32) (_ BitVec 32)) Unit!8392)

(assert (=> b!134509 (= lt!208601 (readByteArrayLoopArrayPrefixLemma!0 (_1!6124 lt!208593) arr!237 from!447 to!404))))

(declare-fun lt!208589 () array!6138)

(declare-fun readByteArrayLoopPure!0 (BitStream!4818 array!6138 (_ BitVec 32) (_ BitVec 32)) tuple2!11618)

(declare-fun withMovedByteIndex!0 (BitStream!4818 (_ BitVec 32)) BitStream!4818)

(assert (=> b!134509 (= lt!208595 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6124 lt!208593) #b00000000000000000000000000000001) lt!208589 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208592 () tuple2!11616)

(declare-fun lt!208607 () tuple2!11618)

(assert (=> b!134509 (= lt!208607 (readByteArrayLoopPure!0 (_1!6124 lt!208592) lt!208589 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208604 () tuple2!11612)

(assert (=> b!134509 (= lt!208589 (array!6139 (store (arr!3442 arr!237) from!447 (_2!6122 lt!208604)) (size!2777 arr!237)))))

(declare-fun lt!208608 () tuple2!11614)

(declare-fun lt!208594 () (_ BitVec 32))

(assert (=> b!134509 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2777 (buf!3170 (_2!6123 lt!208608)))) ((_ sign_extend 32) (currentByte!5967 (_2!6123 lt!208606))) ((_ sign_extend 32) (currentBit!5962 (_2!6123 lt!208606))) lt!208594)))

(declare-fun lt!208603 () Unit!8392)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4818 array!6138 (_ BitVec 32)) Unit!8392)

(assert (=> b!134509 (= lt!208603 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6123 lt!208606) (buf!3170 (_2!6123 lt!208608)) lt!208594))))

(assert (=> b!134509 (= (_1!6125 lt!208610) (_2!6124 lt!208593))))

(assert (=> b!134509 (= lt!208610 (readByteArrayLoopPure!0 (_1!6124 lt!208593) arr!237 from!447 to!404))))

(assert (=> b!134509 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2777 (buf!3170 (_2!6123 lt!208608)))) ((_ sign_extend 32) (currentByte!5967 thiss!1634)) ((_ sign_extend 32) (currentBit!5962 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!208597 () Unit!8392)

(assert (=> b!134509 (= lt!208597 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3170 (_2!6123 lt!208608)) (bvsub to!404 from!447)))))

(assert (=> b!134509 (= (_2!6122 lt!208604) (select (arr!3442 arr!237) from!447))))

(assert (=> b!134509 (= lt!208604 (readBytePure!0 (_1!6124 lt!208593)))))

(assert (=> b!134509 (= lt!208592 (reader!0 (_2!6123 lt!208606) (_2!6123 lt!208608)))))

(assert (=> b!134509 (= lt!208593 (reader!0 thiss!1634 (_2!6123 lt!208608)))))

(assert (=> b!134509 e!89234))

(declare-fun res!111771 () Bool)

(assert (=> b!134509 (=> (not res!111771) (not e!89234))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134509 (= res!111771 (= (bitIndex!0 (size!2777 (buf!3170 (_1!6122 lt!208611))) (currentByte!5967 (_1!6122 lt!208611)) (currentBit!5962 (_1!6122 lt!208611))) (bitIndex!0 (size!2777 (buf!3170 (_1!6122 lt!208596))) (currentByte!5967 (_1!6122 lt!208596)) (currentBit!5962 (_1!6122 lt!208596)))))))

(declare-fun lt!208609 () Unit!8392)

(declare-fun lt!208588 () BitStream!4818)

(declare-fun readBytePrefixLemma!0 (BitStream!4818 BitStream!4818) Unit!8392)

(assert (=> b!134509 (= lt!208609 (readBytePrefixLemma!0 lt!208588 (_2!6123 lt!208608)))))

(assert (=> b!134509 (= lt!208596 (readBytePure!0 (BitStream!4819 (buf!3170 (_2!6123 lt!208608)) (currentByte!5967 thiss!1634) (currentBit!5962 thiss!1634))))))

(assert (=> b!134509 (= lt!208611 (readBytePure!0 lt!208588))))

(assert (=> b!134509 (= lt!208588 (BitStream!4819 (buf!3170 (_2!6123 lt!208606)) (currentByte!5967 thiss!1634) (currentBit!5962 thiss!1634)))))

(assert (=> b!134509 e!89232))

(declare-fun res!111772 () Bool)

(assert (=> b!134509 (=> (not res!111772) (not e!89232))))

(assert (=> b!134509 (= res!111772 (isPrefixOf!0 thiss!1634 (_2!6123 lt!208608)))))

(declare-fun lt!208602 () Unit!8392)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4818 BitStream!4818 BitStream!4818) Unit!8392)

(assert (=> b!134509 (= lt!208602 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6123 lt!208606) (_2!6123 lt!208608)))))

(declare-fun e!89238 () Bool)

(assert (=> b!134509 e!89238))

(declare-fun res!111774 () Bool)

(assert (=> b!134509 (=> (not res!111774) (not e!89238))))

(assert (=> b!134509 (= res!111774 (= (size!2777 (buf!3170 (_2!6123 lt!208606))) (size!2777 (buf!3170 (_2!6123 lt!208608)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4818 array!6138 (_ BitVec 32) (_ BitVec 32)) tuple2!11614)

(assert (=> b!134509 (= lt!208608 (appendByteArrayLoop!0 (_2!6123 lt!208606) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134509 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2777 (buf!3170 (_2!6123 lt!208606)))) ((_ sign_extend 32) (currentByte!5967 (_2!6123 lt!208606))) ((_ sign_extend 32) (currentBit!5962 (_2!6123 lt!208606))) lt!208594)))

(assert (=> b!134509 (= lt!208594 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!208600 () Unit!8392)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4818 BitStream!4818 (_ BitVec 64) (_ BitVec 32)) Unit!8392)

(assert (=> b!134509 (= lt!208600 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6123 lt!208606) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!134509 e!89236))

(declare-fun res!111775 () Bool)

(assert (=> b!134509 (=> (not res!111775) (not e!89236))))

(assert (=> b!134509 (= res!111775 (= (size!2777 (buf!3170 thiss!1634)) (size!2777 (buf!3170 (_2!6123 lt!208606)))))))

(declare-fun appendByte!0 (BitStream!4818 (_ BitVec 8)) tuple2!11614)

(assert (=> b!134509 (= lt!208606 (appendByte!0 thiss!1634 (select (arr!3442 arr!237) from!447)))))

(declare-fun b!134510 () Bool)

(declare-fun e!89233 () Bool)

(assert (=> b!134510 (= e!89238 e!89233)))

(declare-fun res!111776 () Bool)

(assert (=> b!134510 (=> (not res!111776) (not e!89233))))

(declare-fun lt!208590 () (_ BitVec 64))

(assert (=> b!134510 (= res!111776 (= (bitIndex!0 (size!2777 (buf!3170 (_2!6123 lt!208608))) (currentByte!5967 (_2!6123 lt!208608)) (currentBit!5962 (_2!6123 lt!208608))) (bvadd (bitIndex!0 (size!2777 (buf!3170 (_2!6123 lt!208606))) (currentByte!5967 (_2!6123 lt!208606)) (currentBit!5962 (_2!6123 lt!208606))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!208590))))))

(assert (=> b!134510 (= lt!208590 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!134511 () Bool)

(declare-fun res!111780 () Bool)

(assert (=> b!134511 (=> (not res!111780) (not e!89233))))

(assert (=> b!134511 (= res!111780 (isPrefixOf!0 (_2!6123 lt!208606) (_2!6123 lt!208608)))))

(declare-fun b!134512 () Bool)

(assert (=> b!134512 (= e!89235 (array_inv!2566 (buf!3170 thiss!1634)))))

(declare-fun b!134513 () Bool)

(declare-fun res!111777 () Bool)

(assert (=> b!134513 (=> (not res!111777) (not e!89239))))

(assert (=> b!134513 (= res!111777 (bvslt from!447 to!404))))

(declare-fun b!134514 () Bool)

(declare-fun res!111781 () Bool)

(assert (=> b!134514 (=> (not res!111781) (not e!89236))))

(assert (=> b!134514 (= res!111781 (= (bitIndex!0 (size!2777 (buf!3170 (_2!6123 lt!208606))) (currentByte!5967 (_2!6123 lt!208606)) (currentBit!5962 (_2!6123 lt!208606))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2777 (buf!3170 thiss!1634)) (currentByte!5967 thiss!1634) (currentBit!5962 thiss!1634)))))))

(declare-fun b!134515 () Bool)

(declare-fun e!89241 () Bool)

(assert (=> b!134515 (= e!89233 (not e!89241))))

(declare-fun res!111779 () Bool)

(assert (=> b!134515 (=> res!111779 e!89241)))

(declare-fun lt!208599 () tuple2!11618)

(declare-fun lt!208591 () tuple2!11616)

(assert (=> b!134515 (= res!111779 (or (not (= (size!2777 (_2!6125 lt!208599)) (size!2777 arr!237))) (not (= (_1!6125 lt!208599) (_2!6124 lt!208591)))))))

(assert (=> b!134515 (= lt!208599 (readByteArrayLoopPure!0 (_1!6124 lt!208591) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134515 (validate_offset_bits!1 ((_ sign_extend 32) (size!2777 (buf!3170 (_2!6123 lt!208608)))) ((_ sign_extend 32) (currentByte!5967 (_2!6123 lt!208606))) ((_ sign_extend 32) (currentBit!5962 (_2!6123 lt!208606))) lt!208590)))

(declare-fun lt!208598 () Unit!8392)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4818 array!6138 (_ BitVec 64)) Unit!8392)

(assert (=> b!134515 (= lt!208598 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6123 lt!208606) (buf!3170 (_2!6123 lt!208608)) lt!208590))))

(assert (=> b!134515 (= lt!208591 (reader!0 (_2!6123 lt!208606) (_2!6123 lt!208608)))))

(declare-fun b!134516 () Bool)

(assert (=> b!134516 (= e!89241 (not (arrayRangesEq!180 arr!237 (_2!6125 lt!208599) #b00000000000000000000000000000000 to!404)))))

(assert (= (and start!26338 res!111778) b!134505))

(assert (= (and b!134505 res!111773) b!134513))

(assert (= (and b!134513 res!111777) b!134506))

(assert (= (and b!134506 res!111782) b!134509))

(assert (= (and b!134509 res!111775) b!134514))

(assert (= (and b!134514 res!111781) b!134507))

(assert (= (and b!134507 res!111783) b!134508))

(assert (= (and b!134509 res!111774) b!134510))

(assert (= (and b!134510 res!111776) b!134511))

(assert (= (and b!134511 res!111780) b!134515))

(assert (= (and b!134515 (not res!111779)) b!134516))

(assert (= (and b!134509 res!111772) b!134504))

(assert (= (and b!134509 res!111771) b!134503))

(assert (= start!26338 b!134512))

(declare-fun m!204711 () Bool)

(assert (=> b!134516 m!204711))

(declare-fun m!204713 () Bool)

(assert (=> b!134505 m!204713))

(declare-fun m!204715 () Bool)

(assert (=> b!134506 m!204715))

(declare-fun m!204717 () Bool)

(assert (=> b!134507 m!204717))

(declare-fun m!204719 () Bool)

(assert (=> b!134511 m!204719))

(declare-fun m!204721 () Bool)

(assert (=> b!134512 m!204721))

(declare-fun m!204723 () Bool)

(assert (=> b!134510 m!204723))

(declare-fun m!204725 () Bool)

(assert (=> b!134510 m!204725))

(declare-fun m!204727 () Bool)

(assert (=> b!134515 m!204727))

(declare-fun m!204729 () Bool)

(assert (=> b!134515 m!204729))

(declare-fun m!204731 () Bool)

(assert (=> b!134515 m!204731))

(declare-fun m!204733 () Bool)

(assert (=> b!134515 m!204733))

(declare-fun m!204735 () Bool)

(assert (=> start!26338 m!204735))

(declare-fun m!204737 () Bool)

(assert (=> start!26338 m!204737))

(declare-fun m!204739 () Bool)

(assert (=> b!134509 m!204739))

(declare-fun m!204741 () Bool)

(assert (=> b!134509 m!204741))

(declare-fun m!204743 () Bool)

(assert (=> b!134509 m!204743))

(declare-fun m!204745 () Bool)

(assert (=> b!134509 m!204745))

(declare-fun m!204747 () Bool)

(assert (=> b!134509 m!204747))

(declare-fun m!204749 () Bool)

(assert (=> b!134509 m!204749))

(assert (=> b!134509 m!204741))

(declare-fun m!204751 () Bool)

(assert (=> b!134509 m!204751))

(declare-fun m!204753 () Bool)

(assert (=> b!134509 m!204753))

(declare-fun m!204755 () Bool)

(assert (=> b!134509 m!204755))

(declare-fun m!204757 () Bool)

(assert (=> b!134509 m!204757))

(declare-fun m!204759 () Bool)

(assert (=> b!134509 m!204759))

(declare-fun m!204761 () Bool)

(assert (=> b!134509 m!204761))

(declare-fun m!204763 () Bool)

(assert (=> b!134509 m!204763))

(declare-fun m!204765 () Bool)

(assert (=> b!134509 m!204765))

(declare-fun m!204767 () Bool)

(assert (=> b!134509 m!204767))

(declare-fun m!204769 () Bool)

(assert (=> b!134509 m!204769))

(declare-fun m!204771 () Bool)

(assert (=> b!134509 m!204771))

(declare-fun m!204773 () Bool)

(assert (=> b!134509 m!204773))

(declare-fun m!204775 () Bool)

(assert (=> b!134509 m!204775))

(declare-fun m!204777 () Bool)

(assert (=> b!134509 m!204777))

(declare-fun m!204779 () Bool)

(assert (=> b!134509 m!204779))

(declare-fun m!204781 () Bool)

(assert (=> b!134509 m!204781))

(declare-fun m!204783 () Bool)

(assert (=> b!134509 m!204783))

(declare-fun m!204785 () Bool)

(assert (=> b!134509 m!204785))

(assert (=> b!134509 m!204733))

(declare-fun m!204787 () Bool)

(assert (=> b!134509 m!204787))

(assert (=> b!134509 m!204763))

(assert (=> b!134514 m!204725))

(declare-fun m!204789 () Bool)

(assert (=> b!134514 m!204789))

(declare-fun m!204791 () Bool)

(assert (=> b!134504 m!204791))

(assert (=> b!134508 m!204763))

(declare-fun m!204793 () Bool)

(assert (=> b!134508 m!204793))

(declare-fun m!204795 () Bool)

(assert (=> b!134508 m!204795))

(check-sat (not start!26338) (not b!134515) (not b!134514) (not b!134507) (not b!134509) (not b!134511) (not b!134510) (not b!134504) (not b!134516) (not b!134505) (not b!134506) (not b!134512) (not b!134508))
