; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11826 () Bool)

(assert start!11826)

(declare-fun b!58950 () Bool)

(declare-fun e!39167 () Bool)

(declare-fun e!39164 () Bool)

(assert (=> b!58950 (= e!39167 e!39164)))

(declare-fun res!49016 () Bool)

(assert (=> b!58950 (=> res!49016 e!39164)))

(declare-datatypes ((array!2683 0))(
  ( (array!2684 (arr!1781 (Array (_ BitVec 32) (_ BitVec 8))) (size!1217 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2122 0))(
  ( (BitStream!2123 (buf!1598 array!2683) (currentByte!3216 (_ BitVec 32)) (currentBit!3211 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4057 0))(
  ( (Unit!4058) )
))
(declare-datatypes ((tuple2!5366 0))(
  ( (tuple2!5367 (_1!2794 Unit!4057) (_2!2794 BitStream!2122)) )
))
(declare-fun lt!92787 () tuple2!5366)

(declare-fun lt!92782 () tuple2!5366)

(assert (=> b!58950 (= res!49016 (not (= (size!1217 (buf!1598 (_2!2794 lt!92787))) (size!1217 (buf!1598 (_2!2794 lt!92782))))))))

(declare-fun e!39166 () Bool)

(assert (=> b!58950 e!39166))

(declare-fun res!49023 () Bool)

(assert (=> b!58950 (=> (not res!49023) (not e!39166))))

(declare-fun thiss!1379 () BitStream!2122)

(assert (=> b!58950 (= res!49023 (= (size!1217 (buf!1598 (_2!2794 lt!92782))) (size!1217 (buf!1598 thiss!1379))))))

(declare-fun b!58951 () Bool)

(declare-fun e!39161 () Bool)

(assert (=> b!58951 (= e!39161 e!39167)))

(declare-fun res!49017 () Bool)

(assert (=> b!58951 (=> res!49017 e!39167)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!92783 () (_ BitVec 64))

(declare-fun lt!92778 () (_ BitVec 64))

(assert (=> b!58951 (= res!49017 (not (= lt!92783 (bvsub (bvadd lt!92778 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58951 (= lt!92783 (bitIndex!0 (size!1217 (buf!1598 (_2!2794 lt!92782))) (currentByte!3216 (_2!2794 lt!92782)) (currentBit!3211 (_2!2794 lt!92782))))))

(declare-fun b!58952 () Bool)

(declare-fun res!49013 () Bool)

(assert (=> b!58952 (=> res!49013 e!39167)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58952 (= res!49013 (not (invariant!0 (currentBit!3211 (_2!2794 lt!92782)) (currentByte!3216 (_2!2794 lt!92782)) (size!1217 (buf!1598 (_2!2794 lt!92782))))))))

(declare-fun b!58953 () Bool)

(declare-fun res!49015 () Bool)

(assert (=> b!58953 (=> res!49015 e!39167)))

(assert (=> b!58953 (= res!49015 (not (= (size!1217 (buf!1598 thiss!1379)) (size!1217 (buf!1598 (_2!2794 lt!92782))))))))

(declare-fun b!58954 () Bool)

(declare-fun res!49018 () Bool)

(assert (=> b!58954 (=> res!49018 e!39164)))

(assert (=> b!58954 (= res!49018 (not (invariant!0 (currentBit!3211 (_2!2794 lt!92787)) (currentByte!3216 (_2!2794 lt!92787)) (size!1217 (buf!1598 (_2!2794 lt!92787))))))))

(declare-fun b!58955 () Bool)

(declare-fun e!39163 () Bool)

(declare-datatypes ((tuple2!5368 0))(
  ( (tuple2!5369 (_1!2795 BitStream!2122) (_2!2795 BitStream!2122)) )
))
(declare-fun lt!92779 () tuple2!5368)

(declare-fun srcBuffer!2 () array!2683)

(declare-datatypes ((List!636 0))(
  ( (Nil!633) (Cons!632 (h!751 Bool) (t!1386 List!636)) )
))
(declare-fun head!455 (List!636) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2122 array!2683 (_ BitVec 64) (_ BitVec 64)) List!636)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2122 BitStream!2122 (_ BitVec 64)) List!636)

(assert (=> b!58955 (= e!39163 (= (head!455 (byteArrayBitContentToList!0 (_2!2794 lt!92787) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!455 (bitStreamReadBitsIntoList!0 (_2!2794 lt!92787) (_1!2795 lt!92779) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58956 () Bool)

(declare-fun e!39168 () Bool)

(assert (=> b!58956 (= e!39168 e!39161)))

(declare-fun res!49012 () Bool)

(assert (=> b!58956 (=> res!49012 e!39161)))

(declare-fun isPrefixOf!0 (BitStream!2122 BitStream!2122) Bool)

(assert (=> b!58956 (= res!49012 (not (isPrefixOf!0 (_2!2794 lt!92787) (_2!2794 lt!92782))))))

(assert (=> b!58956 (isPrefixOf!0 thiss!1379 (_2!2794 lt!92782))))

(declare-fun lt!92786 () Unit!4057)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2122 BitStream!2122 BitStream!2122) Unit!4057)

(assert (=> b!58956 (= lt!92786 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2794 lt!92787) (_2!2794 lt!92782)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2122 array!2683 (_ BitVec 64) (_ BitVec 64)) tuple2!5366)

(assert (=> b!58956 (= lt!92782 (appendBitsMSBFirstLoop!0 (_2!2794 lt!92787) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58956 e!39163))

(declare-fun res!49021 () Bool)

(assert (=> b!58956 (=> (not res!49021) (not e!39163))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58956 (= res!49021 (validate_offset_bits!1 ((_ sign_extend 32) (size!1217 (buf!1598 (_2!2794 lt!92787)))) ((_ sign_extend 32) (currentByte!3216 thiss!1379)) ((_ sign_extend 32) (currentBit!3211 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92784 () Unit!4057)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2122 array!2683 (_ BitVec 64)) Unit!4057)

(assert (=> b!58956 (= lt!92784 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1598 (_2!2794 lt!92787)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2122 BitStream!2122) tuple2!5368)

(assert (=> b!58956 (= lt!92779 (reader!0 thiss!1379 (_2!2794 lt!92787)))))

(declare-fun b!58957 () Bool)

(declare-fun e!39170 () Bool)

(declare-fun e!39162 () Bool)

(assert (=> b!58957 (= e!39170 (not e!39162))))

(declare-fun res!49019 () Bool)

(assert (=> b!58957 (=> res!49019 e!39162)))

(assert (=> b!58957 (= res!49019 (bvsge i!635 to!314))))

(assert (=> b!58957 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92777 () Unit!4057)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2122) Unit!4057)

(assert (=> b!58957 (= lt!92777 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!58957 (= lt!92778 (bitIndex!0 (size!1217 (buf!1598 thiss!1379)) (currentByte!3216 thiss!1379) (currentBit!3211 thiss!1379)))))

(declare-fun b!58959 () Bool)

(assert (=> b!58959 (= e!39166 (= lt!92783 (bvsub (bvsub (bvadd (bitIndex!0 (size!1217 (buf!1598 (_2!2794 lt!92787))) (currentByte!3216 (_2!2794 lt!92787)) (currentBit!3211 (_2!2794 lt!92787))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58960 () Bool)

(declare-fun e!39169 () Bool)

(declare-fun array_inv!1120 (array!2683) Bool)

(assert (=> b!58960 (= e!39169 (array_inv!1120 (buf!1598 thiss!1379)))))

(declare-fun b!58961 () Bool)

(assert (=> b!58961 (= e!39162 e!39168)))

(declare-fun res!49011 () Bool)

(assert (=> b!58961 (=> res!49011 e!39168)))

(assert (=> b!58961 (= res!49011 (not (isPrefixOf!0 thiss!1379 (_2!2794 lt!92787))))))

(assert (=> b!58961 (validate_offset_bits!1 ((_ sign_extend 32) (size!1217 (buf!1598 (_2!2794 lt!92787)))) ((_ sign_extend 32) (currentByte!3216 (_2!2794 lt!92787))) ((_ sign_extend 32) (currentBit!3211 (_2!2794 lt!92787))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92780 () Unit!4057)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2122 BitStream!2122 (_ BitVec 64) (_ BitVec 64)) Unit!4057)

(assert (=> b!58961 (= lt!92780 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2794 lt!92787) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2122 (_ BitVec 8) (_ BitVec 32)) tuple2!5366)

(assert (=> b!58961 (= lt!92787 (appendBitFromByte!0 thiss!1379 (select (arr!1781 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58962 () Bool)

(declare-fun res!49014 () Bool)

(assert (=> b!58962 (=> (not res!49014) (not e!39170))))

(assert (=> b!58962 (= res!49014 (validate_offset_bits!1 ((_ sign_extend 32) (size!1217 (buf!1598 thiss!1379))) ((_ sign_extend 32) (currentByte!3216 thiss!1379)) ((_ sign_extend 32) (currentBit!3211 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58963 () Bool)

(declare-fun res!49022 () Bool)

(assert (=> b!58963 (=> res!49022 e!39164)))

(assert (=> b!58963 (= res!49022 (not (invariant!0 (currentBit!3211 (_2!2794 lt!92787)) (currentByte!3216 (_2!2794 lt!92787)) (size!1217 (buf!1598 (_2!2794 lt!92782))))))))

(declare-fun b!58958 () Bool)

(assert (=> b!58958 (= e!39164 true)))

(declare-fun lt!92788 () tuple2!5368)

(assert (=> b!58958 (= lt!92788 (reader!0 (_2!2794 lt!92787) (_2!2794 lt!92782)))))

(assert (=> b!58958 (validate_offset_bits!1 ((_ sign_extend 32) (size!1217 (buf!1598 (_2!2794 lt!92782)))) ((_ sign_extend 32) (currentByte!3216 thiss!1379)) ((_ sign_extend 32) (currentBit!3211 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92781 () Unit!4057)

(assert (=> b!58958 (= lt!92781 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1598 (_2!2794 lt!92782)) (bvsub to!314 i!635)))))

(declare-fun lt!92785 () tuple2!5368)

(assert (=> b!58958 (= lt!92785 (reader!0 thiss!1379 (_2!2794 lt!92782)))))

(declare-fun res!49020 () Bool)

(assert (=> start!11826 (=> (not res!49020) (not e!39170))))

(assert (=> start!11826 (= res!49020 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1217 srcBuffer!2))))))))

(assert (=> start!11826 e!39170))

(assert (=> start!11826 true))

(assert (=> start!11826 (array_inv!1120 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2122) Bool)

(assert (=> start!11826 (and (inv!12 thiss!1379) e!39169)))

(assert (= (and start!11826 res!49020) b!58962))

(assert (= (and b!58962 res!49014) b!58957))

(assert (= (and b!58957 (not res!49019)) b!58961))

(assert (= (and b!58961 (not res!49011)) b!58956))

(assert (= (and b!58956 res!49021) b!58955))

(assert (= (and b!58956 (not res!49012)) b!58951))

(assert (= (and b!58951 (not res!49017)) b!58952))

(assert (= (and b!58952 (not res!49013)) b!58953))

(assert (= (and b!58953 (not res!49015)) b!58950))

(assert (= (and b!58950 res!49023) b!58959))

(assert (= (and b!58950 (not res!49016)) b!58954))

(assert (= (and b!58954 (not res!49018)) b!58963))

(assert (= (and b!58963 (not res!49022)) b!58958))

(assert (= start!11826 b!58960))

(declare-fun m!92833 () Bool)

(assert (=> b!58957 m!92833))

(declare-fun m!92835 () Bool)

(assert (=> b!58957 m!92835))

(declare-fun m!92837 () Bool)

(assert (=> b!58957 m!92837))

(declare-fun m!92839 () Bool)

(assert (=> b!58963 m!92839))

(declare-fun m!92841 () Bool)

(assert (=> b!58960 m!92841))

(declare-fun m!92843 () Bool)

(assert (=> b!58956 m!92843))

(declare-fun m!92845 () Bool)

(assert (=> b!58956 m!92845))

(declare-fun m!92847 () Bool)

(assert (=> b!58956 m!92847))

(declare-fun m!92849 () Bool)

(assert (=> b!58956 m!92849))

(declare-fun m!92851 () Bool)

(assert (=> b!58956 m!92851))

(declare-fun m!92853 () Bool)

(assert (=> b!58956 m!92853))

(declare-fun m!92855 () Bool)

(assert (=> b!58956 m!92855))

(declare-fun m!92857 () Bool)

(assert (=> b!58959 m!92857))

(declare-fun m!92859 () Bool)

(assert (=> b!58951 m!92859))

(declare-fun m!92861 () Bool)

(assert (=> start!11826 m!92861))

(declare-fun m!92863 () Bool)

(assert (=> start!11826 m!92863))

(declare-fun m!92865 () Bool)

(assert (=> b!58962 m!92865))

(declare-fun m!92867 () Bool)

(assert (=> b!58954 m!92867))

(declare-fun m!92869 () Bool)

(assert (=> b!58955 m!92869))

(assert (=> b!58955 m!92869))

(declare-fun m!92871 () Bool)

(assert (=> b!58955 m!92871))

(declare-fun m!92873 () Bool)

(assert (=> b!58955 m!92873))

(assert (=> b!58955 m!92873))

(declare-fun m!92875 () Bool)

(assert (=> b!58955 m!92875))

(declare-fun m!92877 () Bool)

(assert (=> b!58952 m!92877))

(declare-fun m!92879 () Bool)

(assert (=> b!58958 m!92879))

(declare-fun m!92881 () Bool)

(assert (=> b!58958 m!92881))

(declare-fun m!92883 () Bool)

(assert (=> b!58958 m!92883))

(declare-fun m!92885 () Bool)

(assert (=> b!58958 m!92885))

(declare-fun m!92887 () Bool)

(assert (=> b!58961 m!92887))

(declare-fun m!92889 () Bool)

(assert (=> b!58961 m!92889))

(declare-fun m!92891 () Bool)

(assert (=> b!58961 m!92891))

(declare-fun m!92893 () Bool)

(assert (=> b!58961 m!92893))

(declare-fun m!92895 () Bool)

(assert (=> b!58961 m!92895))

(assert (=> b!58961 m!92889))

(push 1)

