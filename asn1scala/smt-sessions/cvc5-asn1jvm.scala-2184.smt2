; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55420 () Bool)

(assert start!55420)

(declare-fun b!258347 () Bool)

(declare-fun e!179179 () Bool)

(declare-datatypes ((array!14052 0))(
  ( (array!14053 (arr!7147 (Array (_ BitVec 32) (_ BitVec 8))) (size!6160 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11242 0))(
  ( (BitStream!11243 (buf!6682 array!14052) (currentByte!12266 (_ BitVec 32)) (currentBit!12261 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11242)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258347 (= e!179179 (validate_offset_bit!0 ((_ sign_extend 32) (size!6160 (buf!6682 thiss!1754))) ((_ sign_extend 32) (currentByte!12266 thiss!1754)) ((_ sign_extend 32) (currentBit!12261 thiss!1754))))))

(declare-fun b!258348 () Bool)

(declare-fun res!216441 () Bool)

(declare-fun e!179178 () Bool)

(assert (=> b!258348 (=> (not res!216441) (not e!179178))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!258348 (= res!216441 (not (= from!526 nBits!535)))))

(declare-fun res!216440 () Bool)

(assert (=> start!55420 (=> (not res!216440) (not e!179178))))

(assert (=> start!55420 (= res!216440 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55420 e!179178))

(assert (=> start!55420 true))

(declare-fun e!179181 () Bool)

(declare-fun inv!12 (BitStream!11242) Bool)

(assert (=> start!55420 (and (inv!12 thiss!1754) e!179181)))

(declare-fun b!258349 () Bool)

(declare-fun array_inv!5901 (array!14052) Bool)

(assert (=> b!258349 (= e!179181 (array_inv!5901 (buf!6682 thiss!1754)))))

(declare-fun b!258350 () Bool)

(declare-fun e!179182 () Bool)

(assert (=> b!258350 (= e!179182 (not e!179179))))

(declare-fun res!216439 () Bool)

(assert (=> b!258350 (=> res!216439 e!179179)))

(declare-fun lt!399946 () (_ BitVec 64))

(declare-fun lt!399948 () (_ BitVec 64))

(declare-datatypes ((tuple2!22118 0))(
  ( (tuple2!22119 (_1!11995 Bool) (_2!11995 BitStream!11242)) )
))
(declare-fun lt!399949 () tuple2!22118)

(assert (=> b!258350 (= res!216439 (or (bvslt lt!399946 lt!399948) (not (= (buf!6682 thiss!1754) (buf!6682 (_2!11995 lt!399949)))) (and (_1!11995 lt!399949) (not (= lt!399946 lt!399948))) (not (_1!11995 lt!399949)) (bvsge from!526 nBits!535)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258350 (= lt!399948 (bitIndex!0 (size!6160 (buf!6682 (_2!11995 lt!399949))) (currentByte!12266 (_2!11995 lt!399949)) (currentBit!12261 (_2!11995 lt!399949))))))

(assert (=> b!258350 (= lt!399946 (bvsub (bvadd (bitIndex!0 (size!6160 (buf!6682 thiss!1754)) (currentByte!12266 thiss!1754) (currentBit!12261 thiss!1754)) nBits!535) from!526))))

(declare-fun expected!109 () Bool)

(declare-fun lt!399950 () tuple2!22118)

(declare-fun checkBitsLoop!0 (BitStream!11242 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22118)

(assert (=> b!258350 (= lt!399949 (checkBitsLoop!0 (_2!11995 lt!399950) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258350 (validate_offset_bits!1 ((_ sign_extend 32) (size!6160 (buf!6682 (_2!11995 lt!399950)))) ((_ sign_extend 32) (currentByte!12266 (_2!11995 lt!399950))) ((_ sign_extend 32) (currentBit!12261 (_2!11995 lt!399950))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18429 0))(
  ( (Unit!18430) )
))
(declare-fun lt!399947 () Unit!18429)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11242 BitStream!11242 (_ BitVec 64) (_ BitVec 64)) Unit!18429)

(assert (=> b!258350 (= lt!399947 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11995 lt!399950) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!258351 () Bool)

(assert (=> b!258351 (= e!179178 e!179182)))

(declare-fun res!216438 () Bool)

(assert (=> b!258351 (=> (not res!216438) (not e!179182))))

(assert (=> b!258351 (= res!216438 (= (_1!11995 lt!399950) expected!109))))

(declare-fun readBit!0 (BitStream!11242) tuple2!22118)

(assert (=> b!258351 (= lt!399950 (readBit!0 thiss!1754))))

(declare-fun b!258352 () Bool)

(declare-fun res!216442 () Bool)

(assert (=> b!258352 (=> (not res!216442) (not e!179178))))

(assert (=> b!258352 (= res!216442 (validate_offset_bits!1 ((_ sign_extend 32) (size!6160 (buf!6682 thiss!1754))) ((_ sign_extend 32) (currentByte!12266 thiss!1754)) ((_ sign_extend 32) (currentBit!12261 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55420 res!216440) b!258352))

(assert (= (and b!258352 res!216442) b!258348))

(assert (= (and b!258348 res!216441) b!258351))

(assert (= (and b!258351 res!216438) b!258350))

(assert (= (and b!258350 (not res!216439)) b!258347))

(assert (= start!55420 b!258349))

(declare-fun m!387815 () Bool)

(assert (=> b!258347 m!387815))

(declare-fun m!387817 () Bool)

(assert (=> b!258350 m!387817))

(declare-fun m!387819 () Bool)

(assert (=> b!258350 m!387819))

(declare-fun m!387821 () Bool)

(assert (=> b!258350 m!387821))

(declare-fun m!387823 () Bool)

(assert (=> b!258350 m!387823))

(declare-fun m!387825 () Bool)

(assert (=> b!258350 m!387825))

(declare-fun m!387827 () Bool)

(assert (=> b!258351 m!387827))

(declare-fun m!387829 () Bool)

(assert (=> b!258349 m!387829))

(declare-fun m!387831 () Bool)

(assert (=> start!55420 m!387831))

(declare-fun m!387833 () Bool)

(assert (=> b!258352 m!387833))

(push 1)

(assert (not b!258347))

(assert (not b!258351))

(assert (not b!258352))

(assert (not start!55420))

(assert (not b!258349))

(assert (not b!258350))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86702 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86702 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12261 thiss!1754) (currentByte!12266 thiss!1754) (size!6160 (buf!6682 thiss!1754))))))

(declare-fun bs!21929 () Bool)

(assert (= bs!21929 d!86702))

(declare-fun m!387893 () Bool)

(assert (=> bs!21929 m!387893))

(assert (=> start!55420 d!86702))

(declare-fun d!86704 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86704 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6160 (buf!6682 thiss!1754))) ((_ sign_extend 32) (currentByte!12266 thiss!1754)) ((_ sign_extend 32) (currentBit!12261 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6160 (buf!6682 thiss!1754))) ((_ sign_extend 32) (currentByte!12266 thiss!1754)) ((_ sign_extend 32) (currentBit!12261 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21930 () Bool)

(assert (= bs!21930 d!86704))

(declare-fun m!387895 () Bool)

(assert (=> bs!21930 m!387895))

(assert (=> b!258352 d!86704))

(declare-fun d!86706 () Bool)

(assert (=> d!86706 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6160 (buf!6682 thiss!1754))) ((_ sign_extend 32) (currentByte!12266 thiss!1754)) ((_ sign_extend 32) (currentBit!12261 thiss!1754))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6160 (buf!6682 thiss!1754))) ((_ sign_extend 32) (currentByte!12266 thiss!1754)) ((_ sign_extend 32) (currentBit!12261 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21931 () Bool)

(assert (= bs!21931 d!86706))

(assert (=> bs!21931 m!387895))

(assert (=> b!258347 d!86706))

(declare-fun d!86710 () Bool)

(declare-fun e!179240 () Bool)

(assert (=> d!86710 e!179240))

(declare-fun res!216492 () Bool)

(assert (=> d!86710 (=> (not res!216492) (not e!179240))))

(declare-datatypes ((tuple2!22130 0))(
  ( (tuple2!22131 (_1!12001 Unit!18429) (_2!12001 BitStream!11242)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11242) tuple2!22130)

(assert (=> d!86710 (= res!216492 (= (buf!6682 (_2!12001 (increaseBitIndex!0 thiss!1754))) (buf!6682 thiss!1754)))))

(declare-fun lt!400069 () Bool)

(assert (=> d!86710 (= lt!400069 (not (= (bvand ((_ sign_extend 24) (select (arr!7147 (buf!6682 thiss!1754)) (currentByte!12266 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12261 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400065 () tuple2!22118)

(assert (=> d!86710 (= lt!400065 (tuple2!22119 (not (= (bvand ((_ sign_extend 24) (select (arr!7147 (buf!6682 thiss!1754)) (currentByte!12266 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12261 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12001 (increaseBitIndex!0 thiss!1754))))))

(assert (=> d!86710 (validate_offset_bit!0 ((_ sign_extend 32) (size!6160 (buf!6682 thiss!1754))) ((_ sign_extend 32) (currentByte!12266 thiss!1754)) ((_ sign_extend 32) (currentBit!12261 thiss!1754)))))

(assert (=> d!86710 (= (readBit!0 thiss!1754) lt!400065)))

(declare-fun b!258408 () Bool)

(declare-fun lt!400067 () (_ BitVec 64))

(declare-fun lt!400068 () (_ BitVec 64))

(assert (=> b!258408 (= e!179240 (= (bitIndex!0 (size!6160 (buf!6682 (_2!12001 (increaseBitIndex!0 thiss!1754)))) (currentByte!12266 (_2!12001 (increaseBitIndex!0 thiss!1754))) (currentBit!12261 (_2!12001 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!400067 lt!400068)))))

(assert (=> b!258408 (or (not (= (bvand lt!400067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400068 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400067 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400067 lt!400068) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258408 (= lt!400068 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258408 (= lt!400067 (bitIndex!0 (size!6160 (buf!6682 thiss!1754)) (currentByte!12266 thiss!1754) (currentBit!12261 thiss!1754)))))

(declare-fun lt!400066 () Bool)

(assert (=> b!258408 (= lt!400066 (not (= (bvand ((_ sign_extend 24) (select (arr!7147 (buf!6682 thiss!1754)) (currentByte!12266 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12261 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400070 () Bool)

(assert (=> b!258408 (= lt!400070 (not (= (bvand ((_ sign_extend 24) (select (arr!7147 (buf!6682 thiss!1754)) (currentByte!12266 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12261 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!400064 () Bool)

(assert (=> b!258408 (= lt!400064 (not (= (bvand ((_ sign_extend 24) (select (arr!7147 (buf!6682 thiss!1754)) (currentByte!12266 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12261 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86710 res!216492) b!258408))

(declare-fun m!387899 () Bool)

(assert (=> d!86710 m!387899))

(declare-fun m!387903 () Bool)

(assert (=> d!86710 m!387903))

(declare-fun m!387905 () Bool)

(assert (=> d!86710 m!387905))

(assert (=> d!86710 m!387815))

(assert (=> b!258408 m!387903))

(assert (=> b!258408 m!387825))

(assert (=> b!258408 m!387905))

(assert (=> b!258408 m!387899))

(declare-fun m!387911 () Bool)

(assert (=> b!258408 m!387911))

(assert (=> b!258351 d!86710))

(declare-fun d!86714 () Bool)

(assert (=> d!86714 (= (array_inv!5901 (buf!6682 thiss!1754)) (bvsge (size!6160 (buf!6682 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258349 d!86714))

(declare-fun d!86716 () Bool)

(declare-fun e!179243 () Bool)

(assert (=> d!86716 e!179243))

(declare-fun res!216495 () Bool)

(assert (=> d!86716 (=> (not res!216495) (not e!179243))))

(assert (=> d!86716 (= res!216495 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!400073 () Unit!18429)

(declare-fun choose!27 (BitStream!11242 BitStream!11242 (_ BitVec 64) (_ BitVec 64)) Unit!18429)

(assert (=> d!86716 (= lt!400073 (choose!27 thiss!1754 (_2!11995 lt!399950) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86716 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86716 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11995 lt!399950) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!400073)))

(declare-fun b!258411 () Bool)

(assert (=> b!258411 (= e!179243 (validate_offset_bits!1 ((_ sign_extend 32) (size!6160 (buf!6682 (_2!11995 lt!399950)))) ((_ sign_extend 32) (currentByte!12266 (_2!11995 lt!399950))) ((_ sign_extend 32) (currentBit!12261 (_2!11995 lt!399950))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86716 res!216495) b!258411))

(declare-fun m!387917 () Bool)

(assert (=> d!86716 m!387917))

(assert (=> b!258411 m!387817))

(assert (=> b!258350 d!86716))

(declare-fun d!86726 () Bool)

(declare-fun e!179264 () Bool)

(assert (=> d!86726 e!179264))

(declare-fun res!216522 () Bool)

(assert (=> d!86726 (=> (not res!216522) (not e!179264))))

(declare-fun lt!400140 () (_ BitVec 64))

(declare-fun lt!400137 () (_ BitVec 64))

(declare-fun lt!400139 () (_ BitVec 64))

(assert (=> d!86726 (= res!216522 (= lt!400139 (bvsub lt!400137 lt!400140)))))

(assert (=> d!86726 (or (= (bvand lt!400137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400140 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400137 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400137 lt!400140) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86726 (= lt!400140 (remainingBits!0 ((_ sign_extend 32) (size!6160 (buf!6682 thiss!1754))) ((_ sign_extend 32) (currentByte!12266 thiss!1754)) ((_ sign_extend 32) (currentBit!12261 thiss!1754))))))

(declare-fun lt!400142 () (_ BitVec 64))

(declare-fun lt!400141 () (_ BitVec 64))

(assert (=> d!86726 (= lt!400137 (bvmul lt!400142 lt!400141))))

(assert (=> d!86726 (or (= lt!400142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400141 (bvsdiv (bvmul lt!400142 lt!400141) lt!400142)))))

(assert (=> d!86726 (= lt!400141 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86726 (= lt!400142 ((_ sign_extend 32) (size!6160 (buf!6682 thiss!1754))))))

(assert (=> d!86726 (= lt!400139 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12266 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12261 thiss!1754))))))

(assert (=> d!86726 (invariant!0 (currentBit!12261 thiss!1754) (currentByte!12266 thiss!1754) (size!6160 (buf!6682 thiss!1754)))))

(assert (=> d!86726 (= (bitIndex!0 (size!6160 (buf!6682 thiss!1754)) (currentByte!12266 thiss!1754) (currentBit!12261 thiss!1754)) lt!400139)))

(declare-fun b!258449 () Bool)

(declare-fun res!216521 () Bool)

(assert (=> b!258449 (=> (not res!216521) (not e!179264))))

(assert (=> b!258449 (= res!216521 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400139))))

(declare-fun b!258450 () Bool)

(declare-fun lt!400138 () (_ BitVec 64))

(assert (=> b!258450 (= e!179264 (bvsle lt!400139 (bvmul lt!400138 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258450 (or (= lt!400138 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400138 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400138)))))

(assert (=> b!258450 (= lt!400138 ((_ sign_extend 32) (size!6160 (buf!6682 thiss!1754))))))

(assert (= (and d!86726 res!216522) b!258449))

(assert (= (and b!258449 res!216521) b!258450))

(assert (=> d!86726 m!387895))

(assert (=> d!86726 m!387893))

(assert (=> b!258350 d!86726))

(declare-fun d!86730 () Bool)

(assert (=> d!86730 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6160 (buf!6682 (_2!11995 lt!399950)))) ((_ sign_extend 32) (currentByte!12266 (_2!11995 lt!399950))) ((_ sign_extend 32) (currentBit!12261 (_2!11995 lt!399950))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6160 (buf!6682 (_2!11995 lt!399950)))) ((_ sign_extend 32) (currentByte!12266 (_2!11995 lt!399950))) ((_ sign_extend 32) (currentBit!12261 (_2!11995 lt!399950)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21935 () Bool)

(assert (= bs!21935 d!86730))

(declare-fun m!387923 () Bool)

(assert (=> bs!21935 m!387923))

(assert (=> b!258350 d!86730))

(declare-fun b!258492 () Bool)

(declare-fun e!179291 () tuple2!22118)

(declare-fun lt!400196 () tuple2!22118)

(assert (=> b!258492 (= e!179291 (tuple2!22119 false (_2!11995 lt!400196)))))

(declare-fun b!258493 () Bool)

(declare-fun res!216552 () Bool)

(declare-fun e!179292 () Bool)

(assert (=> b!258493 (=> (not res!216552) (not e!179292))))

(declare-fun lt!400204 () tuple2!22118)

(assert (=> b!258493 (= res!216552 (and (= (buf!6682 (_2!11995 lt!399950)) (buf!6682 (_2!11995 lt!400204))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11995 lt!400204))))))

(declare-fun b!258494 () Bool)

(declare-fun res!216548 () Bool)

(assert (=> b!258494 (=> (not res!216548) (not e!179292))))

(declare-fun e!179293 () Bool)

(assert (=> b!258494 (= res!216548 e!179293)))

(declare-fun res!216550 () Bool)

(assert (=> b!258494 (=> res!216550 e!179293)))

(assert (=> b!258494 (= res!216550 (not (_1!11995 lt!400204)))))

(declare-fun b!258495 () Bool)

(declare-fun e!179289 () Bool)

(declare-datatypes ((tuple2!22132 0))(
  ( (tuple2!22133 (_1!12002 BitStream!11242) (_2!12002 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11242) tuple2!22132)

(assert (=> b!258495 (= e!179289 (= expected!109 (_2!12002 (readBitPure!0 (_2!11995 lt!399950)))))))

(declare-fun b!258496 () Bool)

(declare-fun e!179290 () tuple2!22118)

(assert (=> b!258496 (= e!179290 e!179291)))

(assert (=> b!258496 (= lt!400196 (readBit!0 (_2!11995 lt!399950)))))

(declare-fun c!11892 () Bool)

(assert (=> b!258496 (= c!11892 (not (= (_1!11995 lt!400196) expected!109)))))

(declare-fun b!258497 () Bool)

(declare-fun lt!400198 () tuple2!22118)

(assert (=> b!258497 (= lt!400198 (checkBitsLoop!0 (_2!11995 lt!400196) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!400202 () Unit!18429)

(declare-fun lt!400203 () Unit!18429)

(assert (=> b!258497 (= lt!400202 lt!400203)))

(declare-fun lt!400200 () (_ BitVec 64))

(declare-fun lt!400205 () (_ BitVec 64))

(assert (=> b!258497 (validate_offset_bits!1 ((_ sign_extend 32) (size!6160 (buf!6682 (_2!11995 lt!400196)))) ((_ sign_extend 32) (currentByte!12266 (_2!11995 lt!400196))) ((_ sign_extend 32) (currentBit!12261 (_2!11995 lt!400196))) (bvsub lt!400200 lt!400205))))

(assert (=> b!258497 (= lt!400203 (validateOffsetBitsIneqLemma!0 (_2!11995 lt!399950) (_2!11995 lt!400196) lt!400200 lt!400205))))

(assert (=> b!258497 (= lt!400205 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!258497 (= lt!400200 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(assert (=> b!258497 (= e!179291 (tuple2!22119 (_1!11995 lt!400198) (_2!11995 lt!400198)))))

(declare-fun b!258498 () Bool)

(declare-fun lt!400206 () (_ BitVec 64))

(assert (=> b!258498 (= e!179293 (= (bvsub lt!400206 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6160 (buf!6682 (_2!11995 lt!400204))) (currentByte!12266 (_2!11995 lt!400204)) (currentBit!12261 (_2!11995 lt!400204)))))))

(assert (=> b!258498 (or (= (bvand lt!400206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400206 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!400201 () (_ BitVec 64))

(assert (=> b!258498 (= lt!400206 (bvadd lt!400201 nBits!535))))

(assert (=> b!258498 (or (not (= (bvand lt!400201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400201 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!258498 (= lt!400201 (bitIndex!0 (size!6160 (buf!6682 (_2!11995 lt!399950))) (currentByte!12266 (_2!11995 lt!399950)) (currentBit!12261 (_2!11995 lt!399950))))))

(declare-fun d!86732 () Bool)

(assert (=> d!86732 e!179292))

(declare-fun res!216549 () Bool)

(assert (=> d!86732 (=> (not res!216549) (not e!179292))))

(declare-fun lt!400197 () (_ BitVec 64))

(assert (=> d!86732 (= res!216549 (bvsge (bvsub lt!400197 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6160 (buf!6682 (_2!11995 lt!400204))) (currentByte!12266 (_2!11995 lt!400204)) (currentBit!12261 (_2!11995 lt!400204)))))))

(assert (=> d!86732 (or (= (bvand lt!400197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400197 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400197 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!400199 () (_ BitVec 64))

(assert (=> d!86732 (= lt!400197 (bvadd lt!400199 nBits!535))))

(assert (=> d!86732 (or (not (= (bvand lt!400199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!400199 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!400199 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86732 (= lt!400199 (bitIndex!0 (size!6160 (buf!6682 (_2!11995 lt!399950))) (currentByte!12266 (_2!11995 lt!399950)) (currentBit!12261 (_2!11995 lt!399950))))))

(assert (=> d!86732 (= lt!400204 e!179290)))

(declare-fun c!11893 () Bool)

(assert (=> d!86732 (= c!11893 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86732 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86732 (= (checkBitsLoop!0 (_2!11995 lt!399950) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!400204)))

(declare-fun b!258499 () Bool)

(assert (=> b!258499 (= e!179292 e!179289)))

(declare-fun res!216551 () Bool)

(assert (=> b!258499 (=> res!216551 e!179289)))

(assert (=> b!258499 (= res!216551 (or (not (_1!11995 lt!400204)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!258500 () Bool)

(assert (=> b!258500 (= e!179290 (tuple2!22119 true (_2!11995 lt!399950)))))

(assert (= (and d!86732 c!11893) b!258500))

(assert (= (and d!86732 (not c!11893)) b!258496))

(assert (= (and b!258496 c!11892) b!258492))

(assert (= (and b!258496 (not c!11892)) b!258497))

(assert (= (and d!86732 res!216549) b!258493))

(assert (= (and b!258493 res!216552) b!258494))

(assert (= (and b!258494 (not res!216550)) b!258498))

(assert (= (and b!258494 res!216548) b!258499))

(assert (= (and b!258499 (not res!216551)) b!258495))

(declare-fun m!387943 () Bool)

(assert (=> b!258497 m!387943))

(declare-fun m!387945 () Bool)

(assert (=> b!258497 m!387945))

(declare-fun m!387947 () Bool)

(assert (=> b!258497 m!387947))

(declare-fun m!387949 () Bool)

(assert (=> b!258498 m!387949))

(declare-fun m!387951 () Bool)

(assert (=> b!258498 m!387951))

(assert (=> d!86732 m!387949))

(assert (=> d!86732 m!387951))

(declare-fun m!387953 () Bool)

(assert (=> b!258496 m!387953))

(declare-fun m!387955 () Bool)

(assert (=> b!258495 m!387955))

(assert (=> b!258350 d!86732))

(declare-fun d!86742 () Bool)

(declare-fun e!179294 () Bool)

(assert (=> d!86742 e!179294))

(declare-fun res!216554 () Bool)

(assert (=> d!86742 (=> (not res!216554) (not e!179294))))

(declare-fun lt!400207 () (_ BitVec 64))

(declare-fun lt!400210 () (_ BitVec 64))

(declare-fun lt!400209 () (_ BitVec 64))

(assert (=> d!86742 (= res!216554 (= lt!400209 (bvsub lt!400207 lt!400210)))))

(assert (=> d!86742 (or (= (bvand lt!400207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400210 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400207 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400207 lt!400210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86742 (= lt!400210 (remainingBits!0 ((_ sign_extend 32) (size!6160 (buf!6682 (_2!11995 lt!399949)))) ((_ sign_extend 32) (currentByte!12266 (_2!11995 lt!399949))) ((_ sign_extend 32) (currentBit!12261 (_2!11995 lt!399949)))))))

(declare-fun lt!400212 () (_ BitVec 64))

(declare-fun lt!400211 () (_ BitVec 64))

(assert (=> d!86742 (= lt!400207 (bvmul lt!400212 lt!400211))))

(assert (=> d!86742 (or (= lt!400212 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400211 (bvsdiv (bvmul lt!400212 lt!400211) lt!400212)))))

(assert (=> d!86742 (= lt!400211 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86742 (= lt!400212 ((_ sign_extend 32) (size!6160 (buf!6682 (_2!11995 lt!399949)))))))

(assert (=> d!86742 (= lt!400209 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12266 (_2!11995 lt!399949))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12261 (_2!11995 lt!399949)))))))

(assert (=> d!86742 (invariant!0 (currentBit!12261 (_2!11995 lt!399949)) (currentByte!12266 (_2!11995 lt!399949)) (size!6160 (buf!6682 (_2!11995 lt!399949))))))

(assert (=> d!86742 (= (bitIndex!0 (size!6160 (buf!6682 (_2!11995 lt!399949))) (currentByte!12266 (_2!11995 lt!399949)) (currentBit!12261 (_2!11995 lt!399949))) lt!400209)))

(declare-fun b!258501 () Bool)

(declare-fun res!216553 () Bool)

(assert (=> b!258501 (=> (not res!216553) (not e!179294))))

(assert (=> b!258501 (= res!216553 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400209))))

(declare-fun b!258502 () Bool)

(declare-fun lt!400208 () (_ BitVec 64))

(assert (=> b!258502 (= e!179294 (bvsle lt!400209 (bvmul lt!400208 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258502 (or (= lt!400208 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400208 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400208)))))

(assert (=> b!258502 (= lt!400208 ((_ sign_extend 32) (size!6160 (buf!6682 (_2!11995 lt!399949)))))))

(assert (= (and d!86742 res!216554) b!258501))

(assert (= (and b!258501 res!216553) b!258502))

(declare-fun m!387957 () Bool)

(assert (=> d!86742 m!387957))

(declare-fun m!387959 () Bool)

(assert (=> d!86742 m!387959))

(assert (=> b!258350 d!86742))

(push 1)

(assert (not b!258498))

(assert (not b!258408))

(assert (not d!86716))

(assert (not b!258411))

(assert (not d!86726))

(assert (not d!86710))

(assert (not d!86702))

(assert (not b!258496))

(assert (not d!86706))

(assert (not d!86742))

(assert (not d!86730))

(assert (not d!86732))

(assert (not d!86704))

(assert (not b!258495))

(assert (not b!258497))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

