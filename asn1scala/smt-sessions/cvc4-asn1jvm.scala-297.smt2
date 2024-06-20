; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5958 () Bool)

(assert start!5958)

(declare-fun b!26628 () Bool)

(declare-fun res!22975 () Bool)

(declare-fun e!18055 () Bool)

(assert (=> b!26628 (=> (not res!22975) (not e!18055))))

(declare-datatypes ((array!1695 0))(
  ( (array!1696 (arr!1192 (Array (_ BitVec 32) (_ BitVec 8))) (size!730 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1292 0))(
  ( (BitStream!1293 (buf!1057 array!1695) (currentByte!2382 (_ BitVec 32)) (currentBit!2377 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1292)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!26628 (= res!22975 (validate_offset_bits!1 ((_ sign_extend 32) (size!730 (buf!1057 thiss!1379))) ((_ sign_extend 32) (currentByte!2382 thiss!1379)) ((_ sign_extend 32) (currentBit!2377 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!26629 () Bool)

(declare-fun res!22966 () Bool)

(declare-fun e!18059 () Bool)

(assert (=> b!26629 (=> res!22966 e!18059)))

(declare-datatypes ((Unit!2163 0))(
  ( (Unit!2164) )
))
(declare-datatypes ((tuple2!2950 0))(
  ( (tuple2!2951 (_1!1562 Unit!2163) (_2!1562 BitStream!1292)) )
))
(declare-fun lt!38259 () tuple2!2950)

(declare-fun lt!38260 () tuple2!2950)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!26629 (= res!22966 (not (invariant!0 (currentBit!2377 (_2!1562 lt!38259)) (currentByte!2382 (_2!1562 lt!38259)) (size!730 (buf!1057 (_2!1562 lt!38260))))))))

(declare-fun b!26630 () Bool)

(declare-fun e!18062 () Bool)

(declare-fun e!18064 () Bool)

(assert (=> b!26630 (= e!18062 e!18064)))

(declare-fun res!22982 () Bool)

(assert (=> b!26630 (=> res!22982 e!18064)))

(declare-fun isPrefixOf!0 (BitStream!1292 BitStream!1292) Bool)

(assert (=> b!26630 (= res!22982 (not (isPrefixOf!0 thiss!1379 (_2!1562 lt!38259))))))

(declare-fun lt!38263 () (_ BitVec 64))

(assert (=> b!26630 (validate_offset_bits!1 ((_ sign_extend 32) (size!730 (buf!1057 (_2!1562 lt!38259)))) ((_ sign_extend 32) (currentByte!2382 (_2!1562 lt!38259))) ((_ sign_extend 32) (currentBit!2377 (_2!1562 lt!38259))) lt!38263)))

(assert (=> b!26630 (= lt!38263 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38270 () Unit!2163)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1292 BitStream!1292 (_ BitVec 64) (_ BitVec 64)) Unit!2163)

(assert (=> b!26630 (= lt!38270 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1562 lt!38259) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1695)

(declare-fun appendBitFromByte!0 (BitStream!1292 (_ BitVec 8) (_ BitVec 32)) tuple2!2950)

(assert (=> b!26630 (= lt!38259 (appendBitFromByte!0 thiss!1379 (select (arr!1192 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!2952 0))(
  ( (tuple2!2953 (_1!1563 BitStream!1292) (_2!1563 BitStream!1292)) )
))
(declare-fun lt!38256 () tuple2!2952)

(declare-fun e!18056 () Bool)

(declare-fun b!26631 () Bool)

(declare-datatypes ((List!347 0))(
  ( (Nil!344) (Cons!343 (h!462 Bool) (t!1097 List!347)) )
))
(declare-fun head!184 (List!347) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1292 array!1695 (_ BitVec 64) (_ BitVec 64)) List!347)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1292 BitStream!1292 (_ BitVec 64)) List!347)

(assert (=> b!26631 (= e!18056 (= (head!184 (byteArrayBitContentToList!0 (_2!1562 lt!38259) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!184 (bitStreamReadBitsIntoList!0 (_2!1562 lt!38259) (_1!1563 lt!38256) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!26632 () Bool)

(assert (=> b!26632 (= e!18055 (not e!18062))))

(declare-fun res!22980 () Bool)

(assert (=> b!26632 (=> res!22980 e!18062)))

(assert (=> b!26632 (= res!22980 (bvsge i!635 to!314))))

(assert (=> b!26632 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!38269 () Unit!2163)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1292) Unit!2163)

(assert (=> b!26632 (= lt!38269 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!38272 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!26632 (= lt!38272 (bitIndex!0 (size!730 (buf!1057 thiss!1379)) (currentByte!2382 thiss!1379) (currentBit!2377 thiss!1379)))))

(declare-fun b!26633 () Bool)

(declare-fun res!22977 () Bool)

(declare-fun e!18063 () Bool)

(assert (=> b!26633 (=> res!22977 e!18063)))

(assert (=> b!26633 (= res!22977 (not (= (size!730 (buf!1057 thiss!1379)) (size!730 (buf!1057 (_2!1562 lt!38260))))))))

(declare-fun b!26634 () Bool)

(declare-fun e!18061 () Bool)

(assert (=> b!26634 (= e!18059 e!18061)))

(declare-fun res!22969 () Bool)

(assert (=> b!26634 (=> res!22969 e!18061)))

(assert (=> b!26634 (= res!22969 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!38266 () List!347)

(declare-fun lt!38267 () tuple2!2952)

(assert (=> b!26634 (= lt!38266 (bitStreamReadBitsIntoList!0 (_2!1562 lt!38260) (_1!1563 lt!38267) lt!38263))))

(declare-fun lt!38255 () List!347)

(declare-fun lt!38264 () tuple2!2952)

(assert (=> b!26634 (= lt!38255 (bitStreamReadBitsIntoList!0 (_2!1562 lt!38260) (_1!1563 lt!38264) (bvsub to!314 i!635)))))

(assert (=> b!26634 (validate_offset_bits!1 ((_ sign_extend 32) (size!730 (buf!1057 (_2!1562 lt!38260)))) ((_ sign_extend 32) (currentByte!2382 (_2!1562 lt!38259))) ((_ sign_extend 32) (currentBit!2377 (_2!1562 lt!38259))) lt!38263)))

(declare-fun lt!38258 () Unit!2163)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1292 array!1695 (_ BitVec 64)) Unit!2163)

(assert (=> b!26634 (= lt!38258 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1562 lt!38259) (buf!1057 (_2!1562 lt!38260)) lt!38263))))

(declare-fun reader!0 (BitStream!1292 BitStream!1292) tuple2!2952)

(assert (=> b!26634 (= lt!38267 (reader!0 (_2!1562 lt!38259) (_2!1562 lt!38260)))))

(assert (=> b!26634 (validate_offset_bits!1 ((_ sign_extend 32) (size!730 (buf!1057 (_2!1562 lt!38260)))) ((_ sign_extend 32) (currentByte!2382 thiss!1379)) ((_ sign_extend 32) (currentBit!2377 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!38257 () Unit!2163)

(assert (=> b!26634 (= lt!38257 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1057 (_2!1562 lt!38260)) (bvsub to!314 i!635)))))

(assert (=> b!26634 (= lt!38264 (reader!0 thiss!1379 (_2!1562 lt!38260)))))

(declare-fun b!26635 () Bool)

(declare-fun e!18060 () Bool)

(assert (=> b!26635 (= e!18064 e!18060)))

(declare-fun res!22970 () Bool)

(assert (=> b!26635 (=> res!22970 e!18060)))

(assert (=> b!26635 (= res!22970 (not (isPrefixOf!0 (_2!1562 lt!38259) (_2!1562 lt!38260))))))

(assert (=> b!26635 (isPrefixOf!0 thiss!1379 (_2!1562 lt!38260))))

(declare-fun lt!38262 () Unit!2163)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1292 BitStream!1292 BitStream!1292) Unit!2163)

(assert (=> b!26635 (= lt!38262 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1562 lt!38259) (_2!1562 lt!38260)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1292 array!1695 (_ BitVec 64) (_ BitVec 64)) tuple2!2950)

(assert (=> b!26635 (= lt!38260 (appendBitsMSBFirstLoop!0 (_2!1562 lt!38259) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!26635 e!18056))

(declare-fun res!22978 () Bool)

(assert (=> b!26635 (=> (not res!22978) (not e!18056))))

(assert (=> b!26635 (= res!22978 (validate_offset_bits!1 ((_ sign_extend 32) (size!730 (buf!1057 (_2!1562 lt!38259)))) ((_ sign_extend 32) (currentByte!2382 thiss!1379)) ((_ sign_extend 32) (currentBit!2377 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!38268 () Unit!2163)

(assert (=> b!26635 (= lt!38268 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1057 (_2!1562 lt!38259)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!26635 (= lt!38256 (reader!0 thiss!1379 (_2!1562 lt!38259)))))

(declare-fun b!26637 () Bool)

(declare-fun res!22973 () Bool)

(assert (=> b!26637 (=> res!22973 e!18061)))

(assert (=> b!26637 (= res!22973 (not (isPrefixOf!0 (_1!1563 lt!38264) (_1!1563 lt!38267))))))

(declare-fun b!26638 () Bool)

(declare-fun res!22983 () Bool)

(assert (=> b!26638 (=> res!22983 e!18063)))

(assert (=> b!26638 (= res!22983 (not (invariant!0 (currentBit!2377 (_2!1562 lt!38260)) (currentByte!2382 (_2!1562 lt!38260)) (size!730 (buf!1057 (_2!1562 lt!38260))))))))

(declare-fun b!26639 () Bool)

(declare-fun res!22974 () Bool)

(assert (=> b!26639 (=> res!22974 e!18061)))

(declare-fun lt!38261 () (_ BitVec 64))

(assert (=> b!26639 (= res!22974 (or (not (= (buf!1057 (_1!1563 lt!38264)) (buf!1057 (_1!1563 lt!38267)))) (not (= (buf!1057 (_1!1563 lt!38264)) (buf!1057 (_2!1562 lt!38260)))) (bvsge lt!38261 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!26640 () Bool)

(declare-fun res!22972 () Bool)

(assert (=> b!26640 (=> res!22972 e!18061)))

(declare-fun length!73 (List!347) Int)

(assert (=> b!26640 (= res!22972 (<= (length!73 lt!38255) 0))))

(declare-fun b!26641 () Bool)

(assert (=> b!26641 (= e!18063 e!18059)))

(declare-fun res!22979 () Bool)

(assert (=> b!26641 (=> res!22979 e!18059)))

(assert (=> b!26641 (= res!22979 (not (= (size!730 (buf!1057 (_2!1562 lt!38259))) (size!730 (buf!1057 (_2!1562 lt!38260))))))))

(declare-fun e!18057 () Bool)

(assert (=> b!26641 e!18057))

(declare-fun res!22981 () Bool)

(assert (=> b!26641 (=> (not res!22981) (not e!18057))))

(assert (=> b!26641 (= res!22981 (= (size!730 (buf!1057 (_2!1562 lt!38260))) (size!730 (buf!1057 thiss!1379))))))

(declare-fun b!26642 () Bool)

(assert (=> b!26642 (= e!18057 (= lt!38261 (bvsub (bvsub (bvadd (bitIndex!0 (size!730 (buf!1057 (_2!1562 lt!38259))) (currentByte!2382 (_2!1562 lt!38259)) (currentBit!2377 (_2!1562 lt!38259))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!26643 () Bool)

(declare-fun res!22968 () Bool)

(assert (=> b!26643 (=> res!22968 e!18061)))

(assert (=> b!26643 (= res!22968 (not (isPrefixOf!0 (_1!1563 lt!38267) (_2!1562 lt!38260))))))

(declare-fun b!26644 () Bool)

(declare-fun res!22965 () Bool)

(assert (=> b!26644 (=> res!22965 e!18061)))

(assert (=> b!26644 (= res!22965 (not (isPrefixOf!0 (_1!1563 lt!38264) (_2!1562 lt!38260))))))

(declare-fun b!26645 () Bool)

(declare-fun e!18053 () Bool)

(declare-fun array_inv!699 (array!1695) Bool)

(assert (=> b!26645 (= e!18053 (array_inv!699 (buf!1057 thiss!1379)))))

(declare-fun b!26646 () Bool)

(assert (=> b!26646 (= e!18060 e!18063)))

(declare-fun res!22967 () Bool)

(assert (=> b!26646 (=> res!22967 e!18063)))

(assert (=> b!26646 (= res!22967 (not (= lt!38261 (bvsub (bvadd lt!38272 to!314) i!635))))))

(assert (=> b!26646 (= lt!38261 (bitIndex!0 (size!730 (buf!1057 (_2!1562 lt!38260))) (currentByte!2382 (_2!1562 lt!38260)) (currentBit!2377 (_2!1562 lt!38260))))))

(declare-fun b!26647 () Bool)

(assert (=> b!26647 (= e!18061 true)))

(declare-fun lt!38265 () (_ BitVec 64))

(assert (=> b!26647 (= lt!38265 (bitIndex!0 (size!730 (buf!1057 (_1!1563 lt!38267))) (currentByte!2382 (_1!1563 lt!38267)) (currentBit!2377 (_1!1563 lt!38267))))))

(declare-fun lt!38271 () (_ BitVec 64))

(assert (=> b!26647 (= lt!38271 (bitIndex!0 (size!730 (buf!1057 (_1!1563 lt!38264))) (currentByte!2382 (_1!1563 lt!38264)) (currentBit!2377 (_1!1563 lt!38264))))))

(declare-fun res!22971 () Bool)

(assert (=> start!5958 (=> (not res!22971) (not e!18055))))

(assert (=> start!5958 (= res!22971 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!730 srcBuffer!2))))))))

(assert (=> start!5958 e!18055))

(assert (=> start!5958 true))

(assert (=> start!5958 (array_inv!699 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1292) Bool)

(assert (=> start!5958 (and (inv!12 thiss!1379) e!18053)))

(declare-fun b!26636 () Bool)

(declare-fun res!22976 () Bool)

(assert (=> b!26636 (=> res!22976 e!18059)))

(assert (=> b!26636 (= res!22976 (not (invariant!0 (currentBit!2377 (_2!1562 lt!38259)) (currentByte!2382 (_2!1562 lt!38259)) (size!730 (buf!1057 (_2!1562 lt!38259))))))))

(assert (= (and start!5958 res!22971) b!26628))

(assert (= (and b!26628 res!22975) b!26632))

(assert (= (and b!26632 (not res!22980)) b!26630))

(assert (= (and b!26630 (not res!22982)) b!26635))

(assert (= (and b!26635 res!22978) b!26631))

(assert (= (and b!26635 (not res!22970)) b!26646))

(assert (= (and b!26646 (not res!22967)) b!26638))

(assert (= (and b!26638 (not res!22983)) b!26633))

(assert (= (and b!26633 (not res!22977)) b!26641))

(assert (= (and b!26641 res!22981) b!26642))

(assert (= (and b!26641 (not res!22979)) b!26636))

(assert (= (and b!26636 (not res!22976)) b!26629))

(assert (= (and b!26629 (not res!22966)) b!26634))

(assert (= (and b!26634 (not res!22969)) b!26640))

(assert (= (and b!26640 (not res!22972)) b!26644))

(assert (= (and b!26644 (not res!22965)) b!26643))

(assert (= (and b!26643 (not res!22968)) b!26637))

(assert (= (and b!26637 (not res!22973)) b!26639))

(assert (= (and b!26639 (not res!22974)) b!26647))

(assert (= start!5958 b!26645))

(declare-fun m!38181 () Bool)

(assert (=> b!26634 m!38181))

(declare-fun m!38183 () Bool)

(assert (=> b!26634 m!38183))

(declare-fun m!38185 () Bool)

(assert (=> b!26634 m!38185))

(declare-fun m!38187 () Bool)

(assert (=> b!26634 m!38187))

(declare-fun m!38189 () Bool)

(assert (=> b!26634 m!38189))

(declare-fun m!38191 () Bool)

(assert (=> b!26634 m!38191))

(declare-fun m!38193 () Bool)

(assert (=> b!26634 m!38193))

(declare-fun m!38195 () Bool)

(assert (=> b!26634 m!38195))

(declare-fun m!38197 () Bool)

(assert (=> b!26647 m!38197))

(declare-fun m!38199 () Bool)

(assert (=> b!26647 m!38199))

(declare-fun m!38201 () Bool)

(assert (=> b!26646 m!38201))

(declare-fun m!38203 () Bool)

(assert (=> b!26632 m!38203))

(declare-fun m!38205 () Bool)

(assert (=> b!26632 m!38205))

(declare-fun m!38207 () Bool)

(assert (=> b!26632 m!38207))

(declare-fun m!38209 () Bool)

(assert (=> b!26640 m!38209))

(declare-fun m!38211 () Bool)

(assert (=> b!26630 m!38211))

(declare-fun m!38213 () Bool)

(assert (=> b!26630 m!38213))

(declare-fun m!38215 () Bool)

(assert (=> b!26630 m!38215))

(assert (=> b!26630 m!38213))

(declare-fun m!38217 () Bool)

(assert (=> b!26630 m!38217))

(declare-fun m!38219 () Bool)

(assert (=> b!26630 m!38219))

(declare-fun m!38221 () Bool)

(assert (=> start!5958 m!38221))

(declare-fun m!38223 () Bool)

(assert (=> start!5958 m!38223))

(declare-fun m!38225 () Bool)

(assert (=> b!26643 m!38225))

(declare-fun m!38227 () Bool)

(assert (=> b!26635 m!38227))

(declare-fun m!38229 () Bool)

(assert (=> b!26635 m!38229))

(declare-fun m!38231 () Bool)

(assert (=> b!26635 m!38231))

(declare-fun m!38233 () Bool)

(assert (=> b!26635 m!38233))

(declare-fun m!38235 () Bool)

(assert (=> b!26635 m!38235))

(declare-fun m!38237 () Bool)

(assert (=> b!26635 m!38237))

(declare-fun m!38239 () Bool)

(assert (=> b!26635 m!38239))

(declare-fun m!38241 () Bool)

(assert (=> b!26636 m!38241))

(declare-fun m!38243 () Bool)

(assert (=> b!26631 m!38243))

(assert (=> b!26631 m!38243))

(declare-fun m!38245 () Bool)

(assert (=> b!26631 m!38245))

(declare-fun m!38247 () Bool)

(assert (=> b!26631 m!38247))

(assert (=> b!26631 m!38247))

(declare-fun m!38249 () Bool)

(assert (=> b!26631 m!38249))

(declare-fun m!38251 () Bool)

(assert (=> b!26628 m!38251))

(declare-fun m!38253 () Bool)

(assert (=> b!26637 m!38253))

(declare-fun m!38255 () Bool)

(assert (=> b!26645 m!38255))

(declare-fun m!38257 () Bool)

(assert (=> b!26629 m!38257))

(declare-fun m!38259 () Bool)

(assert (=> b!26638 m!38259))

(declare-fun m!38261 () Bool)

(assert (=> b!26642 m!38261))

(declare-fun m!38263 () Bool)

(assert (=> b!26644 m!38263))

(push 1)

(assert (not b!26644))

(assert (not start!5958))

(assert (not b!26642))

(assert (not b!26646))

(assert (not b!26645))

(assert (not b!26629))

(assert (not b!26647))

(assert (not b!26635))

(assert (not b!26628))

(assert (not b!26637))

(assert (not b!26630))

(assert (not b!26640))

(assert (not b!26632))

(assert (not b!26643))

(assert (not b!26634))

(assert (not b!26638))

(assert (not b!26636))

(assert (not b!26631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

