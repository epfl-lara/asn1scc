; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6754 () Bool)

(assert start!6754)

(declare-fun b!31713 () Bool)

(declare-fun e!21005 () Bool)

(declare-fun e!21016 () Bool)

(assert (=> b!31713 (= e!21005 e!21016)))

(declare-fun res!27132 () Bool)

(assert (=> b!31713 (=> res!27132 e!21016)))

(declare-datatypes ((array!1807 0))(
  ( (array!1808 (arr!1266 (Array (_ BitVec 32) (_ BitVec 8))) (size!794 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1386 0))(
  ( (BitStream!1387 (buf!1122 array!1807) (currentByte!2483 (_ BitVec 32)) (currentBit!2478 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1386)

(declare-datatypes ((Unit!2419 0))(
  ( (Unit!2420) )
))
(declare-datatypes ((tuple2!3278 0))(
  ( (tuple2!3279 (_1!1726 Unit!2419) (_2!1726 BitStream!1386)) )
))
(declare-fun lt!46811 () tuple2!3278)

(declare-fun isPrefixOf!0 (BitStream!1386 BitStream!1386) Bool)

(assert (=> b!31713 (= res!27132 (not (isPrefixOf!0 thiss!1379 (_2!1726 lt!46811))))))

(declare-fun lt!46804 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31713 (validate_offset_bits!1 ((_ sign_extend 32) (size!794 (buf!1122 (_2!1726 lt!46811)))) ((_ sign_extend 32) (currentByte!2483 (_2!1726 lt!46811))) ((_ sign_extend 32) (currentBit!2478 (_2!1726 lt!46811))) lt!46804)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!31713 (= lt!46804 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46805 () Unit!2419)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1386 BitStream!1386 (_ BitVec 64) (_ BitVec 64)) Unit!2419)

(assert (=> b!31713 (= lt!46805 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1726 lt!46811) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1807)

(declare-fun appendBitFromByte!0 (BitStream!1386 (_ BitVec 8) (_ BitVec 32)) tuple2!3278)

(assert (=> b!31713 (= lt!46811 (appendBitFromByte!0 thiss!1379 (select (arr!1266 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!21012 () Bool)

(declare-fun b!31714 () Bool)

(declare-datatypes ((tuple2!3280 0))(
  ( (tuple2!3281 (_1!1727 BitStream!1386) (_2!1727 BitStream!1386)) )
))
(declare-fun lt!46806 () tuple2!3280)

(declare-datatypes ((List!394 0))(
  ( (Nil!391) (Cons!390 (h!509 Bool) (t!1144 List!394)) )
))
(declare-fun head!231 (List!394) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1386 array!1807 (_ BitVec 64) (_ BitVec 64)) List!394)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1386 BitStream!1386 (_ BitVec 64)) List!394)

(assert (=> b!31714 (= e!21012 (= (head!231 (byteArrayBitContentToList!0 (_2!1726 lt!46811) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!231 (bitStreamReadBitsIntoList!0 (_2!1726 lt!46811) (_1!1727 lt!46806) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!31715 () Bool)

(declare-fun e!21007 () Bool)

(assert (=> b!31715 (= e!21007 (not e!21005))))

(declare-fun res!27142 () Bool)

(assert (=> b!31715 (=> res!27142 e!21005)))

(assert (=> b!31715 (= res!27142 (bvsge i!635 to!314))))

(assert (=> b!31715 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!46803 () Unit!2419)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1386) Unit!2419)

(assert (=> b!31715 (= lt!46803 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!46799 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!31715 (= lt!46799 (bitIndex!0 (size!794 (buf!1122 thiss!1379)) (currentByte!2483 thiss!1379) (currentBit!2478 thiss!1379)))))

(declare-fun b!31716 () Bool)

(declare-fun res!27130 () Bool)

(assert (=> b!31716 (=> (not res!27130) (not e!21007))))

(assert (=> b!31716 (= res!27130 (validate_offset_bits!1 ((_ sign_extend 32) (size!794 (buf!1122 thiss!1379))) ((_ sign_extend 32) (currentByte!2483 thiss!1379)) ((_ sign_extend 32) (currentBit!2478 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!31717 () Bool)

(declare-fun res!27138 () Bool)

(declare-fun e!21015 () Bool)

(assert (=> b!31717 (=> res!27138 e!21015)))

(declare-fun lt!46812 () List!394)

(declare-fun length!120 (List!394) Int)

(assert (=> b!31717 (= res!27138 (<= (length!120 lt!46812) 0))))

(declare-fun b!31718 () Bool)

(declare-fun res!27134 () Bool)

(declare-fun e!21014 () Bool)

(assert (=> b!31718 (=> res!27134 e!21014)))

(declare-fun lt!46815 () Bool)

(assert (=> b!31718 (= res!27134 (not (= (head!231 lt!46812) lt!46815)))))

(declare-fun b!31720 () Bool)

(declare-fun e!21008 () Bool)

(assert (=> b!31720 (= e!21008 e!21014)))

(declare-fun res!27146 () Bool)

(assert (=> b!31720 (=> res!27146 e!21014)))

(declare-fun lt!46797 () tuple2!3280)

(declare-fun bitAt!0 (array!1807 (_ BitVec 64)) Bool)

(assert (=> b!31720 (= res!27146 (not (= lt!46815 (bitAt!0 (buf!1122 (_1!1727 lt!46797)) lt!46799))))))

(declare-fun lt!46816 () tuple2!3280)

(assert (=> b!31720 (= lt!46815 (bitAt!0 (buf!1122 (_1!1727 lt!46816)) lt!46799))))

(declare-fun b!31721 () Bool)

(declare-fun e!21009 () Bool)

(assert (=> b!31721 (= e!21016 e!21009)))

(declare-fun res!27145 () Bool)

(assert (=> b!31721 (=> res!27145 e!21009)))

(declare-fun lt!46810 () tuple2!3278)

(assert (=> b!31721 (= res!27145 (not (isPrefixOf!0 (_2!1726 lt!46811) (_2!1726 lt!46810))))))

(assert (=> b!31721 (isPrefixOf!0 thiss!1379 (_2!1726 lt!46810))))

(declare-fun lt!46807 () Unit!2419)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1386 BitStream!1386 BitStream!1386) Unit!2419)

(assert (=> b!31721 (= lt!46807 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1726 lt!46811) (_2!1726 lt!46810)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1386 array!1807 (_ BitVec 64) (_ BitVec 64)) tuple2!3278)

(assert (=> b!31721 (= lt!46810 (appendBitsMSBFirstLoop!0 (_2!1726 lt!46811) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!31721 e!21012))

(declare-fun res!27136 () Bool)

(assert (=> b!31721 (=> (not res!27136) (not e!21012))))

(assert (=> b!31721 (= res!27136 (validate_offset_bits!1 ((_ sign_extend 32) (size!794 (buf!1122 (_2!1726 lt!46811)))) ((_ sign_extend 32) (currentByte!2483 thiss!1379)) ((_ sign_extend 32) (currentBit!2478 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46813 () Unit!2419)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1386 array!1807 (_ BitVec 64)) Unit!2419)

(assert (=> b!31721 (= lt!46813 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1122 (_2!1726 lt!46811)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1386 BitStream!1386) tuple2!3280)

(assert (=> b!31721 (= lt!46806 (reader!0 thiss!1379 (_2!1726 lt!46811)))))

(declare-fun b!31722 () Bool)

(assert (=> b!31722 (= e!21015 e!21008)))

(declare-fun res!27135 () Bool)

(assert (=> b!31722 (=> res!27135 e!21008)))

(declare-fun lt!46809 () List!394)

(declare-fun lt!46802 () List!394)

(assert (=> b!31722 (= res!27135 (not (= lt!46809 lt!46802)))))

(assert (=> b!31722 (= lt!46802 lt!46809)))

(declare-fun tail!111 (List!394) List!394)

(assert (=> b!31722 (= lt!46809 (tail!111 lt!46812))))

(declare-fun lt!46808 () Unit!2419)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1386 BitStream!1386 BitStream!1386 BitStream!1386 (_ BitVec 64) List!394) Unit!2419)

(assert (=> b!31722 (= lt!46808 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1726 lt!46810) (_2!1726 lt!46810) (_1!1727 lt!46816) (_1!1727 lt!46797) (bvsub to!314 i!635) lt!46812))))

(declare-fun b!31723 () Bool)

(declare-fun e!21011 () Bool)

(assert (=> b!31723 (= e!21009 e!21011)))

(declare-fun res!27131 () Bool)

(assert (=> b!31723 (=> res!27131 e!21011)))

(declare-fun lt!46801 () (_ BitVec 64))

(assert (=> b!31723 (= res!27131 (not (= lt!46801 (bvsub (bvadd lt!46799 to!314) i!635))))))

(assert (=> b!31723 (= lt!46801 (bitIndex!0 (size!794 (buf!1122 (_2!1726 lt!46810))) (currentByte!2483 (_2!1726 lt!46810)) (currentBit!2478 (_2!1726 lt!46810))))))

(declare-fun b!31724 () Bool)

(declare-fun lt!46798 () (_ BitVec 64))

(assert (=> b!31724 (= e!21014 (bvslt i!635 lt!46798))))

(declare-fun b!31725 () Bool)

(declare-fun e!21010 () Bool)

(assert (=> b!31725 (= e!21010 (= lt!46801 (bvsub (bvsub (bvadd (bitIndex!0 (size!794 (buf!1122 (_2!1726 lt!46811))) (currentByte!2483 (_2!1726 lt!46811)) (currentBit!2478 (_2!1726 lt!46811))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!31726 () Bool)

(declare-fun e!21018 () Bool)

(assert (=> b!31726 (= e!21018 e!21007)))

(declare-fun res!27139 () Bool)

(assert (=> b!31726 (=> (not res!27139) (not e!21007))))

(assert (=> b!31726 (= res!27139 (bvsle to!314 lt!46798))))

(assert (=> b!31726 (= lt!46798 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!794 srcBuffer!2))))))

(declare-fun b!31727 () Bool)

(declare-fun res!27143 () Bool)

(assert (=> b!31727 (=> res!27143 e!21011)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!31727 (= res!27143 (not (invariant!0 (currentBit!2478 (_2!1726 lt!46810)) (currentByte!2483 (_2!1726 lt!46810)) (size!794 (buf!1122 (_2!1726 lt!46810))))))))

(declare-fun b!31728 () Bool)

(declare-fun res!27141 () Bool)

(assert (=> b!31728 (=> res!27141 e!21011)))

(assert (=> b!31728 (= res!27141 (not (= (size!794 (buf!1122 thiss!1379)) (size!794 (buf!1122 (_2!1726 lt!46810))))))))

(declare-fun b!31729 () Bool)

(declare-fun e!21013 () Bool)

(declare-fun array_inv!746 (array!1807) Bool)

(assert (=> b!31729 (= e!21013 (array_inv!746 (buf!1122 thiss!1379)))))

(declare-fun b!31730 () Bool)

(declare-fun e!21017 () Bool)

(assert (=> b!31730 (= e!21011 e!21017)))

(declare-fun res!27140 () Bool)

(assert (=> b!31730 (=> res!27140 e!21017)))

(assert (=> b!31730 (= res!27140 (not (= (size!794 (buf!1122 (_2!1726 lt!46811))) (size!794 (buf!1122 (_2!1726 lt!46810))))))))

(assert (=> b!31730 e!21010))

(declare-fun res!27133 () Bool)

(assert (=> b!31730 (=> (not res!27133) (not e!21010))))

(assert (=> b!31730 (= res!27133 (= (size!794 (buf!1122 (_2!1726 lt!46810))) (size!794 (buf!1122 thiss!1379))))))

(declare-fun res!27147 () Bool)

(assert (=> start!6754 (=> (not res!27147) (not e!21018))))

(assert (=> start!6754 (= res!27147 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!6754 e!21018))

(assert (=> start!6754 true))

(declare-fun inv!12 (BitStream!1386) Bool)

(assert (=> start!6754 (and (inv!12 thiss!1379) e!21013)))

(assert (=> start!6754 (array_inv!746 srcBuffer!2)))

(declare-fun b!31719 () Bool)

(declare-fun res!27129 () Bool)

(assert (=> b!31719 (=> res!27129 e!21017)))

(assert (=> b!31719 (= res!27129 (not (invariant!0 (currentBit!2478 (_2!1726 lt!46811)) (currentByte!2483 (_2!1726 lt!46811)) (size!794 (buf!1122 (_2!1726 lt!46810))))))))

(declare-fun b!31731 () Bool)

(assert (=> b!31731 (= e!21017 e!21015)))

(declare-fun res!27137 () Bool)

(assert (=> b!31731 (=> res!27137 e!21015)))

(assert (=> b!31731 (= res!27137 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!31731 (= lt!46802 (bitStreamReadBitsIntoList!0 (_2!1726 lt!46810) (_1!1727 lt!46797) lt!46804))))

(assert (=> b!31731 (= lt!46812 (bitStreamReadBitsIntoList!0 (_2!1726 lt!46810) (_1!1727 lt!46816) (bvsub to!314 i!635)))))

(assert (=> b!31731 (validate_offset_bits!1 ((_ sign_extend 32) (size!794 (buf!1122 (_2!1726 lt!46810)))) ((_ sign_extend 32) (currentByte!2483 (_2!1726 lt!46811))) ((_ sign_extend 32) (currentBit!2478 (_2!1726 lt!46811))) lt!46804)))

(declare-fun lt!46800 () Unit!2419)

(assert (=> b!31731 (= lt!46800 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1726 lt!46811) (buf!1122 (_2!1726 lt!46810)) lt!46804))))

(assert (=> b!31731 (= lt!46797 (reader!0 (_2!1726 lt!46811) (_2!1726 lt!46810)))))

(assert (=> b!31731 (validate_offset_bits!1 ((_ sign_extend 32) (size!794 (buf!1122 (_2!1726 lt!46810)))) ((_ sign_extend 32) (currentByte!2483 thiss!1379)) ((_ sign_extend 32) (currentBit!2478 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!46814 () Unit!2419)

(assert (=> b!31731 (= lt!46814 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1122 (_2!1726 lt!46810)) (bvsub to!314 i!635)))))

(assert (=> b!31731 (= lt!46816 (reader!0 thiss!1379 (_2!1726 lt!46810)))))

(declare-fun b!31732 () Bool)

(declare-fun res!27144 () Bool)

(assert (=> b!31732 (=> res!27144 e!21017)))

(assert (=> b!31732 (= res!27144 (not (invariant!0 (currentBit!2478 (_2!1726 lt!46811)) (currentByte!2483 (_2!1726 lt!46811)) (size!794 (buf!1122 (_2!1726 lt!46811))))))))

(assert (= (and start!6754 res!27147) b!31726))

(assert (= (and b!31726 res!27139) b!31716))

(assert (= (and b!31716 res!27130) b!31715))

(assert (= (and b!31715 (not res!27142)) b!31713))

(assert (= (and b!31713 (not res!27132)) b!31721))

(assert (= (and b!31721 res!27136) b!31714))

(assert (= (and b!31721 (not res!27145)) b!31723))

(assert (= (and b!31723 (not res!27131)) b!31727))

(assert (= (and b!31727 (not res!27143)) b!31728))

(assert (= (and b!31728 (not res!27141)) b!31730))

(assert (= (and b!31730 res!27133) b!31725))

(assert (= (and b!31730 (not res!27140)) b!31732))

(assert (= (and b!31732 (not res!27144)) b!31719))

(assert (= (and b!31719 (not res!27129)) b!31731))

(assert (= (and b!31731 (not res!27137)) b!31717))

(assert (= (and b!31717 (not res!27138)) b!31722))

(assert (= (and b!31722 (not res!27135)) b!31720))

(assert (= (and b!31720 (not res!27146)) b!31718))

(assert (= (and b!31718 (not res!27134)) b!31724))

(assert (= start!6754 b!31729))

(declare-fun m!46737 () Bool)

(assert (=> b!31727 m!46737))

(declare-fun m!46739 () Bool)

(assert (=> b!31721 m!46739))

(declare-fun m!46741 () Bool)

(assert (=> b!31721 m!46741))

(declare-fun m!46743 () Bool)

(assert (=> b!31721 m!46743))

(declare-fun m!46745 () Bool)

(assert (=> b!31721 m!46745))

(declare-fun m!46747 () Bool)

(assert (=> b!31721 m!46747))

(declare-fun m!46749 () Bool)

(assert (=> b!31721 m!46749))

(declare-fun m!46751 () Bool)

(assert (=> b!31721 m!46751))

(declare-fun m!46753 () Bool)

(assert (=> b!31732 m!46753))

(declare-fun m!46755 () Bool)

(assert (=> start!6754 m!46755))

(declare-fun m!46757 () Bool)

(assert (=> start!6754 m!46757))

(declare-fun m!46759 () Bool)

(assert (=> b!31716 m!46759))

(declare-fun m!46761 () Bool)

(assert (=> b!31714 m!46761))

(assert (=> b!31714 m!46761))

(declare-fun m!46763 () Bool)

(assert (=> b!31714 m!46763))

(declare-fun m!46765 () Bool)

(assert (=> b!31714 m!46765))

(assert (=> b!31714 m!46765))

(declare-fun m!46767 () Bool)

(assert (=> b!31714 m!46767))

(declare-fun m!46769 () Bool)

(assert (=> b!31722 m!46769))

(declare-fun m!46771 () Bool)

(assert (=> b!31722 m!46771))

(declare-fun m!46773 () Bool)

(assert (=> b!31713 m!46773))

(declare-fun m!46775 () Bool)

(assert (=> b!31713 m!46775))

(declare-fun m!46777 () Bool)

(assert (=> b!31713 m!46777))

(assert (=> b!31713 m!46775))

(declare-fun m!46779 () Bool)

(assert (=> b!31713 m!46779))

(declare-fun m!46781 () Bool)

(assert (=> b!31713 m!46781))

(declare-fun m!46783 () Bool)

(assert (=> b!31719 m!46783))

(declare-fun m!46785 () Bool)

(assert (=> b!31718 m!46785))

(declare-fun m!46787 () Bool)

(assert (=> b!31717 m!46787))

(declare-fun m!46789 () Bool)

(assert (=> b!31720 m!46789))

(declare-fun m!46791 () Bool)

(assert (=> b!31720 m!46791))

(declare-fun m!46793 () Bool)

(assert (=> b!31723 m!46793))

(declare-fun m!46795 () Bool)

(assert (=> b!31731 m!46795))

(declare-fun m!46797 () Bool)

(assert (=> b!31731 m!46797))

(declare-fun m!46799 () Bool)

(assert (=> b!31731 m!46799))

(declare-fun m!46801 () Bool)

(assert (=> b!31731 m!46801))

(declare-fun m!46803 () Bool)

(assert (=> b!31731 m!46803))

(declare-fun m!46805 () Bool)

(assert (=> b!31731 m!46805))

(declare-fun m!46807 () Bool)

(assert (=> b!31731 m!46807))

(declare-fun m!46809 () Bool)

(assert (=> b!31731 m!46809))

(declare-fun m!46811 () Bool)

(assert (=> b!31725 m!46811))

(declare-fun m!46813 () Bool)

(assert (=> b!31715 m!46813))

(declare-fun m!46815 () Bool)

(assert (=> b!31715 m!46815))

(declare-fun m!46817 () Bool)

(assert (=> b!31715 m!46817))

(declare-fun m!46819 () Bool)

(assert (=> b!31729 m!46819))

(check-sat (not b!31722) (not b!31713) (not b!31723) (not b!31718) (not b!31731) (not b!31729) (not b!31721) (not b!31716) (not b!31719) (not b!31717) (not b!31725) (not b!31727) (not b!31720) (not b!31732) (not start!6754) (not b!31714) (not b!31715))
(check-sat)
