; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11880 () Bool)

(assert start!11880)

(declare-fun res!50067 () Bool)

(declare-fun e!40059 () Bool)

(assert (=> start!11880 (=> (not res!50067) (not e!40059))))

(declare-datatypes ((array!2737 0))(
  ( (array!2738 (arr!1808 (Array (_ BitVec 32) (_ BitVec 8))) (size!1244 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2737)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!11880 (= res!50067 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1244 srcBuffer!2))))))))

(assert (=> start!11880 e!40059))

(assert (=> start!11880 true))

(declare-fun array_inv!1147 (array!2737) Bool)

(assert (=> start!11880 (array_inv!1147 srcBuffer!2)))

(declare-datatypes ((BitStream!2176 0))(
  ( (BitStream!2177 (buf!1625 array!2737) (currentByte!3243 (_ BitVec 32)) (currentBit!3238 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2176)

(declare-fun e!40060 () Bool)

(declare-fun inv!12 (BitStream!2176) Bool)

(assert (=> start!11880 (and (inv!12 thiss!1379) e!40060)))

(declare-fun b!60084 () Bool)

(declare-fun e!40054 () Bool)

(assert (=> b!60084 (= e!40059 (not e!40054))))

(declare-fun res!50066 () Bool)

(assert (=> b!60084 (=> res!50066 e!40054)))

(assert (=> b!60084 (= res!50066 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2176 BitStream!2176) Bool)

(assert (=> b!60084 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4111 0))(
  ( (Unit!4112) )
))
(declare-fun lt!93934 () Unit!4111)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2176) Unit!4111)

(assert (=> b!60084 (= lt!93934 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!93925 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60084 (= lt!93925 (bitIndex!0 (size!1244 (buf!1625 thiss!1379)) (currentByte!3243 thiss!1379) (currentBit!3238 thiss!1379)))))

(declare-fun b!60085 () Bool)

(declare-fun e!40061 () Bool)

(declare-fun e!40051 () Bool)

(assert (=> b!60085 (= e!40061 e!40051)))

(declare-fun res!50073 () Bool)

(assert (=> b!60085 (=> res!50073 e!40051)))

(declare-datatypes ((tuple2!5474 0))(
  ( (tuple2!5475 (_1!2848 Unit!4111) (_2!2848 BitStream!2176)) )
))
(declare-fun lt!93929 () tuple2!5474)

(declare-fun lt!93921 () tuple2!5474)

(assert (=> b!60085 (= res!50073 (not (= (size!1244 (buf!1625 (_2!2848 lt!93929))) (size!1244 (buf!1625 (_2!2848 lt!93921))))))))

(declare-fun e!40055 () Bool)

(assert (=> b!60085 e!40055))

(declare-fun res!50065 () Bool)

(assert (=> b!60085 (=> (not res!50065) (not e!40055))))

(assert (=> b!60085 (= res!50065 (= (size!1244 (buf!1625 (_2!2848 lt!93921))) (size!1244 (buf!1625 thiss!1379))))))

(declare-fun b!60086 () Bool)

(declare-fun res!50076 () Bool)

(assert (=> b!60086 (=> res!50076 e!40051)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60086 (= res!50076 (not (invariant!0 (currentBit!3238 (_2!2848 lt!93929)) (currentByte!3243 (_2!2848 lt!93929)) (size!1244 (buf!1625 (_2!2848 lt!93929))))))))

(declare-fun b!60087 () Bool)

(declare-fun lt!93928 () (_ BitVec 64))

(assert (=> b!60087 (= e!40055 (= lt!93928 (bvsub (bvsub (bvadd (bitIndex!0 (size!1244 (buf!1625 (_2!2848 lt!93929))) (currentByte!3243 (_2!2848 lt!93929)) (currentBit!3238 (_2!2848 lt!93929))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-datatypes ((tuple2!5476 0))(
  ( (tuple2!5477 (_1!2849 BitStream!2176) (_2!2849 BitStream!2176)) )
))
(declare-fun lt!93924 () tuple2!5476)

(declare-fun b!60088 () Bool)

(declare-fun e!40057 () Bool)

(declare-datatypes ((List!663 0))(
  ( (Nil!660) (Cons!659 (h!778 Bool) (t!1413 List!663)) )
))
(declare-fun head!482 (List!663) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2176 array!2737 (_ BitVec 64) (_ BitVec 64)) List!663)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2176 BitStream!2176 (_ BitVec 64)) List!663)

(assert (=> b!60088 (= e!40057 (= (head!482 (byteArrayBitContentToList!0 (_2!2848 lt!93929) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!482 (bitStreamReadBitsIntoList!0 (_2!2848 lt!93929) (_1!2849 lt!93924) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60089 () Bool)

(assert (=> b!60089 (= e!40060 (array_inv!1147 (buf!1625 thiss!1379)))))

(declare-fun b!60090 () Bool)

(assert (=> b!60090 (= e!40051 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!93919 () (_ BitVec 64))

(declare-fun lt!93927 () List!663)

(declare-fun lt!93930 () tuple2!5476)

(assert (=> b!60090 (= lt!93927 (bitStreamReadBitsIntoList!0 (_2!2848 lt!93921) (_1!2849 lt!93930) lt!93919))))

(declare-fun lt!93931 () tuple2!5476)

(declare-fun lt!93922 () List!663)

(assert (=> b!60090 (= lt!93922 (bitStreamReadBitsIntoList!0 (_2!2848 lt!93921) (_1!2849 lt!93931) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60090 (validate_offset_bits!1 ((_ sign_extend 32) (size!1244 (buf!1625 (_2!2848 lt!93921)))) ((_ sign_extend 32) (currentByte!3243 (_2!2848 lt!93929))) ((_ sign_extend 32) (currentBit!3238 (_2!2848 lt!93929))) lt!93919)))

(declare-fun lt!93926 () Unit!4111)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2176 array!2737 (_ BitVec 64)) Unit!4111)

(assert (=> b!60090 (= lt!93926 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2848 lt!93929) (buf!1625 (_2!2848 lt!93921)) lt!93919))))

(declare-fun reader!0 (BitStream!2176 BitStream!2176) tuple2!5476)

(assert (=> b!60090 (= lt!93930 (reader!0 (_2!2848 lt!93929) (_2!2848 lt!93921)))))

(assert (=> b!60090 (validate_offset_bits!1 ((_ sign_extend 32) (size!1244 (buf!1625 (_2!2848 lt!93921)))) ((_ sign_extend 32) (currentByte!3243 thiss!1379)) ((_ sign_extend 32) (currentBit!3238 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!93933 () Unit!4111)

(assert (=> b!60090 (= lt!93933 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1625 (_2!2848 lt!93921)) (bvsub to!314 i!635)))))

(assert (=> b!60090 (= lt!93931 (reader!0 thiss!1379 (_2!2848 lt!93921)))))

(declare-fun b!60091 () Bool)

(declare-fun res!50064 () Bool)

(assert (=> b!60091 (=> res!50064 e!40051)))

(assert (=> b!60091 (= res!50064 (not (invariant!0 (currentBit!3238 (_2!2848 lt!93929)) (currentByte!3243 (_2!2848 lt!93929)) (size!1244 (buf!1625 (_2!2848 lt!93921))))))))

(declare-fun b!60092 () Bool)

(declare-fun res!50070 () Bool)

(assert (=> b!60092 (=> (not res!50070) (not e!40059))))

(assert (=> b!60092 (= res!50070 (validate_offset_bits!1 ((_ sign_extend 32) (size!1244 (buf!1625 thiss!1379))) ((_ sign_extend 32) (currentByte!3243 thiss!1379)) ((_ sign_extend 32) (currentBit!3238 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60093 () Bool)

(declare-fun res!50071 () Bool)

(assert (=> b!60093 (=> res!50071 e!40061)))

(assert (=> b!60093 (= res!50071 (not (invariant!0 (currentBit!3238 (_2!2848 lt!93921)) (currentByte!3243 (_2!2848 lt!93921)) (size!1244 (buf!1625 (_2!2848 lt!93921))))))))

(declare-fun b!60094 () Bool)

(declare-fun res!50075 () Bool)

(assert (=> b!60094 (=> res!50075 e!40061)))

(assert (=> b!60094 (= res!50075 (not (= (size!1244 (buf!1625 thiss!1379)) (size!1244 (buf!1625 (_2!2848 lt!93921))))))))

(declare-fun b!60095 () Bool)

(declare-fun e!40053 () Bool)

(declare-fun e!40052 () Bool)

(assert (=> b!60095 (= e!40053 e!40052)))

(declare-fun res!50068 () Bool)

(assert (=> b!60095 (=> res!50068 e!40052)))

(assert (=> b!60095 (= res!50068 (not (isPrefixOf!0 (_2!2848 lt!93929) (_2!2848 lt!93921))))))

(assert (=> b!60095 (isPrefixOf!0 thiss!1379 (_2!2848 lt!93921))))

(declare-fun lt!93923 () Unit!4111)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2176 BitStream!2176 BitStream!2176) Unit!4111)

(assert (=> b!60095 (= lt!93923 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2848 lt!93929) (_2!2848 lt!93921)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2176 array!2737 (_ BitVec 64) (_ BitVec 64)) tuple2!5474)

(assert (=> b!60095 (= lt!93921 (appendBitsMSBFirstLoop!0 (_2!2848 lt!93929) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!60095 e!40057))

(declare-fun res!50072 () Bool)

(assert (=> b!60095 (=> (not res!50072) (not e!40057))))

(assert (=> b!60095 (= res!50072 (validate_offset_bits!1 ((_ sign_extend 32) (size!1244 (buf!1625 (_2!2848 lt!93929)))) ((_ sign_extend 32) (currentByte!3243 thiss!1379)) ((_ sign_extend 32) (currentBit!3238 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93920 () Unit!4111)

(assert (=> b!60095 (= lt!93920 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1625 (_2!2848 lt!93929)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!60095 (= lt!93924 (reader!0 thiss!1379 (_2!2848 lt!93929)))))

(declare-fun b!60096 () Bool)

(assert (=> b!60096 (= e!40054 e!40053)))

(declare-fun res!50074 () Bool)

(assert (=> b!60096 (=> res!50074 e!40053)))

(assert (=> b!60096 (= res!50074 (not (isPrefixOf!0 thiss!1379 (_2!2848 lt!93929))))))

(assert (=> b!60096 (validate_offset_bits!1 ((_ sign_extend 32) (size!1244 (buf!1625 (_2!2848 lt!93929)))) ((_ sign_extend 32) (currentByte!3243 (_2!2848 lt!93929))) ((_ sign_extend 32) (currentBit!3238 (_2!2848 lt!93929))) lt!93919)))

(assert (=> b!60096 (= lt!93919 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!93932 () Unit!4111)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2176 BitStream!2176 (_ BitVec 64) (_ BitVec 64)) Unit!4111)

(assert (=> b!60096 (= lt!93932 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2848 lt!93929) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2176 (_ BitVec 8) (_ BitVec 32)) tuple2!5474)

(assert (=> b!60096 (= lt!93929 (appendBitFromByte!0 thiss!1379 (select (arr!1808 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60097 () Bool)

(assert (=> b!60097 (= e!40052 e!40061)))

(declare-fun res!50069 () Bool)

(assert (=> b!60097 (=> res!50069 e!40061)))

(assert (=> b!60097 (= res!50069 (not (= lt!93928 (bvsub (bvadd lt!93925 to!314) i!635))))))

(assert (=> b!60097 (= lt!93928 (bitIndex!0 (size!1244 (buf!1625 (_2!2848 lt!93921))) (currentByte!3243 (_2!2848 lt!93921)) (currentBit!3238 (_2!2848 lt!93921))))))

(assert (= (and start!11880 res!50067) b!60092))

(assert (= (and b!60092 res!50070) b!60084))

(assert (= (and b!60084 (not res!50066)) b!60096))

(assert (= (and b!60096 (not res!50074)) b!60095))

(assert (= (and b!60095 res!50072) b!60088))

(assert (= (and b!60095 (not res!50068)) b!60097))

(assert (= (and b!60097 (not res!50069)) b!60093))

(assert (= (and b!60093 (not res!50071)) b!60094))

(assert (= (and b!60094 (not res!50075)) b!60085))

(assert (= (and b!60085 res!50065) b!60087))

(assert (= (and b!60085 (not res!50073)) b!60086))

(assert (= (and b!60086 (not res!50076)) b!60091))

(assert (= (and b!60091 (not res!50064)) b!60090))

(assert (= start!11880 b!60089))

(declare-fun m!94657 () Bool)

(assert (=> b!60097 m!94657))

(declare-fun m!94659 () Bool)

(assert (=> b!60095 m!94659))

(declare-fun m!94661 () Bool)

(assert (=> b!60095 m!94661))

(declare-fun m!94663 () Bool)

(assert (=> b!60095 m!94663))

(declare-fun m!94665 () Bool)

(assert (=> b!60095 m!94665))

(declare-fun m!94667 () Bool)

(assert (=> b!60095 m!94667))

(declare-fun m!94669 () Bool)

(assert (=> b!60095 m!94669))

(declare-fun m!94671 () Bool)

(assert (=> b!60095 m!94671))

(declare-fun m!94673 () Bool)

(assert (=> b!60084 m!94673))

(declare-fun m!94675 () Bool)

(assert (=> b!60084 m!94675))

(declare-fun m!94677 () Bool)

(assert (=> b!60084 m!94677))

(declare-fun m!94679 () Bool)

(assert (=> b!60090 m!94679))

(declare-fun m!94681 () Bool)

(assert (=> b!60090 m!94681))

(declare-fun m!94683 () Bool)

(assert (=> b!60090 m!94683))

(declare-fun m!94685 () Bool)

(assert (=> b!60090 m!94685))

(declare-fun m!94687 () Bool)

(assert (=> b!60090 m!94687))

(declare-fun m!94689 () Bool)

(assert (=> b!60090 m!94689))

(declare-fun m!94691 () Bool)

(assert (=> b!60090 m!94691))

(declare-fun m!94693 () Bool)

(assert (=> b!60090 m!94693))

(declare-fun m!94695 () Bool)

(assert (=> b!60089 m!94695))

(declare-fun m!94697 () Bool)

(assert (=> b!60091 m!94697))

(declare-fun m!94699 () Bool)

(assert (=> b!60092 m!94699))

(declare-fun m!94701 () Bool)

(assert (=> b!60088 m!94701))

(assert (=> b!60088 m!94701))

(declare-fun m!94703 () Bool)

(assert (=> b!60088 m!94703))

(declare-fun m!94705 () Bool)

(assert (=> b!60088 m!94705))

(assert (=> b!60088 m!94705))

(declare-fun m!94707 () Bool)

(assert (=> b!60088 m!94707))

(declare-fun m!94709 () Bool)

(assert (=> b!60096 m!94709))

(declare-fun m!94711 () Bool)

(assert (=> b!60096 m!94711))

(declare-fun m!94713 () Bool)

(assert (=> b!60096 m!94713))

(assert (=> b!60096 m!94709))

(declare-fun m!94715 () Bool)

(assert (=> b!60096 m!94715))

(declare-fun m!94717 () Bool)

(assert (=> b!60096 m!94717))

(declare-fun m!94719 () Bool)

(assert (=> b!60086 m!94719))

(declare-fun m!94721 () Bool)

(assert (=> b!60093 m!94721))

(declare-fun m!94723 () Bool)

(assert (=> start!11880 m!94723))

(declare-fun m!94725 () Bool)

(assert (=> start!11880 m!94725))

(declare-fun m!94727 () Bool)

(assert (=> b!60087 m!94727))

(push 1)

(assert (not b!60096))

(assert (not b!60097))

(assert (not start!11880))

(assert (not b!60088))

(assert (not b!60084))

(assert (not b!60093))

(assert (not b!60091))

(assert (not b!60089))

(assert (not b!60087))

(assert (not b!60092))

(assert (not b!60090))

(assert (not b!60095))

(assert (not b!60086))

(check-sat)

(pop 1)

(push 1)

(check-sat)

