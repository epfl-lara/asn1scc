; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10558 () Bool)

(assert start!10558)

(declare-fun b!52902 () Bool)

(declare-fun e!35241 () Bool)

(declare-fun e!35242 () Bool)

(assert (=> b!52902 (= e!35241 (not e!35242))))

(declare-fun res!44184 () Bool)

(assert (=> b!52902 (=> res!44184 e!35242)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!52902 (= res!44184 (bvsge i!635 to!314))))

(declare-datatypes ((array!2501 0))(
  ( (array!2502 (arr!1678 (Array (_ BitVec 32) (_ BitVec 8))) (size!1142 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1976 0))(
  ( (BitStream!1977 (buf!1492 array!2501) (currentByte!3047 (_ BitVec 32)) (currentBit!3042 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1976)

(declare-fun isPrefixOf!0 (BitStream!1976 BitStream!1976) Bool)

(assert (=> b!52902 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3688 0))(
  ( (Unit!3689) )
))
(declare-fun lt!81948 () Unit!3688)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1976) Unit!3688)

(assert (=> b!52902 (= lt!81948 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81947 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52902 (= lt!81947 (bitIndex!0 (size!1142 (buf!1492 thiss!1379)) (currentByte!3047 thiss!1379) (currentBit!3042 thiss!1379)))))

(declare-fun b!52904 () Bool)

(declare-fun e!35245 () Bool)

(declare-fun array_inv!1047 (array!2501) Bool)

(assert (=> b!52904 (= e!35245 (array_inv!1047 (buf!1492 thiss!1379)))))

(declare-fun b!52905 () Bool)

(declare-fun e!35246 () Bool)

(assert (=> b!52905 (= e!35242 e!35246)))

(declare-fun res!44186 () Bool)

(assert (=> b!52905 (=> res!44186 e!35246)))

(declare-datatypes ((tuple2!4818 0))(
  ( (tuple2!4819 (_1!2514 Unit!3688) (_2!2514 BitStream!1976)) )
))
(declare-fun lt!81946 () tuple2!4818)

(assert (=> b!52905 (= res!44186 (not (isPrefixOf!0 thiss!1379 (_2!2514 lt!81946))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52905 (validate_offset_bits!1 ((_ sign_extend 32) (size!1142 (buf!1492 (_2!2514 lt!81946)))) ((_ sign_extend 32) (currentByte!3047 (_2!2514 lt!81946))) ((_ sign_extend 32) (currentBit!3042 (_2!2514 lt!81946))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!81945 () Unit!3688)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1976 BitStream!1976 (_ BitVec 64) (_ BitVec 64)) Unit!3688)

(assert (=> b!52905 (= lt!81945 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2514 lt!81946) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2501)

(declare-fun appendBitFromByte!0 (BitStream!1976 (_ BitVec 8) (_ BitVec 32)) tuple2!4818)

(assert (=> b!52905 (= lt!81946 (appendBitFromByte!0 thiss!1379 (select (arr!1678 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!52906 () Bool)

(declare-fun res!44185 () Bool)

(assert (=> b!52906 (=> (not res!44185) (not e!35241))))

(assert (=> b!52906 (= res!44185 (validate_offset_bits!1 ((_ sign_extend 32) (size!1142 (buf!1492 thiss!1379))) ((_ sign_extend 32) (currentByte!3047 thiss!1379)) ((_ sign_extend 32) (currentBit!3042 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52903 () Bool)

(assert (=> b!52903 (= e!35246 (= (size!1142 (buf!1492 thiss!1379)) (size!1142 (buf!1492 (_2!2514 lt!81946)))))))

(declare-datatypes ((tuple2!4820 0))(
  ( (tuple2!4821 (_1!2515 BitStream!1976) (_2!2515 BitStream!1976)) )
))
(declare-fun lt!81949 () tuple2!4820)

(declare-fun reader!0 (BitStream!1976 BitStream!1976) tuple2!4820)

(assert (=> b!52903 (= lt!81949 (reader!0 thiss!1379 (_2!2514 lt!81946)))))

(declare-fun res!44187 () Bool)

(assert (=> start!10558 (=> (not res!44187) (not e!35241))))

(assert (=> start!10558 (= res!44187 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1142 srcBuffer!2))))))))

(assert (=> start!10558 e!35241))

(assert (=> start!10558 true))

(assert (=> start!10558 (array_inv!1047 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1976) Bool)

(assert (=> start!10558 (and (inv!12 thiss!1379) e!35245)))

(assert (= (and start!10558 res!44187) b!52906))

(assert (= (and b!52906 res!44185) b!52902))

(assert (= (and b!52902 (not res!44184)) b!52905))

(assert (= (and b!52905 (not res!44186)) b!52903))

(assert (= start!10558 b!52904))

(declare-fun m!83333 () Bool)

(assert (=> b!52902 m!83333))

(declare-fun m!83335 () Bool)

(assert (=> b!52902 m!83335))

(declare-fun m!83337 () Bool)

(assert (=> b!52902 m!83337))

(declare-fun m!83339 () Bool)

(assert (=> b!52904 m!83339))

(declare-fun m!83341 () Bool)

(assert (=> b!52906 m!83341))

(declare-fun m!83343 () Bool)

(assert (=> start!10558 m!83343))

(declare-fun m!83345 () Bool)

(assert (=> start!10558 m!83345))

(declare-fun m!83347 () Bool)

(assert (=> b!52905 m!83347))

(declare-fun m!83349 () Bool)

(assert (=> b!52905 m!83349))

(assert (=> b!52905 m!83349))

(declare-fun m!83351 () Bool)

(assert (=> b!52905 m!83351))

(declare-fun m!83353 () Bool)

(assert (=> b!52905 m!83353))

(declare-fun m!83355 () Bool)

(assert (=> b!52905 m!83355))

(declare-fun m!83357 () Bool)

(assert (=> b!52903 m!83357))

(push 1)

(assert (not b!52903))

(assert (not b!52906))

(assert (not b!52902))

(assert (not b!52904))

(assert (not b!52905))

(assert (not start!10558))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!16778 () Bool)

(assert (=> d!16778 (= (array_inv!1047 (buf!1492 thiss!1379)) (bvsge (size!1142 (buf!1492 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!52904 d!16778))

(declare-fun b!52965 () Bool)

(declare-fun e!35281 () Unit!3688)

(declare-fun lt!82095 () Unit!3688)

(assert (=> b!52965 (= e!35281 lt!82095)))

(declare-fun lt!82091 () (_ BitVec 64))

(assert (=> b!52965 (= lt!82091 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!82089 () (_ BitVec 64))

(assert (=> b!52965 (= lt!82089 (bitIndex!0 (size!1142 (buf!1492 thiss!1379)) (currentByte!3047 thiss!1379) (currentBit!3042 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2501 array!2501 (_ BitVec 64) (_ BitVec 64)) Unit!3688)

(assert (=> b!52965 (= lt!82095 (arrayBitRangesEqSymmetric!0 (buf!1492 thiss!1379) (buf!1492 (_2!2514 lt!81946)) lt!82091 lt!82089))))

(declare-fun arrayBitRangesEq!0 (array!2501 array!2501 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52965 (arrayBitRangesEq!0 (buf!1492 (_2!2514 lt!81946)) (buf!1492 thiss!1379) lt!82091 lt!82089)))

(declare-fun d!16780 () Bool)

(declare-fun e!35280 () Bool)

(assert (=> d!16780 e!35280))

(declare-fun res!44238 () Bool)

(assert (=> d!16780 (=> (not res!44238) (not e!35280))))

(declare-fun lt!82079 () tuple2!4820)

(assert (=> d!16780 (= res!44238 (isPrefixOf!0 (_1!2515 lt!82079) (_2!2515 lt!82079)))))

(declare-fun lt!82077 () BitStream!1976)

(assert (=> d!16780 (= lt!82079 (tuple2!4821 lt!82077 (_2!2514 lt!81946)))))

(declare-fun lt!82085 () Unit!3688)

(declare-fun lt!82092 () Unit!3688)

(assert (=> d!16780 (= lt!82085 lt!82092)))

(assert (=> d!16780 (isPrefixOf!0 lt!82077 (_2!2514 lt!81946))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1976 BitStream!1976 BitStream!1976) Unit!3688)

(assert (=> d!16780 (= lt!82092 (lemmaIsPrefixTransitive!0 lt!82077 (_2!2514 lt!81946) (_2!2514 lt!81946)))))

(declare-fun lt!82094 () Unit!3688)

(declare-fun lt!82080 () Unit!3688)

(assert (=> d!16780 (= lt!82094 lt!82080)))

(assert (=> d!16780 (isPrefixOf!0 lt!82077 (_2!2514 lt!81946))))

(assert (=> d!16780 (= lt!82080 (lemmaIsPrefixTransitive!0 lt!82077 thiss!1379 (_2!2514 lt!81946)))))

(declare-fun lt!82083 () Unit!3688)

(assert (=> d!16780 (= lt!82083 e!35281)))

(declare-fun c!3750 () Bool)

(assert (=> d!16780 (= c!3750 (not (= (size!1142 (buf!1492 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!82086 () Unit!3688)

(declare-fun lt!82082 () Unit!3688)

(assert (=> d!16780 (= lt!82086 lt!82082)))

(assert (=> d!16780 (isPrefixOf!0 (_2!2514 lt!81946) (_2!2514 lt!81946))))

(assert (=> d!16780 (= lt!82082 (lemmaIsPrefixRefl!0 (_2!2514 lt!81946)))))

(declare-fun lt!82084 () Unit!3688)

(declare-fun lt!82093 () Unit!3688)

(assert (=> d!16780 (= lt!82084 lt!82093)))

(assert (=> d!16780 (= lt!82093 (lemmaIsPrefixRefl!0 (_2!2514 lt!81946)))))

(declare-fun lt!82078 () Unit!3688)

(declare-fun lt!82088 () Unit!3688)

(assert (=> d!16780 (= lt!82078 lt!82088)))

(assert (=> d!16780 (isPrefixOf!0 lt!82077 lt!82077)))

(assert (=> d!16780 (= lt!82088 (lemmaIsPrefixRefl!0 lt!82077))))

(declare-fun lt!82087 () Unit!3688)

(declare-fun lt!82096 () Unit!3688)

(assert (=> d!16780 (= lt!82087 lt!82096)))

(assert (=> d!16780 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16780 (= lt!82096 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16780 (= lt!82077 (BitStream!1977 (buf!1492 (_2!2514 lt!81946)) (currentByte!3047 thiss!1379) (currentBit!3042 thiss!1379)))))

(assert (=> d!16780 (isPrefixOf!0 thiss!1379 (_2!2514 lt!81946))))

(assert (=> d!16780 (= (reader!0 thiss!1379 (_2!2514 lt!81946)) lt!82079)))

(declare-fun b!52966 () Bool)

(declare-fun res!44237 () Bool)

(assert (=> b!52966 (=> (not res!44237) (not e!35280))))

(assert (=> b!52966 (= res!44237 (isPrefixOf!0 (_1!2515 lt!82079) thiss!1379))))

(declare-fun b!52967 () Bool)

(declare-fun Unit!3692 () Unit!3688)

(assert (=> b!52967 (= e!35281 Unit!3692)))

(declare-fun b!52968 () Bool)

(declare-fun res!44236 () Bool)

(assert (=> b!52968 (=> (not res!44236) (not e!35280))))

(assert (=> b!52968 (= res!44236 (isPrefixOf!0 (_2!2515 lt!82079) (_2!2514 lt!81946)))))

(declare-fun lt!82090 () (_ BitVec 64))

(declare-fun b!52969 () Bool)

(declare-fun lt!82081 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1976 (_ BitVec 64)) BitStream!1976)

(assert (=> b!52969 (= e!35280 (= (_1!2515 lt!82079) (withMovedBitIndex!0 (_2!2515 lt!82079) (bvsub lt!82081 lt!82090))))))

(assert (=> b!52969 (or (= (bvand lt!82081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!82090 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!82081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!82081 lt!82090) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!52969 (= lt!82090 (bitIndex!0 (size!1142 (buf!1492 (_2!2514 lt!81946))) (currentByte!3047 (_2!2514 lt!81946)) (currentBit!3042 (_2!2514 lt!81946))))))

(assert (=> b!52969 (= lt!82081 (bitIndex!0 (size!1142 (buf!1492 thiss!1379)) (currentByte!3047 thiss!1379) (currentBit!3042 thiss!1379)))))

(assert (= (and d!16780 c!3750) b!52965))

(assert (= (and d!16780 (not c!3750)) b!52967))

(assert (= (and d!16780 res!44238) b!52966))

(assert (= (and b!52966 res!44237) b!52968))

(assert (= (and b!52968 res!44236) b!52969))

(assert (=> d!16780 m!83335))

(declare-fun m!83413 () Bool)

(assert (=> d!16780 m!83413))

(declare-fun m!83415 () Bool)

(assert (=> d!16780 m!83415))

(assert (=> d!16780 m!83347))

(assert (=> d!16780 m!83333))

(declare-fun m!83417 () Bool)

(assert (=> d!16780 m!83417))

(declare-fun m!83419 () Bool)

(assert (=> d!16780 m!83419))

(declare-fun m!83421 () Bool)

(assert (=> d!16780 m!83421))

(declare-fun m!83423 () Bool)

(assert (=> d!16780 m!83423))

(declare-fun m!83425 () Bool)

(assert (=> d!16780 m!83425))

(declare-fun m!83427 () Bool)

(assert (=> d!16780 m!83427))

(declare-fun m!83429 () Bool)

(assert (=> b!52966 m!83429))

(assert (=> b!52965 m!83337))

(declare-fun m!83431 () Bool)

(assert (=> b!52965 m!83431))

(declare-fun m!83433 () Bool)

(assert (=> b!52965 m!83433))

(declare-fun m!83435 () Bool)

(assert (=> b!52969 m!83435))

(declare-fun m!83437 () Bool)

(assert (=> b!52969 m!83437))

(assert (=> b!52969 m!83337))

(declare-fun m!83439 () Bool)

(assert (=> b!52968 m!83439))

(assert (=> b!52903 d!16780))

(declare-fun d!16790 () Bool)

(declare-fun res!44262 () Bool)

(declare-fun e!35295 () Bool)

(assert (=> d!16790 (=> (not res!44262) (not e!35295))))

(assert (=> d!16790 (= res!44262 (= (size!1142 (buf!1492 thiss!1379)) (size!1142 (buf!1492 thiss!1379))))))

(assert (=> d!16790 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!35295)))

(declare-fun b!52993 () Bool)

(declare-fun res!44263 () Bool)

(assert (=> b!52993 (=> (not res!44263) (not e!35295))))

(assert (=> b!52993 (= res!44263 (bvsle (bitIndex!0 (size!1142 (buf!1492 thiss!1379)) (currentByte!3047 thiss!1379) (currentBit!3042 thiss!1379)) (bitIndex!0 (size!1142 (buf!1492 thiss!1379)) (currentByte!3047 thiss!1379) (currentBit!3042 thiss!1379))))))

(declare-fun b!52994 () Bool)

(declare-fun e!35294 () Bool)

