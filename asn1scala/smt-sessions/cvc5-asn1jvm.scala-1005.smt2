; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28536 () Bool)

(assert start!28536)

(declare-fun b!147691 () Bool)

(declare-datatypes ((array!6653 0))(
  ( (array!6654 (arr!3779 (Array (_ BitVec 32) (_ BitVec 8))) (size!3010 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5278 0))(
  ( (BitStream!5279 (buf!3475 array!6653) (currentByte!6383 (_ BitVec 32)) (currentBit!6378 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13148 0))(
  ( (tuple2!13149 (_1!6933 BitStream!5278) (_2!6933 BitStream!5278)) )
))
(declare-fun lt!229884 () tuple2!13148)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!13150 0))(
  ( (tuple2!13151 (_1!6934 BitStream!5278) (_2!6934 (_ BitVec 8))) )
))
(declare-fun lt!229868 () tuple2!13150)

(declare-fun e!98515 () Bool)

(declare-fun arr!237 () array!6653)

(assert (=> b!147691 (= e!98515 (and (= (_2!6934 lt!229868) (select (arr!3779 arr!237) from!447)) (= (_1!6934 lt!229868) (_2!6933 lt!229884))))))

(declare-fun readBytePure!0 (BitStream!5278) tuple2!13150)

(assert (=> b!147691 (= lt!229868 (readBytePure!0 (_1!6933 lt!229884)))))

(declare-fun thiss!1634 () BitStream!5278)

(declare-datatypes ((Unit!9308 0))(
  ( (Unit!9309) )
))
(declare-datatypes ((tuple2!13152 0))(
  ( (tuple2!13153 (_1!6935 Unit!9308) (_2!6935 BitStream!5278)) )
))
(declare-fun lt!229871 () tuple2!13152)

(declare-fun reader!0 (BitStream!5278 BitStream!5278) tuple2!13148)

(assert (=> b!147691 (= lt!229884 (reader!0 thiss!1634 (_2!6935 lt!229871)))))

(declare-fun b!147692 () Bool)

(declare-fun res!123605 () Bool)

(declare-fun e!98509 () Bool)

(assert (=> b!147692 (=> (not res!123605) (not e!98509))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!147692 (= res!123605 (bvslt from!447 to!404))))

(declare-fun b!147693 () Bool)

(declare-fun e!98514 () Bool)

(declare-fun array_inv!2799 (array!6653) Bool)

(assert (=> b!147693 (= e!98514 (array_inv!2799 (buf!3475 thiss!1634)))))

(declare-fun b!147694 () Bool)

(declare-fun res!123604 () Bool)

(assert (=> b!147694 (=> (not res!123604) (not e!98509))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147694 (= res!123604 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3010 (buf!3475 thiss!1634))) ((_ sign_extend 32) (currentByte!6383 thiss!1634)) ((_ sign_extend 32) (currentBit!6378 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!147695 () Bool)

(declare-fun res!123601 () Bool)

(assert (=> b!147695 (=> (not res!123601) (not e!98515))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!147695 (= res!123601 (= (bitIndex!0 (size!3010 (buf!3475 (_2!6935 lt!229871))) (currentByte!6383 (_2!6935 lt!229871)) (currentBit!6378 (_2!6935 lt!229871))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3010 (buf!3475 thiss!1634)) (currentByte!6383 thiss!1634) (currentBit!6378 thiss!1634)))))))

(declare-fun b!147697 () Bool)

(declare-fun res!123596 () Bool)

(declare-fun e!98511 () Bool)

(assert (=> b!147697 (=> (not res!123596) (not e!98511))))

(declare-fun lt!229876 () tuple2!13152)

(declare-fun isPrefixOf!0 (BitStream!5278 BitStream!5278) Bool)

(assert (=> b!147697 (= res!123596 (isPrefixOf!0 (_2!6935 lt!229871) (_2!6935 lt!229876)))))

(declare-fun b!147698 () Bool)

(declare-fun e!98517 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147698 (= e!98517 (invariant!0 (currentBit!6378 thiss!1634) (currentByte!6383 thiss!1634) (size!3010 (buf!3475 (_2!6935 lt!229871)))))))

(declare-fun e!98513 () Bool)

(declare-fun b!147699 () Bool)

(declare-datatypes ((tuple2!13154 0))(
  ( (tuple2!13155 (_1!6936 BitStream!5278) (_2!6936 array!6653)) )
))
(declare-fun lt!229883 () tuple2!13154)

(declare-fun arrayRangesEq!326 (array!6653 array!6653 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147699 (= e!98513 (not (arrayRangesEq!326 arr!237 (_2!6936 lt!229883) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!147700 () Bool)

(declare-fun e!98508 () Bool)

(assert (=> b!147700 (= e!98509 (not e!98508))))

(declare-fun res!123593 () Bool)

(assert (=> b!147700 (=> res!123593 e!98508)))

(declare-fun lt!229889 () tuple2!13154)

(declare-fun lt!229881 () tuple2!13154)

(assert (=> b!147700 (= res!123593 (not (arrayRangesEq!326 (_2!6936 lt!229881) (_2!6936 lt!229889) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!229878 () tuple2!13154)

(assert (=> b!147700 (arrayRangesEq!326 (_2!6936 lt!229881) (_2!6936 lt!229878) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!229874 () tuple2!13148)

(declare-fun lt!229865 () Unit!9308)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5278 array!6653 (_ BitVec 32) (_ BitVec 32)) Unit!9308)

(assert (=> b!147700 (= lt!229865 (readByteArrayLoopArrayPrefixLemma!0 (_1!6933 lt!229874) arr!237 from!447 to!404))))

(declare-fun lt!229877 () array!6653)

(declare-fun readByteArrayLoopPure!0 (BitStream!5278 array!6653 (_ BitVec 32) (_ BitVec 32)) tuple2!13154)

(declare-fun withMovedByteIndex!0 (BitStream!5278 (_ BitVec 32)) BitStream!5278)

(assert (=> b!147700 (= lt!229878 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6933 lt!229874) #b00000000000000000000000000000001) lt!229877 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229880 () tuple2!13148)

(assert (=> b!147700 (= lt!229889 (readByteArrayLoopPure!0 (_1!6933 lt!229880) lt!229877 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229864 () tuple2!13150)

(assert (=> b!147700 (= lt!229877 (array!6654 (store (arr!3779 arr!237) from!447 (_2!6934 lt!229864)) (size!3010 arr!237)))))

(declare-fun lt!229869 () (_ BitVec 32))

(assert (=> b!147700 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3010 (buf!3475 (_2!6935 lt!229876)))) ((_ sign_extend 32) (currentByte!6383 (_2!6935 lt!229871))) ((_ sign_extend 32) (currentBit!6378 (_2!6935 lt!229871))) lt!229869)))

(declare-fun lt!229875 () Unit!9308)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5278 array!6653 (_ BitVec 32)) Unit!9308)

(assert (=> b!147700 (= lt!229875 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6935 lt!229871) (buf!3475 (_2!6935 lt!229876)) lt!229869))))

(assert (=> b!147700 (= (_1!6936 lt!229881) (_2!6933 lt!229874))))

(assert (=> b!147700 (= lt!229881 (readByteArrayLoopPure!0 (_1!6933 lt!229874) arr!237 from!447 to!404))))

(assert (=> b!147700 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3010 (buf!3475 (_2!6935 lt!229876)))) ((_ sign_extend 32) (currentByte!6383 thiss!1634)) ((_ sign_extend 32) (currentBit!6378 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!229887 () Unit!9308)

(assert (=> b!147700 (= lt!229887 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3475 (_2!6935 lt!229876)) (bvsub to!404 from!447)))))

(assert (=> b!147700 (= (_2!6934 lt!229864) (select (arr!3779 arr!237) from!447))))

(assert (=> b!147700 (= lt!229864 (readBytePure!0 (_1!6933 lt!229874)))))

(assert (=> b!147700 (= lt!229880 (reader!0 (_2!6935 lt!229871) (_2!6935 lt!229876)))))

(assert (=> b!147700 (= lt!229874 (reader!0 thiss!1634 (_2!6935 lt!229876)))))

(declare-fun e!98510 () Bool)

(assert (=> b!147700 e!98510))

(declare-fun res!123600 () Bool)

(assert (=> b!147700 (=> (not res!123600) (not e!98510))))

(declare-fun lt!229872 () tuple2!13150)

(declare-fun lt!229866 () tuple2!13150)

(assert (=> b!147700 (= res!123600 (= (bitIndex!0 (size!3010 (buf!3475 (_1!6934 lt!229872))) (currentByte!6383 (_1!6934 lt!229872)) (currentBit!6378 (_1!6934 lt!229872))) (bitIndex!0 (size!3010 (buf!3475 (_1!6934 lt!229866))) (currentByte!6383 (_1!6934 lt!229866)) (currentBit!6378 (_1!6934 lt!229866)))))))

(declare-fun lt!229886 () Unit!9308)

(declare-fun lt!229879 () BitStream!5278)

(declare-fun readBytePrefixLemma!0 (BitStream!5278 BitStream!5278) Unit!9308)

(assert (=> b!147700 (= lt!229886 (readBytePrefixLemma!0 lt!229879 (_2!6935 lt!229876)))))

(assert (=> b!147700 (= lt!229866 (readBytePure!0 (BitStream!5279 (buf!3475 (_2!6935 lt!229876)) (currentByte!6383 thiss!1634) (currentBit!6378 thiss!1634))))))

(assert (=> b!147700 (= lt!229872 (readBytePure!0 lt!229879))))

(assert (=> b!147700 (= lt!229879 (BitStream!5279 (buf!3475 (_2!6935 lt!229871)) (currentByte!6383 thiss!1634) (currentBit!6378 thiss!1634)))))

(assert (=> b!147700 e!98517))

(declare-fun res!123592 () Bool)

(assert (=> b!147700 (=> (not res!123592) (not e!98517))))

(assert (=> b!147700 (= res!123592 (isPrefixOf!0 thiss!1634 (_2!6935 lt!229876)))))

(declare-fun lt!229873 () Unit!9308)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5278 BitStream!5278 BitStream!5278) Unit!9308)

(assert (=> b!147700 (= lt!229873 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6935 lt!229871) (_2!6935 lt!229876)))))

(declare-fun e!98516 () Bool)

(assert (=> b!147700 e!98516))

(declare-fun res!123594 () Bool)

(assert (=> b!147700 (=> (not res!123594) (not e!98516))))

(assert (=> b!147700 (= res!123594 (= (size!3010 (buf!3475 (_2!6935 lt!229871))) (size!3010 (buf!3475 (_2!6935 lt!229876)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5278 array!6653 (_ BitVec 32) (_ BitVec 32)) tuple2!13152)

(assert (=> b!147700 (= lt!229876 (appendByteArrayLoop!0 (_2!6935 lt!229871) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!147700 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3010 (buf!3475 (_2!6935 lt!229871)))) ((_ sign_extend 32) (currentByte!6383 (_2!6935 lt!229871))) ((_ sign_extend 32) (currentBit!6378 (_2!6935 lt!229871))) lt!229869)))

(assert (=> b!147700 (= lt!229869 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!229882 () Unit!9308)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5278 BitStream!5278 (_ BitVec 64) (_ BitVec 32)) Unit!9308)

(assert (=> b!147700 (= lt!229882 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6935 lt!229871) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!147700 e!98515))

(declare-fun res!123602 () Bool)

(assert (=> b!147700 (=> (not res!123602) (not e!98515))))

(assert (=> b!147700 (= res!123602 (= (size!3010 (buf!3475 thiss!1634)) (size!3010 (buf!3475 (_2!6935 lt!229871)))))))

(declare-fun appendByte!0 (BitStream!5278 (_ BitVec 8)) tuple2!13152)

(assert (=> b!147700 (= lt!229871 (appendByte!0 thiss!1634 (select (arr!3779 arr!237) from!447)))))

(declare-fun b!147701 () Bool)

(declare-fun res!123595 () Bool)

(assert (=> b!147701 (=> (not res!123595) (not e!98515))))

(assert (=> b!147701 (= res!123595 (isPrefixOf!0 thiss!1634 (_2!6935 lt!229871)))))

(declare-fun b!147696 () Bool)

(assert (=> b!147696 (= e!98516 e!98511)))

(declare-fun res!123603 () Bool)

(assert (=> b!147696 (=> (not res!123603) (not e!98511))))

(declare-fun lt!229888 () (_ BitVec 64))

(assert (=> b!147696 (= res!123603 (= (bitIndex!0 (size!3010 (buf!3475 (_2!6935 lt!229876))) (currentByte!6383 (_2!6935 lt!229876)) (currentBit!6378 (_2!6935 lt!229876))) (bvadd (bitIndex!0 (size!3010 (buf!3475 (_2!6935 lt!229871))) (currentByte!6383 (_2!6935 lt!229871)) (currentBit!6378 (_2!6935 lt!229871))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!229888))))))

(assert (=> b!147696 (= lt!229888 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!123598 () Bool)

(assert (=> start!28536 (=> (not res!123598) (not e!98509))))

(assert (=> start!28536 (= res!123598 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3010 arr!237))))))

(assert (=> start!28536 e!98509))

(assert (=> start!28536 true))

(assert (=> start!28536 (array_inv!2799 arr!237)))

(declare-fun inv!12 (BitStream!5278) Bool)

(assert (=> start!28536 (and (inv!12 thiss!1634) e!98514)))

(declare-fun b!147702 () Bool)

(assert (=> b!147702 (= e!98510 (= (_2!6934 lt!229872) (_2!6934 lt!229866)))))

(declare-fun b!147703 () Bool)

(assert (=> b!147703 (= e!98511 (not e!98513))))

(declare-fun res!123599 () Bool)

(assert (=> b!147703 (=> res!123599 e!98513)))

(declare-fun lt!229870 () tuple2!13148)

(assert (=> b!147703 (= res!123599 (or (not (= (size!3010 (_2!6936 lt!229883)) (size!3010 arr!237))) (not (= (_1!6936 lt!229883) (_2!6933 lt!229870)))))))

(assert (=> b!147703 (= lt!229883 (readByteArrayLoopPure!0 (_1!6933 lt!229870) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!147703 (validate_offset_bits!1 ((_ sign_extend 32) (size!3010 (buf!3475 (_2!6935 lt!229876)))) ((_ sign_extend 32) (currentByte!6383 (_2!6935 lt!229871))) ((_ sign_extend 32) (currentBit!6378 (_2!6935 lt!229871))) lt!229888)))

(declare-fun lt!229885 () Unit!9308)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5278 array!6653 (_ BitVec 64)) Unit!9308)

(assert (=> b!147703 (= lt!229885 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6935 lt!229871) (buf!3475 (_2!6935 lt!229876)) lt!229888))))

(assert (=> b!147703 (= lt!229870 (reader!0 (_2!6935 lt!229871) (_2!6935 lt!229876)))))

(declare-fun b!147704 () Bool)

(assert (=> b!147704 (= e!98508 (bvsle #b00000000000000000000000000000000 to!404))))

(assert (=> b!147704 (arrayRangesEq!326 (_2!6936 lt!229889) (_2!6936 lt!229881) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!229867 () Unit!9308)

(declare-fun arrayRangesEqSymmetricLemma!58 (array!6653 array!6653 (_ BitVec 32) (_ BitVec 32)) Unit!9308)

(assert (=> b!147704 (= lt!229867 (arrayRangesEqSymmetricLemma!58 (_2!6936 lt!229881) (_2!6936 lt!229889) #b00000000000000000000000000000000 to!404))))

(declare-fun b!147705 () Bool)

(declare-fun res!123597 () Bool)

(assert (=> b!147705 (=> (not res!123597) (not e!98509))))

(assert (=> b!147705 (= res!123597 (invariant!0 (currentBit!6378 thiss!1634) (currentByte!6383 thiss!1634) (size!3010 (buf!3475 thiss!1634))))))

(assert (= (and start!28536 res!123598) b!147694))

(assert (= (and b!147694 res!123604) b!147692))

(assert (= (and b!147692 res!123605) b!147705))

(assert (= (and b!147705 res!123597) b!147700))

(assert (= (and b!147700 res!123602) b!147695))

(assert (= (and b!147695 res!123601) b!147701))

(assert (= (and b!147701 res!123595) b!147691))

(assert (= (and b!147700 res!123594) b!147696))

(assert (= (and b!147696 res!123603) b!147697))

(assert (= (and b!147697 res!123596) b!147703))

(assert (= (and b!147703 (not res!123599)) b!147699))

(assert (= (and b!147700 res!123592) b!147698))

(assert (= (and b!147700 res!123600) b!147702))

(assert (= (and b!147700 (not res!123593)) b!147704))

(assert (= start!28536 b!147693))

(declare-fun m!228735 () Bool)

(assert (=> b!147701 m!228735))

(declare-fun m!228737 () Bool)

(assert (=> b!147700 m!228737))

(declare-fun m!228739 () Bool)

(assert (=> b!147700 m!228739))

(declare-fun m!228741 () Bool)

(assert (=> b!147700 m!228741))

(declare-fun m!228743 () Bool)

(assert (=> b!147700 m!228743))

(declare-fun m!228745 () Bool)

(assert (=> b!147700 m!228745))

(declare-fun m!228747 () Bool)

(assert (=> b!147700 m!228747))

(declare-fun m!228749 () Bool)

(assert (=> b!147700 m!228749))

(declare-fun m!228751 () Bool)

(assert (=> b!147700 m!228751))

(declare-fun m!228753 () Bool)

(assert (=> b!147700 m!228753))

(declare-fun m!228755 () Bool)

(assert (=> b!147700 m!228755))

(declare-fun m!228757 () Bool)

(assert (=> b!147700 m!228757))

(declare-fun m!228759 () Bool)

(assert (=> b!147700 m!228759))

(declare-fun m!228761 () Bool)

(assert (=> b!147700 m!228761))

(declare-fun m!228763 () Bool)

(assert (=> b!147700 m!228763))

(declare-fun m!228765 () Bool)

(assert (=> b!147700 m!228765))

(declare-fun m!228767 () Bool)

(assert (=> b!147700 m!228767))

(declare-fun m!228769 () Bool)

(assert (=> b!147700 m!228769))

(assert (=> b!147700 m!228767))

(declare-fun m!228771 () Bool)

(assert (=> b!147700 m!228771))

(declare-fun m!228773 () Bool)

(assert (=> b!147700 m!228773))

(declare-fun m!228775 () Bool)

(assert (=> b!147700 m!228775))

(declare-fun m!228777 () Bool)

(assert (=> b!147700 m!228777))

(declare-fun m!228779 () Bool)

(assert (=> b!147700 m!228779))

(declare-fun m!228781 () Bool)

(assert (=> b!147700 m!228781))

(declare-fun m!228783 () Bool)

(assert (=> b!147700 m!228783))

(declare-fun m!228785 () Bool)

(assert (=> b!147700 m!228785))

(declare-fun m!228787 () Bool)

(assert (=> b!147700 m!228787))

(declare-fun m!228789 () Bool)

(assert (=> b!147700 m!228789))

(assert (=> b!147700 m!228761))

(declare-fun m!228791 () Bool)

(assert (=> b!147697 m!228791))

(declare-fun m!228793 () Bool)

(assert (=> b!147703 m!228793))

(declare-fun m!228795 () Bool)

(assert (=> b!147703 m!228795))

(declare-fun m!228797 () Bool)

(assert (=> b!147703 m!228797))

(assert (=> b!147703 m!228781))

(declare-fun m!228799 () Bool)

(assert (=> b!147695 m!228799))

(declare-fun m!228801 () Bool)

(assert (=> b!147695 m!228801))

(declare-fun m!228803 () Bool)

(assert (=> b!147705 m!228803))

(declare-fun m!228805 () Bool)

(assert (=> start!28536 m!228805))

(declare-fun m!228807 () Bool)

(assert (=> start!28536 m!228807))

(declare-fun m!228809 () Bool)

(assert (=> b!147704 m!228809))

(declare-fun m!228811 () Bool)

(assert (=> b!147704 m!228811))

(declare-fun m!228813 () Bool)

(assert (=> b!147696 m!228813))

(assert (=> b!147696 m!228799))

(declare-fun m!228815 () Bool)

(assert (=> b!147694 m!228815))

(declare-fun m!228817 () Bool)

(assert (=> b!147698 m!228817))

(assert (=> b!147691 m!228767))

(declare-fun m!228819 () Bool)

(assert (=> b!147691 m!228819))

(declare-fun m!228821 () Bool)

(assert (=> b!147691 m!228821))

(declare-fun m!228823 () Bool)

(assert (=> b!147693 m!228823))

(declare-fun m!228825 () Bool)

(assert (=> b!147699 m!228825))

(push 1)

(assert (not b!147704))

(assert (not b!147705))

(assert (not b!147699))

(assert (not b!147691))

(assert (not b!147693))

(assert (not b!147700))

(assert (not b!147698))

(assert (not b!147696))

(assert (not start!28536))

(assert (not b!147695))

(assert (not b!147703))

(assert (not b!147697))

(assert (not b!147694))

(assert (not b!147701))

(check-sat)

(pop 1)

(push 1)

(check-sat)

