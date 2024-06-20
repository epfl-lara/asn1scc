; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11784 () Bool)

(assert start!11784)

(declare-fun b!58068 () Bool)

(declare-fun e!38469 () Bool)

(declare-datatypes ((array!2641 0))(
  ( (array!2642 (arr!1760 (Array (_ BitVec 32) (_ BitVec 8))) (size!1196 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2080 0))(
  ( (BitStream!2081 (buf!1577 array!2641) (currentByte!3195 (_ BitVec 32)) (currentBit!3190 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2080)

(declare-fun array_inv!1099 (array!2641) Bool)

(assert (=> b!58068 (= e!38469 (array_inv!1099 (buf!1577 thiss!1379)))))

(declare-fun b!58069 () Bool)

(declare-fun res!48198 () Bool)

(declare-fun e!38472 () Bool)

(assert (=> b!58069 (=> res!48198 e!38472)))

(declare-datatypes ((Unit!4015 0))(
  ( (Unit!4016) )
))
(declare-datatypes ((tuple2!5282 0))(
  ( (tuple2!5283 (_1!2752 Unit!4015) (_2!2752 BitStream!2080)) )
))
(declare-fun lt!92076 () tuple2!5282)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58069 (= res!48198 (not (invariant!0 (currentBit!3190 (_2!2752 lt!92076)) (currentByte!3195 (_2!2752 lt!92076)) (size!1196 (buf!1577 (_2!2752 lt!92076))))))))

(declare-fun srcBuffer!2 () array!2641)

(declare-fun b!58070 () Bool)

(declare-fun e!38477 () Bool)

(declare-fun lt!92071 () tuple2!5282)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!5284 0))(
  ( (tuple2!5285 (_1!2753 BitStream!2080) (_2!2753 BitStream!2080)) )
))
(declare-fun lt!92075 () tuple2!5284)

(declare-datatypes ((List!615 0))(
  ( (Nil!612) (Cons!611 (h!730 Bool) (t!1365 List!615)) )
))
(declare-fun head!434 (List!615) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2080 array!2641 (_ BitVec 64) (_ BitVec 64)) List!615)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2080 BitStream!2080 (_ BitVec 64)) List!615)

(assert (=> b!58070 (= e!38477 (= (head!434 (byteArrayBitContentToList!0 (_2!2752 lt!92071) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!434 (bitStreamReadBitsIntoList!0 (_2!2752 lt!92071) (_1!2753 lt!92075) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58071 () Bool)

(declare-fun e!38474 () Bool)

(declare-fun e!38467 () Bool)

(assert (=> b!58071 (= e!38474 (not e!38467))))

(declare-fun res!48202 () Bool)

(assert (=> b!58071 (=> res!48202 e!38467)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!58071 (= res!48202 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2080 BitStream!2080) Bool)

(assert (=> b!58071 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92079 () Unit!4015)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2080) Unit!4015)

(assert (=> b!58071 (= lt!92079 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92072 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58071 (= lt!92072 (bitIndex!0 (size!1196 (buf!1577 thiss!1379)) (currentByte!3195 thiss!1379) (currentBit!3190 thiss!1379)))))

(declare-fun b!58072 () Bool)

(declare-fun res!48194 () Bool)

(declare-fun e!38476 () Bool)

(assert (=> b!58072 (=> res!48194 e!38476)))

(assert (=> b!58072 (= res!48194 (not (invariant!0 (currentBit!3190 (_2!2752 lt!92071)) (currentByte!3195 (_2!2752 lt!92071)) (size!1196 (buf!1577 (_2!2752 lt!92076))))))))

(declare-fun b!58073 () Bool)

(declare-fun res!48199 () Bool)

(assert (=> b!58073 (=> res!48199 e!38472)))

(assert (=> b!58073 (= res!48199 (not (= (size!1196 (buf!1577 thiss!1379)) (size!1196 (buf!1577 (_2!2752 lt!92076))))))))

(declare-fun res!48204 () Bool)

(assert (=> start!11784 (=> (not res!48204) (not e!38474))))

(assert (=> start!11784 (= res!48204 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1196 srcBuffer!2))))))))

(assert (=> start!11784 e!38474))

(assert (=> start!11784 true))

(assert (=> start!11784 (array_inv!1099 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2080) Bool)

(assert (=> start!11784 (and (inv!12 thiss!1379) e!38469)))

(declare-fun b!58074 () Bool)

(declare-fun res!48192 () Bool)

(assert (=> b!58074 (=> (not res!48192) (not e!38474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58074 (= res!48192 (validate_offset_bits!1 ((_ sign_extend 32) (size!1196 (buf!1577 thiss!1379))) ((_ sign_extend 32) (currentByte!3195 thiss!1379)) ((_ sign_extend 32) (currentBit!3190 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58075 () Bool)

(declare-fun res!48193 () Bool)

(assert (=> b!58075 (=> res!48193 e!38476)))

(assert (=> b!58075 (= res!48193 (not (invariant!0 (currentBit!3190 (_2!2752 lt!92071)) (currentByte!3195 (_2!2752 lt!92071)) (size!1196 (buf!1577 (_2!2752 lt!92071))))))))

(declare-fun b!58076 () Bool)

(assert (=> b!58076 (= e!38472 e!38476)))

(declare-fun res!48200 () Bool)

(assert (=> b!58076 (=> res!48200 e!38476)))

(assert (=> b!58076 (= res!48200 (not (= (size!1196 (buf!1577 (_2!2752 lt!92071))) (size!1196 (buf!1577 (_2!2752 lt!92076))))))))

(declare-fun e!38471 () Bool)

(assert (=> b!58076 e!38471))

(declare-fun res!48195 () Bool)

(assert (=> b!58076 (=> (not res!48195) (not e!38471))))

(assert (=> b!58076 (= res!48195 (= (size!1196 (buf!1577 (_2!2752 lt!92076))) (size!1196 (buf!1577 thiss!1379))))))

(declare-fun b!58077 () Bool)

(declare-fun e!38475 () Bool)

(assert (=> b!58077 (= e!38475 e!38472)))

(declare-fun res!48203 () Bool)

(assert (=> b!58077 (=> res!48203 e!38472)))

(declare-fun lt!92078 () (_ BitVec 64))

(assert (=> b!58077 (= res!48203 (not (= lt!92078 (bvsub (bvadd lt!92072 to!314) i!635))))))

(assert (=> b!58077 (= lt!92078 (bitIndex!0 (size!1196 (buf!1577 (_2!2752 lt!92076))) (currentByte!3195 (_2!2752 lt!92076)) (currentBit!3190 (_2!2752 lt!92076))))))

(declare-fun b!58078 () Bool)

(declare-fun e!38470 () Bool)

(assert (=> b!58078 (= e!38467 e!38470)))

(declare-fun res!48201 () Bool)

(assert (=> b!58078 (=> res!48201 e!38470)))

(assert (=> b!58078 (= res!48201 (not (isPrefixOf!0 thiss!1379 (_2!2752 lt!92071))))))

(assert (=> b!58078 (validate_offset_bits!1 ((_ sign_extend 32) (size!1196 (buf!1577 (_2!2752 lt!92071)))) ((_ sign_extend 32) (currentByte!3195 (_2!2752 lt!92071))) ((_ sign_extend 32) (currentBit!3190 (_2!2752 lt!92071))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92073 () Unit!4015)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2080 BitStream!2080 (_ BitVec 64) (_ BitVec 64)) Unit!4015)

(assert (=> b!58078 (= lt!92073 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2752 lt!92071) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2080 (_ BitVec 8) (_ BitVec 32)) tuple2!5282)

(assert (=> b!58078 (= lt!92071 (appendBitFromByte!0 thiss!1379 (select (arr!1760 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58079 () Bool)

(assert (=> b!58079 (= e!38470 e!38475)))

(declare-fun res!48196 () Bool)

(assert (=> b!58079 (=> res!48196 e!38475)))

(assert (=> b!58079 (= res!48196 (not (isPrefixOf!0 (_2!2752 lt!92071) (_2!2752 lt!92076))))))

(assert (=> b!58079 (isPrefixOf!0 thiss!1379 (_2!2752 lt!92076))))

(declare-fun lt!92080 () Unit!4015)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2080 BitStream!2080 BitStream!2080) Unit!4015)

(assert (=> b!58079 (= lt!92080 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2752 lt!92071) (_2!2752 lt!92076)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2080 array!2641 (_ BitVec 64) (_ BitVec 64)) tuple2!5282)

(assert (=> b!58079 (= lt!92076 (appendBitsMSBFirstLoop!0 (_2!2752 lt!92071) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58079 e!38477))

(declare-fun res!48197 () Bool)

(assert (=> b!58079 (=> (not res!48197) (not e!38477))))

(assert (=> b!58079 (= res!48197 (validate_offset_bits!1 ((_ sign_extend 32) (size!1196 (buf!1577 (_2!2752 lt!92071)))) ((_ sign_extend 32) (currentByte!3195 thiss!1379)) ((_ sign_extend 32) (currentBit!3190 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92074 () Unit!4015)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2080 array!2641 (_ BitVec 64)) Unit!4015)

(assert (=> b!58079 (= lt!92074 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1577 (_2!2752 lt!92071)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2080 BitStream!2080) tuple2!5284)

(assert (=> b!58079 (= lt!92075 (reader!0 thiss!1379 (_2!2752 lt!92071)))))

(declare-fun b!58080 () Bool)

(assert (=> b!58080 (= e!38471 (= lt!92078 (bvsub (bvsub (bvadd (bitIndex!0 (size!1196 (buf!1577 (_2!2752 lt!92071))) (currentByte!3195 (_2!2752 lt!92071)) (currentBit!3190 (_2!2752 lt!92071))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58081 () Bool)

(assert (=> b!58081 (= e!38476 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!92077 () tuple2!5284)

(assert (=> b!58081 (= lt!92077 (reader!0 thiss!1379 (_2!2752 lt!92076)))))

(assert (= (and start!11784 res!48204) b!58074))

(assert (= (and b!58074 res!48192) b!58071))

(assert (= (and b!58071 (not res!48202)) b!58078))

(assert (= (and b!58078 (not res!48201)) b!58079))

(assert (= (and b!58079 res!48197) b!58070))

(assert (= (and b!58079 (not res!48196)) b!58077))

(assert (= (and b!58077 (not res!48203)) b!58069))

(assert (= (and b!58069 (not res!48198)) b!58073))

(assert (= (and b!58073 (not res!48199)) b!58076))

(assert (= (and b!58076 res!48195) b!58080))

(assert (= (and b!58076 (not res!48200)) b!58075))

(assert (= (and b!58075 (not res!48193)) b!58072))

(assert (= (and b!58072 (not res!48194)) b!58081))

(assert (= start!11784 b!58068))

(declare-fun m!91561 () Bool)

(assert (=> b!58075 m!91561))

(declare-fun m!91563 () Bool)

(assert (=> b!58071 m!91563))

(declare-fun m!91565 () Bool)

(assert (=> b!58071 m!91565))

(declare-fun m!91567 () Bool)

(assert (=> b!58071 m!91567))

(declare-fun m!91569 () Bool)

(assert (=> b!58070 m!91569))

(assert (=> b!58070 m!91569))

(declare-fun m!91571 () Bool)

(assert (=> b!58070 m!91571))

(declare-fun m!91573 () Bool)

(assert (=> b!58070 m!91573))

(assert (=> b!58070 m!91573))

(declare-fun m!91575 () Bool)

(assert (=> b!58070 m!91575))

(declare-fun m!91577 () Bool)

(assert (=> b!58074 m!91577))

(declare-fun m!91579 () Bool)

(assert (=> b!58078 m!91579))

(declare-fun m!91581 () Bool)

(assert (=> b!58078 m!91581))

(declare-fun m!91583 () Bool)

(assert (=> b!58078 m!91583))

(assert (=> b!58078 m!91581))

(declare-fun m!91585 () Bool)

(assert (=> b!58078 m!91585))

(declare-fun m!91587 () Bool)

(assert (=> b!58078 m!91587))

(declare-fun m!91589 () Bool)

(assert (=> b!58068 m!91589))

(declare-fun m!91591 () Bool)

(assert (=> b!58081 m!91591))

(declare-fun m!91593 () Bool)

(assert (=> b!58079 m!91593))

(declare-fun m!91595 () Bool)

(assert (=> b!58079 m!91595))

(declare-fun m!91597 () Bool)

(assert (=> b!58079 m!91597))

(declare-fun m!91599 () Bool)

(assert (=> b!58079 m!91599))

(declare-fun m!91601 () Bool)

(assert (=> b!58079 m!91601))

(declare-fun m!91603 () Bool)

(assert (=> b!58079 m!91603))

(declare-fun m!91605 () Bool)

(assert (=> b!58079 m!91605))

(declare-fun m!91607 () Bool)

(assert (=> b!58080 m!91607))

(declare-fun m!91609 () Bool)

(assert (=> b!58069 m!91609))

(declare-fun m!91611 () Bool)

(assert (=> b!58077 m!91611))

(declare-fun m!91613 () Bool)

(assert (=> b!58072 m!91613))

(declare-fun m!91615 () Bool)

(assert (=> start!11784 m!91615))

(declare-fun m!91617 () Bool)

(assert (=> start!11784 m!91617))

(push 1)

(assert (not b!58077))

(assert (not b!58074))

(assert (not b!58078))

(assert (not b!58081))

(assert (not b!58071))

(assert (not b!58075))

(assert (not b!58070))

(assert (not b!58068))

(assert (not b!58079))

(assert (not b!58080))

(assert (not start!11784))

(assert (not b!58069))

(assert (not b!58072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

