; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5486 () Bool)

(assert start!5486)

(declare-fun b!22214 () Bool)

(declare-fun e!15025 () Bool)

(declare-fun e!15023 () Bool)

(assert (=> b!22214 (= e!15025 (not e!15023))))

(declare-fun res!19147 () Bool)

(assert (=> b!22214 (=> res!19147 e!15023)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!22214 (= res!19147 (bvsge i!635 to!314))))

(declare-datatypes ((array!1542 0))(
  ( (array!1543 (arr!1110 (Array (_ BitVec 32) (_ BitVec 8))) (size!657 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1148 0))(
  ( (BitStream!1149 (buf!975 array!1542) (currentByte!2282 (_ BitVec 32)) (currentBit!2277 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1148)

(declare-fun isPrefixOf!0 (BitStream!1148 BitStream!1148) Bool)

(assert (=> b!22214 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1924 0))(
  ( (Unit!1925) )
))
(declare-fun lt!32330 () Unit!1924)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1148) Unit!1924)

(assert (=> b!22214 (= lt!32330 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!32329 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!22214 (= lt!32329 (bitIndex!0 (size!657 (buf!975 thiss!1379)) (currentByte!2282 thiss!1379) (currentBit!2277 thiss!1379)))))

(declare-fun b!22215 () Bool)

(declare-fun res!19143 () Bool)

(declare-fun e!15030 () Bool)

(assert (=> b!22215 (=> res!19143 e!15030)))

(declare-datatypes ((tuple2!2590 0))(
  ( (tuple2!2591 (_1!1380 Unit!1924) (_2!1380 BitStream!1148)) )
))
(declare-fun lt!32325 () tuple2!2590)

(assert (=> b!22215 (= res!19143 (not (= (size!657 (buf!975 thiss!1379)) (size!657 (buf!975 (_2!1380 lt!32325))))))))

(declare-fun b!22216 () Bool)

(assert (=> b!22216 (= e!15030 true)))

(assert (=> b!22216 (= (size!657 (buf!975 (_2!1380 lt!32325))) (size!657 (buf!975 thiss!1379)))))

(declare-fun b!22217 () Bool)

(declare-fun e!15024 () Bool)

(assert (=> b!22217 (= e!15023 e!15024)))

(declare-fun res!19145 () Bool)

(assert (=> b!22217 (=> res!19145 e!15024)))

(declare-fun lt!32326 () tuple2!2590)

(assert (=> b!22217 (= res!19145 (not (isPrefixOf!0 thiss!1379 (_2!1380 lt!32326))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22217 (validate_offset_bits!1 ((_ sign_extend 32) (size!657 (buf!975 (_2!1380 lt!32326)))) ((_ sign_extend 32) (currentByte!2282 (_2!1380 lt!32326))) ((_ sign_extend 32) (currentBit!2277 (_2!1380 lt!32326))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32327 () Unit!1924)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1148 BitStream!1148 (_ BitVec 64) (_ BitVec 64)) Unit!1924)

(assert (=> b!22217 (= lt!32327 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1380 lt!32326) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1542)

(declare-fun appendBitFromByte!0 (BitStream!1148 (_ BitVec 8) (_ BitVec 32)) tuple2!2590)

(assert (=> b!22217 (= lt!32326 (appendBitFromByte!0 thiss!1379 (select (arr!1110 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!22218 () Bool)

(declare-fun res!19140 () Bool)

(assert (=> b!22218 (=> res!19140 e!15030)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!22218 (= res!19140 (not (invariant!0 (currentBit!2277 (_2!1380 lt!32325)) (currentByte!2282 (_2!1380 lt!32325)) (size!657 (buf!975 (_2!1380 lt!32325))))))))

(declare-fun b!22219 () Bool)

(declare-fun res!19144 () Bool)

(assert (=> b!22219 (=> (not res!19144) (not e!15025))))

(assert (=> b!22219 (= res!19144 (validate_offset_bits!1 ((_ sign_extend 32) (size!657 (buf!975 thiss!1379))) ((_ sign_extend 32) (currentByte!2282 thiss!1379)) ((_ sign_extend 32) (currentBit!2277 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!22221 () Bool)

(declare-fun res!19148 () Bool)

(assert (=> b!22221 (=> res!19148 e!15030)))

(assert (=> b!22221 (= res!19148 (not (= (bitIndex!0 (size!657 (buf!975 (_2!1380 lt!32325))) (currentByte!2282 (_2!1380 lt!32325)) (currentBit!2277 (_2!1380 lt!32325))) (bvsub (bvadd lt!32329 to!314) i!635))))))

(declare-fun b!22222 () Bool)

(assert (=> b!22222 (= e!15024 e!15030)))

(declare-fun res!19141 () Bool)

(assert (=> b!22222 (=> res!19141 e!15030)))

(assert (=> b!22222 (= res!19141 (not (isPrefixOf!0 (_2!1380 lt!32326) (_2!1380 lt!32325))))))

(assert (=> b!22222 (isPrefixOf!0 thiss!1379 (_2!1380 lt!32325))))

(declare-fun lt!32328 () Unit!1924)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1148 BitStream!1148 BitStream!1148) Unit!1924)

(assert (=> b!22222 (= lt!32328 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1380 lt!32326) (_2!1380 lt!32325)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1148 array!1542 (_ BitVec 64) (_ BitVec 64)) tuple2!2590)

(assert (=> b!22222 (= lt!32325 (appendBitsMSBFirstLoop!0 (_2!1380 lt!32326) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15028 () Bool)

(assert (=> b!22222 e!15028))

(declare-fun res!19142 () Bool)

(assert (=> b!22222 (=> (not res!19142) (not e!15028))))

(assert (=> b!22222 (= res!19142 (validate_offset_bits!1 ((_ sign_extend 32) (size!657 (buf!975 (_2!1380 lt!32326)))) ((_ sign_extend 32) (currentByte!2282 thiss!1379)) ((_ sign_extend 32) (currentBit!2277 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32331 () Unit!1924)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1148 array!1542 (_ BitVec 64)) Unit!1924)

(assert (=> b!22222 (= lt!32331 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!975 (_2!1380 lt!32326)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2592 0))(
  ( (tuple2!2593 (_1!1381 BitStream!1148) (_2!1381 BitStream!1148)) )
))
(declare-fun lt!32332 () tuple2!2592)

(declare-fun reader!0 (BitStream!1148 BitStream!1148) tuple2!2592)

(assert (=> b!22222 (= lt!32332 (reader!0 thiss!1379 (_2!1380 lt!32326)))))

(declare-fun b!22223 () Bool)

(declare-fun e!15029 () Bool)

(declare-fun array_inv!627 (array!1542) Bool)

(assert (=> b!22223 (= e!15029 (array_inv!627 (buf!975 thiss!1379)))))

(declare-fun res!19146 () Bool)

(assert (=> start!5486 (=> (not res!19146) (not e!15025))))

(assert (=> start!5486 (= res!19146 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!657 srcBuffer!2))))))))

(assert (=> start!5486 e!15025))

(assert (=> start!5486 true))

(assert (=> start!5486 (array_inv!627 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1148) Bool)

(assert (=> start!5486 (and (inv!12 thiss!1379) e!15029)))

(declare-fun b!22220 () Bool)

(declare-datatypes ((List!275 0))(
  ( (Nil!272) (Cons!271 (h!390 Bool) (t!1025 List!275)) )
))
(declare-fun head!112 (List!275) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1148 array!1542 (_ BitVec 64) (_ BitVec 64)) List!275)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1148 BitStream!1148 (_ BitVec 64)) List!275)

(assert (=> b!22220 (= e!15028 (= (head!112 (byteArrayBitContentToList!0 (_2!1380 lt!32326) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!112 (bitStreamReadBitsIntoList!0 (_2!1380 lt!32326) (_1!1381 lt!32332) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5486 res!19146) b!22219))

(assert (= (and b!22219 res!19144) b!22214))

(assert (= (and b!22214 (not res!19147)) b!22217))

(assert (= (and b!22217 (not res!19145)) b!22222))

(assert (= (and b!22222 res!19142) b!22220))

(assert (= (and b!22222 (not res!19141)) b!22221))

(assert (= (and b!22221 (not res!19148)) b!22218))

(assert (= (and b!22218 (not res!19140)) b!22215))

(assert (= (and b!22215 (not res!19143)) b!22216))

(assert (= start!5486 b!22223))

(declare-fun m!30889 () Bool)

(assert (=> b!22220 m!30889))

(assert (=> b!22220 m!30889))

(declare-fun m!30891 () Bool)

(assert (=> b!22220 m!30891))

(declare-fun m!30893 () Bool)

(assert (=> b!22220 m!30893))

(assert (=> b!22220 m!30893))

(declare-fun m!30895 () Bool)

(assert (=> b!22220 m!30895))

(declare-fun m!30897 () Bool)

(assert (=> start!5486 m!30897))

(declare-fun m!30899 () Bool)

(assert (=> start!5486 m!30899))

(declare-fun m!30901 () Bool)

(assert (=> b!22218 m!30901))

(declare-fun m!30903 () Bool)

(assert (=> b!22217 m!30903))

(declare-fun m!30905 () Bool)

(assert (=> b!22217 m!30905))

(declare-fun m!30907 () Bool)

(assert (=> b!22217 m!30907))

(declare-fun m!30909 () Bool)

(assert (=> b!22217 m!30909))

(assert (=> b!22217 m!30903))

(declare-fun m!30911 () Bool)

(assert (=> b!22217 m!30911))

(declare-fun m!30913 () Bool)

(assert (=> b!22219 m!30913))

(declare-fun m!30915 () Bool)

(assert (=> b!22221 m!30915))

(declare-fun m!30917 () Bool)

(assert (=> b!22222 m!30917))

(declare-fun m!30919 () Bool)

(assert (=> b!22222 m!30919))

(declare-fun m!30921 () Bool)

(assert (=> b!22222 m!30921))

(declare-fun m!30923 () Bool)

(assert (=> b!22222 m!30923))

(declare-fun m!30925 () Bool)

(assert (=> b!22222 m!30925))

(declare-fun m!30927 () Bool)

(assert (=> b!22222 m!30927))

(declare-fun m!30929 () Bool)

(assert (=> b!22222 m!30929))

(declare-fun m!30931 () Bool)

(assert (=> b!22223 m!30931))

(declare-fun m!30933 () Bool)

(assert (=> b!22214 m!30933))

(declare-fun m!30935 () Bool)

(assert (=> b!22214 m!30935))

(declare-fun m!30937 () Bool)

(assert (=> b!22214 m!30937))

(push 1)

(assert (not b!22220))

(assert (not b!22223))

(assert (not b!22221))

(assert (not start!5486))

(assert (not b!22217))

(assert (not b!22222))

(assert (not b!22218))

(assert (not b!22219))

(assert (not b!22214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

