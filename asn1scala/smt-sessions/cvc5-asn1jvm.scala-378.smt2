; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9152 () Bool)

(assert start!9152)

(declare-fun b!45247 () Bool)

(declare-fun e!30095 () Bool)

(declare-fun e!30101 () Bool)

(assert (=> b!45247 (= e!30095 e!30101)))

(declare-fun res!38252 () Bool)

(assert (=> b!45247 (=> res!38252 e!30101)))

(declare-datatypes ((array!2257 0))(
  ( (array!2258 (arr!1532 (Array (_ BitVec 32) (_ BitVec 8))) (size!1015 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1774 0))(
  ( (BitStream!1775 (buf!1364 array!2257) (currentByte!2857 (_ BitVec 32)) (currentBit!2852 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3220 0))(
  ( (Unit!3221) )
))
(declare-datatypes ((tuple2!4416 0))(
  ( (tuple2!4417 (_1!2301 Unit!3220) (_2!2301 BitStream!1774)) )
))
(declare-fun lt!69576 () tuple2!4416)

(declare-fun lt!69580 () tuple2!4416)

(declare-fun isPrefixOf!0 (BitStream!1774 BitStream!1774) Bool)

(assert (=> b!45247 (= res!38252 (not (isPrefixOf!0 (_2!2301 lt!69576) (_2!2301 lt!69580))))))

(declare-fun thiss!1379 () BitStream!1774)

(assert (=> b!45247 (isPrefixOf!0 thiss!1379 (_2!2301 lt!69580))))

(declare-fun lt!69577 () Unit!3220)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1774 BitStream!1774 BitStream!1774) Unit!3220)

(assert (=> b!45247 (= lt!69577 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2301 lt!69576) (_2!2301 lt!69580)))))

(declare-fun srcBuffer!2 () array!2257)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1774 array!2257 (_ BitVec 64) (_ BitVec 64)) tuple2!4416)

(assert (=> b!45247 (= lt!69580 (appendBitsMSBFirstLoop!0 (_2!2301 lt!69576) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!30097 () Bool)

(assert (=> b!45247 e!30097))

(declare-fun res!38261 () Bool)

(assert (=> b!45247 (=> (not res!38261) (not e!30097))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!45247 (= res!38261 (validate_offset_bits!1 ((_ sign_extend 32) (size!1015 (buf!1364 (_2!2301 lt!69576)))) ((_ sign_extend 32) (currentByte!2857 thiss!1379)) ((_ sign_extend 32) (currentBit!2852 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69572 () Unit!3220)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1774 array!2257 (_ BitVec 64)) Unit!3220)

(assert (=> b!45247 (= lt!69572 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1364 (_2!2301 lt!69576)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!4418 0))(
  ( (tuple2!4419 (_1!2302 BitStream!1774) (_2!2302 BitStream!1774)) )
))
(declare-fun lt!69573 () tuple2!4418)

(declare-fun reader!0 (BitStream!1774 BitStream!1774) tuple2!4418)

(assert (=> b!45247 (= lt!69573 (reader!0 thiss!1379 (_2!2301 lt!69576)))))

(declare-fun b!45248 () Bool)

(declare-fun e!30098 () Bool)

(declare-fun array_inv!940 (array!2257) Bool)

(assert (=> b!45248 (= e!30098 (array_inv!940 (buf!1364 thiss!1379)))))

(declare-fun b!45249 () Bool)

(declare-fun e!30099 () Bool)

(assert (=> b!45249 (= e!30101 e!30099)))

(declare-fun res!38255 () Bool)

(assert (=> b!45249 (=> res!38255 e!30099)))

(declare-fun lt!69575 () (_ BitVec 64))

(declare-fun lt!69579 () (_ BitVec 64))

(assert (=> b!45249 (= res!38255 (not (= lt!69575 (bvsub (bvadd lt!69579 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!45249 (= lt!69575 (bitIndex!0 (size!1015 (buf!1364 (_2!2301 lt!69580))) (currentByte!2857 (_2!2301 lt!69580)) (currentBit!2852 (_2!2301 lt!69580))))))

(declare-fun res!38259 () Bool)

(declare-fun e!30091 () Bool)

(assert (=> start!9152 (=> (not res!38259) (not e!30091))))

(assert (=> start!9152 (= res!38259 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1015 srcBuffer!2))))))))

(assert (=> start!9152 e!30091))

(assert (=> start!9152 true))

(assert (=> start!9152 (array_inv!940 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1774) Bool)

(assert (=> start!9152 (and (inv!12 thiss!1379) e!30098)))

(declare-fun b!45250 () Bool)

(declare-fun e!30094 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!45250 (= e!30094 (invariant!0 (currentBit!2852 (_2!2301 lt!69576)) (currentByte!2857 (_2!2301 lt!69576)) (size!1015 (buf!1364 (_2!2301 lt!69580)))))))

(declare-fun b!45251 () Bool)

(declare-fun res!38256 () Bool)

(assert (=> b!45251 (=> res!38256 e!30099)))

(assert (=> b!45251 (= res!38256 (not (invariant!0 (currentBit!2852 (_2!2301 lt!69580)) (currentByte!2857 (_2!2301 lt!69580)) (size!1015 (buf!1364 (_2!2301 lt!69580))))))))

(declare-fun e!30096 () Bool)

(declare-fun b!45252 () Bool)

(assert (=> b!45252 (= e!30096 (= lt!69575 (bvsub (bvsub (bvadd (bitIndex!0 (size!1015 (buf!1364 (_2!2301 lt!69576))) (currentByte!2857 (_2!2301 lt!69576)) (currentBit!2852 (_2!2301 lt!69576))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!45253 () Bool)

(declare-fun res!38253 () Bool)

(assert (=> b!45253 (=> res!38253 e!30094)))

(assert (=> b!45253 (= res!38253 (not (invariant!0 (currentBit!2852 (_2!2301 lt!69576)) (currentByte!2857 (_2!2301 lt!69576)) (size!1015 (buf!1364 (_2!2301 lt!69576))))))))

(declare-fun b!45254 () Bool)

(declare-fun res!38260 () Bool)

(assert (=> b!45254 (=> res!38260 e!30099)))

(assert (=> b!45254 (= res!38260 (not (= (size!1015 (buf!1364 thiss!1379)) (size!1015 (buf!1364 (_2!2301 lt!69580))))))))

(declare-fun b!45255 () Bool)

(declare-fun e!30100 () Bool)

(assert (=> b!45255 (= e!30100 e!30095)))

(declare-fun res!38254 () Bool)

(assert (=> b!45255 (=> res!38254 e!30095)))

(assert (=> b!45255 (= res!38254 (not (isPrefixOf!0 thiss!1379 (_2!2301 lt!69576))))))

(assert (=> b!45255 (validate_offset_bits!1 ((_ sign_extend 32) (size!1015 (buf!1364 (_2!2301 lt!69576)))) ((_ sign_extend 32) (currentByte!2857 (_2!2301 lt!69576))) ((_ sign_extend 32) (currentBit!2852 (_2!2301 lt!69576))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!69578 () Unit!3220)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1774 BitStream!1774 (_ BitVec 64) (_ BitVec 64)) Unit!3220)

(assert (=> b!45255 (= lt!69578 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2301 lt!69576) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1774 (_ BitVec 8) (_ BitVec 32)) tuple2!4416)

(assert (=> b!45255 (= lt!69576 (appendBitFromByte!0 thiss!1379 (select (arr!1532 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!45256 () Bool)

(declare-fun res!38258 () Bool)

(assert (=> b!45256 (=> (not res!38258) (not e!30091))))

(assert (=> b!45256 (= res!38258 (validate_offset_bits!1 ((_ sign_extend 32) (size!1015 (buf!1364 thiss!1379))) ((_ sign_extend 32) (currentByte!2857 thiss!1379)) ((_ sign_extend 32) (currentBit!2852 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!45257 () Bool)

(assert (=> b!45257 (= e!30099 e!30094)))

(declare-fun res!38257 () Bool)

(assert (=> b!45257 (=> res!38257 e!30094)))

(assert (=> b!45257 (= res!38257 (not (= (size!1015 (buf!1364 (_2!2301 lt!69576))) (size!1015 (buf!1364 (_2!2301 lt!69580))))))))

(assert (=> b!45257 e!30096))

(declare-fun res!38262 () Bool)

(assert (=> b!45257 (=> (not res!38262) (not e!30096))))

(assert (=> b!45257 (= res!38262 (= (size!1015 (buf!1364 (_2!2301 lt!69580))) (size!1015 (buf!1364 thiss!1379))))))

(declare-fun b!45258 () Bool)

(declare-datatypes ((List!528 0))(
  ( (Nil!525) (Cons!524 (h!643 Bool) (t!1278 List!528)) )
))
(declare-fun head!347 (List!528) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1774 array!2257 (_ BitVec 64) (_ BitVec 64)) List!528)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1774 BitStream!1774 (_ BitVec 64)) List!528)

(assert (=> b!45258 (= e!30097 (= (head!347 (byteArrayBitContentToList!0 (_2!2301 lt!69576) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!347 (bitStreamReadBitsIntoList!0 (_2!2301 lt!69576) (_1!2302 lt!69573) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!45259 () Bool)

(assert (=> b!45259 (= e!30091 (not e!30100))))

(declare-fun res!38251 () Bool)

(assert (=> b!45259 (=> res!38251 e!30100)))

(assert (=> b!45259 (= res!38251 (bvsge i!635 to!314))))

(assert (=> b!45259 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!69574 () Unit!3220)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1774) Unit!3220)

(assert (=> b!45259 (= lt!69574 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!45259 (= lt!69579 (bitIndex!0 (size!1015 (buf!1364 thiss!1379)) (currentByte!2857 thiss!1379) (currentBit!2852 thiss!1379)))))

(assert (= (and start!9152 res!38259) b!45256))

(assert (= (and b!45256 res!38258) b!45259))

(assert (= (and b!45259 (not res!38251)) b!45255))

(assert (= (and b!45255 (not res!38254)) b!45247))

(assert (= (and b!45247 res!38261) b!45258))

(assert (= (and b!45247 (not res!38252)) b!45249))

(assert (= (and b!45249 (not res!38255)) b!45251))

(assert (= (and b!45251 (not res!38256)) b!45254))

(assert (= (and b!45254 (not res!38260)) b!45257))

(assert (= (and b!45257 res!38262) b!45252))

(assert (= (and b!45257 (not res!38257)) b!45253))

(assert (= (and b!45253 (not res!38253)) b!45250))

(assert (= start!9152 b!45248))

(declare-fun m!69031 () Bool)

(assert (=> b!45258 m!69031))

(assert (=> b!45258 m!69031))

(declare-fun m!69033 () Bool)

(assert (=> b!45258 m!69033))

(declare-fun m!69035 () Bool)

(assert (=> b!45258 m!69035))

(assert (=> b!45258 m!69035))

(declare-fun m!69037 () Bool)

(assert (=> b!45258 m!69037))

(declare-fun m!69039 () Bool)

(assert (=> b!45248 m!69039))

(declare-fun m!69041 () Bool)

(assert (=> start!9152 m!69041))

(declare-fun m!69043 () Bool)

(assert (=> start!9152 m!69043))

(declare-fun m!69045 () Bool)

(assert (=> b!45252 m!69045))

(declare-fun m!69047 () Bool)

(assert (=> b!45247 m!69047))

(declare-fun m!69049 () Bool)

(assert (=> b!45247 m!69049))

(declare-fun m!69051 () Bool)

(assert (=> b!45247 m!69051))

(declare-fun m!69053 () Bool)

(assert (=> b!45247 m!69053))

(declare-fun m!69055 () Bool)

(assert (=> b!45247 m!69055))

(declare-fun m!69057 () Bool)

(assert (=> b!45247 m!69057))

(declare-fun m!69059 () Bool)

(assert (=> b!45247 m!69059))

(declare-fun m!69061 () Bool)

(assert (=> b!45259 m!69061))

(declare-fun m!69063 () Bool)

(assert (=> b!45259 m!69063))

(declare-fun m!69065 () Bool)

(assert (=> b!45259 m!69065))

(declare-fun m!69067 () Bool)

(assert (=> b!45255 m!69067))

(declare-fun m!69069 () Bool)

(assert (=> b!45255 m!69069))

(declare-fun m!69071 () Bool)

(assert (=> b!45255 m!69071))

(declare-fun m!69073 () Bool)

(assert (=> b!45255 m!69073))

(assert (=> b!45255 m!69071))

(declare-fun m!69075 () Bool)

(assert (=> b!45255 m!69075))

(declare-fun m!69077 () Bool)

(assert (=> b!45250 m!69077))

(declare-fun m!69079 () Bool)

(assert (=> b!45253 m!69079))

(declare-fun m!69081 () Bool)

(assert (=> b!45256 m!69081))

(declare-fun m!69083 () Bool)

(assert (=> b!45251 m!69083))

(declare-fun m!69085 () Bool)

(assert (=> b!45249 m!69085))

(push 1)

