; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!734 () Bool)

(assert start!734)

(declare-fun b!2429 () Bool)

(declare-fun res!4147 () Bool)

(declare-fun e!1725 () Bool)

(assert (=> b!2429 (=> (not res!4147) (not e!1725))))

(declare-datatypes ((array!231 0))(
  ( (array!232 (arr!481 (Array (_ BitVec 32) (_ BitVec 8))) (size!94 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!166 0))(
  ( (BitStream!167 (buf!403 array!231) (currentByte!1358 (_ BitVec 32)) (currentBit!1353 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!166)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2429 (= res!4147 (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 thiss!1486))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486)) nBits!460))))

(declare-fun b!2430 () Bool)

(declare-fun res!4148 () Bool)

(declare-fun e!1723 () Bool)

(assert (=> b!2430 (=> (not res!4148) (not e!1723))))

(declare-datatypes ((Unit!142 0))(
  ( (Unit!143) )
))
(declare-datatypes ((tuple2!196 0))(
  ( (tuple2!197 (_1!105 Unit!142) (_2!105 BitStream!166)) )
))
(declare-fun lt!1834 () tuple2!196)

(declare-fun isPrefixOf!0 (BitStream!166 BitStream!166) Bool)

(assert (=> b!2430 (= res!4148 (isPrefixOf!0 thiss!1486 (_2!105 lt!1834)))))

(declare-fun b!2431 () Bool)

(declare-fun e!1722 () Bool)

(assert (=> b!2431 (= e!1723 (not e!1722))))

(declare-fun res!4144 () Bool)

(assert (=> b!2431 (=> res!4144 e!1722)))

(assert (=> b!2431 (= res!4144 (bvsgt nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> b!2431 (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!1834)))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486)) nBits!460)))

(declare-fun lt!1835 () Unit!142)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!166 array!231 (_ BitVec 64)) Unit!142)

(assert (=> b!2431 (= lt!1835 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!403 (_2!105 lt!1834)) nBits!460))))

(declare-datatypes ((tuple2!198 0))(
  ( (tuple2!199 (_1!106 BitStream!166) (_2!106 BitStream!166)) )
))
(declare-fun lt!1833 () tuple2!198)

(declare-fun reader!0 (BitStream!166 BitStream!166) tuple2!198)

(assert (=> b!2431 (= lt!1833 (reader!0 thiss!1486 (_2!105 lt!1834)))))

(declare-fun res!4146 () Bool)

(assert (=> start!734 (=> (not res!4146) (not e!1725))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!231)

(assert (=> start!734 (= res!4146 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!94 srcBuffer!6))))))))

(assert (=> start!734 e!1725))

(assert (=> start!734 true))

(declare-fun array_inv!89 (array!231) Bool)

(assert (=> start!734 (array_inv!89 srcBuffer!6)))

(declare-fun e!1727 () Bool)

(declare-fun inv!12 (BitStream!166) Bool)

(assert (=> start!734 (and (inv!12 thiss!1486) e!1727)))

(declare-fun b!2432 () Bool)

(assert (=> b!2432 (= e!1725 e!1723)))

(declare-fun res!4145 () Bool)

(assert (=> b!2432 (=> (not res!4145) (not e!1723))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2432 (= res!4145 (invariant!0 (currentBit!1353 (_2!105 lt!1834)) (currentByte!1358 (_2!105 lt!1834)) (size!94 (buf!403 (_2!105 lt!1834)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!166 array!231 (_ BitVec 64) (_ BitVec 64)) tuple2!196)

(assert (=> b!2432 (= lt!1834 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2433 () Bool)

(assert (=> b!2433 (= e!1722 (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 (_1!106 lt!1833)))) ((_ sign_extend 32) (currentByte!1358 (_1!106 lt!1833))) ((_ sign_extend 32) (currentBit!1353 (_1!106 lt!1833))) nBits!460))))

(declare-fun b!2434 () Bool)

(declare-fun res!4150 () Bool)

(assert (=> b!2434 (=> (not res!4150) (not e!1723))))

(assert (=> b!2434 (= res!4150 (= (size!94 (buf!403 thiss!1486)) (size!94 (buf!403 (_2!105 lt!1834)))))))

(declare-fun b!2435 () Bool)

(declare-fun res!4149 () Bool)

(assert (=> b!2435 (=> (not res!4149) (not e!1723))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2435 (= res!4149 (= (bitIndex!0 (size!94 (buf!403 (_2!105 lt!1834))) (currentByte!1358 (_2!105 lt!1834)) (currentBit!1353 (_2!105 lt!1834))) (bvadd (bitIndex!0 (size!94 (buf!403 thiss!1486)) (currentByte!1358 thiss!1486) (currentBit!1353 thiss!1486)) nBits!460)))))

(declare-fun b!2436 () Bool)

(assert (=> b!2436 (= e!1727 (array_inv!89 (buf!403 thiss!1486)))))

(assert (= (and start!734 res!4146) b!2429))

(assert (= (and b!2429 res!4147) b!2432))

(assert (= (and b!2432 res!4145) b!2434))

(assert (= (and b!2434 res!4150) b!2435))

(assert (= (and b!2435 res!4149) b!2430))

(assert (= (and b!2430 res!4148) b!2431))

(assert (= (and b!2431 (not res!4144)) b!2433))

(assert (= start!734 b!2436))

(declare-fun m!2067 () Bool)

(assert (=> b!2433 m!2067))

(declare-fun m!2069 () Bool)

(assert (=> b!2431 m!2069))

(declare-fun m!2071 () Bool)

(assert (=> b!2431 m!2071))

(declare-fun m!2073 () Bool)

(assert (=> b!2431 m!2073))

(declare-fun m!2075 () Bool)

(assert (=> b!2432 m!2075))

(declare-fun m!2077 () Bool)

(assert (=> b!2432 m!2077))

(declare-fun m!2079 () Bool)

(assert (=> b!2436 m!2079))

(declare-fun m!2081 () Bool)

(assert (=> b!2435 m!2081))

(declare-fun m!2083 () Bool)

(assert (=> b!2435 m!2083))

(declare-fun m!2085 () Bool)

(assert (=> b!2429 m!2085))

(declare-fun m!2087 () Bool)

(assert (=> b!2430 m!2087))

(declare-fun m!2089 () Bool)

(assert (=> start!734 m!2089))

(declare-fun m!2091 () Bool)

(assert (=> start!734 m!2091))

(push 1)

(assert (not b!2430))

(assert (not b!2431))

(assert (not b!2432))

(assert (not b!2436))

(assert (not b!2429))

(assert (not start!734))

(assert (not b!2433))

(assert (not b!2435))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1402 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1402 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 thiss!1486))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!94 (buf!403 thiss!1486))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486))) nBits!460))))

(declare-fun bs!542 () Bool)

(assert (= bs!542 d!1402))

(declare-fun m!2145 () Bool)

(assert (=> bs!542 m!2145))

(assert (=> b!2429 d!1402))

(declare-fun d!1406 () Bool)

(assert (=> d!1406 (= (array_inv!89 srcBuffer!6) (bvsge (size!94 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!734 d!1406))

(declare-fun d!1408 () Bool)

(assert (=> d!1408 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1353 thiss!1486) (currentByte!1358 thiss!1486) (size!94 (buf!403 thiss!1486))))))

(declare-fun bs!545 () Bool)

(assert (= bs!545 d!1408))

(declare-fun m!2151 () Bool)

(assert (=> bs!545 m!2151))

(assert (=> start!734 d!1408))

(declare-fun d!1416 () Bool)

(assert (=> d!1416 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 (_1!106 lt!1833)))) ((_ sign_extend 32) (currentByte!1358 (_1!106 lt!1833))) ((_ sign_extend 32) (currentBit!1353 (_1!106 lt!1833))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!94 (buf!403 (_1!106 lt!1833)))) ((_ sign_extend 32) (currentByte!1358 (_1!106 lt!1833))) ((_ sign_extend 32) (currentBit!1353 (_1!106 lt!1833)))) nBits!460))))

(declare-fun bs!546 () Bool)

(assert (= bs!546 d!1416))

(declare-fun m!2153 () Bool)

(assert (=> bs!546 m!2153))

(assert (=> b!2433 d!1416))

(declare-fun d!1418 () Bool)

(assert (=> d!1418 (= (invariant!0 (currentBit!1353 (_2!105 lt!1834)) (currentByte!1358 (_2!105 lt!1834)) (size!94 (buf!403 (_2!105 lt!1834)))) (and (bvsge (currentBit!1353 (_2!105 lt!1834)) #b00000000000000000000000000000000) (bvslt (currentBit!1353 (_2!105 lt!1834)) #b00000000000000000000000000001000) (bvsge (currentByte!1358 (_2!105 lt!1834)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1358 (_2!105 lt!1834)) (size!94 (buf!403 (_2!105 lt!1834)))) (and (= (currentBit!1353 (_2!105 lt!1834)) #b00000000000000000000000000000000) (= (currentByte!1358 (_2!105 lt!1834)) (size!94 (buf!403 (_2!105 lt!1834))))))))))

(assert (=> b!2432 d!1418))

(declare-fun d!1424 () Bool)

(declare-fun e!1798 () Bool)

(assert (=> d!1424 e!1798))

(declare-fun res!4250 () Bool)

(assert (=> d!1424 (=> (not res!4250) (not e!1798))))

(declare-fun lt!2094 () (_ BitVec 64))

(declare-fun lt!2116 () tuple2!196)

(assert (=> d!1424 (= res!4250 (= (bitIndex!0 (size!94 (buf!403 (_2!105 lt!2116))) (currentByte!1358 (_2!105 lt!2116)) (currentBit!1353 (_2!105 lt!2116))) (bvsub lt!2094 from!367)))))

(assert (=> d!1424 (or (= (bvand lt!2094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2094 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!2095 () (_ BitVec 64))

(assert (=> d!1424 (= lt!2094 (bvadd lt!2095 from!367 nBits!460))))

(assert (=> d!1424 (or (not (= (bvand lt!2095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!2095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!2095 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1424 (= lt!2095 (bitIndex!0 (size!94 (buf!403 thiss!1486)) (currentByte!1358 thiss!1486) (currentBit!1353 thiss!1486)))))

(declare-fun e!1799 () tuple2!196)

(assert (=> d!1424 (= lt!2116 e!1799)))

(declare-fun c!107 () Bool)

(assert (=> d!1424 (= c!107 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!2123 () Unit!142)

(declare-fun lt!2111 () Unit!142)

(assert (=> d!1424 (= lt!2123 lt!2111)))

(assert (=> d!1424 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!166) Unit!142)

(assert (=> d!1424 (= lt!2111 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!2120 () (_ BitVec 64))

(assert (=> d!1424 (= lt!2120 (bitIndex!0 (size!94 (buf!403 thiss!1486)) (currentByte!1358 thiss!1486) (currentBit!1353 thiss!1486)))))

(assert (=> d!1424 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1424 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!2116)))

(declare-fun b!2557 () Bool)

(declare-fun lt!2109 () tuple2!196)

(declare-fun Unit!148 () Unit!142)

(assert (=> b!2557 (= e!1799 (tuple2!197 Unit!148 (_2!105 lt!2109)))))

(declare-fun lt!2130 () tuple2!196)

(declare-fun appendBitFromByte!0 (BitStream!166 (_ BitVec 8) (_ BitVec 32)) tuple2!196)

(assert (=> b!2557 (= lt!2130 (appendBitFromByte!0 thiss!1486 (select (arr!481 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!2103 () (_ BitVec 64))

(assert (=> b!2557 (= lt!2103 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!2124 () (_ BitVec 64))

(assert (=> b!2557 (= lt!2124 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!2132 () Unit!142)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!166 BitStream!166 (_ BitVec 64) (_ BitVec 64)) Unit!142)

(assert (=> b!2557 (= lt!2132 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!105 lt!2130) lt!2103 lt!2124))))

(assert (=> b!2557 (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!2130)))) ((_ sign_extend 32) (currentByte!1358 (_2!105 lt!2130))) ((_ sign_extend 32) (currentBit!1353 (_2!105 lt!2130))) (bvsub lt!2103 lt!2124))))

(declare-fun lt!2114 () Unit!142)

(assert (=> b!2557 (= lt!2114 lt!2132)))

(declare-fun lt!2104 () tuple2!198)

(assert (=> b!2557 (= lt!2104 (reader!0 thiss!1486 (_2!105 lt!2130)))))

(declare-fun lt!2121 () (_ BitVec 64))

(assert (=> b!2557 (= lt!2121 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!2097 () Unit!142)

(assert (=> b!2557 (= lt!2097 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!403 (_2!105 lt!2130)) lt!2121))))

(assert (=> b!2557 (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!2130)))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486)) lt!2121)))

(declare-fun lt!2125 () Unit!142)

(assert (=> b!2557 (= lt!2125 lt!2097)))

(declare-datatypes ((List!9 0))(
  ( (Nil!6) (Cons!5 (h!124 Bool) (t!759 List!9)) )
))
(declare-fun head!8 (List!9) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!166 array!231 (_ BitVec 64) (_ BitVec 64)) List!9)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!166 BitStream!166 (_ BitVec 64)) List!9)

(assert (=> b!2557 (= (head!8 (byteArrayBitContentToList!0 (_2!105 lt!2130) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!8 (bitStreamReadBitsIntoList!0 (_2!105 lt!2130) (_1!106 lt!2104) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!2108 () Unit!142)

(declare-fun Unit!151 () Unit!142)

(assert (=> b!2557 (= lt!2108 Unit!151)))

(assert (=> b!2557 (= lt!2109 (appendBitsMSBFirstLoop!0 (_2!105 lt!2130) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!2106 () Unit!142)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!166 BitStream!166 BitStream!166) Unit!142)

(assert (=> b!2557 (= lt!2106 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!105 lt!2130) (_2!105 lt!2109)))))

(assert (=> b!2557 (isPrefixOf!0 thiss!1486 (_2!105 lt!2109))))

(declare-fun lt!2096 () Unit!142)

(assert (=> b!2557 (= lt!2096 lt!2106)))

(assert (=> b!2557 (= (size!94 (buf!403 (_2!105 lt!2109))) (size!94 (buf!403 thiss!1486)))))

(declare-fun lt!2110 () Unit!142)

(declare-fun Unit!152 () Unit!142)

(assert (=> b!2557 (= lt!2110 Unit!152)))

(assert (=> b!2557 (= (bitIndex!0 (size!94 (buf!403 (_2!105 lt!2109))) (currentByte!1358 (_2!105 lt!2109)) (currentBit!1353 (_2!105 lt!2109))) (bvsub (bvadd (bitIndex!0 (size!94 (buf!403 thiss!1486)) (currentByte!1358 thiss!1486) (currentBit!1353 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!2099 () Unit!142)

(declare-fun Unit!153 () Unit!142)

(assert (=> b!2557 (= lt!2099 Unit!153)))

(assert (=> b!2557 (= (bitIndex!0 (size!94 (buf!403 (_2!105 lt!2109))) (currentByte!1358 (_2!105 lt!2109)) (currentBit!1353 (_2!105 lt!2109))) (bvsub (bvsub (bvadd (bitIndex!0 (size!94 (buf!403 (_2!105 lt!2130))) (currentByte!1358 (_2!105 lt!2130)) (currentBit!1353 (_2!105 lt!2130))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!2115 () Unit!142)

(declare-fun Unit!154 () Unit!142)

(assert (=> b!2557 (= lt!2115 Unit!154)))

(declare-fun lt!2127 () tuple2!198)

(declare-fun call!14 () tuple2!198)

(assert (=> b!2557 (= lt!2127 call!14)))

(declare-fun lt!2133 () (_ BitVec 64))

(assert (=> b!2557 (= lt!2133 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!2102 () Unit!142)

(assert (=> b!2557 (= lt!2102 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!403 (_2!105 lt!2109)) lt!2133))))

(assert (=> b!2557 (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!2109)))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486)) lt!2133)))

(declare-fun lt!2112 () Unit!142)

(assert (=> b!2557 (= lt!2112 lt!2102)))

(declare-fun lt!2100 () tuple2!198)

(assert (=> b!2557 (= lt!2100 (reader!0 (_2!105 lt!2130) (_2!105 lt!2109)))))

(declare-fun lt!2105 () (_ BitVec 64))

(assert (=> b!2557 (= lt!2105 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!2122 () Unit!142)

(assert (=> b!2557 (= lt!2122 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!105 lt!2130) (buf!403 (_2!105 lt!2109)) lt!2105))))

(assert (=> b!2557 (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!2109)))) ((_ sign_extend 32) (currentByte!1358 (_2!105 lt!2130))) ((_ sign_extend 32) (currentBit!1353 (_2!105 lt!2130))) lt!2105)))

(declare-fun lt!2134 () Unit!142)

(assert (=> b!2557 (= lt!2134 lt!2122)))

(declare-fun lt!2092 () List!9)

(assert (=> b!2557 (= lt!2092 (byteArrayBitContentToList!0 (_2!105 lt!2109) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!2119 () List!9)

(assert (=> b!2557 (= lt!2119 (byteArrayBitContentToList!0 (_2!105 lt!2109) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!2135 () List!9)

(assert (=> b!2557 (= lt!2135 (bitStreamReadBitsIntoList!0 (_2!105 lt!2109) (_1!106 lt!2127) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!2126 () List!9)

(assert (=> b!2557 (= lt!2126 (bitStreamReadBitsIntoList!0 (_2!105 lt!2109) (_1!106 lt!2100) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!2118 () (_ BitVec 64))

(assert (=> b!2557 (= lt!2118 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!2113 () Unit!142)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!166 BitStream!166 BitStream!166 BitStream!166 (_ BitVec 64) List!9) Unit!142)

(assert (=> b!2557 (= lt!2113 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!105 lt!2109) (_2!105 lt!2109) (_1!106 lt!2127) (_1!106 lt!2100) lt!2118 lt!2135))))

(declare-fun tail!16 (List!9) List!9)

(assert (=> b!2557 (= (bitStreamReadBitsIntoList!0 (_2!105 lt!2109) (_1!106 lt!2100) (bvsub lt!2118 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!16 lt!2135))))

(declare-fun lt!2107 () Unit!142)

(assert (=> b!2557 (= lt!2107 lt!2113)))

(declare-fun lt!2117 () Unit!142)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!231 array!231 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!142)

(assert (=> b!2557 (= lt!2117 (arrayBitRangesEqImpliesEq!0 (buf!403 (_2!105 lt!2130)) (buf!403 (_2!105 lt!2109)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!2120 (bitIndex!0 (size!94 (buf!403 (_2!105 lt!2130))) (currentByte!1358 (_2!105 lt!2130)) (currentBit!1353 (_2!105 lt!2130)))))))

(declare-fun bitAt!0 (array!231 (_ BitVec 64)) Bool)

(assert (=> b!2557 (= (bitAt!0 (buf!403 (_2!105 lt!2130)) lt!2120) (bitAt!0 (buf!403 (_2!105 lt!2109)) lt!2120))))

(declare-fun lt!2093 () Unit!142)

(assert (=> b!2557 (= lt!2093 lt!2117)))

(declare-fun b!2558 () Bool)

(declare-fun res!4253 () Bool)

(assert (=> b!2558 (=> (not res!4253) (not e!1798))))

(assert (=> b!2558 (= res!4253 (= (size!94 (buf!403 thiss!1486)) (size!94 (buf!403 (_2!105 lt!2116)))))))

(declare-fun b!2559 () Bool)

(declare-fun e!1800 () Bool)

(declare-fun lt!2129 () (_ BitVec 64))

(assert (=> b!2559 (= e!1800 (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 thiss!1486))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486)) lt!2129))))

(declare-fun b!2560 () Bool)

(declare-fun Unit!155 () Unit!142)

(assert (=> b!2560 (= e!1799 (tuple2!197 Unit!155 thiss!1486))))

(assert (=> b!2560 (= (size!94 (buf!403 thiss!1486)) (size!94 (buf!403 thiss!1486)))))

(declare-fun lt!2101 () Unit!142)

(declare-fun Unit!156 () Unit!142)

(assert (=> b!2560 (= lt!2101 Unit!156)))

(declare-fun checkByteArrayBitContent!0 (BitStream!166 array!231 array!231 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!208 0))(
  ( (tuple2!209 (_1!111 array!231) (_2!111 BitStream!166)) )
))
(declare-fun readBits!0 (BitStream!166 (_ BitVec 64)) tuple2!208)

(assert (=> b!2560 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!111 (readBits!0 (_1!106 call!14) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!2561 () Bool)

(declare-fun res!4249 () Bool)

(assert (=> b!2561 (=> (not res!4249) (not e!1798))))

(assert (=> b!2561 (= res!4249 (invariant!0 (currentBit!1353 (_2!105 lt!2116)) (currentByte!1358 (_2!105 lt!2116)) (size!94 (buf!403 (_2!105 lt!2116)))))))

(declare-fun b!2562 () Bool)

(declare-fun res!4254 () Bool)

(assert (=> b!2562 (=> (not res!4254) (not e!1798))))

(assert (=> b!2562 (= res!4254 (isPrefixOf!0 thiss!1486 (_2!105 lt!2116)))))

(declare-fun bm!11 () Bool)

(assert (=> bm!11 (= call!14 (reader!0 thiss!1486 (ite c!107 (_2!105 lt!2109) thiss!1486)))))

(declare-fun b!2563 () Bool)

(declare-fun res!4252 () Bool)

(assert (=> b!2563 (=> (not res!4252) (not e!1798))))

(assert (=> b!2563 (= res!4252 (= (size!94 (buf!403 (_2!105 lt!2116))) (size!94 (buf!403 thiss!1486))))))

(declare-fun b!2564 () Bool)

(declare-fun lt!2098 () tuple2!198)

(assert (=> b!2564 (= e!1798 (= (bitStreamReadBitsIntoList!0 (_2!105 lt!2116) (_1!106 lt!2098) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!105 lt!2116) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!2564 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2564 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!2128 () Unit!142)

(declare-fun lt!2131 () Unit!142)

(assert (=> b!2564 (= lt!2128 lt!2131)))

(assert (=> b!2564 (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!2116)))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486)) lt!2129)))

(assert (=> b!2564 (= lt!2131 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!403 (_2!105 lt!2116)) lt!2129))))

(assert (=> b!2564 e!1800))

(declare-fun res!4251 () Bool)

(assert (=> b!2564 (=> (not res!4251) (not e!1800))))

(assert (=> b!2564 (= res!4251 (and (= (size!94 (buf!403 thiss!1486)) (size!94 (buf!403 (_2!105 lt!2116)))) (bvsge lt!2129 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2564 (= lt!2129 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!2564 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2564 (= lt!2098 (reader!0 thiss!1486 (_2!105 lt!2116)))))

(assert (= (and d!1424 c!107) b!2557))

(assert (= (and d!1424 (not c!107)) b!2560))

(assert (= (or b!2557 b!2560) bm!11))

(assert (= (and d!1424 res!4250) b!2561))

(assert (= (and b!2561 res!4249) b!2558))

(assert (= (and b!2558 res!4253) b!2562))

(assert (= (and b!2562 res!4254) b!2563))

(assert (= (and b!2563 res!4252) b!2564))

(assert (= (and b!2564 res!4251) b!2559))

(declare-fun m!2235 () Bool)

(assert (=> d!1424 m!2235))

(assert (=> d!1424 m!2083))

(declare-fun m!2237 () Bool)

(assert (=> d!1424 m!2237))

(declare-fun m!2239 () Bool)

(assert (=> d!1424 m!2239))

(declare-fun m!2241 () Bool)

(assert (=> b!2557 m!2241))

(declare-fun m!2243 () Bool)

(assert (=> b!2557 m!2243))

(declare-fun m!2245 () Bool)

(assert (=> b!2557 m!2245))

(declare-fun m!2247 () Bool)

(assert (=> b!2557 m!2247))

(declare-fun m!2249 () Bool)

(assert (=> b!2557 m!2249))

(declare-fun m!2251 () Bool)

(assert (=> b!2557 m!2251))

(assert (=> b!2557 m!2241))

(declare-fun m!2253 () Bool)

(assert (=> b!2557 m!2253))

(declare-fun m!2255 () Bool)

(assert (=> b!2557 m!2255))

(declare-fun m!2257 () Bool)

(assert (=> b!2557 m!2257))

(declare-fun m!2259 () Bool)

(assert (=> b!2557 m!2259))

(declare-fun m!2261 () Bool)

(assert (=> b!2557 m!2261))

(declare-fun m!2263 () Bool)

(assert (=> b!2557 m!2263))

(declare-fun m!2265 () Bool)

(assert (=> b!2557 m!2265))

(declare-fun m!2267 () Bool)

(assert (=> b!2557 m!2267))

(declare-fun m!2269 () Bool)

(assert (=> b!2557 m!2269))

(declare-fun m!2271 () Bool)

(assert (=> b!2557 m!2271))

(declare-fun m!2273 () Bool)

(assert (=> b!2557 m!2273))

(declare-fun m!2275 () Bool)

(assert (=> b!2557 m!2275))

(declare-fun m!2277 () Bool)

(assert (=> b!2557 m!2277))

(assert (=> b!2557 m!2083))

(declare-fun m!2279 () Bool)

(assert (=> b!2557 m!2279))

(declare-fun m!2281 () Bool)

(assert (=> b!2557 m!2281))

(declare-fun m!2283 () Bool)

(assert (=> b!2557 m!2283))

(declare-fun m!2285 () Bool)

(assert (=> b!2557 m!2285))

(declare-fun m!2287 () Bool)

(assert (=> b!2557 m!2287))

(declare-fun m!2289 () Bool)

(assert (=> b!2557 m!2289))

(assert (=> b!2557 m!2259))

(declare-fun m!2291 () Bool)

(assert (=> b!2557 m!2291))

(declare-fun m!2293 () Bool)

(assert (=> b!2557 m!2293))

(declare-fun m!2295 () Bool)

(assert (=> b!2557 m!2295))

(declare-fun m!2297 () Bool)

(assert (=> b!2557 m!2297))

(assert (=> b!2557 m!2255))

(declare-fun m!2299 () Bool)

(assert (=> b!2557 m!2299))

(assert (=> b!2557 m!2271))

(declare-fun m!2301 () Bool)

(assert (=> b!2557 m!2301))

(declare-fun m!2303 () Bool)

(assert (=> b!2564 m!2303))

(declare-fun m!2305 () Bool)

(assert (=> b!2564 m!2305))

(declare-fun m!2307 () Bool)

(assert (=> b!2564 m!2307))

(declare-fun m!2309 () Bool)

(assert (=> b!2564 m!2309))

(declare-fun m!2311 () Bool)

(assert (=> b!2564 m!2311))

(declare-fun m!2313 () Bool)

(assert (=> b!2562 m!2313))

(declare-fun m!2315 () Bool)

(assert (=> b!2559 m!2315))

(declare-fun m!2317 () Bool)

(assert (=> bm!11 m!2317))

(declare-fun m!2319 () Bool)

(assert (=> b!2560 m!2319))

(declare-fun m!2321 () Bool)

(assert (=> b!2560 m!2321))

(declare-fun m!2323 () Bool)

(assert (=> b!2561 m!2323))

(assert (=> b!2432 d!1424))

(declare-fun d!1450 () Bool)

(assert (=> d!1450 (= (array_inv!89 (buf!403 thiss!1486)) (bvsge (size!94 (buf!403 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!2436 d!1450))

(declare-fun d!1452 () Bool)

(assert (=> d!1452 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!1834)))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!1834)))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486))) nBits!460))))

(declare-fun bs!553 () Bool)

(assert (= bs!553 d!1452))

(declare-fun m!2325 () Bool)

(assert (=> bs!553 m!2325))

(assert (=> b!2431 d!1452))

(declare-fun d!1454 () Bool)

(assert (=> d!1454 (validate_offset_bits!1 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!1834)))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486)) nBits!460)))

(declare-fun lt!2138 () Unit!142)

(declare-fun choose!9 (BitStream!166 array!231 (_ BitVec 64) BitStream!166) Unit!142)

(assert (=> d!1454 (= lt!2138 (choose!9 thiss!1486 (buf!403 (_2!105 lt!1834)) nBits!460 (BitStream!167 (buf!403 (_2!105 lt!1834)) (currentByte!1358 thiss!1486) (currentBit!1353 thiss!1486))))))

(assert (=> d!1454 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!403 (_2!105 lt!1834)) nBits!460) lt!2138)))

(declare-fun bs!554 () Bool)

(assert (= bs!554 d!1454))

(assert (=> bs!554 m!2069))

(declare-fun m!2327 () Bool)

(assert (=> bs!554 m!2327))

(assert (=> b!2431 d!1454))

(declare-fun lt!2356 () (_ BitVec 64))

(declare-fun e!1818 () Bool)

(declare-fun lt!2357 () tuple2!198)

(declare-fun b!2607 () Bool)

(declare-fun lt!2366 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!166 (_ BitVec 64)) BitStream!166)

(assert (=> b!2607 (= e!1818 (= (_1!106 lt!2357) (withMovedBitIndex!0 (_2!106 lt!2357) (bvsub lt!2366 lt!2356))))))

(assert (=> b!2607 (or (= (bvand lt!2366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2356 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2366 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2366 lt!2356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2607 (= lt!2356 (bitIndex!0 (size!94 (buf!403 (_2!105 lt!1834))) (currentByte!1358 (_2!105 lt!1834)) (currentBit!1353 (_2!105 lt!1834))))))

(assert (=> b!2607 (= lt!2366 (bitIndex!0 (size!94 (buf!403 thiss!1486)) (currentByte!1358 thiss!1486) (currentBit!1353 thiss!1486)))))

(declare-fun b!2608 () Bool)

(declare-fun res!4286 () Bool)

(assert (=> b!2608 (=> (not res!4286) (not e!1818))))

(assert (=> b!2608 (= res!4286 (isPrefixOf!0 (_1!106 lt!2357) thiss!1486))))

(declare-fun b!2609 () Bool)

(declare-fun res!4285 () Bool)

(assert (=> b!2609 (=> (not res!4285) (not e!1818))))

(assert (=> b!2609 (= res!4285 (isPrefixOf!0 (_2!106 lt!2357) (_2!105 lt!1834)))))

(declare-fun b!2610 () Bool)

(declare-fun e!1817 () Unit!142)

(declare-fun Unit!169 () Unit!142)

(assert (=> b!2610 (= e!1817 Unit!169)))

(declare-fun d!1456 () Bool)

(assert (=> d!1456 e!1818))

(declare-fun res!4287 () Bool)

(assert (=> d!1456 (=> (not res!4287) (not e!1818))))

(assert (=> d!1456 (= res!4287 (isPrefixOf!0 (_1!106 lt!2357) (_2!106 lt!2357)))))

(declare-fun lt!2364 () BitStream!166)

(assert (=> d!1456 (= lt!2357 (tuple2!199 lt!2364 (_2!105 lt!1834)))))

(declare-fun lt!2363 () Unit!142)

(declare-fun lt!2358 () Unit!142)

(assert (=> d!1456 (= lt!2363 lt!2358)))

(assert (=> d!1456 (isPrefixOf!0 lt!2364 (_2!105 lt!1834))))

(assert (=> d!1456 (= lt!2358 (lemmaIsPrefixTransitive!0 lt!2364 (_2!105 lt!1834) (_2!105 lt!1834)))))

(declare-fun lt!2365 () Unit!142)

(declare-fun lt!2372 () Unit!142)

(assert (=> d!1456 (= lt!2365 lt!2372)))

(assert (=> d!1456 (isPrefixOf!0 lt!2364 (_2!105 lt!1834))))

(assert (=> d!1456 (= lt!2372 (lemmaIsPrefixTransitive!0 lt!2364 thiss!1486 (_2!105 lt!1834)))))

(declare-fun lt!2359 () Unit!142)

(assert (=> d!1456 (= lt!2359 e!1817)))

(declare-fun c!114 () Bool)

(assert (=> d!1456 (= c!114 (not (= (size!94 (buf!403 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!2361 () Unit!142)

(declare-fun lt!2371 () Unit!142)

(assert (=> d!1456 (= lt!2361 lt!2371)))

(assert (=> d!1456 (isPrefixOf!0 (_2!105 lt!1834) (_2!105 lt!1834))))

(assert (=> d!1456 (= lt!2371 (lemmaIsPrefixRefl!0 (_2!105 lt!1834)))))

(declare-fun lt!2369 () Unit!142)

(declare-fun lt!2367 () Unit!142)

(assert (=> d!1456 (= lt!2369 lt!2367)))

(assert (=> d!1456 (= lt!2367 (lemmaIsPrefixRefl!0 (_2!105 lt!1834)))))

(declare-fun lt!2374 () Unit!142)

(declare-fun lt!2373 () Unit!142)

(assert (=> d!1456 (= lt!2374 lt!2373)))

(assert (=> d!1456 (isPrefixOf!0 lt!2364 lt!2364)))

(assert (=> d!1456 (= lt!2373 (lemmaIsPrefixRefl!0 lt!2364))))

(declare-fun lt!2368 () Unit!142)

(declare-fun lt!2362 () Unit!142)

(assert (=> d!1456 (= lt!2368 lt!2362)))

(assert (=> d!1456 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1456 (= lt!2362 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1456 (= lt!2364 (BitStream!167 (buf!403 (_2!105 lt!1834)) (currentByte!1358 thiss!1486) (currentBit!1353 thiss!1486)))))

(assert (=> d!1456 (isPrefixOf!0 thiss!1486 (_2!105 lt!1834))))

(assert (=> d!1456 (= (reader!0 thiss!1486 (_2!105 lt!1834)) lt!2357)))

(declare-fun b!2611 () Bool)

(declare-fun lt!2360 () Unit!142)

(assert (=> b!2611 (= e!1817 lt!2360)))

(declare-fun lt!2355 () (_ BitVec 64))

(assert (=> b!2611 (= lt!2355 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2370 () (_ BitVec 64))

(assert (=> b!2611 (= lt!2370 (bitIndex!0 (size!94 (buf!403 thiss!1486)) (currentByte!1358 thiss!1486) (currentBit!1353 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!231 array!231 (_ BitVec 64) (_ BitVec 64)) Unit!142)

(assert (=> b!2611 (= lt!2360 (arrayBitRangesEqSymmetric!0 (buf!403 thiss!1486) (buf!403 (_2!105 lt!1834)) lt!2355 lt!2370))))

(declare-fun arrayBitRangesEq!0 (array!231 array!231 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2611 (arrayBitRangesEq!0 (buf!403 (_2!105 lt!1834)) (buf!403 thiss!1486) lt!2355 lt!2370)))

(assert (= (and d!1456 c!114) b!2611))

(assert (= (and d!1456 (not c!114)) b!2610))

(assert (= (and d!1456 res!4287) b!2608))

(assert (= (and b!2608 res!4286) b!2609))

(assert (= (and b!2609 res!4285) b!2607))

(assert (=> b!2611 m!2083))

(declare-fun m!2329 () Bool)

(assert (=> b!2611 m!2329))

(declare-fun m!2331 () Bool)

(assert (=> b!2611 m!2331))

(declare-fun m!2333 () Bool)

(assert (=> d!1456 m!2333))

(assert (=> d!1456 m!2237))

(declare-fun m!2335 () Bool)

(assert (=> d!1456 m!2335))

(declare-fun m!2337 () Bool)

(assert (=> d!1456 m!2337))

(assert (=> d!1456 m!2087))

(declare-fun m!2339 () Bool)

(assert (=> d!1456 m!2339))

(declare-fun m!2341 () Bool)

(assert (=> d!1456 m!2341))

(declare-fun m!2343 () Bool)

(assert (=> d!1456 m!2343))

(declare-fun m!2345 () Bool)

(assert (=> d!1456 m!2345))

(assert (=> d!1456 m!2239))

(declare-fun m!2347 () Bool)

(assert (=> d!1456 m!2347))

(declare-fun m!2349 () Bool)

(assert (=> b!2608 m!2349))

(declare-fun m!2351 () Bool)

(assert (=> b!2609 m!2351))

(declare-fun m!2353 () Bool)

(assert (=> b!2607 m!2353))

(assert (=> b!2607 m!2081))

(assert (=> b!2607 m!2083))

(assert (=> b!2431 d!1456))

(declare-fun d!1458 () Bool)

(declare-fun res!4307 () Bool)

(declare-fun e!1830 () Bool)

(assert (=> d!1458 (=> (not res!4307) (not e!1830))))

(assert (=> d!1458 (= res!4307 (= (size!94 (buf!403 thiss!1486)) (size!94 (buf!403 (_2!105 lt!1834)))))))

(assert (=> d!1458 (= (isPrefixOf!0 thiss!1486 (_2!105 lt!1834)) e!1830)))

(declare-fun b!2634 () Bool)

(declare-fun res!4306 () Bool)

(assert (=> b!2634 (=> (not res!4306) (not e!1830))))

(assert (=> b!2634 (= res!4306 (bvsle (bitIndex!0 (size!94 (buf!403 thiss!1486)) (currentByte!1358 thiss!1486) (currentBit!1353 thiss!1486)) (bitIndex!0 (size!94 (buf!403 (_2!105 lt!1834))) (currentByte!1358 (_2!105 lt!1834)) (currentBit!1353 (_2!105 lt!1834)))))))

(declare-fun b!2635 () Bool)

(declare-fun e!1829 () Bool)

(assert (=> b!2635 (= e!1830 e!1829)))

(declare-fun res!4308 () Bool)

(assert (=> b!2635 (=> res!4308 e!1829)))

(assert (=> b!2635 (= res!4308 (= (size!94 (buf!403 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!2636 () Bool)

(assert (=> b!2636 (= e!1829 (arrayBitRangesEq!0 (buf!403 thiss!1486) (buf!403 (_2!105 lt!1834)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!94 (buf!403 thiss!1486)) (currentByte!1358 thiss!1486) (currentBit!1353 thiss!1486))))))

(assert (= (and d!1458 res!4307) b!2634))

(assert (= (and b!2634 res!4306) b!2635))

(assert (= (and b!2635 (not res!4308)) b!2636))

(assert (=> b!2634 m!2083))

(assert (=> b!2634 m!2081))

(assert (=> b!2636 m!2083))

(assert (=> b!2636 m!2083))

(declare-fun m!2363 () Bool)

(assert (=> b!2636 m!2363))

(assert (=> b!2430 d!1458))

(declare-fun d!1460 () Bool)

(declare-fun e!1833 () Bool)

(assert (=> d!1460 e!1833))

(declare-fun res!4313 () Bool)

(assert (=> d!1460 (=> (not res!4313) (not e!1833))))

(declare-fun lt!2477 () (_ BitVec 64))

(declare-fun lt!2475 () (_ BitVec 64))

(declare-fun lt!2480 () (_ BitVec 64))

(assert (=> d!1460 (= res!4313 (= lt!2475 (bvsub lt!2480 lt!2477)))))

(assert (=> d!1460 (or (= (bvand lt!2480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2477 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2480 lt!2477) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1460 (= lt!2477 (remainingBits!0 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!1834)))) ((_ sign_extend 32) (currentByte!1358 (_2!105 lt!1834))) ((_ sign_extend 32) (currentBit!1353 (_2!105 lt!1834)))))))

(declare-fun lt!2476 () (_ BitVec 64))

(declare-fun lt!2479 () (_ BitVec 64))

(assert (=> d!1460 (= lt!2480 (bvmul lt!2476 lt!2479))))

(assert (=> d!1460 (or (= lt!2476 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!2479 (bvsdiv (bvmul lt!2476 lt!2479) lt!2476)))))

(assert (=> d!1460 (= lt!2479 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1460 (= lt!2476 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!1834)))))))

(assert (=> d!1460 (= lt!2475 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1358 (_2!105 lt!1834))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1353 (_2!105 lt!1834)))))))

(assert (=> d!1460 (invariant!0 (currentBit!1353 (_2!105 lt!1834)) (currentByte!1358 (_2!105 lt!1834)) (size!94 (buf!403 (_2!105 lt!1834))))))

(assert (=> d!1460 (= (bitIndex!0 (size!94 (buf!403 (_2!105 lt!1834))) (currentByte!1358 (_2!105 lt!1834)) (currentBit!1353 (_2!105 lt!1834))) lt!2475)))

(declare-fun b!2641 () Bool)

(declare-fun res!4314 () Bool)

(assert (=> b!2641 (=> (not res!4314) (not e!1833))))

(assert (=> b!2641 (= res!4314 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!2475))))

(declare-fun b!2642 () Bool)

(declare-fun lt!2478 () (_ BitVec 64))

(assert (=> b!2642 (= e!1833 (bvsle lt!2475 (bvmul lt!2478 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!2642 (or (= lt!2478 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!2478 #b0000000000000000000000000000000000000000000000000000000000001000) lt!2478)))))

(assert (=> b!2642 (= lt!2478 ((_ sign_extend 32) (size!94 (buf!403 (_2!105 lt!1834)))))))

(assert (= (and d!1460 res!4313) b!2641))

(assert (= (and b!2641 res!4314) b!2642))

(declare-fun m!2531 () Bool)

(assert (=> d!1460 m!2531))

(assert (=> d!1460 m!2075))

(assert (=> b!2435 d!1460))

(declare-fun d!1472 () Bool)

(declare-fun e!1836 () Bool)

(assert (=> d!1472 e!1836))

(declare-fun res!4317 () Bool)

(assert (=> d!1472 (=> (not res!4317) (not e!1836))))

(declare-fun lt!2491 () (_ BitVec 64))

(declare-fun lt!2496 () (_ BitVec 64))

(declare-fun lt!2493 () (_ BitVec 64))

(assert (=> d!1472 (= res!4317 (= lt!2491 (bvsub lt!2496 lt!2493)))))

(assert (=> d!1472 (or (= (bvand lt!2496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2493 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2496 lt!2493) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1472 (= lt!2493 (remainingBits!0 ((_ sign_extend 32) (size!94 (buf!403 thiss!1486))) ((_ sign_extend 32) (currentByte!1358 thiss!1486)) ((_ sign_extend 32) (currentBit!1353 thiss!1486))))))

(declare-fun lt!2492 () (_ BitVec 64))

(declare-fun lt!2495 () (_ BitVec 64))

(assert (=> d!1472 (= lt!2496 (bvmul lt!2492 lt!2495))))

(assert (=> d!1472 (or (= lt!2492 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!2495 (bvsdiv (bvmul lt!2492 lt!2495) lt!2492)))))

(assert (=> d!1472 (= lt!2495 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1472 (= lt!2492 ((_ sign_extend 32) (size!94 (buf!403 thiss!1486))))))

(assert (=> d!1472 (= lt!2491 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1358 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1353 thiss!1486))))))

(assert (=> d!1472 (invariant!0 (currentBit!1353 thiss!1486) (currentByte!1358 thiss!1486) (size!94 (buf!403 thiss!1486)))))

(assert (=> d!1472 (= (bitIndex!0 (size!94 (buf!403 thiss!1486)) (currentByte!1358 thiss!1486) (currentBit!1353 thiss!1486)) lt!2491)))

(declare-fun b!2643 () Bool)

(declare-fun res!4318 () Bool)

(assert (=> b!2643 (=> (not res!4318) (not e!1836))))

(assert (=> b!2643 (= res!4318 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!2491))))

(declare-fun b!2644 () Bool)

(declare-fun lt!2494 () (_ BitVec 64))

(assert (=> b!2644 (= e!1836 (bvsle lt!2491 (bvmul lt!2494 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!2644 (or (= lt!2494 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!2494 #b0000000000000000000000000000000000000000000000000000000000001000) lt!2494)))))

(assert (=> b!2644 (= lt!2494 ((_ sign_extend 32) (size!94 (buf!403 thiss!1486))))))

(assert (= (and d!1472 res!4317) b!2643))

(assert (= (and b!2643 res!4318) b!2644))

(assert (=> d!1472 m!2145))

(assert (=> d!1472 m!2151))

(assert (=> b!2435 d!1472))

(push 1)

(assert (not b!2564))

(assert (not b!2561))

(assert (not d!1456))

(assert (not d!1424))

(assert (not d!1408))

(assert (not d!1472))

(assert (not b!2611))

(assert (not b!2634))

(assert (not d!1452))

(assert (not b!2560))

(assert (not b!2608))

(assert (not b!2562))

(assert (not d!1460))

(assert (not b!2557))

(assert (not d!1454))

(assert (not b!2609))

(assert (not d!1416))

(assert (not b!2559))

(assert (not b!2607))

(assert (not bm!11))

(assert (not b!2636))

(assert (not d!1402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

