; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9764 () Bool)

(assert start!9764)

(declare-datatypes ((array!2311 0))(
  ( (array!2312 (arr!1574 (Array (_ BitVec 32) (_ BitVec 8))) (size!1048 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2311)

(declare-datatypes ((BitStream!1816 0))(
  ( (BitStream!1817 (buf!1400 array!2311) (currentByte!2917 (_ BitVec 32)) (currentBit!2912 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!4596 0))(
  ( (tuple2!4597 (_1!2397 BitStream!1816) (_2!2397 BitStream!1816)) )
))
(declare-fun lt!75686 () tuple2!4596)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((Unit!3414 0))(
  ( (Unit!3415) )
))
(declare-datatypes ((tuple2!4598 0))(
  ( (tuple2!4599 (_1!2398 Unit!3414) (_2!2398 BitStream!1816)) )
))
(declare-fun lt!75692 () tuple2!4598)

(declare-fun e!32221 () Bool)

(declare-fun b!48723 () Bool)

(declare-datatypes ((List!549 0))(
  ( (Nil!546) (Cons!545 (h!664 Bool) (t!1299 List!549)) )
))
(declare-fun head!368 (List!549) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1816 array!2311 (_ BitVec 64) (_ BitVec 64)) List!549)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1816 BitStream!1816 (_ BitVec 64)) List!549)

(assert (=> b!48723 (= e!32221 (= (head!368 (byteArrayBitContentToList!0 (_2!2398 lt!75692) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!368 (bitStreamReadBitsIntoList!0 (_2!2398 lt!75692) (_1!2397 lt!75686) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!48724 () Bool)

(declare-fun e!32232 () Bool)

(declare-fun e!32226 () Bool)

(assert (=> b!48724 (= e!32232 e!32226)))

(declare-fun res!40908 () Bool)

(assert (=> b!48724 (=> res!40908 e!32226)))

(declare-fun thiss!1379 () BitStream!1816)

(declare-fun isPrefixOf!0 (BitStream!1816 BitStream!1816) Bool)

(assert (=> b!48724 (= res!40908 (not (isPrefixOf!0 thiss!1379 (_2!2398 lt!75692))))))

(declare-fun lt!75702 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48724 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!75702)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!48724 (= lt!75702 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75700 () Unit!3414)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1816 BitStream!1816 (_ BitVec 64) (_ BitVec 64)) Unit!3414)

(assert (=> b!48724 (= lt!75700 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2398 lt!75692) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1816 (_ BitVec 8) (_ BitVec 32)) tuple2!4598)

(assert (=> b!48724 (= lt!75692 (appendBitFromByte!0 thiss!1379 (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!48725 () Bool)

(declare-fun e!32229 () Bool)

(declare-fun e!32230 () Bool)

(assert (=> b!48725 (= e!32229 e!32230)))

(declare-fun res!40902 () Bool)

(assert (=> b!48725 (=> res!40902 e!32230)))

(assert (=> b!48725 (= res!40902 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!75701 () tuple2!4596)

(declare-fun lt!75694 () List!549)

(declare-fun lt!75689 () tuple2!4598)

(assert (=> b!48725 (= lt!75694 (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_1!2397 lt!75701) lt!75702))))

(declare-fun lt!75696 () List!549)

(declare-fun lt!75703 () tuple2!4596)

(assert (=> b!48725 (= lt!75696 (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_1!2397 lt!75703) (bvsub to!314 i!635)))))

(assert (=> b!48725 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!75702)))

(declare-fun lt!75693 () Unit!3414)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1816 array!2311 (_ BitVec 64)) Unit!3414)

(assert (=> b!48725 (= lt!75693 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!75689)) lt!75702))))

(declare-fun reader!0 (BitStream!1816 BitStream!1816) tuple2!4596)

(assert (=> b!48725 (= lt!75701 (reader!0 (_2!2398 lt!75692) (_2!2398 lt!75689)))))

(assert (=> b!48725 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!75688 () Unit!3414)

(assert (=> b!48725 (= lt!75688 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1400 (_2!2398 lt!75689)) (bvsub to!314 i!635)))))

(assert (=> b!48725 (= lt!75703 (reader!0 thiss!1379 (_2!2398 lt!75689)))))

(declare-fun res!40917 () Bool)

(declare-fun e!32231 () Bool)

(assert (=> start!9764 (=> (not res!40917) (not e!32231))))

(assert (=> start!9764 (= res!40917 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1048 srcBuffer!2))))))))

(assert (=> start!9764 e!32231))

(assert (=> start!9764 true))

(declare-fun array_inv!961 (array!2311) Bool)

(assert (=> start!9764 (array_inv!961 srcBuffer!2)))

(declare-fun e!32220 () Bool)

(declare-fun inv!12 (BitStream!1816) Bool)

(assert (=> start!9764 (and (inv!12 thiss!1379) e!32220)))

(declare-fun b!48726 () Bool)

(declare-fun res!40920 () Bool)

(assert (=> b!48726 (=> res!40920 e!32229)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!48726 (= res!40920 (not (invariant!0 (currentBit!2912 (_2!2398 lt!75692)) (currentByte!2917 (_2!2398 lt!75692)) (size!1048 (buf!1400 (_2!2398 lt!75689))))))))

(declare-fun b!48727 () Bool)

(declare-fun res!40919 () Bool)

(assert (=> b!48727 (=> res!40919 e!32229)))

(assert (=> b!48727 (= res!40919 (not (invariant!0 (currentBit!2912 (_2!2398 lt!75692)) (currentByte!2917 (_2!2398 lt!75692)) (size!1048 (buf!1400 (_2!2398 lt!75692))))))))

(declare-fun b!48728 () Bool)

(assert (=> b!48728 (= e!32231 (not e!32232))))

(declare-fun res!40909 () Bool)

(assert (=> b!48728 (=> res!40909 e!32232)))

(assert (=> b!48728 (= res!40909 (bvsge i!635 to!314))))

(assert (=> b!48728 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!75697 () Unit!3414)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1816) Unit!3414)

(assert (=> b!48728 (= lt!75697 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!75690 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!48728 (= lt!75690 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)))))

(declare-fun b!48729 () Bool)

(declare-fun e!32233 () Bool)

(assert (=> b!48729 (= e!32226 e!32233)))

(declare-fun res!40918 () Bool)

(assert (=> b!48729 (=> res!40918 e!32233)))

(assert (=> b!48729 (= res!40918 (not (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!75689))))))

(assert (=> b!48729 (isPrefixOf!0 thiss!1379 (_2!2398 lt!75689))))

(declare-fun lt!75685 () Unit!3414)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1816 BitStream!1816 BitStream!1816) Unit!3414)

(assert (=> b!48729 (= lt!75685 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2398 lt!75692) (_2!2398 lt!75689)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1816 array!2311 (_ BitVec 64) (_ BitVec 64)) tuple2!4598)

(assert (=> b!48729 (= lt!75689 (appendBitsMSBFirstLoop!0 (_2!2398 lt!75692) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!48729 e!32221))

(declare-fun res!40907 () Bool)

(assert (=> b!48729 (=> (not res!40907) (not e!32221))))

(assert (=> b!48729 (= res!40907 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!75695 () Unit!3414)

(assert (=> b!48729 (= lt!75695 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1400 (_2!2398 lt!75692)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!48729 (= lt!75686 (reader!0 thiss!1379 (_2!2398 lt!75692)))))

(declare-fun b!48730 () Bool)

(declare-fun lt!75699 () (_ BitVec 64))

(declare-fun e!32234 () Bool)

(assert (=> b!48730 (= e!32234 (= lt!75699 (bvsub (bvsub (bvadd (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!48731 () Bool)

(declare-fun e!32225 () Bool)

(assert (=> b!48731 (= e!32230 e!32225)))

(declare-fun res!40913 () Bool)

(assert (=> b!48731 (=> res!40913 e!32225)))

(declare-fun lt!75684 () List!549)

(assert (=> b!48731 (= res!40913 (not (= lt!75684 lt!75694)))))

(assert (=> b!48731 (= lt!75694 lt!75684)))

(declare-fun tail!235 (List!549) List!549)

(assert (=> b!48731 (= lt!75684 (tail!235 lt!75696))))

(declare-fun lt!75698 () Unit!3414)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1816 BitStream!1816 BitStream!1816 BitStream!1816 (_ BitVec 64) List!549) Unit!3414)

(assert (=> b!48731 (= lt!75698 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2398 lt!75689) (_2!2398 lt!75689) (_1!2397 lt!75703) (_1!2397 lt!75701) (bvsub to!314 i!635) lt!75696))))

(declare-fun b!48732 () Bool)

(declare-fun res!40905 () Bool)

(declare-fun e!32228 () Bool)

(assert (=> b!48732 (=> res!40905 e!32228)))

(assert (=> b!48732 (= res!40905 (not (invariant!0 (currentBit!2912 (_2!2398 lt!75689)) (currentByte!2917 (_2!2398 lt!75689)) (size!1048 (buf!1400 (_2!2398 lt!75689))))))))

(declare-fun b!48733 () Bool)

(declare-fun e!32223 () Bool)

(assert (=> b!48733 (= e!32225 e!32223)))

(declare-fun res!40914 () Bool)

(assert (=> b!48733 (=> res!40914 e!32223)))

(declare-fun lt!75691 () Bool)

(declare-fun bitAt!0 (array!2311 (_ BitVec 64)) Bool)

(assert (=> b!48733 (= res!40914 (not (= lt!75691 (bitAt!0 (buf!1400 (_1!2397 lt!75701)) lt!75690))))))

(assert (=> b!48733 (= lt!75691 (bitAt!0 (buf!1400 (_1!2397 lt!75703)) lt!75690))))

(declare-fun b!48734 () Bool)

(assert (=> b!48734 (= e!32220 (array_inv!961 (buf!1400 thiss!1379)))))

(declare-fun b!48735 () Bool)

(assert (=> b!48735 (= e!32233 e!32228)))

(declare-fun res!40903 () Bool)

(assert (=> b!48735 (=> res!40903 e!32228)))

(assert (=> b!48735 (= res!40903 (not (= lt!75699 (bvsub (bvadd lt!75690 to!314) i!635))))))

(assert (=> b!48735 (= lt!75699 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689))))))

(declare-fun b!48736 () Bool)

(assert (=> b!48736 (= e!32228 e!32229)))

(declare-fun res!40910 () Bool)

(assert (=> b!48736 (=> res!40910 e!32229)))

(assert (=> b!48736 (= res!40910 (not (= (size!1048 (buf!1400 (_2!2398 lt!75692))) (size!1048 (buf!1400 (_2!2398 lt!75689))))))))

(assert (=> b!48736 e!32234))

(declare-fun res!40916 () Bool)

(assert (=> b!48736 (=> (not res!40916) (not e!32234))))

(assert (=> b!48736 (= res!40916 (= (size!1048 (buf!1400 (_2!2398 lt!75689))) (size!1048 (buf!1400 thiss!1379))))))

(declare-fun b!48737 () Bool)

(declare-fun e!32224 () Bool)

(assert (=> b!48737 (= e!32223 e!32224)))

(declare-fun res!40915 () Bool)

(assert (=> b!48737 (=> res!40915 e!32224)))

(declare-fun lt!75687 () Bool)

(assert (=> b!48737 (= res!40915 (not (= (head!368 (byteArrayBitContentToList!0 (_2!2398 lt!75689) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!75687)))))

(assert (=> b!48737 (= lt!75687 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!48738 () Bool)

(declare-fun res!40904 () Bool)

(assert (=> b!48738 (=> res!40904 e!32223)))

(assert (=> b!48738 (= res!40904 (not (= (head!368 lt!75696) lt!75691)))))

(declare-fun b!48739 () Bool)

(declare-fun res!40911 () Bool)

(assert (=> b!48739 (=> (not res!40911) (not e!32231))))

(assert (=> b!48739 (= res!40911 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 thiss!1379))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!48740 () Bool)

(declare-fun res!40906 () Bool)

(assert (=> b!48740 (=> res!40906 e!32230)))

(declare-fun length!244 (List!549) Int)

(assert (=> b!48740 (= res!40906 (<= (length!244 lt!75696) 0))))

(declare-fun b!48741 () Bool)

(assert (=> b!48741 (= e!32224 (= (bitAt!0 (buf!1400 (_2!2398 lt!75692)) lt!75690) lt!75687))))

(declare-fun b!48742 () Bool)

(declare-fun res!40912 () Bool)

(assert (=> b!48742 (=> res!40912 e!32228)))

(assert (=> b!48742 (= res!40912 (not (= (size!1048 (buf!1400 thiss!1379)) (size!1048 (buf!1400 (_2!2398 lt!75689))))))))

(assert (= (and start!9764 res!40917) b!48739))

(assert (= (and b!48739 res!40911) b!48728))

(assert (= (and b!48728 (not res!40909)) b!48724))

(assert (= (and b!48724 (not res!40908)) b!48729))

(assert (= (and b!48729 res!40907) b!48723))

(assert (= (and b!48729 (not res!40918)) b!48735))

(assert (= (and b!48735 (not res!40903)) b!48732))

(assert (= (and b!48732 (not res!40905)) b!48742))

(assert (= (and b!48742 (not res!40912)) b!48736))

(assert (= (and b!48736 res!40916) b!48730))

(assert (= (and b!48736 (not res!40910)) b!48727))

(assert (= (and b!48727 (not res!40919)) b!48726))

(assert (= (and b!48726 (not res!40920)) b!48725))

(assert (= (and b!48725 (not res!40902)) b!48740))

(assert (= (and b!48740 (not res!40906)) b!48731))

(assert (= (and b!48731 (not res!40913)) b!48733))

(assert (= (and b!48733 (not res!40914)) b!48738))

(assert (= (and b!48738 (not res!40904)) b!48737))

(assert (= (and b!48737 (not res!40915)) b!48741))

(assert (= start!9764 b!48734))

(declare-fun m!75791 () Bool)

(assert (=> b!48737 m!75791))

(assert (=> b!48737 m!75791))

(declare-fun m!75793 () Bool)

(assert (=> b!48737 m!75793))

(declare-fun m!75795 () Bool)

(assert (=> b!48737 m!75795))

(declare-fun m!75797 () Bool)

(assert (=> b!48735 m!75797))

(declare-fun m!75799 () Bool)

(assert (=> b!48728 m!75799))

(declare-fun m!75801 () Bool)

(assert (=> b!48728 m!75801))

(declare-fun m!75803 () Bool)

(assert (=> b!48728 m!75803))

(declare-fun m!75805 () Bool)

(assert (=> b!48734 m!75805))

(declare-fun m!75807 () Bool)

(assert (=> b!48741 m!75807))

(declare-fun m!75809 () Bool)

(assert (=> b!48727 m!75809))

(declare-fun m!75811 () Bool)

(assert (=> b!48726 m!75811))

(declare-fun m!75813 () Bool)

(assert (=> b!48733 m!75813))

(declare-fun m!75815 () Bool)

(assert (=> b!48733 m!75815))

(declare-fun m!75817 () Bool)

(assert (=> b!48729 m!75817))

(declare-fun m!75819 () Bool)

(assert (=> b!48729 m!75819))

(declare-fun m!75821 () Bool)

(assert (=> b!48729 m!75821))

(declare-fun m!75823 () Bool)

(assert (=> b!48729 m!75823))

(declare-fun m!75825 () Bool)

(assert (=> b!48729 m!75825))

(declare-fun m!75827 () Bool)

(assert (=> b!48729 m!75827))

(declare-fun m!75829 () Bool)

(assert (=> b!48729 m!75829))

(declare-fun m!75831 () Bool)

(assert (=> b!48739 m!75831))

(declare-fun m!75833 () Bool)

(assert (=> b!48723 m!75833))

(assert (=> b!48723 m!75833))

(declare-fun m!75835 () Bool)

(assert (=> b!48723 m!75835))

(declare-fun m!75837 () Bool)

(assert (=> b!48723 m!75837))

(assert (=> b!48723 m!75837))

(declare-fun m!75839 () Bool)

(assert (=> b!48723 m!75839))

(declare-fun m!75841 () Bool)

(assert (=> b!48731 m!75841))

(declare-fun m!75843 () Bool)

(assert (=> b!48731 m!75843))

(declare-fun m!75845 () Bool)

(assert (=> b!48732 m!75845))

(declare-fun m!75847 () Bool)

(assert (=> b!48730 m!75847))

(declare-fun m!75849 () Bool)

(assert (=> b!48724 m!75849))

(declare-fun m!75851 () Bool)

(assert (=> b!48724 m!75851))

(declare-fun m!75853 () Bool)

(assert (=> b!48724 m!75853))

(assert (=> b!48724 m!75851))

(declare-fun m!75855 () Bool)

(assert (=> b!48724 m!75855))

(declare-fun m!75857 () Bool)

(assert (=> b!48724 m!75857))

(declare-fun m!75859 () Bool)

(assert (=> b!48725 m!75859))

(declare-fun m!75861 () Bool)

(assert (=> b!48725 m!75861))

(declare-fun m!75863 () Bool)

(assert (=> b!48725 m!75863))

(declare-fun m!75865 () Bool)

(assert (=> b!48725 m!75865))

(declare-fun m!75867 () Bool)

(assert (=> b!48725 m!75867))

(declare-fun m!75869 () Bool)

(assert (=> b!48725 m!75869))

(declare-fun m!75871 () Bool)

(assert (=> b!48725 m!75871))

(declare-fun m!75873 () Bool)

(assert (=> b!48725 m!75873))

(declare-fun m!75875 () Bool)

(assert (=> b!48740 m!75875))

(declare-fun m!75877 () Bool)

(assert (=> b!48738 m!75877))

(declare-fun m!75879 () Bool)

(assert (=> start!9764 m!75879))

(declare-fun m!75881 () Bool)

(assert (=> start!9764 m!75881))

(push 1)

(assert (not b!48739))

(assert (not b!48734))

(assert (not b!48727))

(assert (not b!48724))

(assert (not b!48735))

(assert (not b!48738))

(assert (not b!48731))

(assert (not b!48740))

(assert (not b!48726))

(assert (not b!48728))

(assert (not b!48737))

(assert (not b!48732))

(assert (not b!48733))

(assert (not b!48725))

(assert (not b!48723))

(assert (not b!48730))

(assert (not start!9764))

(assert (not b!48729))

(assert (not b!48741))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!14958 () Bool)

(assert (=> d!14958 (= (tail!235 lt!75696) (t!1299 lt!75696))))

(assert (=> b!48731 d!14958))

(declare-fun d!14960 () Bool)

(declare-fun e!32341 () Bool)

(assert (=> d!14960 e!32341))

(declare-fun res!41058 () Bool)

(assert (=> d!14960 (=> (not res!41058) (not e!32341))))

(declare-fun lt!75859 () (_ BitVec 64))

(assert (=> d!14960 (= res!41058 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!75859) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!14960 (= lt!75859 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!75858 () Unit!3414)

(declare-fun choose!42 (BitStream!1816 BitStream!1816 BitStream!1816 BitStream!1816 (_ BitVec 64) List!549) Unit!3414)

(assert (=> d!14960 (= lt!75858 (choose!42 (_2!2398 lt!75689) (_2!2398 lt!75689) (_1!2397 lt!75703) (_1!2397 lt!75701) (bvsub to!314 i!635) lt!75696))))

(assert (=> d!14960 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14960 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2398 lt!75689) (_2!2398 lt!75689) (_1!2397 lt!75703) (_1!2397 lt!75701) (bvsub to!314 i!635) lt!75696) lt!75858)))

(declare-fun b!48886 () Bool)

(assert (=> b!48886 (= e!32341 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_1!2397 lt!75701) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!235 lt!75696)))))

(assert (= (and d!14960 res!41058) b!48886))

(declare-fun m!76083 () Bool)

(assert (=> d!14960 m!76083))

(declare-fun m!76085 () Bool)

(assert (=> b!48886 m!76085))

(assert (=> b!48886 m!75841))

(assert (=> b!48731 d!14960))

(declare-fun d!14962 () Bool)

(assert (=> d!14962 (= (bitAt!0 (buf!1400 (_2!2398 lt!75692)) lt!75690) (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_2!2398 lt!75692))) ((_ extract 31 0) (bvsdiv lt!75690 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!75690 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3826 () Bool)

(assert (= bs!3826 d!14962))

(declare-fun m!76087 () Bool)

(assert (=> bs!3826 m!76087))

(declare-fun m!76089 () Bool)

(assert (=> bs!3826 m!76089))

(assert (=> b!48741 d!14962))

(declare-fun d!14964 () Bool)

(declare-fun e!32344 () Bool)

(assert (=> d!14964 e!32344))

(declare-fun res!41063 () Bool)

(assert (=> d!14964 (=> (not res!41063) (not e!32344))))

(declare-fun lt!75874 () (_ BitVec 64))

(declare-fun lt!75875 () (_ BitVec 64))

(declare-fun lt!75873 () (_ BitVec 64))

(assert (=> d!14964 (= res!41063 (= lt!75875 (bvsub lt!75873 lt!75874)))))

(assert (=> d!14964 (or (= (bvand lt!75873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!75874 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!75873 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!75873 lt!75874) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!14964 (= lt!75874 (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692)))))))

(declare-fun lt!75877 () (_ BitVec 64))

(declare-fun lt!75876 () (_ BitVec 64))

(assert (=> d!14964 (= lt!75873 (bvmul lt!75877 lt!75876))))

(assert (=> d!14964 (or (= lt!75877 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!75876 (bvsdiv (bvmul lt!75877 lt!75876) lt!75877)))))

(assert (=> d!14964 (= lt!75876 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14964 (= lt!75877 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))))))

(assert (=> d!14964 (= lt!75875 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692)))))))

(assert (=> d!14964 (invariant!0 (currentBit!2912 (_2!2398 lt!75692)) (currentByte!2917 (_2!2398 lt!75692)) (size!1048 (buf!1400 (_2!2398 lt!75692))))))

(assert (=> d!14964 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))) lt!75875)))

(declare-fun b!48891 () Bool)

(declare-fun res!41064 () Bool)

(assert (=> b!48891 (=> (not res!41064) (not e!32344))))

(assert (=> b!48891 (= res!41064 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!75875))))

(declare-fun b!48892 () Bool)

(declare-fun lt!75872 () (_ BitVec 64))

(assert (=> b!48892 (= e!32344 (bvsle lt!75875 (bvmul lt!75872 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48892 (or (= lt!75872 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!75872 #b0000000000000000000000000000000000000000000000000000000000001000) lt!75872)))))

(assert (=> b!48892 (= lt!75872 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))))))

(assert (= (and d!14964 res!41063) b!48891))

(assert (= (and b!48891 res!41064) b!48892))

(declare-fun m!76091 () Bool)

(assert (=> d!14964 m!76091))

(assert (=> d!14964 m!75809))

(assert (=> b!48730 d!14964))

(declare-fun d!14966 () Bool)

(declare-fun size!1051 (List!549) Int)

(assert (=> d!14966 (= (length!244 lt!75696) (size!1051 lt!75696))))

(declare-fun bs!3827 () Bool)

(assert (= bs!3827 d!14966))

(declare-fun m!76093 () Bool)

(assert (=> bs!3827 m!76093))

(assert (=> b!48740 d!14966))

(declare-fun d!14968 () Bool)

(declare-fun res!41071 () Bool)

(declare-fun e!32349 () Bool)

(assert (=> d!14968 (=> (not res!41071) (not e!32349))))

(assert (=> d!14968 (= res!41071 (= (size!1048 (buf!1400 (_2!2398 lt!75692))) (size!1048 (buf!1400 (_2!2398 lt!75689)))))))

(assert (=> d!14968 (= (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!75689)) e!32349)))

(declare-fun b!48899 () Bool)

(declare-fun res!41073 () Bool)

(assert (=> b!48899 (=> (not res!41073) (not e!32349))))

(assert (=> b!48899 (= res!41073 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689)))))))

(declare-fun b!48900 () Bool)

(declare-fun e!32350 () Bool)

(assert (=> b!48900 (= e!32349 e!32350)))

(declare-fun res!41072 () Bool)

(assert (=> b!48900 (=> res!41072 e!32350)))

(assert (=> b!48900 (= res!41072 (= (size!1048 (buf!1400 (_2!2398 lt!75692))) #b00000000000000000000000000000000))))

(declare-fun b!48901 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2311 array!2311 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!48901 (= e!32350 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (_2!2398 lt!75689)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(assert (= (and d!14968 res!41071) b!48899))

(assert (= (and b!48899 res!41073) b!48900))

(assert (= (and b!48900 (not res!41072)) b!48901))

(assert (=> b!48899 m!75847))

(assert (=> b!48899 m!75797))

(assert (=> b!48901 m!75847))

(assert (=> b!48901 m!75847))

(declare-fun m!76095 () Bool)

(assert (=> b!48901 m!76095))

(assert (=> b!48729 d!14968))

(declare-fun d!14970 () Bool)

(assert (=> d!14970 (isPrefixOf!0 thiss!1379 (_2!2398 lt!75689))))

(declare-fun lt!75880 () Unit!3414)

(declare-fun choose!30 (BitStream!1816 BitStream!1816 BitStream!1816) Unit!3414)

(assert (=> d!14970 (= lt!75880 (choose!30 thiss!1379 (_2!2398 lt!75692) (_2!2398 lt!75689)))))

(assert (=> d!14970 (isPrefixOf!0 thiss!1379 (_2!2398 lt!75692))))

(assert (=> d!14970 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2398 lt!75692) (_2!2398 lt!75689)) lt!75880)))

(declare-fun bs!3828 () Bool)

(assert (= bs!3828 d!14970))

(assert (=> bs!3828 m!75819))

(declare-fun m!76097 () Bool)

(assert (=> bs!3828 m!76097))

(assert (=> bs!3828 m!75853))

(assert (=> b!48729 d!14970))

(declare-fun d!14972 () Bool)

(declare-fun res!41074 () Bool)

(declare-fun e!32351 () Bool)

(assert (=> d!14972 (=> (not res!41074) (not e!32351))))

(assert (=> d!14972 (= res!41074 (= (size!1048 (buf!1400 thiss!1379)) (size!1048 (buf!1400 (_2!2398 lt!75689)))))))

(assert (=> d!14972 (= (isPrefixOf!0 thiss!1379 (_2!2398 lt!75689)) e!32351)))

(declare-fun b!48902 () Bool)

(declare-fun res!41076 () Bool)

(assert (=> b!48902 (=> (not res!41076) (not e!32351))))

(assert (=> b!48902 (= res!41076 (bvsle (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689)))))))

(declare-fun b!48903 () Bool)

(declare-fun e!32352 () Bool)

(assert (=> b!48903 (= e!32351 e!32352)))

(declare-fun res!41075 () Bool)

(assert (=> b!48903 (=> res!41075 e!32352)))

(assert (=> b!48903 (= res!41075 (= (size!1048 (buf!1400 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!48904 () Bool)

(assert (=> b!48904 (= e!32352 (arrayBitRangesEq!0 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75689)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(assert (= (and d!14972 res!41074) b!48902))

(assert (= (and b!48902 res!41076) b!48903))

(assert (= (and b!48903 (not res!41075)) b!48904))

(assert (=> b!48902 m!75803))

(assert (=> b!48902 m!75797))

(assert (=> b!48904 m!75803))

(assert (=> b!48904 m!75803))

(declare-fun m!76099 () Bool)

(assert (=> b!48904 m!76099))

(assert (=> b!48729 d!14972))

(declare-fun b!48973 () Bool)

(declare-fun e!32384 () tuple2!4598)

(declare-fun lt!76221 () tuple2!4598)

(declare-fun Unit!3428 () Unit!3414)

(assert (=> b!48973 (= e!32384 (tuple2!4599 Unit!3428 (_2!2398 lt!76221)))))

(declare-fun lt!76219 () tuple2!4598)

(assert (=> b!48973 (= lt!76219 (appendBitFromByte!0 (_2!2398 lt!75692) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!76195 () (_ BitVec 64))

(assert (=> b!48973 (= lt!76195 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!76211 () (_ BitVec 64))

(assert (=> b!48973 (= lt!76211 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!76206 () Unit!3414)

(assert (=> b!48973 (= lt!76206 (validateOffsetBitsIneqLemma!0 (_2!2398 lt!75692) (_2!2398 lt!76219) lt!76195 lt!76211))))

(assert (=> b!48973 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219))) (bvsub lt!76195 lt!76211))))

(declare-fun lt!76215 () Unit!3414)

(assert (=> b!48973 (= lt!76215 lt!76206)))

(declare-fun lt!76217 () tuple2!4596)

(declare-fun call!616 () tuple2!4596)

(assert (=> b!48973 (= lt!76217 call!616)))

(declare-fun lt!76218 () (_ BitVec 64))

(assert (=> b!48973 (= lt!76218 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!76188 () Unit!3414)

(assert (=> b!48973 (= lt!76188 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!76219)) lt!76218))))

(assert (=> b!48973 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!76218)))

(declare-fun lt!76199 () Unit!3414)

(assert (=> b!48973 (= lt!76199 lt!76188)))

(assert (=> b!48973 (= (head!368 (byteArrayBitContentToList!0 (_2!2398 lt!76219) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!368 (bitStreamReadBitsIntoList!0 (_2!2398 lt!76219) (_1!2397 lt!76217) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!76186 () Unit!3414)

(declare-fun Unit!3430 () Unit!3414)

(assert (=> b!48973 (= lt!76186 Unit!3430)))

(assert (=> b!48973 (= lt!76221 (appendBitsMSBFirstLoop!0 (_2!2398 lt!76219) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!76190 () Unit!3414)

(assert (=> b!48973 (= lt!76190 (lemmaIsPrefixTransitive!0 (_2!2398 lt!75692) (_2!2398 lt!76219) (_2!2398 lt!76221)))))

(assert (=> b!48973 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!76221))))

(declare-fun lt!76212 () Unit!3414)

(assert (=> b!48973 (= lt!76212 lt!76190)))

(assert (=> b!48973 (= (size!1048 (buf!1400 (_2!2398 lt!76221))) (size!1048 (buf!1400 (_2!2398 lt!75692))))))

(declare-fun lt!76198 () Unit!3414)

(declare-fun Unit!3431 () Unit!3414)

(assert (=> b!48973 (= lt!76198 Unit!3431)))

(assert (=> b!48973 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76221))) (currentByte!2917 (_2!2398 lt!76221)) (currentBit!2912 (_2!2398 lt!76221))) (bvsub (bvadd (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!76208 () Unit!3414)

(declare-fun Unit!3432 () Unit!3414)

(assert (=> b!48973 (= lt!76208 Unit!3432)))

(assert (=> b!48973 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76221))) (currentByte!2917 (_2!2398 lt!76221)) (currentBit!2912 (_2!2398 lt!76221))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76219))) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!76189 () Unit!3414)

(declare-fun Unit!3433 () Unit!3414)

(assert (=> b!48973 (= lt!76189 Unit!3433)))

(declare-fun lt!76207 () tuple2!4596)

(assert (=> b!48973 (= lt!76207 (reader!0 (_2!2398 lt!75692) (_2!2398 lt!76221)))))

(declare-fun lt!76179 () (_ BitVec 64))

(assert (=> b!48973 (= lt!76179 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!76191 () Unit!3414)

(assert (=> b!48973 (= lt!76191 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!76221)) lt!76179))))

(assert (=> b!48973 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76221)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!76179)))

(declare-fun lt!76213 () Unit!3414)

(assert (=> b!48973 (= lt!76213 lt!76191)))

(declare-fun lt!76184 () tuple2!4596)

(assert (=> b!48973 (= lt!76184 (reader!0 (_2!2398 lt!76219) (_2!2398 lt!76221)))))

(declare-fun lt!76181 () (_ BitVec 64))

(assert (=> b!48973 (= lt!76181 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!76187 () Unit!3414)

(assert (=> b!48973 (= lt!76187 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!76219) (buf!1400 (_2!2398 lt!76221)) lt!76181))))

(assert (=> b!48973 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76221)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219))) lt!76181)))

(declare-fun lt!76193 () Unit!3414)

(assert (=> b!48973 (= lt!76193 lt!76187)))

(declare-fun lt!76201 () List!549)

(assert (=> b!48973 (= lt!76201 (byteArrayBitContentToList!0 (_2!2398 lt!76221) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!76180 () List!549)

(assert (=> b!48973 (= lt!76180 (byteArrayBitContentToList!0 (_2!2398 lt!76221) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!76220 () List!549)

(assert (=> b!48973 (= lt!76220 (bitStreamReadBitsIntoList!0 (_2!2398 lt!76221) (_1!2397 lt!76207) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!76214 () List!549)

(assert (=> b!48973 (= lt!76214 (bitStreamReadBitsIntoList!0 (_2!2398 lt!76221) (_1!2397 lt!76184) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!76216 () (_ BitVec 64))

(assert (=> b!48973 (= lt!76216 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!76192 () Unit!3414)

(assert (=> b!48973 (= lt!76192 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2398 lt!76221) (_2!2398 lt!76221) (_1!2397 lt!76207) (_1!2397 lt!76184) lt!76216 lt!76220))))

(assert (=> b!48973 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!76221) (_1!2397 lt!76184) (bvsub lt!76216 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!235 lt!76220))))

(declare-fun lt!76205 () Unit!3414)

(assert (=> b!48973 (= lt!76205 lt!76192)))

(declare-fun lt!76183 () (_ BitVec 64))

(declare-fun lt!76209 () Unit!3414)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2311 array!2311 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3414)

(assert (=> b!48973 (= lt!76209 (arrayBitRangesEqImpliesEq!0 (buf!1400 (_2!2398 lt!76219)) (buf!1400 (_2!2398 lt!76221)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!76183 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76219))) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219)))))))

(assert (=> b!48973 (= (bitAt!0 (buf!1400 (_2!2398 lt!76219)) lt!76183) (bitAt!0 (buf!1400 (_2!2398 lt!76221)) lt!76183))))

(declare-fun lt!76222 () Unit!3414)

(assert (=> b!48973 (= lt!76222 lt!76209)))

(declare-fun lt!76194 () tuple2!4596)

(declare-fun lt!76202 () tuple2!4598)

(declare-fun b!48974 () Bool)

(declare-fun e!32385 () Bool)

(assert (=> b!48974 (= e!32385 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!76202) (_1!2397 lt!76194) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2398 lt!76202) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!48974 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48974 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!76185 () Unit!3414)

(declare-fun lt!76204 () Unit!3414)

(assert (=> b!48974 (= lt!76185 lt!76204)))

(declare-fun lt!76196 () (_ BitVec 64))

(assert (=> b!48974 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76202)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!76196)))

(assert (=> b!48974 (= lt!76204 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!76202)) lt!76196))))

(declare-fun e!32383 () Bool)

(assert (=> b!48974 e!32383))

(declare-fun res!41131 () Bool)

(assert (=> b!48974 (=> (not res!41131) (not e!32383))))

(assert (=> b!48974 (= res!41131 (and (= (size!1048 (buf!1400 (_2!2398 lt!75692))) (size!1048 (buf!1400 (_2!2398 lt!76202)))) (bvsge lt!76196 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48974 (= lt!76196 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!48974 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48974 (= lt!76194 (reader!0 (_2!2398 lt!75692) (_2!2398 lt!76202)))))

(declare-fun b!48975 () Bool)

(declare-fun Unit!3435 () Unit!3414)

(assert (=> b!48975 (= e!32384 (tuple2!4599 Unit!3435 (_2!2398 lt!75692)))))

(assert (=> b!48975 (= (size!1048 (buf!1400 (_2!2398 lt!75692))) (size!1048 (buf!1400 (_2!2398 lt!75692))))))

(declare-fun lt!76182 () Unit!3414)

(declare-fun Unit!3436 () Unit!3414)

(assert (=> b!48975 (= lt!76182 Unit!3436)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1816 array!2311 array!2311 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4612 0))(
  ( (tuple2!4613 (_1!2405 array!2311) (_2!2405 BitStream!1816)) )
))
(declare-fun readBits!0 (BitStream!1816 (_ BitVec 64)) tuple2!4612)

(assert (=> b!48975 (checkByteArrayBitContent!0 (_2!2398 lt!75692) srcBuffer!2 (_1!2405 (readBits!0 (_1!2397 call!616) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!48976 () Bool)

(declare-fun res!41130 () Bool)

(assert (=> b!48976 (=> (not res!41130) (not e!32385))))

(assert (=> b!48976 (= res!41130 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!76202)))))

(declare-fun d!14974 () Bool)

(assert (=> d!14974 e!32385))

(declare-fun res!41134 () Bool)

(assert (=> d!14974 (=> (not res!41134) (not e!32385))))

(declare-fun lt!76210 () (_ BitVec 64))

(assert (=> d!14974 (= res!41134 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76202))) (currentByte!2917 (_2!2398 lt!76202)) (currentBit!2912 (_2!2398 lt!76202))) (bvsub lt!76210 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!14974 (or (= (bvand lt!76210 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76210 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76210 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!76197 () (_ BitVec 64))

(assert (=> d!14974 (= lt!76210 (bvadd lt!76197 to!314))))

(assert (=> d!14974 (or (not (= (bvand lt!76197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!76197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!76197 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14974 (= lt!76197 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(assert (=> d!14974 (= lt!76202 e!32384)))

(declare-fun c!3432 () Bool)

(assert (=> d!14974 (= c!3432 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!76200 () Unit!3414)

(declare-fun lt!76203 () Unit!3414)

(assert (=> d!14974 (= lt!76200 lt!76203)))

(assert (=> d!14974 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!75692))))

(assert (=> d!14974 (= lt!76203 (lemmaIsPrefixRefl!0 (_2!2398 lt!75692)))))

(assert (=> d!14974 (= lt!76183 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(assert (=> d!14974 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14974 (= (appendBitsMSBFirstLoop!0 (_2!2398 lt!75692) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!76202)))

(declare-fun bm!613 () Bool)

(assert (=> bm!613 (= call!616 (reader!0 (_2!2398 lt!75692) (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))))))

(declare-fun b!48977 () Bool)

(declare-fun res!41129 () Bool)

(assert (=> b!48977 (=> (not res!41129) (not e!32385))))

(assert (=> b!48977 (= res!41129 (= (size!1048 (buf!1400 (_2!2398 lt!76202))) (size!1048 (buf!1400 (_2!2398 lt!75692)))))))

(declare-fun b!48978 () Bool)

(declare-fun res!41132 () Bool)

(assert (=> b!48978 (=> (not res!41132) (not e!32385))))

(assert (=> b!48978 (= res!41132 (invariant!0 (currentBit!2912 (_2!2398 lt!76202)) (currentByte!2917 (_2!2398 lt!76202)) (size!1048 (buf!1400 (_2!2398 lt!76202)))))))

(declare-fun b!48979 () Bool)

(declare-fun res!41133 () Bool)

(assert (=> b!48979 (=> (not res!41133) (not e!32385))))

(assert (=> b!48979 (= res!41133 (= (size!1048 (buf!1400 (_2!2398 lt!75692))) (size!1048 (buf!1400 (_2!2398 lt!76202)))))))

(declare-fun b!48980 () Bool)

(assert (=> b!48980 (= e!32383 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!76196))))

(assert (= (and d!14974 c!3432) b!48973))

(assert (= (and d!14974 (not c!3432)) b!48975))

(assert (= (or b!48973 b!48975) bm!613))

(assert (= (and d!14974 res!41134) b!48978))

(assert (= (and b!48978 res!41132) b!48979))

(assert (= (and b!48979 res!41133) b!48976))

(assert (= (and b!48976 res!41130) b!48977))

(assert (= (and b!48977 res!41129) b!48974))

(assert (= (and b!48974 res!41131) b!48980))

(declare-fun m!76233 () Bool)

(assert (=> bm!613 m!76233))

(declare-fun m!76235 () Bool)

(assert (=> b!48978 m!76235))

(declare-fun m!76237 () Bool)

(assert (=> d!14974 m!76237))

(assert (=> d!14974 m!75847))

(declare-fun m!76239 () Bool)

(assert (=> d!14974 m!76239))

(declare-fun m!76241 () Bool)

(assert (=> d!14974 m!76241))

(declare-fun m!76243 () Bool)

(assert (=> b!48975 m!76243))

(declare-fun m!76245 () Bool)

(assert (=> b!48975 m!76245))

(declare-fun m!76247 () Bool)

(assert (=> b!48980 m!76247))

(assert (=> b!48973 m!75847))

(declare-fun m!76249 () Bool)

(assert (=> b!48973 m!76249))

(declare-fun m!76251 () Bool)

(assert (=> b!48973 m!76251))

(declare-fun m!76253 () Bool)

(assert (=> b!48973 m!76253))

(declare-fun m!76255 () Bool)

(assert (=> b!48973 m!76255))

(declare-fun m!76257 () Bool)

(assert (=> b!48973 m!76257))

(declare-fun m!76259 () Bool)

(assert (=> b!48973 m!76259))

(declare-fun m!76261 () Bool)

(assert (=> b!48973 m!76261))

(declare-fun m!76263 () Bool)

(assert (=> b!48973 m!76263))

(declare-fun m!76265 () Bool)

(assert (=> b!48973 m!76265))

(declare-fun m!76267 () Bool)

(assert (=> b!48973 m!76267))

(declare-fun m!76269 () Bool)

(assert (=> b!48973 m!76269))

(declare-fun m!76271 () Bool)

(assert (=> b!48973 m!76271))

(declare-fun m!76273 () Bool)

(assert (=> b!48973 m!76273))

(declare-fun m!76275 () Bool)

(assert (=> b!48973 m!76275))

(declare-fun m!76277 () Bool)

(assert (=> b!48973 m!76277))

(assert (=> b!48973 m!76265))

(declare-fun m!76279 () Bool)

(assert (=> b!48973 m!76279))

(declare-fun m!76281 () Bool)

(assert (=> b!48973 m!76281))

(declare-fun m!76283 () Bool)

(assert (=> b!48973 m!76283))

(assert (=> b!48973 m!76259))

(declare-fun m!76285 () Bool)

(assert (=> b!48973 m!76285))

(assert (=> b!48973 m!76273))

(declare-fun m!76287 () Bool)

(assert (=> b!48973 m!76287))

(declare-fun m!76289 () Bool)

(assert (=> b!48973 m!76289))

(declare-fun m!76291 () Bool)

(assert (=> b!48973 m!76291))

(declare-fun m!76293 () Bool)

(assert (=> b!48973 m!76293))

(declare-fun m!76295 () Bool)

(assert (=> b!48973 m!76295))

(declare-fun m!76297 () Bool)

(assert (=> b!48973 m!76297))

(assert (=> b!48973 m!76287))

(declare-fun m!76299 () Bool)

(assert (=> b!48973 m!76299))

(declare-fun m!76301 () Bool)

(assert (=> b!48973 m!76301))

(declare-fun m!76303 () Bool)

(assert (=> b!48973 m!76303))

(declare-fun m!76305 () Bool)

(assert (=> b!48973 m!76305))

(declare-fun m!76307 () Bool)

(assert (=> b!48973 m!76307))

(declare-fun m!76309 () Bool)

(assert (=> b!48973 m!76309))

(declare-fun m!76311 () Bool)

(assert (=> b!48976 m!76311))

(declare-fun m!76313 () Bool)

(assert (=> b!48974 m!76313))

(declare-fun m!76315 () Bool)

(assert (=> b!48974 m!76315))

(declare-fun m!76317 () Bool)

(assert (=> b!48974 m!76317))

(declare-fun m!76319 () Bool)

(assert (=> b!48974 m!76319))

(declare-fun m!76321 () Bool)

(assert (=> b!48974 m!76321))

(assert (=> b!48729 d!14974))

(declare-fun d!14998 () Bool)

(assert (=> d!14998 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3834 () Bool)

(assert (= bs!3834 d!14998))

(declare-fun m!76323 () Bool)

(assert (=> bs!3834 m!76323))

(assert (=> b!48729 d!14998))

(declare-fun b!48997 () Bool)

(declare-fun e!32393 () Unit!3414)

(declare-fun Unit!3437 () Unit!3414)

(assert (=> b!48997 (= e!32393 Unit!3437)))

(declare-fun d!15000 () Bool)

(declare-fun e!32394 () Bool)

(assert (=> d!15000 e!32394))

(declare-fun res!41148 () Bool)

(assert (=> d!15000 (=> (not res!41148) (not e!32394))))

(declare-fun lt!76287 () tuple2!4596)

(assert (=> d!15000 (= res!41148 (isPrefixOf!0 (_1!2397 lt!76287) (_2!2397 lt!76287)))))

(declare-fun lt!76281 () BitStream!1816)

(assert (=> d!15000 (= lt!76287 (tuple2!4597 lt!76281 (_2!2398 lt!75692)))))

(declare-fun lt!76299 () Unit!3414)

(declare-fun lt!76293 () Unit!3414)

(assert (=> d!15000 (= lt!76299 lt!76293)))

(assert (=> d!15000 (isPrefixOf!0 lt!76281 (_2!2398 lt!75692))))

(assert (=> d!15000 (= lt!76293 (lemmaIsPrefixTransitive!0 lt!76281 (_2!2398 lt!75692) (_2!2398 lt!75692)))))

(declare-fun lt!76291 () Unit!3414)

(declare-fun lt!76294 () Unit!3414)

(assert (=> d!15000 (= lt!76291 lt!76294)))

(assert (=> d!15000 (isPrefixOf!0 lt!76281 (_2!2398 lt!75692))))

(assert (=> d!15000 (= lt!76294 (lemmaIsPrefixTransitive!0 lt!76281 thiss!1379 (_2!2398 lt!75692)))))

(declare-fun lt!76295 () Unit!3414)

(assert (=> d!15000 (= lt!76295 e!32393)))

(declare-fun c!3435 () Bool)

(assert (=> d!15000 (= c!3435 (not (= (size!1048 (buf!1400 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!76300 () Unit!3414)

(declare-fun lt!76290 () Unit!3414)

(assert (=> d!15000 (= lt!76300 lt!76290)))

(assert (=> d!15000 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!75692))))

(assert (=> d!15000 (= lt!76290 (lemmaIsPrefixRefl!0 (_2!2398 lt!75692)))))

(declare-fun lt!76285 () Unit!3414)

(declare-fun lt!76292 () Unit!3414)

(assert (=> d!15000 (= lt!76285 lt!76292)))

(assert (=> d!15000 (= lt!76292 (lemmaIsPrefixRefl!0 (_2!2398 lt!75692)))))

(declare-fun lt!76296 () Unit!3414)

(declare-fun lt!76289 () Unit!3414)

(assert (=> d!15000 (= lt!76296 lt!76289)))

(assert (=> d!15000 (isPrefixOf!0 lt!76281 lt!76281)))

(assert (=> d!15000 (= lt!76289 (lemmaIsPrefixRefl!0 lt!76281))))

(declare-fun lt!76283 () Unit!3414)

(declare-fun lt!76284 () Unit!3414)

(assert (=> d!15000 (= lt!76283 lt!76284)))

(assert (=> d!15000 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!15000 (= lt!76284 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!15000 (= lt!76281 (BitStream!1817 (buf!1400 (_2!2398 lt!75692)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)))))

(assert (=> d!15000 (isPrefixOf!0 thiss!1379 (_2!2398 lt!75692))))

(assert (=> d!15000 (= (reader!0 thiss!1379 (_2!2398 lt!75692)) lt!76287)))

(declare-fun lt!76282 () (_ BitVec 64))

(declare-fun lt!76298 () (_ BitVec 64))

(declare-fun b!48998 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1816 (_ BitVec 64)) BitStream!1816)

(assert (=> b!48998 (= e!32394 (= (_1!2397 lt!76287) (withMovedBitIndex!0 (_2!2397 lt!76287) (bvsub lt!76282 lt!76298))))))

(assert (=> b!48998 (or (= (bvand lt!76282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76298 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76282 lt!76298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48998 (= lt!76298 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(assert (=> b!48998 (= lt!76282 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)))))

(declare-fun b!48999 () Bool)

(declare-fun res!41149 () Bool)

(assert (=> b!48999 (=> (not res!41149) (not e!32394))))

(assert (=> b!48999 (= res!41149 (isPrefixOf!0 (_1!2397 lt!76287) thiss!1379))))

(declare-fun b!49000 () Bool)

(declare-fun res!41147 () Bool)

(assert (=> b!49000 (=> (not res!41147) (not e!32394))))

(assert (=> b!49000 (= res!41147 (isPrefixOf!0 (_2!2397 lt!76287) (_2!2398 lt!75692)))))

(declare-fun b!49001 () Bool)

(declare-fun lt!76286 () Unit!3414)

(assert (=> b!49001 (= e!32393 lt!76286)))

(declare-fun lt!76297 () (_ BitVec 64))

(assert (=> b!49001 (= lt!76297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76288 () (_ BitVec 64))

(assert (=> b!49001 (= lt!76288 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2311 array!2311 (_ BitVec 64) (_ BitVec 64)) Unit!3414)

(assert (=> b!49001 (= lt!76286 (arrayBitRangesEqSymmetric!0 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75692)) lt!76297 lt!76288))))

(assert (=> b!49001 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 thiss!1379) lt!76297 lt!76288)))

(assert (= (and d!15000 c!3435) b!49001))

(assert (= (and d!15000 (not c!3435)) b!48997))

(assert (= (and d!15000 res!41148) b!48999))

(assert (= (and b!48999 res!41149) b!49000))

(assert (= (and b!49000 res!41147) b!48998))

(declare-fun m!76327 () Bool)

(assert (=> d!15000 m!76327))

(assert (=> d!15000 m!75801))

(assert (=> d!15000 m!76241))

(declare-fun m!76329 () Bool)

(assert (=> d!15000 m!76329))

(assert (=> d!15000 m!75799))

(declare-fun m!76331 () Bool)

(assert (=> d!15000 m!76331))

(declare-fun m!76333 () Bool)

(assert (=> d!15000 m!76333))

(assert (=> d!15000 m!75853))

(declare-fun m!76335 () Bool)

(assert (=> d!15000 m!76335))

(declare-fun m!76337 () Bool)

(assert (=> d!15000 m!76337))

(assert (=> d!15000 m!76239))

(declare-fun m!76339 () Bool)

(assert (=> b!49000 m!76339))

(assert (=> b!49001 m!75803))

(declare-fun m!76341 () Bool)

(assert (=> b!49001 m!76341))

(declare-fun m!76343 () Bool)

(assert (=> b!49001 m!76343))

(declare-fun m!76345 () Bool)

(assert (=> b!48999 m!76345))

(declare-fun m!76347 () Bool)

(assert (=> b!48998 m!76347))

(assert (=> b!48998 m!75847))

(assert (=> b!48998 m!75803))

(assert (=> b!48729 d!15000))

(declare-fun d!15006 () Bool)

(assert (=> d!15006 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!76303 () Unit!3414)

(declare-fun choose!9 (BitStream!1816 array!2311 (_ BitVec 64) BitStream!1816) Unit!3414)

(assert (=> d!15006 (= lt!76303 (choose!9 thiss!1379 (buf!1400 (_2!2398 lt!75692)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1817 (buf!1400 (_2!2398 lt!75692)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(assert (=> d!15006 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1400 (_2!2398 lt!75692)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!76303)))

(declare-fun bs!3835 () Bool)

(assert (= bs!3835 d!15006))

(assert (=> bs!3835 m!75817))

(declare-fun m!76349 () Bool)

(assert (=> bs!3835 m!76349))

(assert (=> b!48729 d!15006))

(declare-fun d!15008 () Bool)

(assert (=> d!15008 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 thiss!1379))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 thiss!1379))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3836 () Bool)

(assert (= bs!3836 d!15008))

(declare-fun m!76351 () Bool)

(assert (=> bs!3836 m!76351))

(assert (=> b!48739 d!15008))

(declare-fun d!15010 () Bool)

(declare-fun res!41150 () Bool)

(declare-fun e!32395 () Bool)

(assert (=> d!15010 (=> (not res!41150) (not e!32395))))

(assert (=> d!15010 (= res!41150 (= (size!1048 (buf!1400 thiss!1379)) (size!1048 (buf!1400 thiss!1379))))))

(assert (=> d!15010 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!32395)))

(declare-fun b!49002 () Bool)

(declare-fun res!41152 () Bool)

(assert (=> b!49002 (=> (not res!41152) (not e!32395))))

(assert (=> b!49002 (= res!41152 (bvsle (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)) (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(declare-fun b!49003 () Bool)

(declare-fun e!32396 () Bool)

(assert (=> b!49003 (= e!32395 e!32396)))

(declare-fun res!41151 () Bool)

(assert (=> b!49003 (=> res!41151 e!32396)))

(assert (=> b!49003 (= res!41151 (= (size!1048 (buf!1400 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!49004 () Bool)

(assert (=> b!49004 (= e!32396 (arrayBitRangesEq!0 (buf!1400 thiss!1379) (buf!1400 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(assert (= (and d!15010 res!41150) b!49002))

(assert (= (and b!49002 res!41152) b!49003))

(assert (= (and b!49003 (not res!41151)) b!49004))

(assert (=> b!49002 m!75803))

(assert (=> b!49002 m!75803))

(assert (=> b!49004 m!75803))

(assert (=> b!49004 m!75803))

(declare-fun m!76353 () Bool)

(assert (=> b!49004 m!76353))

(assert (=> b!48728 d!15010))

(declare-fun d!15012 () Bool)

(assert (=> d!15012 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!76306 () Unit!3414)

(declare-fun choose!11 (BitStream!1816) Unit!3414)

(assert (=> d!15012 (= lt!76306 (choose!11 thiss!1379))))

(assert (=> d!15012 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!76306)))

(declare-fun bs!3838 () Bool)

(assert (= bs!3838 d!15012))

(assert (=> bs!3838 m!75799))

(declare-fun m!76355 () Bool)

(assert (=> bs!3838 m!76355))

(assert (=> b!48728 d!15012))

(declare-fun d!15014 () Bool)

(declare-fun e!32397 () Bool)

(assert (=> d!15014 e!32397))

(declare-fun res!41153 () Bool)

(assert (=> d!15014 (=> (not res!41153) (not e!32397))))

(declare-fun lt!76310 () (_ BitVec 64))

(declare-fun lt!76308 () (_ BitVec 64))

(declare-fun lt!76309 () (_ BitVec 64))

(assert (=> d!15014 (= res!41153 (= lt!76310 (bvsub lt!76308 lt!76309)))))

(assert (=> d!15014 (or (= (bvand lt!76308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76309 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76308 lt!76309) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15014 (= lt!76309 (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 thiss!1379))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379))))))

(declare-fun lt!76312 () (_ BitVec 64))

(declare-fun lt!76311 () (_ BitVec 64))

(assert (=> d!15014 (= lt!76308 (bvmul lt!76312 lt!76311))))

(assert (=> d!15014 (or (= lt!76312 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!76311 (bvsdiv (bvmul lt!76312 lt!76311) lt!76312)))))

(assert (=> d!15014 (= lt!76311 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15014 (= lt!76312 ((_ sign_extend 32) (size!1048 (buf!1400 thiss!1379))))))

(assert (=> d!15014 (= lt!76310 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 thiss!1379))))))

(assert (=> d!15014 (invariant!0 (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379) (size!1048 (buf!1400 thiss!1379)))))

(assert (=> d!15014 (= (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)) lt!76310)))

(declare-fun b!49005 () Bool)

(declare-fun res!41154 () Bool)

(assert (=> b!49005 (=> (not res!41154) (not e!32397))))

(assert (=> b!49005 (= res!41154 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76310))))

(declare-fun b!49006 () Bool)

(declare-fun lt!76307 () (_ BitVec 64))

(assert (=> b!49006 (= e!32397 (bvsle lt!76310 (bvmul lt!76307 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49006 (or (= lt!76307 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!76307 #b0000000000000000000000000000000000000000000000000000000000001000) lt!76307)))))

(assert (=> b!49006 (= lt!76307 ((_ sign_extend 32) (size!1048 (buf!1400 thiss!1379))))))

(assert (= (and d!15014 res!41153) b!49005))

(assert (= (and b!49005 res!41154) b!49006))

(assert (=> d!15014 m!76351))

(declare-fun m!76357 () Bool)

(assert (=> d!15014 m!76357))

(assert (=> b!48728 d!15014))

(declare-fun d!15016 () Bool)

(assert (=> d!15016 (= (head!368 lt!75696) (h!664 lt!75696))))

(assert (=> b!48738 d!15016))

(declare-fun d!15018 () Bool)

(assert (=> d!15018 (= (invariant!0 (currentBit!2912 (_2!2398 lt!75692)) (currentByte!2917 (_2!2398 lt!75692)) (size!1048 (buf!1400 (_2!2398 lt!75692)))) (and (bvsge (currentBit!2912 (_2!2398 lt!75692)) #b00000000000000000000000000000000) (bvslt (currentBit!2912 (_2!2398 lt!75692)) #b00000000000000000000000000001000) (bvsge (currentByte!2917 (_2!2398 lt!75692)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2917 (_2!2398 lt!75692)) (size!1048 (buf!1400 (_2!2398 lt!75692)))) (and (= (currentBit!2912 (_2!2398 lt!75692)) #b00000000000000000000000000000000) (= (currentByte!2917 (_2!2398 lt!75692)) (size!1048 (buf!1400 (_2!2398 lt!75692))))))))))

(assert (=> b!48727 d!15018))

(declare-fun d!15020 () Bool)

(assert (=> d!15020 (= (head!368 (byteArrayBitContentToList!0 (_2!2398 lt!75689) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!664 (byteArrayBitContentToList!0 (_2!2398 lt!75689) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!48737 d!15020))

(declare-fun d!15022 () Bool)

(declare-fun c!3438 () Bool)

(assert (=> d!15022 (= c!3438 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32408 () List!549)

(assert (=> d!15022 (= (byteArrayBitContentToList!0 (_2!2398 lt!75689) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!32408)))

(declare-fun b!49028 () Bool)

(assert (=> b!49028 (= e!32408 Nil!546)))

(declare-fun b!49029 () Bool)

(assert (=> b!49029 (= e!32408 (Cons!545 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2398 lt!75689) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15022 c!3438) b!49028))

(assert (= (and d!15022 (not c!3438)) b!49029))

(assert (=> b!49029 m!75851))

(declare-fun m!76359 () Bool)

(assert (=> b!49029 m!76359))

(declare-fun m!76361 () Bool)

(assert (=> b!49029 m!76361))

(assert (=> b!48737 d!15022))

(declare-fun d!15024 () Bool)

(assert (=> d!15024 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3839 () Bool)

(assert (= bs!3839 d!15024))

(assert (=> bs!3839 m!75851))

(assert (=> bs!3839 m!76359))

(assert (=> b!48737 d!15024))

(declare-fun d!15026 () Bool)

(assert (=> d!15026 (= (invariant!0 (currentBit!2912 (_2!2398 lt!75692)) (currentByte!2917 (_2!2398 lt!75692)) (size!1048 (buf!1400 (_2!2398 lt!75689)))) (and (bvsge (currentBit!2912 (_2!2398 lt!75692)) #b00000000000000000000000000000000) (bvslt (currentBit!2912 (_2!2398 lt!75692)) #b00000000000000000000000000001000) (bvsge (currentByte!2917 (_2!2398 lt!75692)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2917 (_2!2398 lt!75692)) (size!1048 (buf!1400 (_2!2398 lt!75689)))) (and (= (currentBit!2912 (_2!2398 lt!75692)) #b00000000000000000000000000000000) (= (currentByte!2917 (_2!2398 lt!75692)) (size!1048 (buf!1400 (_2!2398 lt!75689))))))))))

(assert (=> b!48726 d!15026))

(declare-fun b!49030 () Bool)

(declare-fun e!32409 () Unit!3414)

(declare-fun Unit!3438 () Unit!3414)

(assert (=> b!49030 (= e!32409 Unit!3438)))

(declare-fun d!15028 () Bool)

(declare-fun e!32410 () Bool)

(assert (=> d!15028 e!32410))

(declare-fun res!41172 () Bool)

(assert (=> d!15028 (=> (not res!41172) (not e!32410))))

(declare-fun lt!76343 () tuple2!4596)

(assert (=> d!15028 (= res!41172 (isPrefixOf!0 (_1!2397 lt!76343) (_2!2397 lt!76343)))))

(declare-fun lt!76337 () BitStream!1816)

(assert (=> d!15028 (= lt!76343 (tuple2!4597 lt!76337 (_2!2398 lt!75689)))))

(declare-fun lt!76355 () Unit!3414)

(declare-fun lt!76349 () Unit!3414)

(assert (=> d!15028 (= lt!76355 lt!76349)))

(assert (=> d!15028 (isPrefixOf!0 lt!76337 (_2!2398 lt!75689))))

(assert (=> d!15028 (= lt!76349 (lemmaIsPrefixTransitive!0 lt!76337 (_2!2398 lt!75689) (_2!2398 lt!75689)))))

(declare-fun lt!76347 () Unit!3414)

(declare-fun lt!76350 () Unit!3414)

(assert (=> d!15028 (= lt!76347 lt!76350)))

(assert (=> d!15028 (isPrefixOf!0 lt!76337 (_2!2398 lt!75689))))

(assert (=> d!15028 (= lt!76350 (lemmaIsPrefixTransitive!0 lt!76337 (_2!2398 lt!75692) (_2!2398 lt!75689)))))

(declare-fun lt!76351 () Unit!3414)

(assert (=> d!15028 (= lt!76351 e!32409)))

(declare-fun c!3439 () Bool)

(assert (=> d!15028 (= c!3439 (not (= (size!1048 (buf!1400 (_2!2398 lt!75692))) #b00000000000000000000000000000000)))))

(declare-fun lt!76356 () Unit!3414)

(declare-fun lt!76346 () Unit!3414)

(assert (=> d!15028 (= lt!76356 lt!76346)))

(assert (=> d!15028 (isPrefixOf!0 (_2!2398 lt!75689) (_2!2398 lt!75689))))

(assert (=> d!15028 (= lt!76346 (lemmaIsPrefixRefl!0 (_2!2398 lt!75689)))))

(declare-fun lt!76341 () Unit!3414)

(declare-fun lt!76348 () Unit!3414)

(assert (=> d!15028 (= lt!76341 lt!76348)))

(assert (=> d!15028 (= lt!76348 (lemmaIsPrefixRefl!0 (_2!2398 lt!75689)))))

(declare-fun lt!76352 () Unit!3414)

(declare-fun lt!76345 () Unit!3414)

(assert (=> d!15028 (= lt!76352 lt!76345)))

(assert (=> d!15028 (isPrefixOf!0 lt!76337 lt!76337)))

(assert (=> d!15028 (= lt!76345 (lemmaIsPrefixRefl!0 lt!76337))))

(declare-fun lt!76339 () Unit!3414)

(declare-fun lt!76340 () Unit!3414)

(assert (=> d!15028 (= lt!76339 lt!76340)))

(assert (=> d!15028 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!75692))))

(assert (=> d!15028 (= lt!76340 (lemmaIsPrefixRefl!0 (_2!2398 lt!75692)))))

(assert (=> d!15028 (= lt!76337 (BitStream!1817 (buf!1400 (_2!2398 lt!75689)) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(assert (=> d!15028 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!75689))))

(assert (=> d!15028 (= (reader!0 (_2!2398 lt!75692) (_2!2398 lt!75689)) lt!76343)))

(declare-fun lt!76354 () (_ BitVec 64))

(declare-fun lt!76338 () (_ BitVec 64))

(declare-fun b!49031 () Bool)

(assert (=> b!49031 (= e!32410 (= (_1!2397 lt!76343) (withMovedBitIndex!0 (_2!2397 lt!76343) (bvsub lt!76338 lt!76354))))))

(assert (=> b!49031 (or (= (bvand lt!76338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76354 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76338 lt!76354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49031 (= lt!76354 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689))))))

(assert (=> b!49031 (= lt!76338 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(declare-fun b!49032 () Bool)

(declare-fun res!41173 () Bool)

(assert (=> b!49032 (=> (not res!41173) (not e!32410))))

(assert (=> b!49032 (= res!41173 (isPrefixOf!0 (_1!2397 lt!76343) (_2!2398 lt!75692)))))

(declare-fun b!49033 () Bool)

(declare-fun res!41171 () Bool)

(assert (=> b!49033 (=> (not res!41171) (not e!32410))))

(assert (=> b!49033 (= res!41171 (isPrefixOf!0 (_2!2397 lt!76343) (_2!2398 lt!75689)))))

(declare-fun b!49034 () Bool)

(declare-fun lt!76342 () Unit!3414)

(assert (=> b!49034 (= e!32409 lt!76342)))

(declare-fun lt!76353 () (_ BitVec 64))

(assert (=> b!49034 (= lt!76353 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76344 () (_ BitVec 64))

(assert (=> b!49034 (= lt!76344 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(assert (=> b!49034 (= lt!76342 (arrayBitRangesEqSymmetric!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (_2!2398 lt!75689)) lt!76353 lt!76344))))

(assert (=> b!49034 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75689)) (buf!1400 (_2!2398 lt!75692)) lt!76353 lt!76344)))

(assert (= (and d!15028 c!3439) b!49034))

(assert (= (and d!15028 (not c!3439)) b!49030))

(assert (= (and d!15028 res!41172) b!49032))

(assert (= (and b!49032 res!41173) b!49033))

(assert (= (and b!49033 res!41171) b!49031))

(declare-fun m!76363 () Bool)

(assert (=> d!15028 m!76363))

(assert (=> d!15028 m!76241))

(declare-fun m!76365 () Bool)

(assert (=> d!15028 m!76365))

(declare-fun m!76367 () Bool)

(assert (=> d!15028 m!76367))

(assert (=> d!15028 m!76239))

(declare-fun m!76369 () Bool)

(assert (=> d!15028 m!76369))

(declare-fun m!76371 () Bool)

(assert (=> d!15028 m!76371))

(assert (=> d!15028 m!75823))

(declare-fun m!76373 () Bool)

(assert (=> d!15028 m!76373))

(declare-fun m!76375 () Bool)

(assert (=> d!15028 m!76375))

(declare-fun m!76377 () Bool)

(assert (=> d!15028 m!76377))

(declare-fun m!76379 () Bool)

(assert (=> b!49033 m!76379))

(assert (=> b!49034 m!75847))

(declare-fun m!76381 () Bool)

(assert (=> b!49034 m!76381))

(declare-fun m!76383 () Bool)

(assert (=> b!49034 m!76383))

(declare-fun m!76385 () Bool)

(assert (=> b!49032 m!76385))

(declare-fun m!76387 () Bool)

(assert (=> b!49031 m!76387))

(assert (=> b!49031 m!75797))

(assert (=> b!49031 m!75847))

(assert (=> b!48725 d!15028))

(declare-fun d!15030 () Bool)

(assert (=> d!15030 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3840 () Bool)

(assert (= bs!3840 d!15030))

(declare-fun m!76389 () Bool)

(assert (=> bs!3840 m!76389))

(assert (=> b!48725 d!15030))

(declare-fun d!15032 () Bool)

(assert (=> d!15032 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!76357 () Unit!3414)

(assert (=> d!15032 (= lt!76357 (choose!9 thiss!1379 (buf!1400 (_2!2398 lt!75689)) (bvsub to!314 i!635) (BitStream!1817 (buf!1400 (_2!2398 lt!75689)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(assert (=> d!15032 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1400 (_2!2398 lt!75689)) (bvsub to!314 i!635)) lt!76357)))

(declare-fun bs!3841 () Bool)

(assert (= bs!3841 d!15032))

(assert (=> bs!3841 m!75869))

(declare-fun m!76391 () Bool)

(assert (=> bs!3841 m!76391))

(assert (=> b!48725 d!15032))

(declare-fun d!15034 () Bool)

(declare-fun e!32427 () Bool)

(assert (=> d!15034 e!32427))

(declare-fun c!3448 () Bool)

(assert (=> d!15034 (= c!3448 (= lt!75702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!76457 () List!549)

(declare-datatypes ((tuple2!4618 0))(
  ( (tuple2!4619 (_1!2408 List!549) (_2!2408 BitStream!1816)) )
))
(declare-fun e!32428 () tuple2!4618)

(assert (=> d!15034 (= lt!76457 (_1!2408 e!32428))))

(declare-fun c!3449 () Bool)

(assert (=> d!15034 (= c!3449 (= lt!75702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15034 (bvsge lt!75702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15034 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_1!2397 lt!75701) lt!75702) lt!76457)))

(declare-fun b!49073 () Bool)

(declare-fun isEmpty!144 (List!549) Bool)

(assert (=> b!49073 (= e!32427 (isEmpty!144 lt!76457))))

(declare-fun b!49071 () Bool)

(assert (=> b!49071 (= e!32428 (tuple2!4619 Nil!546 (_1!2397 lt!75701)))))

(declare-fun b!49074 () Bool)

(assert (=> b!49074 (= e!32427 (> (length!244 lt!76457) 0))))

(declare-datatypes ((tuple2!4620 0))(
  ( (tuple2!4621 (_1!2409 Bool) (_2!2409 BitStream!1816)) )
))
(declare-fun lt!76458 () tuple2!4620)

(declare-fun b!49072 () Bool)

(declare-fun lt!76459 () (_ BitVec 64))

(assert (=> b!49072 (= e!32428 (tuple2!4619 (Cons!545 (_1!2409 lt!76458) (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_2!2409 lt!76458) (bvsub lt!75702 lt!76459))) (_2!2409 lt!76458)))))

(declare-fun readBit!0 (BitStream!1816) tuple2!4620)

(assert (=> b!49072 (= lt!76458 (readBit!0 (_1!2397 lt!75701)))))

(assert (=> b!49072 (= lt!76459 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15034 c!3449) b!49071))

(assert (= (and d!15034 (not c!3449)) b!49072))

(assert (= (and d!15034 c!3448) b!49073))

(assert (= (and d!15034 (not c!3448)) b!49074))

(declare-fun m!76455 () Bool)

(assert (=> b!49073 m!76455))

(declare-fun m!76457 () Bool)

(assert (=> b!49074 m!76457))

(declare-fun m!76459 () Bool)

(assert (=> b!49072 m!76459))

(declare-fun m!76463 () Bool)

(assert (=> b!49072 m!76463))

(assert (=> b!48725 d!15034))

(declare-fun d!15052 () Bool)

(assert (=> d!15052 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!75702) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692)))) lt!75702))))

(declare-fun bs!3846 () Bool)

(assert (= bs!3846 d!15052))

(declare-fun m!76475 () Bool)

(assert (=> bs!3846 m!76475))

(assert (=> b!48725 d!15052))

(declare-fun d!15054 () Bool)

(declare-fun e!32431 () Bool)

(assert (=> d!15054 e!32431))

(declare-fun c!3451 () Bool)

(assert (=> d!15054 (= c!3451 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!76480 () List!549)

(declare-fun e!32432 () tuple2!4618)

(assert (=> d!15054 (= lt!76480 (_1!2408 e!32432))))

(declare-fun c!3452 () Bool)

(assert (=> d!15054 (= c!3452 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15054 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15054 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_1!2397 lt!75703) (bvsub to!314 i!635)) lt!76480)))

(declare-fun b!49082 () Bool)

(assert (=> b!49082 (= e!32431 (isEmpty!144 lt!76480))))

(declare-fun b!49080 () Bool)

(assert (=> b!49080 (= e!32432 (tuple2!4619 Nil!546 (_1!2397 lt!75703)))))

(declare-fun b!49083 () Bool)

(assert (=> b!49083 (= e!32431 (> (length!244 lt!76480) 0))))

(declare-fun b!49081 () Bool)

(declare-fun lt!76482 () (_ BitVec 64))

(declare-fun lt!76481 () tuple2!4620)

(assert (=> b!49081 (= e!32432 (tuple2!4619 (Cons!545 (_1!2409 lt!76481) (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_2!2409 lt!76481) (bvsub (bvsub to!314 i!635) lt!76482))) (_2!2409 lt!76481)))))

(assert (=> b!49081 (= lt!76481 (readBit!0 (_1!2397 lt!75703)))))

(assert (=> b!49081 (= lt!76482 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15054 c!3452) b!49080))

(assert (= (and d!15054 (not c!3452)) b!49081))

(assert (= (and d!15054 c!3451) b!49082))

(assert (= (and d!15054 (not c!3451)) b!49083))

(declare-fun m!76485 () Bool)

(assert (=> b!49082 m!76485))

(declare-fun m!76487 () Bool)

(assert (=> b!49083 m!76487))

(declare-fun m!76489 () Bool)

(assert (=> b!49081 m!76489))

(declare-fun m!76493 () Bool)

(assert (=> b!49081 m!76493))

(assert (=> b!48725 d!15054))

(declare-fun d!15058 () Bool)

(assert (=> d!15058 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!75702)))

(declare-fun lt!76484 () Unit!3414)

(assert (=> d!15058 (= lt!76484 (choose!9 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!75689)) lt!75702 (BitStream!1817 (buf!1400 (_2!2398 lt!75689)) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(assert (=> d!15058 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!75689)) lt!75702) lt!76484)))

(declare-fun bs!3848 () Bool)

(assert (= bs!3848 d!15058))

(assert (=> bs!3848 m!75871))

(declare-fun m!76495 () Bool)

(assert (=> bs!3848 m!76495))

(assert (=> b!48725 d!15058))

(declare-fun b!49084 () Bool)

(declare-fun e!32433 () Unit!3414)

(declare-fun Unit!3439 () Unit!3414)

(assert (=> b!49084 (= e!32433 Unit!3439)))

(declare-fun d!15062 () Bool)

(declare-fun e!32434 () Bool)

(assert (=> d!15062 e!32434))

(declare-fun res!41198 () Bool)

(assert (=> d!15062 (=> (not res!41198) (not e!32434))))

(declare-fun lt!76491 () tuple2!4596)

(assert (=> d!15062 (= res!41198 (isPrefixOf!0 (_1!2397 lt!76491) (_2!2397 lt!76491)))))

(declare-fun lt!76485 () BitStream!1816)

(assert (=> d!15062 (= lt!76491 (tuple2!4597 lt!76485 (_2!2398 lt!75689)))))

(declare-fun lt!76503 () Unit!3414)

(declare-fun lt!76497 () Unit!3414)

(assert (=> d!15062 (= lt!76503 lt!76497)))

(assert (=> d!15062 (isPrefixOf!0 lt!76485 (_2!2398 lt!75689))))

(assert (=> d!15062 (= lt!76497 (lemmaIsPrefixTransitive!0 lt!76485 (_2!2398 lt!75689) (_2!2398 lt!75689)))))

(declare-fun lt!76495 () Unit!3414)

(declare-fun lt!76498 () Unit!3414)

(assert (=> d!15062 (= lt!76495 lt!76498)))

(assert (=> d!15062 (isPrefixOf!0 lt!76485 (_2!2398 lt!75689))))

(assert (=> d!15062 (= lt!76498 (lemmaIsPrefixTransitive!0 lt!76485 thiss!1379 (_2!2398 lt!75689)))))

(declare-fun lt!76499 () Unit!3414)

(assert (=> d!15062 (= lt!76499 e!32433)))

(declare-fun c!3453 () Bool)

(assert (=> d!15062 (= c!3453 (not (= (size!1048 (buf!1400 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!76504 () Unit!3414)

(declare-fun lt!76494 () Unit!3414)

(assert (=> d!15062 (= lt!76504 lt!76494)))

(assert (=> d!15062 (isPrefixOf!0 (_2!2398 lt!75689) (_2!2398 lt!75689))))

(assert (=> d!15062 (= lt!76494 (lemmaIsPrefixRefl!0 (_2!2398 lt!75689)))))

(declare-fun lt!76489 () Unit!3414)

(declare-fun lt!76496 () Unit!3414)

(assert (=> d!15062 (= lt!76489 lt!76496)))

(assert (=> d!15062 (= lt!76496 (lemmaIsPrefixRefl!0 (_2!2398 lt!75689)))))

(declare-fun lt!76500 () Unit!3414)

(declare-fun lt!76493 () Unit!3414)

(assert (=> d!15062 (= lt!76500 lt!76493)))

(assert (=> d!15062 (isPrefixOf!0 lt!76485 lt!76485)))

(assert (=> d!15062 (= lt!76493 (lemmaIsPrefixRefl!0 lt!76485))))

(declare-fun lt!76487 () Unit!3414)

(declare-fun lt!76488 () Unit!3414)

(assert (=> d!15062 (= lt!76487 lt!76488)))

(assert (=> d!15062 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!15062 (= lt!76488 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!15062 (= lt!76485 (BitStream!1817 (buf!1400 (_2!2398 lt!75689)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)))))

(assert (=> d!15062 (isPrefixOf!0 thiss!1379 (_2!2398 lt!75689))))

(assert (=> d!15062 (= (reader!0 thiss!1379 (_2!2398 lt!75689)) lt!76491)))

(declare-fun b!49085 () Bool)

(declare-fun lt!76502 () (_ BitVec 64))

(declare-fun lt!76486 () (_ BitVec 64))

(assert (=> b!49085 (= e!32434 (= (_1!2397 lt!76491) (withMovedBitIndex!0 (_2!2397 lt!76491) (bvsub lt!76486 lt!76502))))))

(assert (=> b!49085 (or (= (bvand lt!76486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76486 lt!76502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49085 (= lt!76502 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689))))))

(assert (=> b!49085 (= lt!76486 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)))))

(declare-fun b!49086 () Bool)

(declare-fun res!41199 () Bool)

(assert (=> b!49086 (=> (not res!41199) (not e!32434))))

(assert (=> b!49086 (= res!41199 (isPrefixOf!0 (_1!2397 lt!76491) thiss!1379))))

(declare-fun b!49087 () Bool)

(declare-fun res!41197 () Bool)

(assert (=> b!49087 (=> (not res!41197) (not e!32434))))

(assert (=> b!49087 (= res!41197 (isPrefixOf!0 (_2!2397 lt!76491) (_2!2398 lt!75689)))))

(declare-fun b!49088 () Bool)

(declare-fun lt!76490 () Unit!3414)

(assert (=> b!49088 (= e!32433 lt!76490)))

(declare-fun lt!76501 () (_ BitVec 64))

(assert (=> b!49088 (= lt!76501 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76492 () (_ BitVec 64))

(assert (=> b!49088 (= lt!76492 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)))))

(assert (=> b!49088 (= lt!76490 (arrayBitRangesEqSymmetric!0 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75689)) lt!76501 lt!76492))))

(assert (=> b!49088 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75689)) (buf!1400 thiss!1379) lt!76501 lt!76492)))

(assert (= (and d!15062 c!3453) b!49088))

(assert (= (and d!15062 (not c!3453)) b!49084))

(assert (= (and d!15062 res!41198) b!49086))

(assert (= (and b!49086 res!41199) b!49087))

(assert (= (and b!49087 res!41197) b!49085))

(declare-fun m!76523 () Bool)

(assert (=> d!15062 m!76523))

(assert (=> d!15062 m!75801))

(assert (=> d!15062 m!76365))

(declare-fun m!76525 () Bool)

(assert (=> d!15062 m!76525))

(assert (=> d!15062 m!75799))

(declare-fun m!76527 () Bool)

(assert (=> d!15062 m!76527))

(declare-fun m!76529 () Bool)

(assert (=> d!15062 m!76529))

(assert (=> d!15062 m!75819))

(declare-fun m!76531 () Bool)

(assert (=> d!15062 m!76531))

(declare-fun m!76533 () Bool)

(assert (=> d!15062 m!76533))

(assert (=> d!15062 m!76377))

(declare-fun m!76535 () Bool)

(assert (=> b!49087 m!76535))

(assert (=> b!49088 m!75803))

(declare-fun m!76537 () Bool)

(assert (=> b!49088 m!76537))

(declare-fun m!76539 () Bool)

(assert (=> b!49088 m!76539))

(declare-fun m!76541 () Bool)

(assert (=> b!49086 m!76541))

(declare-fun m!76543 () Bool)

(assert (=> b!49085 m!76543))

(assert (=> b!49085 m!75797))

(assert (=> b!49085 m!75803))

(assert (=> b!48725 d!15062))

(declare-fun d!15066 () Bool)

(declare-fun e!32435 () Bool)

(assert (=> d!15066 e!32435))

(declare-fun res!41200 () Bool)

(assert (=> d!15066 (=> (not res!41200) (not e!32435))))

(declare-fun lt!76506 () (_ BitVec 64))

(declare-fun lt!76507 () (_ BitVec 64))

(declare-fun lt!76508 () (_ BitVec 64))

(assert (=> d!15066 (= res!41200 (= lt!76508 (bvsub lt!76506 lt!76507)))))

(assert (=> d!15066 (or (= (bvand lt!76506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76507 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76506 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76506 lt!76507) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15066 (= lt!76507 (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75689))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75689)))))))

(declare-fun lt!76510 () (_ BitVec 64))

(declare-fun lt!76509 () (_ BitVec 64))

(assert (=> d!15066 (= lt!76506 (bvmul lt!76510 lt!76509))))

(assert (=> d!15066 (or (= lt!76510 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!76509 (bvsdiv (bvmul lt!76510 lt!76509) lt!76510)))))

(assert (=> d!15066 (= lt!76509 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15066 (= lt!76510 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))))))

(assert (=> d!15066 (= lt!76508 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75689))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75689)))))))

(assert (=> d!15066 (invariant!0 (currentBit!2912 (_2!2398 lt!75689)) (currentByte!2917 (_2!2398 lt!75689)) (size!1048 (buf!1400 (_2!2398 lt!75689))))))

(assert (=> d!15066 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689))) lt!76508)))

(declare-fun b!49089 () Bool)

(declare-fun res!41201 () Bool)

(assert (=> b!49089 (=> (not res!41201) (not e!32435))))

(assert (=> b!49089 (= res!41201 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76508))))

(declare-fun b!49090 () Bool)

(declare-fun lt!76505 () (_ BitVec 64))

(assert (=> b!49090 (= e!32435 (bvsle lt!76508 (bvmul lt!76505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49090 (or (= lt!76505 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!76505 #b0000000000000000000000000000000000000000000000000000000000001000) lt!76505)))))

(assert (=> b!49090 (= lt!76505 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))))))

(assert (= (and d!15066 res!41200) b!49089))

(assert (= (and b!49089 res!41201) b!49090))

(declare-fun m!76545 () Bool)

(assert (=> d!15066 m!76545))

(assert (=> d!15066 m!75845))

(assert (=> b!48735 d!15066))

(declare-fun d!15068 () Bool)

(declare-fun res!41202 () Bool)

(declare-fun e!32436 () Bool)

(assert (=> d!15068 (=> (not res!41202) (not e!32436))))

(assert (=> d!15068 (= res!41202 (= (size!1048 (buf!1400 thiss!1379)) (size!1048 (buf!1400 (_2!2398 lt!75692)))))))

(assert (=> d!15068 (= (isPrefixOf!0 thiss!1379 (_2!2398 lt!75692)) e!32436)))

(declare-fun b!49091 () Bool)

(declare-fun res!41204 () Bool)

(assert (=> b!49091 (=> (not res!41204) (not e!32436))))

(assert (=> b!49091 (= res!41204 (bvsle (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(declare-fun b!49092 () Bool)

(declare-fun e!32437 () Bool)

(assert (=> b!49092 (= e!32436 e!32437)))

(declare-fun res!41203 () Bool)

(assert (=> b!49092 (=> res!41203 e!32437)))

(assert (=> b!49092 (= res!41203 (= (size!1048 (buf!1400 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!49093 () Bool)

(assert (=> b!49093 (= e!32437 (arrayBitRangesEq!0 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75692)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(assert (= (and d!15068 res!41202) b!49091))

(assert (= (and b!49091 res!41204) b!49092))

(assert (= (and b!49092 (not res!41203)) b!49093))

(assert (=> b!49091 m!75803))

(assert (=> b!49091 m!75847))

(assert (=> b!49093 m!75803))

(assert (=> b!49093 m!75803))

(declare-fun m!76547 () Bool)

(assert (=> b!49093 m!76547))

(assert (=> b!48724 d!15068))

(declare-fun d!15070 () Bool)

(assert (=> d!15070 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!75702) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692)))) lt!75702))))

(declare-fun bs!3849 () Bool)

(assert (= bs!3849 d!15070))

(assert (=> bs!3849 m!76091))

(assert (=> b!48724 d!15070))

(declare-fun d!15072 () Bool)

(declare-fun e!32448 () Bool)

(assert (=> d!15072 e!32448))

(declare-fun res!41216 () Bool)

(assert (=> d!15072 (=> (not res!41216) (not e!32448))))

(assert (=> d!15072 (= res!41216 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!76515 () Unit!3414)

(declare-fun choose!27 (BitStream!1816 BitStream!1816 (_ BitVec 64) (_ BitVec 64)) Unit!3414)

(assert (=> d!15072 (= lt!76515 (choose!27 thiss!1379 (_2!2398 lt!75692) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!15072 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!15072 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2398 lt!75692) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!76515)))

(declare-fun b!49109 () Bool)

(assert (=> b!49109 (= e!32448 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!15072 res!41216) b!49109))

(declare-fun m!76551 () Bool)

(assert (=> d!15072 m!76551))

(declare-fun m!76553 () Bool)

(assert (=> b!49109 m!76553))

(assert (=> b!48724 d!15072))

(declare-fun b!49151 () Bool)

(declare-fun e!32469 () Bool)

(declare-datatypes ((tuple2!4622 0))(
  ( (tuple2!4623 (_1!2410 BitStream!1816) (_2!2410 Bool)) )
))
(declare-fun lt!76569 () tuple2!4622)

(declare-fun lt!76561 () tuple2!4598)

(assert (=> b!49151 (= e!32469 (= (bitIndex!0 (size!1048 (buf!1400 (_1!2410 lt!76569))) (currentByte!2917 (_1!2410 lt!76569)) (currentBit!2912 (_1!2410 lt!76569))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76561))) (currentByte!2917 (_2!2398 lt!76561)) (currentBit!2912 (_2!2398 lt!76561)))))))

(declare-fun b!49152 () Bool)

(declare-fun res!41238 () Bool)

(declare-fun e!32470 () Bool)

(assert (=> b!49152 (=> (not res!41238) (not e!32470))))

(declare-fun lt!76568 () (_ BitVec 64))

(declare-fun lt!76565 () (_ BitVec 64))

(declare-fun lt!76560 () tuple2!4598)

(assert (=> b!49152 (= res!41238 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76560))) (currentByte!2917 (_2!2398 lt!76560)) (currentBit!2912 (_2!2398 lt!76560))) (bvadd lt!76568 lt!76565)))))

(assert (=> b!49152 (or (not (= (bvand lt!76568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76565 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!76568 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!76568 lt!76565) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49152 (= lt!76565 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49152 (= lt!76568 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)))))

(declare-fun b!49153 () Bool)

(declare-fun e!32472 () Bool)

(declare-fun lt!76559 () tuple2!4622)

(assert (=> b!49153 (= e!32472 (= (bitIndex!0 (size!1048 (buf!1400 (_1!2410 lt!76559))) (currentByte!2917 (_1!2410 lt!76559)) (currentBit!2912 (_1!2410 lt!76559))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76560))) (currentByte!2917 (_2!2398 lt!76560)) (currentBit!2912 (_2!2398 lt!76560)))))))

(declare-fun b!49155 () Bool)

(declare-fun res!41235 () Bool)

(assert (=> b!49155 (=> (not res!41235) (not e!32470))))

(assert (=> b!49155 (= res!41235 (isPrefixOf!0 thiss!1379 (_2!2398 lt!76560)))))

(declare-fun b!49156 () Bool)

(assert (=> b!49156 (= e!32470 e!32472)))

(declare-fun res!41240 () Bool)

(assert (=> b!49156 (=> (not res!41240) (not e!32472))))

(declare-fun lt!76570 () (_ BitVec 8))

(assert (=> b!49156 (= res!41240 (and (= (_2!2410 lt!76559) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!76570)) #b00000000000000000000000000000000))) (= (_1!2410 lt!76559) (_2!2398 lt!76560))))))

(declare-fun lt!76566 () tuple2!4612)

(declare-fun lt!76564 () BitStream!1816)

(assert (=> b!49156 (= lt!76566 (readBits!0 lt!76564 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1816) tuple2!4622)

(assert (=> b!49156 (= lt!76559 (readBitPure!0 lt!76564))))

(declare-fun readerFrom!0 (BitStream!1816 (_ BitVec 32) (_ BitVec 32)) BitStream!1816)

(assert (=> b!49156 (= lt!76564 (readerFrom!0 (_2!2398 lt!76560) (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379)))))

(declare-fun b!49154 () Bool)

(declare-fun res!41236 () Bool)

(declare-fun e!32471 () Bool)

(assert (=> b!49154 (=> (not res!41236) (not e!32471))))

(assert (=> b!49154 (= res!41236 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76561))) (currentByte!2917 (_2!2398 lt!76561)) (currentBit!2912 (_2!2398 lt!76561))) (bvadd (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!15076 () Bool)

(assert (=> d!15076 e!32470))

(declare-fun res!41234 () Bool)

(assert (=> d!15076 (=> (not res!41234) (not e!32470))))

(assert (=> d!15076 (= res!41234 (= (size!1048 (buf!1400 (_2!2398 lt!76560))) (size!1048 (buf!1400 thiss!1379))))))

(declare-fun lt!76563 () array!2311)

(assert (=> d!15076 (= lt!76570 (select (arr!1574 lt!76563) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!15076 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1048 lt!76563)))))

(assert (=> d!15076 (= lt!76563 (array!2312 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!76562 () tuple2!4598)

(assert (=> d!15076 (= lt!76560 (tuple2!4599 (_1!2398 lt!76562) (_2!2398 lt!76562)))))

(assert (=> d!15076 (= lt!76562 lt!76561)))

(assert (=> d!15076 e!32471))

(declare-fun res!41239 () Bool)

(assert (=> d!15076 (=> (not res!41239) (not e!32471))))

(assert (=> d!15076 (= res!41239 (= (size!1048 (buf!1400 thiss!1379)) (size!1048 (buf!1400 (_2!2398 lt!76561)))))))

(declare-fun lt!76567 () Bool)

(declare-fun appendBit!0 (BitStream!1816 Bool) tuple2!4598)

(assert (=> d!15076 (= lt!76561 (appendBit!0 thiss!1379 lt!76567))))

(assert (=> d!15076 (= lt!76567 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!15076 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!15076 (= (appendBitFromByte!0 thiss!1379 (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!76560)))

(declare-fun b!49157 () Bool)

(declare-fun res!41237 () Bool)

(assert (=> b!49157 (=> (not res!41237) (not e!32471))))

(assert (=> b!49157 (= res!41237 (isPrefixOf!0 thiss!1379 (_2!2398 lt!76561)))))

(declare-fun b!49158 () Bool)

(assert (=> b!49158 (= e!32471 e!32469)))

(declare-fun res!41233 () Bool)

(assert (=> b!49158 (=> (not res!41233) (not e!32469))))

(assert (=> b!49158 (= res!41233 (and (= (_2!2410 lt!76569) lt!76567) (= (_1!2410 lt!76569) (_2!2398 lt!76561))))))

(assert (=> b!49158 (= lt!76569 (readBitPure!0 (readerFrom!0 (_2!2398 lt!76561) (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379))))))

(assert (= (and d!15076 res!41239) b!49154))

(assert (= (and b!49154 res!41236) b!49157))

(assert (= (and b!49157 res!41237) b!49158))

(assert (= (and b!49158 res!41233) b!49151))

(assert (= (and d!15076 res!41234) b!49152))

(assert (= (and b!49152 res!41238) b!49155))

(assert (= (and b!49155 res!41235) b!49156))

(assert (= (and b!49156 res!41240) b!49153))

(declare-fun m!76593 () Bool)

(assert (=> b!49153 m!76593))

(declare-fun m!76595 () Bool)

(assert (=> b!49153 m!76595))

(declare-fun m!76597 () Bool)

(assert (=> b!49156 m!76597))

(declare-fun m!76599 () Bool)

(assert (=> b!49156 m!76599))

(declare-fun m!76601 () Bool)

(assert (=> b!49156 m!76601))

(declare-fun m!76603 () Bool)

(assert (=> b!49158 m!76603))

(assert (=> b!49158 m!76603))

(declare-fun m!76605 () Bool)

(assert (=> b!49158 m!76605))

(declare-fun m!76607 () Bool)

(assert (=> d!15076 m!76607))

(declare-fun m!76609 () Bool)

(assert (=> d!15076 m!76609))

(assert (=> d!15076 m!76359))

(declare-fun m!76611 () Bool)

(assert (=> b!49151 m!76611))

(declare-fun m!76613 () Bool)

(assert (=> b!49151 m!76613))

(assert (=> b!49152 m!76595))

(assert (=> b!49152 m!75803))

(declare-fun m!76615 () Bool)

(assert (=> b!49157 m!76615))

(assert (=> b!49154 m!76613))

(assert (=> b!49154 m!75803))

(declare-fun m!76617 () Bool)

(assert (=> b!49155 m!76617))

(assert (=> b!48724 d!15076))

(declare-fun d!15110 () Bool)

(assert (=> d!15110 (= (array_inv!961 (buf!1400 thiss!1379)) (bvsge (size!1048 (buf!1400 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!48734 d!15110))

(declare-fun d!15112 () Bool)

(assert (=> d!15112 (= (head!368 (byteArrayBitContentToList!0 (_2!2398 lt!75692) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!664 (byteArrayBitContentToList!0 (_2!2398 lt!75692) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48723 d!15112))

(declare-fun d!15114 () Bool)

(declare-fun c!3468 () Bool)

(assert (=> d!15114 (= c!3468 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32473 () List!549)

(assert (=> d!15114 (= (byteArrayBitContentToList!0 (_2!2398 lt!75692) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!32473)))

(declare-fun b!49159 () Bool)

(assert (=> b!49159 (= e!32473 Nil!546)))

(declare-fun b!49160 () Bool)

(assert (=> b!49160 (= e!32473 (Cons!545 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2398 lt!75692) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15114 c!3468) b!49159))

(assert (= (and d!15114 (not c!3468)) b!49160))

(assert (=> b!49160 m!75851))

(assert (=> b!49160 m!76359))

(declare-fun m!76619 () Bool)

(assert (=> b!49160 m!76619))

(assert (=> b!48723 d!15114))

(declare-fun d!15116 () Bool)

(assert (=> d!15116 (= (head!368 (bitStreamReadBitsIntoList!0 (_2!2398 lt!75692) (_1!2397 lt!75686) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!664 (bitStreamReadBitsIntoList!0 (_2!2398 lt!75692) (_1!2397 lt!75686) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48723 d!15116))

(declare-fun d!15118 () Bool)

(declare-fun e!32474 () Bool)

(assert (=> d!15118 e!32474))

(declare-fun c!3469 () Bool)

(assert (=> d!15118 (= c!3469 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!76571 () List!549)

(declare-fun e!32475 () tuple2!4618)

(assert (=> d!15118 (= lt!76571 (_1!2408 e!32475))))

(declare-fun c!3470 () Bool)

(assert (=> d!15118 (= c!3470 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15118 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15118 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!75692) (_1!2397 lt!75686) #b0000000000000000000000000000000000000000000000000000000000000001) lt!76571)))

(declare-fun b!49163 () Bool)

(assert (=> b!49163 (= e!32474 (isEmpty!144 lt!76571))))

(declare-fun b!49161 () Bool)

(assert (=> b!49161 (= e!32475 (tuple2!4619 Nil!546 (_1!2397 lt!75686)))))

(declare-fun b!49164 () Bool)

(assert (=> b!49164 (= e!32474 (> (length!244 lt!76571) 0))))

(declare-fun lt!76572 () tuple2!4620)

(declare-fun b!49162 () Bool)

(declare-fun lt!76573 () (_ BitVec 64))

(assert (=> b!49162 (= e!32475 (tuple2!4619 (Cons!545 (_1!2409 lt!76572) (bitStreamReadBitsIntoList!0 (_2!2398 lt!75692) (_2!2409 lt!76572) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76573))) (_2!2409 lt!76572)))))

(assert (=> b!49162 (= lt!76572 (readBit!0 (_1!2397 lt!75686)))))

(assert (=> b!49162 (= lt!76573 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15118 c!3470) b!49161))

(assert (= (and d!15118 (not c!3470)) b!49162))

(assert (= (and d!15118 c!3469) b!49163))

(assert (= (and d!15118 (not c!3469)) b!49164))

(declare-fun m!76621 () Bool)

(assert (=> b!49163 m!76621))

(declare-fun m!76623 () Bool)

(assert (=> b!49164 m!76623))

(declare-fun m!76625 () Bool)

(assert (=> b!49162 m!76625))

(declare-fun m!76627 () Bool)

(assert (=> b!49162 m!76627))

(assert (=> b!48723 d!15118))

(declare-fun d!15120 () Bool)

(assert (=> d!15120 (= (array_inv!961 srcBuffer!2) (bvsge (size!1048 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9764 d!15120))

(declare-fun d!15122 () Bool)

(assert (=> d!15122 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379) (size!1048 (buf!1400 thiss!1379))))))

(declare-fun bs!3856 () Bool)

(assert (= bs!3856 d!15122))

(assert (=> bs!3856 m!76357))

(assert (=> start!9764 d!15122))

(declare-fun d!15124 () Bool)

(assert (=> d!15124 (= (bitAt!0 (buf!1400 (_1!2397 lt!75701)) lt!75690) (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75701))) ((_ extract 31 0) (bvsdiv lt!75690 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!75690 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3857 () Bool)

(assert (= bs!3857 d!15124))

(declare-fun m!76629 () Bool)

(assert (=> bs!3857 m!76629))

(assert (=> bs!3857 m!76089))

(assert (=> b!48733 d!15124))

(declare-fun d!15126 () Bool)

(assert (=> d!15126 (= (bitAt!0 (buf!1400 (_1!2397 lt!75703)) lt!75690) (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75703))) ((_ extract 31 0) (bvsdiv lt!75690 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!75690 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3858 () Bool)

(assert (= bs!3858 d!15126))

(declare-fun m!76631 () Bool)

(assert (=> bs!3858 m!76631))

(assert (=> bs!3858 m!76089))

(assert (=> b!48733 d!15126))

(declare-fun d!15128 () Bool)

(assert (=> d!15128 (= (invariant!0 (currentBit!2912 (_2!2398 lt!75689)) (currentByte!2917 (_2!2398 lt!75689)) (size!1048 (buf!1400 (_2!2398 lt!75689)))) (and (bvsge (currentBit!2912 (_2!2398 lt!75689)) #b00000000000000000000000000000000) (bvslt (currentBit!2912 (_2!2398 lt!75689)) #b00000000000000000000000000001000) (bvsge (currentByte!2917 (_2!2398 lt!75689)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2917 (_2!2398 lt!75689)) (size!1048 (buf!1400 (_2!2398 lt!75689)))) (and (= (currentBit!2912 (_2!2398 lt!75689)) #b00000000000000000000000000000000) (= (currentByte!2917 (_2!2398 lt!75689)) (size!1048 (buf!1400 (_2!2398 lt!75689))))))))))

(assert (=> b!48732 d!15128))

(push 1)

(assert (not d!15006))

(assert (not b!48976))

(assert (not b!49081))

(assert (not d!14960))

(assert (not b!49153))

(assert (not b!48901))

(assert (not d!15028))

(assert (not d!15122))

(assert (not b!49091))

(assert (not b!49082))

(assert (not b!48974))

(assert (not d!15058))

(assert (not b!49004))

(assert (not b!48975))

(assert (not d!15012))

(assert (not b!49032))

(assert (not d!15030))

(assert (not b!48978))

(assert (not b!49072))

(assert (not d!14974))

(assert (not b!48973))

(assert (not b!48899))

(assert (not b!49157))

(assert (not b!49083))

(assert (not b!49163))

(assert (not d!15014))

(assert (not b!48886))

(assert (not b!49158))

(assert (not b!49034))

(assert (not b!49152))

(assert (not b!49085))

(assert (not b!49151))

(assert (not b!49093))

(assert (not d!14998))

(assert (not d!14964))

(assert (not b!49073))

(assert (not b!48904))

(assert (not d!15076))

(assert (not d!15000))

(assert (not d!15066))

(assert (not b!49033))

(assert (not b!48980))

(assert (not b!49154))

(assert (not b!49164))

(assert (not b!49160))

(assert (not b!49031))

(assert (not d!15070))

(assert (not b!49109))

(assert (not b!49162))

(assert (not d!15008))

(assert (not b!49086))

(assert (not d!15052))

(assert (not b!49074))

(assert (not b!49029))

(assert (not b!49088))

(assert (not d!15062))

(assert (not b!48999))

(assert (not d!14966))

(assert (not d!15072))

(assert (not b!49001))

(assert (not b!48902))

(assert (not b!49000))

(assert (not b!49155))

(assert (not d!14970))

(assert (not b!49156))

(assert (not bm!613))

(assert (not b!49002))

(assert (not b!49087))

(assert (not d!15032))

(assert (not b!48998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!15460 () Bool)

(assert (=> d!15460 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_1!2397 lt!75701) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!235 lt!75696))))

(assert (=> d!15460 true))

(declare-fun _$34!44 () Unit!3414)

(assert (=> d!15460 (= (choose!42 (_2!2398 lt!75689) (_2!2398 lt!75689) (_1!2397 lt!75703) (_1!2397 lt!75701) (bvsub to!314 i!635) lt!75696) _$34!44)))

(declare-fun bs!3916 () Bool)

(assert (= bs!3916 d!15460))

(assert (=> bs!3916 m!76085))

(assert (=> bs!3916 m!75841))

(assert (=> d!14960 d!15460))

(declare-fun d!15462 () Bool)

(declare-fun res!41511 () Bool)

(declare-fun e!32710 () Bool)

(assert (=> d!15462 (=> (not res!41511) (not e!32710))))

(assert (=> d!15462 (= res!41511 (= (size!1048 (buf!1400 (_2!2397 lt!76287))) (size!1048 (buf!1400 (_2!2398 lt!75692)))))))

(assert (=> d!15462 (= (isPrefixOf!0 (_2!2397 lt!76287) (_2!2398 lt!75692)) e!32710)))

(declare-fun b!49556 () Bool)

(declare-fun res!41513 () Bool)

(assert (=> b!49556 (=> (not res!41513) (not e!32710))))

(assert (=> b!49556 (= res!41513 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76287))) (currentByte!2917 (_2!2397 lt!76287)) (currentBit!2912 (_2!2397 lt!76287))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(declare-fun b!49557 () Bool)

(declare-fun e!32711 () Bool)

(assert (=> b!49557 (= e!32710 e!32711)))

(declare-fun res!41512 () Bool)

(assert (=> b!49557 (=> res!41512 e!32711)))

(assert (=> b!49557 (= res!41512 (= (size!1048 (buf!1400 (_2!2397 lt!76287))) #b00000000000000000000000000000000))))

(declare-fun b!49558 () Bool)

(assert (=> b!49558 (= e!32711 (arrayBitRangesEq!0 (buf!1400 (_2!2397 lt!76287)) (buf!1400 (_2!2398 lt!75692)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76287))) (currentByte!2917 (_2!2397 lt!76287)) (currentBit!2912 (_2!2397 lt!76287)))))))

(assert (= (and d!15462 res!41511) b!49556))

(assert (= (and b!49556 res!41513) b!49557))

(assert (= (and b!49557 (not res!41512)) b!49558))

(declare-fun m!77543 () Bool)

(assert (=> b!49556 m!77543))

(assert (=> b!49556 m!75847))

(assert (=> b!49558 m!77543))

(assert (=> b!49558 m!77543))

(declare-fun m!77545 () Bool)

(assert (=> b!49558 m!77545))

(assert (=> b!49000 d!15462))

(declare-fun d!15464 () Bool)

(assert (=> d!15464 (= (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692)))) (bvsub (bvmul ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))))))))

(assert (=> d!14964 d!15464))

(assert (=> d!14964 d!15018))

(declare-fun d!15466 () Bool)

(assert (=> d!15466 (= (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 thiss!1379)))))))

(assert (=> d!14998 d!15466))

(assert (=> d!15070 d!15464))

(declare-fun d!15468 () Bool)

(declare-fun e!32712 () Bool)

(assert (=> d!15468 e!32712))

(declare-fun res!41514 () Bool)

(assert (=> d!15468 (=> (not res!41514) (not e!32712))))

(declare-fun lt!77184 () (_ BitVec 64))

(declare-fun lt!77185 () (_ BitVec 64))

(declare-fun lt!77183 () (_ BitVec 64))

(assert (=> d!15468 (= res!41514 (= lt!77185 (bvsub lt!77183 lt!77184)))))

(assert (=> d!15468 (or (= (bvand lt!77183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77184 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77183 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77183 lt!77184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15468 (= lt!77184 (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76202)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76202))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76202)))))))

(declare-fun lt!77187 () (_ BitVec 64))

(declare-fun lt!77186 () (_ BitVec 64))

(assert (=> d!15468 (= lt!77183 (bvmul lt!77187 lt!77186))))

(assert (=> d!15468 (or (= lt!77187 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77186 (bvsdiv (bvmul lt!77187 lt!77186) lt!77187)))))

(assert (=> d!15468 (= lt!77186 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15468 (= lt!77187 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76202)))))))

(assert (=> d!15468 (= lt!77185 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76202))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76202)))))))

(assert (=> d!15468 (invariant!0 (currentBit!2912 (_2!2398 lt!76202)) (currentByte!2917 (_2!2398 lt!76202)) (size!1048 (buf!1400 (_2!2398 lt!76202))))))

(assert (=> d!15468 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76202))) (currentByte!2917 (_2!2398 lt!76202)) (currentBit!2912 (_2!2398 lt!76202))) lt!77185)))

(declare-fun b!49559 () Bool)

(declare-fun res!41515 () Bool)

(assert (=> b!49559 (=> (not res!41515) (not e!32712))))

(assert (=> b!49559 (= res!41515 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77185))))

(declare-fun b!49560 () Bool)

(declare-fun lt!77182 () (_ BitVec 64))

(assert (=> b!49560 (= e!32712 (bvsle lt!77185 (bvmul lt!77182 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49560 (or (= lt!77182 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77182 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77182)))))

(assert (=> b!49560 (= lt!77182 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76202)))))))

(assert (= (and d!15468 res!41514) b!49559))

(assert (= (and b!49559 res!41515) b!49560))

(declare-fun m!77547 () Bool)

(assert (=> d!15468 m!77547))

(assert (=> d!15468 m!76235))

(assert (=> d!14974 d!15468))

(assert (=> d!14974 d!14964))

(declare-fun d!15470 () Bool)

(declare-fun res!41516 () Bool)

(declare-fun e!32713 () Bool)

(assert (=> d!15470 (=> (not res!41516) (not e!32713))))

(assert (=> d!15470 (= res!41516 (= (size!1048 (buf!1400 (_2!2398 lt!75692))) (size!1048 (buf!1400 (_2!2398 lt!75692)))))))

(assert (=> d!15470 (= (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!75692)) e!32713)))

(declare-fun b!49561 () Bool)

(declare-fun res!41518 () Bool)

(assert (=> b!49561 (=> (not res!41518) (not e!32713))))

(assert (=> b!49561 (= res!41518 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(declare-fun b!49562 () Bool)

(declare-fun e!32714 () Bool)

(assert (=> b!49562 (= e!32713 e!32714)))

(declare-fun res!41517 () Bool)

(assert (=> b!49562 (=> res!41517 e!32714)))

(assert (=> b!49562 (= res!41517 (= (size!1048 (buf!1400 (_2!2398 lt!75692))) #b00000000000000000000000000000000))))

(declare-fun b!49563 () Bool)

(assert (=> b!49563 (= e!32714 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (_2!2398 lt!75692)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(assert (= (and d!15470 res!41516) b!49561))

(assert (= (and b!49561 res!41518) b!49562))

(assert (= (and b!49562 (not res!41517)) b!49563))

(assert (=> b!49561 m!75847))

(assert (=> b!49561 m!75847))

(assert (=> b!49563 m!75847))

(assert (=> b!49563 m!75847))

(declare-fun m!77549 () Bool)

(assert (=> b!49563 m!77549))

(assert (=> d!14974 d!15470))

(declare-fun d!15472 () Bool)

(assert (=> d!15472 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!75692))))

(declare-fun lt!77188 () Unit!3414)

(assert (=> d!15472 (= lt!77188 (choose!11 (_2!2398 lt!75692)))))

(assert (=> d!15472 (= (lemmaIsPrefixRefl!0 (_2!2398 lt!75692)) lt!77188)))

(declare-fun bs!3917 () Bool)

(assert (= bs!3917 d!15472))

(assert (=> bs!3917 m!76239))

(declare-fun m!77551 () Bool)

(assert (=> bs!3917 m!77551))

(assert (=> d!14974 d!15472))

(declare-fun d!15474 () Bool)

(declare-fun e!32717 () Bool)

(assert (=> d!15474 e!32717))

(declare-fun res!41521 () Bool)

(assert (=> d!15474 (=> (not res!41521) (not e!32717))))

(declare-fun lt!77194 () (_ BitVec 64))

(declare-fun lt!77193 () BitStream!1816)

(assert (=> d!15474 (= res!41521 (= (bvadd lt!77194 (bvsub lt!76282 lt!76298)) (bitIndex!0 (size!1048 (buf!1400 lt!77193)) (currentByte!2917 lt!77193) (currentBit!2912 lt!77193))))))

(assert (=> d!15474 (or (not (= (bvand lt!77194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76282 lt!76298) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77194 (bvsub lt!76282 lt!76298)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15474 (= lt!77194 (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76287))) (currentByte!2917 (_2!2397 lt!76287)) (currentBit!2912 (_2!2397 lt!76287))))))

(declare-fun moveBitIndex!0 (BitStream!1816 (_ BitVec 64)) tuple2!4598)

(assert (=> d!15474 (= lt!77193 (_2!2398 (moveBitIndex!0 (_2!2397 lt!76287) (bvsub lt!76282 lt!76298))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!1816 (_ BitVec 64)) Bool)

(assert (=> d!15474 (moveBitIndexPrecond!0 (_2!2397 lt!76287) (bvsub lt!76282 lt!76298))))

(assert (=> d!15474 (= (withMovedBitIndex!0 (_2!2397 lt!76287) (bvsub lt!76282 lt!76298)) lt!77193)))

(declare-fun b!49566 () Bool)

(assert (=> b!49566 (= e!32717 (= (size!1048 (buf!1400 (_2!2397 lt!76287))) (size!1048 (buf!1400 lt!77193))))))

(assert (= (and d!15474 res!41521) b!49566))

(declare-fun m!77553 () Bool)

(assert (=> d!15474 m!77553))

(assert (=> d!15474 m!77543))

(declare-fun m!77555 () Bool)

(assert (=> d!15474 m!77555))

(declare-fun m!77557 () Bool)

(assert (=> d!15474 m!77557))

(assert (=> b!48998 d!15474))

(assert (=> b!48998 d!14964))

(assert (=> b!48998 d!15014))

(declare-fun d!15476 () Bool)

(declare-fun lt!77197 () Int)

(assert (=> d!15476 (>= lt!77197 0)))

(declare-fun e!32720 () Int)

(assert (=> d!15476 (= lt!77197 e!32720)))

(declare-fun c!3533 () Bool)

(assert (=> d!15476 (= c!3533 (is-Nil!546 lt!75696))))

(assert (=> d!15476 (= (size!1051 lt!75696) lt!77197)))

(declare-fun b!49571 () Bool)

(assert (=> b!49571 (= e!32720 0)))

(declare-fun b!49572 () Bool)

(assert (=> b!49572 (= e!32720 (+ 1 (size!1051 (t!1299 lt!75696))))))

(assert (= (and d!15476 c!3533) b!49571))

(assert (= (and d!15476 (not c!3533)) b!49572))

(declare-fun m!77559 () Bool)

(assert (=> b!49572 m!77559))

(assert (=> d!14966 d!15476))

(declare-fun d!15478 () Bool)

(assert (=> d!15478 (= (isEmpty!144 lt!76457) (is-Nil!546 lt!76457))))

(assert (=> b!49073 d!15478))

(declare-fun d!15480 () Bool)

(assert (=> d!15480 (= (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 thiss!1379))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1048 (buf!1400 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 thiss!1379)))))))

(assert (=> d!15008 d!15480))

(assert (=> d!14970 d!14972))

(declare-fun d!15482 () Bool)

(assert (=> d!15482 (isPrefixOf!0 thiss!1379 (_2!2398 lt!75689))))

(assert (=> d!15482 true))

(declare-fun _$15!159 () Unit!3414)

(assert (=> d!15482 (= (choose!30 thiss!1379 (_2!2398 lt!75692) (_2!2398 lt!75689)) _$15!159)))

(declare-fun bs!3918 () Bool)

(assert (= bs!3918 d!15482))

(assert (=> bs!3918 m!75819))

(assert (=> d!14970 d!15482))

(assert (=> d!14970 d!15068))

(declare-fun d!15484 () Bool)

(declare-fun e!32721 () Bool)

(assert (=> d!15484 e!32721))

(declare-fun res!41522 () Bool)

(assert (=> d!15484 (=> (not res!41522) (not e!32721))))

(declare-fun lt!77200 () (_ BitVec 64))

(declare-fun lt!77201 () (_ BitVec 64))

(declare-fun lt!77199 () (_ BitVec 64))

(assert (=> d!15484 (= res!41522 (= lt!77201 (bvsub lt!77199 lt!77200)))))

(assert (=> d!15484 (or (= (bvand lt!77199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77200 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77199 lt!77200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15484 (= lt!77200 (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_1!2410 lt!76569)))) ((_ sign_extend 32) (currentByte!2917 (_1!2410 lt!76569))) ((_ sign_extend 32) (currentBit!2912 (_1!2410 lt!76569)))))))

(declare-fun lt!77203 () (_ BitVec 64))

(declare-fun lt!77202 () (_ BitVec 64))

(assert (=> d!15484 (= lt!77199 (bvmul lt!77203 lt!77202))))

(assert (=> d!15484 (or (= lt!77203 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77202 (bvsdiv (bvmul lt!77203 lt!77202) lt!77203)))))

(assert (=> d!15484 (= lt!77202 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15484 (= lt!77203 ((_ sign_extend 32) (size!1048 (buf!1400 (_1!2410 lt!76569)))))))

(assert (=> d!15484 (= lt!77201 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_1!2410 lt!76569))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_1!2410 lt!76569)))))))

(assert (=> d!15484 (invariant!0 (currentBit!2912 (_1!2410 lt!76569)) (currentByte!2917 (_1!2410 lt!76569)) (size!1048 (buf!1400 (_1!2410 lt!76569))))))

(assert (=> d!15484 (= (bitIndex!0 (size!1048 (buf!1400 (_1!2410 lt!76569))) (currentByte!2917 (_1!2410 lt!76569)) (currentBit!2912 (_1!2410 lt!76569))) lt!77201)))

(declare-fun b!49573 () Bool)

(declare-fun res!41523 () Bool)

(assert (=> b!49573 (=> (not res!41523) (not e!32721))))

(assert (=> b!49573 (= res!41523 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77201))))

(declare-fun b!49574 () Bool)

(declare-fun lt!77198 () (_ BitVec 64))

(assert (=> b!49574 (= e!32721 (bvsle lt!77201 (bvmul lt!77198 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49574 (or (= lt!77198 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77198 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77198)))))

(assert (=> b!49574 (= lt!77198 ((_ sign_extend 32) (size!1048 (buf!1400 (_1!2410 lt!76569)))))))

(assert (= (and d!15484 res!41522) b!49573))

(assert (= (and b!49573 res!41523) b!49574))

(declare-fun m!77561 () Bool)

(assert (=> d!15484 m!77561))

(declare-fun m!77563 () Bool)

(assert (=> d!15484 m!77563))

(assert (=> b!49151 d!15484))

(declare-fun d!15486 () Bool)

(declare-fun e!32722 () Bool)

(assert (=> d!15486 e!32722))

(declare-fun res!41524 () Bool)

(assert (=> d!15486 (=> (not res!41524) (not e!32722))))

(declare-fun lt!77205 () (_ BitVec 64))

(declare-fun lt!77207 () (_ BitVec 64))

(declare-fun lt!77206 () (_ BitVec 64))

(assert (=> d!15486 (= res!41524 (= lt!77207 (bvsub lt!77205 lt!77206)))))

(assert (=> d!15486 (or (= (bvand lt!77205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77206 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77205 lt!77206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15486 (= lt!77206 (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76561)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76561))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76561)))))))

(declare-fun lt!77209 () (_ BitVec 64))

(declare-fun lt!77208 () (_ BitVec 64))

(assert (=> d!15486 (= lt!77205 (bvmul lt!77209 lt!77208))))

(assert (=> d!15486 (or (= lt!77209 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77208 (bvsdiv (bvmul lt!77209 lt!77208) lt!77209)))))

(assert (=> d!15486 (= lt!77208 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15486 (= lt!77209 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76561)))))))

(assert (=> d!15486 (= lt!77207 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76561))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76561)))))))

(assert (=> d!15486 (invariant!0 (currentBit!2912 (_2!2398 lt!76561)) (currentByte!2917 (_2!2398 lt!76561)) (size!1048 (buf!1400 (_2!2398 lt!76561))))))

(assert (=> d!15486 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76561))) (currentByte!2917 (_2!2398 lt!76561)) (currentBit!2912 (_2!2398 lt!76561))) lt!77207)))

(declare-fun b!49575 () Bool)

(declare-fun res!41525 () Bool)

(assert (=> b!49575 (=> (not res!41525) (not e!32722))))

(assert (=> b!49575 (= res!41525 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77207))))

(declare-fun b!49576 () Bool)

(declare-fun lt!77204 () (_ BitVec 64))

(assert (=> b!49576 (= e!32722 (bvsle lt!77207 (bvmul lt!77204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49576 (or (= lt!77204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77204)))))

(assert (=> b!49576 (= lt!77204 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76561)))))))

(assert (= (and d!15486 res!41524) b!49575))

(assert (= (and b!49575 res!41525) b!49576))

(declare-fun m!77565 () Bool)

(assert (=> d!15486 m!77565))

(declare-fun m!77567 () Bool)

(assert (=> d!15486 m!77567))

(assert (=> b!49151 d!15486))

(assert (=> d!15006 d!14998))

(declare-fun d!15488 () Bool)

(assert (=> d!15488 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!15488 true))

(declare-fun _$6!200 () Unit!3414)

(assert (=> d!15488 (= (choose!9 thiss!1379 (buf!1400 (_2!2398 lt!75692)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1817 (buf!1400 (_2!2398 lt!75692)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))) _$6!200)))

(declare-fun bs!3919 () Bool)

(assert (= bs!3919 d!15488))

(assert (=> bs!3919 m!75817))

(assert (=> d!15006 d!15488))

(declare-fun d!15490 () Bool)

(declare-fun res!41526 () Bool)

(declare-fun e!32723 () Bool)

(assert (=> d!15490 (=> (not res!41526) (not e!32723))))

(assert (=> d!15490 (= res!41526 (= (size!1048 (buf!1400 (_2!2397 lt!76491))) (size!1048 (buf!1400 (_2!2398 lt!75689)))))))

(assert (=> d!15490 (= (isPrefixOf!0 (_2!2397 lt!76491) (_2!2398 lt!75689)) e!32723)))

(declare-fun b!49577 () Bool)

(declare-fun res!41528 () Bool)

(assert (=> b!49577 (=> (not res!41528) (not e!32723))))

(assert (=> b!49577 (= res!41528 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76491))) (currentByte!2917 (_2!2397 lt!76491)) (currentBit!2912 (_2!2397 lt!76491))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689)))))))

(declare-fun b!49578 () Bool)

(declare-fun e!32724 () Bool)

(assert (=> b!49578 (= e!32723 e!32724)))

(declare-fun res!41527 () Bool)

(assert (=> b!49578 (=> res!41527 e!32724)))

(assert (=> b!49578 (= res!41527 (= (size!1048 (buf!1400 (_2!2397 lt!76491))) #b00000000000000000000000000000000))))

(declare-fun b!49579 () Bool)

(assert (=> b!49579 (= e!32724 (arrayBitRangesEq!0 (buf!1400 (_2!2397 lt!76491)) (buf!1400 (_2!2398 lt!75689)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76491))) (currentByte!2917 (_2!2397 lt!76491)) (currentBit!2912 (_2!2397 lt!76491)))))))

(assert (= (and d!15490 res!41526) b!49577))

(assert (= (and b!49577 res!41528) b!49578))

(assert (= (and b!49578 (not res!41527)) b!49579))

(declare-fun m!77569 () Bool)

(assert (=> b!49577 m!77569))

(assert (=> b!49577 m!75797))

(assert (=> b!49579 m!77569))

(assert (=> b!49579 m!77569))

(declare-fun m!77571 () Bool)

(assert (=> b!49579 m!77571))

(assert (=> b!49087 d!15490))

(declare-fun d!15492 () Bool)

(assert (=> d!15492 (= (length!244 lt!76571) (size!1051 lt!76571))))

(declare-fun bs!3920 () Bool)

(assert (= bs!3920 d!15492))

(declare-fun m!77573 () Bool)

(assert (=> bs!3920 m!77573))

(assert (=> b!49164 d!15492))

(assert (=> d!15032 d!15030))

(declare-fun d!15494 () Bool)

(assert (=> d!15494 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379)) (bvsub to!314 i!635))))

(assert (=> d!15494 true))

(declare-fun _$6!201 () Unit!3414)

(assert (=> d!15494 (= (choose!9 thiss!1379 (buf!1400 (_2!2398 lt!75689)) (bvsub to!314 i!635) (BitStream!1817 (buf!1400 (_2!2398 lt!75689)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))) _$6!201)))

(declare-fun bs!3921 () Bool)

(assert (= bs!3921 d!15494))

(assert (=> bs!3921 m!75869))

(assert (=> d!15032 d!15494))

(declare-fun d!15496 () Bool)

(declare-fun e!32725 () Bool)

(assert (=> d!15496 e!32725))

(declare-fun res!41529 () Bool)

(assert (=> d!15496 (=> (not res!41529) (not e!32725))))

(declare-fun lt!77211 () (_ BitVec 64))

(declare-fun lt!77210 () BitStream!1816)

(assert (=> d!15496 (= res!41529 (= (bvadd lt!77211 (bvsub lt!76486 lt!76502)) (bitIndex!0 (size!1048 (buf!1400 lt!77210)) (currentByte!2917 lt!77210) (currentBit!2912 lt!77210))))))

(assert (=> d!15496 (or (not (= (bvand lt!77211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76486 lt!76502) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77211 (bvsub lt!76486 lt!76502)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15496 (= lt!77211 (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76491))) (currentByte!2917 (_2!2397 lt!76491)) (currentBit!2912 (_2!2397 lt!76491))))))

(assert (=> d!15496 (= lt!77210 (_2!2398 (moveBitIndex!0 (_2!2397 lt!76491) (bvsub lt!76486 lt!76502))))))

(assert (=> d!15496 (moveBitIndexPrecond!0 (_2!2397 lt!76491) (bvsub lt!76486 lt!76502))))

(assert (=> d!15496 (= (withMovedBitIndex!0 (_2!2397 lt!76491) (bvsub lt!76486 lt!76502)) lt!77210)))

(declare-fun b!49580 () Bool)

(assert (=> b!49580 (= e!32725 (= (size!1048 (buf!1400 (_2!2397 lt!76491))) (size!1048 (buf!1400 lt!77210))))))

(assert (= (and d!15496 res!41529) b!49580))

(declare-fun m!77575 () Bool)

(assert (=> d!15496 m!77575))

(assert (=> d!15496 m!77569))

(declare-fun m!77577 () Bool)

(assert (=> d!15496 m!77577))

(declare-fun m!77579 () Bool)

(assert (=> d!15496 m!77579))

(assert (=> b!49085 d!15496))

(assert (=> b!49085 d!15066))

(assert (=> b!49085 d!15014))

(declare-fun d!15498 () Bool)

(declare-fun e!32726 () Bool)

(assert (=> d!15498 e!32726))

(declare-fun c!3534 () Bool)

(assert (=> d!15498 (= c!3534 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76573) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77212 () List!549)

(declare-fun e!32727 () tuple2!4618)

(assert (=> d!15498 (= lt!77212 (_1!2408 e!32727))))

(declare-fun c!3535 () Bool)

(assert (=> d!15498 (= c!3535 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76573) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15498 (bvsge (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76573) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15498 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!75692) (_2!2409 lt!76572) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76573)) lt!77212)))

(declare-fun b!49583 () Bool)

(assert (=> b!49583 (= e!32726 (isEmpty!144 lt!77212))))

(declare-fun b!49581 () Bool)

(assert (=> b!49581 (= e!32727 (tuple2!4619 Nil!546 (_2!2409 lt!76572)))))

(declare-fun b!49584 () Bool)

(assert (=> b!49584 (= e!32726 (> (length!244 lt!77212) 0))))

(declare-fun lt!77214 () (_ BitVec 64))

(declare-fun b!49582 () Bool)

(declare-fun lt!77213 () tuple2!4620)

(assert (=> b!49582 (= e!32727 (tuple2!4619 (Cons!545 (_1!2409 lt!77213) (bitStreamReadBitsIntoList!0 (_2!2398 lt!75692) (_2!2409 lt!77213) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!76573) lt!77214))) (_2!2409 lt!77213)))))

(assert (=> b!49582 (= lt!77213 (readBit!0 (_2!2409 lt!76572)))))

(assert (=> b!49582 (= lt!77214 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15498 c!3535) b!49581))

(assert (= (and d!15498 (not c!3535)) b!49582))

(assert (= (and d!15498 c!3534) b!49583))

(assert (= (and d!15498 (not c!3534)) b!49584))

(declare-fun m!77581 () Bool)

(assert (=> b!49583 m!77581))

(declare-fun m!77583 () Bool)

(assert (=> b!49584 m!77583))

(declare-fun m!77585 () Bool)

(assert (=> b!49582 m!77585))

(declare-fun m!77587 () Bool)

(assert (=> b!49582 m!77587))

(assert (=> b!49162 d!15498))

(declare-fun d!15500 () Bool)

(declare-fun e!32734 () Bool)

(assert (=> d!15500 e!32734))

(declare-fun res!41532 () Bool)

(assert (=> d!15500 (=> (not res!41532) (not e!32734))))

(declare-fun increaseBitIndex!0 (BitStream!1816) tuple2!4598)

(assert (=> d!15500 (= res!41532 (= (buf!1400 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75686)))) (buf!1400 (_1!2397 lt!75686))))))

(declare-fun lt!77232 () Bool)

(assert (=> d!15500 (= lt!77232 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75686))) (currentByte!2917 (_1!2397 lt!75686)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75686))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77231 () tuple2!4620)

(assert (=> d!15500 (= lt!77231 (tuple2!4621 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75686))) (currentByte!2917 (_1!2397 lt!75686)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75686))))) #b00000000000000000000000000000000)) (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75686)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!15500 (validate_offset_bit!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_1!2397 lt!75686)))) ((_ sign_extend 32) (currentByte!2917 (_1!2397 lt!75686))) ((_ sign_extend 32) (currentBit!2912 (_1!2397 lt!75686))))))

(assert (=> d!15500 (= (readBit!0 (_1!2397 lt!75686)) lt!77231)))

(declare-fun b!49587 () Bool)

(declare-fun lt!77233 () (_ BitVec 64))

(declare-fun lt!77229 () (_ BitVec 64))

(assert (=> b!49587 (= e!32734 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75686))))) (currentByte!2917 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75686)))) (currentBit!2912 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75686))))) (bvadd lt!77233 lt!77229)))))

(assert (=> b!49587 (or (not (= (bvand lt!77233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77229 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77233 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77233 lt!77229) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49587 (= lt!77229 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49587 (= lt!77233 (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!75686))) (currentByte!2917 (_1!2397 lt!75686)) (currentBit!2912 (_1!2397 lt!75686))))))

(declare-fun lt!77234 () Bool)

(assert (=> b!49587 (= lt!77234 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75686))) (currentByte!2917 (_1!2397 lt!75686)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75686))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77230 () Bool)

(assert (=> b!49587 (= lt!77230 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75686))) (currentByte!2917 (_1!2397 lt!75686)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75686))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77235 () Bool)

(assert (=> b!49587 (= lt!77235 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75686))) (currentByte!2917 (_1!2397 lt!75686)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75686))))) #b00000000000000000000000000000000)))))

(assert (= (and d!15500 res!41532) b!49587))

(declare-fun m!77589 () Bool)

(assert (=> d!15500 m!77589))

(declare-fun m!77591 () Bool)

(assert (=> d!15500 m!77591))

(declare-fun m!77593 () Bool)

(assert (=> d!15500 m!77593))

(declare-fun m!77595 () Bool)

(assert (=> d!15500 m!77595))

(assert (=> b!49587 m!77589))

(declare-fun m!77597 () Bool)

(assert (=> b!49587 m!77597))

(assert (=> b!49587 m!77591))

(declare-fun m!77599 () Bool)

(assert (=> b!49587 m!77599))

(assert (=> b!49587 m!77593))

(assert (=> b!49162 d!15500))

(assert (=> b!48899 d!14964))

(assert (=> b!48899 d!15066))

(declare-fun d!15502 () Bool)

(assert (=> d!15502 (= (invariant!0 (currentBit!2912 (_2!2398 lt!76202)) (currentByte!2917 (_2!2398 lt!76202)) (size!1048 (buf!1400 (_2!2398 lt!76202)))) (and (bvsge (currentBit!2912 (_2!2398 lt!76202)) #b00000000000000000000000000000000) (bvslt (currentBit!2912 (_2!2398 lt!76202)) #b00000000000000000000000000001000) (bvsge (currentByte!2917 (_2!2398 lt!76202)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2917 (_2!2398 lt!76202)) (size!1048 (buf!1400 (_2!2398 lt!76202)))) (and (= (currentBit!2912 (_2!2398 lt!76202)) #b00000000000000000000000000000000) (= (currentByte!2917 (_2!2398 lt!76202)) (size!1048 (buf!1400 (_2!2398 lt!76202))))))))))

(assert (=> b!48978 d!15502))

(declare-fun b!49588 () Bool)

(declare-fun e!32735 () Unit!3414)

(declare-fun Unit!3461 () Unit!3414)

(assert (=> b!49588 (= e!32735 Unit!3461)))

(declare-fun d!15504 () Bool)

(declare-fun e!32736 () Bool)

(assert (=> d!15504 e!32736))

(declare-fun res!41534 () Bool)

(assert (=> d!15504 (=> (not res!41534) (not e!32736))))

(declare-fun lt!77242 () tuple2!4596)

(assert (=> d!15504 (= res!41534 (isPrefixOf!0 (_1!2397 lt!77242) (_2!2397 lt!77242)))))

(declare-fun lt!77236 () BitStream!1816)

(assert (=> d!15504 (= lt!77242 (tuple2!4597 lt!77236 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))))))

(declare-fun lt!77254 () Unit!3414)

(declare-fun lt!77248 () Unit!3414)

(assert (=> d!15504 (= lt!77254 lt!77248)))

(assert (=> d!15504 (isPrefixOf!0 lt!77236 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692)))))

(assert (=> d!15504 (= lt!77248 (lemmaIsPrefixTransitive!0 lt!77236 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692)) (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))))))

(declare-fun lt!77246 () Unit!3414)

(declare-fun lt!77249 () Unit!3414)

(assert (=> d!15504 (= lt!77246 lt!77249)))

(assert (=> d!15504 (isPrefixOf!0 lt!77236 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692)))))

(assert (=> d!15504 (= lt!77249 (lemmaIsPrefixTransitive!0 lt!77236 (_2!2398 lt!75692) (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))))))

(declare-fun lt!77250 () Unit!3414)

(assert (=> d!15504 (= lt!77250 e!32735)))

(declare-fun c!3536 () Bool)

(assert (=> d!15504 (= c!3536 (not (= (size!1048 (buf!1400 (_2!2398 lt!75692))) #b00000000000000000000000000000000)))))

(declare-fun lt!77255 () Unit!3414)

(declare-fun lt!77245 () Unit!3414)

(assert (=> d!15504 (= lt!77255 lt!77245)))

(assert (=> d!15504 (isPrefixOf!0 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692)) (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692)))))

(assert (=> d!15504 (= lt!77245 (lemmaIsPrefixRefl!0 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))))))

(declare-fun lt!77240 () Unit!3414)

(declare-fun lt!77247 () Unit!3414)

(assert (=> d!15504 (= lt!77240 lt!77247)))

(assert (=> d!15504 (= lt!77247 (lemmaIsPrefixRefl!0 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))))))

(declare-fun lt!77251 () Unit!3414)

(declare-fun lt!77244 () Unit!3414)

(assert (=> d!15504 (= lt!77251 lt!77244)))

(assert (=> d!15504 (isPrefixOf!0 lt!77236 lt!77236)))

(assert (=> d!15504 (= lt!77244 (lemmaIsPrefixRefl!0 lt!77236))))

(declare-fun lt!77238 () Unit!3414)

(declare-fun lt!77239 () Unit!3414)

(assert (=> d!15504 (= lt!77238 lt!77239)))

(assert (=> d!15504 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!75692))))

(assert (=> d!15504 (= lt!77239 (lemmaIsPrefixRefl!0 (_2!2398 lt!75692)))))

(assert (=> d!15504 (= lt!77236 (BitStream!1817 (buf!1400 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(assert (=> d!15504 (isPrefixOf!0 (_2!2398 lt!75692) (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692)))))

(assert (=> d!15504 (= (reader!0 (_2!2398 lt!75692) (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))) lt!77242)))

(declare-fun b!49589 () Bool)

(declare-fun lt!77237 () (_ BitVec 64))

(declare-fun lt!77253 () (_ BitVec 64))

(assert (=> b!49589 (= e!32736 (= (_1!2397 lt!77242) (withMovedBitIndex!0 (_2!2397 lt!77242) (bvsub lt!77237 lt!77253))))))

(assert (=> b!49589 (or (= (bvand lt!77237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77253 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77237 lt!77253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49589 (= lt!77253 (bitIndex!0 (size!1048 (buf!1400 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692)))) (currentByte!2917 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))) (currentBit!2912 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692)))))))

(assert (=> b!49589 (= lt!77237 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(declare-fun b!49590 () Bool)

(declare-fun res!41535 () Bool)

(assert (=> b!49590 (=> (not res!41535) (not e!32736))))

(assert (=> b!49590 (= res!41535 (isPrefixOf!0 (_1!2397 lt!77242) (_2!2398 lt!75692)))))

(declare-fun b!49591 () Bool)

(declare-fun res!41533 () Bool)

(assert (=> b!49591 (=> (not res!41533) (not e!32736))))

(assert (=> b!49591 (= res!41533 (isPrefixOf!0 (_2!2397 lt!77242) (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))))))

(declare-fun b!49592 () Bool)

(declare-fun lt!77241 () Unit!3414)

(assert (=> b!49592 (= e!32735 lt!77241)))

(declare-fun lt!77252 () (_ BitVec 64))

(assert (=> b!49592 (= lt!77252 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77243 () (_ BitVec 64))

(assert (=> b!49592 (= lt!77243 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(assert (=> b!49592 (= lt!77241 (arrayBitRangesEqSymmetric!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))) lt!77252 lt!77243))))

(assert (=> b!49592 (arrayBitRangesEq!0 (buf!1400 (ite c!3432 (_2!2398 lt!76219) (_2!2398 lt!75692))) (buf!1400 (_2!2398 lt!75692)) lt!77252 lt!77243)))

(assert (= (and d!15504 c!3536) b!49592))

(assert (= (and d!15504 (not c!3536)) b!49588))

(assert (= (and d!15504 res!41534) b!49590))

(assert (= (and b!49590 res!41535) b!49591))

(assert (= (and b!49591 res!41533) b!49589))

(declare-fun m!77601 () Bool)

(assert (=> d!15504 m!77601))

(assert (=> d!15504 m!76241))

(declare-fun m!77603 () Bool)

(assert (=> d!15504 m!77603))

(declare-fun m!77605 () Bool)

(assert (=> d!15504 m!77605))

(assert (=> d!15504 m!76239))

(declare-fun m!77607 () Bool)

(assert (=> d!15504 m!77607))

(declare-fun m!77609 () Bool)

(assert (=> d!15504 m!77609))

(declare-fun m!77611 () Bool)

(assert (=> d!15504 m!77611))

(declare-fun m!77613 () Bool)

(assert (=> d!15504 m!77613))

(declare-fun m!77615 () Bool)

(assert (=> d!15504 m!77615))

(declare-fun m!77617 () Bool)

(assert (=> d!15504 m!77617))

(declare-fun m!77619 () Bool)

(assert (=> b!49591 m!77619))

(assert (=> b!49592 m!75847))

(declare-fun m!77621 () Bool)

(assert (=> b!49592 m!77621))

(declare-fun m!77623 () Bool)

(assert (=> b!49592 m!77623))

(declare-fun m!77625 () Bool)

(assert (=> b!49590 m!77625))

(declare-fun m!77627 () Bool)

(assert (=> b!49589 m!77627))

(declare-fun m!77629 () Bool)

(assert (=> b!49589 m!77629))

(assert (=> b!49589 m!75847))

(assert (=> bm!613 d!15504))

(assert (=> d!15000 d!15010))

(declare-fun d!15506 () Bool)

(assert (=> d!15506 (isPrefixOf!0 lt!76281 (_2!2398 lt!75692))))

(declare-fun lt!77256 () Unit!3414)

(assert (=> d!15506 (= lt!77256 (choose!30 lt!76281 (_2!2398 lt!75692) (_2!2398 lt!75692)))))

(assert (=> d!15506 (isPrefixOf!0 lt!76281 (_2!2398 lt!75692))))

(assert (=> d!15506 (= (lemmaIsPrefixTransitive!0 lt!76281 (_2!2398 lt!75692) (_2!2398 lt!75692)) lt!77256)))

(declare-fun bs!3922 () Bool)

(assert (= bs!3922 d!15506))

(assert (=> bs!3922 m!76335))

(declare-fun m!77631 () Bool)

(assert (=> bs!3922 m!77631))

(assert (=> bs!3922 m!76335))

(assert (=> d!15000 d!15506))

(declare-fun d!15508 () Bool)

(declare-fun res!41536 () Bool)

(declare-fun e!32737 () Bool)

(assert (=> d!15508 (=> (not res!41536) (not e!32737))))

(assert (=> d!15508 (= res!41536 (= (size!1048 (buf!1400 (_1!2397 lt!76287))) (size!1048 (buf!1400 (_2!2397 lt!76287)))))))

(assert (=> d!15508 (= (isPrefixOf!0 (_1!2397 lt!76287) (_2!2397 lt!76287)) e!32737)))

(declare-fun b!49593 () Bool)

(declare-fun res!41538 () Bool)

(assert (=> b!49593 (=> (not res!41538) (not e!32737))))

(assert (=> b!49593 (= res!41538 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76287))) (currentByte!2917 (_1!2397 lt!76287)) (currentBit!2912 (_1!2397 lt!76287))) (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76287))) (currentByte!2917 (_2!2397 lt!76287)) (currentBit!2912 (_2!2397 lt!76287)))))))

(declare-fun b!49594 () Bool)

(declare-fun e!32738 () Bool)

(assert (=> b!49594 (= e!32737 e!32738)))

(declare-fun res!41537 () Bool)

(assert (=> b!49594 (=> res!41537 e!32738)))

(assert (=> b!49594 (= res!41537 (= (size!1048 (buf!1400 (_1!2397 lt!76287))) #b00000000000000000000000000000000))))

(declare-fun b!49595 () Bool)

(assert (=> b!49595 (= e!32738 (arrayBitRangesEq!0 (buf!1400 (_1!2397 lt!76287)) (buf!1400 (_2!2397 lt!76287)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76287))) (currentByte!2917 (_1!2397 lt!76287)) (currentBit!2912 (_1!2397 lt!76287)))))))

(assert (= (and d!15508 res!41536) b!49593))

(assert (= (and b!49593 res!41538) b!49594))

(assert (= (and b!49594 (not res!41537)) b!49595))

(declare-fun m!77633 () Bool)

(assert (=> b!49593 m!77633))

(assert (=> b!49593 m!77543))

(assert (=> b!49595 m!77633))

(assert (=> b!49595 m!77633))

(declare-fun m!77635 () Bool)

(assert (=> b!49595 m!77635))

(assert (=> d!15000 d!15508))

(declare-fun d!15510 () Bool)

(assert (=> d!15510 (isPrefixOf!0 lt!76281 lt!76281)))

(declare-fun lt!77257 () Unit!3414)

(assert (=> d!15510 (= lt!77257 (choose!11 lt!76281))))

(assert (=> d!15510 (= (lemmaIsPrefixRefl!0 lt!76281) lt!77257)))

(declare-fun bs!3923 () Bool)

(assert (= bs!3923 d!15510))

(assert (=> bs!3923 m!76337))

(declare-fun m!77637 () Bool)

(assert (=> bs!3923 m!77637))

(assert (=> d!15000 d!15510))

(assert (=> d!15000 d!15068))

(assert (=> d!15000 d!15470))

(assert (=> d!15000 d!15472))

(declare-fun d!15512 () Bool)

(assert (=> d!15512 (isPrefixOf!0 lt!76281 (_2!2398 lt!75692))))

(declare-fun lt!77258 () Unit!3414)

(assert (=> d!15512 (= lt!77258 (choose!30 lt!76281 thiss!1379 (_2!2398 lt!75692)))))

(assert (=> d!15512 (isPrefixOf!0 lt!76281 thiss!1379)))

(assert (=> d!15512 (= (lemmaIsPrefixTransitive!0 lt!76281 thiss!1379 (_2!2398 lt!75692)) lt!77258)))

(declare-fun bs!3924 () Bool)

(assert (= bs!3924 d!15512))

(assert (=> bs!3924 m!76335))

(declare-fun m!77639 () Bool)

(assert (=> bs!3924 m!77639))

(declare-fun m!77641 () Bool)

(assert (=> bs!3924 m!77641))

(assert (=> d!15000 d!15512))

(declare-fun d!15514 () Bool)

(declare-fun res!41539 () Bool)

(declare-fun e!32739 () Bool)

(assert (=> d!15514 (=> (not res!41539) (not e!32739))))

(assert (=> d!15514 (= res!41539 (= (size!1048 (buf!1400 lt!76281)) (size!1048 (buf!1400 lt!76281))))))

(assert (=> d!15514 (= (isPrefixOf!0 lt!76281 lt!76281) e!32739)))

(declare-fun b!49596 () Bool)

(declare-fun res!41541 () Bool)

(assert (=> b!49596 (=> (not res!41541) (not e!32739))))

(assert (=> b!49596 (= res!41541 (bvsle (bitIndex!0 (size!1048 (buf!1400 lt!76281)) (currentByte!2917 lt!76281) (currentBit!2912 lt!76281)) (bitIndex!0 (size!1048 (buf!1400 lt!76281)) (currentByte!2917 lt!76281) (currentBit!2912 lt!76281))))))

(declare-fun b!49597 () Bool)

(declare-fun e!32740 () Bool)

(assert (=> b!49597 (= e!32739 e!32740)))

(declare-fun res!41540 () Bool)

(assert (=> b!49597 (=> res!41540 e!32740)))

(assert (=> b!49597 (= res!41540 (= (size!1048 (buf!1400 lt!76281)) #b00000000000000000000000000000000))))

(declare-fun b!49598 () Bool)

(assert (=> b!49598 (= e!32740 (arrayBitRangesEq!0 (buf!1400 lt!76281) (buf!1400 lt!76281) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 lt!76281)) (currentByte!2917 lt!76281) (currentBit!2912 lt!76281))))))

(assert (= (and d!15514 res!41539) b!49596))

(assert (= (and b!49596 res!41541) b!49597))

(assert (= (and b!49597 (not res!41540)) b!49598))

(declare-fun m!77643 () Bool)

(assert (=> b!49596 m!77643))

(assert (=> b!49596 m!77643))

(assert (=> b!49598 m!77643))

(assert (=> b!49598 m!77643))

(declare-fun m!77645 () Bool)

(assert (=> b!49598 m!77645))

(assert (=> d!15000 d!15514))

(assert (=> d!15000 d!15012))

(declare-fun d!15516 () Bool)

(declare-fun res!41542 () Bool)

(declare-fun e!32741 () Bool)

(assert (=> d!15516 (=> (not res!41542) (not e!32741))))

(assert (=> d!15516 (= res!41542 (= (size!1048 (buf!1400 lt!76281)) (size!1048 (buf!1400 (_2!2398 lt!75692)))))))

(assert (=> d!15516 (= (isPrefixOf!0 lt!76281 (_2!2398 lt!75692)) e!32741)))

(declare-fun b!49599 () Bool)

(declare-fun res!41544 () Bool)

(assert (=> b!49599 (=> (not res!41544) (not e!32741))))

(assert (=> b!49599 (= res!41544 (bvsle (bitIndex!0 (size!1048 (buf!1400 lt!76281)) (currentByte!2917 lt!76281) (currentBit!2912 lt!76281)) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(declare-fun b!49600 () Bool)

(declare-fun e!32742 () Bool)

(assert (=> b!49600 (= e!32741 e!32742)))

(declare-fun res!41543 () Bool)

(assert (=> b!49600 (=> res!41543 e!32742)))

(assert (=> b!49600 (= res!41543 (= (size!1048 (buf!1400 lt!76281)) #b00000000000000000000000000000000))))

(declare-fun b!49601 () Bool)

(assert (=> b!49601 (= e!32742 (arrayBitRangesEq!0 (buf!1400 lt!76281) (buf!1400 (_2!2398 lt!75692)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 lt!76281)) (currentByte!2917 lt!76281) (currentBit!2912 lt!76281))))))

(assert (= (and d!15516 res!41542) b!49599))

(assert (= (and b!49599 res!41544) b!49600))

(assert (= (and b!49600 (not res!41543)) b!49601))

(assert (=> b!49599 m!77643))

(assert (=> b!49599 m!75847))

(assert (=> b!49601 m!77643))

(assert (=> b!49601 m!77643))

(declare-fun m!77647 () Bool)

(assert (=> b!49601 m!77647))

(assert (=> d!15000 d!15516))

(declare-fun d!15518 () Bool)

(declare-fun e!32745 () Bool)

(assert (=> d!15518 e!32745))

(declare-fun res!41557 () Bool)

(assert (=> d!15518 (=> (not res!41557) (not e!32745))))

(declare-fun lt!77284 () tuple2!4612)

(assert (=> d!15518 (= res!41557 (= (buf!1400 (_2!2405 lt!77284)) (buf!1400 lt!76564)))))

(declare-datatypes ((tuple3!180 0))(
  ( (tuple3!181 (_1!2417 Unit!3414) (_2!2417 BitStream!1816) (_3!101 array!2311)) )
))
(declare-fun lt!77280 () tuple3!180)

(assert (=> d!15518 (= lt!77284 (tuple2!4613 (_3!101 lt!77280) (_2!2417 lt!77280)))))

(declare-fun readBitsLoop!0 (BitStream!1816 (_ BitVec 64) array!2311 (_ BitVec 64) (_ BitVec 64)) tuple3!180)

(assert (=> d!15518 (= lt!77280 (readBitsLoop!0 lt!76564 #b0000000000000000000000000000000000000000000000000000000000000001 (array!2312 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!15518 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!15518 (= (readBits!0 lt!76564 #b0000000000000000000000000000000000000000000000000000000000000001) lt!77284)))

(declare-fun b!49612 () Bool)

(assert (=> b!49612 (= e!32745 (= (byteArrayBitContentToList!0 (_2!2405 lt!77284) (_1!2405 lt!77284) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bitStreamReadBitsIntoList!0 (_2!2405 lt!77284) lt!76564 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!49613 () Bool)

(declare-fun res!41559 () Bool)

(assert (=> b!49613 (=> (not res!41559) (not e!32745))))

(assert (=> b!49613 (= res!41559 (bvsle (currentByte!2917 lt!76564) (currentByte!2917 (_2!2405 lt!77284))))))

(declare-fun b!49614 () Bool)

(declare-fun res!41558 () Bool)

(assert (=> b!49614 (=> (not res!41558) (not e!32745))))

(declare-fun lt!77279 () (_ BitVec 64))

(assert (=> b!49614 (= res!41558 (= (bvadd lt!77279 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!1048 (buf!1400 (_2!2405 lt!77284))) (currentByte!2917 (_2!2405 lt!77284)) (currentBit!2912 (_2!2405 lt!77284)))))))

(assert (=> b!49614 (or (not (= (bvand lt!77279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77279 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49614 (= lt!77279 (bitIndex!0 (size!1048 (buf!1400 lt!76564)) (currentByte!2917 lt!76564) (currentBit!2912 lt!76564)))))

(declare-fun b!49615 () Bool)

(declare-fun res!41555 () Bool)

(assert (=> b!49615 (=> (not res!41555) (not e!32745))))

(declare-fun lt!77278 () (_ BitVec 64))

(assert (=> b!49615 (= res!41555 (= (size!1048 (_1!2405 lt!77284)) ((_ extract 31 0) lt!77278)))))

(assert (=> b!49615 (and (bvslt lt!77278 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!77278 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!77285 () (_ BitVec 64))

(declare-fun lt!77283 () (_ BitVec 64))

(assert (=> b!49615 (= lt!77278 (bvsdiv lt!77285 lt!77283))))

(assert (=> b!49615 (and (not (= lt!77283 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!77285 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!77283 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!49615 (= lt!77283 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!77277 () (_ BitVec 64))

(declare-fun lt!77282 () (_ BitVec 64))

(assert (=> b!49615 (= lt!77285 (bvsub lt!77277 lt!77282))))

(assert (=> b!49615 (or (= (bvand lt!77277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77277 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77277 lt!77282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49615 (= lt!77282 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77281 () (_ BitVec 64))

(assert (=> b!49615 (= lt!77277 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!77281))))

(assert (=> b!49615 (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77281 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!77281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49615 (= lt!77281 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!49616 () Bool)

(declare-fun res!41556 () Bool)

(assert (=> b!49616 (=> (not res!41556) (not e!32745))))

(assert (=> b!49616 (= res!41556 (invariant!0 (currentBit!2912 (_2!2405 lt!77284)) (currentByte!2917 (_2!2405 lt!77284)) (size!1048 (buf!1400 (_2!2405 lt!77284)))))))

(assert (= (and d!15518 res!41557) b!49614))

(assert (= (and b!49614 res!41558) b!49616))

(assert (= (and b!49616 res!41556) b!49615))

(assert (= (and b!49615 res!41555) b!49613))

(assert (= (and b!49613 res!41559) b!49612))

(declare-fun m!77649 () Bool)

(assert (=> d!15518 m!77649))

(declare-fun m!77651 () Bool)

(assert (=> b!49612 m!77651))

(declare-fun m!77653 () Bool)

(assert (=> b!49612 m!77653))

(declare-fun m!77655 () Bool)

(assert (=> b!49614 m!77655))

(declare-fun m!77657 () Bool)

(assert (=> b!49614 m!77657))

(declare-fun m!77659 () Bool)

(assert (=> b!49616 m!77659))

(assert (=> b!49156 d!15518))

(declare-fun d!15520 () Bool)

(declare-fun lt!77288 () tuple2!4620)

(assert (=> d!15520 (= lt!77288 (readBit!0 lt!76564))))

(assert (=> d!15520 (= (readBitPure!0 lt!76564) (tuple2!4623 (_2!2409 lt!77288) (_1!2409 lt!77288)))))

(declare-fun bs!3925 () Bool)

(assert (= bs!3925 d!15520))

(declare-fun m!77661 () Bool)

(assert (=> bs!3925 m!77661))

(assert (=> b!49156 d!15520))

(declare-fun d!15522 () Bool)

(declare-fun e!32748 () Bool)

(assert (=> d!15522 e!32748))

(declare-fun res!41563 () Bool)

(assert (=> d!15522 (=> (not res!41563) (not e!32748))))

(assert (=> d!15522 (= res!41563 (invariant!0 (currentBit!2912 (_2!2398 lt!76560)) (currentByte!2917 (_2!2398 lt!76560)) (size!1048 (buf!1400 (_2!2398 lt!76560)))))))

(assert (=> d!15522 (= (readerFrom!0 (_2!2398 lt!76560) (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379)) (BitStream!1817 (buf!1400 (_2!2398 lt!76560)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)))))

(declare-fun b!49619 () Bool)

(assert (=> b!49619 (= e!32748 (invariant!0 (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379) (size!1048 (buf!1400 (_2!2398 lt!76560)))))))

(assert (= (and d!15522 res!41563) b!49619))

(declare-fun m!77663 () Bool)

(assert (=> d!15522 m!77663))

(declare-fun m!77665 () Bool)

(assert (=> b!49619 m!77665))

(assert (=> b!49156 d!15522))

(assert (=> b!49154 d!15486))

(assert (=> b!49154 d!15014))

(declare-fun b!49634 () Bool)

(declare-fun e!32763 () Bool)

(declare-fun e!32766 () Bool)

(assert (=> b!49634 (= e!32763 e!32766)))

(declare-fun c!3539 () Bool)

(declare-datatypes ((tuple4!22 0))(
  ( (tuple4!23 (_1!2418 (_ BitVec 32)) (_2!2418 (_ BitVec 32)) (_3!102 (_ BitVec 32)) (_4!11 (_ BitVec 32))) )
))
(declare-fun lt!77296 () tuple4!22)

(assert (=> b!49634 (= c!3539 (= (_3!102 lt!77296) (_4!11 lt!77296)))))

(declare-fun b!49635 () Bool)

(declare-fun e!32762 () Bool)

(assert (=> b!49635 (= e!32762 e!32763)))

(declare-fun res!41574 () Bool)

(assert (=> b!49635 (=> (not res!41574) (not e!32763))))

(declare-fun e!32764 () Bool)

(assert (=> b!49635 (= res!41574 e!32764)))

(declare-fun res!41575 () Bool)

(assert (=> b!49635 (=> res!41575 e!32764)))

(assert (=> b!49635 (= res!41575 (bvsge (_1!2418 lt!77296) (_2!2418 lt!77296)))))

(declare-fun lt!77295 () (_ BitVec 32))

(assert (=> b!49635 (= lt!77295 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!77297 () (_ BitVec 32))

(assert (=> b!49635 (= lt!77297 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!22)

(assert (=> b!49635 (= lt!77296 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(declare-fun b!49636 () Bool)

(declare-fun res!41576 () Bool)

(assert (=> b!49636 (= res!41576 (= lt!77295 #b00000000000000000000000000000000))))

(declare-fun e!32761 () Bool)

(assert (=> b!49636 (=> res!41576 e!32761)))

(declare-fun e!32765 () Bool)

(assert (=> b!49636 (= e!32765 e!32761)))

(declare-fun d!15524 () Bool)

(declare-fun res!41578 () Bool)

(assert (=> d!15524 (=> res!41578 e!32762)))

(assert (=> d!15524 (= res!41578 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(assert (=> d!15524 (= (arrayBitRangesEq!0 (buf!1400 thiss!1379) (buf!1400 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))) e!32762)))

(declare-fun bm!629 () Bool)

(declare-fun call!632 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!629 (= call!632 (byteRangesEq!0 (select (arr!1574 (buf!1400 thiss!1379)) (_3!102 lt!77296)) (select (arr!1574 (buf!1400 thiss!1379)) (_3!102 lt!77296)) lt!77297 (ite c!3539 lt!77295 #b00000000000000000000000000001000)))))

(declare-fun b!49637 () Bool)

(declare-fun arrayRangesEq!12 (array!2311 array!2311 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!49637 (= e!32764 (arrayRangesEq!12 (buf!1400 thiss!1379) (buf!1400 thiss!1379) (_1!2418 lt!77296) (_2!2418 lt!77296)))))

(declare-fun b!49638 () Bool)

(assert (=> b!49638 (= e!32766 e!32765)))

(declare-fun res!41577 () Bool)

(assert (=> b!49638 (= res!41577 call!632)))

(assert (=> b!49638 (=> (not res!41577) (not e!32765))))

(declare-fun b!49639 () Bool)

(assert (=> b!49639 (= e!32761 (byteRangesEq!0 (select (arr!1574 (buf!1400 thiss!1379)) (_4!11 lt!77296)) (select (arr!1574 (buf!1400 thiss!1379)) (_4!11 lt!77296)) #b00000000000000000000000000000000 lt!77295))))

(declare-fun b!49640 () Bool)

(assert (=> b!49640 (= e!32766 call!632)))

(assert (= (and d!15524 (not res!41578)) b!49635))

(assert (= (and b!49635 (not res!41575)) b!49637))

(assert (= (and b!49635 res!41574) b!49634))

(assert (= (and b!49634 c!3539) b!49640))

(assert (= (and b!49634 (not c!3539)) b!49638))

(assert (= (and b!49638 res!41577) b!49636))

(assert (= (and b!49636 (not res!41576)) b!49639))

(assert (= (or b!49640 b!49638) bm!629))

(assert (=> b!49635 m!75803))

(declare-fun m!77667 () Bool)

(assert (=> b!49635 m!77667))

(declare-fun m!77669 () Bool)

(assert (=> bm!629 m!77669))

(assert (=> bm!629 m!77669))

(assert (=> bm!629 m!77669))

(assert (=> bm!629 m!77669))

(declare-fun m!77671 () Bool)

(assert (=> bm!629 m!77671))

(declare-fun m!77673 () Bool)

(assert (=> b!49637 m!77673))

(declare-fun m!77675 () Bool)

(assert (=> b!49639 m!77675))

(assert (=> b!49639 m!77675))

(assert (=> b!49639 m!77675))

(assert (=> b!49639 m!77675))

(declare-fun m!77677 () Bool)

(assert (=> b!49639 m!77677))

(assert (=> b!49004 d!15524))

(assert (=> b!49004 d!15014))

(assert (=> b!49002 d!15014))

(declare-fun d!15526 () Bool)

(declare-fun res!41583 () Bool)

(declare-fun e!32771 () Bool)

(assert (=> d!15526 (=> res!41583 e!32771)))

(assert (=> d!15526 (= res!41583 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15526 (= (checkByteArrayBitContent!0 (_2!2398 lt!75692) srcBuffer!2 (_1!2405 (readBits!0 (_1!2397 call!616) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!32771)))

(declare-fun b!49645 () Bool)

(declare-fun e!32772 () Bool)

(assert (=> b!49645 (= e!32771 e!32772)))

(declare-fun res!41584 () Bool)

(assert (=> b!49645 (=> (not res!41584) (not e!32772))))

(assert (=> b!49645 (= res!41584 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (_1!2405 (readBits!0 (_1!2397 call!616) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!49646 () Bool)

(assert (=> b!49646 (= e!32772 (checkByteArrayBitContent!0 (_2!2398 lt!75692) srcBuffer!2 (_1!2405 (readBits!0 (_1!2397 call!616) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!15526 (not res!41583)) b!49645))

(assert (= (and b!49645 res!41584) b!49646))

(assert (=> b!49645 m!76273))

(declare-fun m!77679 () Bool)

(assert (=> b!49645 m!77679))

(declare-fun m!77681 () Bool)

(assert (=> b!49645 m!77681))

(declare-fun m!77683 () Bool)

(assert (=> b!49645 m!77683))

(declare-fun m!77685 () Bool)

(assert (=> b!49646 m!77685))

(assert (=> b!48975 d!15526))

(declare-fun d!15528 () Bool)

(declare-fun e!32773 () Bool)

(assert (=> d!15528 e!32773))

(declare-fun res!41587 () Bool)

(assert (=> d!15528 (=> (not res!41587) (not e!32773))))

(declare-fun lt!77305 () tuple2!4612)

(assert (=> d!15528 (= res!41587 (= (buf!1400 (_2!2405 lt!77305)) (buf!1400 (_1!2397 call!616))))))

(declare-fun lt!77301 () tuple3!180)

(assert (=> d!15528 (= lt!77305 (tuple2!4613 (_3!101 lt!77301) (_2!2417 lt!77301)))))

(assert (=> d!15528 (= lt!77301 (readBitsLoop!0 (_1!2397 call!616) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) (array!2312 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!15528 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bvsle (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!15528 (= (readBits!0 (_1!2397 call!616) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!77305)))

(declare-fun b!49647 () Bool)

(assert (=> b!49647 (= e!32773 (= (byteArrayBitContentToList!0 (_2!2405 lt!77305) (_1!2405 lt!77305) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitStreamReadBitsIntoList!0 (_2!2405 lt!77305) (_1!2397 call!616) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(declare-fun b!49648 () Bool)

(declare-fun res!41589 () Bool)

(assert (=> b!49648 (=> (not res!41589) (not e!32773))))

(assert (=> b!49648 (= res!41589 (bvsle (currentByte!2917 (_1!2397 call!616)) (currentByte!2917 (_2!2405 lt!77305))))))

(declare-fun b!49649 () Bool)

(declare-fun res!41588 () Bool)

(assert (=> b!49649 (=> (not res!41588) (not e!32773))))

(declare-fun lt!77300 () (_ BitVec 64))

(assert (=> b!49649 (= res!41588 (= (bvadd lt!77300 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitIndex!0 (size!1048 (buf!1400 (_2!2405 lt!77305))) (currentByte!2917 (_2!2405 lt!77305)) (currentBit!2912 (_2!2405 lt!77305)))))))

(assert (=> b!49649 (or (not (= (bvand lt!77300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77300 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49649 (= lt!77300 (bitIndex!0 (size!1048 (buf!1400 (_1!2397 call!616))) (currentByte!2917 (_1!2397 call!616)) (currentBit!2912 (_1!2397 call!616))))))

(declare-fun b!49650 () Bool)

(declare-fun res!41585 () Bool)

(assert (=> b!49650 (=> (not res!41585) (not e!32773))))

(declare-fun lt!77299 () (_ BitVec 64))

(assert (=> b!49650 (= res!41585 (= (size!1048 (_1!2405 lt!77305)) ((_ extract 31 0) lt!77299)))))

(assert (=> b!49650 (and (bvslt lt!77299 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!77299 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!77306 () (_ BitVec 64))

(declare-fun lt!77304 () (_ BitVec 64))

(assert (=> b!49650 (= lt!77299 (bvsdiv lt!77306 lt!77304))))

(assert (=> b!49650 (and (not (= lt!77304 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!77306 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!77304 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!49650 (= lt!77304 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!77298 () (_ BitVec 64))

(declare-fun lt!77303 () (_ BitVec 64))

(assert (=> b!49650 (= lt!77306 (bvsub lt!77298 lt!77303))))

(assert (=> b!49650 (or (= (bvand lt!77298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77298 lt!77303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49650 (= lt!77303 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77302 () (_ BitVec 64))

(assert (=> b!49650 (= lt!77298 (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!77302))))

(assert (=> b!49650 (or (not (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77302 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!77302) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49650 (= lt!77302 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!49651 () Bool)

(declare-fun res!41586 () Bool)

(assert (=> b!49651 (=> (not res!41586) (not e!32773))))

(assert (=> b!49651 (= res!41586 (invariant!0 (currentBit!2912 (_2!2405 lt!77305)) (currentByte!2917 (_2!2405 lt!77305)) (size!1048 (buf!1400 (_2!2405 lt!77305)))))))

(assert (= (and d!15528 res!41587) b!49649))

(assert (= (and b!49649 res!41588) b!49651))

(assert (= (and b!49651 res!41586) b!49650))

(assert (= (and b!49650 res!41585) b!49648))

(assert (= (and b!49648 res!41589) b!49647))

(declare-fun m!77687 () Bool)

(assert (=> d!15528 m!77687))

(declare-fun m!77689 () Bool)

(assert (=> b!49647 m!77689))

(declare-fun m!77691 () Bool)

(assert (=> b!49647 m!77691))

(declare-fun m!77693 () Bool)

(assert (=> b!49649 m!77693))

(declare-fun m!77695 () Bool)

(assert (=> b!49649 m!77695))

(declare-fun m!77697 () Bool)

(assert (=> b!49651 m!77697))

(assert (=> b!48975 d!15528))

(declare-fun b!49652 () Bool)

(declare-fun e!32776 () Bool)

(declare-fun e!32779 () Bool)

(assert (=> b!49652 (= e!32776 e!32779)))

(declare-fun c!3540 () Bool)

(declare-fun lt!77308 () tuple4!22)

(assert (=> b!49652 (= c!3540 (= (_3!102 lt!77308) (_4!11 lt!77308)))))

(declare-fun b!49653 () Bool)

(declare-fun e!32775 () Bool)

(assert (=> b!49653 (= e!32775 e!32776)))

(declare-fun res!41590 () Bool)

(assert (=> b!49653 (=> (not res!41590) (not e!32776))))

(declare-fun e!32777 () Bool)

(assert (=> b!49653 (= res!41590 e!32777)))

(declare-fun res!41591 () Bool)

(assert (=> b!49653 (=> res!41591 e!32777)))

(assert (=> b!49653 (= res!41591 (bvsge (_1!2418 lt!77308) (_2!2418 lt!77308)))))

(declare-fun lt!77307 () (_ BitVec 32))

(assert (=> b!49653 (= lt!77307 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!77309 () (_ BitVec 32))

(assert (=> b!49653 (= lt!77309 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49653 (= lt!77308 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(declare-fun b!49654 () Bool)

(declare-fun res!41592 () Bool)

(assert (=> b!49654 (= res!41592 (= lt!77307 #b00000000000000000000000000000000))))

(declare-fun e!32774 () Bool)

(assert (=> b!49654 (=> res!41592 e!32774)))

(declare-fun e!32778 () Bool)

(assert (=> b!49654 (= e!32778 e!32774)))

(declare-fun d!15530 () Bool)

(declare-fun res!41594 () Bool)

(assert (=> d!15530 (=> res!41594 e!32775)))

(assert (=> d!15530 (= res!41594 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(assert (=> d!15530 (= (arrayBitRangesEq!0 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75692)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))) e!32775)))

(declare-fun call!633 () Bool)

(declare-fun bm!630 () Bool)

(assert (=> bm!630 (= call!633 (byteRangesEq!0 (select (arr!1574 (buf!1400 thiss!1379)) (_3!102 lt!77308)) (select (arr!1574 (buf!1400 (_2!2398 lt!75692))) (_3!102 lt!77308)) lt!77309 (ite c!3540 lt!77307 #b00000000000000000000000000001000)))))

(declare-fun b!49655 () Bool)

(assert (=> b!49655 (= e!32777 (arrayRangesEq!12 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75692)) (_1!2418 lt!77308) (_2!2418 lt!77308)))))

(declare-fun b!49656 () Bool)

(assert (=> b!49656 (= e!32779 e!32778)))

(declare-fun res!41593 () Bool)

(assert (=> b!49656 (= res!41593 call!633)))

(assert (=> b!49656 (=> (not res!41593) (not e!32778))))

(declare-fun b!49657 () Bool)

(assert (=> b!49657 (= e!32774 (byteRangesEq!0 (select (arr!1574 (buf!1400 thiss!1379)) (_4!11 lt!77308)) (select (arr!1574 (buf!1400 (_2!2398 lt!75692))) (_4!11 lt!77308)) #b00000000000000000000000000000000 lt!77307))))

(declare-fun b!49658 () Bool)

(assert (=> b!49658 (= e!32779 call!633)))

(assert (= (and d!15530 (not res!41594)) b!49653))

(assert (= (and b!49653 (not res!41591)) b!49655))

(assert (= (and b!49653 res!41590) b!49652))

(assert (= (and b!49652 c!3540) b!49658))

(assert (= (and b!49652 (not c!3540)) b!49656))

(assert (= (and b!49656 res!41593) b!49654))

(assert (= (and b!49654 (not res!41592)) b!49657))

(assert (= (or b!49658 b!49656) bm!630))

(assert (=> b!49653 m!75803))

(assert (=> b!49653 m!77667))

(declare-fun m!77699 () Bool)

(assert (=> bm!630 m!77699))

(declare-fun m!77701 () Bool)

(assert (=> bm!630 m!77701))

(assert (=> bm!630 m!77699))

(assert (=> bm!630 m!77701))

(declare-fun m!77703 () Bool)

(assert (=> bm!630 m!77703))

(declare-fun m!77705 () Bool)

(assert (=> b!49655 m!77705))

(declare-fun m!77707 () Bool)

(assert (=> b!49657 m!77707))

(declare-fun m!77709 () Bool)

(assert (=> b!49657 m!77709))

(assert (=> b!49657 m!77707))

(assert (=> b!49657 m!77709))

(declare-fun m!77711 () Bool)

(assert (=> b!49657 m!77711))

(assert (=> b!49093 d!15530))

(assert (=> b!49093 d!15014))

(declare-fun b!49659 () Bool)

(declare-fun e!32782 () Bool)

(declare-fun e!32785 () Bool)

(assert (=> b!49659 (= e!32782 e!32785)))

(declare-fun c!3541 () Bool)

(declare-fun lt!77311 () tuple4!22)

(assert (=> b!49659 (= c!3541 (= (_3!102 lt!77311) (_4!11 lt!77311)))))

(declare-fun b!49660 () Bool)

(declare-fun e!32781 () Bool)

(assert (=> b!49660 (= e!32781 e!32782)))

(declare-fun res!41595 () Bool)

(assert (=> b!49660 (=> (not res!41595) (not e!32782))))

(declare-fun e!32783 () Bool)

(assert (=> b!49660 (= res!41595 e!32783)))

(declare-fun res!41596 () Bool)

(assert (=> b!49660 (=> res!41596 e!32783)))

(assert (=> b!49660 (= res!41596 (bvsge (_1!2418 lt!77311) (_2!2418 lt!77311)))))

(declare-fun lt!77310 () (_ BitVec 32))

(assert (=> b!49660 (= lt!77310 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!77312 () (_ BitVec 32))

(assert (=> b!49660 (= lt!77312 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49660 (= lt!77311 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(declare-fun b!49661 () Bool)

(declare-fun res!41597 () Bool)

(assert (=> b!49661 (= res!41597 (= lt!77310 #b00000000000000000000000000000000))))

(declare-fun e!32780 () Bool)

(assert (=> b!49661 (=> res!41597 e!32780)))

(declare-fun e!32784 () Bool)

(assert (=> b!49661 (= e!32784 e!32780)))

(declare-fun d!15532 () Bool)

(declare-fun res!41599 () Bool)

(assert (=> d!15532 (=> res!41599 e!32781)))

(assert (=> d!15532 (= res!41599 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(assert (=> d!15532 (= (arrayBitRangesEq!0 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75689)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))) e!32781)))

(declare-fun bm!631 () Bool)

(declare-fun call!634 () Bool)

(assert (=> bm!631 (= call!634 (byteRangesEq!0 (select (arr!1574 (buf!1400 thiss!1379)) (_3!102 lt!77311)) (select (arr!1574 (buf!1400 (_2!2398 lt!75689))) (_3!102 lt!77311)) lt!77312 (ite c!3541 lt!77310 #b00000000000000000000000000001000)))))

(declare-fun b!49662 () Bool)

(assert (=> b!49662 (= e!32783 (arrayRangesEq!12 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75689)) (_1!2418 lt!77311) (_2!2418 lt!77311)))))

(declare-fun b!49663 () Bool)

(assert (=> b!49663 (= e!32785 e!32784)))

(declare-fun res!41598 () Bool)

(assert (=> b!49663 (= res!41598 call!634)))

(assert (=> b!49663 (=> (not res!41598) (not e!32784))))

(declare-fun b!49664 () Bool)

(assert (=> b!49664 (= e!32780 (byteRangesEq!0 (select (arr!1574 (buf!1400 thiss!1379)) (_4!11 lt!77311)) (select (arr!1574 (buf!1400 (_2!2398 lt!75689))) (_4!11 lt!77311)) #b00000000000000000000000000000000 lt!77310))))

(declare-fun b!49665 () Bool)

(assert (=> b!49665 (= e!32785 call!634)))

(assert (= (and d!15532 (not res!41599)) b!49660))

(assert (= (and b!49660 (not res!41596)) b!49662))

(assert (= (and b!49660 res!41595) b!49659))

(assert (= (and b!49659 c!3541) b!49665))

(assert (= (and b!49659 (not c!3541)) b!49663))

(assert (= (and b!49663 res!41598) b!49661))

(assert (= (and b!49661 (not res!41597)) b!49664))

(assert (= (or b!49665 b!49663) bm!631))

(assert (=> b!49660 m!75803))

(assert (=> b!49660 m!77667))

(declare-fun m!77713 () Bool)

(assert (=> bm!631 m!77713))

(declare-fun m!77715 () Bool)

(assert (=> bm!631 m!77715))

(assert (=> bm!631 m!77713))

(assert (=> bm!631 m!77715))

(declare-fun m!77717 () Bool)

(assert (=> bm!631 m!77717))

(declare-fun m!77719 () Bool)

(assert (=> b!49662 m!77719))

(declare-fun m!77721 () Bool)

(assert (=> b!49664 m!77721))

(declare-fun m!77723 () Bool)

(assert (=> b!49664 m!77723))

(assert (=> b!49664 m!77721))

(assert (=> b!49664 m!77723))

(declare-fun m!77725 () Bool)

(assert (=> b!49664 m!77725))

(assert (=> b!48904 d!15532))

(assert (=> b!48904 d!15014))

(declare-fun d!15534 () Bool)

(assert (=> d!15534 (= (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692)))) (bvsub (bvmul ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))))))))

(assert (=> d!15052 d!15534))

(declare-fun d!15536 () Bool)

(declare-fun c!3542 () Bool)

(assert (=> d!15536 (= c!3542 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32786 () List!549)

(assert (=> d!15536 (= (byteArrayBitContentToList!0 (_2!2398 lt!75689) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) e!32786)))

(declare-fun b!49666 () Bool)

(assert (=> b!49666 (= e!32786 Nil!546)))

(declare-fun b!49667 () Bool)

(assert (=> b!49667 (= e!32786 (Cons!545 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2398 lt!75689) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15536 c!3542) b!49666))

(assert (= (and d!15536 (not c!3542)) b!49667))

(declare-fun m!77727 () Bool)

(assert (=> b!49667 m!77727))

(declare-fun m!77729 () Bool)

(assert (=> b!49667 m!77729))

(declare-fun m!77731 () Bool)

(assert (=> b!49667 m!77731))

(assert (=> b!49029 d!15536))

(assert (=> b!48902 d!15014))

(assert (=> b!48902 d!15066))

(declare-fun d!15538 () Bool)

(assert (=> d!15538 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!76196) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692)))) lt!76196))))

(declare-fun bs!3926 () Bool)

(assert (= bs!3926 d!15538))

(assert (=> bs!3926 m!76091))

(assert (=> b!48980 d!15538))

(declare-fun b!49668 () Bool)

(declare-fun e!32789 () Bool)

(declare-fun e!32792 () Bool)

(assert (=> b!49668 (= e!32789 e!32792)))

(declare-fun c!3543 () Bool)

(declare-fun lt!77314 () tuple4!22)

(assert (=> b!49668 (= c!3543 (= (_3!102 lt!77314) (_4!11 lt!77314)))))

(declare-fun b!49669 () Bool)

(declare-fun e!32788 () Bool)

(assert (=> b!49669 (= e!32788 e!32789)))

(declare-fun res!41600 () Bool)

(assert (=> b!49669 (=> (not res!41600) (not e!32789))))

(declare-fun e!32790 () Bool)

(assert (=> b!49669 (= res!41600 e!32790)))

(declare-fun res!41601 () Bool)

(assert (=> b!49669 (=> res!41601 e!32790)))

(assert (=> b!49669 (= res!41601 (bvsge (_1!2418 lt!77314) (_2!2418 lt!77314)))))

(declare-fun lt!77313 () (_ BitVec 32))

(assert (=> b!49669 (= lt!77313 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!77315 () (_ BitVec 32))

(assert (=> b!49669 (= lt!77315 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49669 (= lt!77314 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(declare-fun b!49670 () Bool)

(declare-fun res!41602 () Bool)

(assert (=> b!49670 (= res!41602 (= lt!77313 #b00000000000000000000000000000000))))

(declare-fun e!32787 () Bool)

(assert (=> b!49670 (=> res!41602 e!32787)))

(declare-fun e!32791 () Bool)

(assert (=> b!49670 (= e!32791 e!32787)))

(declare-fun d!15540 () Bool)

(declare-fun res!41604 () Bool)

(assert (=> d!15540 (=> res!41604 e!32788)))

(assert (=> d!15540 (= res!41604 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(assert (=> d!15540 (= (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (_2!2398 lt!75689)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))) e!32788)))

(declare-fun bm!632 () Bool)

(declare-fun call!635 () Bool)

(assert (=> bm!632 (= call!635 (byteRangesEq!0 (select (arr!1574 (buf!1400 (_2!2398 lt!75692))) (_3!102 lt!77314)) (select (arr!1574 (buf!1400 (_2!2398 lt!75689))) (_3!102 lt!77314)) lt!77315 (ite c!3543 lt!77313 #b00000000000000000000000000001000)))))

(declare-fun b!49671 () Bool)

(assert (=> b!49671 (= e!32790 (arrayRangesEq!12 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (_2!2398 lt!75689)) (_1!2418 lt!77314) (_2!2418 lt!77314)))))

(declare-fun b!49672 () Bool)

(assert (=> b!49672 (= e!32792 e!32791)))

(declare-fun res!41603 () Bool)

(assert (=> b!49672 (= res!41603 call!635)))

(assert (=> b!49672 (=> (not res!41603) (not e!32791))))

(declare-fun b!49673 () Bool)

(assert (=> b!49673 (= e!32787 (byteRangesEq!0 (select (arr!1574 (buf!1400 (_2!2398 lt!75692))) (_4!11 lt!77314)) (select (arr!1574 (buf!1400 (_2!2398 lt!75689))) (_4!11 lt!77314)) #b00000000000000000000000000000000 lt!77313))))

(declare-fun b!49674 () Bool)

(assert (=> b!49674 (= e!32792 call!635)))

(assert (= (and d!15540 (not res!41604)) b!49669))

(assert (= (and b!49669 (not res!41601)) b!49671))

(assert (= (and b!49669 res!41600) b!49668))

(assert (= (and b!49668 c!3543) b!49674))

(assert (= (and b!49668 (not c!3543)) b!49672))

(assert (= (and b!49672 res!41603) b!49670))

(assert (= (and b!49670 (not res!41602)) b!49673))

(assert (= (or b!49674 b!49672) bm!632))

(assert (=> b!49669 m!75847))

(declare-fun m!77733 () Bool)

(assert (=> b!49669 m!77733))

(declare-fun m!77735 () Bool)

(assert (=> bm!632 m!77735))

(declare-fun m!77737 () Bool)

(assert (=> bm!632 m!77737))

(assert (=> bm!632 m!77735))

(assert (=> bm!632 m!77737))

(declare-fun m!77739 () Bool)

(assert (=> bm!632 m!77739))

(declare-fun m!77741 () Bool)

(assert (=> b!49671 m!77741))

(declare-fun m!77743 () Bool)

(assert (=> b!49673 m!77743))

(declare-fun m!77745 () Bool)

(assert (=> b!49673 m!77745))

(assert (=> b!49673 m!77743))

(assert (=> b!49673 m!77745))

(declare-fun m!77747 () Bool)

(assert (=> b!49673 m!77747))

(assert (=> b!48901 d!15540))

(assert (=> b!48901 d!14964))

(assert (=> b!49091 d!15014))

(assert (=> b!49091 d!14964))

(declare-fun d!15542 () Bool)

(assert (=> d!15542 (= (length!244 lt!76480) (size!1051 lt!76480))))

(declare-fun bs!3927 () Bool)

(assert (= bs!3927 d!15542))

(declare-fun m!77749 () Bool)

(assert (=> bs!3927 m!77749))

(assert (=> b!49083 d!15542))

(declare-fun d!15544 () Bool)

(assert (=> d!15544 (= (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75689))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75689)))) (bvsub (bvmul ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75689))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75689))))))))

(assert (=> d!15066 d!15544))

(assert (=> d!15066 d!15128))

(assert (=> b!49034 d!14964))

(declare-fun d!15546 () Bool)

(assert (=> d!15546 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75689)) (buf!1400 (_2!2398 lt!75692)) lt!76353 lt!76344)))

(declare-fun lt!77318 () Unit!3414)

(declare-fun choose!8 (array!2311 array!2311 (_ BitVec 64) (_ BitVec 64)) Unit!3414)

(assert (=> d!15546 (= lt!77318 (choose!8 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (_2!2398 lt!75689)) lt!76353 lt!76344))))

(assert (=> d!15546 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76353) (bvsle lt!76353 lt!76344))))

(assert (=> d!15546 (= (arrayBitRangesEqSymmetric!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (_2!2398 lt!75689)) lt!76353 lt!76344) lt!77318)))

(declare-fun bs!3928 () Bool)

(assert (= bs!3928 d!15546))

(assert (=> bs!3928 m!76383))

(declare-fun m!77751 () Bool)

(assert (=> bs!3928 m!77751))

(assert (=> b!49034 d!15546))

(declare-fun b!49675 () Bool)

(declare-fun e!32795 () Bool)

(declare-fun e!32798 () Bool)

(assert (=> b!49675 (= e!32795 e!32798)))

(declare-fun c!3544 () Bool)

(declare-fun lt!77320 () tuple4!22)

(assert (=> b!49675 (= c!3544 (= (_3!102 lt!77320) (_4!11 lt!77320)))))

(declare-fun b!49676 () Bool)

(declare-fun e!32794 () Bool)

(assert (=> b!49676 (= e!32794 e!32795)))

(declare-fun res!41605 () Bool)

(assert (=> b!49676 (=> (not res!41605) (not e!32795))))

(declare-fun e!32796 () Bool)

(assert (=> b!49676 (= res!41605 e!32796)))

(declare-fun res!41606 () Bool)

(assert (=> b!49676 (=> res!41606 e!32796)))

(assert (=> b!49676 (= res!41606 (bvsge (_1!2418 lt!77320) (_2!2418 lt!77320)))))

(declare-fun lt!77319 () (_ BitVec 32))

(assert (=> b!49676 (= lt!77319 ((_ extract 31 0) (bvsrem lt!76344 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!77321 () (_ BitVec 32))

(assert (=> b!49676 (= lt!77321 ((_ extract 31 0) (bvsrem lt!76353 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49676 (= lt!77320 (arrayBitIndices!0 lt!76353 lt!76344))))

(declare-fun b!49677 () Bool)

(declare-fun res!41607 () Bool)

(assert (=> b!49677 (= res!41607 (= lt!77319 #b00000000000000000000000000000000))))

(declare-fun e!32793 () Bool)

(assert (=> b!49677 (=> res!41607 e!32793)))

(declare-fun e!32797 () Bool)

(assert (=> b!49677 (= e!32797 e!32793)))

(declare-fun d!15548 () Bool)

(declare-fun res!41609 () Bool)

(assert (=> d!15548 (=> res!41609 e!32794)))

(assert (=> d!15548 (= res!41609 (bvsge lt!76353 lt!76344))))

(assert (=> d!15548 (= (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75689)) (buf!1400 (_2!2398 lt!75692)) lt!76353 lt!76344) e!32794)))

(declare-fun call!636 () Bool)

(declare-fun bm!633 () Bool)

(assert (=> bm!633 (= call!636 (byteRangesEq!0 (select (arr!1574 (buf!1400 (_2!2398 lt!75689))) (_3!102 lt!77320)) (select (arr!1574 (buf!1400 (_2!2398 lt!75692))) (_3!102 lt!77320)) lt!77321 (ite c!3544 lt!77319 #b00000000000000000000000000001000)))))

(declare-fun b!49678 () Bool)

(assert (=> b!49678 (= e!32796 (arrayRangesEq!12 (buf!1400 (_2!2398 lt!75689)) (buf!1400 (_2!2398 lt!75692)) (_1!2418 lt!77320) (_2!2418 lt!77320)))))

(declare-fun b!49679 () Bool)

(assert (=> b!49679 (= e!32798 e!32797)))

(declare-fun res!41608 () Bool)

(assert (=> b!49679 (= res!41608 call!636)))

(assert (=> b!49679 (=> (not res!41608) (not e!32797))))

(declare-fun b!49680 () Bool)

(assert (=> b!49680 (= e!32793 (byteRangesEq!0 (select (arr!1574 (buf!1400 (_2!2398 lt!75689))) (_4!11 lt!77320)) (select (arr!1574 (buf!1400 (_2!2398 lt!75692))) (_4!11 lt!77320)) #b00000000000000000000000000000000 lt!77319))))

(declare-fun b!49681 () Bool)

(assert (=> b!49681 (= e!32798 call!636)))

(assert (= (and d!15548 (not res!41609)) b!49676))

(assert (= (and b!49676 (not res!41606)) b!49678))

(assert (= (and b!49676 res!41605) b!49675))

(assert (= (and b!49675 c!3544) b!49681))

(assert (= (and b!49675 (not c!3544)) b!49679))

(assert (= (and b!49679 res!41608) b!49677))

(assert (= (and b!49677 (not res!41607)) b!49680))

(assert (= (or b!49681 b!49679) bm!633))

(declare-fun m!77753 () Bool)

(assert (=> b!49676 m!77753))

(declare-fun m!77755 () Bool)

(assert (=> bm!633 m!77755))

(declare-fun m!77757 () Bool)

(assert (=> bm!633 m!77757))

(assert (=> bm!633 m!77755))

(assert (=> bm!633 m!77757))

(declare-fun m!77759 () Bool)

(assert (=> bm!633 m!77759))

(declare-fun m!77761 () Bool)

(assert (=> b!49678 m!77761))

(declare-fun m!77763 () Bool)

(assert (=> b!49680 m!77763))

(declare-fun m!77765 () Bool)

(assert (=> b!49680 m!77765))

(assert (=> b!49680 m!77763))

(assert (=> b!49680 m!77765))

(declare-fun m!77767 () Bool)

(assert (=> b!49680 m!77767))

(assert (=> b!49034 d!15548))

(declare-fun d!15550 () Bool)

(declare-fun e!32799 () Bool)

(assert (=> d!15550 e!32799))

(declare-fun c!3545 () Bool)

(assert (=> d!15550 (= c!3545 (= (bvsub (bvsub to!314 i!635) lt!76482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77322 () List!549)

(declare-fun e!32800 () tuple2!4618)

(assert (=> d!15550 (= lt!77322 (_1!2408 e!32800))))

(declare-fun c!3546 () Bool)

(assert (=> d!15550 (= c!3546 (= (bvsub (bvsub to!314 i!635) lt!76482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15550 (bvsge (bvsub (bvsub to!314 i!635) lt!76482) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15550 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_2!2409 lt!76481) (bvsub (bvsub to!314 i!635) lt!76482)) lt!77322)))

(declare-fun b!49684 () Bool)

(assert (=> b!49684 (= e!32799 (isEmpty!144 lt!77322))))

(declare-fun b!49682 () Bool)

(assert (=> b!49682 (= e!32800 (tuple2!4619 Nil!546 (_2!2409 lt!76481)))))

(declare-fun b!49685 () Bool)

(assert (=> b!49685 (= e!32799 (> (length!244 lt!77322) 0))))

(declare-fun lt!77324 () (_ BitVec 64))

(declare-fun b!49683 () Bool)

(declare-fun lt!77323 () tuple2!4620)

(assert (=> b!49683 (= e!32800 (tuple2!4619 (Cons!545 (_1!2409 lt!77323) (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_2!2409 lt!77323) (bvsub (bvsub (bvsub to!314 i!635) lt!76482) lt!77324))) (_2!2409 lt!77323)))))

(assert (=> b!49683 (= lt!77323 (readBit!0 (_2!2409 lt!76481)))))

(assert (=> b!49683 (= lt!77324 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15550 c!3546) b!49682))

(assert (= (and d!15550 (not c!3546)) b!49683))

(assert (= (and d!15550 c!3545) b!49684))

(assert (= (and d!15550 (not c!3545)) b!49685))

(declare-fun m!77769 () Bool)

(assert (=> b!49684 m!77769))

(declare-fun m!77771 () Bool)

(assert (=> b!49685 m!77771))

(declare-fun m!77773 () Bool)

(assert (=> b!49683 m!77773))

(declare-fun m!77775 () Bool)

(assert (=> b!49683 m!77775))

(assert (=> b!49081 d!15550))

(declare-fun d!15552 () Bool)

(declare-fun e!32801 () Bool)

(assert (=> d!15552 e!32801))

(declare-fun res!41610 () Bool)

(assert (=> d!15552 (=> (not res!41610) (not e!32801))))

(assert (=> d!15552 (= res!41610 (= (buf!1400 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75703)))) (buf!1400 (_1!2397 lt!75703))))))

(declare-fun lt!77328 () Bool)

(assert (=> d!15552 (= lt!77328 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75703))) (currentByte!2917 (_1!2397 lt!75703)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75703))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77327 () tuple2!4620)

(assert (=> d!15552 (= lt!77327 (tuple2!4621 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75703))) (currentByte!2917 (_1!2397 lt!75703)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75703))))) #b00000000000000000000000000000000)) (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75703)))))))

(assert (=> d!15552 (validate_offset_bit!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_1!2397 lt!75703)))) ((_ sign_extend 32) (currentByte!2917 (_1!2397 lt!75703))) ((_ sign_extend 32) (currentBit!2912 (_1!2397 lt!75703))))))

(assert (=> d!15552 (= (readBit!0 (_1!2397 lt!75703)) lt!77327)))

(declare-fun lt!77325 () (_ BitVec 64))

(declare-fun lt!77329 () (_ BitVec 64))

(declare-fun b!49686 () Bool)

(assert (=> b!49686 (= e!32801 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75703))))) (currentByte!2917 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75703)))) (currentBit!2912 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75703))))) (bvadd lt!77329 lt!77325)))))

(assert (=> b!49686 (or (not (= (bvand lt!77329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77325 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77329 lt!77325) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49686 (= lt!77325 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49686 (= lt!77329 (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!75703))) (currentByte!2917 (_1!2397 lt!75703)) (currentBit!2912 (_1!2397 lt!75703))))))

(declare-fun lt!77330 () Bool)

(assert (=> b!49686 (= lt!77330 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75703))) (currentByte!2917 (_1!2397 lt!75703)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75703))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77326 () Bool)

(assert (=> b!49686 (= lt!77326 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75703))) (currentByte!2917 (_1!2397 lt!75703)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75703))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77331 () Bool)

(assert (=> b!49686 (= lt!77331 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75703))) (currentByte!2917 (_1!2397 lt!75703)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75703))))) #b00000000000000000000000000000000)))))

(assert (= (and d!15552 res!41610) b!49686))

(declare-fun m!77777 () Bool)

(assert (=> d!15552 m!77777))

(declare-fun m!77779 () Bool)

(assert (=> d!15552 m!77779))

(declare-fun m!77781 () Bool)

(assert (=> d!15552 m!77781))

(declare-fun m!77783 () Bool)

(assert (=> d!15552 m!77783))

(assert (=> b!49686 m!77777))

(declare-fun m!77785 () Bool)

(assert (=> b!49686 m!77785))

(assert (=> b!49686 m!77779))

(declare-fun m!77787 () Bool)

(assert (=> b!49686 m!77787))

(assert (=> b!49686 m!77781))

(assert (=> b!49081 d!15552))

(declare-fun d!15554 () Bool)

(declare-fun lt!77332 () tuple2!4620)

(assert (=> d!15554 (= lt!77332 (readBit!0 (readerFrom!0 (_2!2398 lt!76561) (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379))))))

(assert (=> d!15554 (= (readBitPure!0 (readerFrom!0 (_2!2398 lt!76561) (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379))) (tuple2!4623 (_2!2409 lt!77332) (_1!2409 lt!77332)))))

(declare-fun bs!3929 () Bool)

(assert (= bs!3929 d!15554))

(assert (=> bs!3929 m!76603))

(declare-fun m!77789 () Bool)

(assert (=> bs!3929 m!77789))

(assert (=> b!49158 d!15554))

(declare-fun d!15556 () Bool)

(declare-fun e!32802 () Bool)

(assert (=> d!15556 e!32802))

(declare-fun res!41611 () Bool)

(assert (=> d!15556 (=> (not res!41611) (not e!32802))))

(assert (=> d!15556 (= res!41611 (invariant!0 (currentBit!2912 (_2!2398 lt!76561)) (currentByte!2917 (_2!2398 lt!76561)) (size!1048 (buf!1400 (_2!2398 lt!76561)))))))

(assert (=> d!15556 (= (readerFrom!0 (_2!2398 lt!76561) (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379)) (BitStream!1817 (buf!1400 (_2!2398 lt!76561)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)))))

(declare-fun b!49687 () Bool)

(assert (=> b!49687 (= e!32802 (invariant!0 (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379) (size!1048 (buf!1400 (_2!2398 lt!76561)))))))

(assert (= (and d!15556 res!41611) b!49687))

(assert (=> d!15556 m!77567))

(declare-fun m!77791 () Bool)

(assert (=> b!49687 m!77791))

(assert (=> b!49158 d!15556))

(declare-fun d!15558 () Bool)

(declare-fun res!41612 () Bool)

(declare-fun e!32803 () Bool)

(assert (=> d!15558 (=> (not res!41612) (not e!32803))))

(assert (=> d!15558 (= res!41612 (= (size!1048 (buf!1400 (_1!2397 lt!76343))) (size!1048 (buf!1400 (_2!2398 lt!75692)))))))

(assert (=> d!15558 (= (isPrefixOf!0 (_1!2397 lt!76343) (_2!2398 lt!75692)) e!32803)))

(declare-fun b!49688 () Bool)

(declare-fun res!41614 () Bool)

(assert (=> b!49688 (=> (not res!41614) (not e!32803))))

(assert (=> b!49688 (= res!41614 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76343))) (currentByte!2917 (_1!2397 lt!76343)) (currentBit!2912 (_1!2397 lt!76343))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(declare-fun b!49689 () Bool)

(declare-fun e!32804 () Bool)

(assert (=> b!49689 (= e!32803 e!32804)))

(declare-fun res!41613 () Bool)

(assert (=> b!49689 (=> res!41613 e!32804)))

(assert (=> b!49689 (= res!41613 (= (size!1048 (buf!1400 (_1!2397 lt!76343))) #b00000000000000000000000000000000))))

(declare-fun b!49690 () Bool)

(assert (=> b!49690 (= e!32804 (arrayBitRangesEq!0 (buf!1400 (_1!2397 lt!76343)) (buf!1400 (_2!2398 lt!75692)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76343))) (currentByte!2917 (_1!2397 lt!76343)) (currentBit!2912 (_1!2397 lt!76343)))))))

(assert (= (and d!15558 res!41612) b!49688))

(assert (= (and b!49688 res!41614) b!49689))

(assert (= (and b!49689 (not res!41613)) b!49690))

(declare-fun m!77793 () Bool)

(assert (=> b!49688 m!77793))

(assert (=> b!49688 m!75847))

(assert (=> b!49690 m!77793))

(assert (=> b!49690 m!77793))

(declare-fun m!77795 () Bool)

(assert (=> b!49690 m!77795))

(assert (=> b!49032 d!15558))

(assert (=> d!15012 d!15010))

(declare-fun d!15560 () Bool)

(assert (=> d!15560 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!15560 true))

(declare-fun _$14!241 () Unit!3414)

(assert (=> d!15560 (= (choose!11 thiss!1379) _$14!241)))

(declare-fun bs!3931 () Bool)

(assert (= bs!3931 d!15560))

(assert (=> bs!3931 m!75799))

(assert (=> d!15012 d!15560))

(declare-fun b!49703 () Bool)

(declare-fun e!32809 () Bool)

(declare-fun lt!77343 () tuple2!4622)

(declare-fun lt!77341 () tuple2!4598)

(assert (=> b!49703 (= e!32809 (= (bitIndex!0 (size!1048 (buf!1400 (_1!2410 lt!77343))) (currentByte!2917 (_1!2410 lt!77343)) (currentBit!2912 (_1!2410 lt!77343))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!77341))) (currentByte!2917 (_2!2398 lt!77341)) (currentBit!2912 (_2!2398 lt!77341)))))))

(declare-fun b!49702 () Bool)

(declare-fun e!32810 () Bool)

(assert (=> b!49702 (= e!32810 e!32809)))

(declare-fun res!41626 () Bool)

(assert (=> b!49702 (=> (not res!41626) (not e!32809))))

(assert (=> b!49702 (= res!41626 (and (= (_2!2410 lt!77343) lt!76567) (= (_1!2410 lt!77343) (_2!2398 lt!77341))))))

(assert (=> b!49702 (= lt!77343 (readBitPure!0 (readerFrom!0 (_2!2398 lt!77341) (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379))))))

(declare-fun d!15562 () Bool)

(assert (=> d!15562 e!32810))

(declare-fun res!41624 () Bool)

(assert (=> d!15562 (=> (not res!41624) (not e!32810))))

(assert (=> d!15562 (= res!41624 (= (size!1048 (buf!1400 thiss!1379)) (size!1048 (buf!1400 (_2!2398 lt!77341)))))))

(declare-fun choose!16 (BitStream!1816 Bool) tuple2!4598)

(assert (=> d!15562 (= lt!77341 (choose!16 thiss!1379 lt!76567))))

(assert (=> d!15562 (validate_offset_bit!0 ((_ sign_extend 32) (size!1048 (buf!1400 thiss!1379))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379)))))

(assert (=> d!15562 (= (appendBit!0 thiss!1379 lt!76567) lt!77341)))

(declare-fun b!49700 () Bool)

(declare-fun res!41623 () Bool)

(assert (=> b!49700 (=> (not res!41623) (not e!32810))))

(declare-fun lt!77342 () (_ BitVec 64))

(declare-fun lt!77344 () (_ BitVec 64))

(assert (=> b!49700 (= res!41623 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!77341))) (currentByte!2917 (_2!2398 lt!77341)) (currentBit!2912 (_2!2398 lt!77341))) (bvadd lt!77344 lt!77342)))))

(assert (=> b!49700 (or (not (= (bvand lt!77344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77342 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77344 lt!77342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49700 (= lt!77342 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49700 (= lt!77344 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)))))

(declare-fun b!49701 () Bool)

(declare-fun res!41625 () Bool)

(assert (=> b!49701 (=> (not res!41625) (not e!32810))))

(assert (=> b!49701 (= res!41625 (isPrefixOf!0 thiss!1379 (_2!2398 lt!77341)))))

(assert (= (and d!15562 res!41624) b!49700))

(assert (= (and b!49700 res!41623) b!49701))

(assert (= (and b!49701 res!41625) b!49702))

(assert (= (and b!49702 res!41626) b!49703))

(declare-fun m!77797 () Bool)

(assert (=> b!49702 m!77797))

(assert (=> b!49702 m!77797))

(declare-fun m!77799 () Bool)

(assert (=> b!49702 m!77799))

(declare-fun m!77801 () Bool)

(assert (=> b!49700 m!77801))

(assert (=> b!49700 m!75803))

(declare-fun m!77803 () Bool)

(assert (=> d!15562 m!77803))

(declare-fun m!77805 () Bool)

(assert (=> d!15562 m!77805))

(declare-fun m!77807 () Bool)

(assert (=> b!49701 m!77807))

(declare-fun m!77809 () Bool)

(assert (=> b!49703 m!77809))

(assert (=> b!49703 m!77801))

(assert (=> d!15076 d!15562))

(declare-fun d!15564 () Bool)

(assert (=> d!15564 (= (length!244 lt!76457) (size!1051 lt!76457))))

(declare-fun bs!3932 () Bool)

(assert (= bs!3932 d!15564))

(declare-fun m!77811 () Bool)

(assert (=> bs!3932 m!77811))

(assert (=> b!49074 d!15564))

(declare-fun d!15566 () Bool)

(declare-fun res!41627 () Bool)

(declare-fun e!32811 () Bool)

(assert (=> d!15566 (=> (not res!41627) (not e!32811))))

(assert (=> d!15566 (= res!41627 (= (size!1048 (buf!1400 (_1!2397 lt!76287))) (size!1048 (buf!1400 thiss!1379))))))

(assert (=> d!15566 (= (isPrefixOf!0 (_1!2397 lt!76287) thiss!1379) e!32811)))

(declare-fun b!49704 () Bool)

(declare-fun res!41629 () Bool)

(assert (=> b!49704 (=> (not res!41629) (not e!32811))))

(assert (=> b!49704 (= res!41629 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76287))) (currentByte!2917 (_1!2397 lt!76287)) (currentBit!2912 (_1!2397 lt!76287))) (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(declare-fun b!49705 () Bool)

(declare-fun e!32812 () Bool)

(assert (=> b!49705 (= e!32811 e!32812)))

(declare-fun res!41628 () Bool)

(assert (=> b!49705 (=> res!41628 e!32812)))

(assert (=> b!49705 (= res!41628 (= (size!1048 (buf!1400 (_1!2397 lt!76287))) #b00000000000000000000000000000000))))

(declare-fun b!49706 () Bool)

(assert (=> b!49706 (= e!32812 (arrayBitRangesEq!0 (buf!1400 (_1!2397 lt!76287)) (buf!1400 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76287))) (currentByte!2917 (_1!2397 lt!76287)) (currentBit!2912 (_1!2397 lt!76287)))))))

(assert (= (and d!15566 res!41627) b!49704))

(assert (= (and b!49704 res!41629) b!49705))

(assert (= (and b!49705 (not res!41628)) b!49706))

(assert (=> b!49704 m!77633))

(assert (=> b!49704 m!75803))

(assert (=> b!49706 m!77633))

(assert (=> b!49706 m!77633))

(declare-fun m!77813 () Bool)

(assert (=> b!49706 m!77813))

(assert (=> b!48999 d!15566))

(declare-fun d!15568 () Bool)

(assert (=> d!15568 (= (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 thiss!1379)) ((_ sign_extend 32) (currentBit!2912 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 thiss!1379)))))))

(assert (=> d!15030 d!15568))

(declare-fun d!15570 () Bool)

(declare-fun e!32813 () Bool)

(assert (=> d!15570 e!32813))

(declare-fun c!3547 () Bool)

(assert (=> d!15570 (= c!3547 (= (bvsub lt!75702 lt!76459) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77345 () List!549)

(declare-fun e!32814 () tuple2!4618)

(assert (=> d!15570 (= lt!77345 (_1!2408 e!32814))))

(declare-fun c!3548 () Bool)

(assert (=> d!15570 (= c!3548 (= (bvsub lt!75702 lt!76459) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15570 (bvsge (bvsub lt!75702 lt!76459) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15570 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_2!2409 lt!76458) (bvsub lt!75702 lt!76459)) lt!77345)))

(declare-fun b!49709 () Bool)

(assert (=> b!49709 (= e!32813 (isEmpty!144 lt!77345))))

(declare-fun b!49707 () Bool)

(assert (=> b!49707 (= e!32814 (tuple2!4619 Nil!546 (_2!2409 lt!76458)))))

(declare-fun b!49710 () Bool)

(assert (=> b!49710 (= e!32813 (> (length!244 lt!77345) 0))))

(declare-fun lt!77346 () tuple2!4620)

(declare-fun lt!77347 () (_ BitVec 64))

(declare-fun b!49708 () Bool)

(assert (=> b!49708 (= e!32814 (tuple2!4619 (Cons!545 (_1!2409 lt!77346) (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_2!2409 lt!77346) (bvsub (bvsub lt!75702 lt!76459) lt!77347))) (_2!2409 lt!77346)))))

(assert (=> b!49708 (= lt!77346 (readBit!0 (_2!2409 lt!76458)))))

(assert (=> b!49708 (= lt!77347 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15570 c!3548) b!49707))

(assert (= (and d!15570 (not c!3548)) b!49708))

(assert (= (and d!15570 c!3547) b!49709))

(assert (= (and d!15570 (not c!3547)) b!49710))

(declare-fun m!77815 () Bool)

(assert (=> b!49709 m!77815))

(declare-fun m!77817 () Bool)

(assert (=> b!49710 m!77817))

(declare-fun m!77819 () Bool)

(assert (=> b!49708 m!77819))

(declare-fun m!77821 () Bool)

(assert (=> b!49708 m!77821))

(assert (=> b!49072 d!15570))

(declare-fun d!15572 () Bool)

(declare-fun e!32815 () Bool)

(assert (=> d!15572 e!32815))

(declare-fun res!41630 () Bool)

(assert (=> d!15572 (=> (not res!41630) (not e!32815))))

(assert (=> d!15572 (= res!41630 (= (buf!1400 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75701)))) (buf!1400 (_1!2397 lt!75701))))))

(declare-fun lt!77351 () Bool)

(assert (=> d!15572 (= lt!77351 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75701))) (currentByte!2917 (_1!2397 lt!75701)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75701))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77350 () tuple2!4620)

(assert (=> d!15572 (= lt!77350 (tuple2!4621 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75701))) (currentByte!2917 (_1!2397 lt!75701)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75701))))) #b00000000000000000000000000000000)) (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75701)))))))

(assert (=> d!15572 (validate_offset_bit!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_1!2397 lt!75701)))) ((_ sign_extend 32) (currentByte!2917 (_1!2397 lt!75701))) ((_ sign_extend 32) (currentBit!2912 (_1!2397 lt!75701))))))

(assert (=> d!15572 (= (readBit!0 (_1!2397 lt!75701)) lt!77350)))

(declare-fun b!49711 () Bool)

(declare-fun lt!77348 () (_ BitVec 64))

(declare-fun lt!77352 () (_ BitVec 64))

(assert (=> b!49711 (= e!32815 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75701))))) (currentByte!2917 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75701)))) (currentBit!2912 (_2!2398 (increaseBitIndex!0 (_1!2397 lt!75701))))) (bvadd lt!77352 lt!77348)))))

(assert (=> b!49711 (or (not (= (bvand lt!77352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77348 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77352 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77352 lt!77348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49711 (= lt!77348 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49711 (= lt!77352 (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!75701))) (currentByte!2917 (_1!2397 lt!75701)) (currentBit!2912 (_1!2397 lt!75701))))))

(declare-fun lt!77353 () Bool)

(assert (=> b!49711 (= lt!77353 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75701))) (currentByte!2917 (_1!2397 lt!75701)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75701))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77349 () Bool)

(assert (=> b!49711 (= lt!77349 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75701))) (currentByte!2917 (_1!2397 lt!75701)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75701))))) #b00000000000000000000000000000000)))))

(declare-fun lt!77354 () Bool)

(assert (=> b!49711 (= lt!77354 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_1!2397 lt!75701))) (currentByte!2917 (_1!2397 lt!75701)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2912 (_1!2397 lt!75701))))) #b00000000000000000000000000000000)))))

(assert (= (and d!15572 res!41630) b!49711))

(declare-fun m!77823 () Bool)

(assert (=> d!15572 m!77823))

(declare-fun m!77825 () Bool)

(assert (=> d!15572 m!77825))

(declare-fun m!77827 () Bool)

(assert (=> d!15572 m!77827))

(declare-fun m!77829 () Bool)

(assert (=> d!15572 m!77829))

(assert (=> b!49711 m!77823))

(declare-fun m!77831 () Bool)

(assert (=> b!49711 m!77831))

(assert (=> b!49711 m!77825))

(declare-fun m!77833 () Bool)

(assert (=> b!49711 m!77833))

(assert (=> b!49711 m!77827))

(assert (=> b!49072 d!15572))

(declare-fun d!15574 () Bool)

(declare-fun e!32816 () Bool)

(assert (=> d!15574 e!32816))

(declare-fun res!41631 () Bool)

(assert (=> d!15574 (=> (not res!41631) (not e!32816))))

(declare-fun lt!77356 () (_ BitVec 64))

(declare-fun lt!77358 () (_ BitVec 64))

(declare-fun lt!77357 () (_ BitVec 64))

(assert (=> d!15574 (= res!41631 (= lt!77358 (bvsub lt!77356 lt!77357)))))

(assert (=> d!15574 (or (= (bvand lt!77356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77357 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77356 lt!77357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15574 (= lt!77357 (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76221)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76221))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76221)))))))

(declare-fun lt!77360 () (_ BitVec 64))

(declare-fun lt!77359 () (_ BitVec 64))

(assert (=> d!15574 (= lt!77356 (bvmul lt!77360 lt!77359))))

(assert (=> d!15574 (or (= lt!77360 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77359 (bvsdiv (bvmul lt!77360 lt!77359) lt!77360)))))

(assert (=> d!15574 (= lt!77359 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15574 (= lt!77360 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76221)))))))

(assert (=> d!15574 (= lt!77358 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76221))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76221)))))))

(assert (=> d!15574 (invariant!0 (currentBit!2912 (_2!2398 lt!76221)) (currentByte!2917 (_2!2398 lt!76221)) (size!1048 (buf!1400 (_2!2398 lt!76221))))))

(assert (=> d!15574 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76221))) (currentByte!2917 (_2!2398 lt!76221)) (currentBit!2912 (_2!2398 lt!76221))) lt!77358)))

(declare-fun b!49712 () Bool)

(declare-fun res!41632 () Bool)

(assert (=> b!49712 (=> (not res!41632) (not e!32816))))

(assert (=> b!49712 (= res!41632 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77358))))

(declare-fun b!49713 () Bool)

(declare-fun lt!77355 () (_ BitVec 64))

(assert (=> b!49713 (= e!32816 (bvsle lt!77358 (bvmul lt!77355 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49713 (or (= lt!77355 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77355 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77355)))))

(assert (=> b!49713 (= lt!77355 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76221)))))))

(assert (= (and d!15574 res!41631) b!49712))

(assert (= (and b!49712 res!41632) b!49713))

(declare-fun m!77835 () Bool)

(assert (=> d!15574 m!77835))

(declare-fun m!77837 () Bool)

(assert (=> d!15574 m!77837))

(assert (=> b!48973 d!15574))

(declare-fun d!15576 () Bool)

(declare-fun e!32817 () Bool)

(assert (=> d!15576 e!32817))

(declare-fun c!3549 () Bool)

(assert (=> d!15576 (= c!3549 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77361 () List!549)

(declare-fun e!32818 () tuple2!4618)

(assert (=> d!15576 (= lt!77361 (_1!2408 e!32818))))

(declare-fun c!3550 () Bool)

(assert (=> d!15576 (= c!3550 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15576 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15576 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!76219) (_1!2397 lt!76217) #b0000000000000000000000000000000000000000000000000000000000000001) lt!77361)))

(declare-fun b!49716 () Bool)

(assert (=> b!49716 (= e!32817 (isEmpty!144 lt!77361))))

(declare-fun b!49714 () Bool)

(assert (=> b!49714 (= e!32818 (tuple2!4619 Nil!546 (_1!2397 lt!76217)))))

(declare-fun b!49717 () Bool)

(assert (=> b!49717 (= e!32817 (> (length!244 lt!77361) 0))))

(declare-fun b!49715 () Bool)

(declare-fun lt!77362 () tuple2!4620)

(declare-fun lt!77363 () (_ BitVec 64))

(assert (=> b!49715 (= e!32818 (tuple2!4619 (Cons!545 (_1!2409 lt!77362) (bitStreamReadBitsIntoList!0 (_2!2398 lt!76219) (_2!2409 lt!77362) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!77363))) (_2!2409 lt!77362)))))

(assert (=> b!49715 (= lt!77362 (readBit!0 (_1!2397 lt!76217)))))

(assert (=> b!49715 (= lt!77363 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15576 c!3550) b!49714))

(assert (= (and d!15576 (not c!3550)) b!49715))

(assert (= (and d!15576 c!3549) b!49716))

(assert (= (and d!15576 (not c!3549)) b!49717))

(declare-fun m!77839 () Bool)

(assert (=> b!49716 m!77839))

(declare-fun m!77841 () Bool)

(assert (=> b!49717 m!77841))

(declare-fun m!77843 () Bool)

(assert (=> b!49715 m!77843))

(declare-fun m!77845 () Bool)

(assert (=> b!49715 m!77845))

(assert (=> b!48973 d!15576))

(declare-fun d!15578 () Bool)

(assert (=> d!15578 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76221)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219))) lt!76181)))

(declare-fun lt!77364 () Unit!3414)

(assert (=> d!15578 (= lt!77364 (choose!9 (_2!2398 lt!76219) (buf!1400 (_2!2398 lt!76221)) lt!76181 (BitStream!1817 (buf!1400 (_2!2398 lt!76221)) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219)))))))

(assert (=> d!15578 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!76219) (buf!1400 (_2!2398 lt!76221)) lt!76181) lt!77364)))

(declare-fun bs!3933 () Bool)

(assert (= bs!3933 d!15578))

(assert (=> bs!3933 m!76293))

(declare-fun m!77847 () Bool)

(assert (=> bs!3933 m!77847))

(assert (=> b!48973 d!15578))

(declare-fun d!15580 () Bool)

(assert (=> d!15580 (= (head!368 (byteArrayBitContentToList!0 (_2!2398 lt!76219) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!664 (byteArrayBitContentToList!0 (_2!2398 lt!76219) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48973 d!15580))

(declare-fun d!15582 () Bool)

(assert (=> d!15582 (= (bitAt!0 (buf!1400 (_2!2398 lt!76221)) lt!76183) (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_2!2398 lt!76221))) ((_ extract 31 0) (bvsdiv lt!76183 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!76183 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3934 () Bool)

(assert (= bs!3934 d!15582))

(declare-fun m!77849 () Bool)

(assert (=> bs!3934 m!77849))

(declare-fun m!77851 () Bool)

(assert (=> bs!3934 m!77851))

(assert (=> b!48973 d!15582))

(declare-fun d!15584 () Bool)

(assert (=> d!15584 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!76221))))

(declare-fun lt!77365 () Unit!3414)

(assert (=> d!15584 (= lt!77365 (choose!30 (_2!2398 lt!75692) (_2!2398 lt!76219) (_2!2398 lt!76221)))))

(assert (=> d!15584 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!76219))))

(assert (=> d!15584 (= (lemmaIsPrefixTransitive!0 (_2!2398 lt!75692) (_2!2398 lt!76219) (_2!2398 lt!76221)) lt!77365)))

(declare-fun bs!3935 () Bool)

(assert (= bs!3935 d!15584))

(assert (=> bs!3935 m!76301))

(declare-fun m!77853 () Bool)

(assert (=> bs!3935 m!77853))

(declare-fun m!77855 () Bool)

(assert (=> bs!3935 m!77855))

(assert (=> b!48973 d!15584))

(assert (=> b!48973 d!14964))

(declare-fun d!15586 () Bool)

(assert (=> d!15586 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!76218) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692)))) lt!76218))))

(declare-fun bs!3936 () Bool)

(assert (= bs!3936 d!15586))

(declare-fun m!77857 () Bool)

(assert (=> bs!3936 m!77857))

(assert (=> b!48973 d!15586))

(declare-fun d!15588 () Bool)

(declare-fun e!32819 () Bool)

(assert (=> d!15588 e!32819))

(declare-fun res!41633 () Bool)

(assert (=> d!15588 (=> (not res!41633) (not e!32819))))

(declare-fun lt!77368 () (_ BitVec 64))

(declare-fun lt!77369 () (_ BitVec 64))

(declare-fun lt!77367 () (_ BitVec 64))

(assert (=> d!15588 (= res!41633 (= lt!77369 (bvsub lt!77367 lt!77368)))))

(assert (=> d!15588 (or (= (bvand lt!77367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77368 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77367 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77367 lt!77368) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15588 (= lt!77368 (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219)))))))

(declare-fun lt!77371 () (_ BitVec 64))

(declare-fun lt!77370 () (_ BitVec 64))

(assert (=> d!15588 (= lt!77367 (bvmul lt!77371 lt!77370))))

(assert (=> d!15588 (or (= lt!77371 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77370 (bvsdiv (bvmul lt!77371 lt!77370) lt!77371)))))

(assert (=> d!15588 (= lt!77370 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15588 (= lt!77371 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))))))

(assert (=> d!15588 (= lt!77369 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219)))))))

(assert (=> d!15588 (invariant!0 (currentBit!2912 (_2!2398 lt!76219)) (currentByte!2917 (_2!2398 lt!76219)) (size!1048 (buf!1400 (_2!2398 lt!76219))))))

(assert (=> d!15588 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76219))) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219))) lt!77369)))

(declare-fun b!49718 () Bool)

(declare-fun res!41634 () Bool)

(assert (=> b!49718 (=> (not res!41634) (not e!32819))))

(assert (=> b!49718 (= res!41634 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77369))))

(declare-fun b!49719 () Bool)

(declare-fun lt!77366 () (_ BitVec 64))

(assert (=> b!49719 (= e!32819 (bvsle lt!77369 (bvmul lt!77366 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49719 (or (= lt!77366 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77366 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77366)))))

(assert (=> b!49719 (= lt!77366 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))))))

(assert (= (and d!15588 res!41633) b!49718))

(assert (= (and b!49718 res!41634) b!49719))

(declare-fun m!77859 () Bool)

(assert (=> d!15588 m!77859))

(declare-fun m!77861 () Bool)

(assert (=> d!15588 m!77861))

(assert (=> b!48973 d!15588))

(declare-fun d!15590 () Bool)

(declare-fun e!32820 () Bool)

(assert (=> d!15590 e!32820))

(declare-fun res!41635 () Bool)

(assert (=> d!15590 (=> (not res!41635) (not e!32820))))

(assert (=> d!15590 (= res!41635 (or (= (bvand lt!76195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!76211 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76195 lt!76211) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!77372 () Unit!3414)

(assert (=> d!15590 (= lt!77372 (choose!27 (_2!2398 lt!75692) (_2!2398 lt!76219) lt!76195 lt!76211))))

(assert (=> d!15590 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76211) (bvsle lt!76211 lt!76195))))

(assert (=> d!15590 (= (validateOffsetBitsIneqLemma!0 (_2!2398 lt!75692) (_2!2398 lt!76219) lt!76195 lt!76211) lt!77372)))

(declare-fun b!49720 () Bool)

(assert (=> b!49720 (= e!32820 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219))) (bvsub lt!76195 lt!76211)))))

(assert (= (and d!15590 res!41635) b!49720))

(declare-fun m!77863 () Bool)

(assert (=> d!15590 m!77863))

(assert (=> b!49720 m!76303))

(assert (=> b!48973 d!15590))

(declare-fun d!15592 () Bool)

(assert (=> d!15592 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!76218)))

(declare-fun lt!77373 () Unit!3414)

(assert (=> d!15592 (= lt!77373 (choose!9 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!76219)) lt!76218 (BitStream!1817 (buf!1400 (_2!2398 lt!76219)) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(assert (=> d!15592 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!76219)) lt!76218) lt!77373)))

(declare-fun bs!3937 () Bool)

(assert (= bs!3937 d!15592))

(assert (=> bs!3937 m!76295))

(declare-fun m!77865 () Bool)

(assert (=> bs!3937 m!77865))

(assert (=> b!48973 d!15592))

(declare-fun d!15594 () Bool)

(declare-fun e!32821 () Bool)

(assert (=> d!15594 e!32821))

(declare-fun c!3551 () Bool)

(assert (=> d!15594 (= c!3551 (= (bvsub lt!76216 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77374 () List!549)

(declare-fun e!32822 () tuple2!4618)

(assert (=> d!15594 (= lt!77374 (_1!2408 e!32822))))

(declare-fun c!3552 () Bool)

(assert (=> d!15594 (= c!3552 (= (bvsub lt!76216 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15594 (bvsge (bvsub lt!76216 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15594 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!76221) (_1!2397 lt!76184) (bvsub lt!76216 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!77374)))

(declare-fun b!49723 () Bool)

(assert (=> b!49723 (= e!32821 (isEmpty!144 lt!77374))))

(declare-fun b!49721 () Bool)

(assert (=> b!49721 (= e!32822 (tuple2!4619 Nil!546 (_1!2397 lt!76184)))))

(declare-fun b!49724 () Bool)

(assert (=> b!49724 (= e!32821 (> (length!244 lt!77374) 0))))

(declare-fun b!49722 () Bool)

(declare-fun lt!77376 () (_ BitVec 64))

(declare-fun lt!77375 () tuple2!4620)

(assert (=> b!49722 (= e!32822 (tuple2!4619 (Cons!545 (_1!2409 lt!77375) (bitStreamReadBitsIntoList!0 (_2!2398 lt!76221) (_2!2409 lt!77375) (bvsub (bvsub lt!76216 #b0000000000000000000000000000000000000000000000000000000000000001) lt!77376))) (_2!2409 lt!77375)))))

(assert (=> b!49722 (= lt!77375 (readBit!0 (_1!2397 lt!76184)))))

(assert (=> b!49722 (= lt!77376 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15594 c!3552) b!49721))

(assert (= (and d!15594 (not c!3552)) b!49722))

(assert (= (and d!15594 c!3551) b!49723))

(assert (= (and d!15594 (not c!3551)) b!49724))

(declare-fun m!77867 () Bool)

(assert (=> b!49723 m!77867))

(declare-fun m!77869 () Bool)

(assert (=> b!49724 m!77869))

(declare-fun m!77871 () Bool)

(assert (=> b!49722 m!77871))

(declare-fun m!77873 () Bool)

(assert (=> b!49722 m!77873))

(assert (=> b!48973 d!15594))

(declare-fun d!15596 () Bool)

(declare-fun e!32823 () Bool)

(assert (=> d!15596 e!32823))

(declare-fun res!41636 () Bool)

(assert (=> d!15596 (=> (not res!41636) (not e!32823))))

(declare-fun lt!77378 () (_ BitVec 64))

(assert (=> d!15596 (= res!41636 (or (= (bvand lt!76216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77378 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!76216 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76216 lt!77378) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!15596 (= lt!77378 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77377 () Unit!3414)

(assert (=> d!15596 (= lt!77377 (choose!42 (_2!2398 lt!76221) (_2!2398 lt!76221) (_1!2397 lt!76207) (_1!2397 lt!76184) lt!76216 lt!76220))))

(assert (=> d!15596 (bvsgt lt!76216 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15596 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2398 lt!76221) (_2!2398 lt!76221) (_1!2397 lt!76207) (_1!2397 lt!76184) lt!76216 lt!76220) lt!77377)))

(declare-fun b!49725 () Bool)

(assert (=> b!49725 (= e!32823 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!76221) (_1!2397 lt!76184) (bvsub lt!76216 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!235 lt!76220)))))

(assert (= (and d!15596 res!41636) b!49725))

(declare-fun m!77875 () Bool)

(assert (=> d!15596 m!77875))

(assert (=> b!49725 m!76269))

(assert (=> b!49725 m!76307))

(assert (=> b!48973 d!15596))

(declare-fun d!15598 () Bool)

(declare-fun res!41637 () Bool)

(declare-fun e!32824 () Bool)

(assert (=> d!15598 (=> (not res!41637) (not e!32824))))

(assert (=> d!15598 (= res!41637 (= (size!1048 (buf!1400 (_2!2398 lt!75692))) (size!1048 (buf!1400 (_2!2398 lt!76221)))))))

(assert (=> d!15598 (= (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!76221)) e!32824)))

(declare-fun b!49726 () Bool)

(declare-fun res!41639 () Bool)

(assert (=> b!49726 (=> (not res!41639) (not e!32824))))

(assert (=> b!49726 (= res!41639 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76221))) (currentByte!2917 (_2!2398 lt!76221)) (currentBit!2912 (_2!2398 lt!76221)))))))

(declare-fun b!49727 () Bool)

(declare-fun e!32825 () Bool)

(assert (=> b!49727 (= e!32824 e!32825)))

(declare-fun res!41638 () Bool)

(assert (=> b!49727 (=> res!41638 e!32825)))

(assert (=> b!49727 (= res!41638 (= (size!1048 (buf!1400 (_2!2398 lt!75692))) #b00000000000000000000000000000000))))

(declare-fun b!49728 () Bool)

(assert (=> b!49728 (= e!32825 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (_2!2398 lt!76221)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(assert (= (and d!15598 res!41637) b!49726))

(assert (= (and b!49726 res!41639) b!49727))

(assert (= (and b!49727 (not res!41638)) b!49728))

(assert (=> b!49726 m!75847))

(assert (=> b!49726 m!76249))

(assert (=> b!49728 m!75847))

(assert (=> b!49728 m!75847))

(declare-fun m!77877 () Bool)

(assert (=> b!49728 m!77877))

(assert (=> b!48973 d!15598))

(declare-fun b!49729 () Bool)

(declare-fun e!32826 () Bool)

(declare-fun lt!77389 () tuple2!4622)

(declare-fun lt!77381 () tuple2!4598)

(assert (=> b!49729 (= e!32826 (= (bitIndex!0 (size!1048 (buf!1400 (_1!2410 lt!77389))) (currentByte!2917 (_1!2410 lt!77389)) (currentBit!2912 (_1!2410 lt!77389))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!77381))) (currentByte!2917 (_2!2398 lt!77381)) (currentBit!2912 (_2!2398 lt!77381)))))))

(declare-fun b!49730 () Bool)

(declare-fun res!41645 () Bool)

(declare-fun e!32827 () Bool)

(assert (=> b!49730 (=> (not res!41645) (not e!32827))))

(declare-fun lt!77388 () (_ BitVec 64))

(declare-fun lt!77380 () tuple2!4598)

(declare-fun lt!77385 () (_ BitVec 64))

(assert (=> b!49730 (= res!41645 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!77380))) (currentByte!2917 (_2!2398 lt!77380)) (currentBit!2912 (_2!2398 lt!77380))) (bvadd lt!77388 lt!77385)))))

(assert (=> b!49730 (or (not (= (bvand lt!77388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77385 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77388 lt!77385) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49730 (= lt!77385 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!49730 (= lt!77388 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(declare-fun b!49731 () Bool)

(declare-fun e!32829 () Bool)

(declare-fun lt!77379 () tuple2!4622)

(assert (=> b!49731 (= e!32829 (= (bitIndex!0 (size!1048 (buf!1400 (_1!2410 lt!77379))) (currentByte!2917 (_1!2410 lt!77379)) (currentBit!2912 (_1!2410 lt!77379))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!77380))) (currentByte!2917 (_2!2398 lt!77380)) (currentBit!2912 (_2!2398 lt!77380)))))))

(declare-fun b!49733 () Bool)

(declare-fun res!41642 () Bool)

(assert (=> b!49733 (=> (not res!41642) (not e!32827))))

(assert (=> b!49733 (= res!41642 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!77380)))))

(declare-fun b!49734 () Bool)

(assert (=> b!49734 (= e!32827 e!32829)))

(declare-fun res!41647 () Bool)

(assert (=> b!49734 (=> (not res!41647) (not e!32829))))

(declare-fun lt!77390 () (_ BitVec 8))

(assert (=> b!49734 (= res!41647 (and (= (_2!2410 lt!77379) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!77390)) #b00000000000000000000000000000000))) (= (_1!2410 lt!77379) (_2!2398 lt!77380))))))

(declare-fun lt!77386 () tuple2!4612)

(declare-fun lt!77384 () BitStream!1816)

(assert (=> b!49734 (= lt!77386 (readBits!0 lt!77384 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!49734 (= lt!77379 (readBitPure!0 lt!77384))))

(assert (=> b!49734 (= lt!77384 (readerFrom!0 (_2!2398 lt!77380) (currentBit!2912 (_2!2398 lt!75692)) (currentByte!2917 (_2!2398 lt!75692))))))

(declare-fun b!49732 () Bool)

(declare-fun res!41643 () Bool)

(declare-fun e!32828 () Bool)

(assert (=> b!49732 (=> (not res!41643) (not e!32828))))

(assert (=> b!49732 (= res!41643 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!77381))) (currentByte!2917 (_2!2398 lt!77381)) (currentBit!2912 (_2!2398 lt!77381))) (bvadd (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!15600 () Bool)

(assert (=> d!15600 e!32827))

(declare-fun res!41641 () Bool)

(assert (=> d!15600 (=> (not res!41641) (not e!32827))))

(assert (=> d!15600 (= res!41641 (= (size!1048 (buf!1400 (_2!2398 lt!77380))) (size!1048 (buf!1400 (_2!2398 lt!75692)))))))

(declare-fun lt!77383 () array!2311)

(assert (=> d!15600 (= lt!77390 (select (arr!1574 lt!77383) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!15600 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1048 lt!77383)))))

(assert (=> d!15600 (= lt!77383 (array!2312 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!77382 () tuple2!4598)

(assert (=> d!15600 (= lt!77380 (tuple2!4599 (_1!2398 lt!77382) (_2!2398 lt!77382)))))

(assert (=> d!15600 (= lt!77382 lt!77381)))

(assert (=> d!15600 e!32828))

(declare-fun res!41646 () Bool)

(assert (=> d!15600 (=> (not res!41646) (not e!32828))))

(assert (=> d!15600 (= res!41646 (= (size!1048 (buf!1400 (_2!2398 lt!75692))) (size!1048 (buf!1400 (_2!2398 lt!77381)))))))

(declare-fun lt!77387 () Bool)

(assert (=> d!15600 (= lt!77381 (appendBit!0 (_2!2398 lt!75692) lt!77387))))

(assert (=> d!15600 (= lt!77387 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!15600 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!15600 (= (appendBitFromByte!0 (_2!2398 lt!75692) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!77380)))

(declare-fun b!49735 () Bool)

(declare-fun res!41644 () Bool)

(assert (=> b!49735 (=> (not res!41644) (not e!32828))))

(assert (=> b!49735 (= res!41644 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!77381)))))

(declare-fun b!49736 () Bool)

(assert (=> b!49736 (= e!32828 e!32826)))

(declare-fun res!41640 () Bool)

(assert (=> b!49736 (=> (not res!41640) (not e!32826))))

(assert (=> b!49736 (= res!41640 (and (= (_2!2410 lt!77389) lt!77387) (= (_1!2410 lt!77389) (_2!2398 lt!77381))))))

(assert (=> b!49736 (= lt!77389 (readBitPure!0 (readerFrom!0 (_2!2398 lt!77381) (currentBit!2912 (_2!2398 lt!75692)) (currentByte!2917 (_2!2398 lt!75692)))))))

(assert (= (and d!15600 res!41646) b!49732))

(assert (= (and b!49732 res!41643) b!49735))

(assert (= (and b!49735 res!41644) b!49736))

(assert (= (and b!49736 res!41640) b!49729))

(assert (= (and d!15600 res!41641) b!49730))

(assert (= (and b!49730 res!41645) b!49733))

(assert (= (and b!49733 res!41642) b!49734))

(assert (= (and b!49734 res!41647) b!49731))

(declare-fun m!77879 () Bool)

(assert (=> b!49731 m!77879))

(declare-fun m!77881 () Bool)

(assert (=> b!49731 m!77881))

(declare-fun m!77883 () Bool)

(assert (=> b!49734 m!77883))

(declare-fun m!77885 () Bool)

(assert (=> b!49734 m!77885))

(declare-fun m!77887 () Bool)

(assert (=> b!49734 m!77887))

(declare-fun m!77889 () Bool)

(assert (=> b!49736 m!77889))

(assert (=> b!49736 m!77889))

(declare-fun m!77891 () Bool)

(assert (=> b!49736 m!77891))

(declare-fun m!77893 () Bool)

(assert (=> d!15600 m!77893))

(declare-fun m!77895 () Bool)

(assert (=> d!15600 m!77895))

(assert (=> d!15600 m!77679))

(declare-fun m!77897 () Bool)

(assert (=> b!49729 m!77897))

(declare-fun m!77899 () Bool)

(assert (=> b!49729 m!77899))

(assert (=> b!49730 m!77881))

(assert (=> b!49730 m!75847))

(declare-fun m!77901 () Bool)

(assert (=> b!49735 m!77901))

(assert (=> b!49732 m!77899))

(assert (=> b!49732 m!75847))

(declare-fun m!77903 () Bool)

(assert (=> b!49733 m!77903))

(assert (=> b!48973 d!15600))

(declare-fun d!15602 () Bool)

(assert (=> d!15602 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76221)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219))) lt!76181) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76221)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219)))) lt!76181))))

(declare-fun bs!3938 () Bool)

(assert (= bs!3938 d!15602))

(declare-fun m!77905 () Bool)

(assert (=> bs!3938 m!77905))

(assert (=> b!48973 d!15602))

(declare-fun d!15604 () Bool)

(assert (=> d!15604 (= (tail!235 lt!76220) (t!1299 lt!76220))))

(assert (=> b!48973 d!15604))

(declare-fun d!15606 () Bool)

(assert (=> d!15606 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76221)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!76179)))

(declare-fun lt!77391 () Unit!3414)

(assert (=> d!15606 (= lt!77391 (choose!9 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!76221)) lt!76179 (BitStream!1817 (buf!1400 (_2!2398 lt!76221)) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(assert (=> d!15606 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!76221)) lt!76179) lt!77391)))

(declare-fun bs!3939 () Bool)

(assert (= bs!3939 d!15606))

(assert (=> bs!3939 m!76267))

(declare-fun m!77907 () Bool)

(assert (=> bs!3939 m!77907))

(assert (=> b!48973 d!15606))

(declare-fun d!15608 () Bool)

(assert (=> d!15608 (= (bitAt!0 (buf!1400 (_2!2398 lt!76219)) lt!76183) (not (= (bvand ((_ sign_extend 24) (select (arr!1574 (buf!1400 (_2!2398 lt!76219))) ((_ extract 31 0) (bvsdiv lt!76183 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!76183 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3940 () Bool)

(assert (= bs!3940 d!15608))

(declare-fun m!77909 () Bool)

(assert (=> bs!3940 m!77909))

(assert (=> bs!3940 m!77851))

(assert (=> b!48973 d!15608))

(declare-fun d!15610 () Bool)

(assert (=> d!15610 (= (head!368 (bitStreamReadBitsIntoList!0 (_2!2398 lt!76219) (_1!2397 lt!76217) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!664 (bitStreamReadBitsIntoList!0 (_2!2398 lt!76219) (_1!2397 lt!76217) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48973 d!15610))

(declare-fun d!15612 () Bool)

(declare-fun c!3553 () Bool)

(assert (=> d!15612 (= c!3553 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32830 () List!549)

(assert (=> d!15612 (= (byteArrayBitContentToList!0 (_2!2398 lt!76221) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) e!32830)))

(declare-fun b!49737 () Bool)

(assert (=> b!49737 (= e!32830 Nil!546)))

(declare-fun b!49738 () Bool)

(assert (=> b!49738 (= e!32830 (Cons!545 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2398 lt!76221) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15612 c!3553) b!49737))

(assert (= (and d!15612 (not c!3553)) b!49738))

(declare-fun m!77911 () Bool)

(assert (=> b!49738 m!77911))

(declare-fun m!77913 () Bool)

(assert (=> b!49738 m!77913))

(declare-fun m!77915 () Bool)

(assert (=> b!49738 m!77915))

(assert (=> b!48973 d!15612))

(declare-fun d!15614 () Bool)

(declare-fun e!32831 () Bool)

(assert (=> d!15614 e!32831))

(declare-fun c!3554 () Bool)

(assert (=> d!15614 (= c!3554 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77392 () List!549)

(declare-fun e!32832 () tuple2!4618)

(assert (=> d!15614 (= lt!77392 (_1!2408 e!32832))))

(declare-fun c!3555 () Bool)

(assert (=> d!15614 (= c!3555 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15614 (bvsge (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15614 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!76221) (_1!2397 lt!76184) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!77392)))

(declare-fun b!49741 () Bool)

(assert (=> b!49741 (= e!32831 (isEmpty!144 lt!77392))))

(declare-fun b!49739 () Bool)

(assert (=> b!49739 (= e!32832 (tuple2!4619 Nil!546 (_1!2397 lt!76184)))))

(declare-fun b!49742 () Bool)

(assert (=> b!49742 (= e!32831 (> (length!244 lt!77392) 0))))

(declare-fun lt!77394 () (_ BitVec 64))

(declare-fun b!49740 () Bool)

(declare-fun lt!77393 () tuple2!4620)

(assert (=> b!49740 (= e!32832 (tuple2!4619 (Cons!545 (_1!2409 lt!77393) (bitStreamReadBitsIntoList!0 (_2!2398 lt!76221) (_2!2409 lt!77393) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!77394))) (_2!2409 lt!77393)))))

(assert (=> b!49740 (= lt!77393 (readBit!0 (_1!2397 lt!76184)))))

(assert (=> b!49740 (= lt!77394 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15614 c!3555) b!49739))

(assert (= (and d!15614 (not c!3555)) b!49740))

(assert (= (and d!15614 c!3554) b!49741))

(assert (= (and d!15614 (not c!3554)) b!49742))

(declare-fun m!77917 () Bool)

(assert (=> b!49741 m!77917))

(declare-fun m!77919 () Bool)

(assert (=> b!49742 m!77919))

(declare-fun m!77921 () Bool)

(assert (=> b!49740 m!77921))

(assert (=> b!49740 m!77873))

(assert (=> b!48973 d!15614))

(declare-fun d!15616 () Bool)

(declare-fun e!32833 () Bool)

(assert (=> d!15616 e!32833))

(declare-fun c!3556 () Bool)

(assert (=> d!15616 (= c!3556 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77395 () List!549)

(declare-fun e!32834 () tuple2!4618)

(assert (=> d!15616 (= lt!77395 (_1!2408 e!32834))))

(declare-fun c!3557 () Bool)

(assert (=> d!15616 (= c!3557 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15616 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15616 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!76221) (_1!2397 lt!76207) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!77395)))

(declare-fun b!49745 () Bool)

(assert (=> b!49745 (= e!32833 (isEmpty!144 lt!77395))))

(declare-fun b!49743 () Bool)

(assert (=> b!49743 (= e!32834 (tuple2!4619 Nil!546 (_1!2397 lt!76207)))))

(declare-fun b!49746 () Bool)

(assert (=> b!49746 (= e!32833 (> (length!244 lt!77395) 0))))

(declare-fun lt!77396 () tuple2!4620)

(declare-fun lt!77397 () (_ BitVec 64))

(declare-fun b!49744 () Bool)

(assert (=> b!49744 (= e!32834 (tuple2!4619 (Cons!545 (_1!2409 lt!77396) (bitStreamReadBitsIntoList!0 (_2!2398 lt!76221) (_2!2409 lt!77396) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!77397))) (_2!2409 lt!77396)))))

(assert (=> b!49744 (= lt!77396 (readBit!0 (_1!2397 lt!76207)))))

(assert (=> b!49744 (= lt!77397 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15616 c!3557) b!49743))

(assert (= (and d!15616 (not c!3557)) b!49744))

(assert (= (and d!15616 c!3556) b!49745))

(assert (= (and d!15616 (not c!3556)) b!49746))

(declare-fun m!77923 () Bool)

(assert (=> b!49745 m!77923))

(declare-fun m!77925 () Bool)

(assert (=> b!49746 m!77925))

(declare-fun m!77927 () Bool)

(assert (=> b!49744 m!77927))

(declare-fun m!77929 () Bool)

(assert (=> b!49744 m!77929))

(assert (=> b!48973 d!15616))

(declare-fun b!49747 () Bool)

(declare-fun e!32836 () tuple2!4598)

(declare-fun lt!77440 () tuple2!4598)

(declare-fun Unit!3462 () Unit!3414)

(assert (=> b!49747 (= e!32836 (tuple2!4599 Unit!3462 (_2!2398 lt!77440)))))

(declare-fun lt!77438 () tuple2!4598)

(assert (=> b!49747 (= lt!77438 (appendBitFromByte!0 (_2!2398 lt!76219) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!77414 () (_ BitVec 64))

(assert (=> b!49747 (= lt!77414 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77430 () (_ BitVec 64))

(assert (=> b!49747 (= lt!77430 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77425 () Unit!3414)

(assert (=> b!49747 (= lt!77425 (validateOffsetBitsIneqLemma!0 (_2!2398 lt!76219) (_2!2398 lt!77438) lt!77414 lt!77430))))

(assert (=> b!49747 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!77438)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!77438))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!77438))) (bvsub lt!77414 lt!77430))))

(declare-fun lt!77434 () Unit!3414)

(assert (=> b!49747 (= lt!77434 lt!77425)))

(declare-fun lt!77436 () tuple2!4596)

(declare-fun call!637 () tuple2!4596)

(assert (=> b!49747 (= lt!77436 call!637)))

(declare-fun lt!77437 () (_ BitVec 64))

(assert (=> b!49747 (= lt!77437 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!77407 () Unit!3414)

(assert (=> b!49747 (= lt!77407 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!76219) (buf!1400 (_2!2398 lt!77438)) lt!77437))))

(assert (=> b!49747 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!77438)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219))) lt!77437)))

(declare-fun lt!77418 () Unit!3414)

(assert (=> b!49747 (= lt!77418 lt!77407)))

(assert (=> b!49747 (= (head!368 (byteArrayBitContentToList!0 (_2!2398 lt!77438) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!368 (bitStreamReadBitsIntoList!0 (_2!2398 lt!77438) (_1!2397 lt!77436) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77405 () Unit!3414)

(declare-fun Unit!3463 () Unit!3414)

(assert (=> b!49747 (= lt!77405 Unit!3463)))

(assert (=> b!49747 (= lt!77440 (appendBitsMSBFirstLoop!0 (_2!2398 lt!77438) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!77409 () Unit!3414)

(assert (=> b!49747 (= lt!77409 (lemmaIsPrefixTransitive!0 (_2!2398 lt!76219) (_2!2398 lt!77438) (_2!2398 lt!77440)))))

(assert (=> b!49747 (isPrefixOf!0 (_2!2398 lt!76219) (_2!2398 lt!77440))))

(declare-fun lt!77431 () Unit!3414)

(assert (=> b!49747 (= lt!77431 lt!77409)))

(assert (=> b!49747 (= (size!1048 (buf!1400 (_2!2398 lt!77440))) (size!1048 (buf!1400 (_2!2398 lt!76219))))))

(declare-fun lt!77417 () Unit!3414)

(declare-fun Unit!3464 () Unit!3414)

(assert (=> b!49747 (= lt!77417 Unit!3464)))

(assert (=> b!49747 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!77440))) (currentByte!2917 (_2!2398 lt!77440)) (currentBit!2912 (_2!2398 lt!77440))) (bvsub (bvadd (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76219))) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77427 () Unit!3414)

(declare-fun Unit!3465 () Unit!3414)

(assert (=> b!49747 (= lt!77427 Unit!3465)))

(assert (=> b!49747 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!77440))) (currentByte!2917 (_2!2398 lt!77440)) (currentBit!2912 (_2!2398 lt!77440))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!77438))) (currentByte!2917 (_2!2398 lt!77438)) (currentBit!2912 (_2!2398 lt!77438))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!77408 () Unit!3414)

(declare-fun Unit!3466 () Unit!3414)

(assert (=> b!49747 (= lt!77408 Unit!3466)))

(declare-fun lt!77426 () tuple2!4596)

(assert (=> b!49747 (= lt!77426 (reader!0 (_2!2398 lt!76219) (_2!2398 lt!77440)))))

(declare-fun lt!77398 () (_ BitVec 64))

(assert (=> b!49747 (= lt!77398 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77410 () Unit!3414)

(assert (=> b!49747 (= lt!77410 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!76219) (buf!1400 (_2!2398 lt!77440)) lt!77398))))

(assert (=> b!49747 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!77440)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219))) lt!77398)))

(declare-fun lt!77432 () Unit!3414)

(assert (=> b!49747 (= lt!77432 lt!77410)))

(declare-fun lt!77403 () tuple2!4596)

(assert (=> b!49747 (= lt!77403 (reader!0 (_2!2398 lt!77438) (_2!2398 lt!77440)))))

(declare-fun lt!77400 () (_ BitVec 64))

(assert (=> b!49747 (= lt!77400 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!77406 () Unit!3414)

(assert (=> b!49747 (= lt!77406 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!77438) (buf!1400 (_2!2398 lt!77440)) lt!77400))))

(assert (=> b!49747 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!77440)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!77438))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!77438))) lt!77400)))

(declare-fun lt!77412 () Unit!3414)

(assert (=> b!49747 (= lt!77412 lt!77406)))

(declare-fun lt!77420 () List!549)

(assert (=> b!49747 (= lt!77420 (byteArrayBitContentToList!0 (_2!2398 lt!77440) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!77399 () List!549)

(assert (=> b!49747 (= lt!77399 (byteArrayBitContentToList!0 (_2!2398 lt!77440) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77439 () List!549)

(assert (=> b!49747 (= lt!77439 (bitStreamReadBitsIntoList!0 (_2!2398 lt!77440) (_1!2397 lt!77426) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!77433 () List!549)

(assert (=> b!49747 (= lt!77433 (bitStreamReadBitsIntoList!0 (_2!2398 lt!77440) (_1!2397 lt!77403) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77435 () (_ BitVec 64))

(assert (=> b!49747 (= lt!77435 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!77411 () Unit!3414)

(assert (=> b!49747 (= lt!77411 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2398 lt!77440) (_2!2398 lt!77440) (_1!2397 lt!77426) (_1!2397 lt!77403) lt!77435 lt!77439))))

(assert (=> b!49747 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!77440) (_1!2397 lt!77403) (bvsub lt!77435 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!235 lt!77439))))

(declare-fun lt!77424 () Unit!3414)

(assert (=> b!49747 (= lt!77424 lt!77411)))

(declare-fun lt!77402 () (_ BitVec 64))

(declare-fun lt!77428 () Unit!3414)

(assert (=> b!49747 (= lt!77428 (arrayBitRangesEqImpliesEq!0 (buf!1400 (_2!2398 lt!77438)) (buf!1400 (_2!2398 lt!77440)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!77402 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!77438))) (currentByte!2917 (_2!2398 lt!77438)) (currentBit!2912 (_2!2398 lt!77438)))))))

(assert (=> b!49747 (= (bitAt!0 (buf!1400 (_2!2398 lt!77438)) lt!77402) (bitAt!0 (buf!1400 (_2!2398 lt!77440)) lt!77402))))

(declare-fun lt!77441 () Unit!3414)

(assert (=> b!49747 (= lt!77441 lt!77428)))

(declare-fun lt!77413 () tuple2!4596)

(declare-fun b!49748 () Bool)

(declare-fun e!32837 () Bool)

(declare-fun lt!77421 () tuple2!4598)

(assert (=> b!49748 (= e!32837 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!77421) (_1!2397 lt!77413) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!2398 lt!77421) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!49748 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49748 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!77404 () Unit!3414)

(declare-fun lt!77423 () Unit!3414)

(assert (=> b!49748 (= lt!77404 lt!77423)))

(declare-fun lt!77415 () (_ BitVec 64))

(assert (=> b!49748 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!77421)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219))) lt!77415)))

(assert (=> b!49748 (= lt!77423 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!76219) (buf!1400 (_2!2398 lt!77421)) lt!77415))))

(declare-fun e!32835 () Bool)

(assert (=> b!49748 e!32835))

(declare-fun res!41650 () Bool)

(assert (=> b!49748 (=> (not res!41650) (not e!32835))))

(assert (=> b!49748 (= res!41650 (and (= (size!1048 (buf!1400 (_2!2398 lt!76219))) (size!1048 (buf!1400 (_2!2398 lt!77421)))) (bvsge lt!77415 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49748 (= lt!77415 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!49748 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49748 (= lt!77413 (reader!0 (_2!2398 lt!76219) (_2!2398 lt!77421)))))

(declare-fun b!49749 () Bool)

(declare-fun Unit!3467 () Unit!3414)

(assert (=> b!49749 (= e!32836 (tuple2!4599 Unit!3467 (_2!2398 lt!76219)))))

(assert (=> b!49749 (= (size!1048 (buf!1400 (_2!2398 lt!76219))) (size!1048 (buf!1400 (_2!2398 lt!76219))))))

(declare-fun lt!77401 () Unit!3414)

(declare-fun Unit!3468 () Unit!3414)

(assert (=> b!49749 (= lt!77401 Unit!3468)))

(assert (=> b!49749 (checkByteArrayBitContent!0 (_2!2398 lt!76219) srcBuffer!2 (_1!2405 (readBits!0 (_1!2397 call!637) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!49750 () Bool)

(declare-fun res!41649 () Bool)

(assert (=> b!49750 (=> (not res!41649) (not e!32837))))

(assert (=> b!49750 (= res!41649 (isPrefixOf!0 (_2!2398 lt!76219) (_2!2398 lt!77421)))))

(declare-fun d!15618 () Bool)

(assert (=> d!15618 e!32837))

(declare-fun res!41653 () Bool)

(assert (=> d!15618 (=> (not res!41653) (not e!32837))))

(declare-fun lt!77429 () (_ BitVec 64))

(assert (=> d!15618 (= res!41653 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!77421))) (currentByte!2917 (_2!2398 lt!77421)) (currentBit!2912 (_2!2398 lt!77421))) (bvsub lt!77429 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!15618 (or (= (bvand lt!77429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77429 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!77416 () (_ BitVec 64))

(assert (=> d!15618 (= lt!77429 (bvadd lt!77416 to!314))))

(assert (=> d!15618 (or (not (= (bvand lt!77416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77416 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77416 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15618 (= lt!77416 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76219))) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219))))))

(assert (=> d!15618 (= lt!77421 e!32836)))

(declare-fun c!3558 () Bool)

(assert (=> d!15618 (= c!3558 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!77419 () Unit!3414)

(declare-fun lt!77422 () Unit!3414)

(assert (=> d!15618 (= lt!77419 lt!77422)))

(assert (=> d!15618 (isPrefixOf!0 (_2!2398 lt!76219) (_2!2398 lt!76219))))

(assert (=> d!15618 (= lt!77422 (lemmaIsPrefixRefl!0 (_2!2398 lt!76219)))))

(assert (=> d!15618 (= lt!77402 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76219))) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219))))))

(assert (=> d!15618 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15618 (= (appendBitsMSBFirstLoop!0 (_2!2398 lt!76219) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314) lt!77421)))

(declare-fun bm!634 () Bool)

(assert (=> bm!634 (= call!637 (reader!0 (_2!2398 lt!76219) (ite c!3558 (_2!2398 lt!77438) (_2!2398 lt!76219))))))

(declare-fun b!49751 () Bool)

(declare-fun res!41648 () Bool)

(assert (=> b!49751 (=> (not res!41648) (not e!32837))))

(assert (=> b!49751 (= res!41648 (= (size!1048 (buf!1400 (_2!2398 lt!77421))) (size!1048 (buf!1400 (_2!2398 lt!76219)))))))

(declare-fun b!49752 () Bool)

(declare-fun res!41651 () Bool)

(assert (=> b!49752 (=> (not res!41651) (not e!32837))))

(assert (=> b!49752 (= res!41651 (invariant!0 (currentBit!2912 (_2!2398 lt!77421)) (currentByte!2917 (_2!2398 lt!77421)) (size!1048 (buf!1400 (_2!2398 lt!77421)))))))

(declare-fun b!49753 () Bool)

(declare-fun res!41652 () Bool)

(assert (=> b!49753 (=> (not res!41652) (not e!32837))))

(assert (=> b!49753 (= res!41652 (= (size!1048 (buf!1400 (_2!2398 lt!76219))) (size!1048 (buf!1400 (_2!2398 lt!77421)))))))

(declare-fun b!49754 () Bool)

(assert (=> b!49754 (= e!32835 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219))) lt!77415))))

(assert (= (and d!15618 c!3558) b!49747))

(assert (= (and d!15618 (not c!3558)) b!49749))

(assert (= (or b!49747 b!49749) bm!634))

(assert (= (and d!15618 res!41653) b!49752))

(assert (= (and b!49752 res!41651) b!49753))

(assert (= (and b!49753 res!41652) b!49750))

(assert (= (and b!49750 res!41649) b!49751))

(assert (= (and b!49751 res!41648) b!49748))

(assert (= (and b!49748 res!41650) b!49754))

(declare-fun m!77931 () Bool)

(assert (=> bm!634 m!77931))

(declare-fun m!77933 () Bool)

(assert (=> b!49752 m!77933))

(declare-fun m!77935 () Bool)

(assert (=> d!15618 m!77935))

(assert (=> d!15618 m!76265))

(declare-fun m!77937 () Bool)

(assert (=> d!15618 m!77937))

(declare-fun m!77939 () Bool)

(assert (=> d!15618 m!77939))

(declare-fun m!77941 () Bool)

(assert (=> b!49749 m!77941))

(declare-fun m!77943 () Bool)

(assert (=> b!49749 m!77943))

(declare-fun m!77945 () Bool)

(assert (=> b!49754 m!77945))

(assert (=> b!49747 m!76265))

(declare-fun m!77947 () Bool)

(assert (=> b!49747 m!77947))

(declare-fun m!77949 () Bool)

(assert (=> b!49747 m!77949))

(declare-fun m!77951 () Bool)

(assert (=> b!49747 m!77951))

(declare-fun m!77953 () Bool)

(assert (=> b!49747 m!77953))

(declare-fun m!77955 () Bool)

(assert (=> b!49747 m!77955))

(declare-fun m!77957 () Bool)

(assert (=> b!49747 m!77957))

(declare-fun m!77959 () Bool)

(assert (=> b!49747 m!77959))

(declare-fun m!77961 () Bool)

(assert (=> b!49747 m!77961))

(declare-fun m!77963 () Bool)

(assert (=> b!49747 m!77963))

(declare-fun m!77965 () Bool)

(assert (=> b!49747 m!77965))

(declare-fun m!77967 () Bool)

(assert (=> b!49747 m!77967))

(declare-fun m!77969 () Bool)

(assert (=> b!49747 m!77969))

(assert (=> b!49747 m!77911))

(declare-fun m!77971 () Bool)

(assert (=> b!49747 m!77971))

(declare-fun m!77973 () Bool)

(assert (=> b!49747 m!77973))

(assert (=> b!49747 m!77963))

(declare-fun m!77975 () Bool)

(assert (=> b!49747 m!77975))

(declare-fun m!77977 () Bool)

(assert (=> b!49747 m!77977))

(declare-fun m!77979 () Bool)

(assert (=> b!49747 m!77979))

(assert (=> b!49747 m!77957))

(declare-fun m!77981 () Bool)

(assert (=> b!49747 m!77981))

(assert (=> b!49747 m!77911))

(declare-fun m!77983 () Bool)

(assert (=> b!49747 m!77983))

(declare-fun m!77985 () Bool)

(assert (=> b!49747 m!77985))

(declare-fun m!77987 () Bool)

(assert (=> b!49747 m!77987))

(declare-fun m!77989 () Bool)

(assert (=> b!49747 m!77989))

(declare-fun m!77991 () Bool)

(assert (=> b!49747 m!77991))

(declare-fun m!77993 () Bool)

(assert (=> b!49747 m!77993))

(assert (=> b!49747 m!77983))

(declare-fun m!77995 () Bool)

(assert (=> b!49747 m!77995))

(declare-fun m!77997 () Bool)

(assert (=> b!49747 m!77997))

(declare-fun m!77999 () Bool)

(assert (=> b!49747 m!77999))

(declare-fun m!78001 () Bool)

(assert (=> b!49747 m!78001))

(declare-fun m!78003 () Bool)

(assert (=> b!49747 m!78003))

(declare-fun m!78005 () Bool)

(assert (=> b!49747 m!78005))

(declare-fun m!78007 () Bool)

(assert (=> b!49750 m!78007))

(declare-fun m!78009 () Bool)

(assert (=> b!49748 m!78009))

(declare-fun m!78011 () Bool)

(assert (=> b!49748 m!78011))

(declare-fun m!78013 () Bool)

(assert (=> b!49748 m!78013))

(declare-fun m!78015 () Bool)

(assert (=> b!49748 m!78015))

(declare-fun m!78017 () Bool)

(assert (=> b!49748 m!78017))

(assert (=> b!48973 d!15618))

(declare-fun d!15620 () Bool)

(assert (=> d!15620 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76221)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!76179) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76221)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692)))) lt!76179))))

(declare-fun bs!3941 () Bool)

(assert (= bs!3941 d!15620))

(declare-fun m!78019 () Bool)

(assert (=> bs!3941 m!78019))

(assert (=> b!48973 d!15620))

(declare-fun d!15622 () Bool)

(assert (=> d!15622 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219))) (bvsub lt!76195 lt!76211)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76219)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76219))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76219)))) (bvsub lt!76195 lt!76211)))))

(declare-fun bs!3942 () Bool)

(assert (= bs!3942 d!15622))

(assert (=> bs!3942 m!77859))

(assert (=> b!48973 d!15622))

(declare-fun b!49755 () Bool)

(declare-fun e!32838 () Unit!3414)

(declare-fun Unit!3469 () Unit!3414)

(assert (=> b!49755 (= e!32838 Unit!3469)))

(declare-fun d!15624 () Bool)

(declare-fun e!32839 () Bool)

(assert (=> d!15624 e!32839))

(declare-fun res!41655 () Bool)

(assert (=> d!15624 (=> (not res!41655) (not e!32839))))

(declare-fun lt!77448 () tuple2!4596)

(assert (=> d!15624 (= res!41655 (isPrefixOf!0 (_1!2397 lt!77448) (_2!2397 lt!77448)))))

(declare-fun lt!77442 () BitStream!1816)

(assert (=> d!15624 (= lt!77448 (tuple2!4597 lt!77442 (_2!2398 lt!76221)))))

(declare-fun lt!77460 () Unit!3414)

(declare-fun lt!77454 () Unit!3414)

(assert (=> d!15624 (= lt!77460 lt!77454)))

(assert (=> d!15624 (isPrefixOf!0 lt!77442 (_2!2398 lt!76221))))

(assert (=> d!15624 (= lt!77454 (lemmaIsPrefixTransitive!0 lt!77442 (_2!2398 lt!76221) (_2!2398 lt!76221)))))

(declare-fun lt!77452 () Unit!3414)

(declare-fun lt!77455 () Unit!3414)

(assert (=> d!15624 (= lt!77452 lt!77455)))

(assert (=> d!15624 (isPrefixOf!0 lt!77442 (_2!2398 lt!76221))))

(assert (=> d!15624 (= lt!77455 (lemmaIsPrefixTransitive!0 lt!77442 (_2!2398 lt!76219) (_2!2398 lt!76221)))))

(declare-fun lt!77456 () Unit!3414)

(assert (=> d!15624 (= lt!77456 e!32838)))

(declare-fun c!3559 () Bool)

(assert (=> d!15624 (= c!3559 (not (= (size!1048 (buf!1400 (_2!2398 lt!76219))) #b00000000000000000000000000000000)))))

(declare-fun lt!77461 () Unit!3414)

(declare-fun lt!77451 () Unit!3414)

(assert (=> d!15624 (= lt!77461 lt!77451)))

(assert (=> d!15624 (isPrefixOf!0 (_2!2398 lt!76221) (_2!2398 lt!76221))))

(assert (=> d!15624 (= lt!77451 (lemmaIsPrefixRefl!0 (_2!2398 lt!76221)))))

(declare-fun lt!77446 () Unit!3414)

(declare-fun lt!77453 () Unit!3414)

(assert (=> d!15624 (= lt!77446 lt!77453)))

(assert (=> d!15624 (= lt!77453 (lemmaIsPrefixRefl!0 (_2!2398 lt!76221)))))

(declare-fun lt!77457 () Unit!3414)

(declare-fun lt!77450 () Unit!3414)

(assert (=> d!15624 (= lt!77457 lt!77450)))

(assert (=> d!15624 (isPrefixOf!0 lt!77442 lt!77442)))

(assert (=> d!15624 (= lt!77450 (lemmaIsPrefixRefl!0 lt!77442))))

(declare-fun lt!77444 () Unit!3414)

(declare-fun lt!77445 () Unit!3414)

(assert (=> d!15624 (= lt!77444 lt!77445)))

(assert (=> d!15624 (isPrefixOf!0 (_2!2398 lt!76219) (_2!2398 lt!76219))))

(assert (=> d!15624 (= lt!77445 (lemmaIsPrefixRefl!0 (_2!2398 lt!76219)))))

(assert (=> d!15624 (= lt!77442 (BitStream!1817 (buf!1400 (_2!2398 lt!76221)) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219))))))

(assert (=> d!15624 (isPrefixOf!0 (_2!2398 lt!76219) (_2!2398 lt!76221))))

(assert (=> d!15624 (= (reader!0 (_2!2398 lt!76219) (_2!2398 lt!76221)) lt!77448)))

(declare-fun lt!77459 () (_ BitVec 64))

(declare-fun lt!77443 () (_ BitVec 64))

(declare-fun b!49756 () Bool)

(assert (=> b!49756 (= e!32839 (= (_1!2397 lt!77448) (withMovedBitIndex!0 (_2!2397 lt!77448) (bvsub lt!77443 lt!77459))))))

(assert (=> b!49756 (or (= (bvand lt!77443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77459 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77443 lt!77459) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49756 (= lt!77459 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76221))) (currentByte!2917 (_2!2398 lt!76221)) (currentBit!2912 (_2!2398 lt!76221))))))

(assert (=> b!49756 (= lt!77443 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76219))) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219))))))

(declare-fun b!49757 () Bool)

(declare-fun res!41656 () Bool)

(assert (=> b!49757 (=> (not res!41656) (not e!32839))))

(assert (=> b!49757 (= res!41656 (isPrefixOf!0 (_1!2397 lt!77448) (_2!2398 lt!76219)))))

(declare-fun b!49758 () Bool)

(declare-fun res!41654 () Bool)

(assert (=> b!49758 (=> (not res!41654) (not e!32839))))

(assert (=> b!49758 (= res!41654 (isPrefixOf!0 (_2!2397 lt!77448) (_2!2398 lt!76221)))))

(declare-fun b!49759 () Bool)

(declare-fun lt!77447 () Unit!3414)

(assert (=> b!49759 (= e!32838 lt!77447)))

(declare-fun lt!77458 () (_ BitVec 64))

(assert (=> b!49759 (= lt!77458 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77449 () (_ BitVec 64))

(assert (=> b!49759 (= lt!77449 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76219))) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219))))))

(assert (=> b!49759 (= lt!77447 (arrayBitRangesEqSymmetric!0 (buf!1400 (_2!2398 lt!76219)) (buf!1400 (_2!2398 lt!76221)) lt!77458 lt!77449))))

(assert (=> b!49759 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!76221)) (buf!1400 (_2!2398 lt!76219)) lt!77458 lt!77449)))

(assert (= (and d!15624 c!3559) b!49759))

(assert (= (and d!15624 (not c!3559)) b!49755))

(assert (= (and d!15624 res!41655) b!49757))

(assert (= (and b!49757 res!41656) b!49758))

(assert (= (and b!49758 res!41654) b!49756))

(declare-fun m!78021 () Bool)

(assert (=> d!15624 m!78021))

(assert (=> d!15624 m!77939))

(declare-fun m!78023 () Bool)

(assert (=> d!15624 m!78023))

(declare-fun m!78025 () Bool)

(assert (=> d!15624 m!78025))

(assert (=> d!15624 m!77937))

(declare-fun m!78027 () Bool)

(assert (=> d!15624 m!78027))

(declare-fun m!78029 () Bool)

(assert (=> d!15624 m!78029))

(declare-fun m!78031 () Bool)

(assert (=> d!15624 m!78031))

(declare-fun m!78033 () Bool)

(assert (=> d!15624 m!78033))

(declare-fun m!78035 () Bool)

(assert (=> d!15624 m!78035))

(declare-fun m!78037 () Bool)

(assert (=> d!15624 m!78037))

(declare-fun m!78039 () Bool)

(assert (=> b!49758 m!78039))

(assert (=> b!49759 m!76265))

(declare-fun m!78041 () Bool)

(assert (=> b!49759 m!78041))

(declare-fun m!78043 () Bool)

(assert (=> b!49759 m!78043))

(declare-fun m!78045 () Bool)

(assert (=> b!49757 m!78045))

(declare-fun m!78047 () Bool)

(assert (=> b!49756 m!78047))

(assert (=> b!49756 m!76249))

(assert (=> b!49756 m!76265))

(assert (=> b!48973 d!15624))

(declare-fun d!15626 () Bool)

(declare-fun c!3560 () Bool)

(assert (=> d!15626 (= c!3560 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32840 () List!549)

(assert (=> d!15626 (= (byteArrayBitContentToList!0 (_2!2398 lt!76221) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!32840)))

(declare-fun b!49760 () Bool)

(assert (=> b!49760 (= e!32840 Nil!546)))

(declare-fun b!49761 () Bool)

(assert (=> b!49761 (= e!32840 (Cons!545 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2398 lt!76221) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15626 c!3560) b!49760))

(assert (= (and d!15626 (not c!3560)) b!49761))

(assert (=> b!49761 m!76273))

(assert (=> b!49761 m!77679))

(assert (=> b!49761 m!76297))

(assert (=> b!48973 d!15626))

(declare-fun d!15628 () Bool)

(assert (=> d!15628 (= (bitAt!0 (buf!1400 (_2!2398 lt!76219)) lt!76183) (bitAt!0 (buf!1400 (_2!2398 lt!76221)) lt!76183))))

(declare-fun lt!77464 () Unit!3414)

(declare-fun choose!31 (array!2311 array!2311 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3414)

(assert (=> d!15628 (= lt!77464 (choose!31 (buf!1400 (_2!2398 lt!76219)) (buf!1400 (_2!2398 lt!76221)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!76183 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76219))) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219)))))))

(assert (=> d!15628 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76219))) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219)))))))

(assert (=> d!15628 (= (arrayBitRangesEqImpliesEq!0 (buf!1400 (_2!2398 lt!76219)) (buf!1400 (_2!2398 lt!76221)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!76183 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76219))) (currentByte!2917 (_2!2398 lt!76219)) (currentBit!2912 (_2!2398 lt!76219)))) lt!77464)))

(declare-fun bs!3943 () Bool)

(assert (= bs!3943 d!15628))

(assert (=> bs!3943 m!76305))

(assert (=> bs!3943 m!76299))

(assert (=> bs!3943 m!76265))

(declare-fun m!78049 () Bool)

(assert (=> bs!3943 m!78049))

(assert (=> b!48973 d!15628))

(declare-fun b!49762 () Bool)

(declare-fun e!32841 () Unit!3414)

(declare-fun Unit!3470 () Unit!3414)

(assert (=> b!49762 (= e!32841 Unit!3470)))

(declare-fun d!15630 () Bool)

(declare-fun e!32842 () Bool)

(assert (=> d!15630 e!32842))

(declare-fun res!41658 () Bool)

(assert (=> d!15630 (=> (not res!41658) (not e!32842))))

(declare-fun lt!77471 () tuple2!4596)

(assert (=> d!15630 (= res!41658 (isPrefixOf!0 (_1!2397 lt!77471) (_2!2397 lt!77471)))))

(declare-fun lt!77465 () BitStream!1816)

(assert (=> d!15630 (= lt!77471 (tuple2!4597 lt!77465 (_2!2398 lt!76221)))))

(declare-fun lt!77483 () Unit!3414)

(declare-fun lt!77477 () Unit!3414)

(assert (=> d!15630 (= lt!77483 lt!77477)))

(assert (=> d!15630 (isPrefixOf!0 lt!77465 (_2!2398 lt!76221))))

(assert (=> d!15630 (= lt!77477 (lemmaIsPrefixTransitive!0 lt!77465 (_2!2398 lt!76221) (_2!2398 lt!76221)))))

(declare-fun lt!77475 () Unit!3414)

(declare-fun lt!77478 () Unit!3414)

(assert (=> d!15630 (= lt!77475 lt!77478)))

(assert (=> d!15630 (isPrefixOf!0 lt!77465 (_2!2398 lt!76221))))

(assert (=> d!15630 (= lt!77478 (lemmaIsPrefixTransitive!0 lt!77465 (_2!2398 lt!75692) (_2!2398 lt!76221)))))

(declare-fun lt!77479 () Unit!3414)

(assert (=> d!15630 (= lt!77479 e!32841)))

(declare-fun c!3561 () Bool)

(assert (=> d!15630 (= c!3561 (not (= (size!1048 (buf!1400 (_2!2398 lt!75692))) #b00000000000000000000000000000000)))))

(declare-fun lt!77484 () Unit!3414)

(declare-fun lt!77474 () Unit!3414)

(assert (=> d!15630 (= lt!77484 lt!77474)))

(assert (=> d!15630 (isPrefixOf!0 (_2!2398 lt!76221) (_2!2398 lt!76221))))

(assert (=> d!15630 (= lt!77474 (lemmaIsPrefixRefl!0 (_2!2398 lt!76221)))))

(declare-fun lt!77469 () Unit!3414)

(declare-fun lt!77476 () Unit!3414)

(assert (=> d!15630 (= lt!77469 lt!77476)))

(assert (=> d!15630 (= lt!77476 (lemmaIsPrefixRefl!0 (_2!2398 lt!76221)))))

(declare-fun lt!77480 () Unit!3414)

(declare-fun lt!77473 () Unit!3414)

(assert (=> d!15630 (= lt!77480 lt!77473)))

(assert (=> d!15630 (isPrefixOf!0 lt!77465 lt!77465)))

(assert (=> d!15630 (= lt!77473 (lemmaIsPrefixRefl!0 lt!77465))))

(declare-fun lt!77467 () Unit!3414)

(declare-fun lt!77468 () Unit!3414)

(assert (=> d!15630 (= lt!77467 lt!77468)))

(assert (=> d!15630 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!75692))))

(assert (=> d!15630 (= lt!77468 (lemmaIsPrefixRefl!0 (_2!2398 lt!75692)))))

(assert (=> d!15630 (= lt!77465 (BitStream!1817 (buf!1400 (_2!2398 lt!76221)) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(assert (=> d!15630 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!76221))))

(assert (=> d!15630 (= (reader!0 (_2!2398 lt!75692) (_2!2398 lt!76221)) lt!77471)))

(declare-fun lt!77466 () (_ BitVec 64))

(declare-fun lt!77482 () (_ BitVec 64))

(declare-fun b!49763 () Bool)

(assert (=> b!49763 (= e!32842 (= (_1!2397 lt!77471) (withMovedBitIndex!0 (_2!2397 lt!77471) (bvsub lt!77466 lt!77482))))))

(assert (=> b!49763 (or (= (bvand lt!77466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77482 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77466 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77466 lt!77482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49763 (= lt!77482 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76221))) (currentByte!2917 (_2!2398 lt!76221)) (currentBit!2912 (_2!2398 lt!76221))))))

(assert (=> b!49763 (= lt!77466 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(declare-fun b!49764 () Bool)

(declare-fun res!41659 () Bool)

(assert (=> b!49764 (=> (not res!41659) (not e!32842))))

(assert (=> b!49764 (= res!41659 (isPrefixOf!0 (_1!2397 lt!77471) (_2!2398 lt!75692)))))

(declare-fun b!49765 () Bool)

(declare-fun res!41657 () Bool)

(assert (=> b!49765 (=> (not res!41657) (not e!32842))))

(assert (=> b!49765 (= res!41657 (isPrefixOf!0 (_2!2397 lt!77471) (_2!2398 lt!76221)))))

(declare-fun b!49766 () Bool)

(declare-fun lt!77470 () Unit!3414)

(assert (=> b!49766 (= e!32841 lt!77470)))

(declare-fun lt!77481 () (_ BitVec 64))

(assert (=> b!49766 (= lt!77481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77472 () (_ BitVec 64))

(assert (=> b!49766 (= lt!77472 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(assert (=> b!49766 (= lt!77470 (arrayBitRangesEqSymmetric!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (_2!2398 lt!76221)) lt!77481 lt!77472))))

(assert (=> b!49766 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!76221)) (buf!1400 (_2!2398 lt!75692)) lt!77481 lt!77472)))

(assert (= (and d!15630 c!3561) b!49766))

(assert (= (and d!15630 (not c!3561)) b!49762))

(assert (= (and d!15630 res!41658) b!49764))

(assert (= (and b!49764 res!41659) b!49765))

(assert (= (and b!49765 res!41657) b!49763))

(declare-fun m!78051 () Bool)

(assert (=> d!15630 m!78051))

(assert (=> d!15630 m!76241))

(assert (=> d!15630 m!78023))

(declare-fun m!78053 () Bool)

(assert (=> d!15630 m!78053))

(assert (=> d!15630 m!76239))

(declare-fun m!78055 () Bool)

(assert (=> d!15630 m!78055))

(declare-fun m!78057 () Bool)

(assert (=> d!15630 m!78057))

(assert (=> d!15630 m!76301))

(declare-fun m!78059 () Bool)

(assert (=> d!15630 m!78059))

(declare-fun m!78061 () Bool)

(assert (=> d!15630 m!78061))

(assert (=> d!15630 m!78037))

(declare-fun m!78063 () Bool)

(assert (=> b!49765 m!78063))

(assert (=> b!49766 m!75847))

(declare-fun m!78065 () Bool)

(assert (=> b!49766 m!78065))

(declare-fun m!78067 () Bool)

(assert (=> b!49766 m!78067))

(declare-fun m!78069 () Bool)

(assert (=> b!49764 m!78069))

(declare-fun m!78071 () Bool)

(assert (=> b!49763 m!78071))

(assert (=> b!49763 m!76249))

(assert (=> b!49763 m!75847))

(assert (=> b!48973 d!15630))

(declare-fun d!15632 () Bool)

(declare-fun c!3562 () Bool)

(assert (=> d!15632 (= c!3562 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32843 () List!549)

(assert (=> d!15632 (= (byteArrayBitContentToList!0 (_2!2398 lt!76219) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) e!32843)))

(declare-fun b!49767 () Bool)

(assert (=> b!49767 (= e!32843 Nil!546)))

(declare-fun b!49768 () Bool)

(assert (=> b!49768 (= e!32843 (Cons!545 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2398 lt!76219) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15632 c!3562) b!49767))

(assert (= (and d!15632 (not c!3562)) b!49768))

(assert (=> b!49768 m!76273))

(assert (=> b!49768 m!77679))

(declare-fun m!78073 () Bool)

(assert (=> b!49768 m!78073))

(assert (=> b!48973 d!15632))

(declare-fun d!15634 () Bool)

(declare-fun e!32844 () Bool)

(assert (=> d!15634 e!32844))

(declare-fun res!41660 () Bool)

(assert (=> d!15634 (=> (not res!41660) (not e!32844))))

(declare-fun lt!77488 () (_ BitVec 64))

(declare-fun lt!77486 () (_ BitVec 64))

(declare-fun lt!77487 () (_ BitVec 64))

(assert (=> d!15634 (= res!41660 (= lt!77488 (bvsub lt!77486 lt!77487)))))

(assert (=> d!15634 (or (= (bvand lt!77486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77486 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77486 lt!77487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15634 (= lt!77487 (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76560)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76560))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76560)))))))

(declare-fun lt!77490 () (_ BitVec 64))

(declare-fun lt!77489 () (_ BitVec 64))

(assert (=> d!15634 (= lt!77486 (bvmul lt!77490 lt!77489))))

(assert (=> d!15634 (or (= lt!77490 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77489 (bvsdiv (bvmul lt!77490 lt!77489) lt!77490)))))

(assert (=> d!15634 (= lt!77489 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15634 (= lt!77490 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76560)))))))

(assert (=> d!15634 (= lt!77488 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!76560))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!76560)))))))

(assert (=> d!15634 (invariant!0 (currentBit!2912 (_2!2398 lt!76560)) (currentByte!2917 (_2!2398 lt!76560)) (size!1048 (buf!1400 (_2!2398 lt!76560))))))

(assert (=> d!15634 (= (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76560))) (currentByte!2917 (_2!2398 lt!76560)) (currentBit!2912 (_2!2398 lt!76560))) lt!77488)))

(declare-fun b!49769 () Bool)

(declare-fun res!41661 () Bool)

(assert (=> b!49769 (=> (not res!41661) (not e!32844))))

(assert (=> b!49769 (= res!41661 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77488))))

(declare-fun b!49770 () Bool)

(declare-fun lt!77485 () (_ BitVec 64))

(assert (=> b!49770 (= e!32844 (bvsle lt!77488 (bvmul lt!77485 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49770 (or (= lt!77485 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77485 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77485)))))

(assert (=> b!49770 (= lt!77485 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76560)))))))

(assert (= (and d!15634 res!41660) b!49769))

(assert (= (and b!49769 res!41661) b!49770))

(declare-fun m!78075 () Bool)

(assert (=> d!15634 m!78075))

(assert (=> d!15634 m!77663))

(assert (=> b!49152 d!15634))

(assert (=> b!49152 d!15014))

(assert (=> d!15028 d!14968))

(declare-fun d!15636 () Bool)

(assert (=> d!15636 (isPrefixOf!0 lt!76337 lt!76337)))

(declare-fun lt!77491 () Unit!3414)

(assert (=> d!15636 (= lt!77491 (choose!11 lt!76337))))

(assert (=> d!15636 (= (lemmaIsPrefixRefl!0 lt!76337) lt!77491)))

(declare-fun bs!3944 () Bool)

(assert (= bs!3944 d!15636))

(assert (=> bs!3944 m!76375))

(declare-fun m!78077 () Bool)

(assert (=> bs!3944 m!78077))

(assert (=> d!15028 d!15636))

(declare-fun d!15638 () Bool)

(assert (=> d!15638 (isPrefixOf!0 lt!76337 (_2!2398 lt!75689))))

(declare-fun lt!77492 () Unit!3414)

(assert (=> d!15638 (= lt!77492 (choose!30 lt!76337 (_2!2398 lt!75689) (_2!2398 lt!75689)))))

(assert (=> d!15638 (isPrefixOf!0 lt!76337 (_2!2398 lt!75689))))

(assert (=> d!15638 (= (lemmaIsPrefixTransitive!0 lt!76337 (_2!2398 lt!75689) (_2!2398 lt!75689)) lt!77492)))

(declare-fun bs!3945 () Bool)

(assert (= bs!3945 d!15638))

(assert (=> bs!3945 m!76373))

(declare-fun m!78079 () Bool)

(assert (=> bs!3945 m!78079))

(assert (=> bs!3945 m!76373))

(assert (=> d!15028 d!15638))

(declare-fun d!15640 () Bool)

(declare-fun res!41662 () Bool)

(declare-fun e!32845 () Bool)

(assert (=> d!15640 (=> (not res!41662) (not e!32845))))

(assert (=> d!15640 (= res!41662 (= (size!1048 (buf!1400 lt!76337)) (size!1048 (buf!1400 lt!76337))))))

(assert (=> d!15640 (= (isPrefixOf!0 lt!76337 lt!76337) e!32845)))

(declare-fun b!49771 () Bool)

(declare-fun res!41664 () Bool)

(assert (=> b!49771 (=> (not res!41664) (not e!32845))))

(assert (=> b!49771 (= res!41664 (bvsle (bitIndex!0 (size!1048 (buf!1400 lt!76337)) (currentByte!2917 lt!76337) (currentBit!2912 lt!76337)) (bitIndex!0 (size!1048 (buf!1400 lt!76337)) (currentByte!2917 lt!76337) (currentBit!2912 lt!76337))))))

(declare-fun b!49772 () Bool)

(declare-fun e!32846 () Bool)

(assert (=> b!49772 (= e!32845 e!32846)))

(declare-fun res!41663 () Bool)

(assert (=> b!49772 (=> res!41663 e!32846)))

(assert (=> b!49772 (= res!41663 (= (size!1048 (buf!1400 lt!76337)) #b00000000000000000000000000000000))))

(declare-fun b!49773 () Bool)

(assert (=> b!49773 (= e!32846 (arrayBitRangesEq!0 (buf!1400 lt!76337) (buf!1400 lt!76337) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 lt!76337)) (currentByte!2917 lt!76337) (currentBit!2912 lt!76337))))))

(assert (= (and d!15640 res!41662) b!49771))

(assert (= (and b!49771 res!41664) b!49772))

(assert (= (and b!49772 (not res!41663)) b!49773))

(declare-fun m!78081 () Bool)

(assert (=> b!49771 m!78081))

(assert (=> b!49771 m!78081))

(assert (=> b!49773 m!78081))

(assert (=> b!49773 m!78081))

(declare-fun m!78083 () Bool)

(assert (=> b!49773 m!78083))

(assert (=> d!15028 d!15640))

(declare-fun d!15642 () Bool)

(assert (=> d!15642 (isPrefixOf!0 lt!76337 (_2!2398 lt!75689))))

(declare-fun lt!77493 () Unit!3414)

(assert (=> d!15642 (= lt!77493 (choose!30 lt!76337 (_2!2398 lt!75692) (_2!2398 lt!75689)))))

(assert (=> d!15642 (isPrefixOf!0 lt!76337 (_2!2398 lt!75692))))

(assert (=> d!15642 (= (lemmaIsPrefixTransitive!0 lt!76337 (_2!2398 lt!75692) (_2!2398 lt!75689)) lt!77493)))

(declare-fun bs!3946 () Bool)

(assert (= bs!3946 d!15642))

(assert (=> bs!3946 m!76373))

(declare-fun m!78085 () Bool)

(assert (=> bs!3946 m!78085))

(declare-fun m!78087 () Bool)

(assert (=> bs!3946 m!78087))

(assert (=> d!15028 d!15642))

(declare-fun d!15644 () Bool)

(declare-fun res!41665 () Bool)

(declare-fun e!32847 () Bool)

(assert (=> d!15644 (=> (not res!41665) (not e!32847))))

(assert (=> d!15644 (= res!41665 (= (size!1048 (buf!1400 (_2!2398 lt!75689))) (size!1048 (buf!1400 (_2!2398 lt!75689)))))))

(assert (=> d!15644 (= (isPrefixOf!0 (_2!2398 lt!75689) (_2!2398 lt!75689)) e!32847)))

(declare-fun b!49774 () Bool)

(declare-fun res!41667 () Bool)

(assert (=> b!49774 (=> (not res!41667) (not e!32847))))

(assert (=> b!49774 (= res!41667 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689)))))))

(declare-fun b!49775 () Bool)

(declare-fun e!32848 () Bool)

(assert (=> b!49775 (= e!32847 e!32848)))

(declare-fun res!41666 () Bool)

(assert (=> b!49775 (=> res!41666 e!32848)))

(assert (=> b!49775 (= res!41666 (= (size!1048 (buf!1400 (_2!2398 lt!75689))) #b00000000000000000000000000000000))))

(declare-fun b!49776 () Bool)

(assert (=> b!49776 (= e!32848 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75689)) (buf!1400 (_2!2398 lt!75689)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689)))))))

(assert (= (and d!15644 res!41665) b!49774))

(assert (= (and b!49774 res!41667) b!49775))

(assert (= (and b!49775 (not res!41666)) b!49776))

(assert (=> b!49774 m!75797))

(assert (=> b!49774 m!75797))

(assert (=> b!49776 m!75797))

(assert (=> b!49776 m!75797))

(declare-fun m!78089 () Bool)

(assert (=> b!49776 m!78089))

(assert (=> d!15028 d!15644))

(declare-fun d!15646 () Bool)

(declare-fun res!41668 () Bool)

(declare-fun e!32849 () Bool)

(assert (=> d!15646 (=> (not res!41668) (not e!32849))))

(assert (=> d!15646 (= res!41668 (= (size!1048 (buf!1400 (_1!2397 lt!76343))) (size!1048 (buf!1400 (_2!2397 lt!76343)))))))

(assert (=> d!15646 (= (isPrefixOf!0 (_1!2397 lt!76343) (_2!2397 lt!76343)) e!32849)))

(declare-fun b!49777 () Bool)

(declare-fun res!41670 () Bool)

(assert (=> b!49777 (=> (not res!41670) (not e!32849))))

(assert (=> b!49777 (= res!41670 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76343))) (currentByte!2917 (_1!2397 lt!76343)) (currentBit!2912 (_1!2397 lt!76343))) (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76343))) (currentByte!2917 (_2!2397 lt!76343)) (currentBit!2912 (_2!2397 lt!76343)))))))

(declare-fun b!49778 () Bool)

(declare-fun e!32850 () Bool)

(assert (=> b!49778 (= e!32849 e!32850)))

(declare-fun res!41669 () Bool)

(assert (=> b!49778 (=> res!41669 e!32850)))

(assert (=> b!49778 (= res!41669 (= (size!1048 (buf!1400 (_1!2397 lt!76343))) #b00000000000000000000000000000000))))

(declare-fun b!49779 () Bool)

(assert (=> b!49779 (= e!32850 (arrayBitRangesEq!0 (buf!1400 (_1!2397 lt!76343)) (buf!1400 (_2!2397 lt!76343)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76343))) (currentByte!2917 (_1!2397 lt!76343)) (currentBit!2912 (_1!2397 lt!76343)))))))

(assert (= (and d!15646 res!41668) b!49777))

(assert (= (and b!49777 res!41670) b!49778))

(assert (= (and b!49778 (not res!41669)) b!49779))

(assert (=> b!49777 m!77793))

(declare-fun m!78091 () Bool)

(assert (=> b!49777 m!78091))

(assert (=> b!49779 m!77793))

(assert (=> b!49779 m!77793))

(declare-fun m!78093 () Bool)

(assert (=> b!49779 m!78093))

(assert (=> d!15028 d!15646))

(assert (=> d!15028 d!15470))

(assert (=> d!15028 d!15472))

(declare-fun d!15648 () Bool)

(declare-fun res!41671 () Bool)

(declare-fun e!32851 () Bool)

(assert (=> d!15648 (=> (not res!41671) (not e!32851))))

(assert (=> d!15648 (= res!41671 (= (size!1048 (buf!1400 lt!76337)) (size!1048 (buf!1400 (_2!2398 lt!75689)))))))

(assert (=> d!15648 (= (isPrefixOf!0 lt!76337 (_2!2398 lt!75689)) e!32851)))

(declare-fun b!49780 () Bool)

(declare-fun res!41673 () Bool)

(assert (=> b!49780 (=> (not res!41673) (not e!32851))))

(assert (=> b!49780 (= res!41673 (bvsle (bitIndex!0 (size!1048 (buf!1400 lt!76337)) (currentByte!2917 lt!76337) (currentBit!2912 lt!76337)) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689)))))))

(declare-fun b!49781 () Bool)

(declare-fun e!32852 () Bool)

(assert (=> b!49781 (= e!32851 e!32852)))

(declare-fun res!41672 () Bool)

(assert (=> b!49781 (=> res!41672 e!32852)))

(assert (=> b!49781 (= res!41672 (= (size!1048 (buf!1400 lt!76337)) #b00000000000000000000000000000000))))

(declare-fun b!49782 () Bool)

(assert (=> b!49782 (= e!32852 (arrayBitRangesEq!0 (buf!1400 lt!76337) (buf!1400 (_2!2398 lt!75689)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 lt!76337)) (currentByte!2917 lt!76337) (currentBit!2912 lt!76337))))))

(assert (= (and d!15648 res!41671) b!49780))

(assert (= (and b!49780 res!41673) b!49781))

(assert (= (and b!49781 (not res!41672)) b!49782))

(assert (=> b!49780 m!78081))

(assert (=> b!49780 m!75797))

(assert (=> b!49782 m!78081))

(assert (=> b!49782 m!78081))

(declare-fun m!78095 () Bool)

(assert (=> b!49782 m!78095))

(assert (=> d!15028 d!15648))

(declare-fun d!15650 () Bool)

(assert (=> d!15650 (isPrefixOf!0 (_2!2398 lt!75689) (_2!2398 lt!75689))))

(declare-fun lt!77494 () Unit!3414)

(assert (=> d!15650 (= lt!77494 (choose!11 (_2!2398 lt!75689)))))

(assert (=> d!15650 (= (lemmaIsPrefixRefl!0 (_2!2398 lt!75689)) lt!77494)))

(declare-fun bs!3947 () Bool)

(assert (= bs!3947 d!15650))

(assert (=> bs!3947 m!76377))

(declare-fun m!78097 () Bool)

(assert (=> bs!3947 m!78097))

(assert (=> d!15028 d!15650))

(assert (=> b!49088 d!15014))

(declare-fun d!15652 () Bool)

(assert (=> d!15652 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75689)) (buf!1400 thiss!1379) lt!76501 lt!76492)))

(declare-fun lt!77495 () Unit!3414)

(assert (=> d!15652 (= lt!77495 (choose!8 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75689)) lt!76501 lt!76492))))

(assert (=> d!15652 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76501) (bvsle lt!76501 lt!76492))))

(assert (=> d!15652 (= (arrayBitRangesEqSymmetric!0 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75689)) lt!76501 lt!76492) lt!77495)))

(declare-fun bs!3948 () Bool)

(assert (= bs!3948 d!15652))

(assert (=> bs!3948 m!76539))

(declare-fun m!78099 () Bool)

(assert (=> bs!3948 m!78099))

(assert (=> b!49088 d!15652))

(declare-fun b!49783 () Bool)

(declare-fun e!32855 () Bool)

(declare-fun e!32858 () Bool)

(assert (=> b!49783 (= e!32855 e!32858)))

(declare-fun c!3563 () Bool)

(declare-fun lt!77497 () tuple4!22)

(assert (=> b!49783 (= c!3563 (= (_3!102 lt!77497) (_4!11 lt!77497)))))

(declare-fun b!49784 () Bool)

(declare-fun e!32854 () Bool)

(assert (=> b!49784 (= e!32854 e!32855)))

(declare-fun res!41674 () Bool)

(assert (=> b!49784 (=> (not res!41674) (not e!32855))))

(declare-fun e!32856 () Bool)

(assert (=> b!49784 (= res!41674 e!32856)))

(declare-fun res!41675 () Bool)

(assert (=> b!49784 (=> res!41675 e!32856)))

(assert (=> b!49784 (= res!41675 (bvsge (_1!2418 lt!77497) (_2!2418 lt!77497)))))

(declare-fun lt!77496 () (_ BitVec 32))

(assert (=> b!49784 (= lt!77496 ((_ extract 31 0) (bvsrem lt!76492 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!77498 () (_ BitVec 32))

(assert (=> b!49784 (= lt!77498 ((_ extract 31 0) (bvsrem lt!76501 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49784 (= lt!77497 (arrayBitIndices!0 lt!76501 lt!76492))))

(declare-fun b!49785 () Bool)

(declare-fun res!41676 () Bool)

(assert (=> b!49785 (= res!41676 (= lt!77496 #b00000000000000000000000000000000))))

(declare-fun e!32853 () Bool)

(assert (=> b!49785 (=> res!41676 e!32853)))

(declare-fun e!32857 () Bool)

(assert (=> b!49785 (= e!32857 e!32853)))

(declare-fun d!15654 () Bool)

(declare-fun res!41678 () Bool)

(assert (=> d!15654 (=> res!41678 e!32854)))

(assert (=> d!15654 (= res!41678 (bvsge lt!76501 lt!76492))))

(assert (=> d!15654 (= (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75689)) (buf!1400 thiss!1379) lt!76501 lt!76492) e!32854)))

(declare-fun call!638 () Bool)

(declare-fun bm!635 () Bool)

(assert (=> bm!635 (= call!638 (byteRangesEq!0 (select (arr!1574 (buf!1400 (_2!2398 lt!75689))) (_3!102 lt!77497)) (select (arr!1574 (buf!1400 thiss!1379)) (_3!102 lt!77497)) lt!77498 (ite c!3563 lt!77496 #b00000000000000000000000000001000)))))

(declare-fun b!49786 () Bool)

(assert (=> b!49786 (= e!32856 (arrayRangesEq!12 (buf!1400 (_2!2398 lt!75689)) (buf!1400 thiss!1379) (_1!2418 lt!77497) (_2!2418 lt!77497)))))

(declare-fun b!49787 () Bool)

(assert (=> b!49787 (= e!32858 e!32857)))

(declare-fun res!41677 () Bool)

(assert (=> b!49787 (= res!41677 call!638)))

(assert (=> b!49787 (=> (not res!41677) (not e!32857))))

(declare-fun b!49788 () Bool)

(assert (=> b!49788 (= e!32853 (byteRangesEq!0 (select (arr!1574 (buf!1400 (_2!2398 lt!75689))) (_4!11 lt!77497)) (select (arr!1574 (buf!1400 thiss!1379)) (_4!11 lt!77497)) #b00000000000000000000000000000000 lt!77496))))

(declare-fun b!49789 () Bool)

(assert (=> b!49789 (= e!32858 call!638)))

(assert (= (and d!15654 (not res!41678)) b!49784))

(assert (= (and b!49784 (not res!41675)) b!49786))

(assert (= (and b!49784 res!41674) b!49783))

(assert (= (and b!49783 c!3563) b!49789))

(assert (= (and b!49783 (not c!3563)) b!49787))

(assert (= (and b!49787 res!41677) b!49785))

(assert (= (and b!49785 (not res!41676)) b!49788))

(assert (= (or b!49789 b!49787) bm!635))

(declare-fun m!78101 () Bool)

(assert (=> b!49784 m!78101))

(declare-fun m!78103 () Bool)

(assert (=> bm!635 m!78103))

(declare-fun m!78105 () Bool)

(assert (=> bm!635 m!78105))

(assert (=> bm!635 m!78103))

(assert (=> bm!635 m!78105))

(declare-fun m!78107 () Bool)

(assert (=> bm!635 m!78107))

(declare-fun m!78109 () Bool)

(assert (=> b!49786 m!78109))

(declare-fun m!78111 () Bool)

(assert (=> b!49788 m!78111))

(declare-fun m!78113 () Bool)

(assert (=> b!49788 m!78113))

(assert (=> b!49788 m!78111))

(assert (=> b!49788 m!78113))

(declare-fun m!78115 () Bool)

(assert (=> b!49788 m!78115))

(assert (=> b!49088 d!15654))

(declare-fun d!15656 () Bool)

(assert (=> d!15656 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3949 () Bool)

(assert (= bs!3949 d!15656))

(assert (=> bs!3949 m!76091))

(assert (=> b!49109 d!15656))

(assert (=> d!15014 d!15480))

(declare-fun d!15658 () Bool)

(assert (=> d!15658 (= (invariant!0 (currentBit!2912 thiss!1379) (currentByte!2917 thiss!1379) (size!1048 (buf!1400 thiss!1379))) (and (bvsge (currentBit!2912 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2912 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2917 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2917 thiss!1379) (size!1048 (buf!1400 thiss!1379))) (and (= (currentBit!2912 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2917 thiss!1379) (size!1048 (buf!1400 thiss!1379)))))))))

(assert (=> d!15014 d!15658))

(declare-fun d!15660 () Bool)

(declare-fun res!41679 () Bool)

(declare-fun e!32859 () Bool)

(assert (=> d!15660 (=> (not res!41679) (not e!32859))))

(assert (=> d!15660 (= res!41679 (= (size!1048 (buf!1400 (_1!2397 lt!76491))) (size!1048 (buf!1400 thiss!1379))))))

(assert (=> d!15660 (= (isPrefixOf!0 (_1!2397 lt!76491) thiss!1379) e!32859)))

(declare-fun b!49790 () Bool)

(declare-fun res!41681 () Bool)

(assert (=> b!49790 (=> (not res!41681) (not e!32859))))

(assert (=> b!49790 (= res!41681 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76491))) (currentByte!2917 (_1!2397 lt!76491)) (currentBit!2912 (_1!2397 lt!76491))) (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(declare-fun b!49791 () Bool)

(declare-fun e!32860 () Bool)

(assert (=> b!49791 (= e!32859 e!32860)))

(declare-fun res!41680 () Bool)

(assert (=> b!49791 (=> res!41680 e!32860)))

(assert (=> b!49791 (= res!41680 (= (size!1048 (buf!1400 (_1!2397 lt!76491))) #b00000000000000000000000000000000))))

(declare-fun b!49792 () Bool)

(assert (=> b!49792 (= e!32860 (arrayBitRangesEq!0 (buf!1400 (_1!2397 lt!76491)) (buf!1400 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76491))) (currentByte!2917 (_1!2397 lt!76491)) (currentBit!2912 (_1!2397 lt!76491)))))))

(assert (= (and d!15660 res!41679) b!49790))

(assert (= (and b!49790 res!41681) b!49791))

(assert (= (and b!49791 (not res!41680)) b!49792))

(declare-fun m!78117 () Bool)

(assert (=> b!49790 m!78117))

(assert (=> b!49790 m!75803))

(assert (=> b!49792 m!78117))

(assert (=> b!49792 m!78117))

(declare-fun m!78119 () Bool)

(assert (=> b!49792 m!78119))

(assert (=> b!49086 d!15660))

(declare-fun d!15662 () Bool)

(declare-fun e!32861 () Bool)

(assert (=> d!15662 e!32861))

(declare-fun c!3564 () Bool)

(assert (=> d!15662 (= c!3564 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77499 () List!549)

(declare-fun e!32862 () tuple2!4618)

(assert (=> d!15662 (= lt!77499 (_1!2408 e!32862))))

(declare-fun c!3565 () Bool)

(assert (=> d!15662 (= c!3565 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15662 (bvsge (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15662 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_1!2397 lt!75701) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!77499)))

(declare-fun b!49795 () Bool)

(assert (=> b!49795 (= e!32861 (isEmpty!144 lt!77499))))

(declare-fun b!49793 () Bool)

(assert (=> b!49793 (= e!32862 (tuple2!4619 Nil!546 (_1!2397 lt!75701)))))

(declare-fun b!49796 () Bool)

(assert (=> b!49796 (= e!32861 (> (length!244 lt!77499) 0))))

(declare-fun lt!77500 () tuple2!4620)

(declare-fun lt!77501 () (_ BitVec 64))

(declare-fun b!49794 () Bool)

(assert (=> b!49794 (= e!32862 (tuple2!4619 (Cons!545 (_1!2409 lt!77500) (bitStreamReadBitsIntoList!0 (_2!2398 lt!75689) (_2!2409 lt!77500) (bvsub (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!77501))) (_2!2409 lt!77500)))))

(assert (=> b!49794 (= lt!77500 (readBit!0 (_1!2397 lt!75701)))))

(assert (=> b!49794 (= lt!77501 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15662 c!3565) b!49793))

(assert (= (and d!15662 (not c!3565)) b!49794))

(assert (= (and d!15662 c!3564) b!49795))

(assert (= (and d!15662 (not c!3564)) b!49796))

(declare-fun m!78121 () Bool)

(assert (=> b!49795 m!78121))

(declare-fun m!78123 () Bool)

(assert (=> b!49796 m!78123))

(declare-fun m!78125 () Bool)

(assert (=> b!49794 m!78125))

(assert (=> b!49794 m!76463))

(assert (=> b!48886 d!15662))

(assert (=> b!48886 d!14958))

(declare-fun d!15664 () Bool)

(assert (=> d!15664 (= (isEmpty!144 lt!76571) (is-Nil!546 lt!76571))))

(assert (=> b!49163 d!15664))

(assert (=> b!49001 d!15014))

(declare-fun d!15666 () Bool)

(assert (=> d!15666 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 thiss!1379) lt!76297 lt!76288)))

(declare-fun lt!77502 () Unit!3414)

(assert (=> d!15666 (= lt!77502 (choose!8 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75692)) lt!76297 lt!76288))))

(assert (=> d!15666 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!76297) (bvsle lt!76297 lt!76288))))

(assert (=> d!15666 (= (arrayBitRangesEqSymmetric!0 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!75692)) lt!76297 lt!76288) lt!77502)))

(declare-fun bs!3950 () Bool)

(assert (= bs!3950 d!15666))

(assert (=> bs!3950 m!76343))

(declare-fun m!78127 () Bool)

(assert (=> bs!3950 m!78127))

(assert (=> b!49001 d!15666))

(declare-fun b!49797 () Bool)

(declare-fun e!32865 () Bool)

(declare-fun e!32868 () Bool)

(assert (=> b!49797 (= e!32865 e!32868)))

(declare-fun c!3566 () Bool)

(declare-fun lt!77504 () tuple4!22)

(assert (=> b!49797 (= c!3566 (= (_3!102 lt!77504) (_4!11 lt!77504)))))

(declare-fun b!49798 () Bool)

(declare-fun e!32864 () Bool)

(assert (=> b!49798 (= e!32864 e!32865)))

(declare-fun res!41682 () Bool)

(assert (=> b!49798 (=> (not res!41682) (not e!32865))))

(declare-fun e!32866 () Bool)

(assert (=> b!49798 (= res!41682 e!32866)))

(declare-fun res!41683 () Bool)

(assert (=> b!49798 (=> res!41683 e!32866)))

(assert (=> b!49798 (= res!41683 (bvsge (_1!2418 lt!77504) (_2!2418 lt!77504)))))

(declare-fun lt!77503 () (_ BitVec 32))

(assert (=> b!49798 (= lt!77503 ((_ extract 31 0) (bvsrem lt!76288 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!77505 () (_ BitVec 32))

(assert (=> b!49798 (= lt!77505 ((_ extract 31 0) (bvsrem lt!76297 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49798 (= lt!77504 (arrayBitIndices!0 lt!76297 lt!76288))))

(declare-fun b!49799 () Bool)

(declare-fun res!41684 () Bool)

(assert (=> b!49799 (= res!41684 (= lt!77503 #b00000000000000000000000000000000))))

(declare-fun e!32863 () Bool)

(assert (=> b!49799 (=> res!41684 e!32863)))

(declare-fun e!32867 () Bool)

(assert (=> b!49799 (= e!32867 e!32863)))

(declare-fun d!15668 () Bool)

(declare-fun res!41686 () Bool)

(assert (=> d!15668 (=> res!41686 e!32864)))

(assert (=> d!15668 (= res!41686 (bvsge lt!76297 lt!76288))))

(assert (=> d!15668 (= (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 thiss!1379) lt!76297 lt!76288) e!32864)))

(declare-fun call!639 () Bool)

(declare-fun bm!636 () Bool)

(assert (=> bm!636 (= call!639 (byteRangesEq!0 (select (arr!1574 (buf!1400 (_2!2398 lt!75692))) (_3!102 lt!77504)) (select (arr!1574 (buf!1400 thiss!1379)) (_3!102 lt!77504)) lt!77505 (ite c!3566 lt!77503 #b00000000000000000000000000001000)))))

(declare-fun b!49800 () Bool)

(assert (=> b!49800 (= e!32866 (arrayRangesEq!12 (buf!1400 (_2!2398 lt!75692)) (buf!1400 thiss!1379) (_1!2418 lt!77504) (_2!2418 lt!77504)))))

(declare-fun b!49801 () Bool)

(assert (=> b!49801 (= e!32868 e!32867)))

(declare-fun res!41685 () Bool)

(assert (=> b!49801 (= res!41685 call!639)))

(assert (=> b!49801 (=> (not res!41685) (not e!32867))))

(declare-fun b!49802 () Bool)

(assert (=> b!49802 (= e!32863 (byteRangesEq!0 (select (arr!1574 (buf!1400 (_2!2398 lt!75692))) (_4!11 lt!77504)) (select (arr!1574 (buf!1400 thiss!1379)) (_4!11 lt!77504)) #b00000000000000000000000000000000 lt!77503))))

(declare-fun b!49803 () Bool)

(assert (=> b!49803 (= e!32868 call!639)))

(assert (= (and d!15668 (not res!41686)) b!49798))

(assert (= (and b!49798 (not res!41683)) b!49800))

(assert (= (and b!49798 res!41682) b!49797))

(assert (= (and b!49797 c!3566) b!49803))

(assert (= (and b!49797 (not c!3566)) b!49801))

(assert (= (and b!49801 res!41685) b!49799))

(assert (= (and b!49799 (not res!41684)) b!49802))

(assert (= (or b!49803 b!49801) bm!636))

(declare-fun m!78129 () Bool)

(assert (=> b!49798 m!78129))

(declare-fun m!78131 () Bool)

(assert (=> bm!636 m!78131))

(declare-fun m!78133 () Bool)

(assert (=> bm!636 m!78133))

(assert (=> bm!636 m!78131))

(assert (=> bm!636 m!78133))

(declare-fun m!78135 () Bool)

(assert (=> bm!636 m!78135))

(declare-fun m!78137 () Bool)

(assert (=> b!49800 m!78137))

(declare-fun m!78139 () Bool)

(assert (=> b!49802 m!78139))

(declare-fun m!78141 () Bool)

(assert (=> b!49802 m!78141))

(assert (=> b!49802 m!78139))

(assert (=> b!49802 m!78141))

(declare-fun m!78143 () Bool)

(assert (=> b!49802 m!78143))

(assert (=> b!49001 d!15668))

(declare-fun d!15670 () Bool)

(assert (=> d!15670 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75692)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!15670 true))

(declare-fun _$1!303 () Unit!3414)

(assert (=> d!15670 (= (choose!27 thiss!1379 (_2!2398 lt!75692) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!303)))

(declare-fun bs!3951 () Bool)

(assert (= bs!3951 d!15670))

(assert (=> bs!3951 m!76553))

(assert (=> d!15072 d!15670))

(declare-fun d!15672 () Bool)

(declare-fun res!41687 () Bool)

(declare-fun e!32869 () Bool)

(assert (=> d!15672 (=> (not res!41687) (not e!32869))))

(assert (=> d!15672 (= res!41687 (= (size!1048 (buf!1400 thiss!1379)) (size!1048 (buf!1400 (_2!2398 lt!76561)))))))

(assert (=> d!15672 (= (isPrefixOf!0 thiss!1379 (_2!2398 lt!76561)) e!32869)))

(declare-fun b!49804 () Bool)

(declare-fun res!41689 () Bool)

(assert (=> b!49804 (=> (not res!41689) (not e!32869))))

(assert (=> b!49804 (= res!41689 (bvsle (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76561))) (currentByte!2917 (_2!2398 lt!76561)) (currentBit!2912 (_2!2398 lt!76561)))))))

(declare-fun b!49805 () Bool)

(declare-fun e!32870 () Bool)

(assert (=> b!49805 (= e!32869 e!32870)))

(declare-fun res!41688 () Bool)

(assert (=> b!49805 (=> res!41688 e!32870)))

(assert (=> b!49805 (= res!41688 (= (size!1048 (buf!1400 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!49806 () Bool)

(assert (=> b!49806 (= e!32870 (arrayBitRangesEq!0 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!76561)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(assert (= (and d!15672 res!41687) b!49804))

(assert (= (and b!49804 res!41689) b!49805))

(assert (= (and b!49805 (not res!41688)) b!49806))

(assert (=> b!49804 m!75803))

(assert (=> b!49804 m!76613))

(assert (=> b!49806 m!75803))

(assert (=> b!49806 m!75803))

(declare-fun m!78145 () Bool)

(assert (=> b!49806 m!78145))

(assert (=> b!49157 d!15672))

(declare-fun d!15674 () Bool)

(declare-fun e!32871 () Bool)

(assert (=> d!15674 e!32871))

(declare-fun res!41690 () Bool)

(assert (=> d!15674 (=> (not res!41690) (not e!32871))))

(declare-fun lt!77507 () (_ BitVec 64))

(declare-fun lt!77506 () BitStream!1816)

(assert (=> d!15674 (= res!41690 (= (bvadd lt!77507 (bvsub lt!76338 lt!76354)) (bitIndex!0 (size!1048 (buf!1400 lt!77506)) (currentByte!2917 lt!77506) (currentBit!2912 lt!77506))))))

(assert (=> d!15674 (or (not (= (bvand lt!77507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!76338 lt!76354) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!77507 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!77507 (bvsub lt!76338 lt!76354)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15674 (= lt!77507 (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76343))) (currentByte!2917 (_2!2397 lt!76343)) (currentBit!2912 (_2!2397 lt!76343))))))

(assert (=> d!15674 (= lt!77506 (_2!2398 (moveBitIndex!0 (_2!2397 lt!76343) (bvsub lt!76338 lt!76354))))))

(assert (=> d!15674 (moveBitIndexPrecond!0 (_2!2397 lt!76343) (bvsub lt!76338 lt!76354))))

(assert (=> d!15674 (= (withMovedBitIndex!0 (_2!2397 lt!76343) (bvsub lt!76338 lt!76354)) lt!77506)))

(declare-fun b!49807 () Bool)

(assert (=> b!49807 (= e!32871 (= (size!1048 (buf!1400 (_2!2397 lt!76343))) (size!1048 (buf!1400 lt!77506))))))

(assert (= (and d!15674 res!41690) b!49807))

(declare-fun m!78147 () Bool)

(assert (=> d!15674 m!78147))

(assert (=> d!15674 m!78091))

(declare-fun m!78149 () Bool)

(assert (=> d!15674 m!78149))

(declare-fun m!78151 () Bool)

(assert (=> d!15674 m!78151))

(assert (=> b!49031 d!15674))

(assert (=> b!49031 d!15066))

(assert (=> b!49031 d!14964))

(declare-fun d!15676 () Bool)

(declare-fun res!41691 () Bool)

(declare-fun e!32872 () Bool)

(assert (=> d!15676 (=> (not res!41691) (not e!32872))))

(assert (=> d!15676 (= res!41691 (= (size!1048 (buf!1400 thiss!1379)) (size!1048 (buf!1400 (_2!2398 lt!76560)))))))

(assert (=> d!15676 (= (isPrefixOf!0 thiss!1379 (_2!2398 lt!76560)) e!32872)))

(declare-fun b!49808 () Bool)

(declare-fun res!41693 () Bool)

(assert (=> b!49808 (=> (not res!41693) (not e!32872))))

(assert (=> b!49808 (= res!41693 (bvsle (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379)) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76560))) (currentByte!2917 (_2!2398 lt!76560)) (currentBit!2912 (_2!2398 lt!76560)))))))

(declare-fun b!49809 () Bool)

(declare-fun e!32873 () Bool)

(assert (=> b!49809 (= e!32872 e!32873)))

(declare-fun res!41692 () Bool)

(assert (=> b!49809 (=> res!41692 e!32873)))

(assert (=> b!49809 (= res!41692 (= (size!1048 (buf!1400 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!49810 () Bool)

(assert (=> b!49810 (= e!32873 (arrayBitRangesEq!0 (buf!1400 thiss!1379) (buf!1400 (_2!2398 lt!76560)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 thiss!1379)) (currentByte!2917 thiss!1379) (currentBit!2912 thiss!1379))))))

(assert (= (and d!15676 res!41691) b!49808))

(assert (= (and b!49808 res!41693) b!49809))

(assert (= (and b!49809 (not res!41692)) b!49810))

(assert (=> b!49808 m!75803))

(assert (=> b!49808 m!76595))

(assert (=> b!49810 m!75803))

(assert (=> b!49810 m!75803))

(declare-fun m!78153 () Bool)

(assert (=> b!49810 m!78153))

(assert (=> b!49155 d!15676))

(declare-fun d!15678 () Bool)

(declare-fun c!3567 () Bool)

(assert (=> d!15678 (= c!3567 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32874 () List!549)

(assert (=> d!15678 (= (byteArrayBitContentToList!0 (_2!2398 lt!75692) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)) e!32874)))

(declare-fun b!49811 () Bool)

(assert (=> b!49811 (= e!32874 Nil!546)))

(declare-fun b!49812 () Bool)

(assert (=> b!49812 (= e!32874 (Cons!545 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2398 lt!75692) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15678 c!3567) b!49811))

(assert (= (and d!15678 (not c!3567)) b!49812))

(assert (=> b!49812 m!77727))

(assert (=> b!49812 m!77729))

(declare-fun m!78155 () Bool)

(assert (=> b!49812 m!78155))

(assert (=> b!49160 d!15678))

(assert (=> d!15058 d!15052))

(declare-fun d!15680 () Bool)

(assert (=> d!15680 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!75689)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!75702)))

(assert (=> d!15680 true))

(declare-fun _$6!202 () Unit!3414)

(assert (=> d!15680 (= (choose!9 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!75689)) lt!75702 (BitStream!1817 (buf!1400 (_2!2398 lt!75689)) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))) _$6!202)))

(declare-fun bs!3952 () Bool)

(assert (= bs!3952 d!15680))

(assert (=> bs!3952 m!75871))

(assert (=> d!15058 d!15680))

(declare-fun d!15682 () Bool)

(declare-fun res!41694 () Bool)

(declare-fun e!32875 () Bool)

(assert (=> d!15682 (=> (not res!41694) (not e!32875))))

(assert (=> d!15682 (= res!41694 (= (size!1048 (buf!1400 (_2!2398 lt!75692))) (size!1048 (buf!1400 (_2!2398 lt!76202)))))))

(assert (=> d!15682 (= (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!76202)) e!32875)))

(declare-fun b!49813 () Bool)

(declare-fun res!41696 () Bool)

(assert (=> b!49813 (=> (not res!41696) (not e!32875))))

(assert (=> b!49813 (= res!41696 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76202))) (currentByte!2917 (_2!2398 lt!76202)) (currentBit!2912 (_2!2398 lt!76202)))))))

(declare-fun b!49814 () Bool)

(declare-fun e!32876 () Bool)

(assert (=> b!49814 (= e!32875 e!32876)))

(declare-fun res!41695 () Bool)

(assert (=> b!49814 (=> res!41695 e!32876)))

(assert (=> b!49814 (= res!41695 (= (size!1048 (buf!1400 (_2!2398 lt!75692))) #b00000000000000000000000000000000))))

(declare-fun b!49815 () Bool)

(assert (=> b!49815 (= e!32876 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (_2!2398 lt!76202)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(assert (= (and d!15682 res!41694) b!49813))

(assert (= (and b!49813 res!41696) b!49814))

(assert (= (and b!49814 (not res!41695)) b!49815))

(assert (=> b!49813 m!75847))

(assert (=> b!49813 m!76237))

(assert (=> b!49815 m!75847))

(assert (=> b!49815 m!75847))

(declare-fun m!78157 () Bool)

(assert (=> b!49815 m!78157))

(assert (=> b!48976 d!15682))

(declare-fun d!15684 () Bool)

(assert (=> d!15684 (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76202)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!76196)))

(declare-fun lt!77508 () Unit!3414)

(assert (=> d!15684 (= lt!77508 (choose!9 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!76202)) lt!76196 (BitStream!1817 (buf!1400 (_2!2398 lt!76202)) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692)))))))

(assert (=> d!15684 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2398 lt!75692) (buf!1400 (_2!2398 lt!76202)) lt!76196) lt!77508)))

(declare-fun bs!3953 () Bool)

(assert (= bs!3953 d!15684))

(assert (=> bs!3953 m!76317))

(declare-fun m!78159 () Bool)

(assert (=> bs!3953 m!78159))

(assert (=> b!48974 d!15684))

(declare-fun d!15686 () Bool)

(declare-fun e!32877 () Bool)

(assert (=> d!15686 e!32877))

(declare-fun c!3568 () Bool)

(assert (=> d!15686 (= c!3568 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!77509 () List!549)

(declare-fun e!32878 () tuple2!4618)

(assert (=> d!15686 (= lt!77509 (_1!2408 e!32878))))

(declare-fun c!3569 () Bool)

(assert (=> d!15686 (= c!3569 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!15686 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!15686 (= (bitStreamReadBitsIntoList!0 (_2!2398 lt!76202) (_1!2397 lt!76194) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!77509)))

(declare-fun b!49818 () Bool)

(assert (=> b!49818 (= e!32877 (isEmpty!144 lt!77509))))

(declare-fun b!49816 () Bool)

(assert (=> b!49816 (= e!32878 (tuple2!4619 Nil!546 (_1!2397 lt!76194)))))

(declare-fun b!49819 () Bool)

(assert (=> b!49819 (= e!32877 (> (length!244 lt!77509) 0))))

(declare-fun lt!77511 () (_ BitVec 64))

(declare-fun b!49817 () Bool)

(declare-fun lt!77510 () tuple2!4620)

(assert (=> b!49817 (= e!32878 (tuple2!4619 (Cons!545 (_1!2409 lt!77510) (bitStreamReadBitsIntoList!0 (_2!2398 lt!76202) (_2!2409 lt!77510) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!77511))) (_2!2409 lt!77510)))))

(assert (=> b!49817 (= lt!77510 (readBit!0 (_1!2397 lt!76194)))))

(assert (=> b!49817 (= lt!77511 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!15686 c!3569) b!49816))

(assert (= (and d!15686 (not c!3569)) b!49817))

(assert (= (and d!15686 c!3568) b!49818))

(assert (= (and d!15686 (not c!3568)) b!49819))

(declare-fun m!78161 () Bool)

(assert (=> b!49818 m!78161))

(declare-fun m!78163 () Bool)

(assert (=> b!49819 m!78163))

(declare-fun m!78165 () Bool)

(assert (=> b!49817 m!78165))

(declare-fun m!78167 () Bool)

(assert (=> b!49817 m!78167))

(assert (=> b!48974 d!15686))

(declare-fun b!49820 () Bool)

(declare-fun e!32879 () Unit!3414)

(declare-fun Unit!3471 () Unit!3414)

(assert (=> b!49820 (= e!32879 Unit!3471)))

(declare-fun d!15688 () Bool)

(declare-fun e!32880 () Bool)

(assert (=> d!15688 e!32880))

(declare-fun res!41698 () Bool)

(assert (=> d!15688 (=> (not res!41698) (not e!32880))))

(declare-fun lt!77518 () tuple2!4596)

(assert (=> d!15688 (= res!41698 (isPrefixOf!0 (_1!2397 lt!77518) (_2!2397 lt!77518)))))

(declare-fun lt!77512 () BitStream!1816)

(assert (=> d!15688 (= lt!77518 (tuple2!4597 lt!77512 (_2!2398 lt!76202)))))

(declare-fun lt!77530 () Unit!3414)

(declare-fun lt!77524 () Unit!3414)

(assert (=> d!15688 (= lt!77530 lt!77524)))

(assert (=> d!15688 (isPrefixOf!0 lt!77512 (_2!2398 lt!76202))))

(assert (=> d!15688 (= lt!77524 (lemmaIsPrefixTransitive!0 lt!77512 (_2!2398 lt!76202) (_2!2398 lt!76202)))))

(declare-fun lt!77522 () Unit!3414)

(declare-fun lt!77525 () Unit!3414)

(assert (=> d!15688 (= lt!77522 lt!77525)))

(assert (=> d!15688 (isPrefixOf!0 lt!77512 (_2!2398 lt!76202))))

(assert (=> d!15688 (= lt!77525 (lemmaIsPrefixTransitive!0 lt!77512 (_2!2398 lt!75692) (_2!2398 lt!76202)))))

(declare-fun lt!77526 () Unit!3414)

(assert (=> d!15688 (= lt!77526 e!32879)))

(declare-fun c!3570 () Bool)

(assert (=> d!15688 (= c!3570 (not (= (size!1048 (buf!1400 (_2!2398 lt!75692))) #b00000000000000000000000000000000)))))

(declare-fun lt!77531 () Unit!3414)

(declare-fun lt!77521 () Unit!3414)

(assert (=> d!15688 (= lt!77531 lt!77521)))

(assert (=> d!15688 (isPrefixOf!0 (_2!2398 lt!76202) (_2!2398 lt!76202))))

(assert (=> d!15688 (= lt!77521 (lemmaIsPrefixRefl!0 (_2!2398 lt!76202)))))

(declare-fun lt!77516 () Unit!3414)

(declare-fun lt!77523 () Unit!3414)

(assert (=> d!15688 (= lt!77516 lt!77523)))

(assert (=> d!15688 (= lt!77523 (lemmaIsPrefixRefl!0 (_2!2398 lt!76202)))))

(declare-fun lt!77527 () Unit!3414)

(declare-fun lt!77520 () Unit!3414)

(assert (=> d!15688 (= lt!77527 lt!77520)))

(assert (=> d!15688 (isPrefixOf!0 lt!77512 lt!77512)))

(assert (=> d!15688 (= lt!77520 (lemmaIsPrefixRefl!0 lt!77512))))

(declare-fun lt!77514 () Unit!3414)

(declare-fun lt!77515 () Unit!3414)

(assert (=> d!15688 (= lt!77514 lt!77515)))

(assert (=> d!15688 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!75692))))

(assert (=> d!15688 (= lt!77515 (lemmaIsPrefixRefl!0 (_2!2398 lt!75692)))))

(assert (=> d!15688 (= lt!77512 (BitStream!1817 (buf!1400 (_2!2398 lt!76202)) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(assert (=> d!15688 (isPrefixOf!0 (_2!2398 lt!75692) (_2!2398 lt!76202))))

(assert (=> d!15688 (= (reader!0 (_2!2398 lt!75692) (_2!2398 lt!76202)) lt!77518)))

(declare-fun lt!77513 () (_ BitVec 64))

(declare-fun lt!77529 () (_ BitVec 64))

(declare-fun b!49821 () Bool)

(assert (=> b!49821 (= e!32880 (= (_1!2397 lt!77518) (withMovedBitIndex!0 (_2!2397 lt!77518) (bvsub lt!77513 lt!77529))))))

(assert (=> b!49821 (or (= (bvand lt!77513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77529 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77513 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77513 lt!77529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!49821 (= lt!77529 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!76202))) (currentByte!2917 (_2!2398 lt!76202)) (currentBit!2912 (_2!2398 lt!76202))))))

(assert (=> b!49821 (= lt!77513 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(declare-fun b!49822 () Bool)

(declare-fun res!41699 () Bool)

(assert (=> b!49822 (=> (not res!41699) (not e!32880))))

(assert (=> b!49822 (= res!41699 (isPrefixOf!0 (_1!2397 lt!77518) (_2!2398 lt!75692)))))

(declare-fun b!49823 () Bool)

(declare-fun res!41697 () Bool)

(assert (=> b!49823 (=> (not res!41697) (not e!32880))))

(assert (=> b!49823 (= res!41697 (isPrefixOf!0 (_2!2397 lt!77518) (_2!2398 lt!76202)))))

(declare-fun b!49824 () Bool)

(declare-fun lt!77517 () Unit!3414)

(assert (=> b!49824 (= e!32879 lt!77517)))

(declare-fun lt!77528 () (_ BitVec 64))

(assert (=> b!49824 (= lt!77528 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!77519 () (_ BitVec 64))

(assert (=> b!49824 (= lt!77519 (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75692))) (currentByte!2917 (_2!2398 lt!75692)) (currentBit!2912 (_2!2398 lt!75692))))))

(assert (=> b!49824 (= lt!77517 (arrayBitRangesEqSymmetric!0 (buf!1400 (_2!2398 lt!75692)) (buf!1400 (_2!2398 lt!76202)) lt!77528 lt!77519))))

(assert (=> b!49824 (arrayBitRangesEq!0 (buf!1400 (_2!2398 lt!76202)) (buf!1400 (_2!2398 lt!75692)) lt!77528 lt!77519)))

(assert (= (and d!15688 c!3570) b!49824))

(assert (= (and d!15688 (not c!3570)) b!49820))

(assert (= (and d!15688 res!41698) b!49822))

(assert (= (and b!49822 res!41699) b!49823))

(assert (= (and b!49823 res!41697) b!49821))

(declare-fun m!78169 () Bool)

(assert (=> d!15688 m!78169))

(assert (=> d!15688 m!76241))

(declare-fun m!78171 () Bool)

(assert (=> d!15688 m!78171))

(declare-fun m!78173 () Bool)

(assert (=> d!15688 m!78173))

(assert (=> d!15688 m!76239))

(declare-fun m!78175 () Bool)

(assert (=> d!15688 m!78175))

(declare-fun m!78177 () Bool)

(assert (=> d!15688 m!78177))

(assert (=> d!15688 m!76311))

(declare-fun m!78179 () Bool)

(assert (=> d!15688 m!78179))

(declare-fun m!78181 () Bool)

(assert (=> d!15688 m!78181))

(declare-fun m!78183 () Bool)

(assert (=> d!15688 m!78183))

(declare-fun m!78185 () Bool)

(assert (=> b!49823 m!78185))

(assert (=> b!49824 m!75847))

(declare-fun m!78187 () Bool)

(assert (=> b!49824 m!78187))

(declare-fun m!78189 () Bool)

(assert (=> b!49824 m!78189))

(declare-fun m!78191 () Bool)

(assert (=> b!49822 m!78191))

(declare-fun m!78193 () Bool)

(assert (=> b!49821 m!78193))

(assert (=> b!49821 m!76237))

(assert (=> b!49821 m!75847))

(assert (=> b!48974 d!15688))

(declare-fun d!15690 () Bool)

(declare-fun c!3571 () Bool)

(assert (=> d!15690 (= c!3571 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32881 () List!549)

(assert (=> d!15690 (= (byteArrayBitContentToList!0 (_2!2398 lt!76202) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!32881)))

(declare-fun b!49825 () Bool)

(assert (=> b!49825 (= e!32881 Nil!546)))

(declare-fun b!49826 () Bool)

(assert (=> b!49826 (= e!32881 (Cons!545 (not (= (bvand ((_ sign_extend 24) (select (arr!1574 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2398 lt!76202) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15690 c!3571) b!49825))

(assert (= (and d!15690 (not c!3571)) b!49826))

(assert (=> b!49826 m!76273))

(assert (=> b!49826 m!77679))

(declare-fun m!78195 () Bool)

(assert (=> b!49826 m!78195))

(assert (=> b!48974 d!15690))

(declare-fun d!15692 () Bool)

(assert (=> d!15692 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76202)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692))) lt!76196) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_2!2398 lt!76202)))) ((_ sign_extend 32) (currentByte!2917 (_2!2398 lt!75692))) ((_ sign_extend 32) (currentBit!2912 (_2!2398 lt!75692)))) lt!76196))))

(declare-fun bs!3954 () Bool)

(assert (= bs!3954 d!15692))

(declare-fun m!78197 () Bool)

(assert (=> bs!3954 m!78197))

(assert (=> b!48974 d!15692))

(declare-fun d!15694 () Bool)

(declare-fun e!32882 () Bool)

(assert (=> d!15694 e!32882))

(declare-fun res!41700 () Bool)

(assert (=> d!15694 (=> (not res!41700) (not e!32882))))

(declare-fun lt!77535 () (_ BitVec 64))

(declare-fun lt!77534 () (_ BitVec 64))

(declare-fun lt!77533 () (_ BitVec 64))

(assert (=> d!15694 (= res!41700 (= lt!77535 (bvsub lt!77533 lt!77534)))))

(assert (=> d!15694 (or (= (bvand lt!77533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!77534 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!77533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!77533 lt!77534) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!15694 (= lt!77534 (remainingBits!0 ((_ sign_extend 32) (size!1048 (buf!1400 (_1!2410 lt!76559)))) ((_ sign_extend 32) (currentByte!2917 (_1!2410 lt!76559))) ((_ sign_extend 32) (currentBit!2912 (_1!2410 lt!76559)))))))

(declare-fun lt!77537 () (_ BitVec 64))

(declare-fun lt!77536 () (_ BitVec 64))

(assert (=> d!15694 (= lt!77533 (bvmul lt!77537 lt!77536))))

(assert (=> d!15694 (or (= lt!77537 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!77536 (bvsdiv (bvmul lt!77537 lt!77536) lt!77537)))))

(assert (=> d!15694 (= lt!77536 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!15694 (= lt!77537 ((_ sign_extend 32) (size!1048 (buf!1400 (_1!2410 lt!76559)))))))

(assert (=> d!15694 (= lt!77535 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2917 (_1!2410 lt!76559))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2912 (_1!2410 lt!76559)))))))

(assert (=> d!15694 (invariant!0 (currentBit!2912 (_1!2410 lt!76559)) (currentByte!2917 (_1!2410 lt!76559)) (size!1048 (buf!1400 (_1!2410 lt!76559))))))

(assert (=> d!15694 (= (bitIndex!0 (size!1048 (buf!1400 (_1!2410 lt!76559))) (currentByte!2917 (_1!2410 lt!76559)) (currentBit!2912 (_1!2410 lt!76559))) lt!77535)))

(declare-fun b!49827 () Bool)

(declare-fun res!41701 () Bool)

(assert (=> b!49827 (=> (not res!41701) (not e!32882))))

(assert (=> b!49827 (= res!41701 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!77535))))

(declare-fun b!49828 () Bool)

(declare-fun lt!77532 () (_ BitVec 64))

(assert (=> b!49828 (= e!32882 (bvsle lt!77535 (bvmul lt!77532 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!49828 (or (= lt!77532 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!77532 #b0000000000000000000000000000000000000000000000000000000000001000) lt!77532)))))

(assert (=> b!49828 (= lt!77532 ((_ sign_extend 32) (size!1048 (buf!1400 (_1!2410 lt!76559)))))))

(assert (= (and d!15694 res!41700) b!49827))

(assert (= (and b!49827 res!41701) b!49828))

(declare-fun m!78199 () Bool)

(assert (=> d!15694 m!78199))

(declare-fun m!78201 () Bool)

(assert (=> d!15694 m!78201))

(assert (=> b!49153 d!15694))

(assert (=> b!49153 d!15634))

(assert (=> d!15122 d!15658))

(assert (=> d!15062 d!15010))

(declare-fun d!15696 () Bool)

(declare-fun res!41702 () Bool)

(declare-fun e!32883 () Bool)

(assert (=> d!15696 (=> (not res!41702) (not e!32883))))

(assert (=> d!15696 (= res!41702 (= (size!1048 (buf!1400 (_1!2397 lt!76491))) (size!1048 (buf!1400 (_2!2397 lt!76491)))))))

(assert (=> d!15696 (= (isPrefixOf!0 (_1!2397 lt!76491) (_2!2397 lt!76491)) e!32883)))

(declare-fun b!49829 () Bool)

(declare-fun res!41704 () Bool)

(assert (=> b!49829 (=> (not res!41704) (not e!32883))))

(assert (=> b!49829 (= res!41704 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76491))) (currentByte!2917 (_1!2397 lt!76491)) (currentBit!2912 (_1!2397 lt!76491))) (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76491))) (currentByte!2917 (_2!2397 lt!76491)) (currentBit!2912 (_2!2397 lt!76491)))))))

(declare-fun b!49830 () Bool)

(declare-fun e!32884 () Bool)

(assert (=> b!49830 (= e!32883 e!32884)))

(declare-fun res!41703 () Bool)

(assert (=> b!49830 (=> res!41703 e!32884)))

(assert (=> b!49830 (= res!41703 (= (size!1048 (buf!1400 (_1!2397 lt!76491))) #b00000000000000000000000000000000))))

(declare-fun b!49831 () Bool)

(assert (=> b!49831 (= e!32884 (arrayBitRangesEq!0 (buf!1400 (_1!2397 lt!76491)) (buf!1400 (_2!2397 lt!76491)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_1!2397 lt!76491))) (currentByte!2917 (_1!2397 lt!76491)) (currentBit!2912 (_1!2397 lt!76491)))))))

(assert (= (and d!15696 res!41702) b!49829))

(assert (= (and b!49829 res!41704) b!49830))

(assert (= (and b!49830 (not res!41703)) b!49831))

(assert (=> b!49829 m!78117))

(assert (=> b!49829 m!77569))

(assert (=> b!49831 m!78117))

(assert (=> b!49831 m!78117))

(declare-fun m!78203 () Bool)

(assert (=> b!49831 m!78203))

(assert (=> d!15062 d!15696))

(declare-fun d!15698 () Bool)

(assert (=> d!15698 (isPrefixOf!0 lt!76485 lt!76485)))

(declare-fun lt!77538 () Unit!3414)

(assert (=> d!15698 (= lt!77538 (choose!11 lt!76485))))

(assert (=> d!15698 (= (lemmaIsPrefixRefl!0 lt!76485) lt!77538)))

(declare-fun bs!3955 () Bool)

(assert (= bs!3955 d!15698))

(assert (=> bs!3955 m!76533))

(declare-fun m!78205 () Bool)

(assert (=> bs!3955 m!78205))

(assert (=> d!15062 d!15698))

(declare-fun d!15700 () Bool)

(assert (=> d!15700 (isPrefixOf!0 lt!76485 (_2!2398 lt!75689))))

(declare-fun lt!77539 () Unit!3414)

(assert (=> d!15700 (= lt!77539 (choose!30 lt!76485 thiss!1379 (_2!2398 lt!75689)))))

(assert (=> d!15700 (isPrefixOf!0 lt!76485 thiss!1379)))

(assert (=> d!15700 (= (lemmaIsPrefixTransitive!0 lt!76485 thiss!1379 (_2!2398 lt!75689)) lt!77539)))

(declare-fun bs!3956 () Bool)

(assert (= bs!3956 d!15700))

(assert (=> bs!3956 m!76531))

(declare-fun m!78207 () Bool)

(assert (=> bs!3956 m!78207))

(declare-fun m!78209 () Bool)

(assert (=> bs!3956 m!78209))

(assert (=> d!15062 d!15700))

(declare-fun d!15702 () Bool)

(declare-fun res!41705 () Bool)

(declare-fun e!32885 () Bool)

(assert (=> d!15702 (=> (not res!41705) (not e!32885))))

(assert (=> d!15702 (= res!41705 (= (size!1048 (buf!1400 lt!76485)) (size!1048 (buf!1400 lt!76485))))))

(assert (=> d!15702 (= (isPrefixOf!0 lt!76485 lt!76485) e!32885)))

(declare-fun b!49832 () Bool)

(declare-fun res!41707 () Bool)

(assert (=> b!49832 (=> (not res!41707) (not e!32885))))

(assert (=> b!49832 (= res!41707 (bvsle (bitIndex!0 (size!1048 (buf!1400 lt!76485)) (currentByte!2917 lt!76485) (currentBit!2912 lt!76485)) (bitIndex!0 (size!1048 (buf!1400 lt!76485)) (currentByte!2917 lt!76485) (currentBit!2912 lt!76485))))))

(declare-fun b!49833 () Bool)

(declare-fun e!32886 () Bool)

(assert (=> b!49833 (= e!32885 e!32886)))

(declare-fun res!41706 () Bool)

(assert (=> b!49833 (=> res!41706 e!32886)))

(assert (=> b!49833 (= res!41706 (= (size!1048 (buf!1400 lt!76485)) #b00000000000000000000000000000000))))

(declare-fun b!49834 () Bool)

(assert (=> b!49834 (= e!32886 (arrayBitRangesEq!0 (buf!1400 lt!76485) (buf!1400 lt!76485) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 lt!76485)) (currentByte!2917 lt!76485) (currentBit!2912 lt!76485))))))

(assert (= (and d!15702 res!41705) b!49832))

(assert (= (and b!49832 res!41707) b!49833))

(assert (= (and b!49833 (not res!41706)) b!49834))

(declare-fun m!78211 () Bool)

(assert (=> b!49832 m!78211))

(assert (=> b!49832 m!78211))

(assert (=> b!49834 m!78211))

(assert (=> b!49834 m!78211))

(declare-fun m!78213 () Bool)

(assert (=> b!49834 m!78213))

(assert (=> d!15062 d!15702))

(assert (=> d!15062 d!15644))

(assert (=> d!15062 d!15650))

(declare-fun d!15704 () Bool)

(assert (=> d!15704 (isPrefixOf!0 lt!76485 (_2!2398 lt!75689))))

(declare-fun lt!77540 () Unit!3414)

(assert (=> d!15704 (= lt!77540 (choose!30 lt!76485 (_2!2398 lt!75689) (_2!2398 lt!75689)))))

(assert (=> d!15704 (isPrefixOf!0 lt!76485 (_2!2398 lt!75689))))

(assert (=> d!15704 (= (lemmaIsPrefixTransitive!0 lt!76485 (_2!2398 lt!75689) (_2!2398 lt!75689)) lt!77540)))

(declare-fun bs!3957 () Bool)

(assert (= bs!3957 d!15704))

(assert (=> bs!3957 m!76531))

(declare-fun m!78215 () Bool)

(assert (=> bs!3957 m!78215))

(assert (=> bs!3957 m!76531))

(assert (=> d!15062 d!15704))

(assert (=> d!15062 d!14972))

(assert (=> d!15062 d!15012))

(declare-fun d!15706 () Bool)

(declare-fun res!41708 () Bool)

(declare-fun e!32887 () Bool)

(assert (=> d!15706 (=> (not res!41708) (not e!32887))))

(assert (=> d!15706 (= res!41708 (= (size!1048 (buf!1400 lt!76485)) (size!1048 (buf!1400 (_2!2398 lt!75689)))))))

(assert (=> d!15706 (= (isPrefixOf!0 lt!76485 (_2!2398 lt!75689)) e!32887)))

(declare-fun b!49835 () Bool)

(declare-fun res!41710 () Bool)

(assert (=> b!49835 (=> (not res!41710) (not e!32887))))

(assert (=> b!49835 (= res!41710 (bvsle (bitIndex!0 (size!1048 (buf!1400 lt!76485)) (currentByte!2917 lt!76485) (currentBit!2912 lt!76485)) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689)))))))

(declare-fun b!49836 () Bool)

(declare-fun e!32888 () Bool)

(assert (=> b!49836 (= e!32887 e!32888)))

(declare-fun res!41709 () Bool)

(assert (=> b!49836 (=> res!41709 e!32888)))

(assert (=> b!49836 (= res!41709 (= (size!1048 (buf!1400 lt!76485)) #b00000000000000000000000000000000))))

(declare-fun b!49837 () Bool)

(assert (=> b!49837 (= e!32888 (arrayBitRangesEq!0 (buf!1400 lt!76485) (buf!1400 (_2!2398 lt!75689)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 lt!76485)) (currentByte!2917 lt!76485) (currentBit!2912 lt!76485))))))

(assert (= (and d!15706 res!41708) b!49835))

(assert (= (and b!49835 res!41710) b!49836))

(assert (= (and b!49836 (not res!41709)) b!49837))

(assert (=> b!49835 m!78211))

(assert (=> b!49835 m!75797))

(assert (=> b!49837 m!78211))

(assert (=> b!49837 m!78211))

(declare-fun m!78217 () Bool)

(assert (=> b!49837 m!78217))

(assert (=> d!15062 d!15706))

(declare-fun d!15708 () Bool)

(declare-fun res!41711 () Bool)

(declare-fun e!32889 () Bool)

(assert (=> d!15708 (=> (not res!41711) (not e!32889))))

(assert (=> d!15708 (= res!41711 (= (size!1048 (buf!1400 (_2!2397 lt!76343))) (size!1048 (buf!1400 (_2!2398 lt!75689)))))))

(assert (=> d!15708 (= (isPrefixOf!0 (_2!2397 lt!76343) (_2!2398 lt!75689)) e!32889)))

(declare-fun b!49838 () Bool)

(declare-fun res!41713 () Bool)

(assert (=> b!49838 (=> (not res!41713) (not e!32889))))

(assert (=> b!49838 (= res!41713 (bvsle (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76343))) (currentByte!2917 (_2!2397 lt!76343)) (currentBit!2912 (_2!2397 lt!76343))) (bitIndex!0 (size!1048 (buf!1400 (_2!2398 lt!75689))) (currentByte!2917 (_2!2398 lt!75689)) (currentBit!2912 (_2!2398 lt!75689)))))))

(declare-fun b!49839 () Bool)

(declare-fun e!32890 () Bool)

(assert (=> b!49839 (= e!32889 e!32890)))

(declare-fun res!41712 () Bool)

(assert (=> b!49839 (=> res!41712 e!32890)))

(assert (=> b!49839 (= res!41712 (= (size!1048 (buf!1400 (_2!2397 lt!76343))) #b00000000000000000000000000000000))))

(declare-fun b!49840 () Bool)

(assert (=> b!49840 (= e!32890 (arrayBitRangesEq!0 (buf!1400 (_2!2397 lt!76343)) (buf!1400 (_2!2398 lt!75689)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1048 (buf!1400 (_2!2397 lt!76343))) (currentByte!2917 (_2!2397 lt!76343)) (currentBit!2912 (_2!2397 lt!76343)))))))

(assert (= (and d!15708 res!41711) b!49838))

(assert (= (and b!49838 res!41713) b!49839))

(assert (= (and b!49839 (not res!41712)) b!49840))

(assert (=> b!49838 m!78091))

(assert (=> b!49838 m!75797))

(assert (=> b!49840 m!78091))

(assert (=> b!49840 m!78091))

(declare-fun m!78219 () Bool)

(assert (=> b!49840 m!78219))

(assert (=> b!49033 d!15708))

(declare-fun d!15710 () Bool)

(assert (=> d!15710 (= (isEmpty!144 lt!76480) (is-Nil!546 lt!76480))))

(assert (=> b!49082 d!15710))

(push 1)

(assert (not d!15694))

(assert (not b!49806))

(assert (not b!49771))

(assert (not b!49711))

(assert (not d!15542))

(assert (not b!49832))

(assert (not d!15572))

(assert (not b!49729))

(assert (not bm!631))

(assert (not b!49701))

(assert (not d!15600))

(assert (not d!15674))

(assert (not d!15588))

(assert (not b!49572))

(assert (not d!15586))

(assert (not b!49733))

(assert (not b!49601))

(assert (not b!49766))

(assert (not b!49686))

(assert (not b!49826))

(assert (not d!15556))

(assert (not d!15564))

(assert (not b!49774))

(assert (not b!49765))

(assert (not b!49671))

(assert (not bm!635))

(assert (not b!49646))

(assert (not d!15670))

(assert (not b!49764))

(assert (not b!49653))

(assert (not b!49702))

(assert (not b!49728))

(assert (not b!49678))

(assert (not d!15688))

(assert (not b!49776))

(assert (not b!49738))

(assert (not b!49812))

(assert (not d!15486))

(assert (not d!15622))

(assert (not b!49742))

(assert (not b!49747))

(assert (not b!49616))

(assert (not d!15518))

(assert (not d!15642))

(assert (not b!49734))

(assert (not d!15520))

(assert (not b!49591))

(assert (not d!15620))

(assert (not b!49639))

(assert (not b!49800))

(assert (not b!49757))

(assert (not b!49690))

(assert (not b!49647))

(assert (not d!15630))

(assert (not b!49676))

(assert (not b!49614))

(assert (not d!15488))

(assert (not b!49817))

(assert (not b!49748))

(assert (not d!15666))

(assert (not b!49720))

(assert (not b!49662))

(assert (not b!49725))

(assert (not d!15494))

(assert (not d!15650))

(assert (not b!49804))

(assert (not b!49685))

(assert (not b!49717))

(assert (not b!49637))

(assert (not b!49660))

(assert (not b!49655))

(assert (not b!49792))

(assert (not b!49802))

(assert (not d!15700))

(assert (not d!15602))

(assert (not d!15554))

(assert (not b!49782))

(assert (not d!15492))

(assert (not b!49784))

(assert (not b!49750))

(assert (not b!49592))

(assert (not b!49763))

(assert (not d!15538))

(assert (not d!15636))

(assert (not b!49735))

(assert (not b!49556))

(assert (not d!15560))

(assert (not b!49740))

(assert (not b!49837))

(assert (not bm!636))

(assert (not b!49583))

(assert (not b!49824))

(assert (not b!49579))

(assert (not b!49790))

(assert (not b!49795))

(assert (not b!49722))

(assert (not b!49823))

(assert (not b!49589))

(assert (not d!15528))

(assert (not d!15562))

(assert (not b!49794))

(assert (not b!49788))

(assert (not d!15634))

(assert (not d!15578))

(assert (not d!15482))

(assert (not d!15472))

(assert (not b!49673))

(assert (not d!15638))

(assert (not d!15460))

(assert (not b!49835))

(assert (not b!49786))

(assert (not d!15684))

(assert (not bm!634))

(assert (not b!49595))

(assert (not d!15606))

(assert (not b!49819))

(assert (not b!49724))

(assert (not b!49716))

(assert (not b!49590))

(assert (not b!49598))

(assert (not b!49619))

(assert (not d!15618))

(assert (not b!49706))

(assert (not b!49664))

(assert (not b!49723))

(assert (not b!49593))

(assert (not b!49745))

(assert (not b!49596))

(assert (not b!49761))

(assert (not b!49736))

(assert (not d!15692))

(assert (not b!49840))

(assert (not b!49744))

(assert (not d!15596))

(assert (not b!49759))

(assert (not d!15624))

(assert (not bm!630))

(assert (not d!15704))

(assert (not b!49687))

(assert (not d!15698))

(assert (not b!49796))

(assert (not b!49649))

(assert (not b!49599))

(assert (not b!49732))

(assert (not b!49561))

(assert (not b!49612))

(assert (not b!49688))

(assert (not b!49563))

(assert (not d!15512))

(assert (not b!49815))

(assert (not b!49704))

(assert (not d!15628))

(assert (not b!49838))

(assert (not d!15592))

(assert (not bm!632))

(assert (not b!49667))

(assert (not d!15468))

(assert (not d!15504))

(assert (not b!49777))

(assert (not b!49703))

(assert (not b!49684))

(assert (not b!49731))

(assert (not b!49756))

(assert (not b!49749))

(assert (not b!49710))

(assert (not b!49680))

(assert (not bm!633))

(assert (not b!49587))

(assert (not b!49708))

(assert (not b!49808))

(assert (not d!15590))

(assert (not d!15656))

(assert (not d!15522))

(assert (not b!49831))

(assert (not b!49651))

(assert (not b!49726))

(assert (not b!49582))

(assert (not d!15506))

(assert (not b!49730))

(assert (not b!49798))

(assert (not d!15680))

(assert (not b!49834))

(assert (not b!49577))

(assert (not b!49810))

(assert (not b!49741))

(assert (not d!15484))

(assert (not b!49683))

(assert (not d!15500))

(assert (not b!49818))

(assert (not b!49558))

(assert (not d!15574))

(assert (not d!15510))

(assert (not b!49715))

(assert (not b!49657))

(assert (not b!49709))

(assert (not b!49773))

(assert (not b!49829))

(assert (not b!49754))

(assert (not bm!629))

(assert (not b!49779))

(assert (not d!15546))

(assert (not d!15652))

(assert (not d!15552))

(assert (not b!49758))

(assert (not b!49669))

(assert (not b!49768))

(assert (not d!15584))

(assert (not b!49700))

(assert (not b!49821))

(assert (not b!49746))

(assert (not b!49635))

(assert (not d!15496))

(assert (not d!15474))

(assert (not b!49752))

(assert (not b!49780))

(assert (not b!49584))

(assert (not b!49822))

(assert (not b!49813))

(check-sat)

(pop 1)

(push 1)

(check-sat)

