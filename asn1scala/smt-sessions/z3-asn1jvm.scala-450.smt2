; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11894 () Bool)

(assert start!11894)

(declare-fun b!60401 () Bool)

(declare-fun e!40306 () Bool)

(assert (=> b!60401 (= e!40306 true)))

(declare-fun lt!94275 () Int)

(declare-datatypes ((List!670 0))(
  ( (Nil!667) (Cons!666 (h!785 Bool) (t!1420 List!670)) )
))
(declare-fun lt!94276 () List!670)

(declare-fun length!298 (List!670) Int)

(assert (=> b!60401 (= lt!94275 (length!298 lt!94276))))

(declare-datatypes ((array!2751 0))(
  ( (array!2752 (arr!1815 (Array (_ BitVec 32) (_ BitVec 8))) (size!1251 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2751)

(declare-fun b!60402 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((BitStream!2190 0))(
  ( (BitStream!2191 (buf!1632 array!2751) (currentByte!3250 (_ BitVec 32)) (currentBit!3245 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4125 0))(
  ( (Unit!4126) )
))
(declare-datatypes ((tuple2!5502 0))(
  ( (tuple2!5503 (_1!2862 Unit!4125) (_2!2862 BitStream!2190)) )
))
(declare-fun lt!94265 () tuple2!5502)

(declare-fun e!40296 () Bool)

(declare-datatypes ((tuple2!5504 0))(
  ( (tuple2!5505 (_1!2863 BitStream!2190) (_2!2863 BitStream!2190)) )
))
(declare-fun lt!94267 () tuple2!5504)

(declare-fun head!489 (List!670) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2190 array!2751 (_ BitVec 64) (_ BitVec 64)) List!670)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2190 BitStream!2190 (_ BitVec 64)) List!670)

(assert (=> b!60402 (= e!40296 (= (head!489 (byteArrayBitContentToList!0 (_2!2862 lt!94265) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!489 (bitStreamReadBitsIntoList!0 (_2!2862 lt!94265) (_1!2863 lt!94267) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60403 () Bool)

(declare-fun res!50362 () Bool)

(declare-fun e!40307 () Bool)

(assert (=> b!60403 (=> res!50362 e!40307)))

(declare-fun lt!94260 () tuple2!5502)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60403 (= res!50362 (not (invariant!0 (currentBit!3245 (_2!2862 lt!94260)) (currentByte!3250 (_2!2862 lt!94260)) (size!1251 (buf!1632 (_2!2862 lt!94260))))))))

(declare-fun b!60404 () Bool)

(declare-fun res!50363 () Bool)

(declare-fun e!40302 () Bool)

(assert (=> b!60404 (=> res!50363 e!40302)))

(assert (=> b!60404 (= res!50363 (not (invariant!0 (currentBit!3245 (_2!2862 lt!94265)) (currentByte!3250 (_2!2862 lt!94265)) (size!1251 (buf!1632 (_2!2862 lt!94260))))))))

(declare-fun b!60405 () Bool)

(declare-fun res!50361 () Bool)

(assert (=> b!60405 (=> res!50361 e!40307)))

(declare-fun thiss!1379 () BitStream!2190)

(assert (=> b!60405 (= res!50361 (not (= (size!1251 (buf!1632 thiss!1379)) (size!1251 (buf!1632 (_2!2862 lt!94260))))))))

(declare-fun b!60406 () Bool)

(declare-fun e!40305 () Bool)

(assert (=> b!60406 (= e!40305 e!40307)))

(declare-fun res!50365 () Bool)

(assert (=> b!60406 (=> res!50365 e!40307)))

(declare-fun lt!94271 () (_ BitVec 64))

(declare-fun lt!94261 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!60406 (= res!50365 (not (= lt!94261 (bvsub (bvadd lt!94271 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60406 (= lt!94261 (bitIndex!0 (size!1251 (buf!1632 (_2!2862 lt!94260))) (currentByte!3250 (_2!2862 lt!94260)) (currentBit!3245 (_2!2862 lt!94260))))))

(declare-fun b!60407 () Bool)

(declare-fun e!40297 () Bool)

(assert (=> b!60407 (= e!40297 e!40305)))

(declare-fun res!50373 () Bool)

(assert (=> b!60407 (=> res!50373 e!40305)))

(declare-fun isPrefixOf!0 (BitStream!2190 BitStream!2190) Bool)

(assert (=> b!60407 (= res!50373 (not (isPrefixOf!0 (_2!2862 lt!94265) (_2!2862 lt!94260))))))

(assert (=> b!60407 (isPrefixOf!0 thiss!1379 (_2!2862 lt!94260))))

(declare-fun lt!94266 () Unit!4125)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2190 BitStream!2190 BitStream!2190) Unit!4125)

(assert (=> b!60407 (= lt!94266 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2862 lt!94265) (_2!2862 lt!94260)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2190 array!2751 (_ BitVec 64) (_ BitVec 64)) tuple2!5502)

(assert (=> b!60407 (= lt!94260 (appendBitsMSBFirstLoop!0 (_2!2862 lt!94265) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!60407 e!40296))

(declare-fun res!50360 () Bool)

(assert (=> b!60407 (=> (not res!50360) (not e!40296))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60407 (= res!50360 (validate_offset_bits!1 ((_ sign_extend 32) (size!1251 (buf!1632 (_2!2862 lt!94265)))) ((_ sign_extend 32) (currentByte!3250 thiss!1379)) ((_ sign_extend 32) (currentBit!3245 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94274 () Unit!4125)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2190 array!2751 (_ BitVec 64)) Unit!4125)

(assert (=> b!60407 (= lt!94274 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1632 (_2!2862 lt!94265)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2190 BitStream!2190) tuple2!5504)

(assert (=> b!60407 (= lt!94267 (reader!0 thiss!1379 (_2!2862 lt!94265)))))

(declare-fun res!50371 () Bool)

(declare-fun e!40304 () Bool)

(assert (=> start!11894 (=> (not res!50371) (not e!40304))))

(assert (=> start!11894 (= res!50371 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1251 srcBuffer!2))))))))

(assert (=> start!11894 e!40304))

(assert (=> start!11894 true))

(declare-fun array_inv!1154 (array!2751) Bool)

(assert (=> start!11894 (array_inv!1154 srcBuffer!2)))

(declare-fun e!40300 () Bool)

(declare-fun inv!12 (BitStream!2190) Bool)

(assert (=> start!11894 (and (inv!12 thiss!1379) e!40300)))

(declare-fun e!40301 () Bool)

(declare-fun b!60408 () Bool)

(assert (=> b!60408 (= e!40301 (= lt!94261 (bvsub (bvsub (bvadd (bitIndex!0 (size!1251 (buf!1632 (_2!2862 lt!94265))) (currentByte!3250 (_2!2862 lt!94265)) (currentBit!3245 (_2!2862 lt!94265))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60409 () Bool)

(declare-fun res!50372 () Bool)

(assert (=> b!60409 (=> (not res!50372) (not e!40304))))

(assert (=> b!60409 (= res!50372 (validate_offset_bits!1 ((_ sign_extend 32) (size!1251 (buf!1632 thiss!1379))) ((_ sign_extend 32) (currentByte!3250 thiss!1379)) ((_ sign_extend 32) (currentBit!3245 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!60410 () Bool)

(declare-fun e!40298 () Bool)

(assert (=> b!60410 (= e!40298 e!40297)))

(declare-fun res!50364 () Bool)

(assert (=> b!60410 (=> res!50364 e!40297)))

(assert (=> b!60410 (= res!50364 (not (isPrefixOf!0 thiss!1379 (_2!2862 lt!94265))))))

(declare-fun lt!94262 () (_ BitVec 64))

(assert (=> b!60410 (validate_offset_bits!1 ((_ sign_extend 32) (size!1251 (buf!1632 (_2!2862 lt!94265)))) ((_ sign_extend 32) (currentByte!3250 (_2!2862 lt!94265))) ((_ sign_extend 32) (currentBit!3245 (_2!2862 lt!94265))) lt!94262)))

(assert (=> b!60410 (= lt!94262 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94263 () Unit!4125)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2190 BitStream!2190 (_ BitVec 64) (_ BitVec 64)) Unit!4125)

(assert (=> b!60410 (= lt!94263 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2862 lt!94265) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2190 (_ BitVec 8) (_ BitVec 32)) tuple2!5502)

(assert (=> b!60410 (= lt!94265 (appendBitFromByte!0 thiss!1379 (select (arr!1815 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60411 () Bool)

(assert (=> b!60411 (= e!40302 e!40306)))

(declare-fun res!50370 () Bool)

(assert (=> b!60411 (=> res!50370 e!40306)))

(assert (=> b!60411 (= res!50370 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!94264 () tuple2!5504)

(declare-fun lt!94269 () List!670)

(assert (=> b!60411 (= lt!94269 (bitStreamReadBitsIntoList!0 (_2!2862 lt!94260) (_1!2863 lt!94264) lt!94262))))

(declare-fun lt!94273 () tuple2!5504)

(assert (=> b!60411 (= lt!94276 (bitStreamReadBitsIntoList!0 (_2!2862 lt!94260) (_1!2863 lt!94273) (bvsub to!314 i!635)))))

(assert (=> b!60411 (validate_offset_bits!1 ((_ sign_extend 32) (size!1251 (buf!1632 (_2!2862 lt!94260)))) ((_ sign_extend 32) (currentByte!3250 (_2!2862 lt!94265))) ((_ sign_extend 32) (currentBit!3245 (_2!2862 lt!94265))) lt!94262)))

(declare-fun lt!94270 () Unit!4125)

(assert (=> b!60411 (= lt!94270 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2862 lt!94265) (buf!1632 (_2!2862 lt!94260)) lt!94262))))

(assert (=> b!60411 (= lt!94264 (reader!0 (_2!2862 lt!94265) (_2!2862 lt!94260)))))

(assert (=> b!60411 (validate_offset_bits!1 ((_ sign_extend 32) (size!1251 (buf!1632 (_2!2862 lt!94260)))) ((_ sign_extend 32) (currentByte!3250 thiss!1379)) ((_ sign_extend 32) (currentBit!3245 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94272 () Unit!4125)

(assert (=> b!60411 (= lt!94272 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1632 (_2!2862 lt!94260)) (bvsub to!314 i!635)))))

(assert (=> b!60411 (= lt!94273 (reader!0 thiss!1379 (_2!2862 lt!94260)))))

(declare-fun b!60412 () Bool)

(assert (=> b!60412 (= e!40304 (not e!40298))))

(declare-fun res!50367 () Bool)

(assert (=> b!60412 (=> res!50367 e!40298)))

(assert (=> b!60412 (= res!50367 (bvsge i!635 to!314))))

(assert (=> b!60412 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94268 () Unit!4125)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2190) Unit!4125)

(assert (=> b!60412 (= lt!94268 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!60412 (= lt!94271 (bitIndex!0 (size!1251 (buf!1632 thiss!1379)) (currentByte!3250 thiss!1379) (currentBit!3245 thiss!1379)))))

(declare-fun b!60413 () Bool)

(assert (=> b!60413 (= e!40307 e!40302)))

(declare-fun res!50368 () Bool)

(assert (=> b!60413 (=> res!50368 e!40302)))

(assert (=> b!60413 (= res!50368 (not (= (size!1251 (buf!1632 (_2!2862 lt!94265))) (size!1251 (buf!1632 (_2!2862 lt!94260))))))))

(assert (=> b!60413 e!40301))

(declare-fun res!50369 () Bool)

(assert (=> b!60413 (=> (not res!50369) (not e!40301))))

(assert (=> b!60413 (= res!50369 (= (size!1251 (buf!1632 (_2!2862 lt!94260))) (size!1251 (buf!1632 thiss!1379))))))

(declare-fun b!60414 () Bool)

(assert (=> b!60414 (= e!40300 (array_inv!1154 (buf!1632 thiss!1379)))))

(declare-fun b!60415 () Bool)

(declare-fun res!50366 () Bool)

(assert (=> b!60415 (=> res!50366 e!40302)))

(assert (=> b!60415 (= res!50366 (not (invariant!0 (currentBit!3245 (_2!2862 lt!94265)) (currentByte!3250 (_2!2862 lt!94265)) (size!1251 (buf!1632 (_2!2862 lt!94265))))))))

(assert (= (and start!11894 res!50371) b!60409))

(assert (= (and b!60409 res!50372) b!60412))

(assert (= (and b!60412 (not res!50367)) b!60410))

(assert (= (and b!60410 (not res!50364)) b!60407))

(assert (= (and b!60407 res!50360) b!60402))

(assert (= (and b!60407 (not res!50373)) b!60406))

(assert (= (and b!60406 (not res!50365)) b!60403))

(assert (= (and b!60403 (not res!50362)) b!60405))

(assert (= (and b!60405 (not res!50361)) b!60413))

(assert (= (and b!60413 res!50369) b!60408))

(assert (= (and b!60413 (not res!50368)) b!60415))

(assert (= (and b!60415 (not res!50366)) b!60404))

(assert (= (and b!60404 (not res!50363)) b!60411))

(assert (= (and b!60411 (not res!50370)) b!60401))

(assert (= start!11894 b!60414))

(declare-fun m!95169 () Bool)

(assert (=> b!60401 m!95169))

(declare-fun m!95171 () Bool)

(assert (=> b!60409 m!95171))

(declare-fun m!95173 () Bool)

(assert (=> b!60414 m!95173))

(declare-fun m!95175 () Bool)

(assert (=> b!60408 m!95175))

(declare-fun m!95177 () Bool)

(assert (=> b!60402 m!95177))

(assert (=> b!60402 m!95177))

(declare-fun m!95179 () Bool)

(assert (=> b!60402 m!95179))

(declare-fun m!95181 () Bool)

(assert (=> b!60402 m!95181))

(assert (=> b!60402 m!95181))

(declare-fun m!95183 () Bool)

(assert (=> b!60402 m!95183))

(declare-fun m!95185 () Bool)

(assert (=> b!60404 m!95185))

(declare-fun m!95187 () Bool)

(assert (=> b!60411 m!95187))

(declare-fun m!95189 () Bool)

(assert (=> b!60411 m!95189))

(declare-fun m!95191 () Bool)

(assert (=> b!60411 m!95191))

(declare-fun m!95193 () Bool)

(assert (=> b!60411 m!95193))

(declare-fun m!95195 () Bool)

(assert (=> b!60411 m!95195))

(declare-fun m!95197 () Bool)

(assert (=> b!60411 m!95197))

(declare-fun m!95199 () Bool)

(assert (=> b!60411 m!95199))

(declare-fun m!95201 () Bool)

(assert (=> b!60411 m!95201))

(declare-fun m!95203 () Bool)

(assert (=> b!60410 m!95203))

(declare-fun m!95205 () Bool)

(assert (=> b!60410 m!95205))

(declare-fun m!95207 () Bool)

(assert (=> b!60410 m!95207))

(declare-fun m!95209 () Bool)

(assert (=> b!60410 m!95209))

(assert (=> b!60410 m!95205))

(declare-fun m!95211 () Bool)

(assert (=> b!60410 m!95211))

(declare-fun m!95213 () Bool)

(assert (=> b!60415 m!95213))

(declare-fun m!95215 () Bool)

(assert (=> b!60403 m!95215))

(declare-fun m!95217 () Bool)

(assert (=> b!60407 m!95217))

(declare-fun m!95219 () Bool)

(assert (=> b!60407 m!95219))

(declare-fun m!95221 () Bool)

(assert (=> b!60407 m!95221))

(declare-fun m!95223 () Bool)

(assert (=> b!60407 m!95223))

(declare-fun m!95225 () Bool)

(assert (=> b!60407 m!95225))

(declare-fun m!95227 () Bool)

(assert (=> b!60407 m!95227))

(declare-fun m!95229 () Bool)

(assert (=> b!60407 m!95229))

(declare-fun m!95231 () Bool)

(assert (=> b!60406 m!95231))

(declare-fun m!95233 () Bool)

(assert (=> start!11894 m!95233))

(declare-fun m!95235 () Bool)

(assert (=> start!11894 m!95235))

(declare-fun m!95237 () Bool)

(assert (=> b!60412 m!95237))

(declare-fun m!95239 () Bool)

(assert (=> b!60412 m!95239))

(declare-fun m!95241 () Bool)

(assert (=> b!60412 m!95241))

(check-sat (not b!60412) (not b!60409) (not start!11894) (not b!60411) (not b!60408) (not b!60402) (not b!60414) (not b!60403) (not b!60410) (not b!60407) (not b!60415) (not b!60401) (not b!60404) (not b!60406))
