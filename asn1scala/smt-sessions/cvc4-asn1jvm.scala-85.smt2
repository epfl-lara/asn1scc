; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1734 () Bool)

(assert start!1734)

(declare-fun b!8315 () Bool)

(declare-fun e!5216 () Bool)

(declare-datatypes ((array!556 0))(
  ( (array!557 (arr!645 (Array (_ BitVec 32) (_ BitVec 8))) (size!240 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!458 0))(
  ( (BitStream!459 (buf!576 array!556) (currentByte!1597 (_ BitVec 32)) (currentBit!1592 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!458)

(declare-fun array_inv!235 (array!556) Bool)

(assert (=> b!8315 (= e!5216 (array_inv!235 (buf!576 thiss!1486)))))

(declare-fun e!5214 () Bool)

(declare-datatypes ((Unit!692 0))(
  ( (Unit!693) )
))
(declare-datatypes ((tuple2!1124 0))(
  ( (tuple2!1125 (_1!593 Unit!692) (_2!593 BitStream!458)) )
))
(declare-fun lt!11555 () tuple2!1124)

(declare-fun b!8316 () Bool)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8316 (= e!5214 (not (= (bitIndex!0 (size!240 (buf!576 (_2!593 lt!11555))) (currentByte!1597 (_2!593 lt!11555)) (currentBit!1592 (_2!593 lt!11555))) (bvadd (bitIndex!0 (size!240 (buf!576 thiss!1486)) (currentByte!1597 thiss!1486) (currentBit!1592 thiss!1486)) nBits!460))))))

(declare-fun res!8879 () Bool)

(declare-fun e!5213 () Bool)

(assert (=> start!1734 (=> (not res!8879) (not e!5213))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!556)

(assert (=> start!1734 (= res!8879 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!240 srcBuffer!6))))))))

(assert (=> start!1734 e!5213))

(assert (=> start!1734 true))

(assert (=> start!1734 (array_inv!235 srcBuffer!6)))

(declare-fun inv!12 (BitStream!458) Bool)

(assert (=> start!1734 (and (inv!12 thiss!1486) e!5216)))

(declare-fun b!8317 () Bool)

(assert (=> b!8317 (= e!5213 e!5214)))

(declare-fun res!8878 () Bool)

(assert (=> b!8317 (=> (not res!8878) (not e!5214))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8317 (= res!8878 (invariant!0 (currentBit!1592 (_2!593 lt!11555)) (currentByte!1597 (_2!593 lt!11555)) (size!240 (buf!576 (_2!593 lt!11555)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!458 array!556 (_ BitVec 64) (_ BitVec 64)) tuple2!1124)

(assert (=> b!8317 (= lt!11555 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8318 () Bool)

(declare-fun res!8880 () Bool)

(assert (=> b!8318 (=> (not res!8880) (not e!5214))))

(assert (=> b!8318 (= res!8880 (= (size!240 (buf!576 thiss!1486)) (size!240 (buf!576 (_2!593 lt!11555)))))))

(declare-fun b!8319 () Bool)

(declare-fun res!8881 () Bool)

(assert (=> b!8319 (=> (not res!8881) (not e!5213))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8319 (= res!8881 (validate_offset_bits!1 ((_ sign_extend 32) (size!240 (buf!576 thiss!1486))) ((_ sign_extend 32) (currentByte!1597 thiss!1486)) ((_ sign_extend 32) (currentBit!1592 thiss!1486)) nBits!460))))

(assert (= (and start!1734 res!8879) b!8319))

(assert (= (and b!8319 res!8881) b!8317))

(assert (= (and b!8317 res!8878) b!8318))

(assert (= (and b!8318 res!8880) b!8316))

(assert (= start!1734 b!8315))

(declare-fun m!11123 () Bool)

(assert (=> b!8317 m!11123))

(declare-fun m!11125 () Bool)

(assert (=> b!8317 m!11125))

(declare-fun m!11127 () Bool)

(assert (=> start!1734 m!11127))

(declare-fun m!11129 () Bool)

(assert (=> start!1734 m!11129))

(declare-fun m!11131 () Bool)

(assert (=> b!8316 m!11131))

(declare-fun m!11133 () Bool)

(assert (=> b!8316 m!11133))

(declare-fun m!11135 () Bool)

(assert (=> b!8315 m!11135))

(declare-fun m!11137 () Bool)

(assert (=> b!8319 m!11137))

(push 1)

(assert (not start!1734))

(assert (not b!8316))

(assert (not b!8315))

(assert (not b!8317))

(assert (not b!8319))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2452 () Bool)

(assert (=> d!2452 (= (array_inv!235 (buf!576 thiss!1486)) (bvsge (size!240 (buf!576 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8315 d!2452))

(declare-fun d!2454 () Bool)

(declare-fun e!5223 () Bool)

(assert (=> d!2454 e!5223))

(declare-fun res!8894 () Bool)

(assert (=> d!2454 (=> (not res!8894) (not e!5223))))

(declare-fun lt!11594 () (_ BitVec 64))

(declare-fun lt!11596 () (_ BitVec 64))

(declare-fun lt!11595 () (_ BitVec 64))

(assert (=> d!2454 (= res!8894 (= lt!11594 (bvsub lt!11596 lt!11595)))))

(assert (=> d!2454 (or (= (bvand lt!11596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!11595 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11596 lt!11595) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2454 (= lt!11595 (remainingBits!0 ((_ sign_extend 32) (size!240 (buf!576 (_2!593 lt!11555)))) ((_ sign_extend 32) (currentByte!1597 (_2!593 lt!11555))) ((_ sign_extend 32) (currentBit!1592 (_2!593 lt!11555)))))))

(declare-fun lt!11593 () (_ BitVec 64))

(declare-fun lt!11592 () (_ BitVec 64))

(assert (=> d!2454 (= lt!11596 (bvmul lt!11593 lt!11592))))

(assert (=> d!2454 (or (= lt!11593 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!11592 (bvsdiv (bvmul lt!11593 lt!11592) lt!11593)))))

(assert (=> d!2454 (= lt!11592 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2454 (= lt!11593 ((_ sign_extend 32) (size!240 (buf!576 (_2!593 lt!11555)))))))

(assert (=> d!2454 (= lt!11594 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1597 (_2!593 lt!11555))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1592 (_2!593 lt!11555)))))))

(assert (=> d!2454 (invariant!0 (currentBit!1592 (_2!593 lt!11555)) (currentByte!1597 (_2!593 lt!11555)) (size!240 (buf!576 (_2!593 lt!11555))))))

(assert (=> d!2454 (= (bitIndex!0 (size!240 (buf!576 (_2!593 lt!11555))) (currentByte!1597 (_2!593 lt!11555)) (currentBit!1592 (_2!593 lt!11555))) lt!11594)))

(declare-fun b!8332 () Bool)

(declare-fun res!8895 () Bool)

(assert (=> b!8332 (=> (not res!8895) (not e!5223))))

(assert (=> b!8332 (= res!8895 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!11594))))

(declare-fun b!8333 () Bool)

(declare-fun lt!11597 () (_ BitVec 64))

(assert (=> b!8333 (= e!5223 (bvsle lt!11594 (bvmul lt!11597 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8333 (or (= lt!11597 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!11597 #b0000000000000000000000000000000000000000000000000000000000001000) lt!11597)))))

(assert (=> b!8333 (= lt!11597 ((_ sign_extend 32) (size!240 (buf!576 (_2!593 lt!11555)))))))

(assert (= (and d!2454 res!8894) b!8332))

(assert (= (and b!8332 res!8895) b!8333))

(declare-fun m!11147 () Bool)

(assert (=> d!2454 m!11147))

(assert (=> d!2454 m!11123))

(assert (=> b!8316 d!2454))

(declare-fun d!2462 () Bool)

(declare-fun e!5224 () Bool)

(assert (=> d!2462 e!5224))

(declare-fun res!8896 () Bool)

(assert (=> d!2462 (=> (not res!8896) (not e!5224))))

(declare-fun lt!11601 () (_ BitVec 64))

(declare-fun lt!11602 () (_ BitVec 64))

(declare-fun lt!11600 () (_ BitVec 64))

(assert (=> d!2462 (= res!8896 (= lt!11600 (bvsub lt!11602 lt!11601)))))

(assert (=> d!2462 (or (= (bvand lt!11602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!11601 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11602 lt!11601) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2462 (= lt!11601 (remainingBits!0 ((_ sign_extend 32) (size!240 (buf!576 thiss!1486))) ((_ sign_extend 32) (currentByte!1597 thiss!1486)) ((_ sign_extend 32) (currentBit!1592 thiss!1486))))))

(declare-fun lt!11599 () (_ BitVec 64))

(declare-fun lt!11598 () (_ BitVec 64))

(assert (=> d!2462 (= lt!11602 (bvmul lt!11599 lt!11598))))

(assert (=> d!2462 (or (= lt!11599 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!11598 (bvsdiv (bvmul lt!11599 lt!11598) lt!11599)))))

(assert (=> d!2462 (= lt!11598 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2462 (= lt!11599 ((_ sign_extend 32) (size!240 (buf!576 thiss!1486))))))

(assert (=> d!2462 (= lt!11600 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1597 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1592 thiss!1486))))))

(assert (=> d!2462 (invariant!0 (currentBit!1592 thiss!1486) (currentByte!1597 thiss!1486) (size!240 (buf!576 thiss!1486)))))

(assert (=> d!2462 (= (bitIndex!0 (size!240 (buf!576 thiss!1486)) (currentByte!1597 thiss!1486) (currentBit!1592 thiss!1486)) lt!11600)))

(declare-fun b!8334 () Bool)

(declare-fun res!8897 () Bool)

(assert (=> b!8334 (=> (not res!8897) (not e!5224))))

(assert (=> b!8334 (= res!8897 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!11600))))

(declare-fun b!8335 () Bool)

(declare-fun lt!11603 () (_ BitVec 64))

(assert (=> b!8335 (= e!5224 (bvsle lt!11600 (bvmul lt!11603 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8335 (or (= lt!11603 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!11603 #b0000000000000000000000000000000000000000000000000000000000001000) lt!11603)))))

(assert (=> b!8335 (= lt!11603 ((_ sign_extend 32) (size!240 (buf!576 thiss!1486))))))

(assert (= (and d!2462 res!8896) b!8334))

(assert (= (and b!8334 res!8897) b!8335))

(declare-fun m!11149 () Bool)

(assert (=> d!2462 m!11149))

(declare-fun m!11151 () Bool)

(assert (=> d!2462 m!11151))

(assert (=> b!8316 d!2462))

(declare-fun d!2464 () Bool)

(assert (=> d!2464 (= (array_inv!235 srcBuffer!6) (bvsge (size!240 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1734 d!2464))

(declare-fun d!2466 () Bool)

(assert (=> d!2466 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1592 thiss!1486) (currentByte!1597 thiss!1486) (size!240 (buf!576 thiss!1486))))))

(declare-fun bs!833 () Bool)

(assert (= bs!833 d!2466))

(assert (=> bs!833 m!11151))

(assert (=> start!1734 d!2466))

(declare-fun d!2468 () Bool)

(assert (=> d!2468 (= (invariant!0 (currentBit!1592 (_2!593 lt!11555)) (currentByte!1597 (_2!593 lt!11555)) (size!240 (buf!576 (_2!593 lt!11555)))) (and (bvsge (currentBit!1592 (_2!593 lt!11555)) #b00000000000000000000000000000000) (bvslt (currentBit!1592 (_2!593 lt!11555)) #b00000000000000000000000000001000) (bvsge (currentByte!1597 (_2!593 lt!11555)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1597 (_2!593 lt!11555)) (size!240 (buf!576 (_2!593 lt!11555)))) (and (= (currentBit!1592 (_2!593 lt!11555)) #b00000000000000000000000000000000) (= (currentByte!1597 (_2!593 lt!11555)) (size!240 (buf!576 (_2!593 lt!11555))))))))))

(assert (=> b!8317 d!2468))

(declare-fun b!8408 () Bool)

(declare-fun e!5254 () tuple2!1124)

(declare-fun lt!11997 () tuple2!1124)

(declare-fun Unit!706 () Unit!692)

(assert (=> b!8408 (= e!5254 (tuple2!1125 Unit!706 (_2!593 lt!11997)))))

(declare-fun lt!11981 () tuple2!1124)

(declare-fun appendBitFromByte!0 (BitStream!458 (_ BitVec 8) (_ BitVec 32)) tuple2!1124)

(assert (=> b!8408 (= lt!11981 (appendBitFromByte!0 thiss!1486 (select (arr!645 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!11988 () (_ BitVec 64))

(assert (=> b!8408 (= lt!11988 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11998 () (_ BitVec 64))

(assert (=> b!8408 (= lt!11998 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11991 () Unit!692)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!458 BitStream!458 (_ BitVec 64) (_ BitVec 64)) Unit!692)

(assert (=> b!8408 (= lt!11991 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!593 lt!11981) lt!11988 lt!11998))))

(assert (=> b!8408 (validate_offset_bits!1 ((_ sign_extend 32) (size!240 (buf!576 (_2!593 lt!11981)))) ((_ sign_extend 32) (currentByte!1597 (_2!593 lt!11981))) ((_ sign_extend 32) (currentBit!1592 (_2!593 lt!11981))) (bvsub lt!11988 lt!11998))))

(declare-fun lt!12004 () Unit!692)

(assert (=> b!8408 (= lt!12004 lt!11991)))

(declare-datatypes ((tuple2!1134 0))(
  ( (tuple2!1135 (_1!598 BitStream!458) (_2!598 BitStream!458)) )
))
(declare-fun lt!11984 () tuple2!1134)

(declare-fun reader!0 (BitStream!458 BitStream!458) tuple2!1134)

(assert (=> b!8408 (= lt!11984 (reader!0 thiss!1486 (_2!593 lt!11981)))))

(declare-fun lt!12020 () (_ BitVec 64))

(assert (=> b!8408 (= lt!12020 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11980 () Unit!692)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!458 array!556 (_ BitVec 64)) Unit!692)

(assert (=> b!8408 (= lt!11980 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!576 (_2!593 lt!11981)) lt!12020))))

(assert (=> b!8408 (validate_offset_bits!1 ((_ sign_extend 32) (size!240 (buf!576 (_2!593 lt!11981)))) ((_ sign_extend 32) (currentByte!1597 thiss!1486)) ((_ sign_extend 32) (currentBit!1592 thiss!1486)) lt!12020)))

(declare-fun lt!11989 () Unit!692)

(assert (=> b!8408 (= lt!11989 lt!11980)))

(declare-datatypes ((List!137 0))(
  ( (Nil!134) (Cons!133 (h!252 Bool) (t!887 List!137)) )
))
(declare-fun head!43 (List!137) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!458 array!556 (_ BitVec 64) (_ BitVec 64)) List!137)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!458 BitStream!458 (_ BitVec 64)) List!137)

(assert (=> b!8408 (= (head!43 (byteArrayBitContentToList!0 (_2!593 lt!11981) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!43 (bitStreamReadBitsIntoList!0 (_2!593 lt!11981) (_1!598 lt!11984) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11999 () Unit!692)

(declare-fun Unit!709 () Unit!692)

(assert (=> b!8408 (= lt!11999 Unit!709)))

(assert (=> b!8408 (= lt!11997 (appendBitsMSBFirstLoop!0 (_2!593 lt!11981) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!11983 () Unit!692)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!458 BitStream!458 BitStream!458) Unit!692)

(assert (=> b!8408 (= lt!11983 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!593 lt!11981) (_2!593 lt!11997)))))

(declare-fun isPrefixOf!0 (BitStream!458 BitStream!458) Bool)

(assert (=> b!8408 (isPrefixOf!0 thiss!1486 (_2!593 lt!11997))))

(declare-fun lt!11985 () Unit!692)

(assert (=> b!8408 (= lt!11985 lt!11983)))

(assert (=> b!8408 (= (size!240 (buf!576 (_2!593 lt!11997))) (size!240 (buf!576 thiss!1486)))))

(declare-fun lt!12014 () Unit!692)

(declare-fun Unit!710 () Unit!692)

(assert (=> b!8408 (= lt!12014 Unit!710)))

(assert (=> b!8408 (= (bitIndex!0 (size!240 (buf!576 (_2!593 lt!11997))) (currentByte!1597 (_2!593 lt!11997)) (currentBit!1592 (_2!593 lt!11997))) (bvsub (bvadd (bitIndex!0 (size!240 (buf!576 thiss!1486)) (currentByte!1597 thiss!1486) (currentBit!1592 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!11992 () Unit!692)

(declare-fun Unit!711 () Unit!692)

(assert (=> b!8408 (= lt!11992 Unit!711)))

(assert (=> b!8408 (= (bitIndex!0 (size!240 (buf!576 (_2!593 lt!11997))) (currentByte!1597 (_2!593 lt!11997)) (currentBit!1592 (_2!593 lt!11997))) (bvsub (bvsub (bvadd (bitIndex!0 (size!240 (buf!576 (_2!593 lt!11981))) (currentByte!1597 (_2!593 lt!11981)) (currentBit!1592 (_2!593 lt!11981))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12012 () Unit!692)

(declare-fun Unit!712 () Unit!692)

(assert (=> b!8408 (= lt!12012 Unit!712)))

(declare-fun lt!12017 () tuple2!1134)

(declare-fun call!119 () tuple2!1134)

(assert (=> b!8408 (= lt!12017 call!119)))

(declare-fun lt!12021 () (_ BitVec 64))

(assert (=> b!8408 (= lt!12021 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11994 () Unit!692)

(assert (=> b!8408 (= lt!11994 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!576 (_2!593 lt!11997)) lt!12021))))

(assert (=> b!8408 (validate_offset_bits!1 ((_ sign_extend 32) (size!240 (buf!576 (_2!593 lt!11997)))) ((_ sign_extend 32) (currentByte!1597 thiss!1486)) ((_ sign_extend 32) (currentBit!1592 thiss!1486)) lt!12021)))

(declare-fun lt!12016 () Unit!692)

(assert (=> b!8408 (= lt!12016 lt!11994)))

(declare-fun lt!12007 () tuple2!1134)

(assert (=> b!8408 (= lt!12007 (reader!0 (_2!593 lt!11981) (_2!593 lt!11997)))))

(declare-fun lt!12010 () (_ BitVec 64))

(assert (=> b!8408 (= lt!12010 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12008 () Unit!692)

(assert (=> b!8408 (= lt!12008 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!593 lt!11981) (buf!576 (_2!593 lt!11997)) lt!12010))))

(assert (=> b!8408 (validate_offset_bits!1 ((_ sign_extend 32) (size!240 (buf!576 (_2!593 lt!11997)))) ((_ sign_extend 32) (currentByte!1597 (_2!593 lt!11981))) ((_ sign_extend 32) (currentBit!1592 (_2!593 lt!11981))) lt!12010)))

(declare-fun lt!11982 () Unit!692)

(assert (=> b!8408 (= lt!11982 lt!12008)))

(declare-fun lt!11986 () List!137)

(assert (=> b!8408 (= lt!11986 (byteArrayBitContentToList!0 (_2!593 lt!11997) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11996 () List!137)

(assert (=> b!8408 (= lt!11996 (byteArrayBitContentToList!0 (_2!593 lt!11997) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11995 () List!137)

(assert (=> b!8408 (= lt!11995 (bitStreamReadBitsIntoList!0 (_2!593 lt!11997) (_1!598 lt!12017) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11987 () List!137)

(assert (=> b!8408 (= lt!11987 (bitStreamReadBitsIntoList!0 (_2!593 lt!11997) (_1!598 lt!12007) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12011 () (_ BitVec 64))

(assert (=> b!8408 (= lt!12011 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12003 () Unit!692)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!458 BitStream!458 BitStream!458 BitStream!458 (_ BitVec 64) List!137) Unit!692)

(assert (=> b!8408 (= lt!12003 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!593 lt!11997) (_2!593 lt!11997) (_1!598 lt!12017) (_1!598 lt!12007) lt!12011 lt!11995))))

(declare-fun tail!51 (List!137) List!137)

(assert (=> b!8408 (= (bitStreamReadBitsIntoList!0 (_2!593 lt!11997) (_1!598 lt!12007) (bvsub lt!12011 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!51 lt!11995))))

(declare-fun lt!12018 () Unit!692)

(assert (=> b!8408 (= lt!12018 lt!12003)))

(declare-fun lt!12006 () (_ BitVec 64))

(declare-fun lt!12002 () Unit!692)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!556 array!556 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!692)

(assert (=> b!8408 (= lt!12002 (arrayBitRangesEqImpliesEq!0 (buf!576 (_2!593 lt!11981)) (buf!576 (_2!593 lt!11997)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12006 (bitIndex!0 (size!240 (buf!576 (_2!593 lt!11981))) (currentByte!1597 (_2!593 lt!11981)) (currentBit!1592 (_2!593 lt!11981)))))))

(declare-fun bitAt!0 (array!556 (_ BitVec 64)) Bool)

(assert (=> b!8408 (= (bitAt!0 (buf!576 (_2!593 lt!11981)) lt!12006) (bitAt!0 (buf!576 (_2!593 lt!11997)) lt!12006))))

(declare-fun lt!12005 () Unit!692)

(assert (=> b!8408 (= lt!12005 lt!12002)))

(declare-fun d!2470 () Bool)

(declare-fun e!5253 () Bool)

(assert (=> d!2470 e!5253))

(declare-fun res!8954 () Bool)

(assert (=> d!2470 (=> (not res!8954) (not e!5253))))

(declare-fun lt!12022 () tuple2!1124)

(declare-fun lt!12001 () (_ BitVec 64))

(assert (=> d!2470 (= res!8954 (= (bitIndex!0 (size!240 (buf!576 (_2!593 lt!12022))) (currentByte!1597 (_2!593 lt!12022)) (currentBit!1592 (_2!593 lt!12022))) (bvsub lt!12001 from!367)))))

(assert (=> d!2470 (or (= (bvand lt!12001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12001 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11990 () (_ BitVec 64))

(assert (=> d!2470 (= lt!12001 (bvadd lt!11990 from!367 nBits!460))))

(assert (=> d!2470 (or (not (= (bvand lt!11990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!11990 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!11990 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2470 (= lt!11990 (bitIndex!0 (size!240 (buf!576 thiss!1486)) (currentByte!1597 thiss!1486) (currentBit!1592 thiss!1486)))))

(assert (=> d!2470 (= lt!12022 e!5254)))

(declare-fun c!464 () Bool)

(assert (=> d!2470 (= c!464 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!12019 () Unit!692)

(declare-fun lt!11993 () Unit!692)

(assert (=> d!2470 (= lt!12019 lt!11993)))

(assert (=> d!2470 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!458) Unit!692)

(assert (=> d!2470 (= lt!11993 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2470 (= lt!12006 (bitIndex!0 (size!240 (buf!576 thiss!1486)) (currentByte!1597 thiss!1486) (currentBit!1592 thiss!1486)))))

(assert (=> d!2470 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2470 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!12022)))

(declare-fun b!8409 () Bool)

(declare-fun res!8959 () Bool)

(assert (=> b!8409 (=> (not res!8959) (not e!5253))))

(assert (=> b!8409 (= res!8959 (= (size!240 (buf!576 thiss!1486)) (size!240 (buf!576 (_2!593 lt!12022)))))))

(declare-fun bm!116 () Bool)

(assert (=> bm!116 (= call!119 (reader!0 thiss!1486 (ite c!464 (_2!593 lt!11997) thiss!1486)))))

(declare-fun b!8410 () Bool)

(declare-fun res!8957 () Bool)

(assert (=> b!8410 (=> (not res!8957) (not e!5253))))

(assert (=> b!8410 (= res!8957 (= (size!240 (buf!576 (_2!593 lt!12022))) (size!240 (buf!576 thiss!1486))))))

(declare-fun b!8411 () Bool)

(declare-fun res!8956 () Bool)

(assert (=> b!8411 (=> (not res!8956) (not e!5253))))

(assert (=> b!8411 (= res!8956 (invariant!0 (currentBit!1592 (_2!593 lt!12022)) (currentByte!1597 (_2!593 lt!12022)) (size!240 (buf!576 (_2!593 lt!12022)))))))

(declare-fun b!8412 () Bool)

(declare-fun Unit!713 () Unit!692)

(assert (=> b!8412 (= e!5254 (tuple2!1125 Unit!713 thiss!1486))))

(assert (=> b!8412 (= (size!240 (buf!576 thiss!1486)) (size!240 (buf!576 thiss!1486)))))

(declare-fun lt!12013 () Unit!692)

(declare-fun Unit!714 () Unit!692)

(assert (=> b!8412 (= lt!12013 Unit!714)))

(declare-fun checkByteArrayBitContent!0 (BitStream!458 array!556 array!556 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1136 0))(
  ( (tuple2!1137 (_1!599 array!556) (_2!599 BitStream!458)) )
))
(declare-fun readBits!0 (BitStream!458 (_ BitVec 64)) tuple2!1136)

(assert (=> b!8412 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!599 (readBits!0 (_1!598 call!119) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12000 () tuple2!1134)

(declare-fun b!8413 () Bool)

(assert (=> b!8413 (= e!5253 (= (bitStreamReadBitsIntoList!0 (_2!593 lt!12022) (_1!598 lt!12000) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!593 lt!12022) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8413 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8413 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12015 () Unit!692)

(declare-fun lt!12009 () Unit!692)

(assert (=> b!8413 (= lt!12015 lt!12009)))

(declare-fun lt!12023 () (_ BitVec 64))

(assert (=> b!8413 (validate_offset_bits!1 ((_ sign_extend 32) (size!240 (buf!576 (_2!593 lt!12022)))) ((_ sign_extend 32) (currentByte!1597 thiss!1486)) ((_ sign_extend 32) (currentBit!1592 thiss!1486)) lt!12023)))

(assert (=> b!8413 (= lt!12009 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!576 (_2!593 lt!12022)) lt!12023))))

(declare-fun e!5255 () Bool)

(assert (=> b!8413 e!5255))

(declare-fun res!8958 () Bool)

(assert (=> b!8413 (=> (not res!8958) (not e!5255))))

(assert (=> b!8413 (= res!8958 (and (= (size!240 (buf!576 thiss!1486)) (size!240 (buf!576 (_2!593 lt!12022)))) (bvsge lt!12023 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8413 (= lt!12023 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8413 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8413 (= lt!12000 (reader!0 thiss!1486 (_2!593 lt!12022)))))

(declare-fun b!8414 () Bool)

(assert (=> b!8414 (= e!5255 (validate_offset_bits!1 ((_ sign_extend 32) (size!240 (buf!576 thiss!1486))) ((_ sign_extend 32) (currentByte!1597 thiss!1486)) ((_ sign_extend 32) (currentBit!1592 thiss!1486)) lt!12023))))

(declare-fun b!8415 () Bool)

(declare-fun res!8955 () Bool)

(assert (=> b!8415 (=> (not res!8955) (not e!5253))))

(assert (=> b!8415 (= res!8955 (isPrefixOf!0 thiss!1486 (_2!593 lt!12022)))))

(assert (= (and d!2470 c!464) b!8408))

(assert (= (and d!2470 (not c!464)) b!8412))

(assert (= (or b!8408 b!8412) bm!116))

(assert (= (and d!2470 res!8954) b!8411))

(assert (= (and b!8411 res!8956) b!8409))

(assert (= (and b!8409 res!8959) b!8415))

(assert (= (and b!8415 res!8955) b!8410))

(assert (= (and b!8410 res!8957) b!8413))

(assert (= (and b!8413 res!8958) b!8414))

(declare-fun m!11337 () Bool)

(assert (=> b!8408 m!11337))

(declare-fun m!11339 () Bool)

(assert (=> b!8408 m!11339))

(declare-fun m!11341 () Bool)

(assert (=> b!8408 m!11341))

(declare-fun m!11343 () Bool)

(assert (=> b!8408 m!11343))

(declare-fun m!11345 () Bool)

(assert (=> b!8408 m!11345))

(declare-fun m!11347 () Bool)

(assert (=> b!8408 m!11347))

(declare-fun m!11349 () Bool)

(assert (=> b!8408 m!11349))

(declare-fun m!11351 () Bool)

(assert (=> b!8408 m!11351))

(declare-fun m!11353 () Bool)

(assert (=> b!8408 m!11353))

(declare-fun m!11355 () Bool)

(assert (=> b!8408 m!11355))

(declare-fun m!11357 () Bool)

(assert (=> b!8408 m!11357))

(declare-fun m!11359 () Bool)

(assert (=> b!8408 m!11359))

(declare-fun m!11361 () Bool)

(assert (=> b!8408 m!11361))

(assert (=> b!8408 m!11359))

(declare-fun m!11363 () Bool)

(assert (=> b!8408 m!11363))

(declare-fun m!11365 () Bool)

(assert (=> b!8408 m!11365))

(declare-fun m!11367 () Bool)

(assert (=> b!8408 m!11367))

(declare-fun m!11369 () Bool)

(assert (=> b!8408 m!11369))

(declare-fun m!11371 () Bool)

(assert (=> b!8408 m!11371))

(assert (=> b!8408 m!11343))

(declare-fun m!11373 () Bool)

(assert (=> b!8408 m!11373))

(declare-fun m!11375 () Bool)

(assert (=> b!8408 m!11375))

(assert (=> b!8408 m!11133))

(declare-fun m!11377 () Bool)

(assert (=> b!8408 m!11377))

(assert (=> b!8408 m!11353))

(declare-fun m!11379 () Bool)

(assert (=> b!8408 m!11379))

(declare-fun m!11381 () Bool)

(assert (=> b!8408 m!11381))

(declare-fun m!11383 () Bool)

(assert (=> b!8408 m!11383))

(declare-fun m!11385 () Bool)

(assert (=> b!8408 m!11385))

(declare-fun m!11387 () Bool)

(assert (=> b!8408 m!11387))

(declare-fun m!11389 () Bool)

(assert (=> b!8408 m!11389))

(declare-fun m!11391 () Bool)

(assert (=> b!8408 m!11391))

(declare-fun m!11393 () Bool)

(assert (=> b!8408 m!11393))

(assert (=> b!8408 m!11383))

(declare-fun m!11395 () Bool)

(assert (=> b!8408 m!11395))

(declare-fun m!11397 () Bool)

(assert (=> b!8408 m!11397))

(declare-fun m!11399 () Bool)

(assert (=> b!8413 m!11399))

(declare-fun m!11401 () Bool)

(assert (=> b!8413 m!11401))

(declare-fun m!11403 () Bool)

(assert (=> b!8413 m!11403))

(declare-fun m!11405 () Bool)

(assert (=> b!8413 m!11405))

(declare-fun m!11407 () Bool)

(assert (=> b!8413 m!11407))

(declare-fun m!11409 () Bool)

(assert (=> b!8411 m!11409))

(declare-fun m!11411 () Bool)

(assert (=> b!8414 m!11411))

(declare-fun m!11413 () Bool)

(assert (=> b!8412 m!11413))

(declare-fun m!11415 () Bool)

(assert (=> b!8412 m!11415))

(declare-fun m!11417 () Bool)

(assert (=> bm!116 m!11417))

(declare-fun m!11419 () Bool)

(assert (=> d!2470 m!11419))

(assert (=> d!2470 m!11133))

(declare-fun m!11421 () Bool)

(assert (=> d!2470 m!11421))

(declare-fun m!11423 () Bool)

(assert (=> d!2470 m!11423))

(declare-fun m!11425 () Bool)

(assert (=> b!8415 m!11425))

(assert (=> b!8317 d!2470))

(declare-fun d!2482 () Bool)

(assert (=> d!2482 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!240 (buf!576 thiss!1486))) ((_ sign_extend 32) (currentByte!1597 thiss!1486)) ((_ sign_extend 32) (currentBit!1592 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!240 (buf!576 thiss!1486))) ((_ sign_extend 32) (currentByte!1597 thiss!1486)) ((_ sign_extend 32) (currentBit!1592 thiss!1486))) nBits!460))))

(declare-fun bs!835 () Bool)

(assert (= bs!835 d!2482))

(assert (=> bs!835 m!11149))

(assert (=> b!8319 d!2482))

(push 1)

(assert (not b!8415))

(assert (not d!2466))

(assert (not d!2462))

(assert (not b!8413))

(assert (not bm!116))

(assert (not d!2482))

(assert (not b!8412))

(assert (not b!8408))

(assert (not d!2454))

(assert (not b!8414))

(assert (not b!8411))

(assert (not d!2470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

