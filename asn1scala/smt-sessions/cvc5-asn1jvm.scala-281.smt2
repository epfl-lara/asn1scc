; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5666 () Bool)

(assert start!5666)

(declare-fun b!23622 () Bool)

(declare-fun res!20332 () Bool)

(declare-fun e!16017 () Bool)

(assert (=> b!23622 (=> res!20332 e!16017)))

(declare-datatypes ((array!1589 0))(
  ( (array!1590 (arr!1136 (Array (_ BitVec 32) (_ BitVec 8))) (size!680 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1192 0))(
  ( (BitStream!1193 (buf!1001 array!1589) (currentByte!2314 (_ BitVec 32)) (currentBit!2309 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2003 0))(
  ( (Unit!2004) )
))
(declare-datatypes ((tuple2!2702 0))(
  ( (tuple2!2703 (_1!1438 Unit!2003) (_2!1438 BitStream!1192)) )
))
(declare-fun lt!34136 () tuple2!2702)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23622 (= res!20332 (not (invariant!0 (currentBit!2309 (_2!1438 lt!34136)) (currentByte!2314 (_2!1438 lt!34136)) (size!680 (buf!1001 (_2!1438 lt!34136))))))))

(declare-fun b!23623 () Bool)

(declare-fun e!16013 () Bool)

(declare-fun e!16018 () Bool)

(assert (=> b!23623 (= e!16013 e!16018)))

(declare-fun res!20334 () Bool)

(assert (=> b!23623 (=> res!20334 e!16018)))

(declare-fun lt!34140 () tuple2!2702)

(declare-fun isPrefixOf!0 (BitStream!1192 BitStream!1192) Bool)

(assert (=> b!23623 (= res!20334 (not (isPrefixOf!0 (_2!1438 lt!34140) (_2!1438 lt!34136))))))

(declare-fun thiss!1379 () BitStream!1192)

(assert (=> b!23623 (isPrefixOf!0 thiss!1379 (_2!1438 lt!34136))))

(declare-fun lt!34131 () Unit!2003)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1192 BitStream!1192 BitStream!1192) Unit!2003)

(assert (=> b!23623 (= lt!34131 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1438 lt!34140) (_2!1438 lt!34136)))))

(declare-fun srcBuffer!2 () array!1589)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1192 array!1589 (_ BitVec 64) (_ BitVec 64)) tuple2!2702)

(assert (=> b!23623 (= lt!34136 (appendBitsMSBFirstLoop!0 (_2!1438 lt!34140) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16016 () Bool)

(assert (=> b!23623 e!16016))

(declare-fun res!20335 () Bool)

(assert (=> b!23623 (=> (not res!20335) (not e!16016))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23623 (= res!20335 (validate_offset_bits!1 ((_ sign_extend 32) (size!680 (buf!1001 (_2!1438 lt!34140)))) ((_ sign_extend 32) (currentByte!2314 thiss!1379)) ((_ sign_extend 32) (currentBit!2309 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34130 () Unit!2003)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1192 array!1589 (_ BitVec 64)) Unit!2003)

(assert (=> b!23623 (= lt!34130 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1001 (_2!1438 lt!34140)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2704 0))(
  ( (tuple2!2705 (_1!1439 BitStream!1192) (_2!1439 BitStream!1192)) )
))
(declare-fun lt!34134 () tuple2!2704)

(declare-fun reader!0 (BitStream!1192 BitStream!1192) tuple2!2704)

(assert (=> b!23623 (= lt!34134 (reader!0 thiss!1379 (_2!1438 lt!34140)))))

(declare-fun b!23624 () Bool)

(assert (=> b!23624 (= e!16018 e!16017)))

(declare-fun res!20333 () Bool)

(assert (=> b!23624 (=> res!20333 e!16017)))

(declare-fun lt!34133 () (_ BitVec 64))

(declare-fun lt!34138 () (_ BitVec 64))

(assert (=> b!23624 (= res!20333 (not (= lt!34138 (bvsub (bvadd lt!34133 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23624 (= lt!34138 (bitIndex!0 (size!680 (buf!1001 (_2!1438 lt!34136))) (currentByte!2314 (_2!1438 lt!34136)) (currentBit!2309 (_2!1438 lt!34136))))))

(declare-fun b!23625 () Bool)

(declare-fun e!16019 () Bool)

(assert (=> b!23625 (= e!16019 true)))

(declare-fun lt!34139 () tuple2!2704)

(assert (=> b!23625 (= lt!34139 (reader!0 (_2!1438 lt!34140) (_2!1438 lt!34136)))))

(assert (=> b!23625 (validate_offset_bits!1 ((_ sign_extend 32) (size!680 (buf!1001 (_2!1438 lt!34136)))) ((_ sign_extend 32) (currentByte!2314 thiss!1379)) ((_ sign_extend 32) (currentBit!2309 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34135 () Unit!2003)

(assert (=> b!23625 (= lt!34135 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1001 (_2!1438 lt!34136)) (bvsub to!314 i!635)))))

(declare-fun lt!34141 () tuple2!2704)

(assert (=> b!23625 (= lt!34141 (reader!0 thiss!1379 (_2!1438 lt!34136)))))

(declare-fun b!23626 () Bool)

(assert (=> b!23626 (= e!16017 e!16019)))

(declare-fun res!20331 () Bool)

(assert (=> b!23626 (=> res!20331 e!16019)))

(assert (=> b!23626 (= res!20331 (not (= (size!680 (buf!1001 (_2!1438 lt!34140))) (size!680 (buf!1001 (_2!1438 lt!34136))))))))

(declare-fun e!16014 () Bool)

(assert (=> b!23626 e!16014))

(declare-fun res!20338 () Bool)

(assert (=> b!23626 (=> (not res!20338) (not e!16014))))

(assert (=> b!23626 (= res!20338 (= (size!680 (buf!1001 (_2!1438 lt!34136))) (size!680 (buf!1001 thiss!1379))))))

(declare-fun b!23627 () Bool)

(declare-datatypes ((List!297 0))(
  ( (Nil!294) (Cons!293 (h!412 Bool) (t!1047 List!297)) )
))
(declare-fun head!134 (List!297) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1192 array!1589 (_ BitVec 64) (_ BitVec 64)) List!297)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1192 BitStream!1192 (_ BitVec 64)) List!297)

(assert (=> b!23627 (= e!16016 (= (head!134 (byteArrayBitContentToList!0 (_2!1438 lt!34140) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!134 (bitStreamReadBitsIntoList!0 (_2!1438 lt!34140) (_1!1439 lt!34134) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!20342 () Bool)

(declare-fun e!16021 () Bool)

(assert (=> start!5666 (=> (not res!20342) (not e!16021))))

(assert (=> start!5666 (= res!20342 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!680 srcBuffer!2))))))))

(assert (=> start!5666 e!16021))

(assert (=> start!5666 true))

(declare-fun array_inv!649 (array!1589) Bool)

(assert (=> start!5666 (array_inv!649 srcBuffer!2)))

(declare-fun e!16020 () Bool)

(declare-fun inv!12 (BitStream!1192) Bool)

(assert (=> start!5666 (and (inv!12 thiss!1379) e!16020)))

(declare-fun b!23628 () Bool)

(declare-fun res!20343 () Bool)

(assert (=> b!23628 (=> (not res!20343) (not e!16021))))

(assert (=> b!23628 (= res!20343 (validate_offset_bits!1 ((_ sign_extend 32) (size!680 (buf!1001 thiss!1379))) ((_ sign_extend 32) (currentByte!2314 thiss!1379)) ((_ sign_extend 32) (currentBit!2309 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23629 () Bool)

(declare-fun e!16012 () Bool)

(assert (=> b!23629 (= e!16012 e!16013)))

(declare-fun res!20339 () Bool)

(assert (=> b!23629 (=> res!20339 e!16013)))

(assert (=> b!23629 (= res!20339 (not (isPrefixOf!0 thiss!1379 (_2!1438 lt!34140))))))

(assert (=> b!23629 (validate_offset_bits!1 ((_ sign_extend 32) (size!680 (buf!1001 (_2!1438 lt!34140)))) ((_ sign_extend 32) (currentByte!2314 (_2!1438 lt!34140))) ((_ sign_extend 32) (currentBit!2309 (_2!1438 lt!34140))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34132 () Unit!2003)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1192 BitStream!1192 (_ BitVec 64) (_ BitVec 64)) Unit!2003)

(assert (=> b!23629 (= lt!34132 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1438 lt!34140) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1192 (_ BitVec 8) (_ BitVec 32)) tuple2!2702)

(assert (=> b!23629 (= lt!34140 (appendBitFromByte!0 thiss!1379 (select (arr!1136 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23630 () Bool)

(declare-fun res!20336 () Bool)

(assert (=> b!23630 (=> res!20336 e!16019)))

(assert (=> b!23630 (= res!20336 (not (invariant!0 (currentBit!2309 (_2!1438 lt!34140)) (currentByte!2314 (_2!1438 lt!34140)) (size!680 (buf!1001 (_2!1438 lt!34136))))))))

(declare-fun b!23631 () Bool)

(assert (=> b!23631 (= e!16020 (array_inv!649 (buf!1001 thiss!1379)))))

(declare-fun b!23632 () Bool)

(assert (=> b!23632 (= e!16014 (= lt!34138 (bvsub (bvsub (bvadd (bitIndex!0 (size!680 (buf!1001 (_2!1438 lt!34140))) (currentByte!2314 (_2!1438 lt!34140)) (currentBit!2309 (_2!1438 lt!34140))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23633 () Bool)

(declare-fun res!20340 () Bool)

(assert (=> b!23633 (=> res!20340 e!16017)))

(assert (=> b!23633 (= res!20340 (not (= (size!680 (buf!1001 thiss!1379)) (size!680 (buf!1001 (_2!1438 lt!34136))))))))

(declare-fun b!23634 () Bool)

(declare-fun res!20337 () Bool)

(assert (=> b!23634 (=> res!20337 e!16019)))

(assert (=> b!23634 (= res!20337 (not (invariant!0 (currentBit!2309 (_2!1438 lt!34140)) (currentByte!2314 (_2!1438 lt!34140)) (size!680 (buf!1001 (_2!1438 lt!34140))))))))

(declare-fun b!23635 () Bool)

(assert (=> b!23635 (= e!16021 (not e!16012))))

(declare-fun res!20341 () Bool)

(assert (=> b!23635 (=> res!20341 e!16012)))

(assert (=> b!23635 (= res!20341 (bvsge i!635 to!314))))

(assert (=> b!23635 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34137 () Unit!2003)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1192) Unit!2003)

(assert (=> b!23635 (= lt!34137 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23635 (= lt!34133 (bitIndex!0 (size!680 (buf!1001 thiss!1379)) (currentByte!2314 thiss!1379) (currentBit!2309 thiss!1379)))))

(assert (= (and start!5666 res!20342) b!23628))

(assert (= (and b!23628 res!20343) b!23635))

(assert (= (and b!23635 (not res!20341)) b!23629))

(assert (= (and b!23629 (not res!20339)) b!23623))

(assert (= (and b!23623 res!20335) b!23627))

(assert (= (and b!23623 (not res!20334)) b!23624))

(assert (= (and b!23624 (not res!20333)) b!23622))

(assert (= (and b!23622 (not res!20332)) b!23633))

(assert (= (and b!23633 (not res!20340)) b!23626))

(assert (= (and b!23626 res!20338) b!23632))

(assert (= (and b!23626 (not res!20331)) b!23634))

(assert (= (and b!23634 (not res!20337)) b!23630))

(assert (= (and b!23630 (not res!20336)) b!23625))

(assert (= start!5666 b!23631))

(declare-fun m!33213 () Bool)

(assert (=> start!5666 m!33213))

(declare-fun m!33215 () Bool)

(assert (=> start!5666 m!33215))

(declare-fun m!33217 () Bool)

(assert (=> b!23627 m!33217))

(assert (=> b!23627 m!33217))

(declare-fun m!33219 () Bool)

(assert (=> b!23627 m!33219))

(declare-fun m!33221 () Bool)

(assert (=> b!23627 m!33221))

(assert (=> b!23627 m!33221))

(declare-fun m!33223 () Bool)

(assert (=> b!23627 m!33223))

(declare-fun m!33225 () Bool)

(assert (=> b!23628 m!33225))

(declare-fun m!33227 () Bool)

(assert (=> b!23622 m!33227))

(declare-fun m!33229 () Bool)

(assert (=> b!23630 m!33229))

(declare-fun m!33231 () Bool)

(assert (=> b!23635 m!33231))

(declare-fun m!33233 () Bool)

(assert (=> b!23635 m!33233))

(declare-fun m!33235 () Bool)

(assert (=> b!23635 m!33235))

(declare-fun m!33237 () Bool)

(assert (=> b!23624 m!33237))

(declare-fun m!33239 () Bool)

(assert (=> b!23632 m!33239))

(declare-fun m!33241 () Bool)

(assert (=> b!23631 m!33241))

(declare-fun m!33243 () Bool)

(assert (=> b!23629 m!33243))

(declare-fun m!33245 () Bool)

(assert (=> b!23629 m!33245))

(declare-fun m!33247 () Bool)

(assert (=> b!23629 m!33247))

(assert (=> b!23629 m!33245))

(declare-fun m!33249 () Bool)

(assert (=> b!23629 m!33249))

(declare-fun m!33251 () Bool)

(assert (=> b!23629 m!33251))

(declare-fun m!33253 () Bool)

(assert (=> b!23625 m!33253))

(declare-fun m!33255 () Bool)

(assert (=> b!23625 m!33255))

(declare-fun m!33257 () Bool)

(assert (=> b!23625 m!33257))

(declare-fun m!33259 () Bool)

(assert (=> b!23625 m!33259))

(declare-fun m!33261 () Bool)

(assert (=> b!23623 m!33261))

(declare-fun m!33263 () Bool)

(assert (=> b!23623 m!33263))

(declare-fun m!33265 () Bool)

(assert (=> b!23623 m!33265))

(declare-fun m!33267 () Bool)

(assert (=> b!23623 m!33267))

(declare-fun m!33269 () Bool)

(assert (=> b!23623 m!33269))

(declare-fun m!33271 () Bool)

(assert (=> b!23623 m!33271))

(declare-fun m!33273 () Bool)

(assert (=> b!23623 m!33273))

(declare-fun m!33275 () Bool)

(assert (=> b!23634 m!33275))

(push 1)

