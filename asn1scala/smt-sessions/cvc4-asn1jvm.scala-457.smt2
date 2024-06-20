; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12448 () Bool)

(assert start!12448)

(declare-fun b!63622 () Bool)

(declare-fun e!42125 () Bool)

(declare-fun e!42123 () Bool)

(assert (=> b!63622 (= e!42125 e!42123)))

(declare-fun res!52883 () Bool)

(assert (=> b!63622 (=> res!52883 e!42123)))

(declare-datatypes ((array!2810 0))(
  ( (array!2811 (arr!1852 (Array (_ BitVec 32) (_ BitVec 8))) (size!1288 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2234 0))(
  ( (BitStream!2235 (buf!1669 array!2810) (currentByte!3317 (_ BitVec 32)) (currentBit!3312 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4317 0))(
  ( (Unit!4318) )
))
(declare-datatypes ((tuple2!5708 0))(
  ( (tuple2!5709 (_1!2965 Unit!4317) (_2!2965 BitStream!2234)) )
))
(declare-fun lt!100239 () tuple2!5708)

(declare-fun lt!100237 () tuple2!5708)

(assert (=> b!63622 (= res!52883 (not (= (size!1288 (buf!1669 (_2!2965 lt!100239))) (size!1288 (buf!1669 (_2!2965 lt!100237))))))))

(declare-fun e!42131 () Bool)

(assert (=> b!63622 e!42131))

(declare-fun res!52877 () Bool)

(assert (=> b!63622 (=> (not res!52877) (not e!42131))))

(declare-fun thiss!1379 () BitStream!2234)

(assert (=> b!63622 (= res!52877 (= (size!1288 (buf!1669 (_2!2965 lt!100237))) (size!1288 (buf!1669 thiss!1379))))))

(declare-fun b!63623 () Bool)

(declare-fun e!42121 () Bool)

(declare-fun e!42124 () Bool)

(assert (=> b!63623 (= e!42121 e!42124)))

(declare-fun res!52879 () Bool)

(assert (=> b!63623 (=> res!52879 e!42124)))

(declare-fun isPrefixOf!0 (BitStream!2234 BitStream!2234) Bool)

(assert (=> b!63623 (= res!52879 (not (isPrefixOf!0 thiss!1379 (_2!2965 lt!100239))))))

(declare-fun lt!100247 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63623 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239))) lt!100247)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!63623 (= lt!100247 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!100245 () Unit!4317)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2234 BitStream!2234 (_ BitVec 64) (_ BitVec 64)) Unit!4317)

(assert (=> b!63623 (= lt!100245 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2965 lt!100239) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2810)

(declare-fun appendBitFromByte!0 (BitStream!2234 (_ BitVec 8) (_ BitVec 32)) tuple2!5708)

(assert (=> b!63623 (= lt!100239 (appendBitFromByte!0 thiss!1379 (select (arr!1852 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!63624 () Bool)

(declare-fun res!52878 () Bool)

(assert (=> b!63624 (=> res!52878 e!42125)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!63624 (= res!52878 (not (invariant!0 (currentBit!3312 (_2!2965 lt!100237)) (currentByte!3317 (_2!2965 lt!100237)) (size!1288 (buf!1669 (_2!2965 lt!100237))))))))

(declare-fun b!63625 () Bool)

(declare-fun e!42122 () Bool)

(declare-fun array_inv!1176 (array!2810) Bool)

(assert (=> b!63625 (= e!42122 (array_inv!1176 (buf!1669 thiss!1379)))))

(declare-fun b!63627 () Bool)

(declare-fun res!52886 () Bool)

(declare-fun e!42129 () Bool)

(assert (=> b!63627 (=> res!52886 e!42129)))

(declare-datatypes ((tuple2!5710 0))(
  ( (tuple2!5711 (_1!2966 BitStream!2234) (_2!2966 BitStream!2234)) )
))
(declare-fun lt!100243 () tuple2!5710)

(assert (=> b!63627 (= res!52886 (not (isPrefixOf!0 (_1!2966 lt!100243) (_2!2965 lt!100237))))))

(declare-fun b!63628 () Bool)

(declare-fun res!52876 () Bool)

(assert (=> b!63628 (=> res!52876 e!42129)))

(declare-fun lt!100240 () tuple2!5710)

(assert (=> b!63628 (= res!52876 (not (isPrefixOf!0 (_1!2966 lt!100240) (_1!2966 lt!100243))))))

(declare-fun b!63629 () Bool)

(declare-fun e!42126 () Bool)

(assert (=> b!63629 (= e!42124 e!42126)))

(declare-fun res!52873 () Bool)

(assert (=> b!63629 (=> res!52873 e!42126)))

(assert (=> b!63629 (= res!52873 (not (isPrefixOf!0 (_2!2965 lt!100239) (_2!2965 lt!100237))))))

(assert (=> b!63629 (isPrefixOf!0 thiss!1379 (_2!2965 lt!100237))))

(declare-fun lt!100249 () Unit!4317)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2234 BitStream!2234 BitStream!2234) Unit!4317)

(assert (=> b!63629 (= lt!100249 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2965 lt!100239) (_2!2965 lt!100237)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2234 array!2810 (_ BitVec 64) (_ BitVec 64)) tuple2!5708)

(assert (=> b!63629 (= lt!100237 (appendBitsMSBFirstLoop!0 (_2!2965 lt!100239) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!42128 () Bool)

(assert (=> b!63629 e!42128))

(declare-fun res!52887 () Bool)

(assert (=> b!63629 (=> (not res!52887) (not e!42128))))

(assert (=> b!63629 (= res!52887 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!100241 () Unit!4317)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2234 array!2810 (_ BitVec 64)) Unit!4317)

(assert (=> b!63629 (= lt!100241 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1669 (_2!2965 lt!100239)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!100235 () tuple2!5710)

(declare-fun reader!0 (BitStream!2234 BitStream!2234) tuple2!5710)

(assert (=> b!63629 (= lt!100235 (reader!0 thiss!1379 (_2!2965 lt!100239)))))

(declare-fun b!63630 () Bool)

(declare-fun res!52870 () Bool)

(assert (=> b!63630 (=> res!52870 e!42123)))

(assert (=> b!63630 (= res!52870 (not (invariant!0 (currentBit!3312 (_2!2965 lt!100239)) (currentByte!3317 (_2!2965 lt!100239)) (size!1288 (buf!1669 (_2!2965 lt!100237))))))))

(declare-fun b!63631 () Bool)

(declare-fun lt!100238 () (_ BitVec 64))

(assert (=> b!63631 (= e!42129 (or (not (= (buf!1669 (_1!2966 lt!100240)) (buf!1669 (_1!2966 lt!100243)))) (not (= (buf!1669 (_1!2966 lt!100240)) (buf!1669 (_2!2965 lt!100237)))) (bvslt lt!100238 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!63632 () Bool)

(declare-fun res!52885 () Bool)

(assert (=> b!63632 (=> res!52885 e!42125)))

(assert (=> b!63632 (= res!52885 (not (= (size!1288 (buf!1669 thiss!1379)) (size!1288 (buf!1669 (_2!2965 lt!100237))))))))

(declare-fun b!63633 () Bool)

(declare-fun res!52881 () Bool)

(declare-fun e!42127 () Bool)

(assert (=> b!63633 (=> (not res!52881) (not e!42127))))

(assert (=> b!63633 (= res!52881 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 thiss!1379))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!63634 () Bool)

(declare-datatypes ((List!692 0))(
  ( (Nil!689) (Cons!688 (h!807 Bool) (t!1442 List!692)) )
))
(declare-fun head!511 (List!692) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2234 array!2810 (_ BitVec 64) (_ BitVec 64)) List!692)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2234 BitStream!2234 (_ BitVec 64)) List!692)

(assert (=> b!63634 (= e!42128 (= (head!511 (byteArrayBitContentToList!0 (_2!2965 lt!100239) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!511 (bitStreamReadBitsIntoList!0 (_2!2965 lt!100239) (_1!2966 lt!100235) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!63635 () Bool)

(assert (=> b!63635 (= e!42123 e!42129)))

(declare-fun res!52875 () Bool)

(assert (=> b!63635 (=> res!52875 e!42129)))

(assert (=> b!63635 (= res!52875 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100244 () List!692)

(assert (=> b!63635 (= lt!100244 (bitStreamReadBitsIntoList!0 (_2!2965 lt!100237) (_1!2966 lt!100243) lt!100247))))

(declare-fun lt!100242 () List!692)

(assert (=> b!63635 (= lt!100242 (bitStreamReadBitsIntoList!0 (_2!2965 lt!100237) (_1!2966 lt!100240) (bvsub to!314 i!635)))))

(assert (=> b!63635 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100237)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239))) lt!100247)))

(declare-fun lt!100248 () Unit!4317)

(assert (=> b!63635 (= lt!100248 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2965 lt!100239) (buf!1669 (_2!2965 lt!100237)) lt!100247))))

(assert (=> b!63635 (= lt!100243 (reader!0 (_2!2965 lt!100239) (_2!2965 lt!100237)))))

(assert (=> b!63635 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100237)))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!100234 () Unit!4317)

(assert (=> b!63635 (= lt!100234 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1669 (_2!2965 lt!100237)) (bvsub to!314 i!635)))))

(assert (=> b!63635 (= lt!100240 (reader!0 thiss!1379 (_2!2965 lt!100237)))))

(declare-fun b!63636 () Bool)

(declare-fun res!52880 () Bool)

(assert (=> b!63636 (=> res!52880 e!42129)))

(assert (=> b!63636 (= res!52880 (not (isPrefixOf!0 (_1!2966 lt!100240) (_2!2965 lt!100237))))))

(declare-fun b!63637 () Bool)

(assert (=> b!63637 (= e!42127 (not e!42121))))

(declare-fun res!52874 () Bool)

(assert (=> b!63637 (=> res!52874 e!42121)))

(assert (=> b!63637 (= res!52874 (bvsge i!635 to!314))))

(assert (=> b!63637 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!100236 () Unit!4317)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2234) Unit!4317)

(assert (=> b!63637 (= lt!100236 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!100246 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!63637 (= lt!100246 (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)))))

(declare-fun b!63638 () Bool)

(assert (=> b!63638 (= e!42126 e!42125)))

(declare-fun res!52871 () Bool)

(assert (=> b!63638 (=> res!52871 e!42125)))

(assert (=> b!63638 (= res!52871 (not (= lt!100238 (bvsub (bvadd lt!100246 to!314) i!635))))))

(assert (=> b!63638 (= lt!100238 (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100237))) (currentByte!3317 (_2!2965 lt!100237)) (currentBit!3312 (_2!2965 lt!100237))))))

(declare-fun b!63639 () Bool)

(declare-fun res!52884 () Bool)

(assert (=> b!63639 (=> res!52884 e!42129)))

(declare-fun length!320 (List!692) Int)

(assert (=> b!63639 (= res!52884 (<= (length!320 lt!100242) 0))))

(declare-fun b!63640 () Bool)

(declare-fun res!52882 () Bool)

(assert (=> b!63640 (=> res!52882 e!42123)))

(assert (=> b!63640 (= res!52882 (not (invariant!0 (currentBit!3312 (_2!2965 lt!100239)) (currentByte!3317 (_2!2965 lt!100239)) (size!1288 (buf!1669 (_2!2965 lt!100239))))))))

(declare-fun b!63626 () Bool)

(assert (=> b!63626 (= e!42131 (= lt!100238 (bvsub (bvsub (bvadd (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100239))) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!52872 () Bool)

(assert (=> start!12448 (=> (not res!52872) (not e!42127))))

(assert (=> start!12448 (= res!52872 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1288 srcBuffer!2))))))))

(assert (=> start!12448 e!42127))

(assert (=> start!12448 true))

(assert (=> start!12448 (array_inv!1176 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2234) Bool)

(assert (=> start!12448 (and (inv!12 thiss!1379) e!42122)))

(assert (= (and start!12448 res!52872) b!63633))

(assert (= (and b!63633 res!52881) b!63637))

(assert (= (and b!63637 (not res!52874)) b!63623))

(assert (= (and b!63623 (not res!52879)) b!63629))

(assert (= (and b!63629 res!52887) b!63634))

(assert (= (and b!63629 (not res!52873)) b!63638))

(assert (= (and b!63638 (not res!52871)) b!63624))

(assert (= (and b!63624 (not res!52878)) b!63632))

(assert (= (and b!63632 (not res!52885)) b!63622))

(assert (= (and b!63622 res!52877) b!63626))

(assert (= (and b!63622 (not res!52883)) b!63640))

(assert (= (and b!63640 (not res!52882)) b!63630))

(assert (= (and b!63630 (not res!52870)) b!63635))

(assert (= (and b!63635 (not res!52875)) b!63639))

(assert (= (and b!63639 (not res!52884)) b!63636))

(assert (= (and b!63636 (not res!52880)) b!63627))

(assert (= (and b!63627 (not res!52886)) b!63628))

(assert (= (and b!63628 (not res!52876)) b!63631))

(assert (= start!12448 b!63625))

(declare-fun m!100787 () Bool)

(assert (=> b!63624 m!100787))

(declare-fun m!100789 () Bool)

(assert (=> start!12448 m!100789))

(declare-fun m!100791 () Bool)

(assert (=> start!12448 m!100791))

(declare-fun m!100793 () Bool)

(assert (=> b!63629 m!100793))

(declare-fun m!100795 () Bool)

(assert (=> b!63629 m!100795))

(declare-fun m!100797 () Bool)

(assert (=> b!63629 m!100797))

(declare-fun m!100799 () Bool)

(assert (=> b!63629 m!100799))

(declare-fun m!100801 () Bool)

(assert (=> b!63629 m!100801))

(declare-fun m!100803 () Bool)

(assert (=> b!63629 m!100803))

(declare-fun m!100805 () Bool)

(assert (=> b!63629 m!100805))

(declare-fun m!100807 () Bool)

(assert (=> b!63628 m!100807))

(declare-fun m!100809 () Bool)

(assert (=> b!63637 m!100809))

(declare-fun m!100811 () Bool)

(assert (=> b!63637 m!100811))

(declare-fun m!100813 () Bool)

(assert (=> b!63637 m!100813))

(declare-fun m!100815 () Bool)

(assert (=> b!63640 m!100815))

(declare-fun m!100817 () Bool)

(assert (=> b!63636 m!100817))

(declare-fun m!100819 () Bool)

(assert (=> b!63634 m!100819))

(assert (=> b!63634 m!100819))

(declare-fun m!100821 () Bool)

(assert (=> b!63634 m!100821))

(declare-fun m!100823 () Bool)

(assert (=> b!63634 m!100823))

(assert (=> b!63634 m!100823))

(declare-fun m!100825 () Bool)

(assert (=> b!63634 m!100825))

(declare-fun m!100827 () Bool)

(assert (=> b!63627 m!100827))

(declare-fun m!100829 () Bool)

(assert (=> b!63635 m!100829))

(declare-fun m!100831 () Bool)

(assert (=> b!63635 m!100831))

(declare-fun m!100833 () Bool)

(assert (=> b!63635 m!100833))

(declare-fun m!100835 () Bool)

(assert (=> b!63635 m!100835))

(declare-fun m!100837 () Bool)

(assert (=> b!63635 m!100837))

(declare-fun m!100839 () Bool)

(assert (=> b!63635 m!100839))

(declare-fun m!100841 () Bool)

(assert (=> b!63635 m!100841))

(declare-fun m!100843 () Bool)

(assert (=> b!63635 m!100843))

(declare-fun m!100845 () Bool)

(assert (=> b!63625 m!100845))

(declare-fun m!100847 () Bool)

(assert (=> b!63630 m!100847))

(declare-fun m!100849 () Bool)

(assert (=> b!63639 m!100849))

(declare-fun m!100851 () Bool)

(assert (=> b!63626 m!100851))

(declare-fun m!100853 () Bool)

(assert (=> b!63623 m!100853))

(declare-fun m!100855 () Bool)

(assert (=> b!63623 m!100855))

(declare-fun m!100857 () Bool)

(assert (=> b!63623 m!100857))

(declare-fun m!100859 () Bool)

(assert (=> b!63623 m!100859))

(assert (=> b!63623 m!100855))

(declare-fun m!100861 () Bool)

(assert (=> b!63623 m!100861))

(declare-fun m!100863 () Bool)

(assert (=> b!63638 m!100863))

(declare-fun m!100865 () Bool)

(assert (=> b!63633 m!100865))

(push 1)

(assert (not b!63638))

(assert (not b!63630))

(assert (not b!63629))

(assert (not b!63640))

(assert (not b!63637))

(assert (not start!12448))

(assert (not b!63636))

(assert (not b!63626))

(assert (not b!63633))

(assert (not b!63628))

(assert (not b!63639))

(assert (not b!63627))

(assert (not b!63623))

(assert (not b!63635))

(assert (not b!63624))

(assert (not b!63634))

(assert (not b!63625))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!19828 () Bool)

(declare-fun e!42207 () Bool)

(assert (=> d!19828 e!42207))

(declare-fun res!52976 () Bool)

(assert (=> d!19828 (=> (not res!52976) (not e!42207))))

(declare-fun lt!100451 () (_ BitVec 64))

(declare-fun lt!100452 () (_ BitVec 64))

(declare-fun lt!100456 () (_ BitVec 64))

(assert (=> d!19828 (= res!52976 (= lt!100451 (bvsub lt!100452 lt!100456)))))

(assert (=> d!19828 (or (= (bvand lt!100452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100456 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100452 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100452 lt!100456) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19828 (= lt!100456 (remainingBits!0 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100237)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100237))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100237)))))))

(declare-fun lt!100453 () (_ BitVec 64))

(declare-fun lt!100454 () (_ BitVec 64))

(assert (=> d!19828 (= lt!100452 (bvmul lt!100453 lt!100454))))

(assert (=> d!19828 (or (= lt!100453 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!100454 (bvsdiv (bvmul lt!100453 lt!100454) lt!100453)))))

(assert (=> d!19828 (= lt!100454 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19828 (= lt!100453 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100237)))))))

(assert (=> d!19828 (= lt!100451 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100237))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100237)))))))

(assert (=> d!19828 (invariant!0 (currentBit!3312 (_2!2965 lt!100237)) (currentByte!3317 (_2!2965 lt!100237)) (size!1288 (buf!1669 (_2!2965 lt!100237))))))

(assert (=> d!19828 (= (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100237))) (currentByte!3317 (_2!2965 lt!100237)) (currentBit!3312 (_2!2965 lt!100237))) lt!100451)))

(declare-fun b!63782 () Bool)

(declare-fun res!52977 () Bool)

(assert (=> b!63782 (=> (not res!52977) (not e!42207))))

(assert (=> b!63782 (= res!52977 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!100451))))

(declare-fun b!63783 () Bool)

(declare-fun lt!100455 () (_ BitVec 64))

(assert (=> b!63783 (= e!42207 (bvsle lt!100451 (bvmul lt!100455 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63783 (or (= lt!100455 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!100455 #b0000000000000000000000000000000000000000000000000000000000001000) lt!100455)))))

(assert (=> b!63783 (= lt!100455 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100237)))))))

(assert (= (and d!19828 res!52976) b!63782))

(assert (= (and b!63782 res!52977) b!63783))

(declare-fun m!101035 () Bool)

(assert (=> d!19828 m!101035))

(assert (=> d!19828 m!100787))

(assert (=> b!63638 d!19828))

(declare-fun d!19830 () Bool)

(declare-fun res!52984 () Bool)

(declare-fun e!42212 () Bool)

(assert (=> d!19830 (=> (not res!52984) (not e!42212))))

(assert (=> d!19830 (= res!52984 (= (size!1288 (buf!1669 (_1!2966 lt!100243))) (size!1288 (buf!1669 (_2!2965 lt!100237)))))))

(assert (=> d!19830 (= (isPrefixOf!0 (_1!2966 lt!100243) (_2!2965 lt!100237)) e!42212)))

(declare-fun b!63790 () Bool)

(declare-fun res!52986 () Bool)

(assert (=> b!63790 (=> (not res!52986) (not e!42212))))

(assert (=> b!63790 (= res!52986 (bvsle (bitIndex!0 (size!1288 (buf!1669 (_1!2966 lt!100243))) (currentByte!3317 (_1!2966 lt!100243)) (currentBit!3312 (_1!2966 lt!100243))) (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100237))) (currentByte!3317 (_2!2965 lt!100237)) (currentBit!3312 (_2!2965 lt!100237)))))))

(declare-fun b!63791 () Bool)

(declare-fun e!42213 () Bool)

(assert (=> b!63791 (= e!42212 e!42213)))

(declare-fun res!52985 () Bool)

(assert (=> b!63791 (=> res!52985 e!42213)))

(assert (=> b!63791 (= res!52985 (= (size!1288 (buf!1669 (_1!2966 lt!100243))) #b00000000000000000000000000000000))))

(declare-fun b!63792 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2810 array!2810 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63792 (= e!42213 (arrayBitRangesEq!0 (buf!1669 (_1!2966 lt!100243)) (buf!1669 (_2!2965 lt!100237)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1288 (buf!1669 (_1!2966 lt!100243))) (currentByte!3317 (_1!2966 lt!100243)) (currentBit!3312 (_1!2966 lt!100243)))))))

(assert (= (and d!19830 res!52984) b!63790))

(assert (= (and b!63790 res!52986) b!63791))

(assert (= (and b!63791 (not res!52985)) b!63792))

(declare-fun m!101037 () Bool)

(assert (=> b!63790 m!101037))

(assert (=> b!63790 m!100863))

(assert (=> b!63792 m!101037))

(assert (=> b!63792 m!101037))

(declare-fun m!101039 () Bool)

(assert (=> b!63792 m!101039))

(assert (=> b!63627 d!19830))

(declare-fun d!19832 () Bool)

(declare-fun res!52987 () Bool)

(declare-fun e!42214 () Bool)

(assert (=> d!19832 (=> (not res!52987) (not e!42214))))

(assert (=> d!19832 (= res!52987 (= (size!1288 (buf!1669 thiss!1379)) (size!1288 (buf!1669 thiss!1379))))))

(assert (=> d!19832 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!42214)))

(declare-fun b!63793 () Bool)

(declare-fun res!52989 () Bool)

(assert (=> b!63793 (=> (not res!52989) (not e!42214))))

(assert (=> b!63793 (= res!52989 (bvsle (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)) (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379))))))

(declare-fun b!63794 () Bool)

(declare-fun e!42215 () Bool)

(assert (=> b!63794 (= e!42214 e!42215)))

(declare-fun res!52988 () Bool)

(assert (=> b!63794 (=> res!52988 e!42215)))

(assert (=> b!63794 (= res!52988 (= (size!1288 (buf!1669 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63795 () Bool)

(assert (=> b!63795 (= e!42215 (arrayBitRangesEq!0 (buf!1669 thiss!1379) (buf!1669 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379))))))

(assert (= (and d!19832 res!52987) b!63793))

(assert (= (and b!63793 res!52989) b!63794))

(assert (= (and b!63794 (not res!52988)) b!63795))

(assert (=> b!63793 m!100813))

(assert (=> b!63793 m!100813))

(assert (=> b!63795 m!100813))

(assert (=> b!63795 m!100813))

(declare-fun m!101041 () Bool)

(assert (=> b!63795 m!101041))

(assert (=> b!63637 d!19832))

(declare-fun d!19834 () Bool)

(assert (=> d!19834 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!100459 () Unit!4317)

(declare-fun choose!11 (BitStream!2234) Unit!4317)

(assert (=> d!19834 (= lt!100459 (choose!11 thiss!1379))))

(assert (=> d!19834 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!100459)))

(declare-fun bs!4886 () Bool)

(assert (= bs!4886 d!19834))

(assert (=> bs!4886 m!100809))

(declare-fun m!101043 () Bool)

(assert (=> bs!4886 m!101043))

(assert (=> b!63637 d!19834))

(declare-fun d!19836 () Bool)

(declare-fun e!42216 () Bool)

(assert (=> d!19836 e!42216))

(declare-fun res!52990 () Bool)

(assert (=> d!19836 (=> (not res!52990) (not e!42216))))

(declare-fun lt!100465 () (_ BitVec 64))

(declare-fun lt!100460 () (_ BitVec 64))

(declare-fun lt!100461 () (_ BitVec 64))

(assert (=> d!19836 (= res!52990 (= lt!100460 (bvsub lt!100461 lt!100465)))))

(assert (=> d!19836 (or (= (bvand lt!100461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100465 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100461 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100461 lt!100465) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19836 (= lt!100465 (remainingBits!0 ((_ sign_extend 32) (size!1288 (buf!1669 thiss!1379))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379))))))

(declare-fun lt!100462 () (_ BitVec 64))

(declare-fun lt!100463 () (_ BitVec 64))

(assert (=> d!19836 (= lt!100461 (bvmul lt!100462 lt!100463))))

(assert (=> d!19836 (or (= lt!100462 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!100463 (bvsdiv (bvmul lt!100462 lt!100463) lt!100462)))))

(assert (=> d!19836 (= lt!100463 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19836 (= lt!100462 ((_ sign_extend 32) (size!1288 (buf!1669 thiss!1379))))))

(assert (=> d!19836 (= lt!100460 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3317 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3312 thiss!1379))))))

(assert (=> d!19836 (invariant!0 (currentBit!3312 thiss!1379) (currentByte!3317 thiss!1379) (size!1288 (buf!1669 thiss!1379)))))

(assert (=> d!19836 (= (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)) lt!100460)))

(declare-fun b!63796 () Bool)

(declare-fun res!52991 () Bool)

(assert (=> b!63796 (=> (not res!52991) (not e!42216))))

(assert (=> b!63796 (= res!52991 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!100460))))

(declare-fun b!63797 () Bool)

(declare-fun lt!100464 () (_ BitVec 64))

(assert (=> b!63797 (= e!42216 (bvsle lt!100460 (bvmul lt!100464 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63797 (or (= lt!100464 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!100464 #b0000000000000000000000000000000000000000000000000000000000001000) lt!100464)))))

(assert (=> b!63797 (= lt!100464 ((_ sign_extend 32) (size!1288 (buf!1669 thiss!1379))))))

(assert (= (and d!19836 res!52990) b!63796))

(assert (= (and b!63796 res!52991) b!63797))

(declare-fun m!101045 () Bool)

(assert (=> d!19836 m!101045))

(declare-fun m!101047 () Bool)

(assert (=> d!19836 m!101047))

(assert (=> b!63637 d!19836))

(declare-fun d!19838 () Bool)

(assert (=> d!19838 (= (array_inv!1176 srcBuffer!2) (bvsge (size!1288 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12448 d!19838))

(declare-fun d!19840 () Bool)

(assert (=> d!19840 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3312 thiss!1379) (currentByte!3317 thiss!1379) (size!1288 (buf!1669 thiss!1379))))))

(declare-fun bs!4887 () Bool)

(assert (= bs!4887 d!19840))

(assert (=> bs!4887 m!101047))

(assert (=> start!12448 d!19840))

(declare-fun d!19842 () Bool)

(declare-fun size!1291 (List!692) Int)

(assert (=> d!19842 (= (length!320 lt!100242) (size!1291 lt!100242))))

(declare-fun bs!4888 () Bool)

(assert (= bs!4888 d!19842))

(declare-fun m!101049 () Bool)

(assert (=> bs!4888 m!101049))

(assert (=> b!63639 d!19842))

(declare-fun d!19844 () Bool)

(declare-fun res!52992 () Bool)

(declare-fun e!42217 () Bool)

(assert (=> d!19844 (=> (not res!52992) (not e!42217))))

(assert (=> d!19844 (= res!52992 (= (size!1288 (buf!1669 (_1!2966 lt!100240))) (size!1288 (buf!1669 (_1!2966 lt!100243)))))))

(assert (=> d!19844 (= (isPrefixOf!0 (_1!2966 lt!100240) (_1!2966 lt!100243)) e!42217)))

(declare-fun b!63798 () Bool)

(declare-fun res!52994 () Bool)

(assert (=> b!63798 (=> (not res!52994) (not e!42217))))

(assert (=> b!63798 (= res!52994 (bvsle (bitIndex!0 (size!1288 (buf!1669 (_1!2966 lt!100240))) (currentByte!3317 (_1!2966 lt!100240)) (currentBit!3312 (_1!2966 lt!100240))) (bitIndex!0 (size!1288 (buf!1669 (_1!2966 lt!100243))) (currentByte!3317 (_1!2966 lt!100243)) (currentBit!3312 (_1!2966 lt!100243)))))))

(declare-fun b!63799 () Bool)

(declare-fun e!42218 () Bool)

(assert (=> b!63799 (= e!42217 e!42218)))

(declare-fun res!52993 () Bool)

(assert (=> b!63799 (=> res!52993 e!42218)))

(assert (=> b!63799 (= res!52993 (= (size!1288 (buf!1669 (_1!2966 lt!100240))) #b00000000000000000000000000000000))))

(declare-fun b!63800 () Bool)

(assert (=> b!63800 (= e!42218 (arrayBitRangesEq!0 (buf!1669 (_1!2966 lt!100240)) (buf!1669 (_1!2966 lt!100243)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1288 (buf!1669 (_1!2966 lt!100240))) (currentByte!3317 (_1!2966 lt!100240)) (currentBit!3312 (_1!2966 lt!100240)))))))

(assert (= (and d!19844 res!52992) b!63798))

(assert (= (and b!63798 res!52994) b!63799))

(assert (= (and b!63799 (not res!52993)) b!63800))

(declare-fun m!101051 () Bool)

(assert (=> b!63798 m!101051))

(assert (=> b!63798 m!101037))

(assert (=> b!63800 m!101051))

(assert (=> b!63800 m!101051))

(declare-fun m!101053 () Bool)

(assert (=> b!63800 m!101053))

(assert (=> b!63628 d!19844))

(declare-fun d!19846 () Bool)

(assert (=> d!19846 (= (invariant!0 (currentBit!3312 (_2!2965 lt!100239)) (currentByte!3317 (_2!2965 lt!100239)) (size!1288 (buf!1669 (_2!2965 lt!100237)))) (and (bvsge (currentBit!3312 (_2!2965 lt!100239)) #b00000000000000000000000000000000) (bvslt (currentBit!3312 (_2!2965 lt!100239)) #b00000000000000000000000000001000) (bvsge (currentByte!3317 (_2!2965 lt!100239)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3317 (_2!2965 lt!100239)) (size!1288 (buf!1669 (_2!2965 lt!100237)))) (and (= (currentBit!3312 (_2!2965 lt!100239)) #b00000000000000000000000000000000) (= (currentByte!3317 (_2!2965 lt!100239)) (size!1288 (buf!1669 (_2!2965 lt!100237))))))))))

(assert (=> b!63630 d!19846))

(declare-fun d!19848 () Bool)

(assert (=> d!19848 (= (invariant!0 (currentBit!3312 (_2!2965 lt!100239)) (currentByte!3317 (_2!2965 lt!100239)) (size!1288 (buf!1669 (_2!2965 lt!100239)))) (and (bvsge (currentBit!3312 (_2!2965 lt!100239)) #b00000000000000000000000000000000) (bvslt (currentBit!3312 (_2!2965 lt!100239)) #b00000000000000000000000000001000) (bvsge (currentByte!3317 (_2!2965 lt!100239)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3317 (_2!2965 lt!100239)) (size!1288 (buf!1669 (_2!2965 lt!100239)))) (and (= (currentBit!3312 (_2!2965 lt!100239)) #b00000000000000000000000000000000) (= (currentByte!3317 (_2!2965 lt!100239)) (size!1288 (buf!1669 (_2!2965 lt!100239))))))))))

(assert (=> b!63640 d!19848))

(declare-fun d!19850 () Bool)

(assert (=> d!19850 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4889 () Bool)

(assert (= bs!4889 d!19850))

(declare-fun m!101055 () Bool)

(assert (=> bs!4889 m!101055))

(assert (=> b!63629 d!19850))

(declare-fun lt!100523 () (_ BitVec 64))

(declare-fun lt!100506 () tuple2!5710)

(declare-fun lt!100509 () (_ BitVec 64))

(declare-fun e!42224 () Bool)

(declare-fun b!63811 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2234 (_ BitVec 64)) BitStream!2234)

(assert (=> b!63811 (= e!42224 (= (_1!2966 lt!100506) (withMovedBitIndex!0 (_2!2966 lt!100506) (bvsub lt!100523 lt!100509))))))

(assert (=> b!63811 (or (= (bvand lt!100523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100509 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100523 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100523 lt!100509) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63811 (= lt!100509 (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100239))) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239))))))

(assert (=> b!63811 (= lt!100523 (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)))))

(declare-fun b!63812 () Bool)

(declare-fun e!42223 () Unit!4317)

(declare-fun lt!100513 () Unit!4317)

(assert (=> b!63812 (= e!42223 lt!100513)))

(declare-fun lt!100517 () (_ BitVec 64))

(assert (=> b!63812 (= lt!100517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!100522 () (_ BitVec 64))

(assert (=> b!63812 (= lt!100522 (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2810 array!2810 (_ BitVec 64) (_ BitVec 64)) Unit!4317)

(assert (=> b!63812 (= lt!100513 (arrayBitRangesEqSymmetric!0 (buf!1669 thiss!1379) (buf!1669 (_2!2965 lt!100239)) lt!100517 lt!100522))))

(assert (=> b!63812 (arrayBitRangesEq!0 (buf!1669 (_2!2965 lt!100239)) (buf!1669 thiss!1379) lt!100517 lt!100522)))

(declare-fun b!63813 () Bool)

(declare-fun res!53001 () Bool)

(assert (=> b!63813 (=> (not res!53001) (not e!42224))))

(assert (=> b!63813 (= res!53001 (isPrefixOf!0 (_2!2966 lt!100506) (_2!2965 lt!100239)))))

(declare-fun d!19852 () Bool)

(assert (=> d!19852 e!42224))

(declare-fun res!53002 () Bool)

(assert (=> d!19852 (=> (not res!53002) (not e!42224))))

(assert (=> d!19852 (= res!53002 (isPrefixOf!0 (_1!2966 lt!100506) (_2!2966 lt!100506)))))

(declare-fun lt!100510 () BitStream!2234)

(assert (=> d!19852 (= lt!100506 (tuple2!5711 lt!100510 (_2!2965 lt!100239)))))

(declare-fun lt!100516 () Unit!4317)

(declare-fun lt!100525 () Unit!4317)

(assert (=> d!19852 (= lt!100516 lt!100525)))

(assert (=> d!19852 (isPrefixOf!0 lt!100510 (_2!2965 lt!100239))))

(assert (=> d!19852 (= lt!100525 (lemmaIsPrefixTransitive!0 lt!100510 (_2!2965 lt!100239) (_2!2965 lt!100239)))))

(declare-fun lt!100511 () Unit!4317)

(declare-fun lt!100520 () Unit!4317)

(assert (=> d!19852 (= lt!100511 lt!100520)))

(assert (=> d!19852 (isPrefixOf!0 lt!100510 (_2!2965 lt!100239))))

(assert (=> d!19852 (= lt!100520 (lemmaIsPrefixTransitive!0 lt!100510 thiss!1379 (_2!2965 lt!100239)))))

(declare-fun lt!100515 () Unit!4317)

(assert (=> d!19852 (= lt!100515 e!42223)))

(declare-fun c!4571 () Bool)

(assert (=> d!19852 (= c!4571 (not (= (size!1288 (buf!1669 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!100521 () Unit!4317)

(declare-fun lt!100519 () Unit!4317)

(assert (=> d!19852 (= lt!100521 lt!100519)))

(assert (=> d!19852 (isPrefixOf!0 (_2!2965 lt!100239) (_2!2965 lt!100239))))

(assert (=> d!19852 (= lt!100519 (lemmaIsPrefixRefl!0 (_2!2965 lt!100239)))))

(declare-fun lt!100507 () Unit!4317)

(declare-fun lt!100514 () Unit!4317)

(assert (=> d!19852 (= lt!100507 lt!100514)))

(assert (=> d!19852 (= lt!100514 (lemmaIsPrefixRefl!0 (_2!2965 lt!100239)))))

(declare-fun lt!100512 () Unit!4317)

(declare-fun lt!100508 () Unit!4317)

(assert (=> d!19852 (= lt!100512 lt!100508)))

(assert (=> d!19852 (isPrefixOf!0 lt!100510 lt!100510)))

(assert (=> d!19852 (= lt!100508 (lemmaIsPrefixRefl!0 lt!100510))))

(declare-fun lt!100524 () Unit!4317)

(declare-fun lt!100518 () Unit!4317)

(assert (=> d!19852 (= lt!100524 lt!100518)))

(assert (=> d!19852 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19852 (= lt!100518 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19852 (= lt!100510 (BitStream!2235 (buf!1669 (_2!2965 lt!100239)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)))))

(assert (=> d!19852 (isPrefixOf!0 thiss!1379 (_2!2965 lt!100239))))

(assert (=> d!19852 (= (reader!0 thiss!1379 (_2!2965 lt!100239)) lt!100506)))

(declare-fun b!63814 () Bool)

(declare-fun Unit!4339 () Unit!4317)

(assert (=> b!63814 (= e!42223 Unit!4339)))

(declare-fun b!63815 () Bool)

(declare-fun res!53003 () Bool)

(assert (=> b!63815 (=> (not res!53003) (not e!42224))))

(assert (=> b!63815 (= res!53003 (isPrefixOf!0 (_1!2966 lt!100506) thiss!1379))))

(assert (= (and d!19852 c!4571) b!63812))

(assert (= (and d!19852 (not c!4571)) b!63814))

(assert (= (and d!19852 res!53002) b!63815))

(assert (= (and b!63815 res!53003) b!63813))

(assert (= (and b!63813 res!53001) b!63811))

(assert (=> b!63812 m!100813))

(declare-fun m!101057 () Bool)

(assert (=> b!63812 m!101057))

(declare-fun m!101059 () Bool)

(assert (=> b!63812 m!101059))

(declare-fun m!101061 () Bool)

(assert (=> d!19852 m!101061))

(declare-fun m!101063 () Bool)

(assert (=> d!19852 m!101063))

(declare-fun m!101065 () Bool)

(assert (=> d!19852 m!101065))

(assert (=> d!19852 m!100809))

(declare-fun m!101067 () Bool)

(assert (=> d!19852 m!101067))

(assert (=> d!19852 m!100811))

(declare-fun m!101069 () Bool)

(assert (=> d!19852 m!101069))

(declare-fun m!101071 () Bool)

(assert (=> d!19852 m!101071))

(assert (=> d!19852 m!100857))

(declare-fun m!101073 () Bool)

(assert (=> d!19852 m!101073))

(declare-fun m!101075 () Bool)

(assert (=> d!19852 m!101075))

(declare-fun m!101077 () Bool)

(assert (=> b!63811 m!101077))

(assert (=> b!63811 m!100851))

(assert (=> b!63811 m!100813))

(declare-fun m!101079 () Bool)

(assert (=> b!63813 m!101079))

(declare-fun m!101081 () Bool)

(assert (=> b!63815 m!101081))

(assert (=> b!63629 d!19852))

(declare-fun d!19854 () Bool)

(declare-fun res!53004 () Bool)

(declare-fun e!42225 () Bool)

(assert (=> d!19854 (=> (not res!53004) (not e!42225))))

(assert (=> d!19854 (= res!53004 (= (size!1288 (buf!1669 (_2!2965 lt!100239))) (size!1288 (buf!1669 (_2!2965 lt!100237)))))))

(assert (=> d!19854 (= (isPrefixOf!0 (_2!2965 lt!100239) (_2!2965 lt!100237)) e!42225)))

(declare-fun b!63816 () Bool)

(declare-fun res!53006 () Bool)

(assert (=> b!63816 (=> (not res!53006) (not e!42225))))

(assert (=> b!63816 (= res!53006 (bvsle (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100239))) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239))) (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100237))) (currentByte!3317 (_2!2965 lt!100237)) (currentBit!3312 (_2!2965 lt!100237)))))))

(declare-fun b!63817 () Bool)

(declare-fun e!42226 () Bool)

(assert (=> b!63817 (= e!42225 e!42226)))

(declare-fun res!53005 () Bool)

(assert (=> b!63817 (=> res!53005 e!42226)))

(assert (=> b!63817 (= res!53005 (= (size!1288 (buf!1669 (_2!2965 lt!100239))) #b00000000000000000000000000000000))))

(declare-fun b!63818 () Bool)

(assert (=> b!63818 (= e!42226 (arrayBitRangesEq!0 (buf!1669 (_2!2965 lt!100239)) (buf!1669 (_2!2965 lt!100237)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100239))) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239)))))))

(assert (= (and d!19854 res!53004) b!63816))

(assert (= (and b!63816 res!53006) b!63817))

(assert (= (and b!63817 (not res!53005)) b!63818))

(assert (=> b!63816 m!100851))

(assert (=> b!63816 m!100863))

(assert (=> b!63818 m!100851))

(assert (=> b!63818 m!100851))

(declare-fun m!101083 () Bool)

(assert (=> b!63818 m!101083))

(assert (=> b!63629 d!19854))

(declare-fun d!19856 () Bool)

(declare-fun res!53007 () Bool)

(declare-fun e!42227 () Bool)

(assert (=> d!19856 (=> (not res!53007) (not e!42227))))

(assert (=> d!19856 (= res!53007 (= (size!1288 (buf!1669 thiss!1379)) (size!1288 (buf!1669 (_2!2965 lt!100237)))))))

(assert (=> d!19856 (= (isPrefixOf!0 thiss!1379 (_2!2965 lt!100237)) e!42227)))

(declare-fun b!63819 () Bool)

(declare-fun res!53009 () Bool)

(assert (=> b!63819 (=> (not res!53009) (not e!42227))))

(assert (=> b!63819 (= res!53009 (bvsle (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)) (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100237))) (currentByte!3317 (_2!2965 lt!100237)) (currentBit!3312 (_2!2965 lt!100237)))))))

(declare-fun b!63820 () Bool)

(declare-fun e!42228 () Bool)

(assert (=> b!63820 (= e!42227 e!42228)))

(declare-fun res!53008 () Bool)

(assert (=> b!63820 (=> res!53008 e!42228)))

(assert (=> b!63820 (= res!53008 (= (size!1288 (buf!1669 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63821 () Bool)

(assert (=> b!63821 (= e!42228 (arrayBitRangesEq!0 (buf!1669 thiss!1379) (buf!1669 (_2!2965 lt!100237)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379))))))

(assert (= (and d!19856 res!53007) b!63819))

(assert (= (and b!63819 res!53009) b!63820))

(assert (= (and b!63820 (not res!53008)) b!63821))

(assert (=> b!63819 m!100813))

(assert (=> b!63819 m!100863))

(assert (=> b!63821 m!100813))

(assert (=> b!63821 m!100813))

(declare-fun m!101085 () Bool)

(assert (=> b!63821 m!101085))

(assert (=> b!63629 d!19856))

(declare-fun d!19858 () Bool)

(assert (=> d!19858 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!100528 () Unit!4317)

(declare-fun choose!9 (BitStream!2234 array!2810 (_ BitVec 64) BitStream!2234) Unit!4317)

(assert (=> d!19858 (= lt!100528 (choose!9 thiss!1379 (buf!1669 (_2!2965 lt!100239)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2235 (buf!1669 (_2!2965 lt!100239)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379))))))

(assert (=> d!19858 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1669 (_2!2965 lt!100239)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!100528)))

(declare-fun bs!4890 () Bool)

(assert (= bs!4890 d!19858))

(assert (=> bs!4890 m!100801))

(declare-fun m!101087 () Bool)

(assert (=> bs!4890 m!101087))

(assert (=> b!63629 d!19858))

(declare-fun d!19860 () Bool)

(assert (=> d!19860 (isPrefixOf!0 thiss!1379 (_2!2965 lt!100237))))

(declare-fun lt!100531 () Unit!4317)

(declare-fun choose!30 (BitStream!2234 BitStream!2234 BitStream!2234) Unit!4317)

(assert (=> d!19860 (= lt!100531 (choose!30 thiss!1379 (_2!2965 lt!100239) (_2!2965 lt!100237)))))

(assert (=> d!19860 (isPrefixOf!0 thiss!1379 (_2!2965 lt!100239))))

(assert (=> d!19860 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2965 lt!100239) (_2!2965 lt!100237)) lt!100531)))

(declare-fun bs!4891 () Bool)

(assert (= bs!4891 d!19860))

(assert (=> bs!4891 m!100799))

(declare-fun m!101089 () Bool)

(assert (=> bs!4891 m!101089))

(assert (=> bs!4891 m!100857))

(assert (=> b!63629 d!19860))

(declare-fun b!63981 () Bool)

(declare-fun res!53136 () Bool)

(declare-fun e!42302 () Bool)

(assert (=> b!63981 (=> (not res!53136) (not e!42302))))

(declare-fun lt!101105 () tuple2!5708)

(assert (=> b!63981 (= res!53136 (= (size!1288 (buf!1669 (_2!2965 lt!100239))) (size!1288 (buf!1669 (_2!2965 lt!101105)))))))

(declare-fun b!63982 () Bool)

(declare-fun e!42303 () Bool)

(declare-fun lt!101115 () (_ BitVec 64))

(assert (=> b!63982 (= e!42303 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239))) lt!101115))))

(declare-fun b!63983 () Bool)

(declare-fun e!42304 () tuple2!5708)

(declare-fun Unit!4340 () Unit!4317)

(assert (=> b!63983 (= e!42304 (tuple2!5709 Unit!4340 (_2!2965 lt!100239)))))

(assert (=> b!63983 (= (size!1288 (buf!1669 (_2!2965 lt!100239))) (size!1288 (buf!1669 (_2!2965 lt!100239))))))

(declare-fun lt!101090 () Unit!4317)

(declare-fun Unit!4341 () Unit!4317)

(assert (=> b!63983 (= lt!101090 Unit!4341)))

(declare-fun call!817 () tuple2!5710)

(declare-fun checkByteArrayBitContent!0 (BitStream!2234 array!2810 array!2810 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5728 0))(
  ( (tuple2!5729 (_1!2975 array!2810) (_2!2975 BitStream!2234)) )
))
(declare-fun readBits!0 (BitStream!2234 (_ BitVec 64)) tuple2!5728)

(assert (=> b!63983 (checkByteArrayBitContent!0 (_2!2965 lt!100239) srcBuffer!2 (_1!2975 (readBits!0 (_1!2966 call!817) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!63985 () Bool)

(declare-fun res!53137 () Bool)

(assert (=> b!63985 (=> (not res!53137) (not e!42302))))

(assert (=> b!63985 (= res!53137 (isPrefixOf!0 (_2!2965 lt!100239) (_2!2965 lt!101105)))))

(declare-fun b!63986 () Bool)

(declare-fun res!53135 () Bool)

(assert (=> b!63986 (=> (not res!53135) (not e!42302))))

(assert (=> b!63986 (= res!53135 (invariant!0 (currentBit!3312 (_2!2965 lt!101105)) (currentByte!3317 (_2!2965 lt!101105)) (size!1288 (buf!1669 (_2!2965 lt!101105)))))))

(declare-fun b!63987 () Bool)

(declare-fun lt!101086 () tuple2!5708)

(declare-fun Unit!4342 () Unit!4317)

(assert (=> b!63987 (= e!42304 (tuple2!5709 Unit!4342 (_2!2965 lt!101086)))))

(declare-fun lt!101123 () tuple2!5708)

(assert (=> b!63987 (= lt!101123 (appendBitFromByte!0 (_2!2965 lt!100239) (select (arr!1852 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!101104 () (_ BitVec 64))

(assert (=> b!63987 (= lt!101104 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!101113 () (_ BitVec 64))

(assert (=> b!63987 (= lt!101113 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!101094 () Unit!4317)

(assert (=> b!63987 (= lt!101094 (validateOffsetBitsIneqLemma!0 (_2!2965 lt!100239) (_2!2965 lt!101123) lt!101104 lt!101113))))

(assert (=> b!63987 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!101123)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!101123))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!101123))) (bvsub lt!101104 lt!101113))))

(declare-fun lt!101116 () Unit!4317)

(assert (=> b!63987 (= lt!101116 lt!101094)))

(declare-fun lt!101087 () tuple2!5710)

(assert (=> b!63987 (= lt!101087 (reader!0 (_2!2965 lt!100239) (_2!2965 lt!101123)))))

(declare-fun lt!101111 () (_ BitVec 64))

(assert (=> b!63987 (= lt!101111 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!101125 () Unit!4317)

(assert (=> b!63987 (= lt!101125 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2965 lt!100239) (buf!1669 (_2!2965 lt!101123)) lt!101111))))

(assert (=> b!63987 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!101123)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239))) lt!101111)))

(declare-fun lt!101097 () Unit!4317)

(assert (=> b!63987 (= lt!101097 lt!101125)))

(assert (=> b!63987 (= (head!511 (byteArrayBitContentToList!0 (_2!2965 lt!101123) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!511 (bitStreamReadBitsIntoList!0 (_2!2965 lt!101123) (_1!2966 lt!101087) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!101124 () Unit!4317)

(declare-fun Unit!4343 () Unit!4317)

(assert (=> b!63987 (= lt!101124 Unit!4343)))

(assert (=> b!63987 (= lt!101086 (appendBitsMSBFirstLoop!0 (_2!2965 lt!101123) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!101093 () Unit!4317)

(assert (=> b!63987 (= lt!101093 (lemmaIsPrefixTransitive!0 (_2!2965 lt!100239) (_2!2965 lt!101123) (_2!2965 lt!101086)))))

(assert (=> b!63987 (isPrefixOf!0 (_2!2965 lt!100239) (_2!2965 lt!101086))))

(declare-fun lt!101095 () Unit!4317)

(assert (=> b!63987 (= lt!101095 lt!101093)))

(assert (=> b!63987 (= (size!1288 (buf!1669 (_2!2965 lt!101086))) (size!1288 (buf!1669 (_2!2965 lt!100239))))))

(declare-fun lt!101112 () Unit!4317)

(declare-fun Unit!4344 () Unit!4317)

(assert (=> b!63987 (= lt!101112 Unit!4344)))

(assert (=> b!63987 (= (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!101086))) (currentByte!3317 (_2!2965 lt!101086)) (currentBit!3312 (_2!2965 lt!101086))) (bvsub (bvadd (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100239))) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!101101 () Unit!4317)

(declare-fun Unit!4345 () Unit!4317)

(assert (=> b!63987 (= lt!101101 Unit!4345)))

(assert (=> b!63987 (= (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!101086))) (currentByte!3317 (_2!2965 lt!101086)) (currentBit!3312 (_2!2965 lt!101086))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!101123))) (currentByte!3317 (_2!2965 lt!101123)) (currentBit!3312 (_2!2965 lt!101123))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101107 () Unit!4317)

(declare-fun Unit!4346 () Unit!4317)

(assert (=> b!63987 (= lt!101107 Unit!4346)))

(declare-fun lt!101103 () tuple2!5710)

(assert (=> b!63987 (= lt!101103 call!817)))

(declare-fun lt!101106 () (_ BitVec 64))

(assert (=> b!63987 (= lt!101106 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!101108 () Unit!4317)

(assert (=> b!63987 (= lt!101108 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2965 lt!100239) (buf!1669 (_2!2965 lt!101086)) lt!101106))))

(assert (=> b!63987 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!101086)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239))) lt!101106)))

(declare-fun lt!101119 () Unit!4317)

(assert (=> b!63987 (= lt!101119 lt!101108)))

(declare-fun lt!101085 () tuple2!5710)

(assert (=> b!63987 (= lt!101085 (reader!0 (_2!2965 lt!101123) (_2!2965 lt!101086)))))

(declare-fun lt!101128 () (_ BitVec 64))

(assert (=> b!63987 (= lt!101128 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!101091 () Unit!4317)

(assert (=> b!63987 (= lt!101091 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2965 lt!101123) (buf!1669 (_2!2965 lt!101086)) lt!101128))))

(assert (=> b!63987 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!101086)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!101123))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!101123))) lt!101128)))

(declare-fun lt!101122 () Unit!4317)

(assert (=> b!63987 (= lt!101122 lt!101091)))

(declare-fun lt!101098 () List!692)

(assert (=> b!63987 (= lt!101098 (byteArrayBitContentToList!0 (_2!2965 lt!101086) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!101109 () List!692)

(assert (=> b!63987 (= lt!101109 (byteArrayBitContentToList!0 (_2!2965 lt!101086) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!101121 () List!692)

(assert (=> b!63987 (= lt!101121 (bitStreamReadBitsIntoList!0 (_2!2965 lt!101086) (_1!2966 lt!101103) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!101100 () List!692)

(assert (=> b!63987 (= lt!101100 (bitStreamReadBitsIntoList!0 (_2!2965 lt!101086) (_1!2966 lt!101085) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!101092 () (_ BitVec 64))

(assert (=> b!63987 (= lt!101092 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!101120 () Unit!4317)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2234 BitStream!2234 BitStream!2234 BitStream!2234 (_ BitVec 64) List!692) Unit!4317)

(assert (=> b!63987 (= lt!101120 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2965 lt!101086) (_2!2965 lt!101086) (_1!2966 lt!101103) (_1!2966 lt!101085) lt!101092 lt!101121))))

(declare-fun tail!299 (List!692) List!692)

(assert (=> b!63987 (= (bitStreamReadBitsIntoList!0 (_2!2965 lt!101086) (_1!2966 lt!101085) (bvsub lt!101092 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!299 lt!101121))))

(declare-fun lt!101096 () Unit!4317)

(assert (=> b!63987 (= lt!101096 lt!101120)))

(declare-fun lt!101099 () (_ BitVec 64))

(declare-fun lt!101110 () Unit!4317)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2810 array!2810 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4317)

(assert (=> b!63987 (= lt!101110 (arrayBitRangesEqImpliesEq!0 (buf!1669 (_2!2965 lt!101123)) (buf!1669 (_2!2965 lt!101086)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!101099 (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!101123))) (currentByte!3317 (_2!2965 lt!101123)) (currentBit!3312 (_2!2965 lt!101123)))))))

(declare-fun bitAt!0 (array!2810 (_ BitVec 64)) Bool)

(assert (=> b!63987 (= (bitAt!0 (buf!1669 (_2!2965 lt!101123)) lt!101099) (bitAt!0 (buf!1669 (_2!2965 lt!101086)) lt!101099))))

(declare-fun lt!101126 () Unit!4317)

(assert (=> b!63987 (= lt!101126 lt!101110)))

(declare-fun b!63984 () Bool)

(declare-fun res!53132 () Bool)

(assert (=> b!63984 (=> (not res!53132) (not e!42302))))

(assert (=> b!63984 (= res!53132 (= (size!1288 (buf!1669 (_2!2965 lt!101105))) (size!1288 (buf!1669 (_2!2965 lt!100239)))))))

(declare-fun d!19862 () Bool)

(assert (=> d!19862 e!42302))

(declare-fun res!53133 () Bool)

(assert (=> d!19862 (=> (not res!53133) (not e!42302))))

(declare-fun lt!101102 () (_ BitVec 64))

(assert (=> d!19862 (= res!53133 (= (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!101105))) (currentByte!3317 (_2!2965 lt!101105)) (currentBit!3312 (_2!2965 lt!101105))) (bvsub lt!101102 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19862 (or (= (bvand lt!101102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101102 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!101117 () (_ BitVec 64))

(assert (=> d!19862 (= lt!101102 (bvadd lt!101117 to!314))))

(assert (=> d!19862 (or (not (= (bvand lt!101117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!101117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!101117 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19862 (= lt!101117 (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100239))) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239))))))

(assert (=> d!19862 (= lt!101105 e!42304)))

(declare-fun c!4590 () Bool)

(assert (=> d!19862 (= c!4590 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!101127 () Unit!4317)

(declare-fun lt!101114 () Unit!4317)

(assert (=> d!19862 (= lt!101127 lt!101114)))

(assert (=> d!19862 (isPrefixOf!0 (_2!2965 lt!100239) (_2!2965 lt!100239))))

(assert (=> d!19862 (= lt!101114 (lemmaIsPrefixRefl!0 (_2!2965 lt!100239)))))

(assert (=> d!19862 (= lt!101099 (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100239))) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239))))))

(assert (=> d!19862 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19862 (= (appendBitsMSBFirstLoop!0 (_2!2965 lt!100239) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!101105)))

(declare-fun bm!814 () Bool)

(assert (=> bm!814 (= call!817 (reader!0 (_2!2965 lt!100239) (ite c!4590 (_2!2965 lt!101086) (_2!2965 lt!100239))))))

(declare-fun b!63988 () Bool)

(declare-fun lt!101088 () tuple2!5710)

(assert (=> b!63988 (= e!42302 (= (bitStreamReadBitsIntoList!0 (_2!2965 lt!101105) (_1!2966 lt!101088) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2965 lt!101105) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!63988 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63988 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!101118 () Unit!4317)

(declare-fun lt!101089 () Unit!4317)

(assert (=> b!63988 (= lt!101118 lt!101089)))

(assert (=> b!63988 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!101105)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239))) lt!101115)))

(assert (=> b!63988 (= lt!101089 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2965 lt!100239) (buf!1669 (_2!2965 lt!101105)) lt!101115))))

(assert (=> b!63988 e!42303))

(declare-fun res!53134 () Bool)

(assert (=> b!63988 (=> (not res!53134) (not e!42303))))

(assert (=> b!63988 (= res!53134 (and (= (size!1288 (buf!1669 (_2!2965 lt!100239))) (size!1288 (buf!1669 (_2!2965 lt!101105)))) (bvsge lt!101115 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63988 (= lt!101115 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!63988 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63988 (= lt!101088 (reader!0 (_2!2965 lt!100239) (_2!2965 lt!101105)))))

(assert (= (and d!19862 c!4590) b!63987))

(assert (= (and d!19862 (not c!4590)) b!63983))

(assert (= (or b!63987 b!63983) bm!814))

(assert (= (and d!19862 res!53133) b!63986))

(assert (= (and b!63986 res!53135) b!63981))

(assert (= (and b!63981 res!53136) b!63985))

(assert (= (and b!63985 res!53137) b!63984))

(assert (= (and b!63984 res!53132) b!63988))

(assert (= (and b!63988 res!53134) b!63982))

(declare-fun m!101447 () Bool)

(assert (=> b!63987 m!101447))

(declare-fun m!101449 () Bool)

(assert (=> b!63987 m!101449))

(declare-fun m!101451 () Bool)

(assert (=> b!63987 m!101451))

(declare-fun m!101453 () Bool)

(assert (=> b!63987 m!101453))

(declare-fun m!101455 () Bool)

(assert (=> b!63987 m!101455))

(declare-fun m!101457 () Bool)

(assert (=> b!63987 m!101457))

(declare-fun m!101459 () Bool)

(assert (=> b!63987 m!101459))

(declare-fun m!101461 () Bool)

(assert (=> b!63987 m!101461))

(declare-fun m!101463 () Bool)

(assert (=> b!63987 m!101463))

(declare-fun m!101465 () Bool)

(assert (=> b!63987 m!101465))

(assert (=> b!63987 m!101449))

(declare-fun m!101467 () Bool)

(assert (=> b!63987 m!101467))

(declare-fun m!101469 () Bool)

(assert (=> b!63987 m!101469))

(declare-fun m!101471 () Bool)

(assert (=> b!63987 m!101471))

(declare-fun m!101473 () Bool)

(assert (=> b!63987 m!101473))

(declare-fun m!101475 () Bool)

(assert (=> b!63987 m!101475))

(declare-fun m!101477 () Bool)

(assert (=> b!63987 m!101477))

(declare-fun m!101479 () Bool)

(assert (=> b!63987 m!101479))

(declare-fun m!101481 () Bool)

(assert (=> b!63987 m!101481))

(assert (=> b!63987 m!100851))

(declare-fun m!101483 () Bool)

(assert (=> b!63987 m!101483))

(declare-fun m!101485 () Bool)

(assert (=> b!63987 m!101485))

(declare-fun m!101487 () Bool)

(assert (=> b!63987 m!101487))

(declare-fun m!101489 () Bool)

(assert (=> b!63987 m!101489))

(declare-fun m!101491 () Bool)

(assert (=> b!63987 m!101491))

(declare-fun m!101493 () Bool)

(assert (=> b!63987 m!101493))

(assert (=> b!63987 m!101451))

(declare-fun m!101495 () Bool)

(assert (=> b!63987 m!101495))

(assert (=> b!63987 m!101459))

(declare-fun m!101497 () Bool)

(assert (=> b!63987 m!101497))

(declare-fun m!101499 () Bool)

(assert (=> b!63987 m!101499))

(declare-fun m!101501 () Bool)

(assert (=> b!63987 m!101501))

(declare-fun m!101503 () Bool)

(assert (=> b!63987 m!101503))

(declare-fun m!101505 () Bool)

(assert (=> b!63987 m!101505))

(assert (=> b!63987 m!101491))

(declare-fun m!101507 () Bool)

(assert (=> b!63987 m!101507))

(declare-fun m!101509 () Bool)

(assert (=> d!19862 m!101509))

(assert (=> d!19862 m!100851))

(assert (=> d!19862 m!101061))

(assert (=> d!19862 m!101069))

(declare-fun m!101511 () Bool)

(assert (=> b!63985 m!101511))

(declare-fun m!101513 () Bool)

(assert (=> b!63986 m!101513))

(declare-fun m!101515 () Bool)

(assert (=> bm!814 m!101515))

(declare-fun m!101517 () Bool)

(assert (=> b!63983 m!101517))

(declare-fun m!101519 () Bool)

(assert (=> b!63983 m!101519))

(declare-fun m!101521 () Bool)

(assert (=> b!63982 m!101521))

(declare-fun m!101523 () Bool)

(assert (=> b!63988 m!101523))

(declare-fun m!101525 () Bool)

(assert (=> b!63988 m!101525))

(declare-fun m!101527 () Bool)

(assert (=> b!63988 m!101527))

(declare-fun m!101529 () Bool)

(assert (=> b!63988 m!101529))

(declare-fun m!101531 () Bool)

(assert (=> b!63988 m!101531))

(assert (=> b!63629 d!19862))

(declare-fun d!19946 () Bool)

(assert (=> d!19946 (= (head!511 (byteArrayBitContentToList!0 (_2!2965 lt!100239) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!807 (byteArrayBitContentToList!0 (_2!2965 lt!100239) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!63634 d!19946))

(declare-fun d!19948 () Bool)

(declare-fun c!4593 () Bool)

(assert (=> d!19948 (= c!4593 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42307 () List!692)

(assert (=> d!19948 (= (byteArrayBitContentToList!0 (_2!2965 lt!100239) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!42307)))

(declare-fun b!63993 () Bool)

(assert (=> b!63993 (= e!42307 Nil!689)))

(declare-fun b!63994 () Bool)

(assert (=> b!63994 (= e!42307 (Cons!688 (not (= (bvand ((_ sign_extend 24) (select (arr!1852 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2965 lt!100239) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19948 c!4593) b!63993))

(assert (= (and d!19948 (not c!4593)) b!63994))

(assert (=> b!63994 m!100855))

(declare-fun m!101533 () Bool)

(assert (=> b!63994 m!101533))

(declare-fun m!101535 () Bool)

(assert (=> b!63994 m!101535))

(assert (=> b!63634 d!19948))

(declare-fun d!19950 () Bool)

(assert (=> d!19950 (= (head!511 (bitStreamReadBitsIntoList!0 (_2!2965 lt!100239) (_1!2966 lt!100235) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!807 (bitStreamReadBitsIntoList!0 (_2!2965 lt!100239) (_1!2966 lt!100235) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!63634 d!19950))

(declare-fun b!64003 () Bool)

(declare-datatypes ((tuple2!5730 0))(
  ( (tuple2!5731 (_1!2976 List!692) (_2!2976 BitStream!2234)) )
))
(declare-fun e!42313 () tuple2!5730)

(assert (=> b!64003 (= e!42313 (tuple2!5731 Nil!689 (_1!2966 lt!100235)))))

(declare-fun b!64006 () Bool)

(declare-fun e!42312 () Bool)

(declare-fun lt!101136 () List!692)

(assert (=> b!64006 (= e!42312 (> (length!320 lt!101136) 0))))

(declare-fun b!64005 () Bool)

(declare-fun isEmpty!197 (List!692) Bool)

(assert (=> b!64005 (= e!42312 (isEmpty!197 lt!101136))))

(declare-fun d!19952 () Bool)

(assert (=> d!19952 e!42312))

(declare-fun c!4598 () Bool)

(assert (=> d!19952 (= c!4598 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19952 (= lt!101136 (_1!2976 e!42313))))

(declare-fun c!4599 () Bool)

(assert (=> d!19952 (= c!4599 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19952 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19952 (= (bitStreamReadBitsIntoList!0 (_2!2965 lt!100239) (_1!2966 lt!100235) #b0000000000000000000000000000000000000000000000000000000000000001) lt!101136)))

(declare-fun lt!101135 () (_ BitVec 64))

(declare-datatypes ((tuple2!5732 0))(
  ( (tuple2!5733 (_1!2977 Bool) (_2!2977 BitStream!2234)) )
))
(declare-fun lt!101137 () tuple2!5732)

(declare-fun b!64004 () Bool)

(assert (=> b!64004 (= e!42313 (tuple2!5731 (Cons!688 (_1!2977 lt!101137) (bitStreamReadBitsIntoList!0 (_2!2965 lt!100239) (_2!2977 lt!101137) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!101135))) (_2!2977 lt!101137)))))

(declare-fun readBit!0 (BitStream!2234) tuple2!5732)

(assert (=> b!64004 (= lt!101137 (readBit!0 (_1!2966 lt!100235)))))

(assert (=> b!64004 (= lt!101135 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19952 c!4599) b!64003))

(assert (= (and d!19952 (not c!4599)) b!64004))

(assert (= (and d!19952 c!4598) b!64005))

(assert (= (and d!19952 (not c!4598)) b!64006))

(declare-fun m!101537 () Bool)

(assert (=> b!64006 m!101537))

(declare-fun m!101539 () Bool)

(assert (=> b!64005 m!101539))

(declare-fun m!101541 () Bool)

(assert (=> b!64004 m!101541))

(declare-fun m!101543 () Bool)

(assert (=> b!64004 m!101543))

(assert (=> b!63634 d!19952))

(declare-fun d!19954 () Bool)

(declare-fun res!53138 () Bool)

(declare-fun e!42314 () Bool)

(assert (=> d!19954 (=> (not res!53138) (not e!42314))))

(assert (=> d!19954 (= res!53138 (= (size!1288 (buf!1669 thiss!1379)) (size!1288 (buf!1669 (_2!2965 lt!100239)))))))

(assert (=> d!19954 (= (isPrefixOf!0 thiss!1379 (_2!2965 lt!100239)) e!42314)))

(declare-fun b!64007 () Bool)

(declare-fun res!53140 () Bool)

(assert (=> b!64007 (=> (not res!53140) (not e!42314))))

(assert (=> b!64007 (= res!53140 (bvsle (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)) (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100239))) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239)))))))

(declare-fun b!64008 () Bool)

(declare-fun e!42315 () Bool)

(assert (=> b!64008 (= e!42314 e!42315)))

(declare-fun res!53139 () Bool)

(assert (=> b!64008 (=> res!53139 e!42315)))

(assert (=> b!64008 (= res!53139 (= (size!1288 (buf!1669 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!64009 () Bool)

(assert (=> b!64009 (= e!42315 (arrayBitRangesEq!0 (buf!1669 thiss!1379) (buf!1669 (_2!2965 lt!100239)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379))))))

(assert (= (and d!19954 res!53138) b!64007))

(assert (= (and b!64007 res!53140) b!64008))

(assert (= (and b!64008 (not res!53139)) b!64009))

(assert (=> b!64007 m!100813))

(assert (=> b!64007 m!100851))

(assert (=> b!64009 m!100813))

(assert (=> b!64009 m!100813))

(declare-fun m!101545 () Bool)

(assert (=> b!64009 m!101545))

(assert (=> b!63623 d!19954))

(declare-fun d!19956 () Bool)

(assert (=> d!19956 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239))) lt!100247) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239)))) lt!100247))))

(declare-fun bs!4908 () Bool)

(assert (= bs!4908 d!19956))

(declare-fun m!101547 () Bool)

(assert (=> bs!4908 m!101547))

(assert (=> b!63623 d!19956))

(declare-fun d!19958 () Bool)

(declare-fun e!42318 () Bool)

(assert (=> d!19958 e!42318))

(declare-fun res!53143 () Bool)

(assert (=> d!19958 (=> (not res!53143) (not e!42318))))

(assert (=> d!19958 (= res!53143 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!101140 () Unit!4317)

(declare-fun choose!27 (BitStream!2234 BitStream!2234 (_ BitVec 64) (_ BitVec 64)) Unit!4317)

(assert (=> d!19958 (= lt!101140 (choose!27 thiss!1379 (_2!2965 lt!100239) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!19958 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!19958 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2965 lt!100239) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!101140)))

(declare-fun b!64012 () Bool)

(assert (=> b!64012 (= e!42318 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!19958 res!53143) b!64012))

(declare-fun m!101549 () Bool)

(assert (=> d!19958 m!101549))

(declare-fun m!101551 () Bool)

(assert (=> b!64012 m!101551))

(assert (=> b!63623 d!19958))

(declare-fun b!64030 () Bool)

(declare-fun res!53163 () Bool)

(declare-fun e!42329 () Bool)

(assert (=> b!64030 (=> (not res!53163) (not e!42329))))

(declare-fun lt!101170 () tuple2!5708)

(assert (=> b!64030 (= res!53163 (isPrefixOf!0 thiss!1379 (_2!2965 lt!101170)))))

(declare-fun b!64031 () Bool)

(declare-fun e!42327 () Bool)

(declare-datatypes ((tuple2!5734 0))(
  ( (tuple2!5735 (_1!2978 BitStream!2234) (_2!2978 Bool)) )
))
(declare-fun lt!101171 () tuple2!5734)

(declare-fun lt!101169 () tuple2!5708)

(assert (=> b!64031 (= e!42327 (= (bitIndex!0 (size!1288 (buf!1669 (_1!2978 lt!101171))) (currentByte!3317 (_1!2978 lt!101171)) (currentBit!3312 (_1!2978 lt!101171))) (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!101169))) (currentByte!3317 (_2!2965 lt!101169)) (currentBit!3312 (_2!2965 lt!101169)))))))

(declare-fun b!64032 () Bool)

(declare-fun res!53162 () Bool)

(declare-fun e!42330 () Bool)

(assert (=> b!64032 (=> (not res!53162) (not e!42330))))

(declare-fun lt!101174 () (_ BitVec 64))

(declare-fun lt!101167 () (_ BitVec 64))

(assert (=> b!64032 (= res!53162 (= (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!101169))) (currentByte!3317 (_2!2965 lt!101169)) (currentBit!3312 (_2!2965 lt!101169))) (bvadd lt!101167 lt!101174)))))

(assert (=> b!64032 (or (not (= (bvand lt!101167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101174 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!101167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!101167 lt!101174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64032 (= lt!101174 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!64032 (= lt!101167 (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)))))

(declare-fun d!19960 () Bool)

(assert (=> d!19960 e!42330))

(declare-fun res!53167 () Bool)

(assert (=> d!19960 (=> (not res!53167) (not e!42330))))

(assert (=> d!19960 (= res!53167 (= (size!1288 (buf!1669 (_2!2965 lt!101169))) (size!1288 (buf!1669 thiss!1379))))))

(declare-fun lt!101175 () (_ BitVec 8))

(declare-fun lt!101166 () array!2810)

(assert (=> d!19960 (= lt!101175 (select (arr!1852 lt!101166) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!19960 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1288 lt!101166)))))

(assert (=> d!19960 (= lt!101166 (array!2811 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!101172 () tuple2!5708)

(assert (=> d!19960 (= lt!101169 (tuple2!5709 (_1!2965 lt!101172) (_2!2965 lt!101172)))))

(assert (=> d!19960 (= lt!101172 lt!101170)))

(assert (=> d!19960 e!42329))

(declare-fun res!53160 () Bool)

(assert (=> d!19960 (=> (not res!53160) (not e!42329))))

(assert (=> d!19960 (= res!53160 (= (size!1288 (buf!1669 thiss!1379)) (size!1288 (buf!1669 (_2!2965 lt!101170)))))))

(declare-fun lt!101168 () Bool)

(declare-fun appendBit!0 (BitStream!2234 Bool) tuple2!5708)

(assert (=> d!19960 (= lt!101170 (appendBit!0 thiss!1379 lt!101168))))

(assert (=> d!19960 (= lt!101168 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1852 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!19960 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!19960 (= (appendBitFromByte!0 thiss!1379 (select (arr!1852 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!101169)))

(declare-fun b!64033 () Bool)

(declare-fun res!53165 () Bool)

(assert (=> b!64033 (=> (not res!53165) (not e!42329))))

(assert (=> b!64033 (= res!53165 (= (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!101170))) (currentByte!3317 (_2!2965 lt!101170)) (currentBit!3312 (_2!2965 lt!101170))) (bvadd (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!64034 () Bool)

(declare-fun e!42328 () Bool)

(declare-fun lt!101176 () tuple2!5734)

(assert (=> b!64034 (= e!42328 (= (bitIndex!0 (size!1288 (buf!1669 (_1!2978 lt!101176))) (currentByte!3317 (_1!2978 lt!101176)) (currentBit!3312 (_1!2978 lt!101176))) (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!101170))) (currentByte!3317 (_2!2965 lt!101170)) (currentBit!3312 (_2!2965 lt!101170)))))))

(declare-fun b!64035 () Bool)

(assert (=> b!64035 (= e!42329 e!42328)))

(declare-fun res!53164 () Bool)

(assert (=> b!64035 (=> (not res!53164) (not e!42328))))

(assert (=> b!64035 (= res!53164 (and (= (_2!2978 lt!101176) lt!101168) (= (_1!2978 lt!101176) (_2!2965 lt!101170))))))

(declare-fun readBitPure!0 (BitStream!2234) tuple2!5734)

(declare-fun readerFrom!0 (BitStream!2234 (_ BitVec 32) (_ BitVec 32)) BitStream!2234)

(assert (=> b!64035 (= lt!101176 (readBitPure!0 (readerFrom!0 (_2!2965 lt!101170) (currentBit!3312 thiss!1379) (currentByte!3317 thiss!1379))))))

(declare-fun b!64036 () Bool)

(assert (=> b!64036 (= e!42330 e!42327)))

(declare-fun res!53161 () Bool)

(assert (=> b!64036 (=> (not res!53161) (not e!42327))))

(assert (=> b!64036 (= res!53161 (and (= (_2!2978 lt!101171) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1852 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!101175)) #b00000000000000000000000000000000))) (= (_1!2978 lt!101171) (_2!2965 lt!101169))))))

(declare-fun lt!101165 () tuple2!5728)

(declare-fun lt!101173 () BitStream!2234)

(assert (=> b!64036 (= lt!101165 (readBits!0 lt!101173 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!64036 (= lt!101171 (readBitPure!0 lt!101173))))

(assert (=> b!64036 (= lt!101173 (readerFrom!0 (_2!2965 lt!101169) (currentBit!3312 thiss!1379) (currentByte!3317 thiss!1379)))))

(declare-fun b!64037 () Bool)

(declare-fun res!53166 () Bool)

(assert (=> b!64037 (=> (not res!53166) (not e!42330))))

(assert (=> b!64037 (= res!53166 (isPrefixOf!0 thiss!1379 (_2!2965 lt!101169)))))

(assert (= (and d!19960 res!53160) b!64033))

(assert (= (and b!64033 res!53165) b!64030))

(assert (= (and b!64030 res!53163) b!64035))

(assert (= (and b!64035 res!53164) b!64034))

(assert (= (and d!19960 res!53167) b!64032))

(assert (= (and b!64032 res!53162) b!64037))

(assert (= (and b!64037 res!53166) b!64036))

(assert (= (and b!64036 res!53161) b!64031))

(declare-fun m!101553 () Bool)

(assert (=> b!64033 m!101553))

(assert (=> b!64033 m!100813))

(declare-fun m!101555 () Bool)

(assert (=> b!64031 m!101555))

(declare-fun m!101557 () Bool)

(assert (=> b!64031 m!101557))

(declare-fun m!101559 () Bool)

(assert (=> b!64036 m!101559))

(declare-fun m!101561 () Bool)

(assert (=> b!64036 m!101561))

(declare-fun m!101563 () Bool)

(assert (=> b!64036 m!101563))

(declare-fun m!101565 () Bool)

(assert (=> d!19960 m!101565))

(declare-fun m!101567 () Bool)

(assert (=> d!19960 m!101567))

(assert (=> d!19960 m!101533))

(declare-fun m!101569 () Bool)

(assert (=> b!64030 m!101569))

(declare-fun m!101571 () Bool)

(assert (=> b!64034 m!101571))

(assert (=> b!64034 m!101553))

(assert (=> b!64032 m!101557))

(assert (=> b!64032 m!100813))

(declare-fun m!101573 () Bool)

(assert (=> b!64035 m!101573))

(assert (=> b!64035 m!101573))

(declare-fun m!101575 () Bool)

(assert (=> b!64035 m!101575))

(declare-fun m!101577 () Bool)

(assert (=> b!64037 m!101577))

(assert (=> b!63623 d!19960))

(declare-fun d!19962 () Bool)

(assert (=> d!19962 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 thiss!1379))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1288 (buf!1669 thiss!1379))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4909 () Bool)

(assert (= bs!4909 d!19962))

(assert (=> bs!4909 m!101045))

(assert (=> b!63633 d!19962))

(declare-fun lt!101180 () (_ BitVec 64))

(declare-fun b!64038 () Bool)

(declare-fun lt!101194 () (_ BitVec 64))

(declare-fun e!42332 () Bool)

(declare-fun lt!101177 () tuple2!5710)

(assert (=> b!64038 (= e!42332 (= (_1!2966 lt!101177) (withMovedBitIndex!0 (_2!2966 lt!101177) (bvsub lt!101194 lt!101180))))))

(assert (=> b!64038 (or (= (bvand lt!101194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101180 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101194 lt!101180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64038 (= lt!101180 (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100237))) (currentByte!3317 (_2!2965 lt!100237)) (currentBit!3312 (_2!2965 lt!100237))))))

(assert (=> b!64038 (= lt!101194 (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100239))) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239))))))

(declare-fun b!64039 () Bool)

(declare-fun e!42331 () Unit!4317)

(declare-fun lt!101184 () Unit!4317)

(assert (=> b!64039 (= e!42331 lt!101184)))

(declare-fun lt!101188 () (_ BitVec 64))

(assert (=> b!64039 (= lt!101188 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!101193 () (_ BitVec 64))

(assert (=> b!64039 (= lt!101193 (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100239))) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239))))))

(assert (=> b!64039 (= lt!101184 (arrayBitRangesEqSymmetric!0 (buf!1669 (_2!2965 lt!100239)) (buf!1669 (_2!2965 lt!100237)) lt!101188 lt!101193))))

(assert (=> b!64039 (arrayBitRangesEq!0 (buf!1669 (_2!2965 lt!100237)) (buf!1669 (_2!2965 lt!100239)) lt!101188 lt!101193)))

(declare-fun b!64040 () Bool)

(declare-fun res!53168 () Bool)

(assert (=> b!64040 (=> (not res!53168) (not e!42332))))

(assert (=> b!64040 (= res!53168 (isPrefixOf!0 (_2!2966 lt!101177) (_2!2965 lt!100237)))))

(declare-fun d!19964 () Bool)

(assert (=> d!19964 e!42332))

(declare-fun res!53169 () Bool)

(assert (=> d!19964 (=> (not res!53169) (not e!42332))))

(assert (=> d!19964 (= res!53169 (isPrefixOf!0 (_1!2966 lt!101177) (_2!2966 lt!101177)))))

(declare-fun lt!101181 () BitStream!2234)

(assert (=> d!19964 (= lt!101177 (tuple2!5711 lt!101181 (_2!2965 lt!100237)))))

(declare-fun lt!101187 () Unit!4317)

(declare-fun lt!101196 () Unit!4317)

(assert (=> d!19964 (= lt!101187 lt!101196)))

(assert (=> d!19964 (isPrefixOf!0 lt!101181 (_2!2965 lt!100237))))

(assert (=> d!19964 (= lt!101196 (lemmaIsPrefixTransitive!0 lt!101181 (_2!2965 lt!100237) (_2!2965 lt!100237)))))

(declare-fun lt!101182 () Unit!4317)

(declare-fun lt!101191 () Unit!4317)

(assert (=> d!19964 (= lt!101182 lt!101191)))

(assert (=> d!19964 (isPrefixOf!0 lt!101181 (_2!2965 lt!100237))))

(assert (=> d!19964 (= lt!101191 (lemmaIsPrefixTransitive!0 lt!101181 (_2!2965 lt!100239) (_2!2965 lt!100237)))))

(declare-fun lt!101186 () Unit!4317)

(assert (=> d!19964 (= lt!101186 e!42331)))

(declare-fun c!4600 () Bool)

(assert (=> d!19964 (= c!4600 (not (= (size!1288 (buf!1669 (_2!2965 lt!100239))) #b00000000000000000000000000000000)))))

(declare-fun lt!101192 () Unit!4317)

(declare-fun lt!101190 () Unit!4317)

(assert (=> d!19964 (= lt!101192 lt!101190)))

(assert (=> d!19964 (isPrefixOf!0 (_2!2965 lt!100237) (_2!2965 lt!100237))))

(assert (=> d!19964 (= lt!101190 (lemmaIsPrefixRefl!0 (_2!2965 lt!100237)))))

(declare-fun lt!101178 () Unit!4317)

(declare-fun lt!101185 () Unit!4317)

(assert (=> d!19964 (= lt!101178 lt!101185)))

(assert (=> d!19964 (= lt!101185 (lemmaIsPrefixRefl!0 (_2!2965 lt!100237)))))

(declare-fun lt!101183 () Unit!4317)

(declare-fun lt!101179 () Unit!4317)

(assert (=> d!19964 (= lt!101183 lt!101179)))

(assert (=> d!19964 (isPrefixOf!0 lt!101181 lt!101181)))

(assert (=> d!19964 (= lt!101179 (lemmaIsPrefixRefl!0 lt!101181))))

(declare-fun lt!101195 () Unit!4317)

(declare-fun lt!101189 () Unit!4317)

(assert (=> d!19964 (= lt!101195 lt!101189)))

(assert (=> d!19964 (isPrefixOf!0 (_2!2965 lt!100239) (_2!2965 lt!100239))))

(assert (=> d!19964 (= lt!101189 (lemmaIsPrefixRefl!0 (_2!2965 lt!100239)))))

(assert (=> d!19964 (= lt!101181 (BitStream!2235 (buf!1669 (_2!2965 lt!100237)) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239))))))

(assert (=> d!19964 (isPrefixOf!0 (_2!2965 lt!100239) (_2!2965 lt!100237))))

(assert (=> d!19964 (= (reader!0 (_2!2965 lt!100239) (_2!2965 lt!100237)) lt!101177)))

(declare-fun b!64041 () Bool)

(declare-fun Unit!4347 () Unit!4317)

(assert (=> b!64041 (= e!42331 Unit!4347)))

(declare-fun b!64042 () Bool)

(declare-fun res!53170 () Bool)

(assert (=> b!64042 (=> (not res!53170) (not e!42332))))

(assert (=> b!64042 (= res!53170 (isPrefixOf!0 (_1!2966 lt!101177) (_2!2965 lt!100239)))))

(assert (= (and d!19964 c!4600) b!64039))

(assert (= (and d!19964 (not c!4600)) b!64041))

(assert (= (and d!19964 res!53169) b!64042))

(assert (= (and b!64042 res!53170) b!64040))

(assert (= (and b!64040 res!53168) b!64038))

(assert (=> b!64039 m!100851))

(declare-fun m!101579 () Bool)

(assert (=> b!64039 m!101579))

(declare-fun m!101581 () Bool)

(assert (=> b!64039 m!101581))

(declare-fun m!101583 () Bool)

(assert (=> d!19964 m!101583))

(declare-fun m!101585 () Bool)

(assert (=> d!19964 m!101585))

(declare-fun m!101587 () Bool)

(assert (=> d!19964 m!101587))

(assert (=> d!19964 m!101061))

(declare-fun m!101589 () Bool)

(assert (=> d!19964 m!101589))

(assert (=> d!19964 m!101069))

(declare-fun m!101591 () Bool)

(assert (=> d!19964 m!101591))

(declare-fun m!101593 () Bool)

(assert (=> d!19964 m!101593))

(assert (=> d!19964 m!100795))

(declare-fun m!101595 () Bool)

(assert (=> d!19964 m!101595))

(declare-fun m!101597 () Bool)

(assert (=> d!19964 m!101597))

(declare-fun m!101599 () Bool)

(assert (=> b!64038 m!101599))

(assert (=> b!64038 m!100863))

(assert (=> b!64038 m!100851))

(declare-fun m!101601 () Bool)

(assert (=> b!64040 m!101601))

(declare-fun m!101603 () Bool)

(assert (=> b!64042 m!101603))

(assert (=> b!63635 d!19964))

(declare-fun b!64043 () Bool)

(declare-fun e!42334 () tuple2!5730)

(assert (=> b!64043 (= e!42334 (tuple2!5731 Nil!689 (_1!2966 lt!100240)))))

(declare-fun b!64046 () Bool)

(declare-fun e!42333 () Bool)

(declare-fun lt!101198 () List!692)

(assert (=> b!64046 (= e!42333 (> (length!320 lt!101198) 0))))

(declare-fun b!64045 () Bool)

(assert (=> b!64045 (= e!42333 (isEmpty!197 lt!101198))))

(declare-fun d!19966 () Bool)

(assert (=> d!19966 e!42333))

(declare-fun c!4601 () Bool)

(assert (=> d!19966 (= c!4601 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19966 (= lt!101198 (_1!2976 e!42334))))

(declare-fun c!4602 () Bool)

(assert (=> d!19966 (= c!4602 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19966 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19966 (= (bitStreamReadBitsIntoList!0 (_2!2965 lt!100237) (_1!2966 lt!100240) (bvsub to!314 i!635)) lt!101198)))

(declare-fun b!64044 () Bool)

(declare-fun lt!101197 () (_ BitVec 64))

(declare-fun lt!101199 () tuple2!5732)

(assert (=> b!64044 (= e!42334 (tuple2!5731 (Cons!688 (_1!2977 lt!101199) (bitStreamReadBitsIntoList!0 (_2!2965 lt!100237) (_2!2977 lt!101199) (bvsub (bvsub to!314 i!635) lt!101197))) (_2!2977 lt!101199)))))

(assert (=> b!64044 (= lt!101199 (readBit!0 (_1!2966 lt!100240)))))

(assert (=> b!64044 (= lt!101197 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19966 c!4602) b!64043))

(assert (= (and d!19966 (not c!4602)) b!64044))

(assert (= (and d!19966 c!4601) b!64045))

(assert (= (and d!19966 (not c!4601)) b!64046))

(declare-fun m!101605 () Bool)

(assert (=> b!64046 m!101605))

(declare-fun m!101607 () Bool)

(assert (=> b!64045 m!101607))

(declare-fun m!101609 () Bool)

(assert (=> b!64044 m!101609))

(declare-fun m!101611 () Bool)

(assert (=> b!64044 m!101611))

(assert (=> b!63635 d!19966))

(declare-fun d!19968 () Bool)

(assert (=> d!19968 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100237)))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100237)))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4910 () Bool)

(assert (= bs!4910 d!19968))

(declare-fun m!101613 () Bool)

(assert (=> bs!4910 m!101613))

(assert (=> b!63635 d!19968))

(declare-fun b!64047 () Bool)

(declare-fun e!42336 () tuple2!5730)

(assert (=> b!64047 (= e!42336 (tuple2!5731 Nil!689 (_1!2966 lt!100243)))))

(declare-fun b!64050 () Bool)

(declare-fun e!42335 () Bool)

(declare-fun lt!101201 () List!692)

(assert (=> b!64050 (= e!42335 (> (length!320 lt!101201) 0))))

(declare-fun b!64049 () Bool)

(assert (=> b!64049 (= e!42335 (isEmpty!197 lt!101201))))

(declare-fun d!19970 () Bool)

(assert (=> d!19970 e!42335))

(declare-fun c!4603 () Bool)

(assert (=> d!19970 (= c!4603 (= lt!100247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19970 (= lt!101201 (_1!2976 e!42336))))

(declare-fun c!4604 () Bool)

(assert (=> d!19970 (= c!4604 (= lt!100247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19970 (bvsge lt!100247 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19970 (= (bitStreamReadBitsIntoList!0 (_2!2965 lt!100237) (_1!2966 lt!100243) lt!100247) lt!101201)))

(declare-fun lt!101200 () (_ BitVec 64))

(declare-fun lt!101202 () tuple2!5732)

(declare-fun b!64048 () Bool)

(assert (=> b!64048 (= e!42336 (tuple2!5731 (Cons!688 (_1!2977 lt!101202) (bitStreamReadBitsIntoList!0 (_2!2965 lt!100237) (_2!2977 lt!101202) (bvsub lt!100247 lt!101200))) (_2!2977 lt!101202)))))

(assert (=> b!64048 (= lt!101202 (readBit!0 (_1!2966 lt!100243)))))

(assert (=> b!64048 (= lt!101200 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19970 c!4604) b!64047))

(assert (= (and d!19970 (not c!4604)) b!64048))

(assert (= (and d!19970 c!4603) b!64049))

(assert (= (and d!19970 (not c!4603)) b!64050))

(declare-fun m!101615 () Bool)

(assert (=> b!64050 m!101615))

(declare-fun m!101617 () Bool)

(assert (=> b!64049 m!101617))

(declare-fun m!101619 () Bool)

(assert (=> b!64048 m!101619))

(declare-fun m!101621 () Bool)

(assert (=> b!64048 m!101621))

(assert (=> b!63635 d!19970))

(declare-fun d!19972 () Bool)

(assert (=> d!19972 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100237)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239))) lt!100247)))

(declare-fun lt!101203 () Unit!4317)

(assert (=> d!19972 (= lt!101203 (choose!9 (_2!2965 lt!100239) (buf!1669 (_2!2965 lt!100237)) lt!100247 (BitStream!2235 (buf!1669 (_2!2965 lt!100237)) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239)))))))

(assert (=> d!19972 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2965 lt!100239) (buf!1669 (_2!2965 lt!100237)) lt!100247) lt!101203)))

(declare-fun bs!4911 () Bool)

(assert (= bs!4911 d!19972))

(assert (=> bs!4911 m!100831))

(declare-fun m!101623 () Bool)

(assert (=> bs!4911 m!101623))

(assert (=> b!63635 d!19972))

(declare-fun d!19974 () Bool)

(assert (=> d!19974 (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100237)))) ((_ sign_extend 32) (currentByte!3317 thiss!1379)) ((_ sign_extend 32) (currentBit!3312 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!101204 () Unit!4317)

(assert (=> d!19974 (= lt!101204 (choose!9 thiss!1379 (buf!1669 (_2!2965 lt!100237)) (bvsub to!314 i!635) (BitStream!2235 (buf!1669 (_2!2965 lt!100237)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379))))))

(assert (=> d!19974 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1669 (_2!2965 lt!100237)) (bvsub to!314 i!635)) lt!101204)))

(declare-fun bs!4912 () Bool)

(assert (= bs!4912 d!19974))

(assert (=> bs!4912 m!100843))

(declare-fun m!101625 () Bool)

(assert (=> bs!4912 m!101625))

(assert (=> b!63635 d!19974))

(declare-fun d!19976 () Bool)

(assert (=> d!19976 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100237)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239))) lt!100247) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100237)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239)))) lt!100247))))

(declare-fun bs!4913 () Bool)

(assert (= bs!4913 d!19976))

(declare-fun m!101627 () Bool)

(assert (=> bs!4913 m!101627))

(assert (=> b!63635 d!19976))

(declare-fun lt!101205 () tuple2!5710)

(declare-fun lt!101208 () (_ BitVec 64))

(declare-fun e!42338 () Bool)

(declare-fun lt!101222 () (_ BitVec 64))

(declare-fun b!64051 () Bool)

(assert (=> b!64051 (= e!42338 (= (_1!2966 lt!101205) (withMovedBitIndex!0 (_2!2966 lt!101205) (bvsub lt!101222 lt!101208))))))

(assert (=> b!64051 (or (= (bvand lt!101222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101208 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101222 lt!101208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64051 (= lt!101208 (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100237))) (currentByte!3317 (_2!2965 lt!100237)) (currentBit!3312 (_2!2965 lt!100237))))))

(assert (=> b!64051 (= lt!101222 (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)))))

(declare-fun b!64052 () Bool)

(declare-fun e!42337 () Unit!4317)

(declare-fun lt!101212 () Unit!4317)

(assert (=> b!64052 (= e!42337 lt!101212)))

(declare-fun lt!101216 () (_ BitVec 64))

(assert (=> b!64052 (= lt!101216 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!101221 () (_ BitVec 64))

(assert (=> b!64052 (= lt!101221 (bitIndex!0 (size!1288 (buf!1669 thiss!1379)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)))))

(assert (=> b!64052 (= lt!101212 (arrayBitRangesEqSymmetric!0 (buf!1669 thiss!1379) (buf!1669 (_2!2965 lt!100237)) lt!101216 lt!101221))))

(assert (=> b!64052 (arrayBitRangesEq!0 (buf!1669 (_2!2965 lt!100237)) (buf!1669 thiss!1379) lt!101216 lt!101221)))

(declare-fun b!64053 () Bool)

(declare-fun res!53171 () Bool)

(assert (=> b!64053 (=> (not res!53171) (not e!42338))))

(assert (=> b!64053 (= res!53171 (isPrefixOf!0 (_2!2966 lt!101205) (_2!2965 lt!100237)))))

(declare-fun d!19978 () Bool)

(assert (=> d!19978 e!42338))

(declare-fun res!53172 () Bool)

(assert (=> d!19978 (=> (not res!53172) (not e!42338))))

(assert (=> d!19978 (= res!53172 (isPrefixOf!0 (_1!2966 lt!101205) (_2!2966 lt!101205)))))

(declare-fun lt!101209 () BitStream!2234)

(assert (=> d!19978 (= lt!101205 (tuple2!5711 lt!101209 (_2!2965 lt!100237)))))

(declare-fun lt!101215 () Unit!4317)

(declare-fun lt!101224 () Unit!4317)

(assert (=> d!19978 (= lt!101215 lt!101224)))

(assert (=> d!19978 (isPrefixOf!0 lt!101209 (_2!2965 lt!100237))))

(assert (=> d!19978 (= lt!101224 (lemmaIsPrefixTransitive!0 lt!101209 (_2!2965 lt!100237) (_2!2965 lt!100237)))))

(declare-fun lt!101210 () Unit!4317)

(declare-fun lt!101219 () Unit!4317)

(assert (=> d!19978 (= lt!101210 lt!101219)))

(assert (=> d!19978 (isPrefixOf!0 lt!101209 (_2!2965 lt!100237))))

(assert (=> d!19978 (= lt!101219 (lemmaIsPrefixTransitive!0 lt!101209 thiss!1379 (_2!2965 lt!100237)))))

(declare-fun lt!101214 () Unit!4317)

(assert (=> d!19978 (= lt!101214 e!42337)))

(declare-fun c!4605 () Bool)

(assert (=> d!19978 (= c!4605 (not (= (size!1288 (buf!1669 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!101220 () Unit!4317)

(declare-fun lt!101218 () Unit!4317)

(assert (=> d!19978 (= lt!101220 lt!101218)))

(assert (=> d!19978 (isPrefixOf!0 (_2!2965 lt!100237) (_2!2965 lt!100237))))

(assert (=> d!19978 (= lt!101218 (lemmaIsPrefixRefl!0 (_2!2965 lt!100237)))))

(declare-fun lt!101206 () Unit!4317)

(declare-fun lt!101213 () Unit!4317)

(assert (=> d!19978 (= lt!101206 lt!101213)))

(assert (=> d!19978 (= lt!101213 (lemmaIsPrefixRefl!0 (_2!2965 lt!100237)))))

(declare-fun lt!101211 () Unit!4317)

(declare-fun lt!101207 () Unit!4317)

(assert (=> d!19978 (= lt!101211 lt!101207)))

(assert (=> d!19978 (isPrefixOf!0 lt!101209 lt!101209)))

(assert (=> d!19978 (= lt!101207 (lemmaIsPrefixRefl!0 lt!101209))))

(declare-fun lt!101223 () Unit!4317)

(declare-fun lt!101217 () Unit!4317)

(assert (=> d!19978 (= lt!101223 lt!101217)))

(assert (=> d!19978 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19978 (= lt!101217 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19978 (= lt!101209 (BitStream!2235 (buf!1669 (_2!2965 lt!100237)) (currentByte!3317 thiss!1379) (currentBit!3312 thiss!1379)))))

(assert (=> d!19978 (isPrefixOf!0 thiss!1379 (_2!2965 lt!100237))))

(assert (=> d!19978 (= (reader!0 thiss!1379 (_2!2965 lt!100237)) lt!101205)))

(declare-fun b!64054 () Bool)

(declare-fun Unit!4348 () Unit!4317)

(assert (=> b!64054 (= e!42337 Unit!4348)))

(declare-fun b!64055 () Bool)

(declare-fun res!53173 () Bool)

(assert (=> b!64055 (=> (not res!53173) (not e!42338))))

(assert (=> b!64055 (= res!53173 (isPrefixOf!0 (_1!2966 lt!101205) thiss!1379))))

(assert (= (and d!19978 c!4605) b!64052))

(assert (= (and d!19978 (not c!4605)) b!64054))

(assert (= (and d!19978 res!53172) b!64055))

(assert (= (and b!64055 res!53173) b!64053))

(assert (= (and b!64053 res!53171) b!64051))

(assert (=> b!64052 m!100813))

(declare-fun m!101629 () Bool)

(assert (=> b!64052 m!101629))

(declare-fun m!101631 () Bool)

(assert (=> b!64052 m!101631))

(assert (=> d!19978 m!101583))

(declare-fun m!101633 () Bool)

(assert (=> d!19978 m!101633))

(declare-fun m!101635 () Bool)

(assert (=> d!19978 m!101635))

(assert (=> d!19978 m!100809))

(declare-fun m!101637 () Bool)

(assert (=> d!19978 m!101637))

(assert (=> d!19978 m!100811))

(assert (=> d!19978 m!101591))

(declare-fun m!101639 () Bool)

(assert (=> d!19978 m!101639))

(assert (=> d!19978 m!100799))

(declare-fun m!101641 () Bool)

(assert (=> d!19978 m!101641))

(declare-fun m!101643 () Bool)

(assert (=> d!19978 m!101643))

(declare-fun m!101645 () Bool)

(assert (=> b!64051 m!101645))

(assert (=> b!64051 m!100863))

(assert (=> b!64051 m!100813))

(declare-fun m!101647 () Bool)

(assert (=> b!64053 m!101647))

(declare-fun m!101649 () Bool)

(assert (=> b!64055 m!101649))

(assert (=> b!63635 d!19978))

(declare-fun d!19980 () Bool)

(assert (=> d!19980 (= (invariant!0 (currentBit!3312 (_2!2965 lt!100237)) (currentByte!3317 (_2!2965 lt!100237)) (size!1288 (buf!1669 (_2!2965 lt!100237)))) (and (bvsge (currentBit!3312 (_2!2965 lt!100237)) #b00000000000000000000000000000000) (bvslt (currentBit!3312 (_2!2965 lt!100237)) #b00000000000000000000000000001000) (bvsge (currentByte!3317 (_2!2965 lt!100237)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3317 (_2!2965 lt!100237)) (size!1288 (buf!1669 (_2!2965 lt!100237)))) (and (= (currentBit!3312 (_2!2965 lt!100237)) #b00000000000000000000000000000000) (= (currentByte!3317 (_2!2965 lt!100237)) (size!1288 (buf!1669 (_2!2965 lt!100237))))))))))

(assert (=> b!63624 d!19980))

(declare-fun d!19982 () Bool)

(declare-fun e!42339 () Bool)

(assert (=> d!19982 e!42339))

(declare-fun res!53174 () Bool)

(assert (=> d!19982 (=> (not res!53174) (not e!42339))))

(declare-fun lt!101226 () (_ BitVec 64))

(declare-fun lt!101225 () (_ BitVec 64))

(declare-fun lt!101230 () (_ BitVec 64))

(assert (=> d!19982 (= res!53174 (= lt!101225 (bvsub lt!101226 lt!101230)))))

(assert (=> d!19982 (or (= (bvand lt!101226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!101230 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!101226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!101226 lt!101230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19982 (= lt!101230 (remainingBits!0 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))) ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239)))))))

(declare-fun lt!101227 () (_ BitVec 64))

(declare-fun lt!101228 () (_ BitVec 64))

(assert (=> d!19982 (= lt!101226 (bvmul lt!101227 lt!101228))))

(assert (=> d!19982 (or (= lt!101227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!101228 (bvsdiv (bvmul lt!101227 lt!101228) lt!101227)))))

(assert (=> d!19982 (= lt!101228 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19982 (= lt!101227 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))))))

(assert (=> d!19982 (= lt!101225 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3317 (_2!2965 lt!100239))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3312 (_2!2965 lt!100239)))))))

(assert (=> d!19982 (invariant!0 (currentBit!3312 (_2!2965 lt!100239)) (currentByte!3317 (_2!2965 lt!100239)) (size!1288 (buf!1669 (_2!2965 lt!100239))))))

(assert (=> d!19982 (= (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100239))) (currentByte!3317 (_2!2965 lt!100239)) (currentBit!3312 (_2!2965 lt!100239))) lt!101225)))

(declare-fun b!64056 () Bool)

(declare-fun res!53175 () Bool)

(assert (=> b!64056 (=> (not res!53175) (not e!42339))))

(assert (=> b!64056 (= res!53175 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!101225))))

(declare-fun b!64057 () Bool)

(declare-fun lt!101229 () (_ BitVec 64))

(assert (=> b!64057 (= e!42339 (bvsle lt!101225 (bvmul lt!101229 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!64057 (or (= lt!101229 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!101229 #b0000000000000000000000000000000000000000000000000000000000001000) lt!101229)))))

(assert (=> b!64057 (= lt!101229 ((_ sign_extend 32) (size!1288 (buf!1669 (_2!2965 lt!100239)))))))

(assert (= (and d!19982 res!53174) b!64056))

(assert (= (and b!64056 res!53175) b!64057))

(assert (=> d!19982 m!101547))

(assert (=> d!19982 m!100815))

(assert (=> b!63626 d!19982))

(declare-fun d!19984 () Bool)

(declare-fun res!53176 () Bool)

(declare-fun e!42340 () Bool)

(assert (=> d!19984 (=> (not res!53176) (not e!42340))))

(assert (=> d!19984 (= res!53176 (= (size!1288 (buf!1669 (_1!2966 lt!100240))) (size!1288 (buf!1669 (_2!2965 lt!100237)))))))

(assert (=> d!19984 (= (isPrefixOf!0 (_1!2966 lt!100240) (_2!2965 lt!100237)) e!42340)))

(declare-fun b!64058 () Bool)

(declare-fun res!53178 () Bool)

(assert (=> b!64058 (=> (not res!53178) (not e!42340))))

(assert (=> b!64058 (= res!53178 (bvsle (bitIndex!0 (size!1288 (buf!1669 (_1!2966 lt!100240))) (currentByte!3317 (_1!2966 lt!100240)) (currentBit!3312 (_1!2966 lt!100240))) (bitIndex!0 (size!1288 (buf!1669 (_2!2965 lt!100237))) (currentByte!3317 (_2!2965 lt!100237)) (currentBit!3312 (_2!2965 lt!100237)))))))

(declare-fun b!64059 () Bool)

(declare-fun e!42341 () Bool)

(assert (=> b!64059 (= e!42340 e!42341)))

(declare-fun res!53177 () Bool)

(assert (=> b!64059 (=> res!53177 e!42341)))

(assert (=> b!64059 (= res!53177 (= (size!1288 (buf!1669 (_1!2966 lt!100240))) #b00000000000000000000000000000000))))

(declare-fun b!64060 () Bool)

(assert (=> b!64060 (= e!42341 (arrayBitRangesEq!0 (buf!1669 (_1!2966 lt!100240)) (buf!1669 (_2!2965 lt!100237)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1288 (buf!1669 (_1!2966 lt!100240))) (currentByte!3317 (_1!2966 lt!100240)) (currentBit!3312 (_1!2966 lt!100240)))))))

(assert (= (and d!19984 res!53176) b!64058))

(assert (= (and b!64058 res!53178) b!64059))

(assert (= (and b!64059 (not res!53177)) b!64060))

(assert (=> b!64058 m!101051))

(assert (=> b!64058 m!100863))

(assert (=> b!64060 m!101051))

(assert (=> b!64060 m!101051))

(declare-fun m!101651 () Bool)

(assert (=> b!64060 m!101651))

(assert (=> b!63636 d!19984))

(declare-fun d!19986 () Bool)

(assert (=> d!19986 (= (array_inv!1176 (buf!1669 thiss!1379)) (bvsge (size!1288 (buf!1669 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!63625 d!19986))

(push 1)

(assert (not b!64053))

(assert (not b!63816))

(assert (not d!19962))

(assert (not b!63987))

(assert (not d!19978))

(assert (not bm!814))

(assert (not b!63792))

(assert (not b!64037))

(assert (not b!63818))

(assert (not b!63815))

(assert (not b!64049))

(assert (not b!64035))

(assert (not b!64034))

(assert (not b!63800))

(assert (not d!19850))

(assert (not b!64045))

(assert (not b!64012))

(assert (not d!19862))

(assert (not d!19958))

(assert (not b!64055))

(assert (not b!64030))

(assert (not b!64004))

(assert (not b!63813))

(assert (not d!19828))

(assert (not b!63982))

(assert (not d!19840))

(assert (not b!64032))

(assert (not b!64006))

(assert (not d!19834))

(assert (not b!64040))

(assert (not b!64044))

(assert (not b!64050))

(assert (not d!19982))

(assert (not b!64052))

(assert (not b!63793))

(assert (not b!63819))

(assert (not d!19860))

(assert (not d!19852))

(assert (not b!64046))

(assert (not b!63983))

(assert (not b!64051))

(assert (not b!63988))

(assert (not b!64038))

(assert (not d!19972))

(assert (not b!63812))

(assert (not d!19968))

(assert (not d!19964))

(assert (not d!19960))

(assert (not b!64042))

(assert (not d!19956))

(assert (not b!64005))

(assert (not d!19842))

(assert (not b!63798))

(assert (not d!19976))

(assert (not b!63790))

(assert (not b!63985))

(assert (not b!63986))

(assert (not b!64033))

(assert (not b!64048))

(assert (not d!19858))

(assert (not b!64031))

(assert (not b!63795))

(assert (not b!64036))

(assert (not b!64007))

(assert (not b!63821))

(assert (not b!64009))

(assert (not d!19836))

(assert (not b!64058))

(assert (not b!64039))

(assert (not d!19974))

(assert (not b!64060))

(assert (not b!63994))

(assert (not b!63811))

(check-sat)

(pop 1)

(push 1)

(check-sat)

