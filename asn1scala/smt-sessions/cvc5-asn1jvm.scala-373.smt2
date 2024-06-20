; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8738 () Bool)

(assert start!8738)

(declare-fun res!36891 () Bool)

(declare-fun e!29016 () Bool)

(assert (=> start!8738 (=> (not res!36891) (not e!29016))))

(declare-datatypes ((array!2215 0))(
  ( (array!2216 (arr!1505 (Array (_ BitVec 32) (_ BitVec 8))) (size!1000 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2215)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8738 (= res!36891 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1000 srcBuffer!2))))))))

(assert (=> start!8738 e!29016))

(assert (=> start!8738 true))

(declare-fun array_inv!925 (array!2215) Bool)

(assert (=> start!8738 (array_inv!925 srcBuffer!2)))

(declare-datatypes ((BitStream!1744 0))(
  ( (BitStream!1745 (buf!1337 array!2215) (currentByte!2806 (_ BitVec 32)) (currentBit!2801 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1744)

(declare-fun e!29014 () Bool)

(declare-fun inv!12 (BitStream!1744) Bool)

(assert (=> start!8738 (and (inv!12 thiss!1379) e!29014)))

(declare-fun b!43470 () Bool)

(declare-fun e!29018 () Bool)

(assert (=> b!43470 (= e!29016 (not e!29018))))

(declare-fun res!36892 () Bool)

(assert (=> b!43470 (=> res!36892 e!29018)))

(assert (=> b!43470 (= res!36892 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1744 BitStream!1744) Bool)

(assert (=> b!43470 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3094 0))(
  ( (Unit!3095) )
))
(declare-fun lt!65878 () Unit!3094)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1744) Unit!3094)

(assert (=> b!43470 (= lt!65878 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!65874 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!43470 (= lt!65874 (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379)))))

(declare-fun b!43471 () Bool)

(declare-fun e!29015 () Bool)

(assert (=> b!43471 (= e!29018 e!29015)))

(declare-fun res!36894 () Bool)

(assert (=> b!43471 (=> res!36894 e!29015)))

(declare-datatypes ((tuple2!4262 0))(
  ( (tuple2!4263 (_1!2224 Unit!3094) (_2!2224 BitStream!1744)) )
))
(declare-fun lt!65876 () tuple2!4262)

(assert (=> b!43471 (= res!36894 (not (isPrefixOf!0 thiss!1379 (_2!2224 lt!65876))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43471 (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65876)))) ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!65876))) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!65876))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65875 () Unit!3094)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1744 BitStream!1744 (_ BitVec 64) (_ BitVec 64)) Unit!3094)

(assert (=> b!43471 (= lt!65875 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2224 lt!65876) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1744 (_ BitVec 8) (_ BitVec 32)) tuple2!4262)

(assert (=> b!43471 (= lt!65876 (appendBitFromByte!0 thiss!1379 (select (arr!1505 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!43472 () Bool)

(declare-fun res!36893 () Bool)

(declare-fun e!29019 () Bool)

(assert (=> b!43472 (=> res!36893 e!29019)))

(declare-fun lt!65877 () tuple2!4262)

(assert (=> b!43472 (= res!36893 (not (= (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!65877))) (currentByte!2806 (_2!2224 lt!65877)) (currentBit!2801 (_2!2224 lt!65877))) (bvsub (bvadd lt!65874 to!314) i!635))))))

(declare-fun b!43473 () Bool)

(declare-fun e!29020 () Bool)

(declare-datatypes ((tuple2!4264 0))(
  ( (tuple2!4265 (_1!2225 BitStream!1744) (_2!2225 BitStream!1744)) )
))
(declare-fun lt!65873 () tuple2!4264)

(declare-datatypes ((List!513 0))(
  ( (Nil!510) (Cons!509 (h!628 Bool) (t!1263 List!513)) )
))
(declare-fun head!332 (List!513) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1744 array!2215 (_ BitVec 64) (_ BitVec 64)) List!513)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1744 BitStream!1744 (_ BitVec 64)) List!513)

(assert (=> b!43473 (= e!29020 (= (head!332 (byteArrayBitContentToList!0 (_2!2224 lt!65876) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!332 (bitStreamReadBitsIntoList!0 (_2!2224 lt!65876) (_1!2225 lt!65873) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!43474 () Bool)

(declare-fun res!36897 () Bool)

(assert (=> b!43474 (=> (not res!36897) (not e!29016))))

(assert (=> b!43474 (= res!36897 (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 thiss!1379))) ((_ sign_extend 32) (currentByte!2806 thiss!1379)) ((_ sign_extend 32) (currentBit!2801 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!43475 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!43475 (= e!29019 (invariant!0 (currentBit!2801 (_2!2224 lt!65877)) (currentByte!2806 (_2!2224 lt!65877)) (size!1000 (buf!1337 (_2!2224 lt!65877)))))))

(declare-fun b!43476 () Bool)

(assert (=> b!43476 (= e!29015 e!29019)))

(declare-fun res!36895 () Bool)

(assert (=> b!43476 (=> res!36895 e!29019)))

(assert (=> b!43476 (= res!36895 (not (isPrefixOf!0 (_2!2224 lt!65876) (_2!2224 lt!65877))))))

(assert (=> b!43476 (isPrefixOf!0 thiss!1379 (_2!2224 lt!65877))))

(declare-fun lt!65872 () Unit!3094)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1744 BitStream!1744 BitStream!1744) Unit!3094)

(assert (=> b!43476 (= lt!65872 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2224 lt!65876) (_2!2224 lt!65877)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1744 array!2215 (_ BitVec 64) (_ BitVec 64)) tuple2!4262)

(assert (=> b!43476 (= lt!65877 (appendBitsMSBFirstLoop!0 (_2!2224 lt!65876) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!43476 e!29020))

(declare-fun res!36896 () Bool)

(assert (=> b!43476 (=> (not res!36896) (not e!29020))))

(assert (=> b!43476 (= res!36896 (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65876)))) ((_ sign_extend 32) (currentByte!2806 thiss!1379)) ((_ sign_extend 32) (currentBit!2801 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!65871 () Unit!3094)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1744 array!2215 (_ BitVec 64)) Unit!3094)

(assert (=> b!43476 (= lt!65871 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1337 (_2!2224 lt!65876)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1744 BitStream!1744) tuple2!4264)

(assert (=> b!43476 (= lt!65873 (reader!0 thiss!1379 (_2!2224 lt!65876)))))

(declare-fun b!43477 () Bool)

(assert (=> b!43477 (= e!29014 (array_inv!925 (buf!1337 thiss!1379)))))

(assert (= (and start!8738 res!36891) b!43474))

(assert (= (and b!43474 res!36897) b!43470))

(assert (= (and b!43470 (not res!36892)) b!43471))

(assert (= (and b!43471 (not res!36894)) b!43476))

(assert (= (and b!43476 res!36896) b!43473))

(assert (= (and b!43476 (not res!36895)) b!43472))

(assert (= (and b!43472 (not res!36893)) b!43475))

(assert (= start!8738 b!43477))

(declare-fun m!66139 () Bool)

(assert (=> b!43475 m!66139))

(declare-fun m!66141 () Bool)

(assert (=> b!43476 m!66141))

(declare-fun m!66143 () Bool)

(assert (=> b!43476 m!66143))

(declare-fun m!66145 () Bool)

(assert (=> b!43476 m!66145))

(declare-fun m!66147 () Bool)

(assert (=> b!43476 m!66147))

(declare-fun m!66149 () Bool)

(assert (=> b!43476 m!66149))

(declare-fun m!66151 () Bool)

(assert (=> b!43476 m!66151))

(declare-fun m!66153 () Bool)

(assert (=> b!43476 m!66153))

(declare-fun m!66155 () Bool)

(assert (=> b!43474 m!66155))

(declare-fun m!66157 () Bool)

(assert (=> b!43477 m!66157))

(declare-fun m!66159 () Bool)

(assert (=> b!43473 m!66159))

(assert (=> b!43473 m!66159))

(declare-fun m!66161 () Bool)

(assert (=> b!43473 m!66161))

(declare-fun m!66163 () Bool)

(assert (=> b!43473 m!66163))

(assert (=> b!43473 m!66163))

(declare-fun m!66165 () Bool)

(assert (=> b!43473 m!66165))

(declare-fun m!66167 () Bool)

(assert (=> b!43470 m!66167))

(declare-fun m!66169 () Bool)

(assert (=> b!43470 m!66169))

(declare-fun m!66171 () Bool)

(assert (=> b!43470 m!66171))

(declare-fun m!66173 () Bool)

(assert (=> b!43471 m!66173))

(declare-fun m!66175 () Bool)

(assert (=> b!43471 m!66175))

(declare-fun m!66177 () Bool)

(assert (=> b!43471 m!66177))

(declare-fun m!66179 () Bool)

(assert (=> b!43471 m!66179))

(assert (=> b!43471 m!66177))

(declare-fun m!66181 () Bool)

(assert (=> b!43471 m!66181))

(declare-fun m!66183 () Bool)

(assert (=> b!43472 m!66183))

(declare-fun m!66185 () Bool)

(assert (=> start!8738 m!66185))

(declare-fun m!66187 () Bool)

(assert (=> start!8738 m!66187))

(push 1)

(assert (not b!43474))

(assert (not b!43470))

(assert (not b!43471))

(assert (not b!43473))

(assert (not b!43476))

(assert (not start!8738))

(assert (not b!43475))

(assert (not b!43472))

(assert (not b!43477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!12630 () Bool)

(declare-fun e!29090 () Bool)

(assert (=> d!12630 e!29090))

(declare-fun res!36956 () Bool)

(assert (=> d!12630 (=> (not res!36956) (not e!29090))))

(declare-fun lt!65956 () (_ BitVec 64))

(declare-fun lt!65954 () (_ BitVec 64))

(declare-fun lt!65955 () (_ BitVec 64))

(assert (=> d!12630 (= res!36956 (= lt!65955 (bvsub lt!65954 lt!65956)))))

(assert (=> d!12630 (or (= (bvand lt!65954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!65956 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!65954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!65954 lt!65956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!12630 (= lt!65956 (remainingBits!0 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65877)))) ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!65877))) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!65877)))))))

(declare-fun lt!65953 () (_ BitVec 64))

(declare-fun lt!65951 () (_ BitVec 64))

(assert (=> d!12630 (= lt!65954 (bvmul lt!65953 lt!65951))))

(assert (=> d!12630 (or (= lt!65953 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!65951 (bvsdiv (bvmul lt!65953 lt!65951) lt!65953)))))

(assert (=> d!12630 (= lt!65951 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12630 (= lt!65953 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65877)))))))

(assert (=> d!12630 (= lt!65955 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!65877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!65877)))))))

(assert (=> d!12630 (invariant!0 (currentBit!2801 (_2!2224 lt!65877)) (currentByte!2806 (_2!2224 lt!65877)) (size!1000 (buf!1337 (_2!2224 lt!65877))))))

(assert (=> d!12630 (= (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!65877))) (currentByte!2806 (_2!2224 lt!65877)) (currentBit!2801 (_2!2224 lt!65877))) lt!65955)))

(declare-fun b!43560 () Bool)

(declare-fun res!36957 () Bool)

(assert (=> b!43560 (=> (not res!36957) (not e!29090))))

(assert (=> b!43560 (= res!36957 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!65955))))

(declare-fun b!43561 () Bool)

(declare-fun lt!65952 () (_ BitVec 64))

(assert (=> b!43561 (= e!29090 (bvsle lt!65955 (bvmul lt!65952 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43561 (or (= lt!65952 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!65952 #b0000000000000000000000000000000000000000000000000000000000001000) lt!65952)))))

(assert (=> b!43561 (= lt!65952 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65877)))))))

(assert (= (and d!12630 res!36956) b!43560))

(assert (= (and b!43560 res!36957) b!43561))

(declare-fun m!66313 () Bool)

(assert (=> d!12630 m!66313))

(assert (=> d!12630 m!66139))

(assert (=> b!43472 d!12630))

(declare-fun d!12636 () Bool)

(assert (=> d!12636 (= (head!332 (byteArrayBitContentToList!0 (_2!2224 lt!65876) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!628 (byteArrayBitContentToList!0 (_2!2224 lt!65876) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43473 d!12636))

(declare-fun d!12638 () Bool)

(declare-fun c!2880 () Bool)

(assert (=> d!12638 (= c!2880 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!29093 () List!513)

(assert (=> d!12638 (= (byteArrayBitContentToList!0 (_2!2224 lt!65876) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!29093)))

(declare-fun b!43566 () Bool)

(assert (=> b!43566 (= e!29093 Nil!510)))

(declare-fun b!43567 () Bool)

(assert (=> b!43567 (= e!29093 (Cons!509 (not (= (bvand ((_ sign_extend 24) (select (arr!1505 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2224 lt!65876) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!12638 c!2880) b!43566))

(assert (= (and d!12638 (not c!2880)) b!43567))

(assert (=> b!43567 m!66177))

(declare-fun m!66315 () Bool)

(assert (=> b!43567 m!66315))

(declare-fun m!66317 () Bool)

(assert (=> b!43567 m!66317))

(assert (=> b!43473 d!12638))

(declare-fun d!12640 () Bool)

(assert (=> d!12640 (= (head!332 (bitStreamReadBitsIntoList!0 (_2!2224 lt!65876) (_1!2225 lt!65873) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!628 (bitStreamReadBitsIntoList!0 (_2!2224 lt!65876) (_1!2225 lt!65873) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!43473 d!12640))

(declare-fun b!43594 () Bool)

(declare-fun e!29104 () Bool)

(declare-fun lt!66025 () List!513)

(declare-fun length!218 (List!513) Int)

(assert (=> b!43594 (= e!29104 (> (length!218 lt!66025) 0))))

(declare-fun b!43591 () Bool)

(declare-datatypes ((tuple2!4284 0))(
  ( (tuple2!4285 (_1!2235 List!513) (_2!2235 BitStream!1744)) )
))
(declare-fun e!29105 () tuple2!4284)

(assert (=> b!43591 (= e!29105 (tuple2!4285 Nil!510 (_1!2225 lt!65873)))))

(declare-datatypes ((tuple2!4286 0))(
  ( (tuple2!4287 (_1!2236 Bool) (_2!2236 BitStream!1744)) )
))
(declare-fun lt!66023 () tuple2!4286)

(declare-fun lt!66024 () (_ BitVec 64))

(declare-fun b!43592 () Bool)

(assert (=> b!43592 (= e!29105 (tuple2!4285 (Cons!509 (_1!2236 lt!66023) (bitStreamReadBitsIntoList!0 (_2!2224 lt!65876) (_2!2236 lt!66023) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!66024))) (_2!2236 lt!66023)))))

(declare-fun readBit!0 (BitStream!1744) tuple2!4286)

(assert (=> b!43592 (= lt!66023 (readBit!0 (_1!2225 lt!65873)))))

(assert (=> b!43592 (= lt!66024 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!12642 () Bool)

(assert (=> d!12642 e!29104))

(declare-fun c!2888 () Bool)

(assert (=> d!12642 (= c!2888 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12642 (= lt!66025 (_1!2235 e!29105))))

(declare-fun c!2889 () Bool)

(assert (=> d!12642 (= c!2889 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!12642 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12642 (= (bitStreamReadBitsIntoList!0 (_2!2224 lt!65876) (_1!2225 lt!65873) #b0000000000000000000000000000000000000000000000000000000000000001) lt!66025)))

(declare-fun b!43593 () Bool)

(declare-fun isEmpty!120 (List!513) Bool)

(assert (=> b!43593 (= e!29104 (isEmpty!120 lt!66025))))

(assert (= (and d!12642 c!2889) b!43591))

(assert (= (and d!12642 (not c!2889)) b!43592))

(assert (= (and d!12642 c!2888) b!43593))

(assert (= (and d!12642 (not c!2888)) b!43594))

(declare-fun m!66347 () Bool)

(assert (=> b!43594 m!66347))

(declare-fun m!66349 () Bool)

(assert (=> b!43592 m!66349))

(declare-fun m!66351 () Bool)

(assert (=> b!43592 m!66351))

(declare-fun m!66353 () Bool)

(assert (=> b!43593 m!66353))

(assert (=> b!43473 d!12642))

(declare-fun d!12646 () Bool)

(declare-fun res!36993 () Bool)

(declare-fun e!29122 () Bool)

(assert (=> d!12646 (=> (not res!36993) (not e!29122))))

(assert (=> d!12646 (= res!36993 (= (size!1000 (buf!1337 thiss!1379)) (size!1000 (buf!1337 (_2!2224 lt!65876)))))))

(assert (=> d!12646 (= (isPrefixOf!0 thiss!1379 (_2!2224 lt!65876)) e!29122)))

(declare-fun b!43621 () Bool)

(declare-fun res!36992 () Bool)

(assert (=> b!43621 (=> (not res!36992) (not e!29122))))

(assert (=> b!43621 (= res!36992 (bvsle (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379)) (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!65876))) (currentByte!2806 (_2!2224 lt!65876)) (currentBit!2801 (_2!2224 lt!65876)))))))

(declare-fun b!43622 () Bool)

(declare-fun e!29123 () Bool)

(assert (=> b!43622 (= e!29122 e!29123)))

(declare-fun res!36994 () Bool)

(assert (=> b!43622 (=> res!36994 e!29123)))

(assert (=> b!43622 (= res!36994 (= (size!1000 (buf!1337 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43623 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2215 array!2215 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43623 (= e!29123 (arrayBitRangesEq!0 (buf!1337 thiss!1379) (buf!1337 (_2!2224 lt!65876)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379))))))

(assert (= (and d!12646 res!36993) b!43621))

(assert (= (and b!43621 res!36992) b!43622))

(assert (= (and b!43622 (not res!36994)) b!43623))

(assert (=> b!43621 m!66171))

(declare-fun m!66357 () Bool)

(assert (=> b!43621 m!66357))

(assert (=> b!43623 m!66171))

(assert (=> b!43623 m!66171))

(declare-fun m!66359 () Bool)

(assert (=> b!43623 m!66359))

(assert (=> b!43471 d!12646))

(declare-fun d!12650 () Bool)

(assert (=> d!12650 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65876)))) ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!65876))) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!65876))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65876)))) ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!65876))) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!65876)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3391 () Bool)

(assert (= bs!3391 d!12650))

(declare-fun m!66361 () Bool)

(assert (=> bs!3391 m!66361))

(assert (=> b!43471 d!12650))

(declare-fun d!12652 () Bool)

(declare-fun e!29132 () Bool)

(assert (=> d!12652 e!29132))

(declare-fun res!37011 () Bool)

(assert (=> d!12652 (=> (not res!37011) (not e!29132))))

(assert (=> d!12652 (= res!37011 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!66064 () Unit!3094)

(declare-fun choose!27 (BitStream!1744 BitStream!1744 (_ BitVec 64) (_ BitVec 64)) Unit!3094)

(assert (=> d!12652 (= lt!66064 (choose!27 thiss!1379 (_2!2224 lt!65876) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!12652 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!12652 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2224 lt!65876) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!66064)))

(declare-fun b!43640 () Bool)

(assert (=> b!43640 (= e!29132 (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65876)))) ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!65876))) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!65876))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!12652 res!37011) b!43640))

(declare-fun m!66381 () Bool)

(assert (=> d!12652 m!66381))

(assert (=> b!43640 m!66175))

(assert (=> b!43471 d!12652))

(declare-fun d!12654 () Bool)

(declare-fun e!29146 () Bool)

(assert (=> d!12654 e!29146))

(declare-fun res!37041 () Bool)

(assert (=> d!12654 (=> (not res!37041) (not e!29146))))

(declare-fun lt!66093 () tuple2!4262)

(assert (=> d!12654 (= res!37041 (= (size!1000 (buf!1337 (_2!2224 lt!66093))) (size!1000 (buf!1337 thiss!1379))))))

(declare-fun lt!66094 () (_ BitVec 8))

(declare-fun lt!66103 () array!2215)

(assert (=> d!12654 (= lt!66094 (select (arr!1505 lt!66103) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!12654 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1000 lt!66103)))))

(assert (=> d!12654 (= lt!66103 (array!2216 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!66101 () tuple2!4262)

(assert (=> d!12654 (= lt!66093 (tuple2!4263 (_1!2224 lt!66101) (_2!2224 lt!66101)))))

(declare-fun lt!66095 () tuple2!4262)

(assert (=> d!12654 (= lt!66101 lt!66095)))

(declare-fun e!29147 () Bool)

(assert (=> d!12654 e!29147))

(declare-fun res!37035 () Bool)

(assert (=> d!12654 (=> (not res!37035) (not e!29147))))

(assert (=> d!12654 (= res!37035 (= (size!1000 (buf!1337 thiss!1379)) (size!1000 (buf!1337 (_2!2224 lt!66095)))))))

(declare-fun lt!66098 () Bool)

(declare-fun appendBit!0 (BitStream!1744 Bool) tuple2!4262)

(assert (=> d!12654 (= lt!66095 (appendBit!0 thiss!1379 lt!66098))))

(assert (=> d!12654 (= lt!66098 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1505 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!12654 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!12654 (= (appendBitFromByte!0 thiss!1379 (select (arr!1505 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!66093)))

(declare-fun b!43664 () Bool)

(declare-fun res!37039 () Bool)

(assert (=> b!43664 (=> (not res!37039) (not e!29146))))

(assert (=> b!43664 (= res!37039 (isPrefixOf!0 thiss!1379 (_2!2224 lt!66093)))))

(declare-fun b!43665 () Bool)

(declare-fun e!29148 () Bool)

(assert (=> b!43665 (= e!29147 e!29148)))

(declare-fun res!37040 () Bool)

(assert (=> b!43665 (=> (not res!37040) (not e!29148))))

(declare-datatypes ((tuple2!4290 0))(
  ( (tuple2!4291 (_1!2238 BitStream!1744) (_2!2238 Bool)) )
))
(declare-fun lt!66100 () tuple2!4290)

(assert (=> b!43665 (= res!37040 (and (= (_2!2238 lt!66100) lt!66098) (= (_1!2238 lt!66100) (_2!2224 lt!66095))))))

(declare-fun readBitPure!0 (BitStream!1744) tuple2!4290)

(declare-fun readerFrom!0 (BitStream!1744 (_ BitVec 32) (_ BitVec 32)) BitStream!1744)

(assert (=> b!43665 (= lt!66100 (readBitPure!0 (readerFrom!0 (_2!2224 lt!66095) (currentBit!2801 thiss!1379) (currentByte!2806 thiss!1379))))))

(declare-fun b!43666 () Bool)

(declare-fun res!37036 () Bool)

(assert (=> b!43666 (=> (not res!37036) (not e!29147))))

(assert (=> b!43666 (= res!37036 (= (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!66095))) (currentByte!2806 (_2!2224 lt!66095)) (currentBit!2801 (_2!2224 lt!66095))) (bvadd (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!43667 () Bool)

(declare-fun e!29145 () Bool)

(declare-fun lt!66097 () tuple2!4290)

(assert (=> b!43667 (= e!29145 (= (bitIndex!0 (size!1000 (buf!1337 (_1!2238 lt!66097))) (currentByte!2806 (_1!2238 lt!66097)) (currentBit!2801 (_1!2238 lt!66097))) (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!66093))) (currentByte!2806 (_2!2224 lt!66093)) (currentBit!2801 (_2!2224 lt!66093)))))))

(declare-fun b!43668 () Bool)

(declare-fun res!37038 () Bool)

(assert (=> b!43668 (=> (not res!37038) (not e!29147))))

(assert (=> b!43668 (= res!37038 (isPrefixOf!0 thiss!1379 (_2!2224 lt!66095)))))

(declare-fun b!43669 () Bool)

(assert (=> b!43669 (= e!29148 (= (bitIndex!0 (size!1000 (buf!1337 (_1!2238 lt!66100))) (currentByte!2806 (_1!2238 lt!66100)) (currentBit!2801 (_1!2238 lt!66100))) (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!66095))) (currentByte!2806 (_2!2224 lt!66095)) (currentBit!2801 (_2!2224 lt!66095)))))))

(declare-fun b!43670 () Bool)

(assert (=> b!43670 (= e!29146 e!29145)))

(declare-fun res!37037 () Bool)

(assert (=> b!43670 (=> (not res!37037) (not e!29145))))

(assert (=> b!43670 (= res!37037 (and (= (_2!2238 lt!66097) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1505 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!66094)) #b00000000000000000000000000000000))) (= (_1!2238 lt!66097) (_2!2224 lt!66093))))))

(declare-datatypes ((tuple2!4292 0))(
  ( (tuple2!4293 (_1!2239 array!2215) (_2!2239 BitStream!1744)) )
))
(declare-fun lt!66096 () tuple2!4292)

(declare-fun lt!66099 () BitStream!1744)

(declare-fun readBits!0 (BitStream!1744 (_ BitVec 64)) tuple2!4292)

(assert (=> b!43670 (= lt!66096 (readBits!0 lt!66099 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!43670 (= lt!66097 (readBitPure!0 lt!66099))))

(assert (=> b!43670 (= lt!66099 (readerFrom!0 (_2!2224 lt!66093) (currentBit!2801 thiss!1379) (currentByte!2806 thiss!1379)))))

(declare-fun b!43671 () Bool)

(declare-fun res!37034 () Bool)

(assert (=> b!43671 (=> (not res!37034) (not e!29146))))

(declare-fun lt!66102 () (_ BitVec 64))

(declare-fun lt!66092 () (_ BitVec 64))

(assert (=> b!43671 (= res!37034 (= (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!66093))) (currentByte!2806 (_2!2224 lt!66093)) (currentBit!2801 (_2!2224 lt!66093))) (bvadd lt!66092 lt!66102)))))

(assert (=> b!43671 (or (not (= (bvand lt!66092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66102 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!66092 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!66092 lt!66102) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43671 (= lt!66102 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!43671 (= lt!66092 (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379)))))

(assert (= (and d!12654 res!37035) b!43666))

(assert (= (and b!43666 res!37036) b!43668))

(assert (= (and b!43668 res!37038) b!43665))

(assert (= (and b!43665 res!37040) b!43669))

(assert (= (and d!12654 res!37041) b!43671))

(assert (= (and b!43671 res!37034) b!43664))

(assert (= (and b!43664 res!37039) b!43670))

(assert (= (and b!43670 res!37037) b!43667))

(declare-fun m!66397 () Bool)

(assert (=> b!43670 m!66397))

(declare-fun m!66399 () Bool)

(assert (=> b!43670 m!66399))

(declare-fun m!66401 () Bool)

(assert (=> b!43670 m!66401))

(declare-fun m!66403 () Bool)

(assert (=> b!43664 m!66403))

(declare-fun m!66405 () Bool)

(assert (=> b!43665 m!66405))

(assert (=> b!43665 m!66405))

(declare-fun m!66407 () Bool)

(assert (=> b!43665 m!66407))

(declare-fun m!66409 () Bool)

(assert (=> b!43666 m!66409))

(assert (=> b!43666 m!66171))

(declare-fun m!66411 () Bool)

(assert (=> b!43669 m!66411))

(assert (=> b!43669 m!66409))

(declare-fun m!66413 () Bool)

(assert (=> b!43671 m!66413))

(assert (=> b!43671 m!66171))

(declare-fun m!66415 () Bool)

(assert (=> b!43667 m!66415))

(assert (=> b!43667 m!66413))

(declare-fun m!66417 () Bool)

(assert (=> d!12654 m!66417))

(declare-fun m!66419 () Bool)

(assert (=> d!12654 m!66419))

(assert (=> d!12654 m!66315))

(declare-fun m!66421 () Bool)

(assert (=> b!43668 m!66421))

(assert (=> b!43471 d!12654))

(declare-fun d!12664 () Bool)

(assert (=> d!12664 (isPrefixOf!0 thiss!1379 (_2!2224 lt!65877))))

(declare-fun lt!66106 () Unit!3094)

(declare-fun choose!30 (BitStream!1744 BitStream!1744 BitStream!1744) Unit!3094)

(assert (=> d!12664 (= lt!66106 (choose!30 thiss!1379 (_2!2224 lt!65876) (_2!2224 lt!65877)))))

(assert (=> d!12664 (isPrefixOf!0 thiss!1379 (_2!2224 lt!65876))))

(assert (=> d!12664 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2224 lt!65876) (_2!2224 lt!65877)) lt!66106)))

(declare-fun bs!3393 () Bool)

(assert (= bs!3393 d!12664))

(assert (=> bs!3393 m!66153))

(declare-fun m!66423 () Bool)

(assert (=> bs!3393 m!66423))

(assert (=> bs!3393 m!66173))

(assert (=> b!43476 d!12664))

(declare-fun d!12666 () Bool)

(declare-fun res!37043 () Bool)

(declare-fun e!29149 () Bool)

(assert (=> d!12666 (=> (not res!37043) (not e!29149))))

(assert (=> d!12666 (= res!37043 (= (size!1000 (buf!1337 thiss!1379)) (size!1000 (buf!1337 (_2!2224 lt!65877)))))))

(assert (=> d!12666 (= (isPrefixOf!0 thiss!1379 (_2!2224 lt!65877)) e!29149)))

(declare-fun b!43672 () Bool)

(declare-fun res!37042 () Bool)

(assert (=> b!43672 (=> (not res!37042) (not e!29149))))

(assert (=> b!43672 (= res!37042 (bvsle (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379)) (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!65877))) (currentByte!2806 (_2!2224 lt!65877)) (currentBit!2801 (_2!2224 lt!65877)))))))

(declare-fun b!43673 () Bool)

(declare-fun e!29150 () Bool)

(assert (=> b!43673 (= e!29149 e!29150)))

(declare-fun res!37044 () Bool)

(assert (=> b!43673 (=> res!37044 e!29150)))

(assert (=> b!43673 (= res!37044 (= (size!1000 (buf!1337 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43674 () Bool)

(assert (=> b!43674 (= e!29150 (arrayBitRangesEq!0 (buf!1337 thiss!1379) (buf!1337 (_2!2224 lt!65877)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379))))))

(assert (= (and d!12666 res!37043) b!43672))

(assert (= (and b!43672 res!37042) b!43673))

(assert (= (and b!43673 (not res!37044)) b!43674))

(assert (=> b!43672 m!66171))

(assert (=> b!43672 m!66183))

(assert (=> b!43674 m!66171))

(assert (=> b!43674 m!66171))

(declare-fun m!66425 () Bool)

(assert (=> b!43674 m!66425))

(assert (=> b!43476 d!12666))

(declare-fun d!12668 () Bool)

(assert (=> d!12668 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65876)))) ((_ sign_extend 32) (currentByte!2806 thiss!1379)) ((_ sign_extend 32) (currentBit!2801 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65876)))) ((_ sign_extend 32) (currentByte!2806 thiss!1379)) ((_ sign_extend 32) (currentBit!2801 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3394 () Bool)

(assert (= bs!3394 d!12668))

(declare-fun m!66427 () Bool)

(assert (=> bs!3394 m!66427))

(assert (=> b!43476 d!12668))

(declare-fun b!43685 () Bool)

(declare-fun res!37051 () Bool)

(declare-fun e!29155 () Bool)

(assert (=> b!43685 (=> (not res!37051) (not e!29155))))

(declare-fun lt!66162 () tuple2!4264)

(assert (=> b!43685 (= res!37051 (isPrefixOf!0 (_2!2225 lt!66162) (_2!2224 lt!65876)))))

(declare-fun b!43686 () Bool)

(declare-fun e!29156 () Unit!3094)

(declare-fun Unit!3116 () Unit!3094)

(assert (=> b!43686 (= e!29156 Unit!3116)))

(declare-fun d!12670 () Bool)

(assert (=> d!12670 e!29155))

(declare-fun res!37053 () Bool)

(assert (=> d!12670 (=> (not res!37053) (not e!29155))))

(assert (=> d!12670 (= res!37053 (isPrefixOf!0 (_1!2225 lt!66162) (_2!2225 lt!66162)))))

(declare-fun lt!66150 () BitStream!1744)

(assert (=> d!12670 (= lt!66162 (tuple2!4265 lt!66150 (_2!2224 lt!65876)))))

(declare-fun lt!66147 () Unit!3094)

(declare-fun lt!66155 () Unit!3094)

(assert (=> d!12670 (= lt!66147 lt!66155)))

(assert (=> d!12670 (isPrefixOf!0 lt!66150 (_2!2224 lt!65876))))

(assert (=> d!12670 (= lt!66155 (lemmaIsPrefixTransitive!0 lt!66150 (_2!2224 lt!65876) (_2!2224 lt!65876)))))

(declare-fun lt!66151 () Unit!3094)

(declare-fun lt!66149 () Unit!3094)

(assert (=> d!12670 (= lt!66151 lt!66149)))

(assert (=> d!12670 (isPrefixOf!0 lt!66150 (_2!2224 lt!65876))))

(assert (=> d!12670 (= lt!66149 (lemmaIsPrefixTransitive!0 lt!66150 thiss!1379 (_2!2224 lt!65876)))))

(declare-fun lt!66153 () Unit!3094)

(assert (=> d!12670 (= lt!66153 e!29156)))

(declare-fun c!2892 () Bool)

(assert (=> d!12670 (= c!2892 (not (= (size!1000 (buf!1337 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!66148 () Unit!3094)

(declare-fun lt!66166 () Unit!3094)

(assert (=> d!12670 (= lt!66148 lt!66166)))

(assert (=> d!12670 (isPrefixOf!0 (_2!2224 lt!65876) (_2!2224 lt!65876))))

(assert (=> d!12670 (= lt!66166 (lemmaIsPrefixRefl!0 (_2!2224 lt!65876)))))

(declare-fun lt!66161 () Unit!3094)

(declare-fun lt!66159 () Unit!3094)

(assert (=> d!12670 (= lt!66161 lt!66159)))

(assert (=> d!12670 (= lt!66159 (lemmaIsPrefixRefl!0 (_2!2224 lt!65876)))))

(declare-fun lt!66154 () Unit!3094)

(declare-fun lt!66157 () Unit!3094)

(assert (=> d!12670 (= lt!66154 lt!66157)))

(assert (=> d!12670 (isPrefixOf!0 lt!66150 lt!66150)))

(assert (=> d!12670 (= lt!66157 (lemmaIsPrefixRefl!0 lt!66150))))

(declare-fun lt!66163 () Unit!3094)

(declare-fun lt!66158 () Unit!3094)

(assert (=> d!12670 (= lt!66163 lt!66158)))

(assert (=> d!12670 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!12670 (= lt!66158 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!12670 (= lt!66150 (BitStream!1745 (buf!1337 (_2!2224 lt!65876)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379)))))

(assert (=> d!12670 (isPrefixOf!0 thiss!1379 (_2!2224 lt!65876))))

(assert (=> d!12670 (= (reader!0 thiss!1379 (_2!2224 lt!65876)) lt!66162)))

(declare-fun lt!66152 () (_ BitVec 64))

(declare-fun lt!66160 () (_ BitVec 64))

(declare-fun b!43687 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1744 (_ BitVec 64)) BitStream!1744)

(assert (=> b!43687 (= e!29155 (= (_1!2225 lt!66162) (withMovedBitIndex!0 (_2!2225 lt!66162) (bvsub lt!66152 lt!66160))))))

(assert (=> b!43687 (or (= (bvand lt!66152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66160 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66152 lt!66160) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43687 (= lt!66160 (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!65876))) (currentByte!2806 (_2!2224 lt!65876)) (currentBit!2801 (_2!2224 lt!65876))))))

(assert (=> b!43687 (= lt!66152 (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379)))))

(declare-fun b!43688 () Bool)

(declare-fun lt!66164 () Unit!3094)

(assert (=> b!43688 (= e!29156 lt!66164)))

(declare-fun lt!66165 () (_ BitVec 64))

(assert (=> b!43688 (= lt!66165 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66156 () (_ BitVec 64))

(assert (=> b!43688 (= lt!66156 (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2215 array!2215 (_ BitVec 64) (_ BitVec 64)) Unit!3094)

(assert (=> b!43688 (= lt!66164 (arrayBitRangesEqSymmetric!0 (buf!1337 thiss!1379) (buf!1337 (_2!2224 lt!65876)) lt!66165 lt!66156))))

(assert (=> b!43688 (arrayBitRangesEq!0 (buf!1337 (_2!2224 lt!65876)) (buf!1337 thiss!1379) lt!66165 lt!66156)))

(declare-fun b!43689 () Bool)

(declare-fun res!37052 () Bool)

(assert (=> b!43689 (=> (not res!37052) (not e!29155))))

(assert (=> b!43689 (= res!37052 (isPrefixOf!0 (_1!2225 lt!66162) thiss!1379))))

(assert (= (and d!12670 c!2892) b!43688))

(assert (= (and d!12670 (not c!2892)) b!43686))

(assert (= (and d!12670 res!37053) b!43689))

(assert (= (and b!43689 res!37052) b!43685))

(assert (= (and b!43685 res!37051) b!43687))

(declare-fun m!66429 () Bool)

(assert (=> b!43685 m!66429))

(assert (=> b!43688 m!66171))

(declare-fun m!66431 () Bool)

(assert (=> b!43688 m!66431))

(declare-fun m!66433 () Bool)

(assert (=> b!43688 m!66433))

(declare-fun m!66435 () Bool)

(assert (=> d!12670 m!66435))

(assert (=> d!12670 m!66169))

(declare-fun m!66437 () Bool)

(assert (=> d!12670 m!66437))

(declare-fun m!66439 () Bool)

(assert (=> d!12670 m!66439))

(declare-fun m!66441 () Bool)

(assert (=> d!12670 m!66441))

(declare-fun m!66443 () Bool)

(assert (=> d!12670 m!66443))

(assert (=> d!12670 m!66173))

(declare-fun m!66445 () Bool)

(assert (=> d!12670 m!66445))

(assert (=> d!12670 m!66167))

(declare-fun m!66447 () Bool)

(assert (=> d!12670 m!66447))

(declare-fun m!66449 () Bool)

(assert (=> d!12670 m!66449))

(declare-fun m!66451 () Bool)

(assert (=> b!43689 m!66451))

(declare-fun m!66453 () Bool)

(assert (=> b!43687 m!66453))

(assert (=> b!43687 m!66357))

(assert (=> b!43687 m!66171))

(assert (=> b!43476 d!12670))

(declare-fun b!43843 () Bool)

(declare-fun res!37169 () Bool)

(declare-fun e!29227 () Bool)

(assert (=> b!43843 (=> (not res!37169) (not e!29227))))

(declare-fun lt!66713 () tuple2!4262)

(assert (=> b!43843 (= res!37169 (isPrefixOf!0 (_2!2224 lt!65876) (_2!2224 lt!66713)))))

(declare-fun b!43844 () Bool)

(declare-fun res!37166 () Bool)

(assert (=> b!43844 (=> (not res!37166) (not e!29227))))

(assert (=> b!43844 (= res!37166 (= (size!1000 (buf!1337 (_2!2224 lt!66713))) (size!1000 (buf!1337 (_2!2224 lt!65876)))))))

(declare-fun b!43845 () Bool)

(declare-fun e!29229 () tuple2!4262)

(declare-fun Unit!3117 () Unit!3094)

(assert (=> b!43845 (= e!29229 (tuple2!4263 Unit!3117 (_2!2224 lt!65876)))))

(assert (=> b!43845 (= (size!1000 (buf!1337 (_2!2224 lt!65876))) (size!1000 (buf!1337 (_2!2224 lt!65876))))))

(declare-fun lt!66699 () Unit!3094)

(declare-fun Unit!3118 () Unit!3094)

(assert (=> b!43845 (= lt!66699 Unit!3118)))

(declare-fun call!517 () tuple2!4264)

(declare-fun checkByteArrayBitContent!0 (BitStream!1744 array!2215 array!2215 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!43845 (checkByteArrayBitContent!0 (_2!2224 lt!65876) srcBuffer!2 (_1!2239 (readBits!0 (_1!2225 call!517) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!43846 () Bool)

(declare-fun e!29228 () Bool)

(declare-fun lt!66725 () (_ BitVec 64))

(assert (=> b!43846 (= e!29228 (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65876)))) ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!65876))) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!65876))) lt!66725))))

(declare-fun d!12672 () Bool)

(assert (=> d!12672 e!29227))

(declare-fun res!37168 () Bool)

(assert (=> d!12672 (=> (not res!37168) (not e!29227))))

(declare-fun lt!66702 () (_ BitVec 64))

(assert (=> d!12672 (= res!37168 (= (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!66713))) (currentByte!2806 (_2!2224 lt!66713)) (currentBit!2801 (_2!2224 lt!66713))) (bvsub lt!66702 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!12672 (or (= (bvand lt!66702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66702 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!66697 () (_ BitVec 64))

(assert (=> d!12672 (= lt!66702 (bvadd lt!66697 to!314))))

(assert (=> d!12672 (or (not (= (bvand lt!66697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!66697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!66697 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12672 (= lt!66697 (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!65876))) (currentByte!2806 (_2!2224 lt!65876)) (currentBit!2801 (_2!2224 lt!65876))))))

(assert (=> d!12672 (= lt!66713 e!29229)))

(declare-fun c!2913 () Bool)

(assert (=> d!12672 (= c!2913 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!66709 () Unit!3094)

(declare-fun lt!66692 () Unit!3094)

(assert (=> d!12672 (= lt!66709 lt!66692)))

(assert (=> d!12672 (isPrefixOf!0 (_2!2224 lt!65876) (_2!2224 lt!65876))))

(assert (=> d!12672 (= lt!66692 (lemmaIsPrefixRefl!0 (_2!2224 lt!65876)))))

(declare-fun lt!66716 () (_ BitVec 64))

(assert (=> d!12672 (= lt!66716 (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!65876))) (currentByte!2806 (_2!2224 lt!65876)) (currentBit!2801 (_2!2224 lt!65876))))))

(assert (=> d!12672 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!12672 (= (appendBitsMSBFirstLoop!0 (_2!2224 lt!65876) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!66713)))

(declare-fun b!43847 () Bool)

(declare-fun res!37170 () Bool)

(assert (=> b!43847 (=> (not res!37170) (not e!29227))))

(assert (=> b!43847 (= res!37170 (= (size!1000 (buf!1337 (_2!2224 lt!65876))) (size!1000 (buf!1337 (_2!2224 lt!66713)))))))

(declare-fun b!43848 () Bool)

(declare-fun lt!66733 () tuple2!4262)

(declare-fun Unit!3119 () Unit!3094)

(assert (=> b!43848 (= e!29229 (tuple2!4263 Unit!3119 (_2!2224 lt!66733)))))

(declare-fun lt!66693 () tuple2!4262)

(assert (=> b!43848 (= lt!66693 (appendBitFromByte!0 (_2!2224 lt!65876) (select (arr!1505 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!66717 () (_ BitVec 64))

(assert (=> b!43848 (= lt!66717 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66704 () (_ BitVec 64))

(assert (=> b!43848 (= lt!66704 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!66727 () Unit!3094)

(assert (=> b!43848 (= lt!66727 (validateOffsetBitsIneqLemma!0 (_2!2224 lt!65876) (_2!2224 lt!66693) lt!66717 lt!66704))))

(assert (=> b!43848 (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!66693)))) ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!66693))) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!66693))) (bvsub lt!66717 lt!66704))))

(declare-fun lt!66718 () Unit!3094)

(assert (=> b!43848 (= lt!66718 lt!66727)))

(declare-fun lt!66732 () tuple2!4264)

(assert (=> b!43848 (= lt!66732 (reader!0 (_2!2224 lt!65876) (_2!2224 lt!66693)))))

(declare-fun lt!66728 () (_ BitVec 64))

(assert (=> b!43848 (= lt!66728 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!66706 () Unit!3094)

(assert (=> b!43848 (= lt!66706 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2224 lt!65876) (buf!1337 (_2!2224 lt!66693)) lt!66728))))

(assert (=> b!43848 (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!66693)))) ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!65876))) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!65876))) lt!66728)))

(declare-fun lt!66724 () Unit!3094)

(assert (=> b!43848 (= lt!66724 lt!66706)))

(assert (=> b!43848 (= (head!332 (byteArrayBitContentToList!0 (_2!2224 lt!66693) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!332 (bitStreamReadBitsIntoList!0 (_2!2224 lt!66693) (_1!2225 lt!66732) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!66696 () Unit!3094)

(declare-fun Unit!3120 () Unit!3094)

(assert (=> b!43848 (= lt!66696 Unit!3120)))

(assert (=> b!43848 (= lt!66733 (appendBitsMSBFirstLoop!0 (_2!2224 lt!66693) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!66721 () Unit!3094)

(assert (=> b!43848 (= lt!66721 (lemmaIsPrefixTransitive!0 (_2!2224 lt!65876) (_2!2224 lt!66693) (_2!2224 lt!66733)))))

(assert (=> b!43848 (isPrefixOf!0 (_2!2224 lt!65876) (_2!2224 lt!66733))))

(declare-fun lt!66698 () Unit!3094)

(assert (=> b!43848 (= lt!66698 lt!66721)))

(assert (=> b!43848 (= (size!1000 (buf!1337 (_2!2224 lt!66733))) (size!1000 (buf!1337 (_2!2224 lt!65876))))))

(declare-fun lt!66731 () Unit!3094)

(declare-fun Unit!3121 () Unit!3094)

(assert (=> b!43848 (= lt!66731 Unit!3121)))

(assert (=> b!43848 (= (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!66733))) (currentByte!2806 (_2!2224 lt!66733)) (currentBit!2801 (_2!2224 lt!66733))) (bvsub (bvadd (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!65876))) (currentByte!2806 (_2!2224 lt!65876)) (currentBit!2801 (_2!2224 lt!65876))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66729 () Unit!3094)

(declare-fun Unit!3122 () Unit!3094)

(assert (=> b!43848 (= lt!66729 Unit!3122)))

(assert (=> b!43848 (= (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!66733))) (currentByte!2806 (_2!2224 lt!66733)) (currentBit!2801 (_2!2224 lt!66733))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!66693))) (currentByte!2806 (_2!2224 lt!66693)) (currentBit!2801 (_2!2224 lt!66693))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66714 () Unit!3094)

(declare-fun Unit!3123 () Unit!3094)

(assert (=> b!43848 (= lt!66714 Unit!3123)))

(declare-fun lt!66722 () tuple2!4264)

(assert (=> b!43848 (= lt!66722 (reader!0 (_2!2224 lt!65876) (_2!2224 lt!66733)))))

(declare-fun lt!66701 () (_ BitVec 64))

(assert (=> b!43848 (= lt!66701 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66705 () Unit!3094)

(assert (=> b!43848 (= lt!66705 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2224 lt!65876) (buf!1337 (_2!2224 lt!66733)) lt!66701))))

(assert (=> b!43848 (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!66733)))) ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!65876))) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!65876))) lt!66701)))

(declare-fun lt!66730 () Unit!3094)

(assert (=> b!43848 (= lt!66730 lt!66705)))

(declare-fun lt!66723 () tuple2!4264)

(assert (=> b!43848 (= lt!66723 call!517)))

(declare-fun lt!66720 () (_ BitVec 64))

(assert (=> b!43848 (= lt!66720 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!66719 () Unit!3094)

(assert (=> b!43848 (= lt!66719 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2224 lt!66693) (buf!1337 (_2!2224 lt!66733)) lt!66720))))

(assert (=> b!43848 (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!66733)))) ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!66693))) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!66693))) lt!66720)))

(declare-fun lt!66690 () Unit!3094)

(assert (=> b!43848 (= lt!66690 lt!66719)))

(declare-fun lt!66694 () List!513)

(assert (=> b!43848 (= lt!66694 (byteArrayBitContentToList!0 (_2!2224 lt!66733) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!66703 () List!513)

(assert (=> b!43848 (= lt!66703 (byteArrayBitContentToList!0 (_2!2224 lt!66733) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!66700 () List!513)

(assert (=> b!43848 (= lt!66700 (bitStreamReadBitsIntoList!0 (_2!2224 lt!66733) (_1!2225 lt!66722) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!66708 () List!513)

(assert (=> b!43848 (= lt!66708 (bitStreamReadBitsIntoList!0 (_2!2224 lt!66733) (_1!2225 lt!66723) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!66711 () (_ BitVec 64))

(assert (=> b!43848 (= lt!66711 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!66691 () Unit!3094)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1744 BitStream!1744 BitStream!1744 BitStream!1744 (_ BitVec 64) List!513) Unit!3094)

(assert (=> b!43848 (= lt!66691 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2224 lt!66733) (_2!2224 lt!66733) (_1!2225 lt!66722) (_1!2225 lt!66723) lt!66711 lt!66700))))

(declare-fun tail!210 (List!513) List!513)

(assert (=> b!43848 (= (bitStreamReadBitsIntoList!0 (_2!2224 lt!66733) (_1!2225 lt!66723) (bvsub lt!66711 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!210 lt!66700))))

(declare-fun lt!66726 () Unit!3094)

(assert (=> b!43848 (= lt!66726 lt!66691)))

(declare-fun lt!66715 () Unit!3094)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2215 array!2215 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3094)

(assert (=> b!43848 (= lt!66715 (arrayBitRangesEqImpliesEq!0 (buf!1337 (_2!2224 lt!66693)) (buf!1337 (_2!2224 lt!66733)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!66716 (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!66693))) (currentByte!2806 (_2!2224 lt!66693)) (currentBit!2801 (_2!2224 lt!66693)))))))

(declare-fun bitAt!0 (array!2215 (_ BitVec 64)) Bool)

(assert (=> b!43848 (= (bitAt!0 (buf!1337 (_2!2224 lt!66693)) lt!66716) (bitAt!0 (buf!1337 (_2!2224 lt!66733)) lt!66716))))

(declare-fun lt!66707 () Unit!3094)

(assert (=> b!43848 (= lt!66707 lt!66715)))

(declare-fun bm!514 () Bool)

(assert (=> bm!514 (= call!517 (reader!0 (ite c!2913 (_2!2224 lt!66693) (_2!2224 lt!65876)) (ite c!2913 (_2!2224 lt!66733) (_2!2224 lt!65876))))))

(declare-fun b!43849 () Bool)

(declare-fun res!37171 () Bool)

(assert (=> b!43849 (=> (not res!37171) (not e!29227))))

(assert (=> b!43849 (= res!37171 (invariant!0 (currentBit!2801 (_2!2224 lt!66713)) (currentByte!2806 (_2!2224 lt!66713)) (size!1000 (buf!1337 (_2!2224 lt!66713)))))))

(declare-fun b!43850 () Bool)

(declare-fun lt!66695 () tuple2!4264)

(assert (=> b!43850 (= e!29227 (= (bitStreamReadBitsIntoList!0 (_2!2224 lt!66713) (_1!2225 lt!66695) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2224 lt!66713) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!43850 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43850 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!66712 () Unit!3094)

(declare-fun lt!66710 () Unit!3094)

(assert (=> b!43850 (= lt!66712 lt!66710)))

(assert (=> b!43850 (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!66713)))) ((_ sign_extend 32) (currentByte!2806 (_2!2224 lt!65876))) ((_ sign_extend 32) (currentBit!2801 (_2!2224 lt!65876))) lt!66725)))

(assert (=> b!43850 (= lt!66710 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2224 lt!65876) (buf!1337 (_2!2224 lt!66713)) lt!66725))))

(assert (=> b!43850 e!29228))

(declare-fun res!37167 () Bool)

(assert (=> b!43850 (=> (not res!37167) (not e!29228))))

(assert (=> b!43850 (= res!37167 (and (= (size!1000 (buf!1337 (_2!2224 lt!65876))) (size!1000 (buf!1337 (_2!2224 lt!66713)))) (bvsge lt!66725 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43850 (= lt!66725 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!43850 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!43850 (= lt!66695 (reader!0 (_2!2224 lt!65876) (_2!2224 lt!66713)))))

(assert (= (and d!12672 c!2913) b!43848))

(assert (= (and d!12672 (not c!2913)) b!43845))

(assert (= (or b!43848 b!43845) bm!514))

(assert (= (and d!12672 res!37168) b!43849))

(assert (= (and b!43849 res!37171) b!43847))

(assert (= (and b!43847 res!37170) b!43843))

(assert (= (and b!43843 res!37169) b!43844))

(assert (= (and b!43844 res!37166) b!43850))

(assert (= (and b!43850 res!37167) b!43846))

(declare-fun m!66725 () Bool)

(assert (=> b!43849 m!66725))

(declare-fun m!66727 () Bool)

(assert (=> b!43848 m!66727))

(declare-fun m!66729 () Bool)

(assert (=> b!43848 m!66729))

(declare-fun m!66731 () Bool)

(assert (=> b!43848 m!66731))

(declare-fun m!66733 () Bool)

(assert (=> b!43848 m!66733))

(declare-fun m!66735 () Bool)

(assert (=> b!43848 m!66735))

(declare-fun m!66737 () Bool)

(assert (=> b!43848 m!66737))

(declare-fun m!66739 () Bool)

(assert (=> b!43848 m!66739))

(declare-fun m!66741 () Bool)

(assert (=> b!43848 m!66741))

(assert (=> b!43848 m!66357))

(declare-fun m!66743 () Bool)

(assert (=> b!43848 m!66743))

(declare-fun m!66745 () Bool)

(assert (=> b!43848 m!66745))

(assert (=> b!43848 m!66745))

(declare-fun m!66747 () Bool)

(assert (=> b!43848 m!66747))

(declare-fun m!66749 () Bool)

(assert (=> b!43848 m!66749))

(declare-fun m!66751 () Bool)

(assert (=> b!43848 m!66751))

(declare-fun m!66753 () Bool)

(assert (=> b!43848 m!66753))

(declare-fun m!66755 () Bool)

(assert (=> b!43848 m!66755))

(declare-fun m!66757 () Bool)

(assert (=> b!43848 m!66757))

(declare-fun m!66759 () Bool)

(assert (=> b!43848 m!66759))

(declare-fun m!66761 () Bool)

(assert (=> b!43848 m!66761))

(assert (=> b!43848 m!66731))

(declare-fun m!66763 () Bool)

(assert (=> b!43848 m!66763))

(declare-fun m!66765 () Bool)

(assert (=> b!43848 m!66765))

(declare-fun m!66767 () Bool)

(assert (=> b!43848 m!66767))

(declare-fun m!66769 () Bool)

(assert (=> b!43848 m!66769))

(declare-fun m!66771 () Bool)

(assert (=> b!43848 m!66771))

(declare-fun m!66773 () Bool)

(assert (=> b!43848 m!66773))

(assert (=> b!43848 m!66753))

(declare-fun m!66775 () Bool)

(assert (=> b!43848 m!66775))

(declare-fun m!66777 () Bool)

(assert (=> b!43848 m!66777))

(declare-fun m!66779 () Bool)

(assert (=> b!43848 m!66779))

(declare-fun m!66781 () Bool)

(assert (=> b!43848 m!66781))

(assert (=> b!43848 m!66739))

(declare-fun m!66783 () Bool)

(assert (=> b!43848 m!66783))

(declare-fun m!66785 () Bool)

(assert (=> b!43848 m!66785))

(declare-fun m!66787 () Bool)

(assert (=> b!43848 m!66787))

(declare-fun m!66789 () Bool)

(assert (=> b!43843 m!66789))

(declare-fun m!66791 () Bool)

(assert (=> b!43850 m!66791))

(declare-fun m!66793 () Bool)

(assert (=> b!43850 m!66793))

(declare-fun m!66795 () Bool)

(assert (=> b!43850 m!66795))

(declare-fun m!66797 () Bool)

(assert (=> b!43850 m!66797))

(declare-fun m!66799 () Bool)

(assert (=> b!43850 m!66799))

(declare-fun m!66801 () Bool)

(assert (=> b!43846 m!66801))

(declare-fun m!66803 () Bool)

(assert (=> bm!514 m!66803))

(declare-fun m!66805 () Bool)

(assert (=> d!12672 m!66805))

(assert (=> d!12672 m!66357))

(assert (=> d!12672 m!66441))

(assert (=> d!12672 m!66435))

(declare-fun m!66807 () Bool)

(assert (=> b!43845 m!66807))

(declare-fun m!66809 () Bool)

(assert (=> b!43845 m!66809))

(assert (=> b!43476 d!12672))

(declare-fun d!12728 () Bool)

(declare-fun res!37173 () Bool)

(declare-fun e!29230 () Bool)

(assert (=> d!12728 (=> (not res!37173) (not e!29230))))

(assert (=> d!12728 (= res!37173 (= (size!1000 (buf!1337 (_2!2224 lt!65876))) (size!1000 (buf!1337 (_2!2224 lt!65877)))))))

(assert (=> d!12728 (= (isPrefixOf!0 (_2!2224 lt!65876) (_2!2224 lt!65877)) e!29230)))

(declare-fun b!43851 () Bool)

(declare-fun res!37172 () Bool)

(assert (=> b!43851 (=> (not res!37172) (not e!29230))))

(assert (=> b!43851 (= res!37172 (bvsle (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!65876))) (currentByte!2806 (_2!2224 lt!65876)) (currentBit!2801 (_2!2224 lt!65876))) (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!65877))) (currentByte!2806 (_2!2224 lt!65877)) (currentBit!2801 (_2!2224 lt!65877)))))))

(declare-fun b!43852 () Bool)

(declare-fun e!29231 () Bool)

(assert (=> b!43852 (= e!29230 e!29231)))

(declare-fun res!37174 () Bool)

(assert (=> b!43852 (=> res!37174 e!29231)))

(assert (=> b!43852 (= res!37174 (= (size!1000 (buf!1337 (_2!2224 lt!65876))) #b00000000000000000000000000000000))))

(declare-fun b!43853 () Bool)

(assert (=> b!43853 (= e!29231 (arrayBitRangesEq!0 (buf!1337 (_2!2224 lt!65876)) (buf!1337 (_2!2224 lt!65877)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1000 (buf!1337 (_2!2224 lt!65876))) (currentByte!2806 (_2!2224 lt!65876)) (currentBit!2801 (_2!2224 lt!65876)))))))

(assert (= (and d!12728 res!37173) b!43851))

(assert (= (and b!43851 res!37172) b!43852))

(assert (= (and b!43852 (not res!37174)) b!43853))

(assert (=> b!43851 m!66357))

(assert (=> b!43851 m!66183))

(assert (=> b!43853 m!66357))

(assert (=> b!43853 m!66357))

(declare-fun m!66811 () Bool)

(assert (=> b!43853 m!66811))

(assert (=> b!43476 d!12728))

(declare-fun d!12730 () Bool)

(assert (=> d!12730 (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 (_2!2224 lt!65876)))) ((_ sign_extend 32) (currentByte!2806 thiss!1379)) ((_ sign_extend 32) (currentBit!2801 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!66736 () Unit!3094)

(declare-fun choose!9 (BitStream!1744 array!2215 (_ BitVec 64) BitStream!1744) Unit!3094)

(assert (=> d!12730 (= lt!66736 (choose!9 thiss!1379 (buf!1337 (_2!2224 lt!65876)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1745 (buf!1337 (_2!2224 lt!65876)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379))))))

(assert (=> d!12730 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1337 (_2!2224 lt!65876)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!66736)))

(declare-fun bs!3407 () Bool)

(assert (= bs!3407 d!12730))

(assert (=> bs!3407 m!66147))

(declare-fun m!66813 () Bool)

(assert (=> bs!3407 m!66813))

(assert (=> b!43476 d!12730))

(declare-fun d!12732 () Bool)

(assert (=> d!12732 (= (array_inv!925 (buf!1337 thiss!1379)) (bvsge (size!1000 (buf!1337 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!43477 d!12732))

(declare-fun d!12734 () Bool)

(assert (=> d!12734 (= (invariant!0 (currentBit!2801 (_2!2224 lt!65877)) (currentByte!2806 (_2!2224 lt!65877)) (size!1000 (buf!1337 (_2!2224 lt!65877)))) (and (bvsge (currentBit!2801 (_2!2224 lt!65877)) #b00000000000000000000000000000000) (bvslt (currentBit!2801 (_2!2224 lt!65877)) #b00000000000000000000000000001000) (bvsge (currentByte!2806 (_2!2224 lt!65877)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2806 (_2!2224 lt!65877)) (size!1000 (buf!1337 (_2!2224 lt!65877)))) (and (= (currentBit!2801 (_2!2224 lt!65877)) #b00000000000000000000000000000000) (= (currentByte!2806 (_2!2224 lt!65877)) (size!1000 (buf!1337 (_2!2224 lt!65877))))))))))

(assert (=> b!43475 d!12734))

(declare-fun d!12736 () Bool)

(assert (=> d!12736 (= (array_inv!925 srcBuffer!2) (bvsge (size!1000 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!8738 d!12736))

(declare-fun d!12738 () Bool)

(assert (=> d!12738 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2801 thiss!1379) (currentByte!2806 thiss!1379) (size!1000 (buf!1337 thiss!1379))))))

(declare-fun bs!3408 () Bool)

(assert (= bs!3408 d!12738))

(declare-fun m!66815 () Bool)

(assert (=> bs!3408 m!66815))

(assert (=> start!8738 d!12738))

(declare-fun d!12740 () Bool)

(declare-fun res!37176 () Bool)

(declare-fun e!29232 () Bool)

(assert (=> d!12740 (=> (not res!37176) (not e!29232))))

(assert (=> d!12740 (= res!37176 (= (size!1000 (buf!1337 thiss!1379)) (size!1000 (buf!1337 thiss!1379))))))

(assert (=> d!12740 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!29232)))

(declare-fun b!43854 () Bool)

(declare-fun res!37175 () Bool)

(assert (=> b!43854 (=> (not res!37175) (not e!29232))))

(assert (=> b!43854 (= res!37175 (bvsle (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379)) (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379))))))

(declare-fun b!43855 () Bool)

(declare-fun e!29233 () Bool)

(assert (=> b!43855 (= e!29232 e!29233)))

(declare-fun res!37177 () Bool)

(assert (=> b!43855 (=> res!37177 e!29233)))

(assert (=> b!43855 (= res!37177 (= (size!1000 (buf!1337 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!43856 () Bool)

(assert (=> b!43856 (= e!29233 (arrayBitRangesEq!0 (buf!1337 thiss!1379) (buf!1337 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379))))))

(assert (= (and d!12740 res!37176) b!43854))

(assert (= (and b!43854 res!37175) b!43855))

(assert (= (and b!43855 (not res!37177)) b!43856))

(assert (=> b!43854 m!66171))

(assert (=> b!43854 m!66171))

(assert (=> b!43856 m!66171))

(assert (=> b!43856 m!66171))

(declare-fun m!66817 () Bool)

(assert (=> b!43856 m!66817))

(assert (=> b!43470 d!12740))

(declare-fun d!12742 () Bool)

(assert (=> d!12742 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!66739 () Unit!3094)

(declare-fun choose!11 (BitStream!1744) Unit!3094)

(assert (=> d!12742 (= lt!66739 (choose!11 thiss!1379))))

(assert (=> d!12742 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!66739)))

(declare-fun bs!3410 () Bool)

(assert (= bs!3410 d!12742))

(assert (=> bs!3410 m!66167))

(declare-fun m!66819 () Bool)

(assert (=> bs!3410 m!66819))

(assert (=> b!43470 d!12742))

(declare-fun d!12744 () Bool)

(declare-fun e!29234 () Bool)

(assert (=> d!12744 e!29234))

(declare-fun res!37178 () Bool)

(assert (=> d!12744 (=> (not res!37178) (not e!29234))))

(declare-fun lt!66744 () (_ BitVec 64))

(declare-fun lt!66743 () (_ BitVec 64))

(declare-fun lt!66745 () (_ BitVec 64))

(assert (=> d!12744 (= res!37178 (= lt!66744 (bvsub lt!66743 lt!66745)))))

(assert (=> d!12744 (or (= (bvand lt!66743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!66745 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!66743 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!66743 lt!66745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!12744 (= lt!66745 (remainingBits!0 ((_ sign_extend 32) (size!1000 (buf!1337 thiss!1379))) ((_ sign_extend 32) (currentByte!2806 thiss!1379)) ((_ sign_extend 32) (currentBit!2801 thiss!1379))))))

(declare-fun lt!66742 () (_ BitVec 64))

(declare-fun lt!66740 () (_ BitVec 64))

(assert (=> d!12744 (= lt!66743 (bvmul lt!66742 lt!66740))))

(assert (=> d!12744 (or (= lt!66742 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!66740 (bvsdiv (bvmul lt!66742 lt!66740) lt!66742)))))

(assert (=> d!12744 (= lt!66740 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!12744 (= lt!66742 ((_ sign_extend 32) (size!1000 (buf!1337 thiss!1379))))))

(assert (=> d!12744 (= lt!66744 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2806 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2801 thiss!1379))))))

(assert (=> d!12744 (invariant!0 (currentBit!2801 thiss!1379) (currentByte!2806 thiss!1379) (size!1000 (buf!1337 thiss!1379)))))

(assert (=> d!12744 (= (bitIndex!0 (size!1000 (buf!1337 thiss!1379)) (currentByte!2806 thiss!1379) (currentBit!2801 thiss!1379)) lt!66744)))

(declare-fun b!43857 () Bool)

(declare-fun res!37179 () Bool)

(assert (=> b!43857 (=> (not res!37179) (not e!29234))))

(assert (=> b!43857 (= res!37179 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!66744))))

(declare-fun b!43858 () Bool)

(declare-fun lt!66741 () (_ BitVec 64))

(assert (=> b!43858 (= e!29234 (bvsle lt!66744 (bvmul lt!66741 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!43858 (or (= lt!66741 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!66741 #b0000000000000000000000000000000000000000000000000000000000001000) lt!66741)))))

(assert (=> b!43858 (= lt!66741 ((_ sign_extend 32) (size!1000 (buf!1337 thiss!1379))))))

(assert (= (and d!12744 res!37178) b!43857))

(assert (= (and b!43857 res!37179) b!43858))

(declare-fun m!66821 () Bool)

(assert (=> d!12744 m!66821))

(assert (=> d!12744 m!66815))

(assert (=> b!43470 d!12744))

(declare-fun d!12746 () Bool)

(assert (=> d!12746 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1000 (buf!1337 thiss!1379))) ((_ sign_extend 32) (currentByte!2806 thiss!1379)) ((_ sign_extend 32) (currentBit!2801 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1000 (buf!1337 thiss!1379))) ((_ sign_extend 32) (currentByte!2806 thiss!1379)) ((_ sign_extend 32) (currentBit!2801 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3411 () Bool)

(assert (= bs!3411 d!12746))

(assert (=> bs!3411 m!66821))

(assert (=> b!43474 d!12746))

(push 1)

