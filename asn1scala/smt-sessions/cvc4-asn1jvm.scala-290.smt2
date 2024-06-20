; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5724 () Bool)

(assert start!5724)

(declare-fun b!24840 () Bool)

(declare-fun e!16969 () Bool)

(declare-fun e!16971 () Bool)

(assert (=> b!24840 (= e!16969 e!16971)))

(declare-fun res!21464 () Bool)

(assert (=> b!24840 (=> res!21464 e!16971)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!35328 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!35319 () (_ BitVec 64))

(assert (=> b!24840 (= res!21464 (not (= lt!35328 (bvsub (bvadd lt!35319 to!314) i!635))))))

(declare-datatypes ((array!1647 0))(
  ( (array!1648 (arr!1165 (Array (_ BitVec 32) (_ BitVec 8))) (size!709 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1250 0))(
  ( (BitStream!1251 (buf!1030 array!1647) (currentByte!2343 (_ BitVec 32)) (currentBit!2338 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2061 0))(
  ( (Unit!2062) )
))
(declare-datatypes ((tuple2!2818 0))(
  ( (tuple2!2819 (_1!1496 Unit!2061) (_2!1496 BitStream!1250)) )
))
(declare-fun lt!35318 () tuple2!2818)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24840 (= lt!35328 (bitIndex!0 (size!709 (buf!1030 (_2!1496 lt!35318))) (currentByte!2343 (_2!1496 lt!35318)) (currentBit!2338 (_2!1496 lt!35318))))))

(declare-fun b!24841 () Bool)

(declare-fun e!16968 () Bool)

(assert (=> b!24841 (= e!16968 true)))

(declare-fun lt!35321 () tuple2!2818)

(declare-fun lt!35329 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24841 (validate_offset_bits!1 ((_ sign_extend 32) (size!709 (buf!1030 (_2!1496 lt!35318)))) ((_ sign_extend 32) (currentByte!2343 (_2!1496 lt!35321))) ((_ sign_extend 32) (currentBit!2338 (_2!1496 lt!35321))) lt!35329)))

(declare-fun lt!35320 () Unit!2061)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1250 array!1647 (_ BitVec 64)) Unit!2061)

(assert (=> b!24841 (= lt!35320 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1496 lt!35321) (buf!1030 (_2!1496 lt!35318)) lt!35329))))

(declare-datatypes ((tuple2!2820 0))(
  ( (tuple2!2821 (_1!1497 BitStream!1250) (_2!1497 BitStream!1250)) )
))
(declare-fun lt!35323 () tuple2!2820)

(declare-fun reader!0 (BitStream!1250 BitStream!1250) tuple2!2820)

(assert (=> b!24841 (= lt!35323 (reader!0 (_2!1496 lt!35321) (_2!1496 lt!35318)))))

(declare-fun thiss!1379 () BitStream!1250)

(assert (=> b!24841 (validate_offset_bits!1 ((_ sign_extend 32) (size!709 (buf!1030 (_2!1496 lt!35318)))) ((_ sign_extend 32) (currentByte!2343 thiss!1379)) ((_ sign_extend 32) (currentBit!2338 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!35324 () Unit!2061)

(assert (=> b!24841 (= lt!35324 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1030 (_2!1496 lt!35318)) (bvsub to!314 i!635)))))

(declare-fun lt!35325 () tuple2!2820)

(assert (=> b!24841 (= lt!35325 (reader!0 thiss!1379 (_2!1496 lt!35318)))))

(declare-fun b!24842 () Bool)

(declare-fun e!16974 () Bool)

(declare-fun e!16975 () Bool)

(assert (=> b!24842 (= e!16974 e!16975)))

(declare-fun res!21465 () Bool)

(assert (=> b!24842 (=> res!21465 e!16975)))

(declare-fun isPrefixOf!0 (BitStream!1250 BitStream!1250) Bool)

(assert (=> b!24842 (= res!21465 (not (isPrefixOf!0 thiss!1379 (_2!1496 lt!35321))))))

(assert (=> b!24842 (validate_offset_bits!1 ((_ sign_extend 32) (size!709 (buf!1030 (_2!1496 lt!35321)))) ((_ sign_extend 32) (currentByte!2343 (_2!1496 lt!35321))) ((_ sign_extend 32) (currentBit!2338 (_2!1496 lt!35321))) lt!35329)))

(assert (=> b!24842 (= lt!35329 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35317 () Unit!2061)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1250 BitStream!1250 (_ BitVec 64) (_ BitVec 64)) Unit!2061)

(assert (=> b!24842 (= lt!35317 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1496 lt!35321) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1647)

(declare-fun appendBitFromByte!0 (BitStream!1250 (_ BitVec 8) (_ BitVec 32)) tuple2!2818)

(assert (=> b!24842 (= lt!35321 (appendBitFromByte!0 thiss!1379 (select (arr!1165 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24843 () Bool)

(declare-fun res!21469 () Bool)

(assert (=> b!24843 (=> res!21469 e!16968)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24843 (= res!21469 (not (invariant!0 (currentBit!2338 (_2!1496 lt!35321)) (currentByte!2343 (_2!1496 lt!35321)) (size!709 (buf!1030 (_2!1496 lt!35321))))))))

(declare-fun b!24844 () Bool)

(declare-fun e!16976 () Bool)

(assert (=> b!24844 (= e!16976 (not e!16974))))

(declare-fun res!21471 () Bool)

(assert (=> b!24844 (=> res!21471 e!16974)))

(assert (=> b!24844 (= res!21471 (bvsge i!635 to!314))))

(assert (=> b!24844 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!35327 () Unit!2061)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1250) Unit!2061)

(assert (=> b!24844 (= lt!35327 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24844 (= lt!35319 (bitIndex!0 (size!709 (buf!1030 thiss!1379)) (currentByte!2343 thiss!1379) (currentBit!2338 thiss!1379)))))

(declare-fun res!21474 () Bool)

(assert (=> start!5724 (=> (not res!21474) (not e!16976))))

(assert (=> start!5724 (= res!21474 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!709 srcBuffer!2))))))))

(assert (=> start!5724 e!16976))

(assert (=> start!5724 true))

(declare-fun array_inv!678 (array!1647) Bool)

(assert (=> start!5724 (array_inv!678 srcBuffer!2)))

(declare-fun e!16978 () Bool)

(declare-fun inv!12 (BitStream!1250) Bool)

(assert (=> start!5724 (and (inv!12 thiss!1379) e!16978)))

(declare-fun b!24845 () Bool)

(assert (=> b!24845 (= e!16971 e!16968)))

(declare-fun res!21466 () Bool)

(assert (=> b!24845 (=> res!21466 e!16968)))

(assert (=> b!24845 (= res!21466 (not (= (size!709 (buf!1030 (_2!1496 lt!35321))) (size!709 (buf!1030 (_2!1496 lt!35318))))))))

(declare-fun e!16977 () Bool)

(assert (=> b!24845 e!16977))

(declare-fun res!21463 () Bool)

(assert (=> b!24845 (=> (not res!21463) (not e!16977))))

(assert (=> b!24845 (= res!21463 (= (size!709 (buf!1030 (_2!1496 lt!35318))) (size!709 (buf!1030 thiss!1379))))))

(declare-fun lt!35326 () tuple2!2820)

(declare-fun b!24846 () Bool)

(declare-fun e!16973 () Bool)

(declare-datatypes ((List!326 0))(
  ( (Nil!323) (Cons!322 (h!441 Bool) (t!1076 List!326)) )
))
(declare-fun head!163 (List!326) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1250 array!1647 (_ BitVec 64) (_ BitVec 64)) List!326)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1250 BitStream!1250 (_ BitVec 64)) List!326)

(assert (=> b!24846 (= e!16973 (= (head!163 (byteArrayBitContentToList!0 (_2!1496 lt!35321) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!163 (bitStreamReadBitsIntoList!0 (_2!1496 lt!35321) (_1!1497 lt!35326) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24847 () Bool)

(assert (=> b!24847 (= e!16977 (= lt!35328 (bvsub (bvsub (bvadd (bitIndex!0 (size!709 (buf!1030 (_2!1496 lt!35321))) (currentByte!2343 (_2!1496 lt!35321)) (currentBit!2338 (_2!1496 lt!35321))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24848 () Bool)

(declare-fun res!21462 () Bool)

(assert (=> b!24848 (=> res!21462 e!16971)))

(assert (=> b!24848 (= res!21462 (not (invariant!0 (currentBit!2338 (_2!1496 lt!35318)) (currentByte!2343 (_2!1496 lt!35318)) (size!709 (buf!1030 (_2!1496 lt!35318))))))))

(declare-fun b!24849 () Bool)

(assert (=> b!24849 (= e!16975 e!16969)))

(declare-fun res!21470 () Bool)

(assert (=> b!24849 (=> res!21470 e!16969)))

(assert (=> b!24849 (= res!21470 (not (isPrefixOf!0 (_2!1496 lt!35321) (_2!1496 lt!35318))))))

(assert (=> b!24849 (isPrefixOf!0 thiss!1379 (_2!1496 lt!35318))))

(declare-fun lt!35322 () Unit!2061)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1250 BitStream!1250 BitStream!1250) Unit!2061)

(assert (=> b!24849 (= lt!35322 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1496 lt!35321) (_2!1496 lt!35318)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1250 array!1647 (_ BitVec 64) (_ BitVec 64)) tuple2!2818)

(assert (=> b!24849 (= lt!35318 (appendBitsMSBFirstLoop!0 (_2!1496 lt!35321) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24849 e!16973))

(declare-fun res!21472 () Bool)

(assert (=> b!24849 (=> (not res!21472) (not e!16973))))

(assert (=> b!24849 (= res!21472 (validate_offset_bits!1 ((_ sign_extend 32) (size!709 (buf!1030 (_2!1496 lt!35321)))) ((_ sign_extend 32) (currentByte!2343 thiss!1379)) ((_ sign_extend 32) (currentBit!2338 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!35316 () Unit!2061)

(assert (=> b!24849 (= lt!35316 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1030 (_2!1496 lt!35321)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24849 (= lt!35326 (reader!0 thiss!1379 (_2!1496 lt!35321)))))

(declare-fun b!24850 () Bool)

(assert (=> b!24850 (= e!16978 (array_inv!678 (buf!1030 thiss!1379)))))

(declare-fun b!24851 () Bool)

(declare-fun res!21468 () Bool)

(assert (=> b!24851 (=> res!21468 e!16971)))

(assert (=> b!24851 (= res!21468 (not (= (size!709 (buf!1030 thiss!1379)) (size!709 (buf!1030 (_2!1496 lt!35318))))))))

(declare-fun b!24852 () Bool)

(declare-fun res!21473 () Bool)

(assert (=> b!24852 (=> (not res!21473) (not e!16976))))

(assert (=> b!24852 (= res!21473 (validate_offset_bits!1 ((_ sign_extend 32) (size!709 (buf!1030 thiss!1379))) ((_ sign_extend 32) (currentByte!2343 thiss!1379)) ((_ sign_extend 32) (currentBit!2338 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24853 () Bool)

(declare-fun res!21467 () Bool)

(assert (=> b!24853 (=> res!21467 e!16968)))

(assert (=> b!24853 (= res!21467 (not (invariant!0 (currentBit!2338 (_2!1496 lt!35321)) (currentByte!2343 (_2!1496 lt!35321)) (size!709 (buf!1030 (_2!1496 lt!35318))))))))

(assert (= (and start!5724 res!21474) b!24852))

(assert (= (and b!24852 res!21473) b!24844))

(assert (= (and b!24844 (not res!21471)) b!24842))

(assert (= (and b!24842 (not res!21465)) b!24849))

(assert (= (and b!24849 res!21472) b!24846))

(assert (= (and b!24849 (not res!21470)) b!24840))

(assert (= (and b!24840 (not res!21464)) b!24848))

(assert (= (and b!24848 (not res!21462)) b!24851))

(assert (= (and b!24851 (not res!21468)) b!24845))

(assert (= (and b!24845 res!21463) b!24847))

(assert (= (and b!24845 (not res!21466)) b!24843))

(assert (= (and b!24843 (not res!21469)) b!24853))

(assert (= (and b!24853 (not res!21467)) b!24841))

(assert (= start!5724 b!24850))

(declare-fun m!35161 () Bool)

(assert (=> b!24843 m!35161))

(declare-fun m!35163 () Bool)

(assert (=> start!5724 m!35163))

(declare-fun m!35165 () Bool)

(assert (=> start!5724 m!35165))

(declare-fun m!35167 () Bool)

(assert (=> b!24842 m!35167))

(declare-fun m!35169 () Bool)

(assert (=> b!24842 m!35169))

(declare-fun m!35171 () Bool)

(assert (=> b!24842 m!35171))

(assert (=> b!24842 m!35167))

(declare-fun m!35173 () Bool)

(assert (=> b!24842 m!35173))

(declare-fun m!35175 () Bool)

(assert (=> b!24842 m!35175))

(declare-fun m!35177 () Bool)

(assert (=> b!24847 m!35177))

(declare-fun m!35179 () Bool)

(assert (=> b!24840 m!35179))

(declare-fun m!35181 () Bool)

(assert (=> b!24849 m!35181))

(declare-fun m!35183 () Bool)

(assert (=> b!24849 m!35183))

(declare-fun m!35185 () Bool)

(assert (=> b!24849 m!35185))

(declare-fun m!35187 () Bool)

(assert (=> b!24849 m!35187))

(declare-fun m!35189 () Bool)

(assert (=> b!24849 m!35189))

(declare-fun m!35191 () Bool)

(assert (=> b!24849 m!35191))

(declare-fun m!35193 () Bool)

(assert (=> b!24849 m!35193))

(declare-fun m!35195 () Bool)

(assert (=> b!24852 m!35195))

(declare-fun m!35197 () Bool)

(assert (=> b!24846 m!35197))

(assert (=> b!24846 m!35197))

(declare-fun m!35199 () Bool)

(assert (=> b!24846 m!35199))

(declare-fun m!35201 () Bool)

(assert (=> b!24846 m!35201))

(assert (=> b!24846 m!35201))

(declare-fun m!35203 () Bool)

(assert (=> b!24846 m!35203))

(declare-fun m!35205 () Bool)

(assert (=> b!24853 m!35205))

(declare-fun m!35207 () Bool)

(assert (=> b!24841 m!35207))

(declare-fun m!35209 () Bool)

(assert (=> b!24841 m!35209))

(declare-fun m!35211 () Bool)

(assert (=> b!24841 m!35211))

(declare-fun m!35213 () Bool)

(assert (=> b!24841 m!35213))

(declare-fun m!35215 () Bool)

(assert (=> b!24841 m!35215))

(declare-fun m!35217 () Bool)

(assert (=> b!24841 m!35217))

(declare-fun m!35219 () Bool)

(assert (=> b!24850 m!35219))

(declare-fun m!35221 () Bool)

(assert (=> b!24848 m!35221))

(declare-fun m!35223 () Bool)

(assert (=> b!24844 m!35223))

(declare-fun m!35225 () Bool)

(assert (=> b!24844 m!35225))

(declare-fun m!35227 () Bool)

(assert (=> b!24844 m!35227))

(push 1)

(assert (not b!24850))

(assert (not b!24843))

(assert (not start!5724))

(assert (not b!24848))

(assert (not b!24841))

(assert (not b!24840))

(assert (not b!24852))

(assert (not b!24847))

(assert (not b!24853))

(assert (not b!24849))

(assert (not b!24842))

(assert (not b!24846))

(assert (not b!24844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

