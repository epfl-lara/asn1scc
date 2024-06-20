; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6756 () Bool)

(assert start!6756)

(declare-fun b!31773 () Bool)

(declare-fun e!21064 () Bool)

(declare-datatypes ((array!1809 0))(
  ( (array!1810 (arr!1267 (Array (_ BitVec 32) (_ BitVec 8))) (size!795 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1388 0))(
  ( (BitStream!1389 (buf!1123 array!1809) (currentByte!2484 (_ BitVec 32)) (currentBit!2479 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1388)

(declare-fun array_inv!747 (array!1809) Bool)

(assert (=> b!31773 (= e!21064 (array_inv!747 (buf!1123 thiss!1379)))))

(declare-fun res!27196 () Bool)

(declare-fun e!21062 () Bool)

(assert (=> start!6756 (=> (not res!27196) (not e!21062))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> start!6756 (= res!27196 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> start!6756 e!21062))

(assert (=> start!6756 true))

(declare-fun inv!12 (BitStream!1388) Bool)

(assert (=> start!6756 (and (inv!12 thiss!1379) e!21064)))

(declare-fun srcBuffer!2 () array!1809)

(assert (=> start!6756 (array_inv!747 srcBuffer!2)))

(declare-fun b!31774 () Bool)

(declare-fun e!21057 () Bool)

(declare-fun e!21059 () Bool)

(assert (=> b!31774 (= e!21057 e!21059)))

(declare-fun res!27192 () Bool)

(assert (=> b!31774 (=> res!27192 e!21059)))

(declare-fun lt!46858 () (_ BitVec 64))

(declare-datatypes ((tuple2!3282 0))(
  ( (tuple2!3283 (_1!1728 BitStream!1388) (_2!1728 BitStream!1388)) )
))
(declare-fun lt!46866 () tuple2!3282)

(declare-fun lt!46870 () Bool)

(declare-fun bitAt!0 (array!1809 (_ BitVec 64)) Bool)

(assert (=> b!31774 (= res!27192 (not (= lt!46870 (bitAt!0 (buf!1123 (_1!1728 lt!46866)) lt!46858))))))

(declare-fun lt!46874 () tuple2!3282)

(assert (=> b!31774 (= lt!46870 (bitAt!0 (buf!1123 (_1!1728 lt!46874)) lt!46858))))

(declare-fun b!31775 () Bool)

(declare-fun res!27202 () Bool)

(declare-fun e!21056 () Bool)

(assert (=> b!31775 (=> res!27202 e!21056)))

(declare-datatypes ((Unit!2421 0))(
  ( (Unit!2422) )
))
(declare-datatypes ((tuple2!3284 0))(
  ( (tuple2!3285 (_1!1729 Unit!2421) (_2!1729 BitStream!1388)) )
))
(declare-fun lt!46861 () tuple2!3284)

(declare-fun lt!46867 () tuple2!3284)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!31775 (= res!27202 (not (invariant!0 (currentBit!2479 (_2!1729 lt!46861)) (currentByte!2484 (_2!1729 lt!46861)) (size!795 (buf!1123 (_2!1729 lt!46867))))))))

(declare-fun b!31776 () Bool)

(declare-fun e!21063 () Bool)

(declare-fun lt!46872 () tuple2!3282)

(declare-datatypes ((List!395 0))(
  ( (Nil!392) (Cons!391 (h!510 Bool) (t!1145 List!395)) )
))
(declare-fun head!232 (List!395) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1388 array!1809 (_ BitVec 64) (_ BitVec 64)) List!395)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1388 BitStream!1388 (_ BitVec 64)) List!395)

(assert (=> b!31776 (= e!21063 (= (head!232 (byteArrayBitContentToList!0 (_2!1729 lt!46861) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!232 (bitStreamReadBitsIntoList!0 (_2!1729 lt!46861) (_1!1728 lt!46872) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!31777 () Bool)

(declare-fun res!27198 () Bool)

(declare-fun e!21058 () Bool)

(assert (=> b!31777 (=> res!27198 e!21058)))

(assert (=> b!31777 (= res!27198 (not (invariant!0 (currentBit!2479 (_2!1729 lt!46867)) (currentByte!2484 (_2!1729 lt!46867)) (size!795 (buf!1123 (_2!1729 lt!46867))))))))

(declare-fun b!31778 () Bool)

(declare-fun e!21050 () Bool)

(assert (=> b!31778 (= e!21050 e!21057)))

(declare-fun res!27197 () Bool)

(assert (=> b!31778 (=> res!27197 e!21057)))

(declare-fun lt!46869 () List!395)

(declare-fun lt!46860 () List!395)

(assert (=> b!31778 (= res!27197 (not (= lt!46869 lt!46860)))))

(assert (=> b!31778 (= lt!46860 lt!46869)))

(declare-fun lt!46865 () List!395)

(declare-fun tail!112 (List!395) List!395)

(assert (=> b!31778 (= lt!46869 (tail!112 lt!46865))))

(declare-fun lt!46862 () Unit!2421)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1388 BitStream!1388 BitStream!1388 BitStream!1388 (_ BitVec 64) List!395) Unit!2421)

(assert (=> b!31778 (= lt!46862 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1729 lt!46867) (_2!1729 lt!46867) (_1!1728 lt!46874) (_1!1728 lt!46866) (bvsub to!314 i!635) lt!46865))))

(declare-fun b!31779 () Bool)

(assert (=> b!31779 (= e!21056 e!21050)))

(declare-fun res!27187 () Bool)

(assert (=> b!31779 (=> res!27187 e!21050)))

(assert (=> b!31779 (= res!27187 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!46864 () (_ BitVec 64))

(assert (=> b!31779 (= lt!46860 (bitStreamReadBitsIntoList!0 (_2!1729 lt!46867) (_1!1728 lt!46866) lt!46864))))

(assert (=> b!31779 (= lt!46865 (bitStreamReadBitsIntoList!0 (_2!1729 lt!46867) (_1!1728 lt!46874) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31779 (validate_offset_bits!1 ((_ sign_extend 32) (size!795 (buf!1123 (_2!1729 lt!46867)))) ((_ sign_extend 32) (currentByte!2484 (_2!1729 lt!46861))) ((_ sign_extend 32) (currentBit!2479 (_2!1729 lt!46861))) lt!46864)))

(declare-fun lt!46873 () Unit!2421)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1388 array!1809 (_ BitVec 64)) Unit!2421)

(assert (=> b!31779 (= lt!46873 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1729 lt!46861) (buf!1123 (_2!1729 lt!46867)) lt!46864))))

(declare-fun reader!0 (BitStream!1388 BitStream!1388) tuple2!3282)

(assert (=> b!31779 (= lt!46866 (reader!0 (_2!1729 lt!46861) (_2!1729 lt!46867)))))

(assert (=> b!31779 (validate_offset_bits!1 ((_ sign_extend 32) (size!795 (buf!1123 (_2!1729 lt!46867)))) ((_ sign_extend 32) (currentByte!2484 thiss!1379)) ((_ sign_extend 32) (currentBit!2479 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!46868 () Unit!2421)

(assert (=> b!31779 (= lt!46868 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1123 (_2!1729 lt!46867)) (bvsub to!314 i!635)))))

(assert (=> b!31779 (= lt!46874 (reader!0 thiss!1379 (_2!1729 lt!46867)))))

(declare-fun b!31780 () Bool)

(declare-fun e!21061 () Bool)

(assert (=> b!31780 (= e!21062 e!21061)))

(declare-fun res!27186 () Bool)

(assert (=> b!31780 (=> (not res!27186) (not e!21061))))

(declare-fun lt!46857 () (_ BitVec 64))

(assert (=> b!31780 (= res!27186 (bvsle to!314 lt!46857))))

(assert (=> b!31780 (= lt!46857 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!795 srcBuffer!2))))))

(declare-fun b!31781 () Bool)

(declare-fun e!21055 () Bool)

(assert (=> b!31781 (= e!21061 (not e!21055))))

(declare-fun res!27191 () Bool)

(assert (=> b!31781 (=> res!27191 e!21055)))

(assert (=> b!31781 (= res!27191 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1388 BitStream!1388) Bool)

(assert (=> b!31781 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!46875 () Unit!2421)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1388) Unit!2421)

(assert (=> b!31781 (= lt!46875 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!31781 (= lt!46858 (bitIndex!0 (size!795 (buf!1123 thiss!1379)) (currentByte!2484 thiss!1379) (currentBit!2479 thiss!1379)))))

(declare-fun b!31782 () Bool)

(assert (=> b!31782 (= e!21058 e!21056)))

(declare-fun res!27199 () Bool)

(assert (=> b!31782 (=> res!27199 e!21056)))

(assert (=> b!31782 (= res!27199 (not (= (size!795 (buf!1123 (_2!1729 lt!46861))) (size!795 (buf!1123 (_2!1729 lt!46867))))))))

(declare-fun e!21053 () Bool)

(assert (=> b!31782 e!21053))

(declare-fun res!27189 () Bool)

(assert (=> b!31782 (=> (not res!27189) (not e!21053))))

(assert (=> b!31782 (= res!27189 (= (size!795 (buf!1123 (_2!1729 lt!46867))) (size!795 (buf!1123 thiss!1379))))))

(declare-fun b!31783 () Bool)

(assert (=> b!31783 (= e!21059 (bvslt i!635 lt!46857))))

(declare-fun b!31784 () Bool)

(declare-fun res!27194 () Bool)

(assert (=> b!31784 (=> res!27194 e!21050)))

(declare-fun length!121 (List!395) Int)

(assert (=> b!31784 (= res!27194 (<= (length!121 lt!46865) 0))))

(declare-fun b!31785 () Bool)

(declare-fun res!27188 () Bool)

(assert (=> b!31785 (=> res!27188 e!21059)))

(assert (=> b!31785 (= res!27188 (not (= (head!232 lt!46865) lt!46870)))))

(declare-fun b!31786 () Bool)

(declare-fun res!27201 () Bool)

(assert (=> b!31786 (=> res!27201 e!21056)))

(assert (=> b!31786 (= res!27201 (not (invariant!0 (currentBit!2479 (_2!1729 lt!46861)) (currentByte!2484 (_2!1729 lt!46861)) (size!795 (buf!1123 (_2!1729 lt!46861))))))))

(declare-fun b!31787 () Bool)

(declare-fun e!21054 () Bool)

(assert (=> b!31787 (= e!21055 e!21054)))

(declare-fun res!27200 () Bool)

(assert (=> b!31787 (=> res!27200 e!21054)))

(assert (=> b!31787 (= res!27200 (not (isPrefixOf!0 thiss!1379 (_2!1729 lt!46861))))))

(assert (=> b!31787 (validate_offset_bits!1 ((_ sign_extend 32) (size!795 (buf!1123 (_2!1729 lt!46861)))) ((_ sign_extend 32) (currentByte!2484 (_2!1729 lt!46861))) ((_ sign_extend 32) (currentBit!2479 (_2!1729 lt!46861))) lt!46864)))

(assert (=> b!31787 (= lt!46864 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46859 () Unit!2421)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1388 BitStream!1388 (_ BitVec 64) (_ BitVec 64)) Unit!2421)

(assert (=> b!31787 (= lt!46859 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1729 lt!46861) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1388 (_ BitVec 8) (_ BitVec 32)) tuple2!3284)

(assert (=> b!31787 (= lt!46861 (appendBitFromByte!0 thiss!1379 (select (arr!1267 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!31788 () Bool)

(declare-fun res!27190 () Bool)

(assert (=> b!31788 (=> res!27190 e!21058)))

(assert (=> b!31788 (= res!27190 (not (= (size!795 (buf!1123 thiss!1379)) (size!795 (buf!1123 (_2!1729 lt!46867))))))))

(declare-fun b!31789 () Bool)

(declare-fun e!21052 () Bool)

(assert (=> b!31789 (= e!21052 e!21058)))

(declare-fun res!27204 () Bool)

(assert (=> b!31789 (=> res!27204 e!21058)))

(declare-fun lt!46876 () (_ BitVec 64))

(assert (=> b!31789 (= res!27204 (not (= lt!46876 (bvsub (bvadd lt!46858 to!314) i!635))))))

(assert (=> b!31789 (= lt!46876 (bitIndex!0 (size!795 (buf!1123 (_2!1729 lt!46867))) (currentByte!2484 (_2!1729 lt!46867)) (currentBit!2479 (_2!1729 lt!46867))))))

(declare-fun b!31790 () Bool)

(assert (=> b!31790 (= e!21053 (= lt!46876 (bvsub (bvsub (bvadd (bitIndex!0 (size!795 (buf!1123 (_2!1729 lt!46861))) (currentByte!2484 (_2!1729 lt!46861)) (currentBit!2479 (_2!1729 lt!46861))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!31791 () Bool)

(declare-fun res!27203 () Bool)

(assert (=> b!31791 (=> (not res!27203) (not e!21061))))

(assert (=> b!31791 (= res!27203 (validate_offset_bits!1 ((_ sign_extend 32) (size!795 (buf!1123 thiss!1379))) ((_ sign_extend 32) (currentByte!2484 thiss!1379)) ((_ sign_extend 32) (currentBit!2479 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!31792 () Bool)

(assert (=> b!31792 (= e!21054 e!21052)))

(declare-fun res!27195 () Bool)

(assert (=> b!31792 (=> res!27195 e!21052)))

(assert (=> b!31792 (= res!27195 (not (isPrefixOf!0 (_2!1729 lt!46861) (_2!1729 lt!46867))))))

(assert (=> b!31792 (isPrefixOf!0 thiss!1379 (_2!1729 lt!46867))))

(declare-fun lt!46871 () Unit!2421)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1388 BitStream!1388 BitStream!1388) Unit!2421)

(assert (=> b!31792 (= lt!46871 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1729 lt!46861) (_2!1729 lt!46867)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1388 array!1809 (_ BitVec 64) (_ BitVec 64)) tuple2!3284)

(assert (=> b!31792 (= lt!46867 (appendBitsMSBFirstLoop!0 (_2!1729 lt!46861) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!31792 e!21063))

(declare-fun res!27193 () Bool)

(assert (=> b!31792 (=> (not res!27193) (not e!21063))))

(assert (=> b!31792 (= res!27193 (validate_offset_bits!1 ((_ sign_extend 32) (size!795 (buf!1123 (_2!1729 lt!46861)))) ((_ sign_extend 32) (currentByte!2484 thiss!1379)) ((_ sign_extend 32) (currentBit!2479 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46863 () Unit!2421)

(assert (=> b!31792 (= lt!46863 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1123 (_2!1729 lt!46861)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!31792 (= lt!46872 (reader!0 thiss!1379 (_2!1729 lt!46861)))))

(assert (= (and start!6756 res!27196) b!31780))

(assert (= (and b!31780 res!27186) b!31791))

(assert (= (and b!31791 res!27203) b!31781))

(assert (= (and b!31781 (not res!27191)) b!31787))

(assert (= (and b!31787 (not res!27200)) b!31792))

(assert (= (and b!31792 res!27193) b!31776))

(assert (= (and b!31792 (not res!27195)) b!31789))

(assert (= (and b!31789 (not res!27204)) b!31777))

(assert (= (and b!31777 (not res!27198)) b!31788))

(assert (= (and b!31788 (not res!27190)) b!31782))

(assert (= (and b!31782 res!27189) b!31790))

(assert (= (and b!31782 (not res!27199)) b!31786))

(assert (= (and b!31786 (not res!27201)) b!31775))

(assert (= (and b!31775 (not res!27202)) b!31779))

(assert (= (and b!31779 (not res!27187)) b!31784))

(assert (= (and b!31784 (not res!27194)) b!31778))

(assert (= (and b!31778 (not res!27197)) b!31774))

(assert (= (and b!31774 (not res!27192)) b!31785))

(assert (= (and b!31785 (not res!27188)) b!31783))

(assert (= start!6756 b!31773))

(declare-fun m!46821 () Bool)

(assert (=> b!31790 m!46821))

(declare-fun m!46823 () Bool)

(assert (=> b!31778 m!46823))

(declare-fun m!46825 () Bool)

(assert (=> b!31778 m!46825))

(declare-fun m!46827 () Bool)

(assert (=> start!6756 m!46827))

(declare-fun m!46829 () Bool)

(assert (=> start!6756 m!46829))

(declare-fun m!46831 () Bool)

(assert (=> b!31775 m!46831))

(declare-fun m!46833 () Bool)

(assert (=> b!31776 m!46833))

(assert (=> b!31776 m!46833))

(declare-fun m!46835 () Bool)

(assert (=> b!31776 m!46835))

(declare-fun m!46837 () Bool)

(assert (=> b!31776 m!46837))

(assert (=> b!31776 m!46837))

(declare-fun m!46839 () Bool)

(assert (=> b!31776 m!46839))

(declare-fun m!46841 () Bool)

(assert (=> b!31773 m!46841))

(declare-fun m!46843 () Bool)

(assert (=> b!31789 m!46843))

(declare-fun m!46845 () Bool)

(assert (=> b!31781 m!46845))

(declare-fun m!46847 () Bool)

(assert (=> b!31781 m!46847))

(declare-fun m!46849 () Bool)

(assert (=> b!31781 m!46849))

(declare-fun m!46851 () Bool)

(assert (=> b!31786 m!46851))

(declare-fun m!46853 () Bool)

(assert (=> b!31779 m!46853))

(declare-fun m!46855 () Bool)

(assert (=> b!31779 m!46855))

(declare-fun m!46857 () Bool)

(assert (=> b!31779 m!46857))

(declare-fun m!46859 () Bool)

(assert (=> b!31779 m!46859))

(declare-fun m!46861 () Bool)

(assert (=> b!31779 m!46861))

(declare-fun m!46863 () Bool)

(assert (=> b!31779 m!46863))

(declare-fun m!46865 () Bool)

(assert (=> b!31779 m!46865))

(declare-fun m!46867 () Bool)

(assert (=> b!31779 m!46867))

(declare-fun m!46869 () Bool)

(assert (=> b!31777 m!46869))

(declare-fun m!46871 () Bool)

(assert (=> b!31791 m!46871))

(declare-fun m!46873 () Bool)

(assert (=> b!31792 m!46873))

(declare-fun m!46875 () Bool)

(assert (=> b!31792 m!46875))

(declare-fun m!46877 () Bool)

(assert (=> b!31792 m!46877))

(declare-fun m!46879 () Bool)

(assert (=> b!31792 m!46879))

(declare-fun m!46881 () Bool)

(assert (=> b!31792 m!46881))

(declare-fun m!46883 () Bool)

(assert (=> b!31792 m!46883))

(declare-fun m!46885 () Bool)

(assert (=> b!31792 m!46885))

(declare-fun m!46887 () Bool)

(assert (=> b!31774 m!46887))

(declare-fun m!46889 () Bool)

(assert (=> b!31774 m!46889))

(declare-fun m!46891 () Bool)

(assert (=> b!31787 m!46891))

(declare-fun m!46893 () Bool)

(assert (=> b!31787 m!46893))

(assert (=> b!31787 m!46893))

(declare-fun m!46895 () Bool)

(assert (=> b!31787 m!46895))

(declare-fun m!46897 () Bool)

(assert (=> b!31787 m!46897))

(declare-fun m!46899 () Bool)

(assert (=> b!31787 m!46899))

(declare-fun m!46901 () Bool)

(assert (=> b!31785 m!46901))

(declare-fun m!46903 () Bool)

(assert (=> b!31784 m!46903))

(push 1)

(assert (not b!31775))

(assert (not b!31777))

(assert (not b!31784))

(assert (not b!31792))

(assert (not b!31774))

(assert (not b!31787))

(assert (not start!6756))

(assert (not b!31791))

(assert (not b!31789))

(assert (not b!31785))

(assert (not b!31778))

(assert (not b!31776))

(assert (not b!31781))

(assert (not b!31779))

(assert (not b!31773))

(assert (not b!31790))

(assert (not b!31786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

