; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14526 () Bool)

(assert start!14526)

(declare-fun b!75097 () Bool)

(declare-fun res!62061 () Bool)

(declare-fun e!49120 () Bool)

(assert (=> b!75097 (=> res!62061 e!49120)))

(declare-datatypes ((array!3064 0))(
  ( (array!3065 (arr!2028 (Array (_ BitVec 32) (_ BitVec 8))) (size!1430 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2434 0))(
  ( (BitStream!2435 (buf!1811 array!3064) (currentByte!3575 (_ BitVec 32)) (currentBit!3570 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2434)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!75097 (= res!62061 (not (invariant!0 (currentBit!3570 thiss!1379) (currentByte!3575 thiss!1379) (size!1430 (buf!1811 thiss!1379)))))))

(declare-fun b!75098 () Bool)

(declare-fun e!49118 () Bool)

(declare-datatypes ((tuple2!6478 0))(
  ( (tuple2!6479 (_1!3361 BitStream!2434) (_2!3361 BitStream!2434)) )
))
(declare-fun lt!120781 () tuple2!6478)

(declare-datatypes ((tuple2!6480 0))(
  ( (tuple2!6481 (_1!3362 array!3064) (_2!3362 BitStream!2434)) )
))
(declare-fun lt!120780 () tuple2!6480)

(declare-fun inv!12 (BitStream!2434) Bool)

(assert (=> b!75098 (= e!49118 (inv!12 (BitStream!2435 (buf!1811 (_1!3361 lt!120781)) (currentByte!3575 (_2!3362 lt!120780)) (currentBit!3570 (_2!3362 lt!120780)))))))

(declare-fun srcBuffer!2 () array!3064)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun checkByteArrayBitContent!0 (BitStream!2434 array!3064 array!3064 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75098 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3362 lt!120780) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!75099 () Bool)

(declare-fun res!62063 () Bool)

(declare-fun e!49121 () Bool)

(assert (=> b!75099 (=> (not res!62063) (not e!49121))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75099 (= res!62063 (validate_offset_bits!1 ((_ sign_extend 32) (size!1430 (buf!1811 thiss!1379))) ((_ sign_extend 32) (currentByte!3575 thiss!1379)) ((_ sign_extend 32) (currentBit!3570 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!75100 () Bool)

(assert (=> b!75100 (= e!49120 e!49118)))

(declare-fun res!62065 () Bool)

(assert (=> b!75100 (=> res!62065 e!49118)))

(assert (=> b!75100 (= res!62065 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!2434 (_ BitVec 64)) tuple2!6480)

(assert (=> b!75100 (= lt!120780 (readBits!0 (_1!3361 lt!120781) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!2434 BitStream!2434) tuple2!6478)

(assert (=> b!75100 (= lt!120781 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!75101 () Bool)

(declare-fun e!49119 () Bool)

(declare-fun array_inv!1276 (array!3064) Bool)

(assert (=> b!75101 (= e!49119 (array_inv!1276 (buf!1811 thiss!1379)))))

(declare-fun res!62064 () Bool)

(assert (=> start!14526 (=> (not res!62064) (not e!49121))))

(assert (=> start!14526 (= res!62064 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1430 srcBuffer!2))))))))

(assert (=> start!14526 e!49121))

(assert (=> start!14526 true))

(assert (=> start!14526 (array_inv!1276 srcBuffer!2)))

(assert (=> start!14526 (and (inv!12 thiss!1379) e!49119)))

(declare-fun b!75102 () Bool)

(assert (=> b!75102 (= e!49121 (not e!49120))))

(declare-fun res!62062 () Bool)

(assert (=> b!75102 (=> res!62062 e!49120)))

(declare-fun lt!120782 () (_ BitVec 64))

(assert (=> b!75102 (= res!62062 (or (bvslt i!635 to!314) (not (= lt!120782 (bvsub (bvadd lt!120782 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2434 BitStream!2434) Bool)

(assert (=> b!75102 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4951 0))(
  ( (Unit!4952) )
))
(declare-fun lt!120783 () Unit!4951)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2434) Unit!4951)

(assert (=> b!75102 (= lt!120783 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!75102 (= lt!120782 (bitIndex!0 (size!1430 (buf!1811 thiss!1379)) (currentByte!3575 thiss!1379) (currentBit!3570 thiss!1379)))))

(assert (= (and start!14526 res!62064) b!75099))

(assert (= (and b!75099 res!62063) b!75102))

(assert (= (and b!75102 (not res!62062)) b!75097))

(assert (= (and b!75097 (not res!62061)) b!75100))

(assert (= (and b!75100 (not res!62065)) b!75098))

(assert (= start!14526 b!75101))

(declare-fun m!120179 () Bool)

(assert (=> b!75101 m!120179))

(declare-fun m!120181 () Bool)

(assert (=> start!14526 m!120181))

(declare-fun m!120183 () Bool)

(assert (=> start!14526 m!120183))

(declare-fun m!120185 () Bool)

(assert (=> b!75099 m!120185))

(declare-fun m!120187 () Bool)

(assert (=> b!75097 m!120187))

(declare-fun m!120189 () Bool)

(assert (=> b!75098 m!120189))

(declare-fun m!120191 () Bool)

(assert (=> b!75098 m!120191))

(declare-fun m!120193 () Bool)

(assert (=> b!75100 m!120193))

(declare-fun m!120195 () Bool)

(assert (=> b!75100 m!120195))

(declare-fun m!120197 () Bool)

(assert (=> b!75102 m!120197))

(declare-fun m!120199 () Bool)

(assert (=> b!75102 m!120199))

(declare-fun m!120201 () Bool)

(assert (=> b!75102 m!120201))

(push 1)

(assert (not b!75098))

(assert (not b!75102))

(assert (not b!75101))

(assert (not b!75100))

(assert (not start!14526))

(assert (not b!75099))

(assert (not b!75097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23882 () Bool)

(assert (=> d!23882 (= (inv!12 (BitStream!2435 (buf!1811 (_1!3361 lt!120781)) (currentByte!3575 (_2!3362 lt!120780)) (currentBit!3570 (_2!3362 lt!120780)))) (invariant!0 (currentBit!3570 (BitStream!2435 (buf!1811 (_1!3361 lt!120781)) (currentByte!3575 (_2!3362 lt!120780)) (currentBit!3570 (_2!3362 lt!120780)))) (currentByte!3575 (BitStream!2435 (buf!1811 (_1!3361 lt!120781)) (currentByte!3575 (_2!3362 lt!120780)) (currentBit!3570 (_2!3362 lt!120780)))) (size!1430 (buf!1811 (BitStream!2435 (buf!1811 (_1!3361 lt!120781)) (currentByte!3575 (_2!3362 lt!120780)) (currentBit!3570 (_2!3362 lt!120780)))))))))

(declare-fun bs!5740 () Bool)

(assert (= bs!5740 d!23882))

(declare-fun m!120251 () Bool)

(assert (=> bs!5740 m!120251))

(assert (=> b!75098 d!23882))

(declare-fun d!23884 () Bool)

(declare-fun res!62100 () Bool)

(declare-fun e!49163 () Bool)

(assert (=> d!23884 (=> res!62100 e!49163)))

(assert (=> d!23884 (= res!62100 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23884 (= (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3362 lt!120780) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) e!49163)))

(declare-fun b!75143 () Bool)

(declare-fun e!49164 () Bool)

(assert (=> b!75143 (= e!49163 e!49164)))

(declare-fun res!62101 () Bool)

(assert (=> b!75143 (=> (not res!62101) (not e!49164))))

(assert (=> b!75143 (= res!62101 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!2028 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!2028 (_1!3362 lt!120780)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!75144 () Bool)

(assert (=> b!75144 (= e!49164 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3362 lt!120780) (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!23884 (not res!62100)) b!75143))

(assert (= (and b!75143 res!62101) b!75144))

(declare-fun m!120253 () Bool)

(assert (=> b!75143 m!120253))

(declare-fun m!120255 () Bool)

(assert (=> b!75143 m!120255))

(declare-fun m!120257 () Bool)

(assert (=> b!75143 m!120257))

(declare-fun m!120259 () Bool)

(assert (=> b!75143 m!120259))

(declare-fun m!120261 () Bool)

(assert (=> b!75144 m!120261))

(assert (=> b!75098 d!23884))

(declare-fun d!23888 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!23888 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1430 (buf!1811 thiss!1379))) ((_ sign_extend 32) (currentByte!3575 thiss!1379)) ((_ sign_extend 32) (currentBit!3570 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1430 (buf!1811 thiss!1379))) ((_ sign_extend 32) (currentByte!3575 thiss!1379)) ((_ sign_extend 32) (currentBit!3570 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5741 () Bool)

(assert (= bs!5741 d!23888))

(declare-fun m!120263 () Bool)

(assert (=> bs!5741 m!120263))

(assert (=> b!75099 d!23888))

(declare-fun b!75191 () Bool)

(declare-fun lt!120874 () tuple2!6480)

(declare-fun e!49185 () Bool)

(declare-datatypes ((List!775 0))(
  ( (Nil!772) (Cons!771 (h!890 Bool) (t!1525 List!775)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!2434 array!3064 (_ BitVec 64) (_ BitVec 64)) List!775)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2434 BitStream!2434 (_ BitVec 64)) List!775)

(assert (=> b!75191 (= e!49185 (= (byteArrayBitContentToList!0 (_2!3362 lt!120874) (_1!3362 lt!120874) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bitStreamReadBitsIntoList!0 (_2!3362 lt!120874) (_1!3361 lt!120781) (bvsub to!314 i!635))))))

(declare-fun b!75192 () Bool)

(declare-fun res!62150 () Bool)

(assert (=> b!75192 (=> (not res!62150) (not e!49185))))

(assert (=> b!75192 (= res!62150 (invariant!0 (currentBit!3570 (_2!3362 lt!120874)) (currentByte!3575 (_2!3362 lt!120874)) (size!1430 (buf!1811 (_2!3362 lt!120874)))))))

(declare-fun b!75193 () Bool)

(declare-fun res!62151 () Bool)

(assert (=> b!75193 (=> (not res!62151) (not e!49185))))

(declare-fun lt!120882 () (_ BitVec 64))

(assert (=> b!75193 (= res!62151 (= (size!1430 (_1!3362 lt!120874)) ((_ extract 31 0) lt!120882)))))

(assert (=> b!75193 (and (bvslt lt!120882 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!120882 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!120880 () (_ BitVec 64))

(declare-fun lt!120876 () (_ BitVec 64))

(assert (=> b!75193 (= lt!120882 (bvsdiv lt!120880 lt!120876))))

(assert (=> b!75193 (and (not (= lt!120876 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!120880 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!120876 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!75193 (= lt!120876 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!120877 () (_ BitVec 64))

(declare-fun lt!120878 () (_ BitVec 64))

(assert (=> b!75193 (= lt!120880 (bvsub lt!120877 lt!120878))))

(assert (=> b!75193 (or (= (bvand lt!120877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120878 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!120877 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!120877 lt!120878) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75193 (= lt!120878 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!120881 () (_ BitVec 64))

(assert (=> b!75193 (= lt!120877 (bvadd (bvsub to!314 i!635) lt!120881))))

(assert (=> b!75193 (or (not (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!120881 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 i!635) lt!120881) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75193 (= lt!120881 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!75194 () Bool)

(declare-fun res!62148 () Bool)

(assert (=> b!75194 (=> (not res!62148) (not e!49185))))

(assert (=> b!75194 (= res!62148 (bvsle (currentByte!3575 (_1!3361 lt!120781)) (currentByte!3575 (_2!3362 lt!120874))))))

(declare-fun b!75195 () Bool)

(declare-fun res!62149 () Bool)

(assert (=> b!75195 (=> (not res!62149) (not e!49185))))

(declare-fun lt!120875 () (_ BitVec 64))

(assert (=> b!75195 (= res!62149 (= (bvadd lt!120875 (bvsub to!314 i!635)) (bitIndex!0 (size!1430 (buf!1811 (_2!3362 lt!120874))) (currentByte!3575 (_2!3362 lt!120874)) (currentBit!3570 (_2!3362 lt!120874)))))))

(assert (=> b!75195 (or (not (= (bvand lt!120875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!120875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!120875 (bvsub to!314 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75195 (= lt!120875 (bitIndex!0 (size!1430 (buf!1811 (_1!3361 lt!120781))) (currentByte!3575 (_1!3361 lt!120781)) (currentBit!3570 (_1!3361 lt!120781))))))

(declare-fun d!23890 () Bool)

(assert (=> d!23890 e!49185))

(declare-fun res!62152 () Bool)

(assert (=> d!23890 (=> (not res!62152) (not e!49185))))

(assert (=> d!23890 (= res!62152 (= (buf!1811 (_2!3362 lt!120874)) (buf!1811 (_1!3361 lt!120781))))))

(declare-datatypes ((tuple3!204 0))(
  ( (tuple3!205 (_1!3368 Unit!4951) (_2!3368 BitStream!2434) (_3!123 array!3064)) )
))
(declare-fun lt!120879 () tuple3!204)

(assert (=> d!23890 (= lt!120874 (tuple2!6481 (_3!123 lt!120879) (_2!3368 lt!120879)))))

(declare-fun readBitsLoop!0 (BitStream!2434 (_ BitVec 64) array!3064 (_ BitVec 64) (_ BitVec 64)) tuple3!204)

(assert (=> d!23890 (= lt!120879 (readBitsLoop!0 (_1!3361 lt!120781) (bvsub to!314 i!635) (array!3065 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)))))

(assert (=> d!23890 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635)) (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!23890 (= (readBits!0 (_1!3361 lt!120781) (bvsub to!314 i!635)) lt!120874)))

(assert (= (and d!23890 res!62152) b!75195))

(assert (= (and b!75195 res!62149) b!75192))

(assert (= (and b!75192 res!62150) b!75193))

(assert (= (and b!75193 res!62151) b!75194))

(assert (= (and b!75194 res!62148) b!75191))

(declare-fun m!120295 () Bool)

(assert (=> b!75191 m!120295))

(declare-fun m!120297 () Bool)

(assert (=> b!75191 m!120297))

(declare-fun m!120299 () Bool)

(assert (=> b!75192 m!120299))

(declare-fun m!120301 () Bool)

(assert (=> b!75195 m!120301))

(declare-fun m!120303 () Bool)

(assert (=> b!75195 m!120303))

(declare-fun m!120305 () Bool)

(assert (=> d!23890 m!120305))

(assert (=> b!75100 d!23890))

(declare-fun b!75251 () Bool)

(declare-fun e!49211 () Unit!4951)

(declare-fun lt!121016 () Unit!4951)

(assert (=> b!75251 (= e!49211 lt!121016)))

(declare-fun lt!121015 () (_ BitVec 64))

(assert (=> b!75251 (= lt!121015 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!121017 () (_ BitVec 64))

(assert (=> b!75251 (= lt!121017 (bitIndex!0 (size!1430 (buf!1811 thiss!1379)) (currentByte!3575 thiss!1379) (currentBit!3570 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3064 array!3064 (_ BitVec 64) (_ BitVec 64)) Unit!4951)

(assert (=> b!75251 (= lt!121016 (arrayBitRangesEqSymmetric!0 (buf!1811 thiss!1379) (buf!1811 thiss!1379) lt!121015 lt!121017))))

(declare-fun arrayBitRangesEq!0 (array!3064 array!3064 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!75251 (arrayBitRangesEq!0 (buf!1811 thiss!1379) (buf!1811 thiss!1379) lt!121015 lt!121017)))

(declare-fun b!75252 () Bool)

(declare-fun res!62200 () Bool)

(declare-fun e!49212 () Bool)

(assert (=> b!75252 (=> (not res!62200) (not e!49212))))

(declare-fun lt!121027 () tuple2!6478)

(assert (=> b!75252 (= res!62200 (isPrefixOf!0 (_1!3361 lt!121027) thiss!1379))))

(declare-fun d!23914 () Bool)

(assert (=> d!23914 e!49212))

(declare-fun res!62199 () Bool)

(assert (=> d!23914 (=> (not res!62199) (not e!49212))))

(assert (=> d!23914 (= res!62199 (isPrefixOf!0 (_1!3361 lt!121027) (_2!3361 lt!121027)))))

(declare-fun lt!121010 () BitStream!2434)

(assert (=> d!23914 (= lt!121027 (tuple2!6479 lt!121010 thiss!1379))))

(declare-fun lt!121018 () Unit!4951)

(declare-fun lt!121024 () Unit!4951)

(assert (=> d!23914 (= lt!121018 lt!121024)))

(assert (=> d!23914 (isPrefixOf!0 lt!121010 thiss!1379)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2434 BitStream!2434 BitStream!2434) Unit!4951)

(assert (=> d!23914 (= lt!121024 (lemmaIsPrefixTransitive!0 lt!121010 thiss!1379 thiss!1379))))

(declare-fun lt!121028 () Unit!4951)

(declare-fun lt!121023 () Unit!4951)

(assert (=> d!23914 (= lt!121028 lt!121023)))

(assert (=> d!23914 (isPrefixOf!0 lt!121010 thiss!1379)))

(assert (=> d!23914 (= lt!121023 (lemmaIsPrefixTransitive!0 lt!121010 thiss!1379 thiss!1379))))

(declare-fun lt!121012 () Unit!4951)

(assert (=> d!23914 (= lt!121012 e!49211)))

(declare-fun c!5519 () Bool)

(assert (=> d!23914 (= c!5519 (not (= (size!1430 (buf!1811 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!121014 () Unit!4951)

(declare-fun lt!121025 () Unit!4951)

(assert (=> d!23914 (= lt!121014 lt!121025)))

(assert (=> d!23914 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23914 (= lt!121025 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121020 () Unit!4951)

(declare-fun lt!121022 () Unit!4951)

(assert (=> d!23914 (= lt!121020 lt!121022)))

(assert (=> d!23914 (= lt!121022 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!121021 () Unit!4951)

(declare-fun lt!121013 () Unit!4951)

(assert (=> d!23914 (= lt!121021 lt!121013)))

(assert (=> d!23914 (isPrefixOf!0 lt!121010 lt!121010)))

(assert (=> d!23914 (= lt!121013 (lemmaIsPrefixRefl!0 lt!121010))))

(declare-fun lt!121029 () Unit!4951)

(declare-fun lt!121026 () Unit!4951)

(assert (=> d!23914 (= lt!121029 lt!121026)))

(assert (=> d!23914 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23914 (= lt!121026 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!23914 (= lt!121010 (BitStream!2435 (buf!1811 thiss!1379) (currentByte!3575 thiss!1379) (currentBit!3570 thiss!1379)))))

(assert (=> d!23914 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!23914 (= (reader!0 thiss!1379 thiss!1379) lt!121027)))

(declare-fun b!75253 () Bool)

(declare-fun Unit!4958 () Unit!4951)

(assert (=> b!75253 (= e!49211 Unit!4958)))

(declare-fun b!75254 () Bool)

(declare-fun res!62198 () Bool)

(assert (=> b!75254 (=> (not res!62198) (not e!49212))))

(assert (=> b!75254 (= res!62198 (isPrefixOf!0 (_2!3361 lt!121027) thiss!1379))))

(declare-fun b!75255 () Bool)

(declare-fun lt!121011 () (_ BitVec 64))

(declare-fun lt!121019 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2434 (_ BitVec 64)) BitStream!2434)

(assert (=> b!75255 (= e!49212 (= (_1!3361 lt!121027) (withMovedBitIndex!0 (_2!3361 lt!121027) (bvsub lt!121011 lt!121019))))))

(assert (=> b!75255 (or (= (bvand lt!121011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121019 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121011 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121011 lt!121019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!75255 (= lt!121019 (bitIndex!0 (size!1430 (buf!1811 thiss!1379)) (currentByte!3575 thiss!1379) (currentBit!3570 thiss!1379)))))

(assert (=> b!75255 (= lt!121011 (bitIndex!0 (size!1430 (buf!1811 thiss!1379)) (currentByte!3575 thiss!1379) (currentBit!3570 thiss!1379)))))

(assert (= (and d!23914 c!5519) b!75251))

(assert (= (and d!23914 (not c!5519)) b!75253))

(assert (= (and d!23914 res!62199) b!75252))

(assert (= (and b!75252 res!62200) b!75254))

(assert (= (and b!75254 res!62198) b!75255))

(declare-fun m!120353 () Bool)

(assert (=> b!75255 m!120353))

(assert (=> b!75255 m!120201))

(assert (=> b!75255 m!120201))

(declare-fun m!120355 () Bool)

(assert (=> b!75254 m!120355))

(assert (=> b!75251 m!120201))

(declare-fun m!120357 () Bool)

(assert (=> b!75251 m!120357))

(declare-fun m!120359 () Bool)

(assert (=> b!75251 m!120359))

(assert (=> d!23914 m!120197))

(assert (=> d!23914 m!120199))

(declare-fun m!120361 () Bool)

(assert (=> d!23914 m!120361))

(declare-fun m!120363 () Bool)

(assert (=> d!23914 m!120363))

(declare-fun m!120365 () Bool)

(assert (=> d!23914 m!120365))

(assert (=> d!23914 m!120199))

(assert (=> d!23914 m!120361))

(assert (=> d!23914 m!120197))

(assert (=> d!23914 m!120197))

(declare-fun m!120367 () Bool)

(assert (=> d!23914 m!120367))

(declare-fun m!120369 () Bool)

(assert (=> d!23914 m!120369))

(declare-fun m!120371 () Bool)

(assert (=> b!75252 m!120371))

(assert (=> b!75100 d!23914))

(declare-fun d!23932 () Bool)

(assert (=> d!23932 (= (array_inv!1276 (buf!1811 thiss!1379)) (bvsge (size!1430 (buf!1811 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!75101 d!23932))

(declare-fun d!23934 () Bool)

(assert (=> d!23934 (= (invariant!0 (currentBit!3570 thiss!1379) (currentByte!3575 thiss!1379) (size!1430 (buf!1811 thiss!1379))) (and (bvsge (currentBit!3570 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!3570 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!3575 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!3575 thiss!1379) (size!1430 (buf!1811 thiss!1379))) (and (= (currentBit!3570 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!3575 thiss!1379) (size!1430 (buf!1811 thiss!1379)))))))))

(assert (=> b!75097 d!23934))

(declare-fun d!23938 () Bool)

(declare-fun res!62207 () Bool)

(declare-fun e!49218 () Bool)

(assert (=> d!23938 (=> (not res!62207) (not e!49218))))

(assert (=> d!23938 (= res!62207 (= (size!1430 (buf!1811 thiss!1379)) (size!1430 (buf!1811 thiss!1379))))))

(assert (=> d!23938 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!49218)))

(declare-fun b!75262 () Bool)

(declare-fun res!62208 () Bool)

(assert (=> b!75262 (=> (not res!62208) (not e!49218))))

(assert (=> b!75262 (= res!62208 (bvsle (bitIndex!0 (size!1430 (buf!1811 thiss!1379)) (currentByte!3575 thiss!1379) (currentBit!3570 thiss!1379)) (bitIndex!0 (size!1430 (buf!1811 thiss!1379)) (currentByte!3575 thiss!1379) (currentBit!3570 thiss!1379))))))

(declare-fun b!75263 () Bool)

(declare-fun e!49217 () Bool)

(assert (=> b!75263 (= e!49218 e!49217)))

(declare-fun res!62209 () Bool)

(assert (=> b!75263 (=> res!62209 e!49217)))

(assert (=> b!75263 (= res!62209 (= (size!1430 (buf!1811 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!75264 () Bool)

(assert (=> b!75264 (= e!49217 (arrayBitRangesEq!0 (buf!1811 thiss!1379) (buf!1811 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1430 (buf!1811 thiss!1379)) (currentByte!3575 thiss!1379) (currentBit!3570 thiss!1379))))))

(assert (= (and d!23938 res!62207) b!75262))

(assert (= (and b!75262 res!62208) b!75263))

(assert (= (and b!75263 (not res!62209)) b!75264))

(assert (=> b!75262 m!120201))

(assert (=> b!75262 m!120201))

(assert (=> b!75264 m!120201))

(assert (=> b!75264 m!120201))

(declare-fun m!120375 () Bool)

(assert (=> b!75264 m!120375))

(assert (=> b!75102 d!23938))

(declare-fun d!23940 () Bool)

(assert (=> d!23940 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!121035 () Unit!4951)

(declare-fun choose!11 (BitStream!2434) Unit!4951)

(assert (=> d!23940 (= lt!121035 (choose!11 thiss!1379))))

(assert (=> d!23940 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!121035)))

(declare-fun bs!5752 () Bool)

(assert (= bs!5752 d!23940))

(assert (=> bs!5752 m!120197))

(declare-fun m!120377 () Bool)

(assert (=> bs!5752 m!120377))

(assert (=> b!75102 d!23940))

(declare-fun d!23942 () Bool)

(declare-fun e!49226 () Bool)

(assert (=> d!23942 e!49226))

(declare-fun res!62220 () Bool)

(assert (=> d!23942 (=> (not res!62220) (not e!49226))))

(declare-fun lt!121096 () (_ BitVec 64))

(declare-fun lt!121099 () (_ BitVec 64))

(declare-fun lt!121097 () (_ BitVec 64))

(assert (=> d!23942 (= res!62220 (= lt!121097 (bvsub lt!121099 lt!121096)))))

(assert (=> d!23942 (or (= (bvand lt!121099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!121096 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!121099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!121099 lt!121096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23942 (= lt!121096 (remainingBits!0 ((_ sign_extend 32) (size!1430 (buf!1811 thiss!1379))) ((_ sign_extend 32) (currentByte!3575 thiss!1379)) ((_ sign_extend 32) (currentBit!3570 thiss!1379))))))

(declare-fun lt!121094 () (_ BitVec 64))

(declare-fun lt!121098 () (_ BitVec 64))

(assert (=> d!23942 (= lt!121099 (bvmul lt!121094 lt!121098))))

(assert (=> d!23942 (or (= lt!121094 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!121098 (bvsdiv (bvmul lt!121094 lt!121098) lt!121094)))))

(assert (=> d!23942 (= lt!121098 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!23942 (= lt!121094 ((_ sign_extend 32) (size!1430 (buf!1811 thiss!1379))))))

(assert (=> d!23942 (= lt!121097 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3575 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3570 thiss!1379))))))

(assert (=> d!23942 (invariant!0 (currentBit!3570 thiss!1379) (currentByte!3575 thiss!1379) (size!1430 (buf!1811 thiss!1379)))))

(assert (=> d!23942 (= (bitIndex!0 (size!1430 (buf!1811 thiss!1379)) (currentByte!3575 thiss!1379) (currentBit!3570 thiss!1379)) lt!121097)))

(declare-fun b!75279 () Bool)

(declare-fun res!62221 () Bool)

(assert (=> b!75279 (=> (not res!62221) (not e!49226))))

(assert (=> b!75279 (= res!62221 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!121097))))

(declare-fun b!75280 () Bool)

(declare-fun lt!121095 () (_ BitVec 64))

(assert (=> b!75280 (= e!49226 (bvsle lt!121097 (bvmul lt!121095 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!75280 (or (= lt!121095 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!121095 #b0000000000000000000000000000000000000000000000000000000000001000) lt!121095)))))

(assert (=> b!75280 (= lt!121095 ((_ sign_extend 32) (size!1430 (buf!1811 thiss!1379))))))

(assert (= (and d!23942 res!62220) b!75279))

(assert (= (and b!75279 res!62221) b!75280))

(assert (=> d!23942 m!120263))

(assert (=> d!23942 m!120187))

(assert (=> b!75102 d!23942))

(declare-fun d!23946 () Bool)

(assert (=> d!23946 (= (array_inv!1276 srcBuffer!2) (bvsge (size!1430 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!14526 d!23946))

(declare-fun d!23948 () Bool)

(assert (=> d!23948 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3570 thiss!1379) (currentByte!3575 thiss!1379) (size!1430 (buf!1811 thiss!1379))))))

(declare-fun bs!5754 () Bool)

(assert (= bs!5754 d!23948))

(assert (=> bs!5754 m!120187))

(assert (=> start!14526 d!23948))

(push 1)

(assert (not b!75255))

(assert (not b!75192))

(assert (not b!75264))

(assert (not b!75254))

(assert (not b!75144))

(assert (not d!23914))

(assert (not b!75252))

(assert (not b!75251))

(assert (not d!23882))

(assert (not b!75195))

(assert (not d!23888))

(assert (not d!23890))

(assert (not b!75262))

(assert (not d!23942))

(assert (not d!23940))

(assert (not b!75191))

(assert (not d!23948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

