; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28340 () Bool)

(assert start!28340)

(declare-fun b!146790 () Bool)

(declare-fun res!122809 () Bool)

(declare-fun e!97884 () Bool)

(assert (=> b!146790 (=> (not res!122809) (not e!97884))))

(declare-datatypes ((array!6642 0))(
  ( (array!6643 (arr!3760 (Array (_ BitVec 32) (_ BitVec 8))) (size!3006 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5270 0))(
  ( (BitStream!5271 (buf!3461 array!6642) (currentByte!6363 (_ BitVec 32)) (currentBit!6358 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!9197 0))(
  ( (Unit!9198) )
))
(declare-datatypes ((tuple2!13106 0))(
  ( (tuple2!13107 (_1!6907 Unit!9197) (_2!6907 BitStream!5270)) )
))
(declare-fun lt!228045 () tuple2!13106)

(declare-fun lt!228035 () tuple2!13106)

(declare-fun isPrefixOf!0 (BitStream!5270 BitStream!5270) Bool)

(assert (=> b!146790 (= res!122809 (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 lt!228035)))))

(declare-datatypes ((tuple2!13108 0))(
  ( (tuple2!13109 (_1!6908 BitStream!5270) (_2!6908 (_ BitVec 8))) )
))
(declare-fun lt!228047 () tuple2!13108)

(declare-datatypes ((tuple2!13110 0))(
  ( (tuple2!13111 (_1!6909 BitStream!5270) (_2!6909 BitStream!5270)) )
))
(declare-fun lt!228039 () tuple2!13110)

(declare-fun b!146791 () Bool)

(declare-fun arr!237 () array!6642)

(declare-fun e!97885 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!146791 (= e!97885 (and (= (_2!6908 lt!228047) (select (arr!3760 arr!237) from!447)) (= (_1!6908 lt!228047) (_2!6909 lt!228039))))))

(declare-fun readBytePure!0 (BitStream!5270) tuple2!13108)

(assert (=> b!146791 (= lt!228047 (readBytePure!0 (_1!6909 lt!228039)))))

(declare-fun thiss!1634 () BitStream!5270)

(declare-fun reader!0 (BitStream!5270 BitStream!5270) tuple2!13110)

(assert (=> b!146791 (= lt!228039 (reader!0 thiss!1634 (_2!6907 lt!228045)))))

(declare-fun b!146792 () Bool)

(declare-fun e!97888 () Bool)

(declare-fun e!97886 () Bool)

(assert (=> b!146792 (= e!97888 (not e!97886))))

(declare-fun res!122819 () Bool)

(assert (=> b!146792 (=> res!122819 e!97886)))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((tuple2!13112 0))(
  ( (tuple2!13113 (_1!6910 BitStream!5270) (_2!6910 array!6642)) )
))
(declare-fun lt!228052 () tuple2!13112)

(declare-fun lt!228046 () tuple2!13112)

(declare-fun arrayRangesEq!322 (array!6642 array!6642 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!146792 (= res!122819 (not (arrayRangesEq!322 (_2!6910 lt!228052) (_2!6910 lt!228046) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!228050 () tuple2!13112)

(assert (=> b!146792 (arrayRangesEq!322 (_2!6910 lt!228052) (_2!6910 lt!228050) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!228034 () tuple2!13110)

(declare-fun lt!228036 () Unit!9197)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5270 array!6642 (_ BitVec 32) (_ BitVec 32)) Unit!9197)

(assert (=> b!146792 (= lt!228036 (readByteArrayLoopArrayPrefixLemma!0 (_1!6909 lt!228034) arr!237 from!447 to!404))))

(declare-fun lt!228053 () array!6642)

(declare-fun readByteArrayLoopPure!0 (BitStream!5270 array!6642 (_ BitVec 32) (_ BitVec 32)) tuple2!13112)

(declare-fun withMovedByteIndex!0 (BitStream!5270 (_ BitVec 32)) BitStream!5270)

(assert (=> b!146792 (= lt!228050 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001) lt!228053 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!228037 () tuple2!13110)

(assert (=> b!146792 (= lt!228046 (readByteArrayLoopPure!0 (_1!6909 lt!228037) lt!228053 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!228051 () tuple2!13108)

(assert (=> b!146792 (= lt!228053 (array!6643 (store (arr!3760 arr!237) from!447 (_2!6908 lt!228051)) (size!3006 arr!237)))))

(declare-fun lt!228055 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146792 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228055)))

(declare-fun lt!228044 () Unit!9197)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5270 array!6642 (_ BitVec 32)) Unit!9197)

(assert (=> b!146792 (= lt!228044 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6907 lt!228045) (buf!3461 (_2!6907 lt!228035)) lt!228055))))

(assert (=> b!146792 (= (_1!6910 lt!228052) (_2!6909 lt!228034))))

(assert (=> b!146792 (= lt!228052 (readByteArrayLoopPure!0 (_1!6909 lt!228034) arr!237 from!447 to!404))))

(assert (=> b!146792 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!228032 () Unit!9197)

(assert (=> b!146792 (= lt!228032 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3461 (_2!6907 lt!228035)) (bvsub to!404 from!447)))))

(assert (=> b!146792 (= (_2!6908 lt!228051) (select (arr!3760 arr!237) from!447))))

(assert (=> b!146792 (= lt!228051 (readBytePure!0 (_1!6909 lt!228034)))))

(assert (=> b!146792 (= lt!228037 (reader!0 (_2!6907 lt!228045) (_2!6907 lt!228035)))))

(assert (=> b!146792 (= lt!228034 (reader!0 thiss!1634 (_2!6907 lt!228035)))))

(declare-fun e!97887 () Bool)

(assert (=> b!146792 e!97887))

(declare-fun res!122815 () Bool)

(assert (=> b!146792 (=> (not res!122815) (not e!97887))))

(declare-fun lt!228031 () tuple2!13108)

(declare-fun lt!228054 () tuple2!13108)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!146792 (= res!122815 (= (bitIndex!0 (size!3006 (buf!3461 (_1!6908 lt!228031))) (currentByte!6363 (_1!6908 lt!228031)) (currentBit!6358 (_1!6908 lt!228031))) (bitIndex!0 (size!3006 (buf!3461 (_1!6908 lt!228054))) (currentByte!6363 (_1!6908 lt!228054)) (currentBit!6358 (_1!6908 lt!228054)))))))

(declare-fun lt!228040 () Unit!9197)

(declare-fun lt!228048 () BitStream!5270)

(declare-fun readBytePrefixLemma!0 (BitStream!5270 BitStream!5270) Unit!9197)

(assert (=> b!146792 (= lt!228040 (readBytePrefixLemma!0 lt!228048 (_2!6907 lt!228035)))))

(assert (=> b!146792 (= lt!228054 (readBytePure!0 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(assert (=> b!146792 (= lt!228031 (readBytePure!0 lt!228048))))

(assert (=> b!146792 (= lt!228048 (BitStream!5271 (buf!3461 (_2!6907 lt!228045)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))

(declare-fun e!97883 () Bool)

(assert (=> b!146792 e!97883))

(declare-fun res!122820 () Bool)

(assert (=> b!146792 (=> (not res!122820) (not e!97883))))

(assert (=> b!146792 (= res!122820 (isPrefixOf!0 thiss!1634 (_2!6907 lt!228035)))))

(declare-fun lt!228042 () Unit!9197)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5270 BitStream!5270 BitStream!5270) Unit!9197)

(assert (=> b!146792 (= lt!228042 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6907 lt!228045) (_2!6907 lt!228035)))))

(declare-fun e!97889 () Bool)

(assert (=> b!146792 e!97889))

(declare-fun res!122813 () Bool)

(assert (=> b!146792 (=> (not res!122813) (not e!97889))))

(assert (=> b!146792 (= res!122813 (= (size!3006 (buf!3461 (_2!6907 lt!228045))) (size!3006 (buf!3461 (_2!6907 lt!228035)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5270 array!6642 (_ BitVec 32) (_ BitVec 32)) tuple2!13106)

(assert (=> b!146792 (= lt!228035 (appendByteArrayLoop!0 (_2!6907 lt!228045) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!146792 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228055)))

(assert (=> b!146792 (= lt!228055 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!228049 () Unit!9197)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5270 BitStream!5270 (_ BitVec 64) (_ BitVec 32)) Unit!9197)

(assert (=> b!146792 (= lt!228049 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6907 lt!228045) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!146792 e!97885))

(declare-fun res!122816 () Bool)

(assert (=> b!146792 (=> (not res!122816) (not e!97885))))

(assert (=> b!146792 (= res!122816 (= (size!3006 (buf!3461 thiss!1634)) (size!3006 (buf!3461 (_2!6907 lt!228045)))))))

(declare-fun appendByte!0 (BitStream!5270 (_ BitVec 8)) tuple2!13106)

(assert (=> b!146792 (= lt!228045 (appendByte!0 thiss!1634 (select (arr!3760 arr!237) from!447)))))

(declare-fun res!122814 () Bool)

(assert (=> start!28340 (=> (not res!122814) (not e!97888))))

(assert (=> start!28340 (= res!122814 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3006 arr!237))))))

(assert (=> start!28340 e!97888))

(assert (=> start!28340 true))

(declare-fun array_inv!2795 (array!6642) Bool)

(assert (=> start!28340 (array_inv!2795 arr!237)))

(declare-fun e!97891 () Bool)

(declare-fun inv!12 (BitStream!5270) Bool)

(assert (=> start!28340 (and (inv!12 thiss!1634) e!97891)))

(declare-fun b!146793 () Bool)

(declare-fun res!122811 () Bool)

(assert (=> b!146793 (=> (not res!122811) (not e!97888))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!146793 (= res!122811 (invariant!0 (currentBit!6358 thiss!1634) (currentByte!6363 thiss!1634) (size!3006 (buf!3461 thiss!1634))))))

(declare-fun b!146794 () Bool)

(declare-fun res!122808 () Bool)

(assert (=> b!146794 (=> (not res!122808) (not e!97885))))

(assert (=> b!146794 (= res!122808 (isPrefixOf!0 thiss!1634 (_2!6907 lt!228045)))))

(declare-fun b!146795 () Bool)

(declare-fun res!122818 () Bool)

(assert (=> b!146795 (=> (not res!122818) (not e!97888))))

(assert (=> b!146795 (= res!122818 (bvslt from!447 to!404))))

(declare-fun b!146796 () Bool)

(assert (=> b!146796 (= e!97889 e!97884)))

(declare-fun res!122812 () Bool)

(assert (=> b!146796 (=> (not res!122812) (not e!97884))))

(declare-fun lt!228033 () (_ BitVec 64))

(assert (=> b!146796 (= res!122812 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035))) (bvadd (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!228033))))))

(assert (=> b!146796 (= lt!228033 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!146797 () Bool)

(assert (=> b!146797 (= e!97887 (= (_2!6908 lt!228031) (_2!6908 lt!228054)))))

(declare-fun b!146798 () Bool)

(declare-fun e!97893 () Bool)

(assert (=> b!146798 (= e!97884 (not e!97893))))

(declare-fun res!122817 () Bool)

(assert (=> b!146798 (=> res!122817 e!97893)))

(declare-fun lt!228038 () tuple2!13112)

(declare-fun lt!228041 () tuple2!13110)

(assert (=> b!146798 (= res!122817 (or (not (= (size!3006 (_2!6910 lt!228038)) (size!3006 arr!237))) (not (= (_1!6910 lt!228038) (_2!6909 lt!228041)))))))

(assert (=> b!146798 (= lt!228038 (readByteArrayLoopPure!0 (_1!6909 lt!228041) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!146798 (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228033)))

(declare-fun lt!228043 () Unit!9197)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5270 array!6642 (_ BitVec 64)) Unit!9197)

(assert (=> b!146798 (= lt!228043 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6907 lt!228045) (buf!3461 (_2!6907 lt!228035)) lt!228033))))

(assert (=> b!146798 (= lt!228041 (reader!0 (_2!6907 lt!228045) (_2!6907 lt!228035)))))

(declare-fun b!146799 () Bool)

(declare-fun res!122810 () Bool)

(assert (=> b!146799 (=> (not res!122810) (not e!97885))))

(assert (=> b!146799 (= res!122810 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))))

(declare-fun b!146800 () Bool)

(assert (=> b!146800 (= e!97893 (not (arrayRangesEq!322 arr!237 (_2!6910 lt!228038) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!146801 () Bool)

(assert (=> b!146801 (= e!97883 (invariant!0 (currentBit!6358 thiss!1634) (currentByte!6363 thiss!1634) (size!3006 (buf!3461 (_2!6907 lt!228045)))))))

(declare-fun b!146802 () Bool)

(declare-fun res!122807 () Bool)

(assert (=> b!146802 (=> (not res!122807) (not e!97888))))

(assert (=> b!146802 (= res!122807 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 thiss!1634))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!146803 () Bool)

(assert (=> b!146803 (= e!97891 (array_inv!2795 (buf!3461 thiss!1634)))))

(declare-fun b!146804 () Bool)

(assert (=> b!146804 (= e!97886 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt to!404 (size!3006 (_2!6910 lt!228052))) (= (size!3006 (_2!6910 lt!228052)) (size!3006 (_2!6910 lt!228046)))))))

(assert (= (and start!28340 res!122814) b!146802))

(assert (= (and b!146802 res!122807) b!146795))

(assert (= (and b!146795 res!122818) b!146793))

(assert (= (and b!146793 res!122811) b!146792))

(assert (= (and b!146792 res!122816) b!146799))

(assert (= (and b!146799 res!122810) b!146794))

(assert (= (and b!146794 res!122808) b!146791))

(assert (= (and b!146792 res!122813) b!146796))

(assert (= (and b!146796 res!122812) b!146790))

(assert (= (and b!146790 res!122809) b!146798))

(assert (= (and b!146798 (not res!122817)) b!146800))

(assert (= (and b!146792 res!122820) b!146801))

(assert (= (and b!146792 res!122815) b!146797))

(assert (= (and b!146792 (not res!122819)) b!146804))

(assert (= start!28340 b!146803))

(declare-fun m!226671 () Bool)

(assert (=> b!146798 m!226671))

(declare-fun m!226673 () Bool)

(assert (=> b!146798 m!226673))

(declare-fun m!226675 () Bool)

(assert (=> b!146798 m!226675))

(declare-fun m!226677 () Bool)

(assert (=> b!146798 m!226677))

(declare-fun m!226679 () Bool)

(assert (=> b!146793 m!226679))

(declare-fun m!226681 () Bool)

(assert (=> b!146794 m!226681))

(declare-fun m!226683 () Bool)

(assert (=> b!146803 m!226683))

(declare-fun m!226685 () Bool)

(assert (=> b!146799 m!226685))

(declare-fun m!226687 () Bool)

(assert (=> b!146799 m!226687))

(declare-fun m!226689 () Bool)

(assert (=> b!146791 m!226689))

(declare-fun m!226691 () Bool)

(assert (=> b!146791 m!226691))

(declare-fun m!226693 () Bool)

(assert (=> b!146791 m!226693))

(declare-fun m!226695 () Bool)

(assert (=> b!146792 m!226695))

(declare-fun m!226697 () Bool)

(assert (=> b!146792 m!226697))

(declare-fun m!226699 () Bool)

(assert (=> b!146792 m!226699))

(declare-fun m!226701 () Bool)

(assert (=> b!146792 m!226701))

(declare-fun m!226703 () Bool)

(assert (=> b!146792 m!226703))

(declare-fun m!226705 () Bool)

(assert (=> b!146792 m!226705))

(declare-fun m!226707 () Bool)

(assert (=> b!146792 m!226707))

(assert (=> b!146792 m!226689))

(declare-fun m!226709 () Bool)

(assert (=> b!146792 m!226709))

(declare-fun m!226711 () Bool)

(assert (=> b!146792 m!226711))

(declare-fun m!226713 () Bool)

(assert (=> b!146792 m!226713))

(declare-fun m!226715 () Bool)

(assert (=> b!146792 m!226715))

(declare-fun m!226717 () Bool)

(assert (=> b!146792 m!226717))

(declare-fun m!226719 () Bool)

(assert (=> b!146792 m!226719))

(declare-fun m!226721 () Bool)

(assert (=> b!146792 m!226721))

(declare-fun m!226723 () Bool)

(assert (=> b!146792 m!226723))

(declare-fun m!226725 () Bool)

(assert (=> b!146792 m!226725))

(assert (=> b!146792 m!226677))

(declare-fun m!226727 () Bool)

(assert (=> b!146792 m!226727))

(declare-fun m!226729 () Bool)

(assert (=> b!146792 m!226729))

(declare-fun m!226731 () Bool)

(assert (=> b!146792 m!226731))

(declare-fun m!226733 () Bool)

(assert (=> b!146792 m!226733))

(declare-fun m!226735 () Bool)

(assert (=> b!146792 m!226735))

(declare-fun m!226737 () Bool)

(assert (=> b!146792 m!226737))

(declare-fun m!226739 () Bool)

(assert (=> b!146792 m!226739))

(declare-fun m!226741 () Bool)

(assert (=> b!146792 m!226741))

(assert (=> b!146792 m!226719))

(declare-fun m!226743 () Bool)

(assert (=> b!146792 m!226743))

(assert (=> b!146792 m!226689))

(declare-fun m!226745 () Bool)

(assert (=> b!146800 m!226745))

(declare-fun m!226747 () Bool)

(assert (=> b!146801 m!226747))

(declare-fun m!226749 () Bool)

(assert (=> b!146796 m!226749))

(assert (=> b!146796 m!226685))

(declare-fun m!226751 () Bool)

(assert (=> b!146802 m!226751))

(declare-fun m!226753 () Bool)

(assert (=> start!28340 m!226753))

(declare-fun m!226755 () Bool)

(assert (=> start!28340 m!226755))

(declare-fun m!226757 () Bool)

(assert (=> b!146790 m!226757))

(push 1)

(assert (not b!146798))

(assert (not b!146792))

(assert (not b!146791))

(assert (not b!146800))

(assert (not b!146801))

(assert (not b!146793))

(assert (not start!28340))

(assert (not b!146794))

(assert (not b!146790))

(assert (not b!146796))

(assert (not b!146799))

(assert (not b!146802))

(assert (not b!146803))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!47291 () Bool)

(assert (=> d!47291 (= (invariant!0 (currentBit!6358 thiss!1634) (currentByte!6363 thiss!1634) (size!3006 (buf!3461 thiss!1634))) (and (bvsge (currentBit!6358 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6358 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6363 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6363 thiss!1634) (size!3006 (buf!3461 thiss!1634))) (and (= (currentBit!6358 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6363 thiss!1634) (size!3006 (buf!3461 thiss!1634)))))))))

(assert (=> b!146793 d!47291))

(declare-fun d!47293 () Bool)

(declare-fun res!122842 () Bool)

(declare-fun e!97910 () Bool)

(assert (=> d!47293 (=> (not res!122842) (not e!97910))))

(assert (=> d!47293 (= res!122842 (= (size!3006 (buf!3461 thiss!1634)) (size!3006 (buf!3461 (_2!6907 lt!228045)))))))

(assert (=> d!47293 (= (isPrefixOf!0 thiss!1634 (_2!6907 lt!228045)) e!97910)))

(declare-fun b!146829 () Bool)

(declare-fun res!122841 () Bool)

(assert (=> b!146829 (=> (not res!122841) (not e!97910))))

(assert (=> b!146829 (= res!122841 (bvsle (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(declare-fun b!146830 () Bool)

(declare-fun e!97911 () Bool)

(assert (=> b!146830 (= e!97910 e!97911)))

(declare-fun res!122843 () Bool)

(assert (=> b!146830 (=> res!122843 e!97911)))

(assert (=> b!146830 (= res!122843 (= (size!3006 (buf!3461 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146831 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6642 array!6642 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!146831 (= e!97911 (arrayBitRangesEq!0 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228045)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(assert (= (and d!47293 res!122842) b!146829))

(assert (= (and b!146829 res!122841) b!146830))

(assert (= (and b!146830 (not res!122843)) b!146831))

(assert (=> b!146829 m!226687))

(assert (=> b!146829 m!226685))

(assert (=> b!146831 m!226687))

(assert (=> b!146831 m!226687))

(declare-fun m!226773 () Bool)

(assert (=> b!146831 m!226773))

(assert (=> b!146794 d!47293))

(declare-fun d!47295 () Bool)

(declare-fun e!97919 () Bool)

(assert (=> d!47295 e!97919))

(declare-fun res!122859 () Bool)

(assert (=> d!47295 (=> (not res!122859) (not e!97919))))

(declare-fun lt!228165 () (_ BitVec 64))

(declare-fun lt!228164 () (_ BitVec 64))

(declare-fun lt!228166 () (_ BitVec 64))

(assert (=> d!47295 (= res!122859 (= lt!228165 (bvsub lt!228166 lt!228164)))))

(assert (=> d!47295 (or (= (bvand lt!228166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228164 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228166 lt!228164) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!47295 (= lt!228164 (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228035))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228035)))))))

(declare-fun lt!228163 () (_ BitVec 64))

(declare-fun lt!228162 () (_ BitVec 64))

(assert (=> d!47295 (= lt!228166 (bvmul lt!228163 lt!228162))))

(assert (=> d!47295 (or (= lt!228163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228162 (bvsdiv (bvmul lt!228163 lt!228162) lt!228163)))))

(assert (=> d!47295 (= lt!228162 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47295 (= lt!228163 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))))))

(assert (=> d!47295 (= lt!228165 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228035))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228035)))))))

(assert (=> d!47295 (invariant!0 (currentBit!6358 (_2!6907 lt!228035)) (currentByte!6363 (_2!6907 lt!228035)) (size!3006 (buf!3461 (_2!6907 lt!228035))))))

(assert (=> d!47295 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035))) lt!228165)))

(declare-fun b!146849 () Bool)

(declare-fun res!122860 () Bool)

(assert (=> b!146849 (=> (not res!122860) (not e!97919))))

(assert (=> b!146849 (= res!122860 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228165))))

(declare-fun b!146850 () Bool)

(declare-fun lt!228161 () (_ BitVec 64))

(assert (=> b!146850 (= e!97919 (bvsle lt!228165 (bvmul lt!228161 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146850 (or (= lt!228161 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228161 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228161)))))

(assert (=> b!146850 (= lt!228161 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))))))

(assert (= (and d!47295 res!122859) b!146849))

(assert (= (and b!146849 res!122860) b!146850))

(declare-fun m!226809 () Bool)

(assert (=> d!47295 m!226809))

(declare-fun m!226811 () Bool)

(assert (=> d!47295 m!226811))

(assert (=> b!146796 d!47295))

(declare-fun d!47301 () Bool)

(declare-fun e!97920 () Bool)

(assert (=> d!47301 e!97920))

(declare-fun res!122861 () Bool)

(assert (=> d!47301 (=> (not res!122861) (not e!97920))))

(declare-fun lt!228174 () (_ BitVec 64))

(declare-fun lt!228172 () (_ BitVec 64))

(declare-fun lt!228173 () (_ BitVec 64))

(assert (=> d!47301 (= res!122861 (= lt!228173 (bvsub lt!228174 lt!228172)))))

(assert (=> d!47301 (or (= (bvand lt!228174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228172 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228174 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228174 lt!228172) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47301 (= lt!228172 (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045)))))))

(declare-fun lt!228171 () (_ BitVec 64))

(declare-fun lt!228170 () (_ BitVec 64))

(assert (=> d!47301 (= lt!228174 (bvmul lt!228171 lt!228170))))

(assert (=> d!47301 (or (= lt!228171 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228170 (bvsdiv (bvmul lt!228171 lt!228170) lt!228171)))))

(assert (=> d!47301 (= lt!228170 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47301 (= lt!228171 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))))))

(assert (=> d!47301 (= lt!228173 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045)))))))

(assert (=> d!47301 (invariant!0 (currentBit!6358 (_2!6907 lt!228045)) (currentByte!6363 (_2!6907 lt!228045)) (size!3006 (buf!3461 (_2!6907 lt!228045))))))

(assert (=> d!47301 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))) lt!228173)))

(declare-fun b!146851 () Bool)

(declare-fun res!122862 () Bool)

(assert (=> b!146851 (=> (not res!122862) (not e!97920))))

(assert (=> b!146851 (= res!122862 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228173))))

(declare-fun b!146852 () Bool)

(declare-fun lt!228169 () (_ BitVec 64))

(assert (=> b!146852 (= e!97920 (bvsle lt!228173 (bvmul lt!228169 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146852 (or (= lt!228169 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228169 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228169)))))

(assert (=> b!146852 (= lt!228169 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))))))

(assert (= (and d!47301 res!122861) b!146851))

(assert (= (and b!146851 res!122862) b!146852))

(declare-fun m!226815 () Bool)

(assert (=> d!47301 m!226815))

(declare-fun m!226817 () Bool)

(assert (=> d!47301 m!226817))

(assert (=> b!146796 d!47301))

(declare-fun d!47305 () Bool)

(declare-datatypes ((tuple3!572 0))(
  ( (tuple3!573 (_1!6913 Unit!9197) (_2!6913 BitStream!5270) (_3!355 array!6642)) )
))
(declare-fun lt!228201 () tuple3!572)

(declare-fun readByteArrayLoop!0 (BitStream!5270 array!6642 (_ BitVec 32) (_ BitVec 32)) tuple3!572)

(assert (=> d!47305 (= lt!228201 (readByteArrayLoop!0 (_1!6909 lt!228041) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47305 (= (readByteArrayLoopPure!0 (_1!6909 lt!228041) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13113 (_2!6913 lt!228201) (_3!355 lt!228201)))))

(declare-fun bs!11577 () Bool)

(assert (= bs!11577 d!47305))

(declare-fun m!226849 () Bool)

(assert (=> bs!11577 m!226849))

(assert (=> b!146798 d!47305))

(declare-fun d!47313 () Bool)

(assert (=> d!47313 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228033) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045)))) lt!228033))))

(declare-fun bs!11578 () Bool)

(assert (= bs!11578 d!47313))

(declare-fun m!226851 () Bool)

(assert (=> bs!11578 m!226851))

(assert (=> b!146798 d!47313))

(declare-fun d!47315 () Bool)

(assert (=> d!47315 (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228033)))

(declare-fun lt!228204 () Unit!9197)

(declare-fun choose!9 (BitStream!5270 array!6642 (_ BitVec 64) BitStream!5270) Unit!9197)

(assert (=> d!47315 (= lt!228204 (choose!9 (_2!6907 lt!228045) (buf!3461 (_2!6907 lt!228035)) lt!228033 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(assert (=> d!47315 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6907 lt!228045) (buf!3461 (_2!6907 lt!228035)) lt!228033) lt!228204)))

(declare-fun bs!11579 () Bool)

(assert (= bs!11579 d!47315))

(assert (=> bs!11579 m!226673))

(declare-fun m!226853 () Bool)

(assert (=> bs!11579 m!226853))

(assert (=> b!146798 d!47315))

(declare-fun b!146877 () Bool)

(declare-fun res!122881 () Bool)

(declare-fun e!97934 () Bool)

(assert (=> b!146877 (=> (not res!122881) (not e!97934))))

(declare-fun lt!228255 () tuple2!13110)

(assert (=> b!146877 (= res!122881 (isPrefixOf!0 (_2!6909 lt!228255) (_2!6907 lt!228035)))))

(declare-fun b!146878 () Bool)

(declare-fun e!97933 () Unit!9197)

(declare-fun lt!228260 () Unit!9197)

(assert (=> b!146878 (= e!97933 lt!228260)))

(declare-fun lt!228263 () (_ BitVec 64))

(assert (=> b!146878 (= lt!228263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!228247 () (_ BitVec 64))

(assert (=> b!146878 (= lt!228247 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6642 array!6642 (_ BitVec 64) (_ BitVec 64)) Unit!9197)

(assert (=> b!146878 (= lt!228260 (arrayBitRangesEqSymmetric!0 (buf!3461 (_2!6907 lt!228045)) (buf!3461 (_2!6907 lt!228035)) lt!228263 lt!228247))))

(assert (=> b!146878 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228035)) (buf!3461 (_2!6907 lt!228045)) lt!228263 lt!228247)))

(declare-fun b!146879 () Bool)

(declare-fun Unit!9201 () Unit!9197)

(assert (=> b!146879 (= e!97933 Unit!9201)))

(declare-fun lt!228261 () (_ BitVec 64))

(declare-fun b!146880 () Bool)

(declare-fun lt!228264 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5270 (_ BitVec 64)) BitStream!5270)

(assert (=> b!146880 (= e!97934 (= (_1!6909 lt!228255) (withMovedBitIndex!0 (_2!6909 lt!228255) (bvsub lt!228264 lt!228261))))))

(assert (=> b!146880 (or (= (bvand lt!228264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228261 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228264 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228264 lt!228261) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146880 (= lt!228261 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035))))))

(assert (=> b!146880 (= lt!228264 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))))))

(declare-fun b!146881 () Bool)

(declare-fun res!122883 () Bool)

(assert (=> b!146881 (=> (not res!122883) (not e!97934))))

(assert (=> b!146881 (= res!122883 (isPrefixOf!0 (_1!6909 lt!228255) (_2!6907 lt!228045)))))

(declare-fun d!47317 () Bool)

(assert (=> d!47317 e!97934))

(declare-fun res!122882 () Bool)

(assert (=> d!47317 (=> (not res!122882) (not e!97934))))

(assert (=> d!47317 (= res!122882 (isPrefixOf!0 (_1!6909 lt!228255) (_2!6909 lt!228255)))))

(declare-fun lt!228246 () BitStream!5270)

(assert (=> d!47317 (= lt!228255 (tuple2!13111 lt!228246 (_2!6907 lt!228035)))))

(declare-fun lt!228253 () Unit!9197)

(declare-fun lt!228259 () Unit!9197)

(assert (=> d!47317 (= lt!228253 lt!228259)))

(assert (=> d!47317 (isPrefixOf!0 lt!228246 (_2!6907 lt!228035))))

(assert (=> d!47317 (= lt!228259 (lemmaIsPrefixTransitive!0 lt!228246 (_2!6907 lt!228035) (_2!6907 lt!228035)))))

(declare-fun lt!228257 () Unit!9197)

(declare-fun lt!228249 () Unit!9197)

(assert (=> d!47317 (= lt!228257 lt!228249)))

(assert (=> d!47317 (isPrefixOf!0 lt!228246 (_2!6907 lt!228035))))

(assert (=> d!47317 (= lt!228249 (lemmaIsPrefixTransitive!0 lt!228246 (_2!6907 lt!228045) (_2!6907 lt!228035)))))

(declare-fun lt!228248 () Unit!9197)

(assert (=> d!47317 (= lt!228248 e!97933)))

(declare-fun c!7954 () Bool)

(assert (=> d!47317 (= c!7954 (not (= (size!3006 (buf!3461 (_2!6907 lt!228045))) #b00000000000000000000000000000000)))))

(declare-fun lt!228252 () Unit!9197)

(declare-fun lt!228254 () Unit!9197)

(assert (=> d!47317 (= lt!228252 lt!228254)))

(assert (=> d!47317 (isPrefixOf!0 (_2!6907 lt!228035) (_2!6907 lt!228035))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5270) Unit!9197)

(assert (=> d!47317 (= lt!228254 (lemmaIsPrefixRefl!0 (_2!6907 lt!228035)))))

(declare-fun lt!228262 () Unit!9197)

(declare-fun lt!228258 () Unit!9197)

(assert (=> d!47317 (= lt!228262 lt!228258)))

(assert (=> d!47317 (= lt!228258 (lemmaIsPrefixRefl!0 (_2!6907 lt!228035)))))

(declare-fun lt!228245 () Unit!9197)

(declare-fun lt!228251 () Unit!9197)

(assert (=> d!47317 (= lt!228245 lt!228251)))

(assert (=> d!47317 (isPrefixOf!0 lt!228246 lt!228246)))

(assert (=> d!47317 (= lt!228251 (lemmaIsPrefixRefl!0 lt!228246))))

(declare-fun lt!228250 () Unit!9197)

(declare-fun lt!228256 () Unit!9197)

(assert (=> d!47317 (= lt!228250 lt!228256)))

(assert (=> d!47317 (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 lt!228045))))

(assert (=> d!47317 (= lt!228256 (lemmaIsPrefixRefl!0 (_2!6907 lt!228045)))))

(assert (=> d!47317 (= lt!228246 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))))))

(assert (=> d!47317 (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 lt!228035))))

(assert (=> d!47317 (= (reader!0 (_2!6907 lt!228045) (_2!6907 lt!228035)) lt!228255)))

(assert (= (and d!47317 c!7954) b!146878))

(assert (= (and d!47317 (not c!7954)) b!146879))

(assert (= (and d!47317 res!122882) b!146881))

(assert (= (and b!146881 res!122883) b!146877))

(assert (= (and b!146877 res!122881) b!146880))

(assert (=> b!146878 m!226685))

(declare-fun m!226859 () Bool)

(assert (=> b!146878 m!226859))

(declare-fun m!226861 () Bool)

(assert (=> b!146878 m!226861))

(declare-fun m!226863 () Bool)

(assert (=> b!146877 m!226863))

(declare-fun m!226865 () Bool)

(assert (=> b!146880 m!226865))

(assert (=> b!146880 m!226749))

(assert (=> b!146880 m!226685))

(declare-fun m!226867 () Bool)

(assert (=> d!47317 m!226867))

(declare-fun m!226869 () Bool)

(assert (=> d!47317 m!226869))

(declare-fun m!226871 () Bool)

(assert (=> d!47317 m!226871))

(declare-fun m!226873 () Bool)

(assert (=> d!47317 m!226873))

(declare-fun m!226875 () Bool)

(assert (=> d!47317 m!226875))

(declare-fun m!226877 () Bool)

(assert (=> d!47317 m!226877))

(declare-fun m!226879 () Bool)

(assert (=> d!47317 m!226879))

(declare-fun m!226881 () Bool)

(assert (=> d!47317 m!226881))

(assert (=> d!47317 m!226757))

(declare-fun m!226883 () Bool)

(assert (=> d!47317 m!226883))

(declare-fun m!226885 () Bool)

(assert (=> d!47317 m!226885))

(declare-fun m!226887 () Bool)

(assert (=> b!146881 m!226887))

(assert (=> b!146798 d!47317))

(assert (=> b!146799 d!47301))

(declare-fun d!47325 () Bool)

(declare-fun e!97935 () Bool)

(assert (=> d!47325 e!97935))

(declare-fun res!122884 () Bool)

(assert (=> d!47325 (=> (not res!122884) (not e!97935))))

(declare-fun lt!228268 () (_ BitVec 64))

(declare-fun lt!228270 () (_ BitVec 64))

(declare-fun lt!228269 () (_ BitVec 64))

(assert (=> d!47325 (= res!122884 (= lt!228269 (bvsub lt!228270 lt!228268)))))

(assert (=> d!47325 (or (= (bvand lt!228270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228268 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228270 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228270 lt!228268) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47325 (= lt!228268 (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 thiss!1634))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634))))))

(declare-fun lt!228267 () (_ BitVec 64))

(declare-fun lt!228266 () (_ BitVec 64))

(assert (=> d!47325 (= lt!228270 (bvmul lt!228267 lt!228266))))

(assert (=> d!47325 (or (= lt!228267 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228266 (bvsdiv (bvmul lt!228267 lt!228266) lt!228267)))))

(assert (=> d!47325 (= lt!228266 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47325 (= lt!228267 ((_ sign_extend 32) (size!3006 (buf!3461 thiss!1634))))))

(assert (=> d!47325 (= lt!228269 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 thiss!1634))))))

(assert (=> d!47325 (invariant!0 (currentBit!6358 thiss!1634) (currentByte!6363 thiss!1634) (size!3006 (buf!3461 thiss!1634)))))

(assert (=> d!47325 (= (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)) lt!228269)))

(declare-fun b!146882 () Bool)

(declare-fun res!122885 () Bool)

(assert (=> b!146882 (=> (not res!122885) (not e!97935))))

(assert (=> b!146882 (= res!122885 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228269))))

(declare-fun b!146883 () Bool)

(declare-fun lt!228265 () (_ BitVec 64))

(assert (=> b!146883 (= e!97935 (bvsle lt!228269 (bvmul lt!228265 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146883 (or (= lt!228265 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228265 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228265)))))

(assert (=> b!146883 (= lt!228265 ((_ sign_extend 32) (size!3006 (buf!3461 thiss!1634))))))

(assert (= (and d!47325 res!122884) b!146882))

(assert (= (and b!146882 res!122885) b!146883))

(declare-fun m!226889 () Bool)

(assert (=> d!47325 m!226889))

(assert (=> d!47325 m!226679))

(assert (=> b!146799 d!47325))

(declare-fun d!47327 () Bool)

(declare-fun res!122890 () Bool)

(declare-fun e!97940 () Bool)

(assert (=> d!47327 (=> res!122890 e!97940)))

(assert (=> d!47327 (= res!122890 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47327 (= (arrayRangesEq!322 arr!237 (_2!6910 lt!228038) #b00000000000000000000000000000000 to!404) e!97940)))

(declare-fun b!146888 () Bool)

(declare-fun e!97941 () Bool)

(assert (=> b!146888 (= e!97940 e!97941)))

(declare-fun res!122891 () Bool)

(assert (=> b!146888 (=> (not res!122891) (not e!97941))))

(assert (=> b!146888 (= res!122891 (= (select (arr!3760 arr!237) #b00000000000000000000000000000000) (select (arr!3760 (_2!6910 lt!228038)) #b00000000000000000000000000000000)))))

(declare-fun b!146889 () Bool)

(assert (=> b!146889 (= e!97941 (arrayRangesEq!322 arr!237 (_2!6910 lt!228038) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47327 (not res!122890)) b!146888))

(assert (= (and b!146888 res!122891) b!146889))

(declare-fun m!226891 () Bool)

(assert (=> b!146888 m!226891))

(declare-fun m!226893 () Bool)

(assert (=> b!146888 m!226893))

(declare-fun m!226895 () Bool)

(assert (=> b!146889 m!226895))

(assert (=> b!146800 d!47327))

(declare-fun d!47329 () Bool)

(assert (=> d!47329 (= (array_inv!2795 arr!237) (bvsge (size!3006 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28340 d!47329))

(declare-fun d!47331 () Bool)

(assert (=> d!47331 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6358 thiss!1634) (currentByte!6363 thiss!1634) (size!3006 (buf!3461 thiss!1634))))))

(declare-fun bs!11582 () Bool)

(assert (= bs!11582 d!47331))

(assert (=> bs!11582 m!226679))

(assert (=> start!28340 d!47331))

(declare-fun d!47333 () Bool)

(declare-fun res!122893 () Bool)

(declare-fun e!97942 () Bool)

(assert (=> d!47333 (=> (not res!122893) (not e!97942))))

(assert (=> d!47333 (= res!122893 (= (size!3006 (buf!3461 (_2!6907 lt!228045))) (size!3006 (buf!3461 (_2!6907 lt!228035)))))))

(assert (=> d!47333 (= (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 lt!228035)) e!97942)))

(declare-fun b!146890 () Bool)

(declare-fun res!122892 () Bool)

(assert (=> b!146890 (=> (not res!122892) (not e!97942))))

(assert (=> b!146890 (= res!122892 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035)))))))

(declare-fun b!146891 () Bool)

(declare-fun e!97943 () Bool)

(assert (=> b!146891 (= e!97942 e!97943)))

(declare-fun res!122894 () Bool)

(assert (=> b!146891 (=> res!122894 e!97943)))

(assert (=> b!146891 (= res!122894 (= (size!3006 (buf!3461 (_2!6907 lt!228045))) #b00000000000000000000000000000000))))

(declare-fun b!146892 () Bool)

(assert (=> b!146892 (= e!97943 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228045)) (buf!3461 (_2!6907 lt!228035)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(assert (= (and d!47333 res!122893) b!146890))

(assert (= (and b!146890 res!122892) b!146891))

(assert (= (and b!146891 (not res!122894)) b!146892))

(assert (=> b!146890 m!226685))

(assert (=> b!146890 m!226749))

(assert (=> b!146892 m!226685))

(assert (=> b!146892 m!226685))

(declare-fun m!226897 () Bool)

(assert (=> b!146892 m!226897))

(assert (=> b!146790 d!47333))

(declare-fun d!47335 () Bool)

(assert (=> d!47335 (= (invariant!0 (currentBit!6358 thiss!1634) (currentByte!6363 thiss!1634) (size!3006 (buf!3461 (_2!6907 lt!228045)))) (and (bvsge (currentBit!6358 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6358 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6363 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6363 thiss!1634) (size!3006 (buf!3461 (_2!6907 lt!228045)))) (and (= (currentBit!6358 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6363 thiss!1634) (size!3006 (buf!3461 (_2!6907 lt!228045))))))))))

(assert (=> b!146801 d!47335))

(declare-fun d!47337 () Bool)

(assert (=> d!47337 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 thiss!1634))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 thiss!1634))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11583 () Bool)

(assert (= bs!11583 d!47337))

(assert (=> bs!11583 m!226889))

(assert (=> b!146802 d!47337))

(declare-fun d!47339 () Bool)

(declare-datatypes ((tuple2!13116 0))(
  ( (tuple2!13117 (_1!6914 (_ BitVec 8)) (_2!6914 BitStream!5270)) )
))
(declare-fun lt!228273 () tuple2!13116)

(declare-fun readByte!0 (BitStream!5270) tuple2!13116)

(assert (=> d!47339 (= lt!228273 (readByte!0 (_1!6909 lt!228039)))))

(assert (=> d!47339 (= (readBytePure!0 (_1!6909 lt!228039)) (tuple2!13109 (_2!6914 lt!228273) (_1!6914 lt!228273)))))

(declare-fun bs!11584 () Bool)

(assert (= bs!11584 d!47339))

(declare-fun m!226899 () Bool)

(assert (=> bs!11584 m!226899))

(assert (=> b!146791 d!47339))

(declare-fun b!146893 () Bool)

(declare-fun res!122895 () Bool)

(declare-fun e!97945 () Bool)

(assert (=> b!146893 (=> (not res!122895) (not e!97945))))

(declare-fun lt!228284 () tuple2!13110)

(assert (=> b!146893 (= res!122895 (isPrefixOf!0 (_2!6909 lt!228284) (_2!6907 lt!228045)))))

(declare-fun b!146894 () Bool)

(declare-fun e!97944 () Unit!9197)

(declare-fun lt!228289 () Unit!9197)

(assert (=> b!146894 (= e!97944 lt!228289)))

(declare-fun lt!228292 () (_ BitVec 64))

(assert (=> b!146894 (= lt!228292 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!228276 () (_ BitVec 64))

(assert (=> b!146894 (= lt!228276 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))

(assert (=> b!146894 (= lt!228289 (arrayBitRangesEqSymmetric!0 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228045)) lt!228292 lt!228276))))

(assert (=> b!146894 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228045)) (buf!3461 thiss!1634) lt!228292 lt!228276)))

(declare-fun b!146895 () Bool)

(declare-fun Unit!9203 () Unit!9197)

(assert (=> b!146895 (= e!97944 Unit!9203)))

(declare-fun lt!228290 () (_ BitVec 64))

(declare-fun b!146896 () Bool)

(declare-fun lt!228293 () (_ BitVec 64))

(assert (=> b!146896 (= e!97945 (= (_1!6909 lt!228284) (withMovedBitIndex!0 (_2!6909 lt!228284) (bvsub lt!228293 lt!228290))))))

(assert (=> b!146896 (or (= (bvand lt!228293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228290 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228293 lt!228290) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146896 (= lt!228290 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))))))

(assert (=> b!146896 (= lt!228293 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))

(declare-fun b!146897 () Bool)

(declare-fun res!122897 () Bool)

(assert (=> b!146897 (=> (not res!122897) (not e!97945))))

(assert (=> b!146897 (= res!122897 (isPrefixOf!0 (_1!6909 lt!228284) thiss!1634))))

(declare-fun d!47341 () Bool)

(assert (=> d!47341 e!97945))

(declare-fun res!122896 () Bool)

(assert (=> d!47341 (=> (not res!122896) (not e!97945))))

(assert (=> d!47341 (= res!122896 (isPrefixOf!0 (_1!6909 lt!228284) (_2!6909 lt!228284)))))

(declare-fun lt!228275 () BitStream!5270)

(assert (=> d!47341 (= lt!228284 (tuple2!13111 lt!228275 (_2!6907 lt!228045)))))

(declare-fun lt!228282 () Unit!9197)

(declare-fun lt!228288 () Unit!9197)

(assert (=> d!47341 (= lt!228282 lt!228288)))

(assert (=> d!47341 (isPrefixOf!0 lt!228275 (_2!6907 lt!228045))))

(assert (=> d!47341 (= lt!228288 (lemmaIsPrefixTransitive!0 lt!228275 (_2!6907 lt!228045) (_2!6907 lt!228045)))))

(declare-fun lt!228286 () Unit!9197)

(declare-fun lt!228278 () Unit!9197)

(assert (=> d!47341 (= lt!228286 lt!228278)))

(assert (=> d!47341 (isPrefixOf!0 lt!228275 (_2!6907 lt!228045))))

(assert (=> d!47341 (= lt!228278 (lemmaIsPrefixTransitive!0 lt!228275 thiss!1634 (_2!6907 lt!228045)))))

(declare-fun lt!228277 () Unit!9197)

(assert (=> d!47341 (= lt!228277 e!97944)))

(declare-fun c!7955 () Bool)

(assert (=> d!47341 (= c!7955 (not (= (size!3006 (buf!3461 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!228281 () Unit!9197)

(declare-fun lt!228283 () Unit!9197)

(assert (=> d!47341 (= lt!228281 lt!228283)))

(assert (=> d!47341 (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 lt!228045))))

(assert (=> d!47341 (= lt!228283 (lemmaIsPrefixRefl!0 (_2!6907 lt!228045)))))

(declare-fun lt!228291 () Unit!9197)

(declare-fun lt!228287 () Unit!9197)

(assert (=> d!47341 (= lt!228291 lt!228287)))

(assert (=> d!47341 (= lt!228287 (lemmaIsPrefixRefl!0 (_2!6907 lt!228045)))))

(declare-fun lt!228274 () Unit!9197)

(declare-fun lt!228280 () Unit!9197)

(assert (=> d!47341 (= lt!228274 lt!228280)))

(assert (=> d!47341 (isPrefixOf!0 lt!228275 lt!228275)))

(assert (=> d!47341 (= lt!228280 (lemmaIsPrefixRefl!0 lt!228275))))

(declare-fun lt!228279 () Unit!9197)

(declare-fun lt!228285 () Unit!9197)

(assert (=> d!47341 (= lt!228279 lt!228285)))

(assert (=> d!47341 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47341 (= lt!228285 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47341 (= lt!228275 (BitStream!5271 (buf!3461 (_2!6907 lt!228045)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))

(assert (=> d!47341 (isPrefixOf!0 thiss!1634 (_2!6907 lt!228045))))

(assert (=> d!47341 (= (reader!0 thiss!1634 (_2!6907 lt!228045)) lt!228284)))

(assert (= (and d!47341 c!7955) b!146894))

(assert (= (and d!47341 (not c!7955)) b!146895))

(assert (= (and d!47341 res!122896) b!146897))

(assert (= (and b!146897 res!122897) b!146893))

(assert (= (and b!146893 res!122895) b!146896))

(assert (=> b!146894 m!226687))

(declare-fun m!226901 () Bool)

(assert (=> b!146894 m!226901))

(declare-fun m!226903 () Bool)

(assert (=> b!146894 m!226903))

(declare-fun m!226905 () Bool)

(assert (=> b!146893 m!226905))

(declare-fun m!226907 () Bool)

(assert (=> b!146896 m!226907))

(assert (=> b!146896 m!226685))

(assert (=> b!146896 m!226687))

(assert (=> d!47341 m!226883))

(declare-fun m!226909 () Bool)

(assert (=> d!47341 m!226909))

(declare-fun m!226911 () Bool)

(assert (=> d!47341 m!226911))

(declare-fun m!226913 () Bool)

(assert (=> d!47341 m!226913))

(assert (=> d!47341 m!226871))

(declare-fun m!226915 () Bool)

(assert (=> d!47341 m!226915))

(declare-fun m!226917 () Bool)

(assert (=> d!47341 m!226917))

(declare-fun m!226919 () Bool)

(assert (=> d!47341 m!226919))

(assert (=> d!47341 m!226681))

(declare-fun m!226921 () Bool)

(assert (=> d!47341 m!226921))

(declare-fun m!226923 () Bool)

(assert (=> d!47341 m!226923))

(declare-fun m!226925 () Bool)

(assert (=> b!146897 m!226925))

(assert (=> b!146791 d!47341))

(declare-fun d!47343 () Bool)

(declare-fun e!97946 () Bool)

(assert (=> d!47343 e!97946))

(declare-fun res!122898 () Bool)

(assert (=> d!47343 (=> (not res!122898) (not e!97946))))

(declare-fun lt!228297 () (_ BitVec 64))

(declare-fun lt!228298 () (_ BitVec 64))

(declare-fun lt!228299 () (_ BitVec 64))

(assert (=> d!47343 (= res!122898 (= lt!228298 (bvsub lt!228299 lt!228297)))))

(assert (=> d!47343 (or (= (bvand lt!228299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228297 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228299 lt!228297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47343 (= lt!228297 (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228031)))) ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228031))) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228031)))))))

(declare-fun lt!228296 () (_ BitVec 64))

(declare-fun lt!228295 () (_ BitVec 64))

(assert (=> d!47343 (= lt!228299 (bvmul lt!228296 lt!228295))))

(assert (=> d!47343 (or (= lt!228296 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228295 (bvsdiv (bvmul lt!228296 lt!228295) lt!228296)))))

(assert (=> d!47343 (= lt!228295 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47343 (= lt!228296 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228031)))))))

(assert (=> d!47343 (= lt!228298 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228031))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228031)))))))

(assert (=> d!47343 (invariant!0 (currentBit!6358 (_1!6908 lt!228031)) (currentByte!6363 (_1!6908 lt!228031)) (size!3006 (buf!3461 (_1!6908 lt!228031))))))

(assert (=> d!47343 (= (bitIndex!0 (size!3006 (buf!3461 (_1!6908 lt!228031))) (currentByte!6363 (_1!6908 lt!228031)) (currentBit!6358 (_1!6908 lt!228031))) lt!228298)))

(declare-fun b!146898 () Bool)

(declare-fun res!122899 () Bool)

(assert (=> b!146898 (=> (not res!122899) (not e!97946))))

(assert (=> b!146898 (= res!122899 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228298))))

(declare-fun b!146899 () Bool)

(declare-fun lt!228294 () (_ BitVec 64))

(assert (=> b!146899 (= e!97946 (bvsle lt!228298 (bvmul lt!228294 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146899 (or (= lt!228294 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228294 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228294)))))

(assert (=> b!146899 (= lt!228294 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228031)))))))

(assert (= (and d!47343 res!122898) b!146898))

(assert (= (and b!146898 res!122899) b!146899))

(declare-fun m!226927 () Bool)

(assert (=> d!47343 m!226927))

(declare-fun m!226929 () Bool)

(assert (=> d!47343 m!226929))

(assert (=> b!146792 d!47343))

(declare-fun d!47345 () Bool)

(declare-fun res!122900 () Bool)

(declare-fun e!97947 () Bool)

(assert (=> d!47345 (=> res!122900 e!97947)))

(assert (=> d!47345 (= res!122900 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47345 (= (arrayRangesEq!322 (_2!6910 lt!228052) (_2!6910 lt!228046) #b00000000000000000000000000000000 to!404) e!97947)))

(declare-fun b!146900 () Bool)

(declare-fun e!97948 () Bool)

(assert (=> b!146900 (= e!97947 e!97948)))

(declare-fun res!122901 () Bool)

(assert (=> b!146900 (=> (not res!122901) (not e!97948))))

(assert (=> b!146900 (= res!122901 (= (select (arr!3760 (_2!6910 lt!228052)) #b00000000000000000000000000000000) (select (arr!3760 (_2!6910 lt!228046)) #b00000000000000000000000000000000)))))

(declare-fun b!146901 () Bool)

(assert (=> b!146901 (= e!97948 (arrayRangesEq!322 (_2!6910 lt!228052) (_2!6910 lt!228046) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47345 (not res!122900)) b!146900))

(assert (= (and b!146900 res!122901) b!146901))

(declare-fun m!226931 () Bool)

(assert (=> b!146900 m!226931))

(declare-fun m!226933 () Bool)

(assert (=> b!146900 m!226933))

(declare-fun m!226935 () Bool)

(assert (=> b!146901 m!226935))

(assert (=> b!146792 d!47345))

(declare-fun d!47347 () Bool)

(declare-fun e!97957 () Bool)

(assert (=> d!47347 e!97957))

(declare-fun res!122914 () Bool)

(assert (=> d!47347 (=> (not res!122914) (not e!97957))))

(declare-fun lt!228326 () tuple2!13108)

(declare-fun lt!228328 () tuple2!13108)

(assert (=> d!47347 (= res!122914 (= (bitIndex!0 (size!3006 (buf!3461 (_1!6908 lt!228326))) (currentByte!6363 (_1!6908 lt!228326)) (currentBit!6358 (_1!6908 lt!228326))) (bitIndex!0 (size!3006 (buf!3461 (_1!6908 lt!228328))) (currentByte!6363 (_1!6908 lt!228328)) (currentBit!6358 (_1!6908 lt!228328)))))))

(declare-fun lt!228329 () BitStream!5270)

(declare-fun lt!228327 () Unit!9197)

(declare-fun choose!14 (BitStream!5270 BitStream!5270 BitStream!5270 tuple2!13108 tuple2!13108 BitStream!5270 (_ BitVec 8) tuple2!13108 tuple2!13108 BitStream!5270 (_ BitVec 8)) Unit!9197)

(assert (=> d!47347 (= lt!228327 (choose!14 lt!228048 (_2!6907 lt!228035) lt!228329 lt!228326 (tuple2!13109 (_1!6908 lt!228326) (_2!6908 lt!228326)) (_1!6908 lt!228326) (_2!6908 lt!228326) lt!228328 (tuple2!13109 (_1!6908 lt!228328) (_2!6908 lt!228328)) (_1!6908 lt!228328) (_2!6908 lt!228328)))))

(assert (=> d!47347 (= lt!228328 (readBytePure!0 lt!228329))))

(assert (=> d!47347 (= lt!228326 (readBytePure!0 lt!228048))))

(assert (=> d!47347 (= lt!228329 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 lt!228048) (currentBit!6358 lt!228048)))))

(assert (=> d!47347 (= (readBytePrefixLemma!0 lt!228048 (_2!6907 lt!228035)) lt!228327)))

(declare-fun b!146914 () Bool)

(assert (=> b!146914 (= e!97957 (= (_2!6908 lt!228326) (_2!6908 lt!228328)))))

(assert (= (and d!47347 res!122914) b!146914))

(declare-fun m!226937 () Bool)

(assert (=> d!47347 m!226937))

(assert (=> d!47347 m!226741))

(declare-fun m!226939 () Bool)

(assert (=> d!47347 m!226939))

(declare-fun m!226941 () Bool)

(assert (=> d!47347 m!226941))

(declare-fun m!226943 () Bool)

(assert (=> d!47347 m!226943))

(assert (=> b!146792 d!47347))

(declare-fun d!47349 () Bool)

(declare-fun e!97966 () Bool)

(assert (=> d!47349 e!97966))

(declare-fun res!122926 () Bool)

(assert (=> d!47349 (=> (not res!122926) (not e!97966))))

(assert (=> d!47349 (= res!122926 (and (or (let ((rhs!3243 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3243 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3243) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!47350 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!47350 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!47350 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3242 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3242 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3242) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!228351 () Unit!9197)

(declare-fun choose!57 (BitStream!5270 BitStream!5270 (_ BitVec 64) (_ BitVec 32)) Unit!9197)

(assert (=> d!47349 (= lt!228351 (choose!57 thiss!1634 (_2!6907 lt!228045) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!47349 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6907 lt!228045) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!228351)))

(declare-fun lt!228353 () (_ BitVec 32))

(declare-fun b!146926 () Bool)

(assert (=> b!146926 (= e!97966 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) (bvsub (bvsub to!404 from!447) lt!228353)))))

(assert (=> b!146926 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!228353 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!228353) #b10000000000000000000000000000000)))))

(declare-fun lt!228352 () (_ BitVec 64))

(assert (=> b!146926 (= lt!228353 ((_ extract 31 0) lt!228352))))

(assert (=> b!146926 (and (bvslt lt!228352 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!228352 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!146926 (= lt!228352 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!47349 res!122926) b!146926))

(declare-fun m!226973 () Bool)

(assert (=> d!47349 m!226973))

(declare-fun m!226975 () Bool)

(assert (=> b!146926 m!226975))

(assert (=> b!146792 d!47349))

(declare-fun d!47359 () Bool)

(assert (=> d!47359 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228055)))

(declare-fun lt!228358 () Unit!9197)

(declare-fun choose!26 (BitStream!5270 array!6642 (_ BitVec 32) BitStream!5270) Unit!9197)

(assert (=> d!47359 (= lt!228358 (choose!26 (_2!6907 lt!228045) (buf!3461 (_2!6907 lt!228035)) lt!228055 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(assert (=> d!47359 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6907 lt!228045) (buf!3461 (_2!6907 lt!228035)) lt!228055) lt!228358)))

(declare-fun bs!11585 () Bool)

(assert (= bs!11585 d!47359))

(assert (=> bs!11585 m!226727))

(declare-fun m!226977 () Bool)

(assert (=> bs!11585 m!226977))

(assert (=> b!146792 d!47359))

(declare-fun d!47361 () Bool)

(assert (=> d!47361 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11586 () Bool)

(assert (= bs!11586 d!47361))

(declare-fun m!226979 () Bool)

(assert (=> bs!11586 m!226979))

(assert (=> b!146792 d!47361))

(declare-fun d!47363 () Bool)

(declare-fun res!122930 () Bool)

(declare-fun e!97969 () Bool)

(assert (=> d!47363 (=> (not res!122930) (not e!97969))))

(assert (=> d!47363 (= res!122930 (= (size!3006 (buf!3461 thiss!1634)) (size!3006 (buf!3461 (_2!6907 lt!228035)))))))

(assert (=> d!47363 (= (isPrefixOf!0 thiss!1634 (_2!6907 lt!228035)) e!97969)))

(declare-fun b!146929 () Bool)

(declare-fun res!122929 () Bool)

(assert (=> b!146929 (=> (not res!122929) (not e!97969))))

(assert (=> b!146929 (= res!122929 (bvsle (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035)))))))

(declare-fun b!146930 () Bool)

(declare-fun e!97970 () Bool)

(assert (=> b!146930 (= e!97969 e!97970)))

(declare-fun res!122931 () Bool)

(assert (=> b!146930 (=> res!122931 e!97970)))

(assert (=> b!146930 (= res!122931 (= (size!3006 (buf!3461 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146931 () Bool)

(assert (=> b!146931 (= e!97970 (arrayBitRangesEq!0 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228035)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(assert (= (and d!47363 res!122930) b!146929))

(assert (= (and b!146929 res!122929) b!146930))

(assert (= (and b!146930 (not res!122931)) b!146931))

(assert (=> b!146929 m!226687))

(assert (=> b!146929 m!226749))

(assert (=> b!146931 m!226687))

(assert (=> b!146931 m!226687))

(declare-fun m!226981 () Bool)

(assert (=> b!146931 m!226981))

(assert (=> b!146792 d!47363))

(assert (=> b!146792 d!47317))

(declare-fun d!47365 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5270 (_ BitVec 32)) tuple2!13106)

(assert (=> d!47365 (= (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001) (_2!6907 (moveByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001)))))

(declare-fun bs!11587 () Bool)

(assert (= bs!11587 d!47365))

(declare-fun m!226985 () Bool)

(assert (=> bs!11587 m!226985))

(assert (=> b!146792 d!47365))

(declare-fun b!146970 () Bool)

(declare-fun e!97995 () Bool)

(declare-fun lt!228463 () (_ BitVec 64))

(assert (=> b!146970 (= e!97995 (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228463))))

(declare-fun b!146971 () Bool)

(declare-fun e!97994 () Bool)

(declare-fun e!97993 () Bool)

(assert (=> b!146971 (= e!97994 e!97993)))

(declare-fun res!122969 () Bool)

(assert (=> b!146971 (=> (not res!122969) (not e!97993))))

(declare-fun lt!228470 () tuple2!13112)

(declare-fun lt!228467 () tuple2!13110)

(assert (=> b!146971 (= res!122969 (and (= (size!3006 (_2!6910 lt!228470)) (size!3006 arr!237)) (= (_1!6910 lt!228470) (_2!6909 lt!228467))))))

(assert (=> b!146971 (= lt!228470 (readByteArrayLoopPure!0 (_1!6909 lt!228467) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!228468 () Unit!9197)

(declare-fun lt!228464 () Unit!9197)

(assert (=> b!146971 (= lt!228468 lt!228464)))

(declare-fun lt!228469 () tuple2!13106)

(assert (=> b!146971 (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228469)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228463)))

(assert (=> b!146971 (= lt!228464 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6907 lt!228045) (buf!3461 (_2!6907 lt!228469)) lt!228463))))

(assert (=> b!146971 e!97995))

(declare-fun res!122971 () Bool)

(assert (=> b!146971 (=> (not res!122971) (not e!97995))))

(assert (=> b!146971 (= res!122971 (and (= (size!3006 (buf!3461 (_2!6907 lt!228045))) (size!3006 (buf!3461 (_2!6907 lt!228469)))) (bvsge lt!228463 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146971 (= lt!228463 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146971 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!146971 (= lt!228467 (reader!0 (_2!6907 lt!228045) (_2!6907 lt!228469)))))

(declare-fun b!146972 () Bool)

(declare-fun res!122970 () Bool)

(assert (=> b!146972 (=> (not res!122970) (not e!97994))))

(assert (=> b!146972 (= res!122970 (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 lt!228469)))))

(declare-fun d!47367 () Bool)

(assert (=> d!47367 e!97994))

(declare-fun res!122968 () Bool)

(assert (=> d!47367 (=> (not res!122968) (not e!97994))))

(assert (=> d!47367 (= res!122968 (= (size!3006 (buf!3461 (_2!6907 lt!228045))) (size!3006 (buf!3461 (_2!6907 lt!228469)))))))

(declare-fun choose!64 (BitStream!5270 array!6642 (_ BitVec 32) (_ BitVec 32)) tuple2!13106)

(assert (=> d!47367 (= lt!228469 (choose!64 (_2!6907 lt!228045) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47367 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3006 arr!237)))))

(assert (=> d!47367 (= (appendByteArrayLoop!0 (_2!6907 lt!228045) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!228469)))

(declare-fun b!146973 () Bool)

(declare-fun res!122972 () Bool)

(assert (=> b!146973 (=> (not res!122972) (not e!97994))))

(declare-fun lt!228465 () (_ BitVec 64))

(declare-fun lt!228462 () (_ BitVec 64))

(assert (=> b!146973 (= res!122972 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228469))) (currentByte!6363 (_2!6907 lt!228469)) (currentBit!6358 (_2!6907 lt!228469))) (bvadd lt!228462 lt!228465)))))

(assert (=> b!146973 (or (not (= (bvand lt!228462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228465 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228462 lt!228465) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!228466 () (_ BitVec 64))

(assert (=> b!146973 (= lt!228465 (bvmul lt!228466 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!146973 (or (= lt!228466 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228466 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228466)))))

(assert (=> b!146973 (= lt!228466 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146973 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!146973 (= lt!228462 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))))))

(declare-fun b!146974 () Bool)

(assert (=> b!146974 (= e!97993 (arrayRangesEq!322 arr!237 (_2!6910 lt!228470) #b00000000000000000000000000000000 to!404))))

(assert (= (and d!47367 res!122968) b!146973))

(assert (= (and b!146973 res!122972) b!146972))

(assert (= (and b!146972 res!122970) b!146971))

(assert (= (and b!146971 res!122971) b!146970))

(assert (= (and b!146971 res!122969) b!146974))

(declare-fun m!227071 () Bool)

(assert (=> b!146972 m!227071))

(declare-fun m!227073 () Bool)

(assert (=> b!146970 m!227073))

(declare-fun m!227075 () Bool)

(assert (=> b!146974 m!227075))

(declare-fun m!227077 () Bool)

(assert (=> d!47367 m!227077))

(declare-fun m!227079 () Bool)

(assert (=> b!146971 m!227079))

(declare-fun m!227081 () Bool)

(assert (=> b!146971 m!227081))

(declare-fun m!227083 () Bool)

(assert (=> b!146971 m!227083))

(declare-fun m!227085 () Bool)

(assert (=> b!146971 m!227085))

(declare-fun m!227087 () Bool)

(assert (=> b!146973 m!227087))

(assert (=> b!146973 m!226685))

(assert (=> b!146792 d!47367))

(declare-fun d!47409 () Bool)

(declare-fun lt!228471 () tuple3!572)

(assert (=> d!47409 (= lt!228471 (readByteArrayLoop!0 (_1!6909 lt!228034) arr!237 from!447 to!404))))

(assert (=> d!47409 (= (readByteArrayLoopPure!0 (_1!6909 lt!228034) arr!237 from!447 to!404) (tuple2!13113 (_2!6913 lt!228471) (_3!355 lt!228471)))))

(declare-fun bs!11601 () Bool)

(assert (= bs!11601 d!47409))

(declare-fun m!227089 () Bool)

(assert (=> bs!11601 m!227089))

(assert (=> b!146792 d!47409))

(declare-fun d!47411 () Bool)

(assert (=> d!47411 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!228472 () Unit!9197)

(assert (=> d!47411 (= lt!228472 (choose!26 thiss!1634 (buf!3461 (_2!6907 lt!228035)) (bvsub to!404 from!447) (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(assert (=> d!47411 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3461 (_2!6907 lt!228035)) (bvsub to!404 from!447)) lt!228472)))

(declare-fun bs!11602 () Bool)

(assert (= bs!11602 d!47411))

(assert (=> bs!11602 m!226737))

(declare-fun m!227091 () Bool)

(assert (=> bs!11602 m!227091))

(assert (=> b!146792 d!47411))

(declare-fun d!47413 () Bool)

(declare-fun lt!228481 () tuple2!13112)

(declare-fun lt!228483 () tuple2!13112)

(assert (=> d!47413 (arrayRangesEq!322 (_2!6910 lt!228481) (_2!6910 lt!228483) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!228482 () BitStream!5270)

(declare-fun lt!228484 () Unit!9197)

(declare-fun choose!35 (BitStream!5270 array!6642 (_ BitVec 32) (_ BitVec 32) tuple2!13112 array!6642 BitStream!5270 tuple2!13112 array!6642) Unit!9197)

(assert (=> d!47413 (= lt!228484 (choose!35 (_1!6909 lt!228034) arr!237 from!447 to!404 lt!228481 (_2!6910 lt!228481) lt!228482 lt!228483 (_2!6910 lt!228483)))))

(assert (=> d!47413 (= lt!228483 (readByteArrayLoopPure!0 lt!228482 (array!6643 (store (arr!3760 arr!237) from!447 (_2!6908 (readBytePure!0 (_1!6909 lt!228034)))) (size!3006 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47413 (= lt!228482 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001))))

(assert (=> d!47413 (= lt!228481 (readByteArrayLoopPure!0 (_1!6909 lt!228034) arr!237 from!447 to!404))))

(assert (=> d!47413 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6909 lt!228034) arr!237 from!447 to!404) lt!228484)))

(declare-fun bs!11604 () Bool)

(assert (= bs!11604 d!47413))

(assert (=> bs!11604 m!226715))

(declare-fun m!227093 () Bool)

(assert (=> bs!11604 m!227093))

(declare-fun m!227095 () Bool)

(assert (=> bs!11604 m!227095))

(declare-fun m!227097 () Bool)

(assert (=> bs!11604 m!227097))

(assert (=> bs!11604 m!226719))

(assert (=> bs!11604 m!226701))

(declare-fun m!227099 () Bool)

(assert (=> bs!11604 m!227099))

(assert (=> b!146792 d!47413))

(declare-fun d!47415 () Bool)

(declare-fun res!122973 () Bool)

(declare-fun e!97996 () Bool)

(assert (=> d!47415 (=> res!122973 e!97996)))

(assert (=> d!47415 (= res!122973 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47415 (= (arrayRangesEq!322 (_2!6910 lt!228052) (_2!6910 lt!228050) #b00000000000000000000000000000000 to!404) e!97996)))

(declare-fun b!146975 () Bool)

(declare-fun e!97997 () Bool)

(assert (=> b!146975 (= e!97996 e!97997)))

(declare-fun res!122974 () Bool)

(assert (=> b!146975 (=> (not res!122974) (not e!97997))))

(assert (=> b!146975 (= res!122974 (= (select (arr!3760 (_2!6910 lt!228052)) #b00000000000000000000000000000000) (select (arr!3760 (_2!6910 lt!228050)) #b00000000000000000000000000000000)))))

(declare-fun b!146976 () Bool)

(assert (=> b!146976 (= e!97997 (arrayRangesEq!322 (_2!6910 lt!228052) (_2!6910 lt!228050) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47415 (not res!122973)) b!146975))

(assert (= (and b!146975 res!122974) b!146976))

(assert (=> b!146975 m!226931))

(declare-fun m!227101 () Bool)

(assert (=> b!146975 m!227101))

(declare-fun m!227103 () Bool)

(assert (=> b!146976 m!227103))

(assert (=> b!146792 d!47415))

(declare-fun d!47417 () Bool)

(assert (=> d!47417 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228055) (bvsle ((_ sign_extend 32) lt!228055) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11605 () Bool)

(assert (= bs!11605 d!47417))

(assert (=> bs!11605 m!226815))

(assert (=> b!146792 d!47417))

(declare-fun d!47419 () Bool)

(declare-fun e!97998 () Bool)

(assert (=> d!47419 e!97998))

(declare-fun res!122975 () Bool)

(assert (=> d!47419 (=> (not res!122975) (not e!97998))))

(declare-fun lt!228489 () (_ BitVec 64))

(declare-fun lt!228490 () (_ BitVec 64))

(declare-fun lt!228488 () (_ BitVec 64))

(assert (=> d!47419 (= res!122975 (= lt!228489 (bvsub lt!228490 lt!228488)))))

(assert (=> d!47419 (or (= (bvand lt!228490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228488 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228490 lt!228488) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47419 (= lt!228488 (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228054)))) ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228054))) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228054)))))))

(declare-fun lt!228487 () (_ BitVec 64))

(declare-fun lt!228486 () (_ BitVec 64))

(assert (=> d!47419 (= lt!228490 (bvmul lt!228487 lt!228486))))

(assert (=> d!47419 (or (= lt!228487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228486 (bvsdiv (bvmul lt!228487 lt!228486) lt!228487)))))

(assert (=> d!47419 (= lt!228486 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47419 (= lt!228487 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228054)))))))

(assert (=> d!47419 (= lt!228489 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228054))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228054)))))))

(assert (=> d!47419 (invariant!0 (currentBit!6358 (_1!6908 lt!228054)) (currentByte!6363 (_1!6908 lt!228054)) (size!3006 (buf!3461 (_1!6908 lt!228054))))))

(assert (=> d!47419 (= (bitIndex!0 (size!3006 (buf!3461 (_1!6908 lt!228054))) (currentByte!6363 (_1!6908 lt!228054)) (currentBit!6358 (_1!6908 lt!228054))) lt!228489)))

(declare-fun b!146977 () Bool)

(declare-fun res!122976 () Bool)

(assert (=> b!146977 (=> (not res!122976) (not e!97998))))

(assert (=> b!146977 (= res!122976 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228489))))

(declare-fun b!146978 () Bool)

(declare-fun lt!228485 () (_ BitVec 64))

(assert (=> b!146978 (= e!97998 (bvsle lt!228489 (bvmul lt!228485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146978 (or (= lt!228485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228485)))))

(assert (=> b!146978 (= lt!228485 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228054)))))))

(assert (= (and d!47419 res!122975) b!146977))

(assert (= (and b!146977 res!122976) b!146978))

(declare-fun m!227105 () Bool)

(assert (=> d!47419 m!227105))

(declare-fun m!227107 () Bool)

(assert (=> d!47419 m!227107))

(assert (=> b!146792 d!47419))

(declare-fun d!47421 () Bool)

(declare-fun lt!228491 () tuple3!572)

(assert (=> d!47421 (= lt!228491 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001) lt!228053 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47421 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001) lt!228053 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13113 (_2!6913 lt!228491) (_3!355 lt!228491)))))

(declare-fun bs!11606 () Bool)

(assert (= bs!11606 d!47421))

(assert (=> bs!11606 m!226719))

(declare-fun m!227109 () Bool)

(assert (=> bs!11606 m!227109))

(assert (=> b!146792 d!47421))

(declare-fun d!47423 () Bool)

(assert (=> d!47423 (isPrefixOf!0 thiss!1634 (_2!6907 lt!228035))))

(declare-fun lt!228494 () Unit!9197)

(declare-fun choose!30 (BitStream!5270 BitStream!5270 BitStream!5270) Unit!9197)

(assert (=> d!47423 (= lt!228494 (choose!30 thiss!1634 (_2!6907 lt!228045) (_2!6907 lt!228035)))))

(assert (=> d!47423 (isPrefixOf!0 thiss!1634 (_2!6907 lt!228045))))

(assert (=> d!47423 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6907 lt!228045) (_2!6907 lt!228035)) lt!228494)))

(declare-fun bs!11607 () Bool)

(assert (= bs!11607 d!47423))

(assert (=> bs!11607 m!226705))

(declare-fun m!227111 () Bool)

(assert (=> bs!11607 m!227111))

(assert (=> bs!11607 m!226681))

(assert (=> b!146792 d!47423))

(declare-fun d!47425 () Bool)

(declare-fun lt!228495 () tuple2!13116)

(assert (=> d!47425 (= lt!228495 (readByte!0 (_1!6909 lt!228034)))))

(assert (=> d!47425 (= (readBytePure!0 (_1!6909 lt!228034)) (tuple2!13109 (_2!6914 lt!228495) (_1!6914 lt!228495)))))

(declare-fun bs!11608 () Bool)

(assert (= bs!11608 d!47425))

(declare-fun m!227113 () Bool)

(assert (=> bs!11608 m!227113))

(assert (=> b!146792 d!47425))

(declare-fun d!47427 () Bool)

(declare-fun lt!228496 () tuple2!13116)

(assert (=> d!47427 (= lt!228496 (readByte!0 lt!228048))))

(assert (=> d!47427 (= (readBytePure!0 lt!228048) (tuple2!13109 (_2!6914 lt!228496) (_1!6914 lt!228496)))))

(declare-fun bs!11609 () Bool)

(assert (= bs!11609 d!47427))

(declare-fun m!227115 () Bool)

(assert (=> bs!11609 m!227115))

(assert (=> b!146792 d!47427))

(declare-fun b!146979 () Bool)

(declare-fun res!122977 () Bool)

(declare-fun e!98000 () Bool)

(assert (=> b!146979 (=> (not res!122977) (not e!98000))))

(declare-fun lt!228507 () tuple2!13110)

(assert (=> b!146979 (= res!122977 (isPrefixOf!0 (_2!6909 lt!228507) (_2!6907 lt!228035)))))

(declare-fun b!146980 () Bool)

(declare-fun e!97999 () Unit!9197)

(declare-fun lt!228512 () Unit!9197)

(assert (=> b!146980 (= e!97999 lt!228512)))

(declare-fun lt!228515 () (_ BitVec 64))

(assert (=> b!146980 (= lt!228515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!228499 () (_ BitVec 64))

(assert (=> b!146980 (= lt!228499 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))

(assert (=> b!146980 (= lt!228512 (arrayBitRangesEqSymmetric!0 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228035)) lt!228515 lt!228499))))

(assert (=> b!146980 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228035)) (buf!3461 thiss!1634) lt!228515 lt!228499)))

(declare-fun b!146981 () Bool)

(declare-fun Unit!9204 () Unit!9197)

(assert (=> b!146981 (= e!97999 Unit!9204)))

(declare-fun b!146982 () Bool)

(declare-fun lt!228516 () (_ BitVec 64))

(declare-fun lt!228513 () (_ BitVec 64))

(assert (=> b!146982 (= e!98000 (= (_1!6909 lt!228507) (withMovedBitIndex!0 (_2!6909 lt!228507) (bvsub lt!228516 lt!228513))))))

(assert (=> b!146982 (or (= (bvand lt!228516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228513 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228516 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228516 lt!228513) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146982 (= lt!228513 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035))))))

(assert (=> b!146982 (= lt!228516 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))

(declare-fun b!146983 () Bool)

(declare-fun res!122979 () Bool)

(assert (=> b!146983 (=> (not res!122979) (not e!98000))))

(assert (=> b!146983 (= res!122979 (isPrefixOf!0 (_1!6909 lt!228507) thiss!1634))))

(declare-fun d!47429 () Bool)

(assert (=> d!47429 e!98000))

(declare-fun res!122978 () Bool)

(assert (=> d!47429 (=> (not res!122978) (not e!98000))))

(assert (=> d!47429 (= res!122978 (isPrefixOf!0 (_1!6909 lt!228507) (_2!6909 lt!228507)))))

(declare-fun lt!228498 () BitStream!5270)

(assert (=> d!47429 (= lt!228507 (tuple2!13111 lt!228498 (_2!6907 lt!228035)))))

(declare-fun lt!228505 () Unit!9197)

(declare-fun lt!228511 () Unit!9197)

(assert (=> d!47429 (= lt!228505 lt!228511)))

(assert (=> d!47429 (isPrefixOf!0 lt!228498 (_2!6907 lt!228035))))

(assert (=> d!47429 (= lt!228511 (lemmaIsPrefixTransitive!0 lt!228498 (_2!6907 lt!228035) (_2!6907 lt!228035)))))

(declare-fun lt!228509 () Unit!9197)

(declare-fun lt!228501 () Unit!9197)

(assert (=> d!47429 (= lt!228509 lt!228501)))

(assert (=> d!47429 (isPrefixOf!0 lt!228498 (_2!6907 lt!228035))))

(assert (=> d!47429 (= lt!228501 (lemmaIsPrefixTransitive!0 lt!228498 thiss!1634 (_2!6907 lt!228035)))))

(declare-fun lt!228500 () Unit!9197)

(assert (=> d!47429 (= lt!228500 e!97999)))

(declare-fun c!7957 () Bool)

(assert (=> d!47429 (= c!7957 (not (= (size!3006 (buf!3461 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!228504 () Unit!9197)

(declare-fun lt!228506 () Unit!9197)

(assert (=> d!47429 (= lt!228504 lt!228506)))

(assert (=> d!47429 (isPrefixOf!0 (_2!6907 lt!228035) (_2!6907 lt!228035))))

(assert (=> d!47429 (= lt!228506 (lemmaIsPrefixRefl!0 (_2!6907 lt!228035)))))

(declare-fun lt!228514 () Unit!9197)

(declare-fun lt!228510 () Unit!9197)

(assert (=> d!47429 (= lt!228514 lt!228510)))

(assert (=> d!47429 (= lt!228510 (lemmaIsPrefixRefl!0 (_2!6907 lt!228035)))))

(declare-fun lt!228497 () Unit!9197)

(declare-fun lt!228503 () Unit!9197)

(assert (=> d!47429 (= lt!228497 lt!228503)))

(assert (=> d!47429 (isPrefixOf!0 lt!228498 lt!228498)))

(assert (=> d!47429 (= lt!228503 (lemmaIsPrefixRefl!0 lt!228498))))

(declare-fun lt!228502 () Unit!9197)

(declare-fun lt!228508 () Unit!9197)

(assert (=> d!47429 (= lt!228502 lt!228508)))

(assert (=> d!47429 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47429 (= lt!228508 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47429 (= lt!228498 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))

(assert (=> d!47429 (isPrefixOf!0 thiss!1634 (_2!6907 lt!228035))))

(assert (=> d!47429 (= (reader!0 thiss!1634 (_2!6907 lt!228035)) lt!228507)))

(assert (= (and d!47429 c!7957) b!146980))

(assert (= (and d!47429 (not c!7957)) b!146981))

(assert (= (and d!47429 res!122978) b!146983))

(assert (= (and b!146983 res!122979) b!146979))

(assert (= (and b!146979 res!122977) b!146982))

(assert (=> b!146980 m!226687))

(declare-fun m!227117 () Bool)

(assert (=> b!146980 m!227117))

(declare-fun m!227119 () Bool)

(assert (=> b!146980 m!227119))

(declare-fun m!227121 () Bool)

(assert (=> b!146979 m!227121))

(declare-fun m!227123 () Bool)

(assert (=> b!146982 m!227123))

(assert (=> b!146982 m!226749))

(assert (=> b!146982 m!226687))

(assert (=> d!47429 m!226867))

(declare-fun m!227125 () Bool)

(assert (=> d!47429 m!227125))

(assert (=> d!47429 m!226911))

(declare-fun m!227127 () Bool)

(assert (=> d!47429 m!227127))

(assert (=> d!47429 m!226875))

(declare-fun m!227129 () Bool)

(assert (=> d!47429 m!227129))

(declare-fun m!227131 () Bool)

(assert (=> d!47429 m!227131))

(declare-fun m!227133 () Bool)

(assert (=> d!47429 m!227133))

(assert (=> d!47429 m!226705))

(assert (=> d!47429 m!226921))

(declare-fun m!227135 () Bool)

(assert (=> d!47429 m!227135))

(declare-fun m!227137 () Bool)

(assert (=> b!146983 m!227137))

(assert (=> b!146792 d!47429))

(declare-fun d!47431 () Bool)

(declare-fun lt!228517 () tuple3!572)

(assert (=> d!47431 (= lt!228517 (readByteArrayLoop!0 (_1!6909 lt!228037) lt!228053 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47431 (= (readByteArrayLoopPure!0 (_1!6909 lt!228037) lt!228053 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13113 (_2!6913 lt!228517) (_3!355 lt!228517)))))

(declare-fun bs!11610 () Bool)

(assert (= bs!11610 d!47431))

(declare-fun m!227139 () Bool)

(assert (=> bs!11610 m!227139))

(assert (=> b!146792 d!47431))

(declare-fun d!47433 () Bool)

(declare-fun e!98003 () Bool)

(assert (=> d!47433 e!98003))

(declare-fun res!122986 () Bool)

(assert (=> d!47433 (=> (not res!122986) (not e!98003))))

(declare-fun lt!228528 () tuple2!13106)

(assert (=> d!47433 (= res!122986 (= (size!3006 (buf!3461 thiss!1634)) (size!3006 (buf!3461 (_2!6907 lt!228528)))))))

(declare-fun choose!6 (BitStream!5270 (_ BitVec 8)) tuple2!13106)

(assert (=> d!47433 (= lt!228528 (choose!6 thiss!1634 (select (arr!3760 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!47433 (validate_offset_byte!0 ((_ sign_extend 32) (size!3006 (buf!3461 thiss!1634))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634)))))

(assert (=> d!47433 (= (appendByte!0 thiss!1634 (select (arr!3760 arr!237) from!447)) lt!228528)))

(declare-fun b!146990 () Bool)

(declare-fun res!122987 () Bool)

(assert (=> b!146990 (=> (not res!122987) (not e!98003))))

(declare-fun lt!228530 () (_ BitVec 64))

(declare-fun lt!228529 () (_ BitVec 64))

(assert (=> b!146990 (= res!122987 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228528))) (currentByte!6363 (_2!6907 lt!228528)) (currentBit!6358 (_2!6907 lt!228528))) (bvadd lt!228529 lt!228530)))))

(assert (=> b!146990 (or (not (= (bvand lt!228529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228530 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228529 lt!228530) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146990 (= lt!228530 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146990 (= lt!228529 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))

(declare-fun b!146991 () Bool)

(declare-fun res!122988 () Bool)

(assert (=> b!146991 (=> (not res!122988) (not e!98003))))

(assert (=> b!146991 (= res!122988 (isPrefixOf!0 thiss!1634 (_2!6907 lt!228528)))))

(declare-fun b!146992 () Bool)

(declare-fun lt!228532 () tuple2!13110)

(declare-fun lt!228531 () tuple2!13108)

(assert (=> b!146992 (= e!98003 (and (= (_2!6908 lt!228531) (select (arr!3760 arr!237) from!447)) (= (_1!6908 lt!228531) (_2!6909 lt!228532))))))

(assert (=> b!146992 (= lt!228531 (readBytePure!0 (_1!6909 lt!228532)))))

(assert (=> b!146992 (= lt!228532 (reader!0 thiss!1634 (_2!6907 lt!228528)))))

(assert (= (and d!47433 res!122986) b!146990))

(assert (= (and b!146990 res!122987) b!146991))

(assert (= (and b!146991 res!122988) b!146992))

(assert (=> d!47433 m!226689))

(declare-fun m!227141 () Bool)

(assert (=> d!47433 m!227141))

(declare-fun m!227143 () Bool)

(assert (=> d!47433 m!227143))

(declare-fun m!227145 () Bool)

(assert (=> b!146990 m!227145))

(assert (=> b!146990 m!226687))

(declare-fun m!227147 () Bool)

(assert (=> b!146991 m!227147))

(declare-fun m!227149 () Bool)

(assert (=> b!146992 m!227149))

(declare-fun m!227151 () Bool)

(assert (=> b!146992 m!227151))

(assert (=> b!146792 d!47433))

(declare-fun d!47435 () Bool)

(declare-fun lt!228533 () tuple2!13116)

(assert (=> d!47435 (= lt!228533 (readByte!0 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(assert (=> d!47435 (= (readBytePure!0 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) (tuple2!13109 (_2!6914 lt!228533) (_1!6914 lt!228533)))))

(declare-fun bs!11611 () Bool)

(assert (= bs!11611 d!47435))

(declare-fun m!227153 () Bool)

(assert (=> bs!11611 m!227153))

(assert (=> b!146792 d!47435))

(declare-fun d!47437 () Bool)

(assert (=> d!47437 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228055) (bvsle ((_ sign_extend 32) lt!228055) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11612 () Bool)

(assert (= bs!11612 d!47437))

(assert (=> bs!11612 m!226851))

(assert (=> b!146792 d!47437))

(declare-fun d!47439 () Bool)

(assert (=> d!47439 (= (array_inv!2795 (buf!3461 thiss!1634)) (bvsge (size!3006 (buf!3461 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!146803 d!47439))

(push 1)

(assert (not b!146893))

(assert (not b!146970))

(assert (not d!47365))

(assert (not b!146889))

(assert (not b!146982))

(assert (not d!47427))

(assert (not d!47331))

(assert (not d!47417))

(assert (not d!47339))

(assert (not d!47301))

(assert (not d!47317))

(assert (not b!146892))

(assert (not b!146992))

(assert (not d!47435))

(assert (not b!146926))

(assert (not d!47413))

(assert (not d!47341))

(assert (not b!146974))

(assert (not b!146990))

(assert (not b!146897))

(assert (not d!47343))

(assert (not b!146881))

(assert (not d!47425))

(assert (not b!146829))

(assert (not d!47325))

(assert (not d!47429))

(assert (not d!47421))

(assert (not b!146890))

(assert (not b!146980))

(assert (not b!146831))

(assert (not b!146983))

(assert (not b!146976))

(assert (not d!47409))

(assert (not d!47367))

(assert (not b!146931))

(assert (not b!146880))

(assert (not d!47361))

(assert (not b!146991))

(assert (not b!146878))

(assert (not d!47437))

(assert (not b!146877))

(assert (not b!146972))

(assert (not d!47411))

(assert (not d!47313))

(assert (not d!47315))

(assert (not b!146901))

(assert (not b!146971))

(assert (not b!146894))

(assert (not d!47423))

(assert (not b!146979))

(assert (not b!146929))

(assert (not d!47305))

(assert (not d!47431))

(assert (not d!47433))

(assert (not d!47337))

(assert (not d!47359))

(assert (not d!47347))

(assert (not d!47419))

(assert (not d!47295))

(assert (not b!146973))

(assert (not d!47349))

(assert (not b!146896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!47526 () Bool)

(declare-fun res!123074 () Bool)

(declare-fun e!98059 () Bool)

(assert (=> d!47526 (=> (not res!123074) (not e!98059))))

(assert (=> d!47526 (= res!123074 (= (size!3006 (buf!3461 (_1!6909 lt!228284))) (size!3006 (buf!3461 thiss!1634))))))

(assert (=> d!47526 (= (isPrefixOf!0 (_1!6909 lt!228284) thiss!1634) e!98059)))

(declare-fun b!147087 () Bool)

(declare-fun res!123073 () Bool)

(assert (=> b!147087 (=> (not res!123073) (not e!98059))))

(assert (=> b!147087 (= res!123073 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228284))) (currentByte!6363 (_1!6909 lt!228284)) (currentBit!6358 (_1!6909 lt!228284))) (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(declare-fun b!147088 () Bool)

(declare-fun e!98060 () Bool)

(assert (=> b!147088 (= e!98059 e!98060)))

(declare-fun res!123075 () Bool)

(assert (=> b!147088 (=> res!123075 e!98060)))

(assert (=> b!147088 (= res!123075 (= (size!3006 (buf!3461 (_1!6909 lt!228284))) #b00000000000000000000000000000000))))

(declare-fun b!147089 () Bool)

(assert (=> b!147089 (= e!98060 (arrayBitRangesEq!0 (buf!3461 (_1!6909 lt!228284)) (buf!3461 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228284))) (currentByte!6363 (_1!6909 lt!228284)) (currentBit!6358 (_1!6909 lt!228284)))))))

(assert (= (and d!47526 res!123074) b!147087))

(assert (= (and b!147087 res!123073) b!147088))

(assert (= (and b!147088 (not res!123075)) b!147089))

(declare-fun m!227353 () Bool)

(assert (=> b!147087 m!227353))

(assert (=> b!147087 m!226687))

(assert (=> b!147089 m!227353))

(assert (=> b!147089 m!227353))

(declare-fun m!227355 () Bool)

(assert (=> b!147089 m!227355))

(assert (=> b!146897 d!47526))

(assert (=> d!47411 d!47361))

(declare-fun d!47528 () Bool)

(assert (=> d!47528 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!47528 true))

(declare-fun _$5!70 () Unit!9197)

(assert (=> d!47528 (= (choose!26 thiss!1634 (buf!3461 (_2!6907 lt!228035)) (bvsub to!404 from!447) (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) _$5!70)))

(declare-fun bs!11634 () Bool)

(assert (= bs!11634 d!47528))

(assert (=> bs!11634 m!226737))

(assert (=> d!47411 d!47528))

(declare-fun d!47530 () Bool)

(declare-fun lt!228791 () (_ BitVec 8))

(declare-fun lt!228787 () (_ BitVec 8))

(assert (=> d!47530 (= lt!228791 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3760 (buf!3461 (_1!6909 lt!228039))) (currentByte!6363 (_1!6909 lt!228039)))) ((_ sign_extend 24) lt!228787))))))

(assert (=> d!47530 (= lt!228787 ((_ extract 7 0) (currentBit!6358 (_1!6909 lt!228039))))))

(declare-fun e!98065 () Bool)

(assert (=> d!47530 e!98065))

(declare-fun res!123082 () Bool)

(assert (=> d!47530 (=> (not res!123082) (not e!98065))))

(assert (=> d!47530 (= res!123082 (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6909 lt!228039)))) ((_ sign_extend 32) (currentByte!6363 (_1!6909 lt!228039))) ((_ sign_extend 32) (currentBit!6358 (_1!6909 lt!228039))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13120 0))(
  ( (tuple2!13121 (_1!6917 Unit!9197) (_2!6917 (_ BitVec 8))) )
))
(declare-fun Unit!9208 () Unit!9197)

(declare-fun Unit!9209 () Unit!9197)

(assert (=> d!47530 (= (readByte!0 (_1!6909 lt!228039)) (tuple2!13117 (_2!6917 (ite (bvsgt ((_ sign_extend 24) lt!228787) #b00000000000000000000000000000000) (tuple2!13121 Unit!9208 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!228791) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3760 (buf!3461 (_1!6909 lt!228039))) (bvadd (currentByte!6363 (_1!6909 lt!228039)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!228787)))))))) (tuple2!13121 Unit!9209 lt!228791))) (BitStream!5271 (buf!3461 (_1!6909 lt!228039)) (bvadd (currentByte!6363 (_1!6909 lt!228039)) #b00000000000000000000000000000001) (currentBit!6358 (_1!6909 lt!228039)))))))

(declare-fun b!147094 () Bool)

(declare-fun e!98066 () Bool)

(assert (=> b!147094 (= e!98065 e!98066)))

(declare-fun res!123081 () Bool)

(assert (=> b!147094 (=> (not res!123081) (not e!98066))))

(declare-fun lt!228788 () tuple2!13116)

(assert (=> b!147094 (= res!123081 (= (buf!3461 (_2!6914 lt!228788)) (buf!3461 (_1!6909 lt!228039))))))

(declare-fun lt!228792 () (_ BitVec 8))

(declare-fun lt!228793 () (_ BitVec 8))

(declare-fun Unit!9210 () Unit!9197)

(declare-fun Unit!9211 () Unit!9197)

(assert (=> b!147094 (= lt!228788 (tuple2!13117 (_2!6917 (ite (bvsgt ((_ sign_extend 24) lt!228792) #b00000000000000000000000000000000) (tuple2!13121 Unit!9210 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!228793) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3760 (buf!3461 (_1!6909 lt!228039))) (bvadd (currentByte!6363 (_1!6909 lt!228039)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!228792)))))))) (tuple2!13121 Unit!9211 lt!228793))) (BitStream!5271 (buf!3461 (_1!6909 lt!228039)) (bvadd (currentByte!6363 (_1!6909 lt!228039)) #b00000000000000000000000000000001) (currentBit!6358 (_1!6909 lt!228039)))))))

(assert (=> b!147094 (= lt!228793 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3760 (buf!3461 (_1!6909 lt!228039))) (currentByte!6363 (_1!6909 lt!228039)))) ((_ sign_extend 24) lt!228792))))))

(assert (=> b!147094 (= lt!228792 ((_ extract 7 0) (currentBit!6358 (_1!6909 lt!228039))))))

(declare-fun lt!228789 () (_ BitVec 64))

(declare-fun b!147095 () Bool)

(declare-fun lt!228790 () (_ BitVec 64))

(assert (=> b!147095 (= e!98066 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!228788))) (currentByte!6363 (_2!6914 lt!228788)) (currentBit!6358 (_2!6914 lt!228788))) (bvadd lt!228790 lt!228789)))))

(assert (=> b!147095 (or (not (= (bvand lt!228790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228789 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228790 lt!228789) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147095 (= lt!228789 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!147095 (= lt!228790 (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228039))) (currentByte!6363 (_1!6909 lt!228039)) (currentBit!6358 (_1!6909 lt!228039))))))

(assert (= (and d!47530 res!123082) b!147094))

(assert (= (and b!147094 res!123081) b!147095))

(declare-fun m!227357 () Bool)

(assert (=> d!47530 m!227357))

(declare-fun m!227359 () Bool)

(assert (=> d!47530 m!227359))

(declare-fun m!227361 () Bool)

(assert (=> d!47530 m!227361))

(assert (=> b!147094 m!227361))

(assert (=> b!147094 m!227357))

(declare-fun m!227363 () Bool)

(assert (=> b!147095 m!227363))

(declare-fun m!227365 () Bool)

(assert (=> b!147095 m!227365))

(assert (=> d!47339 d!47530))

(declare-fun d!47532 () Bool)

(declare-fun res!123083 () Bool)

(declare-fun e!98067 () Bool)

(assert (=> d!47532 (=> res!123083 e!98067)))

(assert (=> d!47532 (= res!123083 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47532 (= (arrayRangesEq!322 arr!237 (_2!6910 lt!228038) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!98067)))

(declare-fun b!147096 () Bool)

(declare-fun e!98068 () Bool)

(assert (=> b!147096 (= e!98067 e!98068)))

(declare-fun res!123084 () Bool)

(assert (=> b!147096 (=> (not res!123084) (not e!98068))))

(assert (=> b!147096 (= res!123084 (= (select (arr!3760 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3760 (_2!6910 lt!228038)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!147097 () Bool)

(assert (=> b!147097 (= e!98068 (arrayRangesEq!322 arr!237 (_2!6910 lt!228038) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47532 (not res!123083)) b!147096))

(assert (= (and b!147096 res!123084) b!147097))

(declare-fun m!227367 () Bool)

(assert (=> b!147096 m!227367))

(declare-fun m!227369 () Bool)

(assert (=> b!147096 m!227369))

(declare-fun m!227371 () Bool)

(assert (=> b!147097 m!227371))

(assert (=> b!146889 d!47532))

(declare-fun d!47534 () Bool)

(declare-fun res!123086 () Bool)

(declare-fun e!98069 () Bool)

(assert (=> d!47534 (=> (not res!123086) (not e!98069))))

(assert (=> d!47534 (= res!123086 (= (size!3006 (buf!3461 thiss!1634)) (size!3006 (buf!3461 (_2!6907 lt!228528)))))))

(assert (=> d!47534 (= (isPrefixOf!0 thiss!1634 (_2!6907 lt!228528)) e!98069)))

(declare-fun b!147098 () Bool)

(declare-fun res!123085 () Bool)

(assert (=> b!147098 (=> (not res!123085) (not e!98069))))

(assert (=> b!147098 (= res!123085 (bvsle (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228528))) (currentByte!6363 (_2!6907 lt!228528)) (currentBit!6358 (_2!6907 lt!228528)))))))

(declare-fun b!147099 () Bool)

(declare-fun e!98070 () Bool)

(assert (=> b!147099 (= e!98069 e!98070)))

(declare-fun res!123087 () Bool)

(assert (=> b!147099 (=> res!123087 e!98070)))

(assert (=> b!147099 (= res!123087 (= (size!3006 (buf!3461 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!147100 () Bool)

(assert (=> b!147100 (= e!98070 (arrayBitRangesEq!0 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228528)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(assert (= (and d!47534 res!123086) b!147098))

(assert (= (and b!147098 res!123085) b!147099))

(assert (= (and b!147099 (not res!123087)) b!147100))

(assert (=> b!147098 m!226687))

(assert (=> b!147098 m!227145))

(assert (=> b!147100 m!226687))

(assert (=> b!147100 m!226687))

(declare-fun m!227373 () Bool)

(assert (=> b!147100 m!227373))

(assert (=> b!146991 d!47534))

(declare-fun b!147110 () Bool)

(declare-fun res!123096 () Bool)

(declare-fun e!98078 () Bool)

(assert (=> b!147110 (=> (not res!123096) (not e!98078))))

(declare-fun _$37!44 () tuple2!13106)

(assert (=> b!147110 (= res!123096 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6907 _$37!44))) (currentByte!6363 (_2!6907 _$37!44)) (currentBit!6358 (_2!6907 _$37!44))) (bvadd (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!147109 () Bool)

(declare-fun e!98077 () Bool)

(assert (=> b!147109 (= e!98077 (array_inv!2795 (buf!3461 (_2!6907 _$37!44))))))

(declare-fun d!47536 () Bool)

(assert (=> d!47536 e!98078))

(declare-fun res!123094 () Bool)

(assert (=> d!47536 (=> (not res!123094) (not e!98078))))

(assert (=> d!47536 (= res!123094 (= (size!3006 (buf!3461 thiss!1634)) (size!3006 (buf!3461 (_2!6907 _$37!44)))))))

(assert (=> d!47536 (and (inv!12 (_2!6907 _$37!44)) e!98077)))

(assert (=> d!47536 (= (choose!6 thiss!1634 (select (arr!3760 arr!237) from!447)) _$37!44)))

(declare-fun b!147111 () Bool)

(declare-fun res!123095 () Bool)

(assert (=> b!147111 (=> (not res!123095) (not e!98078))))

(assert (=> b!147111 (= res!123095 (isPrefixOf!0 thiss!1634 (_2!6907 _$37!44)))))

(declare-fun lt!228799 () tuple2!13110)

(declare-fun lt!228798 () tuple2!13108)

(declare-fun b!147112 () Bool)

(assert (=> b!147112 (= e!98078 (and (= (_2!6908 lt!228798) (select (arr!3760 arr!237) from!447)) (= (_1!6908 lt!228798) (_2!6909 lt!228799))))))

(assert (=> b!147112 (= lt!228798 (readBytePure!0 (_1!6909 lt!228799)))))

(assert (=> b!147112 (= lt!228799 (reader!0 thiss!1634 (_2!6907 _$37!44)))))

(assert (= d!47536 b!147109))

(assert (= (and d!47536 res!123094) b!147110))

(assert (= (and b!147110 res!123096) b!147111))

(assert (= (and b!147111 res!123095) b!147112))

(declare-fun m!227375 () Bool)

(assert (=> b!147110 m!227375))

(assert (=> b!147110 m!226687))

(declare-fun m!227377 () Bool)

(assert (=> b!147111 m!227377))

(declare-fun m!227379 () Bool)

(assert (=> b!147112 m!227379))

(declare-fun m!227381 () Bool)

(assert (=> b!147112 m!227381))

(declare-fun m!227383 () Bool)

(assert (=> d!47536 m!227383))

(declare-fun m!227385 () Bool)

(assert (=> b!147109 m!227385))

(assert (=> d!47433 d!47536))

(declare-fun d!47538 () Bool)

(assert (=> d!47538 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3006 (buf!3461 thiss!1634))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 thiss!1634))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11635 () Bool)

(assert (= bs!11635 d!47538))

(assert (=> bs!11635 m!226889))

(assert (=> d!47433 d!47538))

(assert (=> b!146890 d!47301))

(assert (=> b!146890 d!47295))

(assert (=> d!47413 d!47365))

(declare-fun d!47540 () Bool)

(assert (=> d!47540 (arrayRangesEq!322 (_2!6910 (readByteArrayLoopPure!0 (_1!6909 lt!228034) arr!237 from!447 to!404)) (_2!6910 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001) (array!6643 (store (arr!3760 arr!237) from!447 (_2!6908 (readBytePure!0 (_1!6909 lt!228034)))) (size!3006 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!47540 true))

(declare-fun _$13!61 () Unit!9197)

(assert (=> d!47540 (= (choose!35 (_1!6909 lt!228034) arr!237 from!447 to!404 lt!228481 (_2!6910 lt!228481) lt!228482 lt!228483 (_2!6910 lt!228483)) _$13!61)))

(declare-fun bs!11637 () Bool)

(assert (= bs!11637 d!47540))

(assert (=> bs!11637 m!226719))

(assert (=> bs!11637 m!226715))

(assert (=> bs!11637 m!227099))

(assert (=> bs!11637 m!226719))

(declare-fun m!227387 () Bool)

(assert (=> bs!11637 m!227387))

(declare-fun m!227389 () Bool)

(assert (=> bs!11637 m!227389))

(assert (=> bs!11637 m!226701))

(assert (=> d!47413 d!47540))

(declare-fun d!47542 () Bool)

(declare-fun res!123097 () Bool)

(declare-fun e!98080 () Bool)

(assert (=> d!47542 (=> res!123097 e!98080)))

(assert (=> d!47542 (= res!123097 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47542 (= (arrayRangesEq!322 (_2!6910 lt!228481) (_2!6910 lt!228483) #b00000000000000000000000000000000 to!404) e!98080)))

(declare-fun b!147113 () Bool)

(declare-fun e!98081 () Bool)

(assert (=> b!147113 (= e!98080 e!98081)))

(declare-fun res!123098 () Bool)

(assert (=> b!147113 (=> (not res!123098) (not e!98081))))

(assert (=> b!147113 (= res!123098 (= (select (arr!3760 (_2!6910 lt!228481)) #b00000000000000000000000000000000) (select (arr!3760 (_2!6910 lt!228483)) #b00000000000000000000000000000000)))))

(declare-fun b!147114 () Bool)

(assert (=> b!147114 (= e!98081 (arrayRangesEq!322 (_2!6910 lt!228481) (_2!6910 lt!228483) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47542 (not res!123097)) b!147113))

(assert (= (and b!147113 res!123098) b!147114))

(declare-fun m!227391 () Bool)

(assert (=> b!147113 m!227391))

(declare-fun m!227393 () Bool)

(assert (=> b!147113 m!227393))

(declare-fun m!227395 () Bool)

(assert (=> b!147114 m!227395))

(assert (=> d!47413 d!47542))

(assert (=> d!47413 d!47409))

(declare-fun d!47544 () Bool)

(declare-fun lt!228800 () tuple3!572)

(assert (=> d!47544 (= lt!228800 (readByteArrayLoop!0 lt!228482 (array!6643 (store (arr!3760 arr!237) from!447 (_2!6908 (readBytePure!0 (_1!6909 lt!228034)))) (size!3006 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47544 (= (readByteArrayLoopPure!0 lt!228482 (array!6643 (store (arr!3760 arr!237) from!447 (_2!6908 (readBytePure!0 (_1!6909 lt!228034)))) (size!3006 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!13113 (_2!6913 lt!228800) (_3!355 lt!228800)))))

(declare-fun bs!11638 () Bool)

(assert (= bs!11638 d!47544))

(declare-fun m!227397 () Bool)

(assert (=> bs!11638 m!227397))

(assert (=> d!47413 d!47544))

(assert (=> d!47413 d!47425))

(declare-fun e!98099 () Bool)

(declare-datatypes ((tuple4!138 0))(
  ( (tuple4!139 (_1!6918 (_ BitVec 32)) (_2!6918 (_ BitVec 32)) (_3!357 (_ BitVec 32)) (_4!69 (_ BitVec 32))) )
))
(declare-fun lt!228808 () tuple4!138)

(declare-fun b!147129 () Bool)

(assert (=> b!147129 (= e!98099 (arrayRangesEq!322 (buf!3461 (_2!6907 lt!228045)) (buf!3461 (_2!6907 lt!228035)) (_1!6918 lt!228808) (_2!6918 lt!228808)))))

(declare-fun d!47546 () Bool)

(declare-fun res!123111 () Bool)

(declare-fun e!98098 () Bool)

(assert (=> d!47546 (=> res!123111 e!98098)))

(assert (=> d!47546 (= res!123111 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(assert (=> d!47546 (= (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228045)) (buf!3461 (_2!6907 lt!228035)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))) e!98098)))

(declare-fun b!147130 () Bool)

(declare-fun res!123113 () Bool)

(declare-fun lt!228807 () (_ BitVec 32))

(assert (=> b!147130 (= res!123113 (= lt!228807 #b00000000000000000000000000000000))))

(declare-fun e!98097 () Bool)

(assert (=> b!147130 (=> res!123113 e!98097)))

(declare-fun e!98095 () Bool)

(assert (=> b!147130 (= e!98095 e!98097)))

(declare-fun b!147131 () Bool)

(declare-fun e!98094 () Bool)

(assert (=> b!147131 (= e!98098 e!98094)))

(declare-fun res!123112 () Bool)

(assert (=> b!147131 (=> (not res!123112) (not e!98094))))

(assert (=> b!147131 (= res!123112 e!98099)))

(declare-fun res!123110 () Bool)

(assert (=> b!147131 (=> res!123110 e!98099)))

(assert (=> b!147131 (= res!123110 (bvsge (_1!6918 lt!228808) (_2!6918 lt!228808)))))

(assert (=> b!147131 (= lt!228807 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!228809 () (_ BitVec 32))

(assert (=> b!147131 (= lt!228809 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!138)

(assert (=> b!147131 (= lt!228808 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(declare-fun b!147132 () Bool)

(declare-fun e!98096 () Bool)

(assert (=> b!147132 (= e!98096 e!98095)))

(declare-fun res!123109 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147132 (= res!123109 (byteRangesEq!0 (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_3!357 lt!228808)) (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_3!357 lt!228808)) lt!228809 #b00000000000000000000000000001000))))

(assert (=> b!147132 (=> (not res!123109) (not e!98095))))

(declare-fun b!147133 () Bool)

(assert (=> b!147133 (= e!98094 e!98096)))

(declare-fun c!7965 () Bool)

(assert (=> b!147133 (= c!7965 (= (_3!357 lt!228808) (_4!69 lt!228808)))))

(declare-fun b!147134 () Bool)

(declare-fun call!1949 () Bool)

(assert (=> b!147134 (= e!98096 call!1949)))

(declare-fun b!147135 () Bool)

(assert (=> b!147135 (= e!98097 call!1949)))

(declare-fun bm!1946 () Bool)

(assert (=> bm!1946 (= call!1949 (byteRangesEq!0 (ite c!7965 (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_3!357 lt!228808)) (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_4!69 lt!228808))) (ite c!7965 (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_3!357 lt!228808)) (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_4!69 lt!228808))) (ite c!7965 lt!228809 #b00000000000000000000000000000000) lt!228807))))

(assert (= (and d!47546 (not res!123111)) b!147131))

(assert (= (and b!147131 (not res!123110)) b!147129))

(assert (= (and b!147131 res!123112) b!147133))

(assert (= (and b!147133 c!7965) b!147134))

(assert (= (and b!147133 (not c!7965)) b!147132))

(assert (= (and b!147132 res!123109) b!147130))

(assert (= (and b!147130 (not res!123113)) b!147135))

(assert (= (or b!147134 b!147135) bm!1946))

(declare-fun m!227399 () Bool)

(assert (=> b!147129 m!227399))

(assert (=> b!147131 m!226685))

(declare-fun m!227401 () Bool)

(assert (=> b!147131 m!227401))

(declare-fun m!227403 () Bool)

(assert (=> b!147132 m!227403))

(declare-fun m!227405 () Bool)

(assert (=> b!147132 m!227405))

(assert (=> b!147132 m!227403))

(assert (=> b!147132 m!227405))

(declare-fun m!227407 () Bool)

(assert (=> b!147132 m!227407))

(assert (=> bm!1946 m!227405))

(declare-fun m!227409 () Bool)

(assert (=> bm!1946 m!227409))

(assert (=> bm!1946 m!227403))

(declare-fun m!227411 () Bool)

(assert (=> bm!1946 m!227411))

(declare-fun m!227413 () Bool)

(assert (=> bm!1946 m!227413))

(assert (=> b!146892 d!47546))

(assert (=> b!146892 d!47301))

(declare-fun d!47548 () Bool)

(assert (=> d!47548 (= (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228054)))) ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228054))) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228054)))) (bvsub (bvmul ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228054)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228054))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228054))))))))

(assert (=> d!47419 d!47548))

(declare-fun d!47550 () Bool)

(assert (=> d!47550 (= (invariant!0 (currentBit!6358 (_1!6908 lt!228054)) (currentByte!6363 (_1!6908 lt!228054)) (size!3006 (buf!3461 (_1!6908 lt!228054)))) (and (bvsge (currentBit!6358 (_1!6908 lt!228054)) #b00000000000000000000000000000000) (bvslt (currentBit!6358 (_1!6908 lt!228054)) #b00000000000000000000000000001000) (bvsge (currentByte!6363 (_1!6908 lt!228054)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6363 (_1!6908 lt!228054)) (size!3006 (buf!3461 (_1!6908 lt!228054)))) (and (= (currentBit!6358 (_1!6908 lt!228054)) #b00000000000000000000000000000000) (= (currentByte!6363 (_1!6908 lt!228054)) (size!3006 (buf!3461 (_1!6908 lt!228054))))))))))

(assert (=> d!47419 d!47550))

(declare-fun bm!1953 () Bool)

(declare-fun lt!228916 () tuple3!572)

(declare-fun c!7968 () Bool)

(declare-fun call!1957 () Bool)

(assert (=> bm!1953 (= call!1957 (arrayRangesEq!322 lt!228053 (ite c!7968 (_3!355 lt!228916) lt!228053) #b00000000000000000000000000000000 (ite c!7968 (bvadd #b00000000000000000000000000000001 from!447) (size!3006 lt!228053))))))

(declare-fun b!147146 () Bool)

(declare-fun res!123120 () Bool)

(declare-fun e!98108 () Bool)

(assert (=> b!147146 (=> (not res!123120) (not e!98108))))

(declare-fun lt!228895 () tuple3!572)

(assert (=> b!147146 (= res!123120 (and (= (buf!3461 (_1!6909 lt!228037)) (buf!3461 (_2!6913 lt!228895))) (= (size!3006 lt!228053) (size!3006 (_3!355 lt!228895)))))))

(declare-fun b!147147 () Bool)

(declare-fun e!98107 () tuple3!572)

(declare-fun lt!228902 () Unit!9197)

(assert (=> b!147147 (= e!98107 (tuple3!573 lt!228902 (_2!6913 lt!228916) (_3!355 lt!228916)))))

(declare-fun lt!228899 () tuple2!13116)

(assert (=> b!147147 (= lt!228899 (readByte!0 (_1!6909 lt!228037)))))

(declare-fun lt!228887 () array!6642)

(assert (=> b!147147 (= lt!228887 (array!6643 (store (arr!3760 lt!228053) (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!228899)) (size!3006 lt!228053)))))

(declare-fun lt!228890 () (_ BitVec 64))

(assert (=> b!147147 (= lt!228890 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!228891 () (_ BitVec 32))

(assert (=> b!147147 (= lt!228891 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!228892 () Unit!9197)

(assert (=> b!147147 (= lt!228892 (validateOffsetBytesFromBitIndexLemma!0 (_1!6909 lt!228037) (_2!6914 lt!228899) lt!228890 lt!228891))))

(assert (=> b!147147 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6914 lt!228899)))) ((_ sign_extend 32) (currentByte!6363 (_2!6914 lt!228899))) ((_ sign_extend 32) (currentBit!6358 (_2!6914 lt!228899))) (bvsub lt!228891 ((_ extract 31 0) (bvsdiv (bvadd lt!228890 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!228911 () Unit!9197)

(assert (=> b!147147 (= lt!228911 lt!228892)))

(assert (=> b!147147 (= lt!228916 (readByteArrayLoop!0 (_2!6914 lt!228899) lt!228887 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!147147 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!228899))) (currentByte!6363 (_2!6914 lt!228899)) (currentBit!6358 (_2!6914 lt!228899))) (bvadd (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228037))) (currentByte!6363 (_1!6909 lt!228037)) (currentBit!6358 (_1!6909 lt!228037))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!228903 () Unit!9197)

(declare-fun Unit!9212 () Unit!9197)

(assert (=> b!147147 (= lt!228903 Unit!9212)))

(declare-fun call!1958 () (_ BitVec 64))

(assert (=> b!147147 (= (bvadd (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!228899))) (currentByte!6363 (_2!6914 lt!228899)) (currentBit!6358 (_2!6914 lt!228899))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1958)))

(declare-fun lt!228914 () Unit!9197)

(declare-fun Unit!9213 () Unit!9197)

(assert (=> b!147147 (= lt!228914 Unit!9213)))

(assert (=> b!147147 (= (bvadd (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228037))) (currentByte!6363 (_1!6909 lt!228037)) (currentBit!6358 (_1!6909 lt!228037))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1958)))

(declare-fun lt!228893 () Unit!9197)

(declare-fun Unit!9214 () Unit!9197)

(assert (=> b!147147 (= lt!228893 Unit!9214)))

(assert (=> b!147147 (and (= (buf!3461 (_1!6909 lt!228037)) (buf!3461 (_2!6913 lt!228916))) (= (size!3006 lt!228053) (size!3006 (_3!355 lt!228916))))))

(declare-fun lt!228894 () Unit!9197)

(declare-fun Unit!9215 () Unit!9197)

(assert (=> b!147147 (= lt!228894 Unit!9215)))

(declare-fun lt!228888 () Unit!9197)

(declare-fun arrayUpdatedAtPrefixLemma!12 (array!6642 (_ BitVec 32) (_ BitVec 8)) Unit!9197)

(assert (=> b!147147 (= lt!228888 (arrayUpdatedAtPrefixLemma!12 lt!228053 (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!228899)))))

(declare-fun call!1956 () Bool)

(assert (=> b!147147 call!1956))

(declare-fun lt!228897 () Unit!9197)

(assert (=> b!147147 (= lt!228897 lt!228888)))

(declare-fun lt!228917 () (_ BitVec 32))

(assert (=> b!147147 (= lt!228917 #b00000000000000000000000000000000)))

(declare-fun lt!228910 () Unit!9197)

(declare-fun arrayRangesEqTransitive!52 (array!6642 array!6642 array!6642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9197)

(assert (=> b!147147 (= lt!228910 (arrayRangesEqTransitive!52 lt!228053 lt!228887 (_3!355 lt!228916) lt!228917 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147147 (arrayRangesEq!322 lt!228053 (_3!355 lt!228916) lt!228917 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!228900 () Unit!9197)

(assert (=> b!147147 (= lt!228900 lt!228910)))

(assert (=> b!147147 call!1957))

(declare-fun lt!228915 () Unit!9197)

(declare-fun Unit!9216 () Unit!9197)

(assert (=> b!147147 (= lt!228915 Unit!9216)))

(declare-fun lt!228889 () Unit!9197)

(declare-fun arrayRangesEqImpliesEq!12 (array!6642 array!6642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9197)

(assert (=> b!147147 (= lt!228889 (arrayRangesEqImpliesEq!12 lt!228887 (_3!355 lt!228916) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147147 (= (select (store (arr!3760 lt!228053) (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!228899)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3760 (_3!355 lt!228916)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!228913 () Unit!9197)

(assert (=> b!147147 (= lt!228913 lt!228889)))

(declare-fun lt!228904 () Bool)

(assert (=> b!147147 (= lt!228904 (= (select (arr!3760 (_3!355 lt!228916)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6914 lt!228899)))))

(declare-fun Unit!9217 () Unit!9197)

(assert (=> b!147147 (= lt!228902 Unit!9217)))

(assert (=> b!147147 lt!228904))

(declare-fun lt!228912 () Unit!9197)

(declare-fun b!147148 () Bool)

(assert (=> b!147148 (= e!98107 (tuple3!573 lt!228912 (_1!6909 lt!228037) lt!228053))))

(assert (=> b!147148 (= call!1958 call!1958)))

(declare-fun lt!228896 () Unit!9197)

(declare-fun Unit!9218 () Unit!9197)

(assert (=> b!147148 (= lt!228896 Unit!9218)))

(declare-fun lt!228909 () Unit!9197)

(declare-fun arrayRangesEqReflexiveLemma!12 (array!6642) Unit!9197)

(assert (=> b!147148 (= lt!228909 (arrayRangesEqReflexiveLemma!12 lt!228053))))

(assert (=> b!147148 call!1957))

(declare-fun lt!228908 () Unit!9197)

(assert (=> b!147148 (= lt!228908 lt!228909)))

(declare-fun lt!228906 () array!6642)

(assert (=> b!147148 (= lt!228906 lt!228053)))

(declare-fun lt!228883 () array!6642)

(assert (=> b!147148 (= lt!228883 lt!228053)))

(declare-fun lt!228901 () (_ BitVec 32))

(assert (=> b!147148 (= lt!228901 #b00000000000000000000000000000000)))

(declare-fun lt!228884 () (_ BitVec 32))

(assert (=> b!147148 (= lt!228884 (size!3006 lt!228053))))

(declare-fun lt!228907 () (_ BitVec 32))

(assert (=> b!147148 (= lt!228907 #b00000000000000000000000000000000)))

(declare-fun lt!228905 () (_ BitVec 32))

(assert (=> b!147148 (= lt!228905 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun arrayRangesEqSlicedLemma!12 (array!6642 array!6642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9197)

(assert (=> b!147148 (= lt!228912 (arrayRangesEqSlicedLemma!12 lt!228906 lt!228883 lt!228901 lt!228884 lt!228907 lt!228905))))

(assert (=> b!147148 call!1956))

(declare-fun b!147149 () Bool)

(declare-fun e!98106 () Bool)

(assert (=> b!147149 (= e!98106 (= (select (arr!3760 (_3!355 lt!228895)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6908 (readBytePure!0 (_1!6909 lt!228037)))))))

(assert (=> b!147149 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3006 (_3!355 lt!228895))))))

(declare-fun b!147150 () Bool)

(assert (=> b!147150 (= e!98108 (arrayRangesEq!322 lt!228053 (_3!355 lt!228895) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun bm!1954 () Bool)

(assert (=> bm!1954 (= call!1958 (bitIndex!0 (ite c!7968 (size!3006 (buf!3461 (_2!6913 lt!228916))) (size!3006 (buf!3461 (_1!6909 lt!228037)))) (ite c!7968 (currentByte!6363 (_2!6913 lt!228916)) (currentByte!6363 (_1!6909 lt!228037))) (ite c!7968 (currentBit!6358 (_2!6913 lt!228916)) (currentBit!6358 (_1!6909 lt!228037)))))))

(declare-fun bm!1955 () Bool)

(assert (=> bm!1955 (= call!1956 (arrayRangesEq!322 (ite c!7968 lt!228053 lt!228906) (ite c!7968 (array!6643 (store (arr!3760 lt!228053) (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!228899)) (size!3006 lt!228053)) lt!228883) (ite c!7968 #b00000000000000000000000000000000 lt!228907) (ite c!7968 (bvadd #b00000000000000000000000000000001 from!447) lt!228905)))))

(declare-fun d!47552 () Bool)

(assert (=> d!47552 e!98106))

(declare-fun res!123122 () Bool)

(assert (=> d!47552 (=> res!123122 e!98106)))

(assert (=> d!47552 (= res!123122 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!228886 () Bool)

(assert (=> d!47552 (= lt!228886 e!98108)))

(declare-fun res!123121 () Bool)

(assert (=> d!47552 (=> (not res!123121) (not e!98108))))

(declare-fun lt!228882 () (_ BitVec 64))

(declare-fun lt!228898 () (_ BitVec 64))

(assert (=> d!47552 (= res!123121 (= (bvadd lt!228882 lt!228898) (bitIndex!0 (size!3006 (buf!3461 (_2!6913 lt!228895))) (currentByte!6363 (_2!6913 lt!228895)) (currentBit!6358 (_2!6913 lt!228895)))))))

(assert (=> d!47552 (or (not (= (bvand lt!228882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228898 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228882 lt!228898) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!228885 () (_ BitVec 64))

(assert (=> d!47552 (= lt!228898 (bvmul lt!228885 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47552 (or (= lt!228885 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228885 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228885)))))

(assert (=> d!47552 (= lt!228885 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!47552 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!47552 (= lt!228882 (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228037))) (currentByte!6363 (_1!6909 lt!228037)) (currentBit!6358 (_1!6909 lt!228037))))))

(assert (=> d!47552 (= lt!228895 e!98107)))

(assert (=> d!47552 (= c!7968 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47552 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3006 lt!228053)))))

(assert (=> d!47552 (= (readByteArrayLoop!0 (_1!6909 lt!228037) lt!228053 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!228895)))

(assert (= (and d!47552 c!7968) b!147147))

(assert (= (and d!47552 (not c!7968)) b!147148))

(assert (= (or b!147147 b!147148) bm!1955))

(assert (= (or b!147147 b!147148) bm!1953))

(assert (= (or b!147147 b!147148) bm!1954))

(assert (= (and d!47552 res!123121) b!147146))

(assert (= (and b!147146 res!123120) b!147150))

(assert (= (and d!47552 (not res!123122)) b!147149))

(declare-fun m!227415 () Bool)

(assert (=> bm!1955 m!227415))

(declare-fun m!227417 () Bool)

(assert (=> bm!1955 m!227417))

(declare-fun m!227419 () Bool)

(assert (=> bm!1954 m!227419))

(declare-fun m!227421 () Bool)

(assert (=> b!147149 m!227421))

(declare-fun m!227423 () Bool)

(assert (=> b!147149 m!227423))

(declare-fun m!227425 () Bool)

(assert (=> d!47552 m!227425))

(declare-fun m!227427 () Bool)

(assert (=> d!47552 m!227427))

(declare-fun m!227429 () Bool)

(assert (=> bm!1953 m!227429))

(declare-fun m!227431 () Bool)

(assert (=> b!147150 m!227431))

(declare-fun m!227433 () Bool)

(assert (=> b!147147 m!227433))

(declare-fun m!227435 () Bool)

(assert (=> b!147147 m!227435))

(declare-fun m!227437 () Bool)

(assert (=> b!147147 m!227437))

(assert (=> b!147147 m!227427))

(declare-fun m!227439 () Bool)

(assert (=> b!147147 m!227439))

(declare-fun m!227441 () Bool)

(assert (=> b!147147 m!227441))

(declare-fun m!227443 () Bool)

(assert (=> b!147147 m!227443))

(declare-fun m!227445 () Bool)

(assert (=> b!147147 m!227445))

(declare-fun m!227447 () Bool)

(assert (=> b!147147 m!227447))

(declare-fun m!227449 () Bool)

(assert (=> b!147147 m!227449))

(declare-fun m!227451 () Bool)

(assert (=> b!147147 m!227451))

(declare-fun m!227453 () Bool)

(assert (=> b!147147 m!227453))

(assert (=> b!147147 m!227415))

(declare-fun m!227455 () Bool)

(assert (=> b!147148 m!227455))

(declare-fun m!227457 () Bool)

(assert (=> b!147148 m!227457))

(assert (=> d!47431 d!47552))

(declare-fun c!7969 () Bool)

(declare-fun call!1960 () Bool)

(declare-fun lt!228952 () tuple3!572)

(declare-fun bm!1956 () Bool)

(assert (=> bm!1956 (= call!1960 (arrayRangesEq!322 arr!237 (ite c!7969 (_3!355 lt!228952) arr!237) #b00000000000000000000000000000000 (ite c!7969 (bvadd #b00000000000000000000000000000001 from!447) (size!3006 arr!237))))))

(declare-fun b!147151 () Bool)

(declare-fun res!123123 () Bool)

(declare-fun e!98111 () Bool)

(assert (=> b!147151 (=> (not res!123123) (not e!98111))))

(declare-fun lt!228931 () tuple3!572)

(assert (=> b!147151 (= res!123123 (and (= (buf!3461 (_1!6909 lt!228041)) (buf!3461 (_2!6913 lt!228931))) (= (size!3006 arr!237) (size!3006 (_3!355 lt!228931)))))))

(declare-fun b!147152 () Bool)

(declare-fun e!98110 () tuple3!572)

(declare-fun lt!228938 () Unit!9197)

(assert (=> b!147152 (= e!98110 (tuple3!573 lt!228938 (_2!6913 lt!228952) (_3!355 lt!228952)))))

(declare-fun lt!228935 () tuple2!13116)

(assert (=> b!147152 (= lt!228935 (readByte!0 (_1!6909 lt!228041)))))

(declare-fun lt!228923 () array!6642)

(assert (=> b!147152 (= lt!228923 (array!6643 (store (arr!3760 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!228935)) (size!3006 arr!237)))))

(declare-fun lt!228926 () (_ BitVec 64))

(assert (=> b!147152 (= lt!228926 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!228927 () (_ BitVec 32))

(assert (=> b!147152 (= lt!228927 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!228928 () Unit!9197)

(assert (=> b!147152 (= lt!228928 (validateOffsetBytesFromBitIndexLemma!0 (_1!6909 lt!228041) (_2!6914 lt!228935) lt!228926 lt!228927))))

(assert (=> b!147152 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6914 lt!228935)))) ((_ sign_extend 32) (currentByte!6363 (_2!6914 lt!228935))) ((_ sign_extend 32) (currentBit!6358 (_2!6914 lt!228935))) (bvsub lt!228927 ((_ extract 31 0) (bvsdiv (bvadd lt!228926 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!228947 () Unit!9197)

(assert (=> b!147152 (= lt!228947 lt!228928)))

(assert (=> b!147152 (= lt!228952 (readByteArrayLoop!0 (_2!6914 lt!228935) lt!228923 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!147152 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!228935))) (currentByte!6363 (_2!6914 lt!228935)) (currentBit!6358 (_2!6914 lt!228935))) (bvadd (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228041))) (currentByte!6363 (_1!6909 lt!228041)) (currentBit!6358 (_1!6909 lt!228041))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!228939 () Unit!9197)

(declare-fun Unit!9219 () Unit!9197)

(assert (=> b!147152 (= lt!228939 Unit!9219)))

(declare-fun call!1961 () (_ BitVec 64))

(assert (=> b!147152 (= (bvadd (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!228935))) (currentByte!6363 (_2!6914 lt!228935)) (currentBit!6358 (_2!6914 lt!228935))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1961)))

(declare-fun lt!228950 () Unit!9197)

(declare-fun Unit!9220 () Unit!9197)

(assert (=> b!147152 (= lt!228950 Unit!9220)))

(assert (=> b!147152 (= (bvadd (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228041))) (currentByte!6363 (_1!6909 lt!228041)) (currentBit!6358 (_1!6909 lt!228041))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1961)))

(declare-fun lt!228929 () Unit!9197)

(declare-fun Unit!9221 () Unit!9197)

(assert (=> b!147152 (= lt!228929 Unit!9221)))

(assert (=> b!147152 (and (= (buf!3461 (_1!6909 lt!228041)) (buf!3461 (_2!6913 lt!228952))) (= (size!3006 arr!237) (size!3006 (_3!355 lt!228952))))))

(declare-fun lt!228930 () Unit!9197)

(declare-fun Unit!9222 () Unit!9197)

(assert (=> b!147152 (= lt!228930 Unit!9222)))

(declare-fun lt!228924 () Unit!9197)

(assert (=> b!147152 (= lt!228924 (arrayUpdatedAtPrefixLemma!12 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!228935)))))

(declare-fun call!1959 () Bool)

(assert (=> b!147152 call!1959))

(declare-fun lt!228933 () Unit!9197)

(assert (=> b!147152 (= lt!228933 lt!228924)))

(declare-fun lt!228953 () (_ BitVec 32))

(assert (=> b!147152 (= lt!228953 #b00000000000000000000000000000000)))

(declare-fun lt!228946 () Unit!9197)

(assert (=> b!147152 (= lt!228946 (arrayRangesEqTransitive!52 arr!237 lt!228923 (_3!355 lt!228952) lt!228953 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147152 (arrayRangesEq!322 arr!237 (_3!355 lt!228952) lt!228953 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!228936 () Unit!9197)

(assert (=> b!147152 (= lt!228936 lt!228946)))

(assert (=> b!147152 call!1960))

(declare-fun lt!228951 () Unit!9197)

(declare-fun Unit!9223 () Unit!9197)

(assert (=> b!147152 (= lt!228951 Unit!9223)))

(declare-fun lt!228925 () Unit!9197)

(assert (=> b!147152 (= lt!228925 (arrayRangesEqImpliesEq!12 lt!228923 (_3!355 lt!228952) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147152 (= (select (store (arr!3760 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!228935)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3760 (_3!355 lt!228952)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!228949 () Unit!9197)

(assert (=> b!147152 (= lt!228949 lt!228925)))

(declare-fun lt!228940 () Bool)

(assert (=> b!147152 (= lt!228940 (= (select (arr!3760 (_3!355 lt!228952)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6914 lt!228935)))))

(declare-fun Unit!9224 () Unit!9197)

(assert (=> b!147152 (= lt!228938 Unit!9224)))

(assert (=> b!147152 lt!228940))

(declare-fun lt!228948 () Unit!9197)

(declare-fun b!147153 () Bool)

(assert (=> b!147153 (= e!98110 (tuple3!573 lt!228948 (_1!6909 lt!228041) arr!237))))

(assert (=> b!147153 (= call!1961 call!1961)))

(declare-fun lt!228932 () Unit!9197)

(declare-fun Unit!9225 () Unit!9197)

(assert (=> b!147153 (= lt!228932 Unit!9225)))

(declare-fun lt!228945 () Unit!9197)

(assert (=> b!147153 (= lt!228945 (arrayRangesEqReflexiveLemma!12 arr!237))))

(assert (=> b!147153 call!1960))

(declare-fun lt!228944 () Unit!9197)

(assert (=> b!147153 (= lt!228944 lt!228945)))

(declare-fun lt!228942 () array!6642)

(assert (=> b!147153 (= lt!228942 arr!237)))

(declare-fun lt!228919 () array!6642)

(assert (=> b!147153 (= lt!228919 arr!237)))

(declare-fun lt!228937 () (_ BitVec 32))

(assert (=> b!147153 (= lt!228937 #b00000000000000000000000000000000)))

(declare-fun lt!228920 () (_ BitVec 32))

(assert (=> b!147153 (= lt!228920 (size!3006 arr!237))))

(declare-fun lt!228943 () (_ BitVec 32))

(assert (=> b!147153 (= lt!228943 #b00000000000000000000000000000000)))

(declare-fun lt!228941 () (_ BitVec 32))

(assert (=> b!147153 (= lt!228941 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!147153 (= lt!228948 (arrayRangesEqSlicedLemma!12 lt!228942 lt!228919 lt!228937 lt!228920 lt!228943 lt!228941))))

(assert (=> b!147153 call!1959))

(declare-fun b!147154 () Bool)

(declare-fun e!98109 () Bool)

(assert (=> b!147154 (= e!98109 (= (select (arr!3760 (_3!355 lt!228931)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6908 (readBytePure!0 (_1!6909 lt!228041)))))))

(assert (=> b!147154 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3006 (_3!355 lt!228931))))))

(declare-fun b!147155 () Bool)

(assert (=> b!147155 (= e!98111 (arrayRangesEq!322 arr!237 (_3!355 lt!228931) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun bm!1957 () Bool)

(assert (=> bm!1957 (= call!1961 (bitIndex!0 (ite c!7969 (size!3006 (buf!3461 (_2!6913 lt!228952))) (size!3006 (buf!3461 (_1!6909 lt!228041)))) (ite c!7969 (currentByte!6363 (_2!6913 lt!228952)) (currentByte!6363 (_1!6909 lt!228041))) (ite c!7969 (currentBit!6358 (_2!6913 lt!228952)) (currentBit!6358 (_1!6909 lt!228041)))))))

(declare-fun bm!1958 () Bool)

(assert (=> bm!1958 (= call!1959 (arrayRangesEq!322 (ite c!7969 arr!237 lt!228942) (ite c!7969 (array!6643 (store (arr!3760 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!228935)) (size!3006 arr!237)) lt!228919) (ite c!7969 #b00000000000000000000000000000000 lt!228943) (ite c!7969 (bvadd #b00000000000000000000000000000001 from!447) lt!228941)))))

(declare-fun d!47554 () Bool)

(assert (=> d!47554 e!98109))

(declare-fun res!123125 () Bool)

(assert (=> d!47554 (=> res!123125 e!98109)))

(assert (=> d!47554 (= res!123125 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!228922 () Bool)

(assert (=> d!47554 (= lt!228922 e!98111)))

(declare-fun res!123124 () Bool)

(assert (=> d!47554 (=> (not res!123124) (not e!98111))))

(declare-fun lt!228934 () (_ BitVec 64))

(declare-fun lt!228918 () (_ BitVec 64))

(assert (=> d!47554 (= res!123124 (= (bvadd lt!228918 lt!228934) (bitIndex!0 (size!3006 (buf!3461 (_2!6913 lt!228931))) (currentByte!6363 (_2!6913 lt!228931)) (currentBit!6358 (_2!6913 lt!228931)))))))

(assert (=> d!47554 (or (not (= (bvand lt!228918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228934 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228918 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228918 lt!228934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!228921 () (_ BitVec 64))

(assert (=> d!47554 (= lt!228934 (bvmul lt!228921 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47554 (or (= lt!228921 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228921 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228921)))))

(assert (=> d!47554 (= lt!228921 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!47554 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!47554 (= lt!228918 (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228041))) (currentByte!6363 (_1!6909 lt!228041)) (currentBit!6358 (_1!6909 lt!228041))))))

(assert (=> d!47554 (= lt!228931 e!98110)))

(assert (=> d!47554 (= c!7969 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47554 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3006 arr!237)))))

(assert (=> d!47554 (= (readByteArrayLoop!0 (_1!6909 lt!228041) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!228931)))

(assert (= (and d!47554 c!7969) b!147152))

(assert (= (and d!47554 (not c!7969)) b!147153))

(assert (= (or b!147152 b!147153) bm!1958))

(assert (= (or b!147152 b!147153) bm!1956))

(assert (= (or b!147152 b!147153) bm!1957))

(assert (= (and d!47554 res!123124) b!147151))

(assert (= (and b!147151 res!123123) b!147155))

(assert (= (and d!47554 (not res!123125)) b!147154))

(declare-fun m!227459 () Bool)

(assert (=> bm!1958 m!227459))

(declare-fun m!227461 () Bool)

(assert (=> bm!1958 m!227461))

(declare-fun m!227463 () Bool)

(assert (=> bm!1957 m!227463))

(declare-fun m!227465 () Bool)

(assert (=> b!147154 m!227465))

(declare-fun m!227467 () Bool)

(assert (=> b!147154 m!227467))

(declare-fun m!227469 () Bool)

(assert (=> d!47554 m!227469))

(declare-fun m!227471 () Bool)

(assert (=> d!47554 m!227471))

(declare-fun m!227473 () Bool)

(assert (=> bm!1956 m!227473))

(declare-fun m!227475 () Bool)

(assert (=> b!147155 m!227475))

(declare-fun m!227477 () Bool)

(assert (=> b!147152 m!227477))

(declare-fun m!227479 () Bool)

(assert (=> b!147152 m!227479))

(declare-fun m!227481 () Bool)

(assert (=> b!147152 m!227481))

(assert (=> b!147152 m!227471))

(declare-fun m!227483 () Bool)

(assert (=> b!147152 m!227483))

(declare-fun m!227485 () Bool)

(assert (=> b!147152 m!227485))

(declare-fun m!227487 () Bool)

(assert (=> b!147152 m!227487))

(declare-fun m!227489 () Bool)

(assert (=> b!147152 m!227489))

(declare-fun m!227491 () Bool)

(assert (=> b!147152 m!227491))

(declare-fun m!227493 () Bool)

(assert (=> b!147152 m!227493))

(declare-fun m!227495 () Bool)

(assert (=> b!147152 m!227495))

(declare-fun m!227497 () Bool)

(assert (=> b!147152 m!227497))

(assert (=> b!147152 m!227459))

(declare-fun m!227499 () Bool)

(assert (=> b!147153 m!227499))

(declare-fun m!227501 () Bool)

(assert (=> b!147153 m!227501))

(assert (=> d!47305 d!47554))

(declare-fun d!47556 () Bool)

(declare-fun res!123127 () Bool)

(declare-fun e!98112 () Bool)

(assert (=> d!47556 (=> (not res!123127) (not e!98112))))

(assert (=> d!47556 (= res!123127 (= (size!3006 (buf!3461 (_2!6909 lt!228255))) (size!3006 (buf!3461 (_2!6907 lt!228035)))))))

(assert (=> d!47556 (= (isPrefixOf!0 (_2!6909 lt!228255) (_2!6907 lt!228035)) e!98112)))

(declare-fun b!147156 () Bool)

(declare-fun res!123126 () Bool)

(assert (=> b!147156 (=> (not res!123126) (not e!98112))))

(assert (=> b!147156 (= res!123126 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228255))) (currentByte!6363 (_2!6909 lt!228255)) (currentBit!6358 (_2!6909 lt!228255))) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035)))))))

(declare-fun b!147157 () Bool)

(declare-fun e!98113 () Bool)

(assert (=> b!147157 (= e!98112 e!98113)))

(declare-fun res!123128 () Bool)

(assert (=> b!147157 (=> res!123128 e!98113)))

(assert (=> b!147157 (= res!123128 (= (size!3006 (buf!3461 (_2!6909 lt!228255))) #b00000000000000000000000000000000))))

(declare-fun b!147158 () Bool)

(assert (=> b!147158 (= e!98113 (arrayBitRangesEq!0 (buf!3461 (_2!6909 lt!228255)) (buf!3461 (_2!6907 lt!228035)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228255))) (currentByte!6363 (_2!6909 lt!228255)) (currentBit!6358 (_2!6909 lt!228255)))))))

(assert (= (and d!47556 res!123127) b!147156))

(assert (= (and b!147156 res!123126) b!147157))

(assert (= (and b!147157 (not res!123128)) b!147158))

(declare-fun m!227503 () Bool)

(assert (=> b!147156 m!227503))

(assert (=> b!147156 m!226749))

(assert (=> b!147158 m!227503))

(assert (=> b!147158 m!227503))

(declare-fun m!227505 () Bool)

(assert (=> b!147158 m!227505))

(assert (=> b!146877 d!47556))

(declare-fun d!47558 () Bool)

(assert (=> d!47558 (isPrefixOf!0 lt!228275 lt!228275)))

(declare-fun lt!228956 () Unit!9197)

(declare-fun choose!11 (BitStream!5270) Unit!9197)

(assert (=> d!47558 (= lt!228956 (choose!11 lt!228275))))

(assert (=> d!47558 (= (lemmaIsPrefixRefl!0 lt!228275) lt!228956)))

(declare-fun bs!11640 () Bool)

(assert (= bs!11640 d!47558))

(assert (=> bs!11640 m!226923))

(declare-fun m!227507 () Bool)

(assert (=> bs!11640 m!227507))

(assert (=> d!47341 d!47558))

(declare-fun d!47560 () Bool)

(declare-fun res!123130 () Bool)

(declare-fun e!98114 () Bool)

(assert (=> d!47560 (=> (not res!123130) (not e!98114))))

(assert (=> d!47560 (= res!123130 (= (size!3006 (buf!3461 (_1!6909 lt!228284))) (size!3006 (buf!3461 (_2!6909 lt!228284)))))))

(assert (=> d!47560 (= (isPrefixOf!0 (_1!6909 lt!228284) (_2!6909 lt!228284)) e!98114)))

(declare-fun b!147159 () Bool)

(declare-fun res!123129 () Bool)

(assert (=> b!147159 (=> (not res!123129) (not e!98114))))

(assert (=> b!147159 (= res!123129 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228284))) (currentByte!6363 (_1!6909 lt!228284)) (currentBit!6358 (_1!6909 lt!228284))) (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228284))) (currentByte!6363 (_2!6909 lt!228284)) (currentBit!6358 (_2!6909 lt!228284)))))))

(declare-fun b!147160 () Bool)

(declare-fun e!98115 () Bool)

(assert (=> b!147160 (= e!98114 e!98115)))

(declare-fun res!123131 () Bool)

(assert (=> b!147160 (=> res!123131 e!98115)))

(assert (=> b!147160 (= res!123131 (= (size!3006 (buf!3461 (_1!6909 lt!228284))) #b00000000000000000000000000000000))))

(declare-fun b!147161 () Bool)

(assert (=> b!147161 (= e!98115 (arrayBitRangesEq!0 (buf!3461 (_1!6909 lt!228284)) (buf!3461 (_2!6909 lt!228284)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228284))) (currentByte!6363 (_1!6909 lt!228284)) (currentBit!6358 (_1!6909 lt!228284)))))))

(assert (= (and d!47560 res!123130) b!147159))

(assert (= (and b!147159 res!123129) b!147160))

(assert (= (and b!147160 (not res!123131)) b!147161))

(assert (=> b!147159 m!227353))

(declare-fun m!227509 () Bool)

(assert (=> b!147159 m!227509))

(assert (=> b!147161 m!227353))

(assert (=> b!147161 m!227353))

(declare-fun m!227511 () Bool)

(assert (=> b!147161 m!227511))

(assert (=> d!47341 d!47560))

(declare-fun d!47562 () Bool)

(assert (=> d!47562 (isPrefixOf!0 lt!228275 (_2!6907 lt!228045))))

(declare-fun lt!228957 () Unit!9197)

(assert (=> d!47562 (= lt!228957 (choose!30 lt!228275 thiss!1634 (_2!6907 lt!228045)))))

(assert (=> d!47562 (isPrefixOf!0 lt!228275 thiss!1634)))

(assert (=> d!47562 (= (lemmaIsPrefixTransitive!0 lt!228275 thiss!1634 (_2!6907 lt!228045)) lt!228957)))

(declare-fun bs!11641 () Bool)

(assert (= bs!11641 d!47562))

(assert (=> bs!11641 m!226909))

(declare-fun m!227513 () Bool)

(assert (=> bs!11641 m!227513))

(declare-fun m!227515 () Bool)

(assert (=> bs!11641 m!227515))

(assert (=> d!47341 d!47562))

(declare-fun d!47564 () Bool)

(declare-fun res!123133 () Bool)

(declare-fun e!98116 () Bool)

(assert (=> d!47564 (=> (not res!123133) (not e!98116))))

(assert (=> d!47564 (= res!123133 (= (size!3006 (buf!3461 lt!228275)) (size!3006 (buf!3461 (_2!6907 lt!228045)))))))

(assert (=> d!47564 (= (isPrefixOf!0 lt!228275 (_2!6907 lt!228045)) e!98116)))

(declare-fun b!147162 () Bool)

(declare-fun res!123132 () Bool)

(assert (=> b!147162 (=> (not res!123132) (not e!98116))))

(assert (=> b!147162 (= res!123132 (bvsle (bitIndex!0 (size!3006 (buf!3461 lt!228275)) (currentByte!6363 lt!228275) (currentBit!6358 lt!228275)) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(declare-fun b!147163 () Bool)

(declare-fun e!98117 () Bool)

(assert (=> b!147163 (= e!98116 e!98117)))

(declare-fun res!123134 () Bool)

(assert (=> b!147163 (=> res!123134 e!98117)))

(assert (=> b!147163 (= res!123134 (= (size!3006 (buf!3461 lt!228275)) #b00000000000000000000000000000000))))

(declare-fun b!147164 () Bool)

(assert (=> b!147164 (= e!98117 (arrayBitRangesEq!0 (buf!3461 lt!228275) (buf!3461 (_2!6907 lt!228045)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 lt!228275)) (currentByte!6363 lt!228275) (currentBit!6358 lt!228275))))))

(assert (= (and d!47564 res!123133) b!147162))

(assert (= (and b!147162 res!123132) b!147163))

(assert (= (and b!147163 (not res!123134)) b!147164))

(declare-fun m!227517 () Bool)

(assert (=> b!147162 m!227517))

(assert (=> b!147162 m!226685))

(assert (=> b!147164 m!227517))

(assert (=> b!147164 m!227517))

(declare-fun m!227519 () Bool)

(assert (=> b!147164 m!227519))

(assert (=> d!47341 d!47564))

(declare-fun d!47566 () Bool)

(assert (=> d!47566 (isPrefixOf!0 lt!228275 (_2!6907 lt!228045))))

(declare-fun lt!228958 () Unit!9197)

(assert (=> d!47566 (= lt!228958 (choose!30 lt!228275 (_2!6907 lt!228045) (_2!6907 lt!228045)))))

(assert (=> d!47566 (isPrefixOf!0 lt!228275 (_2!6907 lt!228045))))

(assert (=> d!47566 (= (lemmaIsPrefixTransitive!0 lt!228275 (_2!6907 lt!228045) (_2!6907 lt!228045)) lt!228958)))

(declare-fun bs!11642 () Bool)

(assert (= bs!11642 d!47566))

(assert (=> bs!11642 m!226909))

(declare-fun m!227521 () Bool)

(assert (=> bs!11642 m!227521))

(assert (=> bs!11642 m!226909))

(assert (=> d!47341 d!47566))

(assert (=> d!47341 d!47293))

(declare-fun d!47568 () Bool)

(declare-fun res!123136 () Bool)

(declare-fun e!98118 () Bool)

(assert (=> d!47568 (=> (not res!123136) (not e!98118))))

(assert (=> d!47568 (= res!123136 (= (size!3006 (buf!3461 (_2!6907 lt!228045))) (size!3006 (buf!3461 (_2!6907 lt!228045)))))))

(assert (=> d!47568 (= (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 lt!228045)) e!98118)))

(declare-fun b!147165 () Bool)

(declare-fun res!123135 () Bool)

(assert (=> b!147165 (=> (not res!123135) (not e!98118))))

(assert (=> b!147165 (= res!123135 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(declare-fun b!147166 () Bool)

(declare-fun e!98119 () Bool)

(assert (=> b!147166 (= e!98118 e!98119)))

(declare-fun res!123137 () Bool)

(assert (=> b!147166 (=> res!123137 e!98119)))

(assert (=> b!147166 (= res!123137 (= (size!3006 (buf!3461 (_2!6907 lt!228045))) #b00000000000000000000000000000000))))

(declare-fun b!147167 () Bool)

(assert (=> b!147167 (= e!98119 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228045)) (buf!3461 (_2!6907 lt!228045)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(assert (= (and d!47568 res!123136) b!147165))

(assert (= (and b!147165 res!123135) b!147166))

(assert (= (and b!147166 (not res!123137)) b!147167))

(assert (=> b!147165 m!226685))

(assert (=> b!147165 m!226685))

(assert (=> b!147167 m!226685))

(assert (=> b!147167 m!226685))

(declare-fun m!227523 () Bool)

(assert (=> b!147167 m!227523))

(assert (=> d!47341 d!47568))

(declare-fun d!47570 () Bool)

(declare-fun res!123139 () Bool)

(declare-fun e!98120 () Bool)

(assert (=> d!47570 (=> (not res!123139) (not e!98120))))

(assert (=> d!47570 (= res!123139 (= (size!3006 (buf!3461 thiss!1634)) (size!3006 (buf!3461 thiss!1634))))))

(assert (=> d!47570 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!98120)))

(declare-fun b!147168 () Bool)

(declare-fun res!123138 () Bool)

(assert (=> b!147168 (=> (not res!123138) (not e!98120))))

(assert (=> b!147168 (= res!123138 (bvsle (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)) (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(declare-fun b!147169 () Bool)

(declare-fun e!98121 () Bool)

(assert (=> b!147169 (= e!98120 e!98121)))

(declare-fun res!123140 () Bool)

(assert (=> b!147169 (=> res!123140 e!98121)))

(assert (=> b!147169 (= res!123140 (= (size!3006 (buf!3461 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!147170 () Bool)

(assert (=> b!147170 (= e!98121 (arrayBitRangesEq!0 (buf!3461 thiss!1634) (buf!3461 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(assert (= (and d!47570 res!123139) b!147168))

(assert (= (and b!147168 res!123138) b!147169))

(assert (= (and b!147169 (not res!123140)) b!147170))

(assert (=> b!147168 m!226687))

(assert (=> b!147168 m!226687))

(assert (=> b!147170 m!226687))

(assert (=> b!147170 m!226687))

(declare-fun m!227525 () Bool)

(assert (=> b!147170 m!227525))

(assert (=> d!47341 d!47570))

(declare-fun d!47572 () Bool)

(declare-fun res!123142 () Bool)

(declare-fun e!98122 () Bool)

(assert (=> d!47572 (=> (not res!123142) (not e!98122))))

(assert (=> d!47572 (= res!123142 (= (size!3006 (buf!3461 lt!228275)) (size!3006 (buf!3461 lt!228275))))))

(assert (=> d!47572 (= (isPrefixOf!0 lt!228275 lt!228275) e!98122)))

(declare-fun b!147171 () Bool)

(declare-fun res!123141 () Bool)

(assert (=> b!147171 (=> (not res!123141) (not e!98122))))

(assert (=> b!147171 (= res!123141 (bvsle (bitIndex!0 (size!3006 (buf!3461 lt!228275)) (currentByte!6363 lt!228275) (currentBit!6358 lt!228275)) (bitIndex!0 (size!3006 (buf!3461 lt!228275)) (currentByte!6363 lt!228275) (currentBit!6358 lt!228275))))))

(declare-fun b!147172 () Bool)

(declare-fun e!98123 () Bool)

(assert (=> b!147172 (= e!98122 e!98123)))

(declare-fun res!123143 () Bool)

(assert (=> b!147172 (=> res!123143 e!98123)))

(assert (=> b!147172 (= res!123143 (= (size!3006 (buf!3461 lt!228275)) #b00000000000000000000000000000000))))

(declare-fun b!147173 () Bool)

(assert (=> b!147173 (= e!98123 (arrayBitRangesEq!0 (buf!3461 lt!228275) (buf!3461 lt!228275) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 lt!228275)) (currentByte!6363 lt!228275) (currentBit!6358 lt!228275))))))

(assert (= (and d!47572 res!123142) b!147171))

(assert (= (and b!147171 res!123141) b!147172))

(assert (= (and b!147172 (not res!123143)) b!147173))

(assert (=> b!147171 m!227517))

(assert (=> b!147171 m!227517))

(assert (=> b!147173 m!227517))

(assert (=> b!147173 m!227517))

(declare-fun m!227527 () Bool)

(assert (=> b!147173 m!227527))

(assert (=> d!47341 d!47572))

(declare-fun d!47574 () Bool)

(assert (=> d!47574 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!228959 () Unit!9197)

(assert (=> d!47574 (= lt!228959 (choose!11 thiss!1634))))

(assert (=> d!47574 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!228959)))

(declare-fun bs!11643 () Bool)

(assert (= bs!11643 d!47574))

(assert (=> bs!11643 m!226921))

(declare-fun m!227529 () Bool)

(assert (=> bs!11643 m!227529))

(assert (=> d!47341 d!47574))

(declare-fun d!47576 () Bool)

(assert (=> d!47576 (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 lt!228045))))

(declare-fun lt!228960 () Unit!9197)

(assert (=> d!47576 (= lt!228960 (choose!11 (_2!6907 lt!228045)))))

(assert (=> d!47576 (= (lemmaIsPrefixRefl!0 (_2!6907 lt!228045)) lt!228960)))

(declare-fun bs!11644 () Bool)

(assert (= bs!11644 d!47576))

(assert (=> bs!11644 m!226883))

(declare-fun m!227531 () Bool)

(assert (=> bs!11644 m!227531))

(assert (=> d!47341 d!47576))

(declare-fun d!47578 () Bool)

(declare-fun lt!228965 () (_ BitVec 8))

(declare-fun lt!228961 () (_ BitVec 8))

(assert (=> d!47578 (= lt!228965 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3760 (buf!3461 (_1!6909 lt!228034))) (currentByte!6363 (_1!6909 lt!228034)))) ((_ sign_extend 24) lt!228961))))))

(assert (=> d!47578 (= lt!228961 ((_ extract 7 0) (currentBit!6358 (_1!6909 lt!228034))))))

(declare-fun e!98124 () Bool)

(assert (=> d!47578 e!98124))

(declare-fun res!123145 () Bool)

(assert (=> d!47578 (=> (not res!123145) (not e!98124))))

(assert (=> d!47578 (= res!123145 (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6909 lt!228034)))) ((_ sign_extend 32) (currentByte!6363 (_1!6909 lt!228034))) ((_ sign_extend 32) (currentBit!6358 (_1!6909 lt!228034))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9226 () Unit!9197)

(declare-fun Unit!9227 () Unit!9197)

(assert (=> d!47578 (= (readByte!0 (_1!6909 lt!228034)) (tuple2!13117 (_2!6917 (ite (bvsgt ((_ sign_extend 24) lt!228961) #b00000000000000000000000000000000) (tuple2!13121 Unit!9226 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!228965) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3760 (buf!3461 (_1!6909 lt!228034))) (bvadd (currentByte!6363 (_1!6909 lt!228034)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!228961)))))))) (tuple2!13121 Unit!9227 lt!228965))) (BitStream!5271 (buf!3461 (_1!6909 lt!228034)) (bvadd (currentByte!6363 (_1!6909 lt!228034)) #b00000000000000000000000000000001) (currentBit!6358 (_1!6909 lt!228034)))))))

(declare-fun b!147174 () Bool)

(declare-fun e!98125 () Bool)

(assert (=> b!147174 (= e!98124 e!98125)))

(declare-fun res!123144 () Bool)

(assert (=> b!147174 (=> (not res!123144) (not e!98125))))

(declare-fun lt!228962 () tuple2!13116)

(assert (=> b!147174 (= res!123144 (= (buf!3461 (_2!6914 lt!228962)) (buf!3461 (_1!6909 lt!228034))))))

(declare-fun lt!228967 () (_ BitVec 8))

(declare-fun lt!228966 () (_ BitVec 8))

(declare-fun Unit!9228 () Unit!9197)

(declare-fun Unit!9229 () Unit!9197)

(assert (=> b!147174 (= lt!228962 (tuple2!13117 (_2!6917 (ite (bvsgt ((_ sign_extend 24) lt!228966) #b00000000000000000000000000000000) (tuple2!13121 Unit!9228 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!228967) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3760 (buf!3461 (_1!6909 lt!228034))) (bvadd (currentByte!6363 (_1!6909 lt!228034)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!228966)))))))) (tuple2!13121 Unit!9229 lt!228967))) (BitStream!5271 (buf!3461 (_1!6909 lt!228034)) (bvadd (currentByte!6363 (_1!6909 lt!228034)) #b00000000000000000000000000000001) (currentBit!6358 (_1!6909 lt!228034)))))))

(assert (=> b!147174 (= lt!228967 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3760 (buf!3461 (_1!6909 lt!228034))) (currentByte!6363 (_1!6909 lt!228034)))) ((_ sign_extend 24) lt!228966))))))

(assert (=> b!147174 (= lt!228966 ((_ extract 7 0) (currentBit!6358 (_1!6909 lt!228034))))))

(declare-fun b!147175 () Bool)

(declare-fun lt!228964 () (_ BitVec 64))

(declare-fun lt!228963 () (_ BitVec 64))

(assert (=> b!147175 (= e!98125 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!228962))) (currentByte!6363 (_2!6914 lt!228962)) (currentBit!6358 (_2!6914 lt!228962))) (bvadd lt!228964 lt!228963)))))

(assert (=> b!147175 (or (not (= (bvand lt!228964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228963 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228964 lt!228963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147175 (= lt!228963 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!147175 (= lt!228964 (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228034))) (currentByte!6363 (_1!6909 lt!228034)) (currentBit!6358 (_1!6909 lt!228034))))))

(assert (= (and d!47578 res!123145) b!147174))

(assert (= (and b!147174 res!123144) b!147175))

(declare-fun m!227533 () Bool)

(assert (=> d!47578 m!227533))

(declare-fun m!227535 () Bool)

(assert (=> d!47578 m!227535))

(declare-fun m!227537 () Bool)

(assert (=> d!47578 m!227537))

(assert (=> b!147174 m!227537))

(assert (=> b!147174 m!227533))

(declare-fun m!227539 () Bool)

(assert (=> b!147175 m!227539))

(declare-fun m!227541 () Bool)

(assert (=> b!147175 m!227541))

(assert (=> d!47425 d!47578))

(declare-fun d!47580 () Bool)

(declare-fun e!98128 () Bool)

(assert (=> d!47580 e!98128))

(declare-fun res!123148 () Bool)

(assert (=> d!47580 (=> (not res!123148) (not e!98128))))

(declare-fun lt!228972 () BitStream!5270)

(declare-fun lt!228973 () (_ BitVec 64))

(assert (=> d!47580 (= res!123148 (= (bvadd lt!228973 (bvsub lt!228516 lt!228513)) (bitIndex!0 (size!3006 (buf!3461 lt!228972)) (currentByte!6363 lt!228972) (currentBit!6358 lt!228972))))))

(assert (=> d!47580 (or (not (= (bvand lt!228973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228516 lt!228513) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228973 (bvsub lt!228516 lt!228513)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47580 (= lt!228973 (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228507))) (currentByte!6363 (_2!6909 lt!228507)) (currentBit!6358 (_2!6909 lt!228507))))))

(declare-fun moveBitIndex!0 (BitStream!5270 (_ BitVec 64)) tuple2!13106)

(assert (=> d!47580 (= lt!228972 (_2!6907 (moveBitIndex!0 (_2!6909 lt!228507) (bvsub lt!228516 lt!228513))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5270 (_ BitVec 64)) Bool)

(assert (=> d!47580 (moveBitIndexPrecond!0 (_2!6909 lt!228507) (bvsub lt!228516 lt!228513))))

(assert (=> d!47580 (= (withMovedBitIndex!0 (_2!6909 lt!228507) (bvsub lt!228516 lt!228513)) lt!228972)))

(declare-fun b!147178 () Bool)

(assert (=> b!147178 (= e!98128 (= (size!3006 (buf!3461 (_2!6909 lt!228507))) (size!3006 (buf!3461 lt!228972))))))

(assert (= (and d!47580 res!123148) b!147178))

(declare-fun m!227543 () Bool)

(assert (=> d!47580 m!227543))

(declare-fun m!227545 () Bool)

(assert (=> d!47580 m!227545))

(declare-fun m!227547 () Bool)

(assert (=> d!47580 m!227547))

(declare-fun m!227549 () Bool)

(assert (=> d!47580 m!227549))

(assert (=> b!146982 d!47580))

(assert (=> b!146982 d!47295))

(assert (=> b!146982 d!47325))

(declare-fun lt!228974 () tuple3!572)

(declare-fun d!47582 () Bool)

(assert (=> d!47582 (= lt!228974 (readByteArrayLoop!0 (_1!6909 lt!228467) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47582 (= (readByteArrayLoopPure!0 (_1!6909 lt!228467) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13113 (_2!6913 lt!228974) (_3!355 lt!228974)))))

(declare-fun bs!11645 () Bool)

(assert (= bs!11645 d!47582))

(declare-fun m!227551 () Bool)

(assert (=> bs!11645 m!227551))

(assert (=> b!146971 d!47582))

(declare-fun d!47584 () Bool)

(assert (=> d!47584 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228469)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228463) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228469)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045)))) lt!228463))))

(declare-fun bs!11646 () Bool)

(assert (= bs!11646 d!47584))

(declare-fun m!227553 () Bool)

(assert (=> bs!11646 m!227553))

(assert (=> b!146971 d!47584))

(declare-fun d!47586 () Bool)

(assert (=> d!47586 (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228469)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228463)))

(declare-fun lt!228975 () Unit!9197)

(assert (=> d!47586 (= lt!228975 (choose!9 (_2!6907 lt!228045) (buf!3461 (_2!6907 lt!228469)) lt!228463 (BitStream!5271 (buf!3461 (_2!6907 lt!228469)) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(assert (=> d!47586 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6907 lt!228045) (buf!3461 (_2!6907 lt!228469)) lt!228463) lt!228975)))

(declare-fun bs!11647 () Bool)

(assert (= bs!11647 d!47586))

(assert (=> bs!11647 m!227081))

(declare-fun m!227555 () Bool)

(assert (=> bs!11647 m!227555))

(assert (=> b!146971 d!47586))

(declare-fun b!147179 () Bool)

(declare-fun res!123149 () Bool)

(declare-fun e!98130 () Bool)

(assert (=> b!147179 (=> (not res!123149) (not e!98130))))

(declare-fun lt!228986 () tuple2!13110)

(assert (=> b!147179 (= res!123149 (isPrefixOf!0 (_2!6909 lt!228986) (_2!6907 lt!228469)))))

(declare-fun b!147180 () Bool)

(declare-fun e!98129 () Unit!9197)

(declare-fun lt!228991 () Unit!9197)

(assert (=> b!147180 (= e!98129 lt!228991)))

(declare-fun lt!228994 () (_ BitVec 64))

(assert (=> b!147180 (= lt!228994 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!228978 () (_ BitVec 64))

(assert (=> b!147180 (= lt!228978 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))))))

(assert (=> b!147180 (= lt!228991 (arrayBitRangesEqSymmetric!0 (buf!3461 (_2!6907 lt!228045)) (buf!3461 (_2!6907 lt!228469)) lt!228994 lt!228978))))

(assert (=> b!147180 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228469)) (buf!3461 (_2!6907 lt!228045)) lt!228994 lt!228978)))

(declare-fun b!147181 () Bool)

(declare-fun Unit!9230 () Unit!9197)

(assert (=> b!147181 (= e!98129 Unit!9230)))

(declare-fun b!147182 () Bool)

(declare-fun lt!228992 () (_ BitVec 64))

(declare-fun lt!228995 () (_ BitVec 64))

(assert (=> b!147182 (= e!98130 (= (_1!6909 lt!228986) (withMovedBitIndex!0 (_2!6909 lt!228986) (bvsub lt!228995 lt!228992))))))

(assert (=> b!147182 (or (= (bvand lt!228995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228992 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228995 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228995 lt!228992) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147182 (= lt!228992 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228469))) (currentByte!6363 (_2!6907 lt!228469)) (currentBit!6358 (_2!6907 lt!228469))))))

(assert (=> b!147182 (= lt!228995 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))))))

(declare-fun b!147183 () Bool)

(declare-fun res!123151 () Bool)

(assert (=> b!147183 (=> (not res!123151) (not e!98130))))

(assert (=> b!147183 (= res!123151 (isPrefixOf!0 (_1!6909 lt!228986) (_2!6907 lt!228045)))))

(declare-fun d!47588 () Bool)

(assert (=> d!47588 e!98130))

(declare-fun res!123150 () Bool)

(assert (=> d!47588 (=> (not res!123150) (not e!98130))))

(assert (=> d!47588 (= res!123150 (isPrefixOf!0 (_1!6909 lt!228986) (_2!6909 lt!228986)))))

(declare-fun lt!228977 () BitStream!5270)

(assert (=> d!47588 (= lt!228986 (tuple2!13111 lt!228977 (_2!6907 lt!228469)))))

(declare-fun lt!228984 () Unit!9197)

(declare-fun lt!228990 () Unit!9197)

(assert (=> d!47588 (= lt!228984 lt!228990)))

(assert (=> d!47588 (isPrefixOf!0 lt!228977 (_2!6907 lt!228469))))

(assert (=> d!47588 (= lt!228990 (lemmaIsPrefixTransitive!0 lt!228977 (_2!6907 lt!228469) (_2!6907 lt!228469)))))

(declare-fun lt!228988 () Unit!9197)

(declare-fun lt!228980 () Unit!9197)

(assert (=> d!47588 (= lt!228988 lt!228980)))

(assert (=> d!47588 (isPrefixOf!0 lt!228977 (_2!6907 lt!228469))))

(assert (=> d!47588 (= lt!228980 (lemmaIsPrefixTransitive!0 lt!228977 (_2!6907 lt!228045) (_2!6907 lt!228469)))))

(declare-fun lt!228979 () Unit!9197)

(assert (=> d!47588 (= lt!228979 e!98129)))

(declare-fun c!7970 () Bool)

(assert (=> d!47588 (= c!7970 (not (= (size!3006 (buf!3461 (_2!6907 lt!228045))) #b00000000000000000000000000000000)))))

(declare-fun lt!228983 () Unit!9197)

(declare-fun lt!228985 () Unit!9197)

(assert (=> d!47588 (= lt!228983 lt!228985)))

(assert (=> d!47588 (isPrefixOf!0 (_2!6907 lt!228469) (_2!6907 lt!228469))))

(assert (=> d!47588 (= lt!228985 (lemmaIsPrefixRefl!0 (_2!6907 lt!228469)))))

(declare-fun lt!228993 () Unit!9197)

(declare-fun lt!228989 () Unit!9197)

(assert (=> d!47588 (= lt!228993 lt!228989)))

(assert (=> d!47588 (= lt!228989 (lemmaIsPrefixRefl!0 (_2!6907 lt!228469)))))

(declare-fun lt!228976 () Unit!9197)

(declare-fun lt!228982 () Unit!9197)

(assert (=> d!47588 (= lt!228976 lt!228982)))

(assert (=> d!47588 (isPrefixOf!0 lt!228977 lt!228977)))

(assert (=> d!47588 (= lt!228982 (lemmaIsPrefixRefl!0 lt!228977))))

(declare-fun lt!228981 () Unit!9197)

(declare-fun lt!228987 () Unit!9197)

(assert (=> d!47588 (= lt!228981 lt!228987)))

(assert (=> d!47588 (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 lt!228045))))

(assert (=> d!47588 (= lt!228987 (lemmaIsPrefixRefl!0 (_2!6907 lt!228045)))))

(assert (=> d!47588 (= lt!228977 (BitStream!5271 (buf!3461 (_2!6907 lt!228469)) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))))))

(assert (=> d!47588 (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 lt!228469))))

(assert (=> d!47588 (= (reader!0 (_2!6907 lt!228045) (_2!6907 lt!228469)) lt!228986)))

(assert (= (and d!47588 c!7970) b!147180))

(assert (= (and d!47588 (not c!7970)) b!147181))

(assert (= (and d!47588 res!123150) b!147183))

(assert (= (and b!147183 res!123151) b!147179))

(assert (= (and b!147179 res!123149) b!147182))

(assert (=> b!147180 m!226685))

(declare-fun m!227557 () Bool)

(assert (=> b!147180 m!227557))

(declare-fun m!227559 () Bool)

(assert (=> b!147180 m!227559))

(declare-fun m!227561 () Bool)

(assert (=> b!147179 m!227561))

(declare-fun m!227563 () Bool)

(assert (=> b!147182 m!227563))

(assert (=> b!147182 m!227087))

(assert (=> b!147182 m!226685))

(declare-fun m!227565 () Bool)

(assert (=> d!47588 m!227565))

(declare-fun m!227567 () Bool)

(assert (=> d!47588 m!227567))

(assert (=> d!47588 m!226871))

(declare-fun m!227569 () Bool)

(assert (=> d!47588 m!227569))

(declare-fun m!227571 () Bool)

(assert (=> d!47588 m!227571))

(declare-fun m!227573 () Bool)

(assert (=> d!47588 m!227573))

(declare-fun m!227575 () Bool)

(assert (=> d!47588 m!227575))

(declare-fun m!227577 () Bool)

(assert (=> d!47588 m!227577))

(assert (=> d!47588 m!227071))

(assert (=> d!47588 m!226883))

(declare-fun m!227579 () Bool)

(assert (=> d!47588 m!227579))

(declare-fun m!227581 () Bool)

(assert (=> b!147183 m!227581))

(assert (=> b!146971 d!47588))

(assert (=> d!47331 d!47291))

(declare-fun lt!229030 () tuple3!572)

(declare-fun c!7971 () Bool)

(declare-fun call!1963 () Bool)

(declare-fun bm!1959 () Bool)

(assert (=> bm!1959 (= call!1963 (arrayRangesEq!322 lt!228053 (ite c!7971 (_3!355 lt!229030) lt!228053) #b00000000000000000000000000000000 (ite c!7971 (bvadd #b00000000000000000000000000000001 from!447) (size!3006 lt!228053))))))

(declare-fun b!147184 () Bool)

(declare-fun res!123152 () Bool)

(declare-fun e!98133 () Bool)

(assert (=> b!147184 (=> (not res!123152) (not e!98133))))

(declare-fun lt!229009 () tuple3!572)

(assert (=> b!147184 (= res!123152 (and (= (buf!3461 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001)) (buf!3461 (_2!6913 lt!229009))) (= (size!3006 lt!228053) (size!3006 (_3!355 lt!229009)))))))

(declare-fun b!147185 () Bool)

(declare-fun e!98132 () tuple3!572)

(declare-fun lt!229016 () Unit!9197)

(assert (=> b!147185 (= e!98132 (tuple3!573 lt!229016 (_2!6913 lt!229030) (_3!355 lt!229030)))))

(declare-fun lt!229013 () tuple2!13116)

(assert (=> b!147185 (= lt!229013 (readByte!0 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001)))))

(declare-fun lt!229001 () array!6642)

(assert (=> b!147185 (= lt!229001 (array!6643 (store (arr!3760 lt!228053) (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!229013)) (size!3006 lt!228053)))))

(declare-fun lt!229004 () (_ BitVec 64))

(assert (=> b!147185 (= lt!229004 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!229005 () (_ BitVec 32))

(assert (=> b!147185 (= lt!229005 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!229006 () Unit!9197)

(assert (=> b!147185 (= lt!229006 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001) (_2!6914 lt!229013) lt!229004 lt!229005))))

(assert (=> b!147185 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6914 lt!229013)))) ((_ sign_extend 32) (currentByte!6363 (_2!6914 lt!229013))) ((_ sign_extend 32) (currentBit!6358 (_2!6914 lt!229013))) (bvsub lt!229005 ((_ extract 31 0) (bvsdiv (bvadd lt!229004 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!229025 () Unit!9197)

(assert (=> b!147185 (= lt!229025 lt!229006)))

(assert (=> b!147185 (= lt!229030 (readByteArrayLoop!0 (_2!6914 lt!229013) lt!229001 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!147185 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!229013))) (currentByte!6363 (_2!6914 lt!229013)) (currentBit!6358 (_2!6914 lt!229013))) (bvadd (bitIndex!0 (size!3006 (buf!3461 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001))) (currentByte!6363 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001)) (currentBit!6358 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!229017 () Unit!9197)

(declare-fun Unit!9231 () Unit!9197)

(assert (=> b!147185 (= lt!229017 Unit!9231)))

(declare-fun call!1964 () (_ BitVec 64))

(assert (=> b!147185 (= (bvadd (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!229013))) (currentByte!6363 (_2!6914 lt!229013)) (currentBit!6358 (_2!6914 lt!229013))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1964)))

(declare-fun lt!229028 () Unit!9197)

(declare-fun Unit!9232 () Unit!9197)

(assert (=> b!147185 (= lt!229028 Unit!9232)))

(assert (=> b!147185 (= (bvadd (bitIndex!0 (size!3006 (buf!3461 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001))) (currentByte!6363 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001)) (currentBit!6358 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1964)))

(declare-fun lt!229007 () Unit!9197)

(declare-fun Unit!9233 () Unit!9197)

(assert (=> b!147185 (= lt!229007 Unit!9233)))

(assert (=> b!147185 (and (= (buf!3461 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001)) (buf!3461 (_2!6913 lt!229030))) (= (size!3006 lt!228053) (size!3006 (_3!355 lt!229030))))))

(declare-fun lt!229008 () Unit!9197)

(declare-fun Unit!9234 () Unit!9197)

(assert (=> b!147185 (= lt!229008 Unit!9234)))

(declare-fun lt!229002 () Unit!9197)

(assert (=> b!147185 (= lt!229002 (arrayUpdatedAtPrefixLemma!12 lt!228053 (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!229013)))))

(declare-fun call!1962 () Bool)

(assert (=> b!147185 call!1962))

(declare-fun lt!229011 () Unit!9197)

(assert (=> b!147185 (= lt!229011 lt!229002)))

(declare-fun lt!229031 () (_ BitVec 32))

(assert (=> b!147185 (= lt!229031 #b00000000000000000000000000000000)))

(declare-fun lt!229024 () Unit!9197)

(assert (=> b!147185 (= lt!229024 (arrayRangesEqTransitive!52 lt!228053 lt!229001 (_3!355 lt!229030) lt!229031 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147185 (arrayRangesEq!322 lt!228053 (_3!355 lt!229030) lt!229031 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!229014 () Unit!9197)

(assert (=> b!147185 (= lt!229014 lt!229024)))

(assert (=> b!147185 call!1963))

(declare-fun lt!229029 () Unit!9197)

(declare-fun Unit!9235 () Unit!9197)

(assert (=> b!147185 (= lt!229029 Unit!9235)))

(declare-fun lt!229003 () Unit!9197)

(assert (=> b!147185 (= lt!229003 (arrayRangesEqImpliesEq!12 lt!229001 (_3!355 lt!229030) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147185 (= (select (store (arr!3760 lt!228053) (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!229013)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3760 (_3!355 lt!229030)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!229027 () Unit!9197)

(assert (=> b!147185 (= lt!229027 lt!229003)))

(declare-fun lt!229018 () Bool)

(assert (=> b!147185 (= lt!229018 (= (select (arr!3760 (_3!355 lt!229030)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6914 lt!229013)))))

(declare-fun Unit!9236 () Unit!9197)

(assert (=> b!147185 (= lt!229016 Unit!9236)))

(assert (=> b!147185 lt!229018))

(declare-fun b!147186 () Bool)

(declare-fun lt!229026 () Unit!9197)

(assert (=> b!147186 (= e!98132 (tuple3!573 lt!229026 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001) lt!228053))))

(assert (=> b!147186 (= call!1964 call!1964)))

(declare-fun lt!229010 () Unit!9197)

(declare-fun Unit!9237 () Unit!9197)

(assert (=> b!147186 (= lt!229010 Unit!9237)))

(declare-fun lt!229023 () Unit!9197)

(assert (=> b!147186 (= lt!229023 (arrayRangesEqReflexiveLemma!12 lt!228053))))

(assert (=> b!147186 call!1963))

(declare-fun lt!229022 () Unit!9197)

(assert (=> b!147186 (= lt!229022 lt!229023)))

(declare-fun lt!229020 () array!6642)

(assert (=> b!147186 (= lt!229020 lt!228053)))

(declare-fun lt!228997 () array!6642)

(assert (=> b!147186 (= lt!228997 lt!228053)))

(declare-fun lt!229015 () (_ BitVec 32))

(assert (=> b!147186 (= lt!229015 #b00000000000000000000000000000000)))

(declare-fun lt!228998 () (_ BitVec 32))

(assert (=> b!147186 (= lt!228998 (size!3006 lt!228053))))

(declare-fun lt!229021 () (_ BitVec 32))

(assert (=> b!147186 (= lt!229021 #b00000000000000000000000000000000)))

(declare-fun lt!229019 () (_ BitVec 32))

(assert (=> b!147186 (= lt!229019 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!147186 (= lt!229026 (arrayRangesEqSlicedLemma!12 lt!229020 lt!228997 lt!229015 lt!228998 lt!229021 lt!229019))))

(assert (=> b!147186 call!1962))

(declare-fun e!98131 () Bool)

(declare-fun b!147187 () Bool)

(assert (=> b!147187 (= e!98131 (= (select (arr!3760 (_3!355 lt!229009)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6908 (readBytePure!0 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001)))))))

(assert (=> b!147187 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!3006 (_3!355 lt!229009))))))

(declare-fun b!147188 () Bool)

(assert (=> b!147188 (= e!98133 (arrayRangesEq!322 lt!228053 (_3!355 lt!229009) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun bm!1960 () Bool)

(assert (=> bm!1960 (= call!1964 (bitIndex!0 (ite c!7971 (size!3006 (buf!3461 (_2!6913 lt!229030))) (size!3006 (buf!3461 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001)))) (ite c!7971 (currentByte!6363 (_2!6913 lt!229030)) (currentByte!6363 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001))) (ite c!7971 (currentBit!6358 (_2!6913 lt!229030)) (currentBit!6358 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001)))))))

(declare-fun bm!1961 () Bool)

(assert (=> bm!1961 (= call!1962 (arrayRangesEq!322 (ite c!7971 lt!228053 lt!229020) (ite c!7971 (array!6643 (store (arr!3760 lt!228053) (bvadd #b00000000000000000000000000000001 from!447) (_1!6914 lt!229013)) (size!3006 lt!228053)) lt!228997) (ite c!7971 #b00000000000000000000000000000000 lt!229021) (ite c!7971 (bvadd #b00000000000000000000000000000001 from!447) lt!229019)))))

(declare-fun d!47590 () Bool)

(assert (=> d!47590 e!98131))

(declare-fun res!123154 () Bool)

(assert (=> d!47590 (=> res!123154 e!98131)))

(assert (=> d!47590 (= res!123154 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229000 () Bool)

(assert (=> d!47590 (= lt!229000 e!98133)))

(declare-fun res!123153 () Bool)

(assert (=> d!47590 (=> (not res!123153) (not e!98133))))

(declare-fun lt!229012 () (_ BitVec 64))

(declare-fun lt!228996 () (_ BitVec 64))

(assert (=> d!47590 (= res!123153 (= (bvadd lt!228996 lt!229012) (bitIndex!0 (size!3006 (buf!3461 (_2!6913 lt!229009))) (currentByte!6363 (_2!6913 lt!229009)) (currentBit!6358 (_2!6913 lt!229009)))))))

(assert (=> d!47590 (or (not (= (bvand lt!228996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229012 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228996 lt!229012) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!228999 () (_ BitVec 64))

(assert (=> d!47590 (= lt!229012 (bvmul lt!228999 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47590 (or (= lt!228999 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228999 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228999)))))

(assert (=> d!47590 (= lt!228999 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!47590 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!47590 (= lt!228996 (bitIndex!0 (size!3006 (buf!3461 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001))) (currentByte!6363 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001)) (currentBit!6358 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001))))))

(assert (=> d!47590 (= lt!229009 e!98132)))

(assert (=> d!47590 (= c!7971 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47590 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3006 lt!228053)))))

(assert (=> d!47590 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001) lt!228053 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!229009)))

(assert (= (and d!47590 c!7971) b!147185))

(assert (= (and d!47590 (not c!7971)) b!147186))

(assert (= (or b!147185 b!147186) bm!1961))

(assert (= (or b!147185 b!147186) bm!1959))

(assert (= (or b!147185 b!147186) bm!1960))

(assert (= (and d!47590 res!123153) b!147184))

(assert (= (and b!147184 res!123152) b!147188))

(assert (= (and d!47590 (not res!123154)) b!147187))

(declare-fun m!227583 () Bool)

(assert (=> bm!1961 m!227583))

(declare-fun m!227585 () Bool)

(assert (=> bm!1961 m!227585))

(declare-fun m!227587 () Bool)

(assert (=> bm!1960 m!227587))

(declare-fun m!227589 () Bool)

(assert (=> b!147187 m!227589))

(assert (=> b!147187 m!226719))

(declare-fun m!227591 () Bool)

(assert (=> b!147187 m!227591))

(declare-fun m!227593 () Bool)

(assert (=> d!47590 m!227593))

(declare-fun m!227595 () Bool)

(assert (=> d!47590 m!227595))

(declare-fun m!227597 () Bool)

(assert (=> bm!1959 m!227597))

(declare-fun m!227599 () Bool)

(assert (=> b!147188 m!227599))

(assert (=> b!147185 m!226719))

(declare-fun m!227601 () Bool)

(assert (=> b!147185 m!227601))

(declare-fun m!227603 () Bool)

(assert (=> b!147185 m!227603))

(declare-fun m!227605 () Bool)

(assert (=> b!147185 m!227605))

(assert (=> b!147185 m!227595))

(assert (=> b!147185 m!226719))

(declare-fun m!227607 () Bool)

(assert (=> b!147185 m!227607))

(declare-fun m!227609 () Bool)

(assert (=> b!147185 m!227609))

(declare-fun m!227611 () Bool)

(assert (=> b!147185 m!227611))

(declare-fun m!227613 () Bool)

(assert (=> b!147185 m!227613))

(declare-fun m!227615 () Bool)

(assert (=> b!147185 m!227615))

(declare-fun m!227617 () Bool)

(assert (=> b!147185 m!227617))

(declare-fun m!227619 () Bool)

(assert (=> b!147185 m!227619))

(declare-fun m!227621 () Bool)

(assert (=> b!147185 m!227621))

(assert (=> b!147185 m!227583))

(assert (=> b!147186 m!227455))

(declare-fun m!227623 () Bool)

(assert (=> b!147186 m!227623))

(assert (=> d!47421 d!47590))

(assert (=> b!146829 d!47325))

(assert (=> b!146829 d!47301))

(declare-fun d!47592 () Bool)

(declare-fun res!123156 () Bool)

(declare-fun e!98134 () Bool)

(assert (=> d!47592 (=> (not res!123156) (not e!98134))))

(assert (=> d!47592 (= res!123156 (= (size!3006 (buf!3461 (_1!6909 lt!228255))) (size!3006 (buf!3461 (_2!6907 lt!228045)))))))

(assert (=> d!47592 (= (isPrefixOf!0 (_1!6909 lt!228255) (_2!6907 lt!228045)) e!98134)))

(declare-fun b!147189 () Bool)

(declare-fun res!123155 () Bool)

(assert (=> b!147189 (=> (not res!123155) (not e!98134))))

(assert (=> b!147189 (= res!123155 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228255))) (currentByte!6363 (_1!6909 lt!228255)) (currentBit!6358 (_1!6909 lt!228255))) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(declare-fun b!147190 () Bool)

(declare-fun e!98135 () Bool)

(assert (=> b!147190 (= e!98134 e!98135)))

(declare-fun res!123157 () Bool)

(assert (=> b!147190 (=> res!123157 e!98135)))

(assert (=> b!147190 (= res!123157 (= (size!3006 (buf!3461 (_1!6909 lt!228255))) #b00000000000000000000000000000000))))

(declare-fun b!147191 () Bool)

(assert (=> b!147191 (= e!98135 (arrayBitRangesEq!0 (buf!3461 (_1!6909 lt!228255)) (buf!3461 (_2!6907 lt!228045)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228255))) (currentByte!6363 (_1!6909 lt!228255)) (currentBit!6358 (_1!6909 lt!228255)))))))

(assert (= (and d!47592 res!123156) b!147189))

(assert (= (and b!147189 res!123155) b!147190))

(assert (= (and b!147190 (not res!123157)) b!147191))

(declare-fun m!227625 () Bool)

(assert (=> b!147189 m!227625))

(assert (=> b!147189 m!226685))

(assert (=> b!147191 m!227625))

(assert (=> b!147191 m!227625))

(declare-fun m!227627 () Bool)

(assert (=> b!147191 m!227627))

(assert (=> b!146881 d!47592))

(assert (=> b!146980 d!47325))

(declare-fun d!47594 () Bool)

(assert (=> d!47594 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228035)) (buf!3461 thiss!1634) lt!228515 lt!228499)))

(declare-fun lt!229034 () Unit!9197)

(declare-fun choose!8 (array!6642 array!6642 (_ BitVec 64) (_ BitVec 64)) Unit!9197)

(assert (=> d!47594 (= lt!229034 (choose!8 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228035)) lt!228515 lt!228499))))

(assert (=> d!47594 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228515) (bvsle lt!228515 lt!228499))))

(assert (=> d!47594 (= (arrayBitRangesEqSymmetric!0 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228035)) lt!228515 lt!228499) lt!229034)))

(declare-fun bs!11648 () Bool)

(assert (= bs!11648 d!47594))

(assert (=> bs!11648 m!227119))

(declare-fun m!227629 () Bool)

(assert (=> bs!11648 m!227629))

(assert (=> b!146980 d!47594))

(declare-fun b!147192 () Bool)

(declare-fun lt!229036 () tuple4!138)

(declare-fun e!98141 () Bool)

(assert (=> b!147192 (= e!98141 (arrayRangesEq!322 (buf!3461 (_2!6907 lt!228035)) (buf!3461 thiss!1634) (_1!6918 lt!229036) (_2!6918 lt!229036)))))

(declare-fun d!47596 () Bool)

(declare-fun res!123160 () Bool)

(declare-fun e!98140 () Bool)

(assert (=> d!47596 (=> res!123160 e!98140)))

(assert (=> d!47596 (= res!123160 (bvsge lt!228515 lt!228499))))

(assert (=> d!47596 (= (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228035)) (buf!3461 thiss!1634) lt!228515 lt!228499) e!98140)))

(declare-fun b!147193 () Bool)

(declare-fun res!123162 () Bool)

(declare-fun lt!229035 () (_ BitVec 32))

(assert (=> b!147193 (= res!123162 (= lt!229035 #b00000000000000000000000000000000))))

(declare-fun e!98139 () Bool)

(assert (=> b!147193 (=> res!123162 e!98139)))

(declare-fun e!98137 () Bool)

(assert (=> b!147193 (= e!98137 e!98139)))

(declare-fun b!147194 () Bool)

(declare-fun e!98136 () Bool)

(assert (=> b!147194 (= e!98140 e!98136)))

(declare-fun res!123161 () Bool)

(assert (=> b!147194 (=> (not res!123161) (not e!98136))))

(assert (=> b!147194 (= res!123161 e!98141)))

(declare-fun res!123159 () Bool)

(assert (=> b!147194 (=> res!123159 e!98141)))

(assert (=> b!147194 (= res!123159 (bvsge (_1!6918 lt!229036) (_2!6918 lt!229036)))))

(assert (=> b!147194 (= lt!229035 ((_ extract 31 0) (bvsrem lt!228499 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!229037 () (_ BitVec 32))

(assert (=> b!147194 (= lt!229037 ((_ extract 31 0) (bvsrem lt!228515 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147194 (= lt!229036 (arrayBitIndices!0 lt!228515 lt!228499))))

(declare-fun b!147195 () Bool)

(declare-fun e!98138 () Bool)

(assert (=> b!147195 (= e!98138 e!98137)))

(declare-fun res!123158 () Bool)

(assert (=> b!147195 (= res!123158 (byteRangesEq!0 (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_3!357 lt!229036)) (select (arr!3760 (buf!3461 thiss!1634)) (_3!357 lt!229036)) lt!229037 #b00000000000000000000000000001000))))

(assert (=> b!147195 (=> (not res!123158) (not e!98137))))

(declare-fun b!147196 () Bool)

(assert (=> b!147196 (= e!98136 e!98138)))

(declare-fun c!7972 () Bool)

(assert (=> b!147196 (= c!7972 (= (_3!357 lt!229036) (_4!69 lt!229036)))))

(declare-fun b!147197 () Bool)

(declare-fun call!1965 () Bool)

(assert (=> b!147197 (= e!98138 call!1965)))

(declare-fun b!147198 () Bool)

(assert (=> b!147198 (= e!98139 call!1965)))

(declare-fun bm!1962 () Bool)

(assert (=> bm!1962 (= call!1965 (byteRangesEq!0 (ite c!7972 (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_3!357 lt!229036)) (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_4!69 lt!229036))) (ite c!7972 (select (arr!3760 (buf!3461 thiss!1634)) (_3!357 lt!229036)) (select (arr!3760 (buf!3461 thiss!1634)) (_4!69 lt!229036))) (ite c!7972 lt!229037 #b00000000000000000000000000000000) lt!229035))))

(assert (= (and d!47596 (not res!123160)) b!147194))

(assert (= (and b!147194 (not res!123159)) b!147192))

(assert (= (and b!147194 res!123161) b!147196))

(assert (= (and b!147196 c!7972) b!147197))

(assert (= (and b!147196 (not c!7972)) b!147195))

(assert (= (and b!147195 res!123158) b!147193))

(assert (= (and b!147193 (not res!123162)) b!147198))

(assert (= (or b!147197 b!147198) bm!1962))

(declare-fun m!227631 () Bool)

(assert (=> b!147192 m!227631))

(declare-fun m!227633 () Bool)

(assert (=> b!147194 m!227633))

(declare-fun m!227635 () Bool)

(assert (=> b!147195 m!227635))

(declare-fun m!227637 () Bool)

(assert (=> b!147195 m!227637))

(assert (=> b!147195 m!227635))

(assert (=> b!147195 m!227637))

(declare-fun m!227639 () Bool)

(assert (=> b!147195 m!227639))

(assert (=> bm!1962 m!227637))

(declare-fun m!227641 () Bool)

(assert (=> bm!1962 m!227641))

(assert (=> bm!1962 m!227635))

(declare-fun m!227643 () Bool)

(assert (=> bm!1962 m!227643))

(declare-fun m!227645 () Bool)

(assert (=> bm!1962 m!227645))

(assert (=> b!146980 d!47596))

(declare-fun bm!1963 () Bool)

(declare-fun c!7973 () Bool)

(declare-fun call!1967 () Bool)

(declare-fun lt!229072 () tuple3!572)

(assert (=> bm!1963 (= call!1967 (arrayRangesEq!322 arr!237 (ite c!7973 (_3!355 lt!229072) arr!237) #b00000000000000000000000000000000 (ite c!7973 from!447 (size!3006 arr!237))))))

(declare-fun b!147199 () Bool)

(declare-fun res!123163 () Bool)

(declare-fun e!98144 () Bool)

(assert (=> b!147199 (=> (not res!123163) (not e!98144))))

(declare-fun lt!229051 () tuple3!572)

(assert (=> b!147199 (= res!123163 (and (= (buf!3461 (_1!6909 lt!228034)) (buf!3461 (_2!6913 lt!229051))) (= (size!3006 arr!237) (size!3006 (_3!355 lt!229051)))))))

(declare-fun b!147200 () Bool)

(declare-fun e!98143 () tuple3!572)

(declare-fun lt!229058 () Unit!9197)

(assert (=> b!147200 (= e!98143 (tuple3!573 lt!229058 (_2!6913 lt!229072) (_3!355 lt!229072)))))

(declare-fun lt!229055 () tuple2!13116)

(assert (=> b!147200 (= lt!229055 (readByte!0 (_1!6909 lt!228034)))))

(declare-fun lt!229043 () array!6642)

(assert (=> b!147200 (= lt!229043 (array!6643 (store (arr!3760 arr!237) from!447 (_1!6914 lt!229055)) (size!3006 arr!237)))))

(declare-fun lt!229046 () (_ BitVec 64))

(assert (=> b!147200 (= lt!229046 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!229047 () (_ BitVec 32))

(assert (=> b!147200 (= lt!229047 (bvsub to!404 from!447))))

(declare-fun lt!229048 () Unit!9197)

(assert (=> b!147200 (= lt!229048 (validateOffsetBytesFromBitIndexLemma!0 (_1!6909 lt!228034) (_2!6914 lt!229055) lt!229046 lt!229047))))

(assert (=> b!147200 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6914 lt!229055)))) ((_ sign_extend 32) (currentByte!6363 (_2!6914 lt!229055))) ((_ sign_extend 32) (currentBit!6358 (_2!6914 lt!229055))) (bvsub lt!229047 ((_ extract 31 0) (bvsdiv (bvadd lt!229046 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!229067 () Unit!9197)

(assert (=> b!147200 (= lt!229067 lt!229048)))

(assert (=> b!147200 (= lt!229072 (readByteArrayLoop!0 (_2!6914 lt!229055) lt!229043 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!147200 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!229055))) (currentByte!6363 (_2!6914 lt!229055)) (currentBit!6358 (_2!6914 lt!229055))) (bvadd (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228034))) (currentByte!6363 (_1!6909 lt!228034)) (currentBit!6358 (_1!6909 lt!228034))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!229059 () Unit!9197)

(declare-fun Unit!9238 () Unit!9197)

(assert (=> b!147200 (= lt!229059 Unit!9238)))

(declare-fun call!1968 () (_ BitVec 64))

(assert (=> b!147200 (= (bvadd (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!229055))) (currentByte!6363 (_2!6914 lt!229055)) (currentBit!6358 (_2!6914 lt!229055))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1968)))

(declare-fun lt!229070 () Unit!9197)

(declare-fun Unit!9239 () Unit!9197)

(assert (=> b!147200 (= lt!229070 Unit!9239)))

(assert (=> b!147200 (= (bvadd (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228034))) (currentByte!6363 (_1!6909 lt!228034)) (currentBit!6358 (_1!6909 lt!228034))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) call!1968)))

(declare-fun lt!229049 () Unit!9197)

(declare-fun Unit!9240 () Unit!9197)

(assert (=> b!147200 (= lt!229049 Unit!9240)))

(assert (=> b!147200 (and (= (buf!3461 (_1!6909 lt!228034)) (buf!3461 (_2!6913 lt!229072))) (= (size!3006 arr!237) (size!3006 (_3!355 lt!229072))))))

(declare-fun lt!229050 () Unit!9197)

(declare-fun Unit!9241 () Unit!9197)

(assert (=> b!147200 (= lt!229050 Unit!9241)))

(declare-fun lt!229044 () Unit!9197)

(assert (=> b!147200 (= lt!229044 (arrayUpdatedAtPrefixLemma!12 arr!237 from!447 (_1!6914 lt!229055)))))

(declare-fun call!1966 () Bool)

(assert (=> b!147200 call!1966))

(declare-fun lt!229053 () Unit!9197)

(assert (=> b!147200 (= lt!229053 lt!229044)))

(declare-fun lt!229073 () (_ BitVec 32))

(assert (=> b!147200 (= lt!229073 #b00000000000000000000000000000000)))

(declare-fun lt!229066 () Unit!9197)

(assert (=> b!147200 (= lt!229066 (arrayRangesEqTransitive!52 arr!237 lt!229043 (_3!355 lt!229072) lt!229073 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147200 (arrayRangesEq!322 arr!237 (_3!355 lt!229072) lt!229073 from!447)))

(declare-fun lt!229056 () Unit!9197)

(assert (=> b!147200 (= lt!229056 lt!229066)))

(assert (=> b!147200 call!1967))

(declare-fun lt!229071 () Unit!9197)

(declare-fun Unit!9242 () Unit!9197)

(assert (=> b!147200 (= lt!229071 Unit!9242)))

(declare-fun lt!229045 () Unit!9197)

(assert (=> b!147200 (= lt!229045 (arrayRangesEqImpliesEq!12 lt!229043 (_3!355 lt!229072) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!147200 (= (select (store (arr!3760 arr!237) from!447 (_1!6914 lt!229055)) from!447) (select (arr!3760 (_3!355 lt!229072)) from!447))))

(declare-fun lt!229069 () Unit!9197)

(assert (=> b!147200 (= lt!229069 lt!229045)))

(declare-fun lt!229060 () Bool)

(assert (=> b!147200 (= lt!229060 (= (select (arr!3760 (_3!355 lt!229072)) from!447) (_1!6914 lt!229055)))))

(declare-fun Unit!9243 () Unit!9197)

(assert (=> b!147200 (= lt!229058 Unit!9243)))

(assert (=> b!147200 lt!229060))

(declare-fun lt!229068 () Unit!9197)

(declare-fun b!147201 () Bool)

(assert (=> b!147201 (= e!98143 (tuple3!573 lt!229068 (_1!6909 lt!228034) arr!237))))

(assert (=> b!147201 (= call!1968 call!1968)))

(declare-fun lt!229052 () Unit!9197)

(declare-fun Unit!9244 () Unit!9197)

(assert (=> b!147201 (= lt!229052 Unit!9244)))

(declare-fun lt!229065 () Unit!9197)

(assert (=> b!147201 (= lt!229065 (arrayRangesEqReflexiveLemma!12 arr!237))))

(assert (=> b!147201 call!1967))

(declare-fun lt!229064 () Unit!9197)

(assert (=> b!147201 (= lt!229064 lt!229065)))

(declare-fun lt!229062 () array!6642)

(assert (=> b!147201 (= lt!229062 arr!237)))

(declare-fun lt!229039 () array!6642)

(assert (=> b!147201 (= lt!229039 arr!237)))

(declare-fun lt!229057 () (_ BitVec 32))

(assert (=> b!147201 (= lt!229057 #b00000000000000000000000000000000)))

(declare-fun lt!229040 () (_ BitVec 32))

(assert (=> b!147201 (= lt!229040 (size!3006 arr!237))))

(declare-fun lt!229063 () (_ BitVec 32))

(assert (=> b!147201 (= lt!229063 #b00000000000000000000000000000000)))

(declare-fun lt!229061 () (_ BitVec 32))

(assert (=> b!147201 (= lt!229061 from!447)))

(assert (=> b!147201 (= lt!229068 (arrayRangesEqSlicedLemma!12 lt!229062 lt!229039 lt!229057 lt!229040 lt!229063 lt!229061))))

(assert (=> b!147201 call!1966))

(declare-fun e!98142 () Bool)

(declare-fun b!147202 () Bool)

(assert (=> b!147202 (= e!98142 (= (select (arr!3760 (_3!355 lt!229051)) from!447) (_2!6908 (readBytePure!0 (_1!6909 lt!228034)))))))

(assert (=> b!147202 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!3006 (_3!355 lt!229051))))))

(declare-fun b!147203 () Bool)

(assert (=> b!147203 (= e!98144 (arrayRangesEq!322 arr!237 (_3!355 lt!229051) #b00000000000000000000000000000000 from!447))))

(declare-fun bm!1964 () Bool)

(assert (=> bm!1964 (= call!1968 (bitIndex!0 (ite c!7973 (size!3006 (buf!3461 (_2!6913 lt!229072))) (size!3006 (buf!3461 (_1!6909 lt!228034)))) (ite c!7973 (currentByte!6363 (_2!6913 lt!229072)) (currentByte!6363 (_1!6909 lt!228034))) (ite c!7973 (currentBit!6358 (_2!6913 lt!229072)) (currentBit!6358 (_1!6909 lt!228034)))))))

(declare-fun bm!1965 () Bool)

(assert (=> bm!1965 (= call!1966 (arrayRangesEq!322 (ite c!7973 arr!237 lt!229062) (ite c!7973 (array!6643 (store (arr!3760 arr!237) from!447 (_1!6914 lt!229055)) (size!3006 arr!237)) lt!229039) (ite c!7973 #b00000000000000000000000000000000 lt!229063) (ite c!7973 from!447 lt!229061)))))

(declare-fun d!47598 () Bool)

(assert (=> d!47598 e!98142))

(declare-fun res!123165 () Bool)

(assert (=> d!47598 (=> res!123165 e!98142)))

(assert (=> d!47598 (= res!123165 (bvsge from!447 to!404))))

(declare-fun lt!229042 () Bool)

(assert (=> d!47598 (= lt!229042 e!98144)))

(declare-fun res!123164 () Bool)

(assert (=> d!47598 (=> (not res!123164) (not e!98144))))

(declare-fun lt!229038 () (_ BitVec 64))

(declare-fun lt!229054 () (_ BitVec 64))

(assert (=> d!47598 (= res!123164 (= (bvadd lt!229038 lt!229054) (bitIndex!0 (size!3006 (buf!3461 (_2!6913 lt!229051))) (currentByte!6363 (_2!6913 lt!229051)) (currentBit!6358 (_2!6913 lt!229051)))))))

(assert (=> d!47598 (or (not (= (bvand lt!229038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229054 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229038 lt!229054) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!229041 () (_ BitVec 64))

(assert (=> d!47598 (= lt!229054 (bvmul lt!229041 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!47598 (or (= lt!229041 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229041 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229041)))))

(assert (=> d!47598 (= lt!229041 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!47598 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!47598 (= lt!229038 (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228034))) (currentByte!6363 (_1!6909 lt!228034)) (currentBit!6358 (_1!6909 lt!228034))))))

(assert (=> d!47598 (= lt!229051 e!98143)))

(assert (=> d!47598 (= c!7973 (bvslt from!447 to!404))))

(assert (=> d!47598 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3006 arr!237)))))

(assert (=> d!47598 (= (readByteArrayLoop!0 (_1!6909 lt!228034) arr!237 from!447 to!404) lt!229051)))

(assert (= (and d!47598 c!7973) b!147200))

(assert (= (and d!47598 (not c!7973)) b!147201))

(assert (= (or b!147200 b!147201) bm!1965))

(assert (= (or b!147200 b!147201) bm!1963))

(assert (= (or b!147200 b!147201) bm!1964))

(assert (= (and d!47598 res!123164) b!147199))

(assert (= (and b!147199 res!123163) b!147203))

(assert (= (and d!47598 (not res!123165)) b!147202))

(declare-fun m!227647 () Bool)

(assert (=> bm!1965 m!227647))

(declare-fun m!227649 () Bool)

(assert (=> bm!1965 m!227649))

(declare-fun m!227651 () Bool)

(assert (=> bm!1964 m!227651))

(declare-fun m!227653 () Bool)

(assert (=> b!147202 m!227653))

(assert (=> b!147202 m!226715))

(declare-fun m!227655 () Bool)

(assert (=> d!47598 m!227655))

(assert (=> d!47598 m!227541))

(declare-fun m!227657 () Bool)

(assert (=> bm!1963 m!227657))

(declare-fun m!227659 () Bool)

(assert (=> b!147203 m!227659))

(declare-fun m!227661 () Bool)

(assert (=> b!147200 m!227661))

(declare-fun m!227663 () Bool)

(assert (=> b!147200 m!227663))

(declare-fun m!227665 () Bool)

(assert (=> b!147200 m!227665))

(assert (=> b!147200 m!227541))

(assert (=> b!147200 m!227113))

(declare-fun m!227667 () Bool)

(assert (=> b!147200 m!227667))

(declare-fun m!227669 () Bool)

(assert (=> b!147200 m!227669))

(declare-fun m!227671 () Bool)

(assert (=> b!147200 m!227671))

(declare-fun m!227673 () Bool)

(assert (=> b!147200 m!227673))

(declare-fun m!227675 () Bool)

(assert (=> b!147200 m!227675))

(declare-fun m!227677 () Bool)

(assert (=> b!147200 m!227677))

(declare-fun m!227679 () Bool)

(assert (=> b!147200 m!227679))

(assert (=> b!147200 m!227647))

(assert (=> b!147201 m!227499))

(declare-fun m!227681 () Bool)

(assert (=> b!147201 m!227681))

(assert (=> d!47409 d!47598))

(declare-fun d!47600 () Bool)

(declare-fun e!98145 () Bool)

(assert (=> d!47600 e!98145))

(declare-fun res!123166 () Bool)

(assert (=> d!47600 (=> (not res!123166) (not e!98145))))

(declare-fun lt!229077 () (_ BitVec 64))

(declare-fun lt!229079 () (_ BitVec 64))

(declare-fun lt!229078 () (_ BitVec 64))

(assert (=> d!47600 (= res!123166 (= lt!229078 (bvsub lt!229079 lt!229077)))))

(assert (=> d!47600 (or (= (bvand lt!229079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229077 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!229079 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!229079 lt!229077) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47600 (= lt!229077 (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228469)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228469))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228469)))))))

(declare-fun lt!229076 () (_ BitVec 64))

(declare-fun lt!229075 () (_ BitVec 64))

(assert (=> d!47600 (= lt!229079 (bvmul lt!229076 lt!229075))))

(assert (=> d!47600 (or (= lt!229076 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!229075 (bvsdiv (bvmul lt!229076 lt!229075) lt!229076)))))

(assert (=> d!47600 (= lt!229075 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47600 (= lt!229076 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228469)))))))

(assert (=> d!47600 (= lt!229078 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228469))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228469)))))))

(assert (=> d!47600 (invariant!0 (currentBit!6358 (_2!6907 lt!228469)) (currentByte!6363 (_2!6907 lt!228469)) (size!3006 (buf!3461 (_2!6907 lt!228469))))))

(assert (=> d!47600 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228469))) (currentByte!6363 (_2!6907 lt!228469)) (currentBit!6358 (_2!6907 lt!228469))) lt!229078)))

(declare-fun b!147204 () Bool)

(declare-fun res!123167 () Bool)

(assert (=> b!147204 (=> (not res!123167) (not e!98145))))

(assert (=> b!147204 (= res!123167 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!229078))))

(declare-fun b!147205 () Bool)

(declare-fun lt!229074 () (_ BitVec 64))

(assert (=> b!147205 (= e!98145 (bvsle lt!229078 (bvmul lt!229074 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147205 (or (= lt!229074 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229074 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229074)))))

(assert (=> b!147205 (= lt!229074 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228469)))))))

(assert (= (and d!47600 res!123166) b!147204))

(assert (= (and b!147204 res!123167) b!147205))

(declare-fun m!227683 () Bool)

(assert (=> d!47600 m!227683))

(declare-fun m!227685 () Bool)

(assert (=> d!47600 m!227685))

(assert (=> b!146973 d!47600))

(assert (=> b!146973 d!47301))

(declare-fun d!47602 () Bool)

(declare-fun e!98146 () Bool)

(assert (=> d!47602 e!98146))

(declare-fun res!123168 () Bool)

(assert (=> d!47602 (=> (not res!123168) (not e!98146))))

(declare-fun lt!229083 () (_ BitVec 64))

(declare-fun lt!229084 () (_ BitVec 64))

(declare-fun lt!229085 () (_ BitVec 64))

(assert (=> d!47602 (= res!123168 (= lt!229084 (bvsub lt!229085 lt!229083)))))

(assert (=> d!47602 (or (= (bvand lt!229085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229083 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!229085 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!229085 lt!229083) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47602 (= lt!229083 (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228328)))) ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228328))) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228328)))))))

(declare-fun lt!229082 () (_ BitVec 64))

(declare-fun lt!229081 () (_ BitVec 64))

(assert (=> d!47602 (= lt!229085 (bvmul lt!229082 lt!229081))))

(assert (=> d!47602 (or (= lt!229082 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!229081 (bvsdiv (bvmul lt!229082 lt!229081) lt!229082)))))

(assert (=> d!47602 (= lt!229081 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47602 (= lt!229082 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228328)))))))

(assert (=> d!47602 (= lt!229084 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228328))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228328)))))))

(assert (=> d!47602 (invariant!0 (currentBit!6358 (_1!6908 lt!228328)) (currentByte!6363 (_1!6908 lt!228328)) (size!3006 (buf!3461 (_1!6908 lt!228328))))))

(assert (=> d!47602 (= (bitIndex!0 (size!3006 (buf!3461 (_1!6908 lt!228328))) (currentByte!6363 (_1!6908 lt!228328)) (currentBit!6358 (_1!6908 lt!228328))) lt!229084)))

(declare-fun b!147206 () Bool)

(declare-fun res!123169 () Bool)

(assert (=> b!147206 (=> (not res!123169) (not e!98146))))

(assert (=> b!147206 (= res!123169 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!229084))))

(declare-fun b!147207 () Bool)

(declare-fun lt!229080 () (_ BitVec 64))

(assert (=> b!147207 (= e!98146 (bvsle lt!229084 (bvmul lt!229080 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147207 (or (= lt!229080 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229080 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229080)))))

(assert (=> b!147207 (= lt!229080 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228328)))))))

(assert (= (and d!47602 res!123168) b!147206))

(assert (= (and b!147206 res!123169) b!147207))

(declare-fun m!227687 () Bool)

(assert (=> d!47602 m!227687))

(declare-fun m!227689 () Bool)

(assert (=> d!47602 m!227689))

(assert (=> d!47347 d!47602))

(declare-fun d!47604 () Bool)

(declare-fun e!98149 () Bool)

(assert (=> d!47604 e!98149))

(declare-fun res!123172 () Bool)

(assert (=> d!47604 (=> (not res!123172) (not e!98149))))

(declare-fun lt!229090 () tuple2!13108)

(declare-fun lt!229091 () tuple2!13108)

(assert (=> d!47604 (= res!123172 (= (bitIndex!0 (size!3006 (buf!3461 (_1!6908 lt!229090))) (currentByte!6363 (_1!6908 lt!229090)) (currentBit!6358 (_1!6908 lt!229090))) (bitIndex!0 (size!3006 (buf!3461 (_1!6908 lt!229091))) (currentByte!6363 (_1!6908 lt!229091)) (currentBit!6358 (_1!6908 lt!229091)))))))

(assert (=> d!47604 (= lt!229091 (readBytePure!0 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 lt!228048) (currentBit!6358 lt!228048))))))

(assert (=> d!47604 (= lt!229090 (readBytePure!0 lt!228048))))

(assert (=> d!47604 true))

(declare-fun _$8!87 () Unit!9197)

(assert (=> d!47604 (= (choose!14 lt!228048 (_2!6907 lt!228035) lt!228329 lt!228326 (tuple2!13109 (_1!6908 lt!228326) (_2!6908 lt!228326)) (_1!6908 lt!228326) (_2!6908 lt!228326) lt!228328 (tuple2!13109 (_1!6908 lt!228328) (_2!6908 lt!228328)) (_1!6908 lt!228328) (_2!6908 lt!228328)) _$8!87)))

(declare-fun b!147210 () Bool)

(assert (=> b!147210 (= e!98149 (= (_2!6908 lt!229090) (_2!6908 lt!229091)))))

(assert (= (and d!47604 res!123172) b!147210))

(declare-fun m!227691 () Bool)

(assert (=> d!47604 m!227691))

(declare-fun m!227693 () Bool)

(assert (=> d!47604 m!227693))

(declare-fun m!227695 () Bool)

(assert (=> d!47604 m!227695))

(assert (=> d!47604 m!226741))

(assert (=> d!47347 d!47604))

(declare-fun d!47606 () Bool)

(declare-fun e!98150 () Bool)

(assert (=> d!47606 e!98150))

(declare-fun res!123173 () Bool)

(assert (=> d!47606 (=> (not res!123173) (not e!98150))))

(declare-fun lt!229096 () (_ BitVec 64))

(declare-fun lt!229095 () (_ BitVec 64))

(declare-fun lt!229097 () (_ BitVec 64))

(assert (=> d!47606 (= res!123173 (= lt!229096 (bvsub lt!229097 lt!229095)))))

(assert (=> d!47606 (or (= (bvand lt!229097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!229097 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!229097 lt!229095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47606 (= lt!229095 (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228326)))) ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228326))) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228326)))))))

(declare-fun lt!229094 () (_ BitVec 64))

(declare-fun lt!229093 () (_ BitVec 64))

(assert (=> d!47606 (= lt!229097 (bvmul lt!229094 lt!229093))))

(assert (=> d!47606 (or (= lt!229094 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!229093 (bvsdiv (bvmul lt!229094 lt!229093) lt!229094)))))

(assert (=> d!47606 (= lt!229093 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47606 (= lt!229094 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228326)))))))

(assert (=> d!47606 (= lt!229096 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228326))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228326)))))))

(assert (=> d!47606 (invariant!0 (currentBit!6358 (_1!6908 lt!228326)) (currentByte!6363 (_1!6908 lt!228326)) (size!3006 (buf!3461 (_1!6908 lt!228326))))))

(assert (=> d!47606 (= (bitIndex!0 (size!3006 (buf!3461 (_1!6908 lt!228326))) (currentByte!6363 (_1!6908 lt!228326)) (currentBit!6358 (_1!6908 lt!228326))) lt!229096)))

(declare-fun b!147211 () Bool)

(declare-fun res!123174 () Bool)

(assert (=> b!147211 (=> (not res!123174) (not e!98150))))

(assert (=> b!147211 (= res!123174 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!229096))))

(declare-fun b!147212 () Bool)

(declare-fun lt!229092 () (_ BitVec 64))

(assert (=> b!147212 (= e!98150 (bvsle lt!229096 (bvmul lt!229092 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147212 (or (= lt!229092 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229092 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229092)))))

(assert (=> b!147212 (= lt!229092 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228326)))))))

(assert (= (and d!47606 res!123173) b!147211))

(assert (= (and b!147211 res!123174) b!147212))

(declare-fun m!227697 () Bool)

(assert (=> d!47606 m!227697))

(declare-fun m!227699 () Bool)

(assert (=> d!47606 m!227699))

(assert (=> d!47347 d!47606))

(declare-fun d!47608 () Bool)

(declare-fun lt!229098 () tuple2!13116)

(assert (=> d!47608 (= lt!229098 (readByte!0 lt!228329))))

(assert (=> d!47608 (= (readBytePure!0 lt!228329) (tuple2!13109 (_2!6914 lt!229098) (_1!6914 lt!229098)))))

(declare-fun bs!11649 () Bool)

(assert (= bs!11649 d!47608))

(declare-fun m!227701 () Bool)

(assert (=> bs!11649 m!227701))

(assert (=> d!47347 d!47608))

(assert (=> d!47347 d!47427))

(declare-fun lt!229100 () tuple4!138)

(declare-fun b!147213 () Bool)

(declare-fun e!98156 () Bool)

(assert (=> b!147213 (= e!98156 (arrayRangesEq!322 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228045)) (_1!6918 lt!229100) (_2!6918 lt!229100)))))

(declare-fun d!47610 () Bool)

(declare-fun res!123177 () Bool)

(declare-fun e!98155 () Bool)

(assert (=> d!47610 (=> res!123177 e!98155)))

(assert (=> d!47610 (= res!123177 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(assert (=> d!47610 (= (arrayBitRangesEq!0 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228045)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) e!98155)))

(declare-fun b!147214 () Bool)

(declare-fun res!123179 () Bool)

(declare-fun lt!229099 () (_ BitVec 32))

(assert (=> b!147214 (= res!123179 (= lt!229099 #b00000000000000000000000000000000))))

(declare-fun e!98154 () Bool)

(assert (=> b!147214 (=> res!123179 e!98154)))

(declare-fun e!98152 () Bool)

(assert (=> b!147214 (= e!98152 e!98154)))

(declare-fun b!147215 () Bool)

(declare-fun e!98151 () Bool)

(assert (=> b!147215 (= e!98155 e!98151)))

(declare-fun res!123178 () Bool)

(assert (=> b!147215 (=> (not res!123178) (not e!98151))))

(assert (=> b!147215 (= res!123178 e!98156)))

(declare-fun res!123176 () Bool)

(assert (=> b!147215 (=> res!123176 e!98156)))

(assert (=> b!147215 (= res!123176 (bvsge (_1!6918 lt!229100) (_2!6918 lt!229100)))))

(assert (=> b!147215 (= lt!229099 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!229101 () (_ BitVec 32))

(assert (=> b!147215 (= lt!229101 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147215 (= lt!229100 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(declare-fun b!147216 () Bool)

(declare-fun e!98153 () Bool)

(assert (=> b!147216 (= e!98153 e!98152)))

(declare-fun res!123175 () Bool)

(assert (=> b!147216 (= res!123175 (byteRangesEq!0 (select (arr!3760 (buf!3461 thiss!1634)) (_3!357 lt!229100)) (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_3!357 lt!229100)) lt!229101 #b00000000000000000000000000001000))))

(assert (=> b!147216 (=> (not res!123175) (not e!98152))))

(declare-fun b!147217 () Bool)

(assert (=> b!147217 (= e!98151 e!98153)))

(declare-fun c!7974 () Bool)

(assert (=> b!147217 (= c!7974 (= (_3!357 lt!229100) (_4!69 lt!229100)))))

(declare-fun b!147218 () Bool)

(declare-fun call!1969 () Bool)

(assert (=> b!147218 (= e!98153 call!1969)))

(declare-fun b!147219 () Bool)

(assert (=> b!147219 (= e!98154 call!1969)))

(declare-fun bm!1966 () Bool)

(assert (=> bm!1966 (= call!1969 (byteRangesEq!0 (ite c!7974 (select (arr!3760 (buf!3461 thiss!1634)) (_3!357 lt!229100)) (select (arr!3760 (buf!3461 thiss!1634)) (_4!69 lt!229100))) (ite c!7974 (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_3!357 lt!229100)) (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_4!69 lt!229100))) (ite c!7974 lt!229101 #b00000000000000000000000000000000) lt!229099))))

(assert (= (and d!47610 (not res!123177)) b!147215))

(assert (= (and b!147215 (not res!123176)) b!147213))

(assert (= (and b!147215 res!123178) b!147217))

(assert (= (and b!147217 c!7974) b!147218))

(assert (= (and b!147217 (not c!7974)) b!147216))

(assert (= (and b!147216 res!123175) b!147214))

(assert (= (and b!147214 (not res!123179)) b!147219))

(assert (= (or b!147218 b!147219) bm!1966))

(declare-fun m!227703 () Bool)

(assert (=> b!147213 m!227703))

(assert (=> b!147215 m!226687))

(declare-fun m!227705 () Bool)

(assert (=> b!147215 m!227705))

(declare-fun m!227707 () Bool)

(assert (=> b!147216 m!227707))

(declare-fun m!227709 () Bool)

(assert (=> b!147216 m!227709))

(assert (=> b!147216 m!227707))

(assert (=> b!147216 m!227709))

(declare-fun m!227711 () Bool)

(assert (=> b!147216 m!227711))

(assert (=> bm!1966 m!227709))

(declare-fun m!227713 () Bool)

(assert (=> bm!1966 m!227713))

(assert (=> bm!1966 m!227707))

(declare-fun m!227715 () Bool)

(assert (=> bm!1966 m!227715))

(declare-fun m!227717 () Bool)

(assert (=> bm!1966 m!227717))

(assert (=> b!146831 d!47610))

(assert (=> b!146831 d!47325))

(declare-fun d!47612 () Bool)

(declare-fun res!123181 () Bool)

(declare-fun e!98157 () Bool)

(assert (=> d!47612 (=> (not res!123181) (not e!98157))))

(assert (=> d!47612 (= res!123181 (= (size!3006 (buf!3461 (_2!6909 lt!228284))) (size!3006 (buf!3461 (_2!6907 lt!228045)))))))

(assert (=> d!47612 (= (isPrefixOf!0 (_2!6909 lt!228284) (_2!6907 lt!228045)) e!98157)))

(declare-fun b!147220 () Bool)

(declare-fun res!123180 () Bool)

(assert (=> b!147220 (=> (not res!123180) (not e!98157))))

(assert (=> b!147220 (= res!123180 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228284))) (currentByte!6363 (_2!6909 lt!228284)) (currentBit!6358 (_2!6909 lt!228284))) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(declare-fun b!147221 () Bool)

(declare-fun e!98158 () Bool)

(assert (=> b!147221 (= e!98157 e!98158)))

(declare-fun res!123182 () Bool)

(assert (=> b!147221 (=> res!123182 e!98158)))

(assert (=> b!147221 (= res!123182 (= (size!3006 (buf!3461 (_2!6909 lt!228284))) #b00000000000000000000000000000000))))

(declare-fun b!147222 () Bool)

(assert (=> b!147222 (= e!98158 (arrayBitRangesEq!0 (buf!3461 (_2!6909 lt!228284)) (buf!3461 (_2!6907 lt!228045)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228284))) (currentByte!6363 (_2!6909 lt!228284)) (currentBit!6358 (_2!6909 lt!228284)))))))

(assert (= (and d!47612 res!123181) b!147220))

(assert (= (and b!147220 res!123180) b!147221))

(assert (= (and b!147221 (not res!123182)) b!147222))

(assert (=> b!147220 m!227509))

(assert (=> b!147220 m!226685))

(assert (=> b!147222 m!227509))

(assert (=> b!147222 m!227509))

(declare-fun m!227719 () Bool)

(assert (=> b!147222 m!227719))

(assert (=> b!146893 d!47612))

(declare-fun d!47614 () Bool)

(declare-fun res!123183 () Bool)

(declare-fun e!98159 () Bool)

(assert (=> d!47614 (=> res!123183 e!98159)))

(assert (=> d!47614 (= res!123183 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47614 (= (arrayRangesEq!322 (_2!6910 lt!228052) (_2!6910 lt!228050) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!98159)))

(declare-fun b!147223 () Bool)

(declare-fun e!98160 () Bool)

(assert (=> b!147223 (= e!98159 e!98160)))

(declare-fun res!123184 () Bool)

(assert (=> b!147223 (=> (not res!123184) (not e!98160))))

(assert (=> b!147223 (= res!123184 (= (select (arr!3760 (_2!6910 lt!228052)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3760 (_2!6910 lt!228050)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!147224 () Bool)

(assert (=> b!147224 (= e!98160 (arrayRangesEq!322 (_2!6910 lt!228052) (_2!6910 lt!228050) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47614 (not res!123183)) b!147223))

(assert (= (and b!147223 res!123184) b!147224))

(declare-fun m!227721 () Bool)

(assert (=> b!147223 m!227721))

(declare-fun m!227723 () Bool)

(assert (=> b!147223 m!227723))

(declare-fun m!227725 () Bool)

(assert (=> b!147224 m!227725))

(assert (=> b!146976 d!47614))

(declare-fun d!47616 () Bool)

(declare-fun e!98161 () Bool)

(assert (=> d!47616 e!98161))

(declare-fun res!123185 () Bool)

(assert (=> d!47616 (=> (not res!123185) (not e!98161))))

(declare-fun lt!229102 () BitStream!5270)

(declare-fun lt!229103 () (_ BitVec 64))

(assert (=> d!47616 (= res!123185 (= (bvadd lt!229103 (bvsub lt!228293 lt!228290)) (bitIndex!0 (size!3006 (buf!3461 lt!229102)) (currentByte!6363 lt!229102) (currentBit!6358 lt!229102))))))

(assert (=> d!47616 (or (not (= (bvand lt!229103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228293 lt!228290) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229103 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229103 (bvsub lt!228293 lt!228290)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47616 (= lt!229103 (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228284))) (currentByte!6363 (_2!6909 lt!228284)) (currentBit!6358 (_2!6909 lt!228284))))))

(assert (=> d!47616 (= lt!229102 (_2!6907 (moveBitIndex!0 (_2!6909 lt!228284) (bvsub lt!228293 lt!228290))))))

(assert (=> d!47616 (moveBitIndexPrecond!0 (_2!6909 lt!228284) (bvsub lt!228293 lt!228290))))

(assert (=> d!47616 (= (withMovedBitIndex!0 (_2!6909 lt!228284) (bvsub lt!228293 lt!228290)) lt!229102)))

(declare-fun b!147225 () Bool)

(assert (=> b!147225 (= e!98161 (= (size!3006 (buf!3461 (_2!6909 lt!228284))) (size!3006 (buf!3461 lt!229102))))))

(assert (= (and d!47616 res!123185) b!147225))

(declare-fun m!227727 () Bool)

(assert (=> d!47616 m!227727))

(assert (=> d!47616 m!227509))

(declare-fun m!227729 () Bool)

(assert (=> d!47616 m!227729))

(declare-fun m!227731 () Bool)

(assert (=> d!47616 m!227731))

(assert (=> b!146896 d!47616))

(assert (=> b!146896 d!47301))

(assert (=> b!146896 d!47325))

(declare-fun d!47618 () Bool)

(assert (=> d!47618 (= (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045)))) (bvsub (bvmul ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))))))))

(assert (=> d!47313 d!47618))

(assert (=> b!146929 d!47325))

(assert (=> b!146929 d!47295))

(declare-fun d!47620 () Bool)

(declare-fun lt!229104 () tuple2!13116)

(assert (=> d!47620 (= lt!229104 (readByte!0 (_1!6909 lt!228532)))))

(assert (=> d!47620 (= (readBytePure!0 (_1!6909 lt!228532)) (tuple2!13109 (_2!6914 lt!229104) (_1!6914 lt!229104)))))

(declare-fun bs!11650 () Bool)

(assert (= bs!11650 d!47620))

(declare-fun m!227733 () Bool)

(assert (=> bs!11650 m!227733))

(assert (=> b!146992 d!47620))

(declare-fun b!147226 () Bool)

(declare-fun res!123186 () Bool)

(declare-fun e!98163 () Bool)

(assert (=> b!147226 (=> (not res!123186) (not e!98163))))

(declare-fun lt!229115 () tuple2!13110)

(assert (=> b!147226 (= res!123186 (isPrefixOf!0 (_2!6909 lt!229115) (_2!6907 lt!228528)))))

(declare-fun b!147227 () Bool)

(declare-fun e!98162 () Unit!9197)

(declare-fun lt!229120 () Unit!9197)

(assert (=> b!147227 (= e!98162 lt!229120)))

(declare-fun lt!229123 () (_ BitVec 64))

(assert (=> b!147227 (= lt!229123 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!229107 () (_ BitVec 64))

(assert (=> b!147227 (= lt!229107 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))

(assert (=> b!147227 (= lt!229120 (arrayBitRangesEqSymmetric!0 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228528)) lt!229123 lt!229107))))

(assert (=> b!147227 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228528)) (buf!3461 thiss!1634) lt!229123 lt!229107)))

(declare-fun b!147228 () Bool)

(declare-fun Unit!9245 () Unit!9197)

(assert (=> b!147228 (= e!98162 Unit!9245)))

(declare-fun lt!229121 () (_ BitVec 64))

(declare-fun b!147229 () Bool)

(declare-fun lt!229124 () (_ BitVec 64))

(assert (=> b!147229 (= e!98163 (= (_1!6909 lt!229115) (withMovedBitIndex!0 (_2!6909 lt!229115) (bvsub lt!229124 lt!229121))))))

(assert (=> b!147229 (or (= (bvand lt!229124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229121 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!229124 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!229124 lt!229121) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147229 (= lt!229121 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228528))) (currentByte!6363 (_2!6907 lt!228528)) (currentBit!6358 (_2!6907 lt!228528))))))

(assert (=> b!147229 (= lt!229124 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))

(declare-fun b!147230 () Bool)

(declare-fun res!123188 () Bool)

(assert (=> b!147230 (=> (not res!123188) (not e!98163))))

(assert (=> b!147230 (= res!123188 (isPrefixOf!0 (_1!6909 lt!229115) thiss!1634))))

(declare-fun d!47622 () Bool)

(assert (=> d!47622 e!98163))

(declare-fun res!123187 () Bool)

(assert (=> d!47622 (=> (not res!123187) (not e!98163))))

(assert (=> d!47622 (= res!123187 (isPrefixOf!0 (_1!6909 lt!229115) (_2!6909 lt!229115)))))

(declare-fun lt!229106 () BitStream!5270)

(assert (=> d!47622 (= lt!229115 (tuple2!13111 lt!229106 (_2!6907 lt!228528)))))

(declare-fun lt!229113 () Unit!9197)

(declare-fun lt!229119 () Unit!9197)

(assert (=> d!47622 (= lt!229113 lt!229119)))

(assert (=> d!47622 (isPrefixOf!0 lt!229106 (_2!6907 lt!228528))))

(assert (=> d!47622 (= lt!229119 (lemmaIsPrefixTransitive!0 lt!229106 (_2!6907 lt!228528) (_2!6907 lt!228528)))))

(declare-fun lt!229117 () Unit!9197)

(declare-fun lt!229109 () Unit!9197)

(assert (=> d!47622 (= lt!229117 lt!229109)))

(assert (=> d!47622 (isPrefixOf!0 lt!229106 (_2!6907 lt!228528))))

(assert (=> d!47622 (= lt!229109 (lemmaIsPrefixTransitive!0 lt!229106 thiss!1634 (_2!6907 lt!228528)))))

(declare-fun lt!229108 () Unit!9197)

(assert (=> d!47622 (= lt!229108 e!98162)))

(declare-fun c!7975 () Bool)

(assert (=> d!47622 (= c!7975 (not (= (size!3006 (buf!3461 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!229112 () Unit!9197)

(declare-fun lt!229114 () Unit!9197)

(assert (=> d!47622 (= lt!229112 lt!229114)))

(assert (=> d!47622 (isPrefixOf!0 (_2!6907 lt!228528) (_2!6907 lt!228528))))

(assert (=> d!47622 (= lt!229114 (lemmaIsPrefixRefl!0 (_2!6907 lt!228528)))))

(declare-fun lt!229122 () Unit!9197)

(declare-fun lt!229118 () Unit!9197)

(assert (=> d!47622 (= lt!229122 lt!229118)))

(assert (=> d!47622 (= lt!229118 (lemmaIsPrefixRefl!0 (_2!6907 lt!228528)))))

(declare-fun lt!229105 () Unit!9197)

(declare-fun lt!229111 () Unit!9197)

(assert (=> d!47622 (= lt!229105 lt!229111)))

(assert (=> d!47622 (isPrefixOf!0 lt!229106 lt!229106)))

(assert (=> d!47622 (= lt!229111 (lemmaIsPrefixRefl!0 lt!229106))))

(declare-fun lt!229110 () Unit!9197)

(declare-fun lt!229116 () Unit!9197)

(assert (=> d!47622 (= lt!229110 lt!229116)))

(assert (=> d!47622 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47622 (= lt!229116 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47622 (= lt!229106 (BitStream!5271 (buf!3461 (_2!6907 lt!228528)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))

(assert (=> d!47622 (isPrefixOf!0 thiss!1634 (_2!6907 lt!228528))))

(assert (=> d!47622 (= (reader!0 thiss!1634 (_2!6907 lt!228528)) lt!229115)))

(assert (= (and d!47622 c!7975) b!147227))

(assert (= (and d!47622 (not c!7975)) b!147228))

(assert (= (and d!47622 res!123187) b!147230))

(assert (= (and b!147230 res!123188) b!147226))

(assert (= (and b!147226 res!123186) b!147229))

(assert (=> b!147227 m!226687))

(declare-fun m!227735 () Bool)

(assert (=> b!147227 m!227735))

(declare-fun m!227737 () Bool)

(assert (=> b!147227 m!227737))

(declare-fun m!227739 () Bool)

(assert (=> b!147226 m!227739))

(declare-fun m!227741 () Bool)

(assert (=> b!147229 m!227741))

(assert (=> b!147229 m!227145))

(assert (=> b!147229 m!226687))

(declare-fun m!227743 () Bool)

(assert (=> d!47622 m!227743))

(declare-fun m!227745 () Bool)

(assert (=> d!47622 m!227745))

(assert (=> d!47622 m!226911))

(declare-fun m!227747 () Bool)

(assert (=> d!47622 m!227747))

(declare-fun m!227749 () Bool)

(assert (=> d!47622 m!227749))

(declare-fun m!227751 () Bool)

(assert (=> d!47622 m!227751))

(declare-fun m!227753 () Bool)

(assert (=> d!47622 m!227753))

(declare-fun m!227755 () Bool)

(assert (=> d!47622 m!227755))

(assert (=> d!47622 m!227147))

(assert (=> d!47622 m!226921))

(declare-fun m!227757 () Bool)

(assert (=> d!47622 m!227757))

(declare-fun m!227759 () Bool)

(assert (=> b!147230 m!227759))

(assert (=> b!146992 d!47622))

(assert (=> d!47359 d!47437))

(declare-fun d!47624 () Bool)

(assert (=> d!47624 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228055)))

(assert (=> d!47624 true))

(declare-fun _$5!71 () Unit!9197)

(assert (=> d!47624 (= (choose!26 (_2!6907 lt!228045) (buf!3461 (_2!6907 lt!228035)) lt!228055 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))) _$5!71)))

(declare-fun bs!11651 () Bool)

(assert (= bs!11651 d!47624))

(assert (=> bs!11651 m!226727))

(assert (=> d!47359 d!47624))

(assert (=> d!47437 d!47618))

(declare-fun d!47626 () Bool)

(assert (=> d!47626 (isPrefixOf!0 lt!228498 (_2!6907 lt!228035))))

(declare-fun lt!229125 () Unit!9197)

(assert (=> d!47626 (= lt!229125 (choose!30 lt!228498 (_2!6907 lt!228035) (_2!6907 lt!228035)))))

(assert (=> d!47626 (isPrefixOf!0 lt!228498 (_2!6907 lt!228035))))

(assert (=> d!47626 (= (lemmaIsPrefixTransitive!0 lt!228498 (_2!6907 lt!228035) (_2!6907 lt!228035)) lt!229125)))

(declare-fun bs!11652 () Bool)

(assert (= bs!11652 d!47626))

(assert (=> bs!11652 m!227125))

(declare-fun m!227761 () Bool)

(assert (=> bs!11652 m!227761))

(assert (=> bs!11652 m!227125))

(assert (=> d!47429 d!47626))

(declare-fun d!47628 () Bool)

(declare-fun res!123190 () Bool)

(declare-fun e!98164 () Bool)

(assert (=> d!47628 (=> (not res!123190) (not e!98164))))

(assert (=> d!47628 (= res!123190 (= (size!3006 (buf!3461 lt!228498)) (size!3006 (buf!3461 lt!228498))))))

(assert (=> d!47628 (= (isPrefixOf!0 lt!228498 lt!228498) e!98164)))

(declare-fun b!147231 () Bool)

(declare-fun res!123189 () Bool)

(assert (=> b!147231 (=> (not res!123189) (not e!98164))))

(assert (=> b!147231 (= res!123189 (bvsle (bitIndex!0 (size!3006 (buf!3461 lt!228498)) (currentByte!6363 lt!228498) (currentBit!6358 lt!228498)) (bitIndex!0 (size!3006 (buf!3461 lt!228498)) (currentByte!6363 lt!228498) (currentBit!6358 lt!228498))))))

(declare-fun b!147232 () Bool)

(declare-fun e!98165 () Bool)

(assert (=> b!147232 (= e!98164 e!98165)))

(declare-fun res!123191 () Bool)

(assert (=> b!147232 (=> res!123191 e!98165)))

(assert (=> b!147232 (= res!123191 (= (size!3006 (buf!3461 lt!228498)) #b00000000000000000000000000000000))))

(declare-fun b!147233 () Bool)

(assert (=> b!147233 (= e!98165 (arrayBitRangesEq!0 (buf!3461 lt!228498) (buf!3461 lt!228498) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 lt!228498)) (currentByte!6363 lt!228498) (currentBit!6358 lt!228498))))))

(assert (= (and d!47628 res!123190) b!147231))

(assert (= (and b!147231 res!123189) b!147232))

(assert (= (and b!147232 (not res!123191)) b!147233))

(declare-fun m!227763 () Bool)

(assert (=> b!147231 m!227763))

(assert (=> b!147231 m!227763))

(assert (=> b!147233 m!227763))

(assert (=> b!147233 m!227763))

(declare-fun m!227765 () Bool)

(assert (=> b!147233 m!227765))

(assert (=> d!47429 d!47628))

(declare-fun d!47630 () Bool)

(assert (=> d!47630 (isPrefixOf!0 lt!228498 lt!228498)))

(declare-fun lt!229126 () Unit!9197)

(assert (=> d!47630 (= lt!229126 (choose!11 lt!228498))))

(assert (=> d!47630 (= (lemmaIsPrefixRefl!0 lt!228498) lt!229126)))

(declare-fun bs!11653 () Bool)

(assert (= bs!11653 d!47630))

(assert (=> bs!11653 m!227135))

(declare-fun m!227767 () Bool)

(assert (=> bs!11653 m!227767))

(assert (=> d!47429 d!47630))

(declare-fun d!47632 () Bool)

(assert (=> d!47632 (isPrefixOf!0 (_2!6907 lt!228035) (_2!6907 lt!228035))))

(declare-fun lt!229127 () Unit!9197)

(assert (=> d!47632 (= lt!229127 (choose!11 (_2!6907 lt!228035)))))

(assert (=> d!47632 (= (lemmaIsPrefixRefl!0 (_2!6907 lt!228035)) lt!229127)))

(declare-fun bs!11654 () Bool)

(assert (= bs!11654 d!47632))

(assert (=> bs!11654 m!226867))

(declare-fun m!227769 () Bool)

(assert (=> bs!11654 m!227769))

(assert (=> d!47429 d!47632))

(assert (=> d!47429 d!47363))

(declare-fun d!47634 () Bool)

(declare-fun res!123193 () Bool)

(declare-fun e!98166 () Bool)

(assert (=> d!47634 (=> (not res!123193) (not e!98166))))

(assert (=> d!47634 (= res!123193 (= (size!3006 (buf!3461 (_2!6907 lt!228035))) (size!3006 (buf!3461 (_2!6907 lt!228035)))))))

(assert (=> d!47634 (= (isPrefixOf!0 (_2!6907 lt!228035) (_2!6907 lt!228035)) e!98166)))

(declare-fun b!147234 () Bool)

(declare-fun res!123192 () Bool)

(assert (=> b!147234 (=> (not res!123192) (not e!98166))))

(assert (=> b!147234 (= res!123192 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035))) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035)))))))

(declare-fun b!147235 () Bool)

(declare-fun e!98167 () Bool)

(assert (=> b!147235 (= e!98166 e!98167)))

(declare-fun res!123194 () Bool)

(assert (=> b!147235 (=> res!123194 e!98167)))

(assert (=> b!147235 (= res!123194 (= (size!3006 (buf!3461 (_2!6907 lt!228035))) #b00000000000000000000000000000000))))

(declare-fun b!147236 () Bool)

(assert (=> b!147236 (= e!98167 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228035)) (buf!3461 (_2!6907 lt!228035)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035)))))))

(assert (= (and d!47634 res!123193) b!147234))

(assert (= (and b!147234 res!123192) b!147235))

(assert (= (and b!147235 (not res!123194)) b!147236))

(assert (=> b!147234 m!226749))

(assert (=> b!147234 m!226749))

(assert (=> b!147236 m!226749))

(assert (=> b!147236 m!226749))

(declare-fun m!227771 () Bool)

(assert (=> b!147236 m!227771))

(assert (=> d!47429 d!47634))

(assert (=> d!47429 d!47570))

(declare-fun d!47636 () Bool)

(declare-fun res!123196 () Bool)

(declare-fun e!98168 () Bool)

(assert (=> d!47636 (=> (not res!123196) (not e!98168))))

(assert (=> d!47636 (= res!123196 (= (size!3006 (buf!3461 (_1!6909 lt!228507))) (size!3006 (buf!3461 (_2!6909 lt!228507)))))))

(assert (=> d!47636 (= (isPrefixOf!0 (_1!6909 lt!228507) (_2!6909 lt!228507)) e!98168)))

(declare-fun b!147237 () Bool)

(declare-fun res!123195 () Bool)

(assert (=> b!147237 (=> (not res!123195) (not e!98168))))

(assert (=> b!147237 (= res!123195 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228507))) (currentByte!6363 (_1!6909 lt!228507)) (currentBit!6358 (_1!6909 lt!228507))) (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228507))) (currentByte!6363 (_2!6909 lt!228507)) (currentBit!6358 (_2!6909 lt!228507)))))))

(declare-fun b!147238 () Bool)

(declare-fun e!98169 () Bool)

(assert (=> b!147238 (= e!98168 e!98169)))

(declare-fun res!123197 () Bool)

(assert (=> b!147238 (=> res!123197 e!98169)))

(assert (=> b!147238 (= res!123197 (= (size!3006 (buf!3461 (_1!6909 lt!228507))) #b00000000000000000000000000000000))))

(declare-fun b!147239 () Bool)

(assert (=> b!147239 (= e!98169 (arrayBitRangesEq!0 (buf!3461 (_1!6909 lt!228507)) (buf!3461 (_2!6909 lt!228507)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228507))) (currentByte!6363 (_1!6909 lt!228507)) (currentBit!6358 (_1!6909 lt!228507)))))))

(assert (= (and d!47636 res!123196) b!147237))

(assert (= (and b!147237 res!123195) b!147238))

(assert (= (and b!147238 (not res!123197)) b!147239))

(declare-fun m!227773 () Bool)

(assert (=> b!147237 m!227773))

(assert (=> b!147237 m!227545))

(assert (=> b!147239 m!227773))

(assert (=> b!147239 m!227773))

(declare-fun m!227775 () Bool)

(assert (=> b!147239 m!227775))

(assert (=> d!47429 d!47636))

(assert (=> d!47429 d!47574))

(declare-fun d!47638 () Bool)

(assert (=> d!47638 (isPrefixOf!0 lt!228498 (_2!6907 lt!228035))))

(declare-fun lt!229128 () Unit!9197)

(assert (=> d!47638 (= lt!229128 (choose!30 lt!228498 thiss!1634 (_2!6907 lt!228035)))))

(assert (=> d!47638 (isPrefixOf!0 lt!228498 thiss!1634)))

(assert (=> d!47638 (= (lemmaIsPrefixTransitive!0 lt!228498 thiss!1634 (_2!6907 lt!228035)) lt!229128)))

(declare-fun bs!11655 () Bool)

(assert (= bs!11655 d!47638))

(assert (=> bs!11655 m!227125))

(declare-fun m!227777 () Bool)

(assert (=> bs!11655 m!227777))

(declare-fun m!227779 () Bool)

(assert (=> bs!11655 m!227779))

(assert (=> d!47429 d!47638))

(declare-fun d!47640 () Bool)

(declare-fun res!123199 () Bool)

(declare-fun e!98170 () Bool)

(assert (=> d!47640 (=> (not res!123199) (not e!98170))))

(assert (=> d!47640 (= res!123199 (= (size!3006 (buf!3461 lt!228498)) (size!3006 (buf!3461 (_2!6907 lt!228035)))))))

(assert (=> d!47640 (= (isPrefixOf!0 lt!228498 (_2!6907 lt!228035)) e!98170)))

(declare-fun b!147240 () Bool)

(declare-fun res!123198 () Bool)

(assert (=> b!147240 (=> (not res!123198) (not e!98170))))

(assert (=> b!147240 (= res!123198 (bvsle (bitIndex!0 (size!3006 (buf!3461 lt!228498)) (currentByte!6363 lt!228498) (currentBit!6358 lt!228498)) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035)))))))

(declare-fun b!147241 () Bool)

(declare-fun e!98171 () Bool)

(assert (=> b!147241 (= e!98170 e!98171)))

(declare-fun res!123200 () Bool)

(assert (=> b!147241 (=> res!123200 e!98171)))

(assert (=> b!147241 (= res!123200 (= (size!3006 (buf!3461 lt!228498)) #b00000000000000000000000000000000))))

(declare-fun b!147242 () Bool)

(assert (=> b!147242 (= e!98171 (arrayBitRangesEq!0 (buf!3461 lt!228498) (buf!3461 (_2!6907 lt!228035)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 lt!228498)) (currentByte!6363 lt!228498) (currentBit!6358 lt!228498))))))

(assert (= (and d!47640 res!123199) b!147240))

(assert (= (and b!147240 res!123198) b!147241))

(assert (= (and b!147241 (not res!123200)) b!147242))

(assert (=> b!147240 m!227763))

(assert (=> b!147240 m!226749))

(assert (=> b!147242 m!227763))

(assert (=> b!147242 m!227763))

(declare-fun m!227781 () Bool)

(assert (=> b!147242 m!227781))

(assert (=> d!47429 d!47640))

(declare-fun d!47642 () Bool)

(assert (=> d!47642 (isPrefixOf!0 lt!228246 (_2!6907 lt!228035))))

(declare-fun lt!229129 () Unit!9197)

(assert (=> d!47642 (= lt!229129 (choose!30 lt!228246 (_2!6907 lt!228035) (_2!6907 lt!228035)))))

(assert (=> d!47642 (isPrefixOf!0 lt!228246 (_2!6907 lt!228035))))

(assert (=> d!47642 (= (lemmaIsPrefixTransitive!0 lt!228246 (_2!6907 lt!228035) (_2!6907 lt!228035)) lt!229129)))

(declare-fun bs!11656 () Bool)

(assert (= bs!11656 d!47642))

(assert (=> bs!11656 m!226869))

(declare-fun m!227783 () Bool)

(assert (=> bs!11656 m!227783))

(assert (=> bs!11656 m!226869))

(assert (=> d!47317 d!47642))

(assert (=> d!47317 d!47632))

(assert (=> d!47317 d!47333))

(declare-fun d!47644 () Bool)

(assert (=> d!47644 (isPrefixOf!0 lt!228246 (_2!6907 lt!228035))))

(declare-fun lt!229130 () Unit!9197)

(assert (=> d!47644 (= lt!229130 (choose!30 lt!228246 (_2!6907 lt!228045) (_2!6907 lt!228035)))))

(assert (=> d!47644 (isPrefixOf!0 lt!228246 (_2!6907 lt!228045))))

(assert (=> d!47644 (= (lemmaIsPrefixTransitive!0 lt!228246 (_2!6907 lt!228045) (_2!6907 lt!228035)) lt!229130)))

(declare-fun bs!11657 () Bool)

(assert (= bs!11657 d!47644))

(assert (=> bs!11657 m!226869))

(declare-fun m!227785 () Bool)

(assert (=> bs!11657 m!227785))

(declare-fun m!227787 () Bool)

(assert (=> bs!11657 m!227787))

(assert (=> d!47317 d!47644))

(assert (=> d!47317 d!47634))

(assert (=> d!47317 d!47568))

(declare-fun d!47646 () Bool)

(declare-fun res!123202 () Bool)

(declare-fun e!98172 () Bool)

(assert (=> d!47646 (=> (not res!123202) (not e!98172))))

(assert (=> d!47646 (= res!123202 (= (size!3006 (buf!3461 lt!228246)) (size!3006 (buf!3461 lt!228246))))))

(assert (=> d!47646 (= (isPrefixOf!0 lt!228246 lt!228246) e!98172)))

(declare-fun b!147243 () Bool)

(declare-fun res!123201 () Bool)

(assert (=> b!147243 (=> (not res!123201) (not e!98172))))

(assert (=> b!147243 (= res!123201 (bvsle (bitIndex!0 (size!3006 (buf!3461 lt!228246)) (currentByte!6363 lt!228246) (currentBit!6358 lt!228246)) (bitIndex!0 (size!3006 (buf!3461 lt!228246)) (currentByte!6363 lt!228246) (currentBit!6358 lt!228246))))))

(declare-fun b!147244 () Bool)

(declare-fun e!98173 () Bool)

(assert (=> b!147244 (= e!98172 e!98173)))

(declare-fun res!123203 () Bool)

(assert (=> b!147244 (=> res!123203 e!98173)))

(assert (=> b!147244 (= res!123203 (= (size!3006 (buf!3461 lt!228246)) #b00000000000000000000000000000000))))

(declare-fun b!147245 () Bool)

(assert (=> b!147245 (= e!98173 (arrayBitRangesEq!0 (buf!3461 lt!228246) (buf!3461 lt!228246) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 lt!228246)) (currentByte!6363 lt!228246) (currentBit!6358 lt!228246))))))

(assert (= (and d!47646 res!123202) b!147243))

(assert (= (and b!147243 res!123201) b!147244))

(assert (= (and b!147244 (not res!123203)) b!147245))

(declare-fun m!227789 () Bool)

(assert (=> b!147243 m!227789))

(assert (=> b!147243 m!227789))

(assert (=> b!147245 m!227789))

(assert (=> b!147245 m!227789))

(declare-fun m!227791 () Bool)

(assert (=> b!147245 m!227791))

(assert (=> d!47317 d!47646))

(declare-fun d!47648 () Bool)

(assert (=> d!47648 (isPrefixOf!0 lt!228246 lt!228246)))

(declare-fun lt!229131 () Unit!9197)

(assert (=> d!47648 (= lt!229131 (choose!11 lt!228246))))

(assert (=> d!47648 (= (lemmaIsPrefixRefl!0 lt!228246) lt!229131)))

(declare-fun bs!11658 () Bool)

(assert (= bs!11658 d!47648))

(assert (=> bs!11658 m!226885))

(declare-fun m!227793 () Bool)

(assert (=> bs!11658 m!227793))

(assert (=> d!47317 d!47648))

(declare-fun d!47650 () Bool)

(declare-fun res!123205 () Bool)

(declare-fun e!98174 () Bool)

(assert (=> d!47650 (=> (not res!123205) (not e!98174))))

(assert (=> d!47650 (= res!123205 (= (size!3006 (buf!3461 (_1!6909 lt!228255))) (size!3006 (buf!3461 (_2!6909 lt!228255)))))))

(assert (=> d!47650 (= (isPrefixOf!0 (_1!6909 lt!228255) (_2!6909 lt!228255)) e!98174)))

(declare-fun b!147246 () Bool)

(declare-fun res!123204 () Bool)

(assert (=> b!147246 (=> (not res!123204) (not e!98174))))

(assert (=> b!147246 (= res!123204 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228255))) (currentByte!6363 (_1!6909 lt!228255)) (currentBit!6358 (_1!6909 lt!228255))) (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228255))) (currentByte!6363 (_2!6909 lt!228255)) (currentBit!6358 (_2!6909 lt!228255)))))))

(declare-fun b!147247 () Bool)

(declare-fun e!98175 () Bool)

(assert (=> b!147247 (= e!98174 e!98175)))

(declare-fun res!123206 () Bool)

(assert (=> b!147247 (=> res!123206 e!98175)))

(assert (=> b!147247 (= res!123206 (= (size!3006 (buf!3461 (_1!6909 lt!228255))) #b00000000000000000000000000000000))))

(declare-fun b!147248 () Bool)

(assert (=> b!147248 (= e!98175 (arrayBitRangesEq!0 (buf!3461 (_1!6909 lt!228255)) (buf!3461 (_2!6909 lt!228255)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228255))) (currentByte!6363 (_1!6909 lt!228255)) (currentBit!6358 (_1!6909 lt!228255)))))))

(assert (= (and d!47650 res!123205) b!147246))

(assert (= (and b!147246 res!123204) b!147247))

(assert (= (and b!147247 (not res!123206)) b!147248))

(assert (=> b!147246 m!227625))

(assert (=> b!147246 m!227503))

(assert (=> b!147248 m!227625))

(assert (=> b!147248 m!227625))

(declare-fun m!227795 () Bool)

(assert (=> b!147248 m!227795))

(assert (=> d!47317 d!47650))

(declare-fun d!47652 () Bool)

(declare-fun res!123208 () Bool)

(declare-fun e!98176 () Bool)

(assert (=> d!47652 (=> (not res!123208) (not e!98176))))

(assert (=> d!47652 (= res!123208 (= (size!3006 (buf!3461 lt!228246)) (size!3006 (buf!3461 (_2!6907 lt!228035)))))))

(assert (=> d!47652 (= (isPrefixOf!0 lt!228246 (_2!6907 lt!228035)) e!98176)))

(declare-fun b!147249 () Bool)

(declare-fun res!123207 () Bool)

(assert (=> b!147249 (=> (not res!123207) (not e!98176))))

(assert (=> b!147249 (= res!123207 (bvsle (bitIndex!0 (size!3006 (buf!3461 lt!228246)) (currentByte!6363 lt!228246) (currentBit!6358 lt!228246)) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035)))))))

(declare-fun b!147250 () Bool)

(declare-fun e!98177 () Bool)

(assert (=> b!147250 (= e!98176 e!98177)))

(declare-fun res!123209 () Bool)

(assert (=> b!147250 (=> res!123209 e!98177)))

(assert (=> b!147250 (= res!123209 (= (size!3006 (buf!3461 lt!228246)) #b00000000000000000000000000000000))))

(declare-fun b!147251 () Bool)

(assert (=> b!147251 (= e!98177 (arrayBitRangesEq!0 (buf!3461 lt!228246) (buf!3461 (_2!6907 lt!228035)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 lt!228246)) (currentByte!6363 lt!228246) (currentBit!6358 lt!228246))))))

(assert (= (and d!47652 res!123208) b!147249))

(assert (= (and b!147249 res!123207) b!147250))

(assert (= (and b!147250 (not res!123209)) b!147251))

(assert (=> b!147249 m!227789))

(assert (=> b!147249 m!226749))

(assert (=> b!147251 m!227789))

(assert (=> b!147251 m!227789))

(declare-fun m!227797 () Bool)

(assert (=> b!147251 m!227797))

(assert (=> d!47317 d!47652))

(assert (=> d!47317 d!47576))

(declare-fun lt!229133 () tuple4!138)

(declare-fun b!147252 () Bool)

(declare-fun e!98183 () Bool)

(assert (=> b!147252 (= e!98183 (arrayRangesEq!322 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228035)) (_1!6918 lt!229133) (_2!6918 lt!229133)))))

(declare-fun d!47654 () Bool)

(declare-fun res!123212 () Bool)

(declare-fun e!98182 () Bool)

(assert (=> d!47654 (=> res!123212 e!98182)))

(assert (=> d!47654 (= res!123212 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(assert (=> d!47654 (= (arrayBitRangesEq!0 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228035)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) e!98182)))

(declare-fun b!147253 () Bool)

(declare-fun res!123214 () Bool)

(declare-fun lt!229132 () (_ BitVec 32))

(assert (=> b!147253 (= res!123214 (= lt!229132 #b00000000000000000000000000000000))))

(declare-fun e!98181 () Bool)

(assert (=> b!147253 (=> res!123214 e!98181)))

(declare-fun e!98179 () Bool)

(assert (=> b!147253 (= e!98179 e!98181)))

(declare-fun b!147254 () Bool)

(declare-fun e!98178 () Bool)

(assert (=> b!147254 (= e!98182 e!98178)))

(declare-fun res!123213 () Bool)

(assert (=> b!147254 (=> (not res!123213) (not e!98178))))

(assert (=> b!147254 (= res!123213 e!98183)))

(declare-fun res!123211 () Bool)

(assert (=> b!147254 (=> res!123211 e!98183)))

(assert (=> b!147254 (= res!123211 (bvsge (_1!6918 lt!229133) (_2!6918 lt!229133)))))

(assert (=> b!147254 (= lt!229132 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!229134 () (_ BitVec 32))

(assert (=> b!147254 (= lt!229134 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147254 (= lt!229133 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(declare-fun b!147255 () Bool)

(declare-fun e!98180 () Bool)

(assert (=> b!147255 (= e!98180 e!98179)))

(declare-fun res!123210 () Bool)

(assert (=> b!147255 (= res!123210 (byteRangesEq!0 (select (arr!3760 (buf!3461 thiss!1634)) (_3!357 lt!229133)) (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_3!357 lt!229133)) lt!229134 #b00000000000000000000000000001000))))

(assert (=> b!147255 (=> (not res!123210) (not e!98179))))

(declare-fun b!147256 () Bool)

(assert (=> b!147256 (= e!98178 e!98180)))

(declare-fun c!7976 () Bool)

(assert (=> b!147256 (= c!7976 (= (_3!357 lt!229133) (_4!69 lt!229133)))))

(declare-fun b!147257 () Bool)

(declare-fun call!1970 () Bool)

(assert (=> b!147257 (= e!98180 call!1970)))

(declare-fun b!147258 () Bool)

(assert (=> b!147258 (= e!98181 call!1970)))

(declare-fun bm!1967 () Bool)

(assert (=> bm!1967 (= call!1970 (byteRangesEq!0 (ite c!7976 (select (arr!3760 (buf!3461 thiss!1634)) (_3!357 lt!229133)) (select (arr!3760 (buf!3461 thiss!1634)) (_4!69 lt!229133))) (ite c!7976 (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_3!357 lt!229133)) (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_4!69 lt!229133))) (ite c!7976 lt!229134 #b00000000000000000000000000000000) lt!229132))))

(assert (= (and d!47654 (not res!123212)) b!147254))

(assert (= (and b!147254 (not res!123211)) b!147252))

(assert (= (and b!147254 res!123213) b!147256))

(assert (= (and b!147256 c!7976) b!147257))

(assert (= (and b!147256 (not c!7976)) b!147255))

(assert (= (and b!147255 res!123210) b!147253))

(assert (= (and b!147253 (not res!123214)) b!147258))

(assert (= (or b!147257 b!147258) bm!1967))

(declare-fun m!227799 () Bool)

(assert (=> b!147252 m!227799))

(assert (=> b!147254 m!226687))

(assert (=> b!147254 m!227705))

(declare-fun m!227801 () Bool)

(assert (=> b!147255 m!227801))

(declare-fun m!227803 () Bool)

(assert (=> b!147255 m!227803))

(assert (=> b!147255 m!227801))

(assert (=> b!147255 m!227803))

(declare-fun m!227805 () Bool)

(assert (=> b!147255 m!227805))

(assert (=> bm!1967 m!227803))

(declare-fun m!227807 () Bool)

(assert (=> bm!1967 m!227807))

(assert (=> bm!1967 m!227801))

(declare-fun m!227809 () Bool)

(assert (=> bm!1967 m!227809))

(declare-fun m!227811 () Bool)

(assert (=> bm!1967 m!227811))

(assert (=> b!146931 d!47654))

(assert (=> b!146931 d!47325))

(declare-fun d!47656 () Bool)

(declare-fun e!98184 () Bool)

(assert (=> d!47656 e!98184))

(declare-fun res!123215 () Bool)

(assert (=> d!47656 (=> (not res!123215) (not e!98184))))

(declare-fun lt!229140 () (_ BitVec 64))

(declare-fun lt!229139 () (_ BitVec 64))

(declare-fun lt!229138 () (_ BitVec 64))

(assert (=> d!47656 (= res!123215 (= lt!229139 (bvsub lt!229140 lt!229138)))))

(assert (=> d!47656 (or (= (bvand lt!229140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229138 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!229140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!229140 lt!229138) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47656 (= lt!229138 (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228528)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228528))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228528)))))))

(declare-fun lt!229137 () (_ BitVec 64))

(declare-fun lt!229136 () (_ BitVec 64))

(assert (=> d!47656 (= lt!229140 (bvmul lt!229137 lt!229136))))

(assert (=> d!47656 (or (= lt!229137 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!229136 (bvsdiv (bvmul lt!229137 lt!229136) lt!229137)))))

(assert (=> d!47656 (= lt!229136 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47656 (= lt!229137 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228528)))))))

(assert (=> d!47656 (= lt!229139 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228528))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228528)))))))

(assert (=> d!47656 (invariant!0 (currentBit!6358 (_2!6907 lt!228528)) (currentByte!6363 (_2!6907 lt!228528)) (size!3006 (buf!3461 (_2!6907 lt!228528))))))

(assert (=> d!47656 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228528))) (currentByte!6363 (_2!6907 lt!228528)) (currentBit!6358 (_2!6907 lt!228528))) lt!229139)))

(declare-fun b!147259 () Bool)

(declare-fun res!123216 () Bool)

(assert (=> b!147259 (=> (not res!123216) (not e!98184))))

(assert (=> b!147259 (= res!123216 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!229139))))

(declare-fun b!147260 () Bool)

(declare-fun lt!229135 () (_ BitVec 64))

(assert (=> b!147260 (= e!98184 (bvsle lt!229139 (bvmul lt!229135 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147260 (or (= lt!229135 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!229135 #b0000000000000000000000000000000000000000000000000000000000001000) lt!229135)))))

(assert (=> b!147260 (= lt!229135 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228528)))))))

(assert (= (and d!47656 res!123215) b!147259))

(assert (= (and b!147259 res!123216) b!147260))

(declare-fun m!227813 () Bool)

(assert (=> d!47656 m!227813))

(declare-fun m!227815 () Bool)

(assert (=> d!47656 m!227815))

(assert (=> b!146990 d!47656))

(assert (=> b!146990 d!47325))

(declare-fun b!147271 () Bool)

(declare-fun res!123225 () Bool)

(declare-fun e!98196 () Bool)

(assert (=> b!147271 (=> (not res!123225) (not e!98196))))

(declare-fun _$39!48 () tuple2!13106)

(assert (=> b!147271 (= res!123225 (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 _$39!48)))))

(declare-fun b!147273 () Bool)

(declare-fun e!98193 () Bool)

(assert (=> b!147273 (= e!98196 e!98193)))

(declare-fun res!123227 () Bool)

(assert (=> b!147273 (=> (not res!123227) (not e!98193))))

(declare-fun lt!229153 () tuple2!13110)

(declare-fun lt!229155 () tuple2!13112)

(assert (=> b!147273 (= res!123227 (and (= (size!3006 (_2!6910 lt!229155)) (size!3006 arr!237)) (= (_1!6910 lt!229155) (_2!6909 lt!229153))))))

(assert (=> b!147273 (= lt!229155 (readByteArrayLoopPure!0 (_1!6909 lt!229153) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229152 () Unit!9197)

(declare-fun lt!229154 () Unit!9197)

(assert (=> b!147273 (= lt!229152 lt!229154)))

(declare-fun lt!229151 () (_ BitVec 64))

(assert (=> b!147273 (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 _$39!48)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!229151)))

(assert (=> b!147273 (= lt!229154 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6907 lt!228045) (buf!3461 (_2!6907 _$39!48)) lt!229151))))

(assert (=> b!147273 (= lt!229151 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!147273 (= lt!229153 (reader!0 (_2!6907 lt!228045) (_2!6907 _$39!48)))))

(declare-fun b!147274 () Bool)

(assert (=> b!147274 (= e!98193 (arrayRangesEq!322 arr!237 (_2!6910 lt!229155) #b00000000000000000000000000000000 to!404))))

(declare-fun b!147275 () Bool)

(declare-fun e!98194 () Bool)

(assert (=> b!147275 (= e!98194 (array_inv!2795 (buf!3461 (_2!6907 _$39!48))))))

(declare-fun b!147272 () Bool)

(declare-fun res!123226 () Bool)

(assert (=> b!147272 (=> (not res!123226) (not e!98196))))

(assert (=> b!147272 (= res!123226 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6907 _$39!48))) (currentByte!6363 (_2!6907 _$39!48)) (currentBit!6358 (_2!6907 _$39!48))) (bvadd (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun d!47658 () Bool)

(assert (=> d!47658 e!98196))

(declare-fun res!123228 () Bool)

(assert (=> d!47658 (=> (not res!123228) (not e!98196))))

(assert (=> d!47658 (= res!123228 (= (size!3006 (buf!3461 (_2!6907 lt!228045))) (size!3006 (buf!3461 (_2!6907 _$39!48)))))))

(assert (=> d!47658 (and (inv!12 (_2!6907 _$39!48)) e!98194)))

(assert (=> d!47658 (= (choose!64 (_2!6907 lt!228045) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!48)))

(assert (= d!47658 b!147275))

(assert (= (and d!47658 res!123228) b!147272))

(assert (= (and b!147272 res!123226) b!147271))

(assert (= (and b!147271 res!123225) b!147273))

(assert (= (and b!147273 res!123227) b!147274))

(declare-fun m!227817 () Bool)

(assert (=> b!147275 m!227817))

(declare-fun m!227819 () Bool)

(assert (=> b!147272 m!227819))

(assert (=> b!147272 m!226685))

(declare-fun m!227821 () Bool)

(assert (=> b!147271 m!227821))

(declare-fun m!227823 () Bool)

(assert (=> b!147274 m!227823))

(declare-fun m!227825 () Bool)

(assert (=> b!147273 m!227825))

(declare-fun m!227827 () Bool)

(assert (=> b!147273 m!227827))

(declare-fun m!227829 () Bool)

(assert (=> b!147273 m!227829))

(declare-fun m!227831 () Bool)

(assert (=> b!147273 m!227831))

(declare-fun m!227833 () Bool)

(assert (=> d!47658 m!227833))

(assert (=> d!47367 d!47658))

(declare-fun d!47660 () Bool)

(assert (=> d!47660 (= (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228035))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228035)))) (bvsub (bvmul ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228035))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228035))))))))

(assert (=> d!47295 d!47660))

(declare-fun d!47662 () Bool)

(assert (=> d!47662 (= (invariant!0 (currentBit!6358 (_2!6907 lt!228035)) (currentByte!6363 (_2!6907 lt!228035)) (size!3006 (buf!3461 (_2!6907 lt!228035)))) (and (bvsge (currentBit!6358 (_2!6907 lt!228035)) #b00000000000000000000000000000000) (bvslt (currentBit!6358 (_2!6907 lt!228035)) #b00000000000000000000000000001000) (bvsge (currentByte!6363 (_2!6907 lt!228035)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6363 (_2!6907 lt!228035)) (size!3006 (buf!3461 (_2!6907 lt!228035)))) (and (= (currentBit!6358 (_2!6907 lt!228035)) #b00000000000000000000000000000000) (= (currentByte!6363 (_2!6907 lt!228035)) (size!3006 (buf!3461 (_2!6907 lt!228035))))))))))

(assert (=> d!47295 d!47662))

(declare-fun d!47664 () Bool)

(assert (=> d!47664 (= (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 thiss!1634)))))))

(assert (=> d!47361 d!47664))

(declare-fun d!47666 () Bool)

(assert (=> d!47666 (= (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045)))) (bvsub (bvmul ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))))))))

(assert (=> d!47417 d!47666))

(declare-fun d!47668 () Bool)

(assert (=> d!47668 (= (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 thiss!1634))) ((_ sign_extend 32) (currentByte!6363 thiss!1634)) ((_ sign_extend 32) (currentBit!6358 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3006 (buf!3461 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 thiss!1634)))))))

(assert (=> d!47325 d!47668))

(assert (=> d!47325 d!47291))

(declare-fun d!47670 () Bool)

(declare-fun e!98199 () Bool)

(assert (=> d!47670 e!98199))

(declare-fun res!123231 () Bool)

(assert (=> d!47670 (=> (not res!123231) (not e!98199))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5270 (_ BitVec 32)) Bool)

(assert (=> d!47670 (= res!123231 (moveByteIndexPrecond!0 (_1!6909 lt!228034) #b00000000000000000000000000000001))))

(declare-fun Unit!9246 () Unit!9197)

(assert (=> d!47670 (= (moveByteIndex!0 (_1!6909 lt!228034) #b00000000000000000000000000000001) (tuple2!13107 Unit!9246 (BitStream!5271 (buf!3461 (_1!6909 lt!228034)) (bvadd (currentByte!6363 (_1!6909 lt!228034)) #b00000000000000000000000000000001) (currentBit!6358 (_1!6909 lt!228034)))))))

(declare-fun b!147278 () Bool)

(assert (=> b!147278 (= e!98199 (and (or (not (= (bvand (currentByte!6363 (_1!6909 lt!228034)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6363 (_1!6909 lt!228034)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6363 (_1!6909 lt!228034)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6363 (_1!6909 lt!228034)) #b00000000000000000000000000000001) (bvadd (currentByte!6363 (_1!6909 lt!228034)) #b00000000000000000000000000000001))))))

(assert (= (and d!47670 res!123231) b!147278))

(declare-fun m!227835 () Bool)

(assert (=> d!47670 m!227835))

(assert (=> d!47365 d!47670))

(declare-fun d!47672 () Bool)

(assert (=> d!47672 (= (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228031)))) ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228031))) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228031)))) (bvsub (bvmul ((_ sign_extend 32) (size!3006 (buf!3461 (_1!6908 lt!228031)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6363 (_1!6908 lt!228031))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6358 (_1!6908 lt!228031))))))))

(assert (=> d!47343 d!47672))

(declare-fun d!47674 () Bool)

(assert (=> d!47674 (= (invariant!0 (currentBit!6358 (_1!6908 lt!228031)) (currentByte!6363 (_1!6908 lt!228031)) (size!3006 (buf!3461 (_1!6908 lt!228031)))) (and (bvsge (currentBit!6358 (_1!6908 lt!228031)) #b00000000000000000000000000000000) (bvslt (currentBit!6358 (_1!6908 lt!228031)) #b00000000000000000000000000001000) (bvsge (currentByte!6363 (_1!6908 lt!228031)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6363 (_1!6908 lt!228031)) (size!3006 (buf!3461 (_1!6908 lt!228031)))) (and (= (currentBit!6358 (_1!6908 lt!228031)) #b00000000000000000000000000000000) (= (currentByte!6363 (_1!6908 lt!228031)) (size!3006 (buf!3461 (_1!6908 lt!228031))))))))))

(assert (=> d!47343 d!47674))

(declare-fun lt!229156 () (_ BitVec 8))

(declare-fun d!47676 () Bool)

(declare-fun lt!229160 () (_ BitVec 8))

(assert (=> d!47676 (= lt!229160 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3760 (buf!3461 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))) (currentByte!6363 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))) ((_ sign_extend 24) lt!229156))))))

(assert (=> d!47676 (= lt!229156 ((_ extract 7 0) (currentBit!6358 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))))

(declare-fun e!98200 () Bool)

(assert (=> d!47676 e!98200))

(declare-fun res!123233 () Bool)

(assert (=> d!47676 (=> (not res!123233) (not e!98200))))

(assert (=> d!47676 (= res!123233 (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))) ((_ sign_extend 32) (currentByte!6363 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))) ((_ sign_extend 32) (currentBit!6358 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9247 () Unit!9197)

(declare-fun Unit!9248 () Unit!9197)

(assert (=> d!47676 (= (readByte!0 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) (tuple2!13117 (_2!6917 (ite (bvsgt ((_ sign_extend 24) lt!229156) #b00000000000000000000000000000000) (tuple2!13121 Unit!9247 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229160) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3760 (buf!3461 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))) (bvadd (currentByte!6363 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229156)))))))) (tuple2!13121 Unit!9248 lt!229160))) (BitStream!5271 (buf!3461 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) (bvadd (currentByte!6363 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6358 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))))

(declare-fun b!147279 () Bool)

(declare-fun e!98201 () Bool)

(assert (=> b!147279 (= e!98200 e!98201)))

(declare-fun res!123232 () Bool)

(assert (=> b!147279 (=> (not res!123232) (not e!98201))))

(declare-fun lt!229157 () tuple2!13116)

(assert (=> b!147279 (= res!123232 (= (buf!3461 (_2!6914 lt!229157)) (buf!3461 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))))

(declare-fun lt!229161 () (_ BitVec 8))

(declare-fun lt!229162 () (_ BitVec 8))

(declare-fun Unit!9249 () Unit!9197)

(declare-fun Unit!9250 () Unit!9197)

(assert (=> b!147279 (= lt!229157 (tuple2!13117 (_2!6917 (ite (bvsgt ((_ sign_extend 24) lt!229161) #b00000000000000000000000000000000) (tuple2!13121 Unit!9249 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229162) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3760 (buf!3461 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))) (bvadd (currentByte!6363 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229161)))))))) (tuple2!13121 Unit!9250 lt!229162))) (BitStream!5271 (buf!3461 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) (bvadd (currentByte!6363 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6358 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))))

(assert (=> b!147279 (= lt!229162 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3760 (buf!3461 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))) (currentByte!6363 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))) ((_ sign_extend 24) lt!229161))))))

(assert (=> b!147279 (= lt!229161 ((_ extract 7 0) (currentBit!6358 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))))

(declare-fun lt!229158 () (_ BitVec 64))

(declare-fun lt!229159 () (_ BitVec 64))

(declare-fun b!147280 () Bool)

(assert (=> b!147280 (= e!98201 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!229157))) (currentByte!6363 (_2!6914 lt!229157)) (currentBit!6358 (_2!6914 lt!229157))) (bvadd lt!229159 lt!229158)))))

(assert (=> b!147280 (or (not (= (bvand lt!229159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229158 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229159 lt!229158) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147280 (= lt!229158 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!147280 (= lt!229159 (bitIndex!0 (size!3006 (buf!3461 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))) (currentByte!6363 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))) (currentBit!6358 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634)))))))

(assert (= (and d!47676 res!123233) b!147279))

(assert (= (and b!147279 res!123232) b!147280))

(declare-fun m!227837 () Bool)

(assert (=> d!47676 m!227837))

(declare-fun m!227839 () Bool)

(assert (=> d!47676 m!227839))

(declare-fun m!227841 () Bool)

(assert (=> d!47676 m!227841))

(assert (=> b!147279 m!227841))

(assert (=> b!147279 m!227837))

(declare-fun m!227843 () Bool)

(assert (=> b!147280 m!227843))

(declare-fun m!227845 () Bool)

(assert (=> b!147280 m!227845))

(assert (=> d!47435 d!47676))

(declare-fun d!47678 () Bool)

(declare-fun lt!229167 () (_ BitVec 8))

(declare-fun lt!229163 () (_ BitVec 8))

(assert (=> d!47678 (= lt!229167 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3760 (buf!3461 lt!228048)) (currentByte!6363 lt!228048))) ((_ sign_extend 24) lt!229163))))))

(assert (=> d!47678 (= lt!229163 ((_ extract 7 0) (currentBit!6358 lt!228048)))))

(declare-fun e!98202 () Bool)

(assert (=> d!47678 e!98202))

(declare-fun res!123235 () Bool)

(assert (=> d!47678 (=> (not res!123235) (not e!98202))))

(assert (=> d!47678 (= res!123235 (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 lt!228048))) ((_ sign_extend 32) (currentByte!6363 lt!228048)) ((_ sign_extend 32) (currentBit!6358 lt!228048)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9251 () Unit!9197)

(declare-fun Unit!9252 () Unit!9197)

(assert (=> d!47678 (= (readByte!0 lt!228048) (tuple2!13117 (_2!6917 (ite (bvsgt ((_ sign_extend 24) lt!229163) #b00000000000000000000000000000000) (tuple2!13121 Unit!9251 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229167) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3760 (buf!3461 lt!228048)) (bvadd (currentByte!6363 lt!228048) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229163)))))))) (tuple2!13121 Unit!9252 lt!229167))) (BitStream!5271 (buf!3461 lt!228048) (bvadd (currentByte!6363 lt!228048) #b00000000000000000000000000000001) (currentBit!6358 lt!228048))))))

(declare-fun b!147281 () Bool)

(declare-fun e!98203 () Bool)

(assert (=> b!147281 (= e!98202 e!98203)))

(declare-fun res!123234 () Bool)

(assert (=> b!147281 (=> (not res!123234) (not e!98203))))

(declare-fun lt!229164 () tuple2!13116)

(assert (=> b!147281 (= res!123234 (= (buf!3461 (_2!6914 lt!229164)) (buf!3461 lt!228048)))))

(declare-fun lt!229168 () (_ BitVec 8))

(declare-fun lt!229169 () (_ BitVec 8))

(declare-fun Unit!9253 () Unit!9197)

(declare-fun Unit!9254 () Unit!9197)

(assert (=> b!147281 (= lt!229164 (tuple2!13117 (_2!6917 (ite (bvsgt ((_ sign_extend 24) lt!229168) #b00000000000000000000000000000000) (tuple2!13121 Unit!9253 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!229169) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3760 (buf!3461 lt!228048)) (bvadd (currentByte!6363 lt!228048) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!229168)))))))) (tuple2!13121 Unit!9254 lt!229169))) (BitStream!5271 (buf!3461 lt!228048) (bvadd (currentByte!6363 lt!228048) #b00000000000000000000000000000001) (currentBit!6358 lt!228048))))))

(assert (=> b!147281 (= lt!229169 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3760 (buf!3461 lt!228048)) (currentByte!6363 lt!228048))) ((_ sign_extend 24) lt!229168))))))

(assert (=> b!147281 (= lt!229168 ((_ extract 7 0) (currentBit!6358 lt!228048)))))

(declare-fun lt!229166 () (_ BitVec 64))

(declare-fun b!147282 () Bool)

(declare-fun lt!229165 () (_ BitVec 64))

(assert (=> b!147282 (= e!98203 (= (bitIndex!0 (size!3006 (buf!3461 (_2!6914 lt!229164))) (currentByte!6363 (_2!6914 lt!229164)) (currentBit!6358 (_2!6914 lt!229164))) (bvadd lt!229166 lt!229165)))))

(assert (=> b!147282 (or (not (= (bvand lt!229166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!229165 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229166 lt!229165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!147282 (= lt!229165 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!147282 (= lt!229166 (bitIndex!0 (size!3006 (buf!3461 lt!228048)) (currentByte!6363 lt!228048) (currentBit!6358 lt!228048)))))

(assert (= (and d!47678 res!123235) b!147281))

(assert (= (and b!147281 res!123234) b!147282))

(declare-fun m!227847 () Bool)

(assert (=> d!47678 m!227847))

(declare-fun m!227849 () Bool)

(assert (=> d!47678 m!227849))

(declare-fun m!227851 () Bool)

(assert (=> d!47678 m!227851))

(assert (=> b!147281 m!227851))

(assert (=> b!147281 m!227847))

(declare-fun m!227853 () Bool)

(assert (=> b!147282 m!227853))

(declare-fun m!227855 () Bool)

(assert (=> b!147282 m!227855))

(assert (=> d!47427 d!47678))

(assert (=> d!47301 d!47666))

(declare-fun d!47680 () Bool)

(assert (=> d!47680 (= (invariant!0 (currentBit!6358 (_2!6907 lt!228045)) (currentByte!6363 (_2!6907 lt!228045)) (size!3006 (buf!3461 (_2!6907 lt!228045)))) (and (bvsge (currentBit!6358 (_2!6907 lt!228045)) #b00000000000000000000000000000000) (bvslt (currentBit!6358 (_2!6907 lt!228045)) #b00000000000000000000000000001000) (bvsge (currentByte!6363 (_2!6907 lt!228045)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6363 (_2!6907 lt!228045)) (size!3006 (buf!3461 (_2!6907 lt!228045)))) (and (= (currentBit!6358 (_2!6907 lt!228045)) #b00000000000000000000000000000000) (= (currentByte!6363 (_2!6907 lt!228045)) (size!3006 (buf!3461 (_2!6907 lt!228045))))))))))

(assert (=> d!47301 d!47680))

(declare-fun d!47682 () Bool)

(declare-fun res!123236 () Bool)

(declare-fun e!98204 () Bool)

(assert (=> d!47682 (=> res!123236 e!98204)))

(assert (=> d!47682 (= res!123236 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47682 (= (arrayRangesEq!322 (_2!6910 lt!228052) (_2!6910 lt!228046) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!98204)))

(declare-fun b!147283 () Bool)

(declare-fun e!98205 () Bool)

(assert (=> b!147283 (= e!98204 e!98205)))

(declare-fun res!123237 () Bool)

(assert (=> b!147283 (=> (not res!123237) (not e!98205))))

(assert (=> b!147283 (= res!123237 (= (select (arr!3760 (_2!6910 lt!228052)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3760 (_2!6910 lt!228046)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!147284 () Bool)

(assert (=> b!147284 (= e!98205 (arrayRangesEq!322 (_2!6910 lt!228052) (_2!6910 lt!228046) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47682 (not res!123236)) b!147283))

(assert (= (and b!147283 res!123237) b!147284))

(assert (=> b!147283 m!227721))

(declare-fun m!227857 () Bool)

(assert (=> b!147283 m!227857))

(declare-fun m!227859 () Bool)

(assert (=> b!147284 m!227859))

(assert (=> b!146901 d!47682))

(assert (=> d!47423 d!47363))

(declare-fun d!47684 () Bool)

(assert (=> d!47684 (isPrefixOf!0 thiss!1634 (_2!6907 lt!228035))))

(assert (=> d!47684 true))

(declare-fun _$15!234 () Unit!9197)

(assert (=> d!47684 (= (choose!30 thiss!1634 (_2!6907 lt!228045) (_2!6907 lt!228035)) _$15!234)))

(declare-fun bs!11659 () Bool)

(assert (= bs!11659 d!47684))

(assert (=> bs!11659 m!226705))

(assert (=> d!47423 d!47684))

(assert (=> d!47423 d!47293))

(assert (=> d!47315 d!47313))

(declare-fun d!47686 () Bool)

(assert (=> d!47686 (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228035)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228033)))

(assert (=> d!47686 true))

(declare-fun _$6!313 () Unit!9197)

(assert (=> d!47686 (= (choose!9 (_2!6907 lt!228045) (buf!3461 (_2!6907 lt!228035)) lt!228033 (BitStream!5271 (buf!3461 (_2!6907 lt!228035)) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))) _$6!313)))

(declare-fun bs!11660 () Bool)

(assert (= bs!11660 d!47686))

(assert (=> bs!11660 m!226673))

(assert (=> d!47315 d!47686))

(assert (=> b!146878 d!47301))

(declare-fun d!47688 () Bool)

(assert (=> d!47688 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228035)) (buf!3461 (_2!6907 lt!228045)) lt!228263 lt!228247)))

(declare-fun lt!229170 () Unit!9197)

(assert (=> d!47688 (= lt!229170 (choose!8 (buf!3461 (_2!6907 lt!228045)) (buf!3461 (_2!6907 lt!228035)) lt!228263 lt!228247))))

(assert (=> d!47688 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228263) (bvsle lt!228263 lt!228247))))

(assert (=> d!47688 (= (arrayBitRangesEqSymmetric!0 (buf!3461 (_2!6907 lt!228045)) (buf!3461 (_2!6907 lt!228035)) lt!228263 lt!228247) lt!229170)))

(declare-fun bs!11661 () Bool)

(assert (= bs!11661 d!47688))

(assert (=> bs!11661 m!226861))

(declare-fun m!227861 () Bool)

(assert (=> bs!11661 m!227861))

(assert (=> b!146878 d!47688))

(declare-fun lt!229172 () tuple4!138)

(declare-fun b!147285 () Bool)

(declare-fun e!98211 () Bool)

(assert (=> b!147285 (= e!98211 (arrayRangesEq!322 (buf!3461 (_2!6907 lt!228035)) (buf!3461 (_2!6907 lt!228045)) (_1!6918 lt!229172) (_2!6918 lt!229172)))))

(declare-fun d!47690 () Bool)

(declare-fun res!123240 () Bool)

(declare-fun e!98210 () Bool)

(assert (=> d!47690 (=> res!123240 e!98210)))

(assert (=> d!47690 (= res!123240 (bvsge lt!228263 lt!228247))))

(assert (=> d!47690 (= (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228035)) (buf!3461 (_2!6907 lt!228045)) lt!228263 lt!228247) e!98210)))

(declare-fun b!147286 () Bool)

(declare-fun res!123242 () Bool)

(declare-fun lt!229171 () (_ BitVec 32))

(assert (=> b!147286 (= res!123242 (= lt!229171 #b00000000000000000000000000000000))))

(declare-fun e!98209 () Bool)

(assert (=> b!147286 (=> res!123242 e!98209)))

(declare-fun e!98207 () Bool)

(assert (=> b!147286 (= e!98207 e!98209)))

(declare-fun b!147287 () Bool)

(declare-fun e!98206 () Bool)

(assert (=> b!147287 (= e!98210 e!98206)))

(declare-fun res!123241 () Bool)

(assert (=> b!147287 (=> (not res!123241) (not e!98206))))

(assert (=> b!147287 (= res!123241 e!98211)))

(declare-fun res!123239 () Bool)

(assert (=> b!147287 (=> res!123239 e!98211)))

(assert (=> b!147287 (= res!123239 (bvsge (_1!6918 lt!229172) (_2!6918 lt!229172)))))

(assert (=> b!147287 (= lt!229171 ((_ extract 31 0) (bvsrem lt!228247 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!229173 () (_ BitVec 32))

(assert (=> b!147287 (= lt!229173 ((_ extract 31 0) (bvsrem lt!228263 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147287 (= lt!229172 (arrayBitIndices!0 lt!228263 lt!228247))))

(declare-fun b!147288 () Bool)

(declare-fun e!98208 () Bool)

(assert (=> b!147288 (= e!98208 e!98207)))

(declare-fun res!123238 () Bool)

(assert (=> b!147288 (= res!123238 (byteRangesEq!0 (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_3!357 lt!229172)) (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_3!357 lt!229172)) lt!229173 #b00000000000000000000000000001000))))

(assert (=> b!147288 (=> (not res!123238) (not e!98207))))

(declare-fun b!147289 () Bool)

(assert (=> b!147289 (= e!98206 e!98208)))

(declare-fun c!7977 () Bool)

(assert (=> b!147289 (= c!7977 (= (_3!357 lt!229172) (_4!69 lt!229172)))))

(declare-fun b!147290 () Bool)

(declare-fun call!1971 () Bool)

(assert (=> b!147290 (= e!98208 call!1971)))

(declare-fun b!147291 () Bool)

(assert (=> b!147291 (= e!98209 call!1971)))

(declare-fun bm!1968 () Bool)

(assert (=> bm!1968 (= call!1971 (byteRangesEq!0 (ite c!7977 (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_3!357 lt!229172)) (select (arr!3760 (buf!3461 (_2!6907 lt!228035))) (_4!69 lt!229172))) (ite c!7977 (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_3!357 lt!229172)) (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_4!69 lt!229172))) (ite c!7977 lt!229173 #b00000000000000000000000000000000) lt!229171))))

(assert (= (and d!47690 (not res!123240)) b!147287))

(assert (= (and b!147287 (not res!123239)) b!147285))

(assert (= (and b!147287 res!123241) b!147289))

(assert (= (and b!147289 c!7977) b!147290))

(assert (= (and b!147289 (not c!7977)) b!147288))

(assert (= (and b!147288 res!123238) b!147286))

(assert (= (and b!147286 (not res!123242)) b!147291))

(assert (= (or b!147290 b!147291) bm!1968))

(declare-fun m!227863 () Bool)

(assert (=> b!147285 m!227863))

(declare-fun m!227865 () Bool)

(assert (=> b!147287 m!227865))

(declare-fun m!227867 () Bool)

(assert (=> b!147288 m!227867))

(declare-fun m!227869 () Bool)

(assert (=> b!147288 m!227869))

(assert (=> b!147288 m!227867))

(assert (=> b!147288 m!227869))

(declare-fun m!227871 () Bool)

(assert (=> b!147288 m!227871))

(assert (=> bm!1968 m!227869))

(declare-fun m!227873 () Bool)

(assert (=> bm!1968 m!227873))

(assert (=> bm!1968 m!227867))

(declare-fun m!227875 () Bool)

(assert (=> bm!1968 m!227875))

(declare-fun m!227877 () Bool)

(assert (=> bm!1968 m!227877))

(assert (=> b!146878 d!47690))

(declare-fun d!47692 () Bool)

(declare-fun res!123244 () Bool)

(declare-fun e!98212 () Bool)

(assert (=> d!47692 (=> (not res!123244) (not e!98212))))

(assert (=> d!47692 (= res!123244 (= (size!3006 (buf!3461 (_1!6909 lt!228507))) (size!3006 (buf!3461 thiss!1634))))))

(assert (=> d!47692 (= (isPrefixOf!0 (_1!6909 lt!228507) thiss!1634) e!98212)))

(declare-fun b!147292 () Bool)

(declare-fun res!123243 () Bool)

(assert (=> b!147292 (=> (not res!123243) (not e!98212))))

(assert (=> b!147292 (= res!123243 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228507))) (currentByte!6363 (_1!6909 lt!228507)) (currentBit!6358 (_1!6909 lt!228507))) (bitIndex!0 (size!3006 (buf!3461 thiss!1634)) (currentByte!6363 thiss!1634) (currentBit!6358 thiss!1634))))))

(declare-fun b!147293 () Bool)

(declare-fun e!98213 () Bool)

(assert (=> b!147293 (= e!98212 e!98213)))

(declare-fun res!123245 () Bool)

(assert (=> b!147293 (=> res!123245 e!98213)))

(assert (=> b!147293 (= res!123245 (= (size!3006 (buf!3461 (_1!6909 lt!228507))) #b00000000000000000000000000000000))))

(declare-fun b!147294 () Bool)

(assert (=> b!147294 (= e!98213 (arrayBitRangesEq!0 (buf!3461 (_1!6909 lt!228507)) (buf!3461 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_1!6909 lt!228507))) (currentByte!6363 (_1!6909 lt!228507)) (currentBit!6358 (_1!6909 lt!228507)))))))

(assert (= (and d!47692 res!123244) b!147292))

(assert (= (and b!147292 res!123243) b!147293))

(assert (= (and b!147293 (not res!123245)) b!147294))

(assert (=> b!147292 m!227773))

(assert (=> b!147292 m!226687))

(assert (=> b!147294 m!227773))

(assert (=> b!147294 m!227773))

(declare-fun m!227879 () Bool)

(assert (=> b!147294 m!227879))

(assert (=> b!146983 d!47692))

(assert (=> d!47337 d!47668))

(declare-fun d!47694 () Bool)

(assert (=> d!47694 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) lt!228463) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045)))) lt!228463))))

(declare-fun bs!11662 () Bool)

(assert (= bs!11662 d!47694))

(assert (=> bs!11662 m!226815))

(assert (=> b!146970 d!47694))

(declare-fun d!47696 () Bool)

(declare-fun e!98214 () Bool)

(assert (=> d!47696 e!98214))

(declare-fun res!123246 () Bool)

(assert (=> d!47696 (=> (not res!123246) (not e!98214))))

(declare-fun lt!229174 () BitStream!5270)

(declare-fun lt!229175 () (_ BitVec 64))

(assert (=> d!47696 (= res!123246 (= (bvadd lt!229175 (bvsub lt!228264 lt!228261)) (bitIndex!0 (size!3006 (buf!3461 lt!229174)) (currentByte!6363 lt!229174) (currentBit!6358 lt!229174))))))

(assert (=> d!47696 (or (not (= (bvand lt!229175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228264 lt!228261) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!229175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!229175 (bvsub lt!228264 lt!228261)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47696 (= lt!229175 (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228255))) (currentByte!6363 (_2!6909 lt!228255)) (currentBit!6358 (_2!6909 lt!228255))))))

(assert (=> d!47696 (= lt!229174 (_2!6907 (moveBitIndex!0 (_2!6909 lt!228255) (bvsub lt!228264 lt!228261))))))

(assert (=> d!47696 (moveBitIndexPrecond!0 (_2!6909 lt!228255) (bvsub lt!228264 lt!228261))))

(assert (=> d!47696 (= (withMovedBitIndex!0 (_2!6909 lt!228255) (bvsub lt!228264 lt!228261)) lt!229174)))

(declare-fun b!147295 () Bool)

(assert (=> b!147295 (= e!98214 (= (size!3006 (buf!3461 (_2!6909 lt!228255))) (size!3006 (buf!3461 lt!229174))))))

(assert (= (and d!47696 res!123246) b!147295))

(declare-fun m!227881 () Bool)

(assert (=> d!47696 m!227881))

(assert (=> d!47696 m!227503))

(declare-fun m!227883 () Bool)

(assert (=> d!47696 m!227883))

(declare-fun m!227885 () Bool)

(assert (=> d!47696 m!227885))

(assert (=> b!146880 d!47696))

(assert (=> b!146880 d!47295))

(assert (=> b!146880 d!47301))

(declare-fun d!47698 () Bool)

(declare-fun res!123248 () Bool)

(declare-fun e!98215 () Bool)

(assert (=> d!47698 (=> (not res!123248) (not e!98215))))

(assert (=> d!47698 (= res!123248 (= (size!3006 (buf!3461 (_2!6907 lt!228045))) (size!3006 (buf!3461 (_2!6907 lt!228469)))))))

(assert (=> d!47698 (= (isPrefixOf!0 (_2!6907 lt!228045) (_2!6907 lt!228469)) e!98215)))

(declare-fun b!147296 () Bool)

(declare-fun res!123247 () Bool)

(assert (=> b!147296 (=> (not res!123247) (not e!98215))))

(assert (=> b!147296 (= res!123247 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045))) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228469))) (currentByte!6363 (_2!6907 lt!228469)) (currentBit!6358 (_2!6907 lt!228469)))))))

(declare-fun b!147297 () Bool)

(declare-fun e!98216 () Bool)

(assert (=> b!147297 (= e!98215 e!98216)))

(declare-fun res!123249 () Bool)

(assert (=> b!147297 (=> res!123249 e!98216)))

(assert (=> b!147297 (= res!123249 (= (size!3006 (buf!3461 (_2!6907 lt!228045))) #b00000000000000000000000000000000))))

(declare-fun b!147298 () Bool)

(assert (=> b!147298 (= e!98216 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228045)) (buf!3461 (_2!6907 lt!228469)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228045))) (currentByte!6363 (_2!6907 lt!228045)) (currentBit!6358 (_2!6907 lt!228045)))))))

(assert (= (and d!47698 res!123248) b!147296))

(assert (= (and b!147296 res!123247) b!147297))

(assert (= (and b!147297 (not res!123249)) b!147298))

(assert (=> b!147296 m!226685))

(assert (=> b!147296 m!227087))

(assert (=> b!147298 m!226685))

(assert (=> b!147298 m!226685))

(declare-fun m!227887 () Bool)

(assert (=> b!147298 m!227887))

(assert (=> b!146972 d!47698))

(declare-fun d!47700 () Bool)

(assert (=> d!47700 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!47700 true))

(declare-fun _$7!79 () Unit!9197)

(assert (=> d!47700 (= (choose!57 thiss!1634 (_2!6907 lt!228045) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!79)))

(declare-fun bs!11663 () Bool)

(assert (= bs!11663 d!47700))

(declare-fun m!227889 () Bool)

(assert (=> bs!11663 m!227889))

(assert (=> d!47349 d!47700))

(declare-fun d!47702 () Bool)

(assert (=> d!47702 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045))) (bvsub (bvsub to!404 from!447) lt!228353)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!228353)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3006 (buf!3461 (_2!6907 lt!228045)))) ((_ sign_extend 32) (currentByte!6363 (_2!6907 lt!228045))) ((_ sign_extend 32) (currentBit!6358 (_2!6907 lt!228045)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11664 () Bool)

(assert (= bs!11664 d!47702))

(assert (=> bs!11664 m!226815))

(assert (=> b!146926 d!47702))

(declare-fun d!47704 () Bool)

(declare-fun res!123251 () Bool)

(declare-fun e!98217 () Bool)

(assert (=> d!47704 (=> (not res!123251) (not e!98217))))

(assert (=> d!47704 (= res!123251 (= (size!3006 (buf!3461 (_2!6909 lt!228507))) (size!3006 (buf!3461 (_2!6907 lt!228035)))))))

(assert (=> d!47704 (= (isPrefixOf!0 (_2!6909 lt!228507) (_2!6907 lt!228035)) e!98217)))

(declare-fun b!147299 () Bool)

(declare-fun res!123250 () Bool)

(assert (=> b!147299 (=> (not res!123250) (not e!98217))))

(assert (=> b!147299 (= res!123250 (bvsle (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228507))) (currentByte!6363 (_2!6909 lt!228507)) (currentBit!6358 (_2!6909 lt!228507))) (bitIndex!0 (size!3006 (buf!3461 (_2!6907 lt!228035))) (currentByte!6363 (_2!6907 lt!228035)) (currentBit!6358 (_2!6907 lt!228035)))))))

(declare-fun b!147300 () Bool)

(declare-fun e!98218 () Bool)

(assert (=> b!147300 (= e!98217 e!98218)))

(declare-fun res!123252 () Bool)

(assert (=> b!147300 (=> res!123252 e!98218)))

(assert (=> b!147300 (= res!123252 (= (size!3006 (buf!3461 (_2!6909 lt!228507))) #b00000000000000000000000000000000))))

(declare-fun b!147301 () Bool)

(assert (=> b!147301 (= e!98218 (arrayBitRangesEq!0 (buf!3461 (_2!6909 lt!228507)) (buf!3461 (_2!6907 lt!228035)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3006 (buf!3461 (_2!6909 lt!228507))) (currentByte!6363 (_2!6909 lt!228507)) (currentBit!6358 (_2!6909 lt!228507)))))))

(assert (= (and d!47704 res!123251) b!147299))

(assert (= (and b!147299 res!123250) b!147300))

(assert (= (and b!147300 (not res!123252)) b!147301))

(assert (=> b!147299 m!227545))

(assert (=> b!147299 m!226749))

(assert (=> b!147301 m!227545))

(assert (=> b!147301 m!227545))

(declare-fun m!227891 () Bool)

(assert (=> b!147301 m!227891))

(assert (=> b!146979 d!47704))

(declare-fun d!47706 () Bool)

(declare-fun res!123253 () Bool)

(declare-fun e!98219 () Bool)

(assert (=> d!47706 (=> res!123253 e!98219)))

(assert (=> d!47706 (= res!123253 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47706 (= (arrayRangesEq!322 arr!237 (_2!6910 lt!228470) #b00000000000000000000000000000000 to!404) e!98219)))

(declare-fun b!147302 () Bool)

(declare-fun e!98220 () Bool)

(assert (=> b!147302 (= e!98219 e!98220)))

(declare-fun res!123254 () Bool)

(assert (=> b!147302 (=> (not res!123254) (not e!98220))))

(assert (=> b!147302 (= res!123254 (= (select (arr!3760 arr!237) #b00000000000000000000000000000000) (select (arr!3760 (_2!6910 lt!228470)) #b00000000000000000000000000000000)))))

(declare-fun b!147303 () Bool)

(assert (=> b!147303 (= e!98220 (arrayRangesEq!322 arr!237 (_2!6910 lt!228470) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47706 (not res!123253)) b!147302))

(assert (= (and b!147302 res!123254) b!147303))

(assert (=> b!147302 m!226891))

(declare-fun m!227893 () Bool)

(assert (=> b!147302 m!227893))

(declare-fun m!227895 () Bool)

(assert (=> b!147303 m!227895))

(assert (=> b!146974 d!47706))

(assert (=> b!146894 d!47325))

(declare-fun d!47708 () Bool)

(assert (=> d!47708 (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228045)) (buf!3461 thiss!1634) lt!228292 lt!228276)))

(declare-fun lt!229176 () Unit!9197)

(assert (=> d!47708 (= lt!229176 (choose!8 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228045)) lt!228292 lt!228276))))

(assert (=> d!47708 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228292) (bvsle lt!228292 lt!228276))))

(assert (=> d!47708 (= (arrayBitRangesEqSymmetric!0 (buf!3461 thiss!1634) (buf!3461 (_2!6907 lt!228045)) lt!228292 lt!228276) lt!229176)))

(declare-fun bs!11665 () Bool)

(assert (= bs!11665 d!47708))

(assert (=> bs!11665 m!226903))

(declare-fun m!227897 () Bool)

(assert (=> bs!11665 m!227897))

(assert (=> b!146894 d!47708))

(declare-fun b!147304 () Bool)

(declare-fun lt!229178 () tuple4!138)

(declare-fun e!98226 () Bool)

(assert (=> b!147304 (= e!98226 (arrayRangesEq!322 (buf!3461 (_2!6907 lt!228045)) (buf!3461 thiss!1634) (_1!6918 lt!229178) (_2!6918 lt!229178)))))

(declare-fun d!47710 () Bool)

(declare-fun res!123257 () Bool)

(declare-fun e!98225 () Bool)

(assert (=> d!47710 (=> res!123257 e!98225)))

(assert (=> d!47710 (= res!123257 (bvsge lt!228292 lt!228276))))

(assert (=> d!47710 (= (arrayBitRangesEq!0 (buf!3461 (_2!6907 lt!228045)) (buf!3461 thiss!1634) lt!228292 lt!228276) e!98225)))

(declare-fun b!147305 () Bool)

(declare-fun res!123259 () Bool)

(declare-fun lt!229177 () (_ BitVec 32))

(assert (=> b!147305 (= res!123259 (= lt!229177 #b00000000000000000000000000000000))))

(declare-fun e!98224 () Bool)

(assert (=> b!147305 (=> res!123259 e!98224)))

(declare-fun e!98222 () Bool)

(assert (=> b!147305 (= e!98222 e!98224)))

(declare-fun b!147306 () Bool)

(declare-fun e!98221 () Bool)

(assert (=> b!147306 (= e!98225 e!98221)))

(declare-fun res!123258 () Bool)

(assert (=> b!147306 (=> (not res!123258) (not e!98221))))

(assert (=> b!147306 (= res!123258 e!98226)))

(declare-fun res!123256 () Bool)

(assert (=> b!147306 (=> res!123256 e!98226)))

(assert (=> b!147306 (= res!123256 (bvsge (_1!6918 lt!229178) (_2!6918 lt!229178)))))

(assert (=> b!147306 (= lt!229177 ((_ extract 31 0) (bvsrem lt!228276 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!229179 () (_ BitVec 32))

(assert (=> b!147306 (= lt!229179 ((_ extract 31 0) (bvsrem lt!228292 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!147306 (= lt!229178 (arrayBitIndices!0 lt!228292 lt!228276))))

(declare-fun b!147307 () Bool)

(declare-fun e!98223 () Bool)

(assert (=> b!147307 (= e!98223 e!98222)))

(declare-fun res!123255 () Bool)

(assert (=> b!147307 (= res!123255 (byteRangesEq!0 (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_3!357 lt!229178)) (select (arr!3760 (buf!3461 thiss!1634)) (_3!357 lt!229178)) lt!229179 #b00000000000000000000000000001000))))

(assert (=> b!147307 (=> (not res!123255) (not e!98222))))

(declare-fun b!147308 () Bool)

(assert (=> b!147308 (= e!98221 e!98223)))

(declare-fun c!7978 () Bool)

(assert (=> b!147308 (= c!7978 (= (_3!357 lt!229178) (_4!69 lt!229178)))))

(declare-fun b!147309 () Bool)

(declare-fun call!1972 () Bool)

(assert (=> b!147309 (= e!98223 call!1972)))

(declare-fun b!147310 () Bool)

(assert (=> b!147310 (= e!98224 call!1972)))

(declare-fun bm!1969 () Bool)

(assert (=> bm!1969 (= call!1972 (byteRangesEq!0 (ite c!7978 (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_3!357 lt!229178)) (select (arr!3760 (buf!3461 (_2!6907 lt!228045))) (_4!69 lt!229178))) (ite c!7978 (select (arr!3760 (buf!3461 thiss!1634)) (_3!357 lt!229178)) (select (arr!3760 (buf!3461 thiss!1634)) (_4!69 lt!229178))) (ite c!7978 lt!229179 #b00000000000000000000000000000000) lt!229177))))

(assert (= (and d!47710 (not res!123257)) b!147306))

(assert (= (and b!147306 (not res!123256)) b!147304))

(assert (= (and b!147306 res!123258) b!147308))

(assert (= (and b!147308 c!7978) b!147309))

(assert (= (and b!147308 (not c!7978)) b!147307))

(assert (= (and b!147307 res!123255) b!147305))

(assert (= (and b!147305 (not res!123259)) b!147310))

(assert (= (or b!147309 b!147310) bm!1969))

(declare-fun m!227899 () Bool)

(assert (=> b!147304 m!227899))

(declare-fun m!227901 () Bool)

(assert (=> b!147306 m!227901))

(declare-fun m!227903 () Bool)

(assert (=> b!147307 m!227903))

(declare-fun m!227905 () Bool)

(assert (=> b!147307 m!227905))

(assert (=> b!147307 m!227903))

(assert (=> b!147307 m!227905))

(declare-fun m!227907 () Bool)

(assert (=> b!147307 m!227907))

(assert (=> bm!1969 m!227905))

(declare-fun m!227909 () Bool)

(assert (=> bm!1969 m!227909))

(assert (=> bm!1969 m!227903))

(declare-fun m!227911 () Bool)

(assert (=> bm!1969 m!227911))

(declare-fun m!227913 () Bool)

(assert (=> bm!1969 m!227913))

(assert (=> b!146894 d!47710))

(push 1)

(assert (not d!47584))

(assert (not b!147173))

(assert (not d!47604))

(assert (not d!47562))

(assert (not b!147098))

(assert (not d!47638))

(assert (not d!47678))

(assert (not b!147170))

(assert (not b!147131))

(assert (not b!147202))

(assert (not b!147296))

(assert (not b!147150))

(assert (not bm!1968))

(assert (not b!147148))

(assert (not d!47528))

(assert (not d!47696))

(assert (not b!147159))

(assert (not d!47670))

(assert (not b!147161))

(assert (not b!147301))

(assert (not b!147112))

(assert (not d!47688))

(assert (not b!147155))

(assert (not d!47700))

(assert (not b!147249))

(assert (not b!147273))

(assert (not b!147158))

(assert (not b!147195))

(assert (not d!47632))

(assert (not d!47544))

(assert (not b!147222))

(assert (not b!147168))

(assert (not d!47658))

(assert (not b!147149))

(assert (not b!147234))

(assert (not b!147171))

(assert (not b!147239))

(assert (not b!147188))

(assert (not d!47536))

(assert (not b!147307))

(assert (not b!147251))

(assert (not b!147185))

(assert (not bm!1959))

(assert (not b!147240))

(assert (not b!147156))

(assert (not d!47702))

(assert (not b!147087))

(assert (not b!147132))

(assert (not b!147100))

(assert (not d!47540))

(assert (not b!147194))

(assert (not d!47598))

(assert (not b!147189))

(assert (not d!47582))

(assert (not bm!1961))

(assert (not bm!1957))

(assert (not d!47616))

(assert (not d!47686))

(assert (not d!47580))

(assert (not b!147236))

(assert (not b!147180))

(assert (not d!47588))

(assert (not b!147306))

(assert (not b!147255))

(assert (not b!147192))

(assert (not d!47602))

(assert (not b!147242))

(assert (not b!147216))

(assert (not b!147220))

(assert (not d!47644))

(assert (not b!147272))

(assert (not b!147110))

(assert (not bm!1960))

(assert (not b!147227))

(assert (not d!47684))

(assert (not d!47530))

(assert (not b!147229))

(assert (not b!147245))

(assert (not d!47676))

(assert (not bm!1965))

(assert (not b!147280))

(assert (not d!47594))

(assert (not b!147246))

(assert (not bm!1954))

(assert (not b!147230))

(assert (not d!47642))

(assert (not d!47574))

(assert (not d!47552))

(assert (not b!147201))

(assert (not b!147147))

(assert (not d!47620))

(assert (not d!47694))

(assert (not d!47554))

(assert (not bm!1958))

(assert (not d!47576))

(assert (not b!147179))

(assert (not d!47656))

(assert (not d!47708))

(assert (not d!47622))

(assert (not bm!1969))

(assert (not b!147203))

(assert (not b!147114))

(assert (not b!147200))

(assert (not b!147274))

(assert (not b!147252))

(assert (not b!147299))

(assert (not b!147154))

(assert (not d!47578))

(assert (not d!47630))

(assert (not bm!1946))

(assert (not bm!1956))

(assert (not d!47626))

(assert (not b!147237))

(assert (not b!147183))

(assert (not b!147287))

(assert (not b!147226))

(assert (not b!147284))

(assert (not b!147233))

(assert (not d!47624))

(assert (not d!47648))

(assert (not bm!1953))

(assert (not b!147275))

(assert (not b!147191))

(assert (not bm!1955))

(assert (not b!147182))

(assert (not b!147271))

(assert (not b!147164))

(assert (not b!147254))

(assert (not d!47590))

(assert (not b!147213))

(assert (not b!147224))

(assert (not b!147186))

(assert (not d!47566))

(assert (not b!147187))

(assert (not d!47586))

(assert (not d!47538))

(assert (not d!47606))

(assert (not b!147167))

(assert (not bm!1962))

(assert (not b!147215))

(assert (not b!147165))

(assert (not b!147288))

(assert (not bm!1966))

(assert (not bm!1963))

(assert (not b!147248))

(assert (not b!147292))

(assert (not b!147243))

(assert (not b!147095))

(assert (not b!147231))

(assert (not b!147175))

(assert (not b!147097))

(assert (not b!147089))

(assert (not b!147109))

(assert (not b!147153))

(assert (not b!147129))

(assert (not bm!1964))

(assert (not d!47600))

(assert (not bm!1967))

(assert (not b!147285))

(assert (not d!47558))

(assert (not b!147111))

(assert (not b!147162))

(assert (not b!147282))

(assert (not b!147304))

(assert (not b!147303))

(assert (not b!147298))

(assert (not b!147152))

(assert (not d!47608))

(assert (not b!147294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

