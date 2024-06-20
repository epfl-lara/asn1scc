; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6902 () Bool)

(assert start!6902)

(declare-fun b!32890 () Bool)

(declare-fun e!21774 () Bool)

(declare-fun e!21776 () Bool)

(assert (=> b!32890 (= e!21774 e!21776)))

(declare-fun res!28138 () Bool)

(assert (=> b!32890 (=> res!28138 e!21776)))

(declare-datatypes ((array!1838 0))(
  ( (array!1839 (arr!1286 (Array (_ BitVec 32) (_ BitVec 8))) (size!811 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1414 0))(
  ( (BitStream!1415 (buf!1139 array!1838) (currentByte!2506 (_ BitVec 32)) (currentBit!2501 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2477 0))(
  ( (Unit!2478) )
))
(declare-datatypes ((tuple2!3358 0))(
  ( (tuple2!3359 (_1!1766 Unit!2477) (_2!1766 BitStream!1414)) )
))
(declare-fun lt!48575 () tuple2!3358)

(declare-fun lt!48570 () tuple2!3358)

(declare-fun isPrefixOf!0 (BitStream!1414 BitStream!1414) Bool)

(assert (=> b!32890 (= res!28138 (not (isPrefixOf!0 (_2!1766 lt!48575) (_2!1766 lt!48570))))))

(declare-fun thiss!1379 () BitStream!1414)

(assert (=> b!32890 (isPrefixOf!0 thiss!1379 (_2!1766 lt!48570))))

(declare-fun lt!48576 () Unit!2477)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1414 BitStream!1414 BitStream!1414) Unit!2477)

(assert (=> b!32890 (= lt!48576 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1766 lt!48575) (_2!1766 lt!48570)))))

(declare-fun srcBuffer!2 () array!1838)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1414 array!1838 (_ BitVec 64) (_ BitVec 64)) tuple2!3358)

(assert (=> b!32890 (= lt!48570 (appendBitsMSBFirstLoop!0 (_2!1766 lt!48575) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!21777 () Bool)

(assert (=> b!32890 e!21777))

(declare-fun res!28143 () Bool)

(assert (=> b!32890 (=> (not res!28143) (not e!21777))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32890 (= res!28143 (validate_offset_bits!1 ((_ sign_extend 32) (size!811 (buf!1139 (_2!1766 lt!48575)))) ((_ sign_extend 32) (currentByte!2506 thiss!1379)) ((_ sign_extend 32) (currentBit!2501 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48577 () Unit!2477)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1414 array!1838 (_ BitVec 64)) Unit!2477)

(assert (=> b!32890 (= lt!48577 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1139 (_2!1766 lt!48575)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3360 0))(
  ( (tuple2!3361 (_1!1767 BitStream!1414) (_2!1767 BitStream!1414)) )
))
(declare-fun lt!48573 () tuple2!3360)

(declare-fun reader!0 (BitStream!1414 BitStream!1414) tuple2!3360)

(assert (=> b!32890 (= lt!48573 (reader!0 thiss!1379 (_2!1766 lt!48575)))))

(declare-fun b!32891 () Bool)

(declare-fun e!21780 () Bool)

(assert (=> b!32891 (= e!21780 true)))

(declare-datatypes ((List!408 0))(
  ( (Nil!405) (Cons!404 (h!523 Bool) (t!1158 List!408)) )
))
(declare-fun lt!48568 () List!408)

(declare-fun lt!48569 () List!408)

(declare-fun tail!125 (List!408) List!408)

(assert (=> b!32891 (= lt!48568 (tail!125 lt!48569))))

(declare-fun lt!48572 () tuple2!3360)

(declare-fun lt!48582 () Unit!2477)

(declare-fun lt!48571 () tuple2!3360)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1414 BitStream!1414 BitStream!1414 BitStream!1414 (_ BitVec 64) List!408) Unit!2477)

(assert (=> b!32891 (= lt!48582 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1766 lt!48570) (_2!1766 lt!48570) (_1!1767 lt!48571) (_1!1767 lt!48572) (bvsub to!314 i!635) lt!48569))))

(declare-fun res!28137 () Bool)

(declare-fun e!21778 () Bool)

(assert (=> start!6902 (=> (not res!28137) (not e!21778))))

(assert (=> start!6902 (= res!28137 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!811 srcBuffer!2))))))))

(assert (=> start!6902 e!21778))

(assert (=> start!6902 true))

(declare-fun array_inv!760 (array!1838) Bool)

(assert (=> start!6902 (array_inv!760 srcBuffer!2)))

(declare-fun e!21775 () Bool)

(declare-fun inv!12 (BitStream!1414) Bool)

(assert (=> start!6902 (and (inv!12 thiss!1379) e!21775)))

(declare-fun b!32892 () Bool)

(declare-fun head!245 (List!408) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1414 array!1838 (_ BitVec 64) (_ BitVec 64)) List!408)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1414 BitStream!1414 (_ BitVec 64)) List!408)

(assert (=> b!32892 (= e!21777 (= (head!245 (byteArrayBitContentToList!0 (_2!1766 lt!48575) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!245 (bitStreamReadBitsIntoList!0 (_2!1766 lt!48575) (_1!1767 lt!48573) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32893 () Bool)

(declare-fun res!28139 () Bool)

(declare-fun e!21770 () Bool)

(assert (=> b!32893 (=> res!28139 e!21770)))

(assert (=> b!32893 (= res!28139 (not (= (size!811 (buf!1139 thiss!1379)) (size!811 (buf!1139 (_2!1766 lt!48570))))))))

(declare-fun b!32894 () Bool)

(declare-fun res!28142 () Bool)

(declare-fun e!21772 () Bool)

(assert (=> b!32894 (=> res!28142 e!21772)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32894 (= res!28142 (not (invariant!0 (currentBit!2501 (_2!1766 lt!48575)) (currentByte!2506 (_2!1766 lt!48575)) (size!811 (buf!1139 (_2!1766 lt!48575))))))))

(declare-fun b!32895 () Bool)

(declare-fun res!28129 () Bool)

(assert (=> b!32895 (=> res!28129 e!21772)))

(assert (=> b!32895 (= res!28129 (not (invariant!0 (currentBit!2501 (_2!1766 lt!48575)) (currentByte!2506 (_2!1766 lt!48575)) (size!811 (buf!1139 (_2!1766 lt!48570))))))))

(declare-fun b!32896 () Bool)

(assert (=> b!32896 (= e!21775 (array_inv!760 (buf!1139 thiss!1379)))))

(declare-fun b!32897 () Bool)

(declare-fun e!21773 () Bool)

(declare-fun lt!48580 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32897 (= e!21773 (= lt!48580 (bvsub (bvsub (bvadd (bitIndex!0 (size!811 (buf!1139 (_2!1766 lt!48575))) (currentByte!2506 (_2!1766 lt!48575)) (currentBit!2501 (_2!1766 lt!48575))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32898 () Bool)

(declare-fun e!21779 () Bool)

(assert (=> b!32898 (= e!21779 e!21774)))

(declare-fun res!28135 () Bool)

(assert (=> b!32898 (=> res!28135 e!21774)))

(assert (=> b!32898 (= res!28135 (not (isPrefixOf!0 thiss!1379 (_2!1766 lt!48575))))))

(declare-fun lt!48578 () (_ BitVec 64))

(assert (=> b!32898 (validate_offset_bits!1 ((_ sign_extend 32) (size!811 (buf!1139 (_2!1766 lt!48575)))) ((_ sign_extend 32) (currentByte!2506 (_2!1766 lt!48575))) ((_ sign_extend 32) (currentBit!2501 (_2!1766 lt!48575))) lt!48578)))

(assert (=> b!32898 (= lt!48578 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48567 () Unit!2477)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1414 BitStream!1414 (_ BitVec 64) (_ BitVec 64)) Unit!2477)

(assert (=> b!32898 (= lt!48567 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1766 lt!48575) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1414 (_ BitVec 8) (_ BitVec 32)) tuple2!3358)

(assert (=> b!32898 (= lt!48575 (appendBitFromByte!0 thiss!1379 (select (arr!1286 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!32899 () Bool)

(assert (=> b!32899 (= e!21770 e!21772)))

(declare-fun res!28133 () Bool)

(assert (=> b!32899 (=> res!28133 e!21772)))

(assert (=> b!32899 (= res!28133 (not (= (size!811 (buf!1139 (_2!1766 lt!48575))) (size!811 (buf!1139 (_2!1766 lt!48570))))))))

(assert (=> b!32899 e!21773))

(declare-fun res!28140 () Bool)

(assert (=> b!32899 (=> (not res!28140) (not e!21773))))

(assert (=> b!32899 (= res!28140 (= (size!811 (buf!1139 (_2!1766 lt!48570))) (size!811 (buf!1139 thiss!1379))))))

(declare-fun b!32900 () Bool)

(declare-fun res!28141 () Bool)

(assert (=> b!32900 (=> (not res!28141) (not e!21778))))

(assert (=> b!32900 (= res!28141 (validate_offset_bits!1 ((_ sign_extend 32) (size!811 (buf!1139 thiss!1379))) ((_ sign_extend 32) (currentByte!2506 thiss!1379)) ((_ sign_extend 32) (currentBit!2501 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!32901 () Bool)

(declare-fun res!28132 () Bool)

(assert (=> b!32901 (=> res!28132 e!21780)))

(declare-fun length!134 (List!408) Int)

(assert (=> b!32901 (= res!28132 (<= (length!134 lt!48569) 0))))

(declare-fun b!32902 () Bool)

(assert (=> b!32902 (= e!21778 (not e!21779))))

(declare-fun res!28136 () Bool)

(assert (=> b!32902 (=> res!28136 e!21779)))

(assert (=> b!32902 (= res!28136 (bvsge i!635 to!314))))

(assert (=> b!32902 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48574 () Unit!2477)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1414) Unit!2477)

(assert (=> b!32902 (= lt!48574 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!48583 () (_ BitVec 64))

(assert (=> b!32902 (= lt!48583 (bitIndex!0 (size!811 (buf!1139 thiss!1379)) (currentByte!2506 thiss!1379) (currentBit!2501 thiss!1379)))))

(declare-fun b!32903 () Bool)

(assert (=> b!32903 (= e!21776 e!21770)))

(declare-fun res!28130 () Bool)

(assert (=> b!32903 (=> res!28130 e!21770)))

(assert (=> b!32903 (= res!28130 (not (= lt!48580 (bvsub (bvadd lt!48583 to!314) i!635))))))

(assert (=> b!32903 (= lt!48580 (bitIndex!0 (size!811 (buf!1139 (_2!1766 lt!48570))) (currentByte!2506 (_2!1766 lt!48570)) (currentBit!2501 (_2!1766 lt!48570))))))

(declare-fun b!32904 () Bool)

(declare-fun res!28131 () Bool)

(assert (=> b!32904 (=> res!28131 e!21770)))

(assert (=> b!32904 (= res!28131 (not (invariant!0 (currentBit!2501 (_2!1766 lt!48570)) (currentByte!2506 (_2!1766 lt!48570)) (size!811 (buf!1139 (_2!1766 lt!48570))))))))

(declare-fun b!32905 () Bool)

(assert (=> b!32905 (= e!21772 e!21780)))

(declare-fun res!28134 () Bool)

(assert (=> b!32905 (=> res!28134 e!21780)))

(assert (=> b!32905 (= res!28134 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!32905 (= lt!48568 (bitStreamReadBitsIntoList!0 (_2!1766 lt!48570) (_1!1767 lt!48572) lt!48578))))

(assert (=> b!32905 (= lt!48569 (bitStreamReadBitsIntoList!0 (_2!1766 lt!48570) (_1!1767 lt!48571) (bvsub to!314 i!635)))))

(assert (=> b!32905 (validate_offset_bits!1 ((_ sign_extend 32) (size!811 (buf!1139 (_2!1766 lt!48570)))) ((_ sign_extend 32) (currentByte!2506 (_2!1766 lt!48575))) ((_ sign_extend 32) (currentBit!2501 (_2!1766 lt!48575))) lt!48578)))

(declare-fun lt!48579 () Unit!2477)

(assert (=> b!32905 (= lt!48579 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1766 lt!48575) (buf!1139 (_2!1766 lt!48570)) lt!48578))))

(assert (=> b!32905 (= lt!48572 (reader!0 (_2!1766 lt!48575) (_2!1766 lt!48570)))))

(assert (=> b!32905 (validate_offset_bits!1 ((_ sign_extend 32) (size!811 (buf!1139 (_2!1766 lt!48570)))) ((_ sign_extend 32) (currentByte!2506 thiss!1379)) ((_ sign_extend 32) (currentBit!2501 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48581 () Unit!2477)

(assert (=> b!32905 (= lt!48581 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1139 (_2!1766 lt!48570)) (bvsub to!314 i!635)))))

(assert (=> b!32905 (= lt!48571 (reader!0 thiss!1379 (_2!1766 lt!48570)))))

(assert (= (and start!6902 res!28137) b!32900))

(assert (= (and b!32900 res!28141) b!32902))

(assert (= (and b!32902 (not res!28136)) b!32898))

(assert (= (and b!32898 (not res!28135)) b!32890))

(assert (= (and b!32890 res!28143) b!32892))

(assert (= (and b!32890 (not res!28138)) b!32903))

(assert (= (and b!32903 (not res!28130)) b!32904))

(assert (= (and b!32904 (not res!28131)) b!32893))

(assert (= (and b!32893 (not res!28139)) b!32899))

(assert (= (and b!32899 res!28140) b!32897))

(assert (= (and b!32899 (not res!28133)) b!32894))

(assert (= (and b!32894 (not res!28142)) b!32895))

(assert (= (and b!32895 (not res!28129)) b!32905))

(assert (= (and b!32905 (not res!28134)) b!32901))

(assert (= (and b!32901 (not res!28132)) b!32891))

(assert (= start!6902 b!32896))

(declare-fun m!48705 () Bool)

(assert (=> b!32900 m!48705))

(declare-fun m!48707 () Bool)

(assert (=> b!32892 m!48707))

(assert (=> b!32892 m!48707))

(declare-fun m!48709 () Bool)

(assert (=> b!32892 m!48709))

(declare-fun m!48711 () Bool)

(assert (=> b!32892 m!48711))

(assert (=> b!32892 m!48711))

(declare-fun m!48713 () Bool)

(assert (=> b!32892 m!48713))

(declare-fun m!48715 () Bool)

(assert (=> b!32890 m!48715))

(declare-fun m!48717 () Bool)

(assert (=> b!32890 m!48717))

(declare-fun m!48719 () Bool)

(assert (=> b!32890 m!48719))

(declare-fun m!48721 () Bool)

(assert (=> b!32890 m!48721))

(declare-fun m!48723 () Bool)

(assert (=> b!32890 m!48723))

(declare-fun m!48725 () Bool)

(assert (=> b!32890 m!48725))

(declare-fun m!48727 () Bool)

(assert (=> b!32890 m!48727))

(declare-fun m!48729 () Bool)

(assert (=> b!32897 m!48729))

(declare-fun m!48731 () Bool)

(assert (=> b!32903 m!48731))

(declare-fun m!48733 () Bool)

(assert (=> b!32891 m!48733))

(declare-fun m!48735 () Bool)

(assert (=> b!32891 m!48735))

(declare-fun m!48737 () Bool)

(assert (=> b!32901 m!48737))

(declare-fun m!48739 () Bool)

(assert (=> b!32905 m!48739))

(declare-fun m!48741 () Bool)

(assert (=> b!32905 m!48741))

(declare-fun m!48743 () Bool)

(assert (=> b!32905 m!48743))

(declare-fun m!48745 () Bool)

(assert (=> b!32905 m!48745))

(declare-fun m!48747 () Bool)

(assert (=> b!32905 m!48747))

(declare-fun m!48749 () Bool)

(assert (=> b!32905 m!48749))

(declare-fun m!48751 () Bool)

(assert (=> b!32905 m!48751))

(declare-fun m!48753 () Bool)

(assert (=> b!32905 m!48753))

(declare-fun m!48755 () Bool)

(assert (=> b!32894 m!48755))

(declare-fun m!48757 () Bool)

(assert (=> b!32896 m!48757))

(declare-fun m!48759 () Bool)

(assert (=> b!32902 m!48759))

(declare-fun m!48761 () Bool)

(assert (=> b!32902 m!48761))

(declare-fun m!48763 () Bool)

(assert (=> b!32902 m!48763))

(declare-fun m!48765 () Bool)

(assert (=> start!6902 m!48765))

(declare-fun m!48767 () Bool)

(assert (=> start!6902 m!48767))

(declare-fun m!48769 () Bool)

(assert (=> b!32895 m!48769))

(declare-fun m!48771 () Bool)

(assert (=> b!32898 m!48771))

(declare-fun m!48773 () Bool)

(assert (=> b!32898 m!48773))

(declare-fun m!48775 () Bool)

(assert (=> b!32898 m!48775))

(declare-fun m!48777 () Bool)

(assert (=> b!32898 m!48777))

(assert (=> b!32898 m!48773))

(declare-fun m!48779 () Bool)

(assert (=> b!32898 m!48779))

(declare-fun m!48781 () Bool)

(assert (=> b!32904 m!48781))

(push 1)

(assert (not b!32892))

(assert (not b!32891))

(assert (not start!6902))

(assert (not b!32890))

(assert (not b!32897))

(assert (not b!32901))

(assert (not b!32902))

(assert (not b!32904))

(assert (not b!32905))

(assert (not b!32896))

(assert (not b!32900))

(assert (not b!32898))

(assert (not b!32895))

(assert (not b!32903))

(assert (not b!32894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

