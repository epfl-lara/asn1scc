; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1772 () Bool)

(assert start!1772)

(declare-fun b!8428 () Bool)

(declare-fun e!5266 () Bool)

(declare-datatypes ((array!561 0))(
  ( (array!562 (arr!646 (Array (_ BitVec 32) (_ BitVec 8))) (size!241 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!460 0))(
  ( (BitStream!461 (buf!577 array!561) (currentByte!1607 (_ BitVec 32)) (currentBit!1602 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!460)

(declare-fun array_inv!236 (array!561) Bool)

(assert (=> b!8428 (= e!5266 (array_inv!236 (buf!577 thiss!1486)))))

(declare-fun res!8971 () Bool)

(declare-fun e!5268 () Bool)

(assert (=> start!1772 (=> (not res!8971) (not e!5268))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!561)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!1772 (= res!8971 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!241 srcBuffer!6))))))))

(assert (=> start!1772 e!5268))

(assert (=> start!1772 true))

(assert (=> start!1772 (array_inv!236 srcBuffer!6)))

(declare-fun inv!12 (BitStream!460) Bool)

(assert (=> start!1772 (and (inv!12 thiss!1486) e!5266)))

(declare-fun b!8429 () Bool)

(declare-fun res!8970 () Bool)

(assert (=> b!8429 (=> (not res!8970) (not e!5268))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8429 (= res!8970 (validate_offset_bits!1 ((_ sign_extend 32) (size!241 (buf!577 thiss!1486))) ((_ sign_extend 32) (currentByte!1607 thiss!1486)) ((_ sign_extend 32) (currentBit!1602 thiss!1486)) nBits!460))))

(declare-fun b!8430 () Bool)

(declare-fun res!8974 () Bool)

(declare-fun e!5270 () Bool)

(assert (=> b!8430 (=> (not res!8974) (not e!5270))))

(declare-datatypes ((Unit!715 0))(
  ( (Unit!716) )
))
(declare-datatypes ((tuple2!1138 0))(
  ( (tuple2!1139 (_1!600 Unit!715) (_2!600 BitStream!460)) )
))
(declare-fun lt!12026 () tuple2!1138)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8430 (= res!8974 (= (bitIndex!0 (size!241 (buf!577 (_2!600 lt!12026))) (currentByte!1607 (_2!600 lt!12026)) (currentBit!1602 (_2!600 lt!12026))) (bvadd (bitIndex!0 (size!241 (buf!577 thiss!1486)) (currentByte!1607 thiss!1486) (currentBit!1602 thiss!1486)) nBits!460)))))

(declare-fun b!8431 () Bool)

(declare-fun isPrefixOf!0 (BitStream!460 BitStream!460) Bool)

(assert (=> b!8431 (= e!5270 (not (isPrefixOf!0 thiss!1486 (_2!600 lt!12026))))))

(declare-fun b!8432 () Bool)

(declare-fun res!8972 () Bool)

(assert (=> b!8432 (=> (not res!8972) (not e!5270))))

(assert (=> b!8432 (= res!8972 (= (size!241 (buf!577 thiss!1486)) (size!241 (buf!577 (_2!600 lt!12026)))))))

(declare-fun b!8433 () Bool)

(assert (=> b!8433 (= e!5268 e!5270)))

(declare-fun res!8973 () Bool)

(assert (=> b!8433 (=> (not res!8973) (not e!5270))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8433 (= res!8973 (invariant!0 (currentBit!1602 (_2!600 lt!12026)) (currentByte!1607 (_2!600 lt!12026)) (size!241 (buf!577 (_2!600 lt!12026)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!460 array!561 (_ BitVec 64) (_ BitVec 64)) tuple2!1138)

(assert (=> b!8433 (= lt!12026 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!1772 res!8971) b!8429))

(assert (= (and b!8429 res!8970) b!8433))

(assert (= (and b!8433 res!8973) b!8432))

(assert (= (and b!8432 res!8972) b!8430))

(assert (= (and b!8430 res!8974) b!8431))

(assert (= start!1772 b!8428))

(declare-fun m!11427 () Bool)

(assert (=> b!8428 m!11427))

(declare-fun m!11429 () Bool)

(assert (=> b!8429 m!11429))

(declare-fun m!11431 () Bool)

(assert (=> b!8433 m!11431))

(declare-fun m!11433 () Bool)

(assert (=> b!8433 m!11433))

(declare-fun m!11435 () Bool)

(assert (=> b!8431 m!11435))

(declare-fun m!11437 () Bool)

(assert (=> start!1772 m!11437))

(declare-fun m!11439 () Bool)

(assert (=> start!1772 m!11439))

(declare-fun m!11441 () Bool)

(assert (=> b!8430 m!11441))

(declare-fun m!11443 () Bool)

(assert (=> b!8430 m!11443))

(push 1)

(assert (not b!8433))

(assert (not b!8428))

(assert (not b!8429))

(assert (not start!1772))

(assert (not b!8431))

(assert (not b!8430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2486 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2486 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!241 (buf!577 thiss!1486))) ((_ sign_extend 32) (currentByte!1607 thiss!1486)) ((_ sign_extend 32) (currentBit!1602 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!241 (buf!577 thiss!1486))) ((_ sign_extend 32) (currentByte!1607 thiss!1486)) ((_ sign_extend 32) (currentBit!1602 thiss!1486))) nBits!460))))

(declare-fun bs!839 () Bool)

(assert (= bs!839 d!2486))

(declare-fun m!11481 () Bool)

(assert (=> bs!839 m!11481))

(assert (=> b!8429 d!2486))

(declare-fun d!2488 () Bool)

(declare-fun e!5312 () Bool)

(assert (=> d!2488 e!5312))

(declare-fun res!9024 () Bool)

(assert (=> d!2488 (=> (not res!9024) (not e!5312))))

(declare-fun lt!12063 () (_ BitVec 64))

(declare-fun lt!12065 () (_ BitVec 64))

(declare-fun lt!12068 () (_ BitVec 64))

(assert (=> d!2488 (= res!9024 (= lt!12068 (bvsub lt!12065 lt!12063)))))

(assert (=> d!2488 (or (= (bvand lt!12065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!12063 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12065 lt!12063) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2488 (= lt!12063 (remainingBits!0 ((_ sign_extend 32) (size!241 (buf!577 (_2!600 lt!12026)))) ((_ sign_extend 32) (currentByte!1607 (_2!600 lt!12026))) ((_ sign_extend 32) (currentBit!1602 (_2!600 lt!12026)))))))

(declare-fun lt!12066 () (_ BitVec 64))

(declare-fun lt!12067 () (_ BitVec 64))

(assert (=> d!2488 (= lt!12065 (bvmul lt!12066 lt!12067))))

(assert (=> d!2488 (or (= lt!12066 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!12067 (bvsdiv (bvmul lt!12066 lt!12067) lt!12066)))))

(assert (=> d!2488 (= lt!12067 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2488 (= lt!12066 ((_ sign_extend 32) (size!241 (buf!577 (_2!600 lt!12026)))))))

(assert (=> d!2488 (= lt!12068 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1607 (_2!600 lt!12026))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1602 (_2!600 lt!12026)))))))

(assert (=> d!2488 (invariant!0 (currentBit!1602 (_2!600 lt!12026)) (currentByte!1607 (_2!600 lt!12026)) (size!241 (buf!577 (_2!600 lt!12026))))))

(assert (=> d!2488 (= (bitIndex!0 (size!241 (buf!577 (_2!600 lt!12026))) (currentByte!1607 (_2!600 lt!12026)) (currentBit!1602 (_2!600 lt!12026))) lt!12068)))

(declare-fun b!8489 () Bool)

(declare-fun res!9025 () Bool)

(assert (=> b!8489 (=> (not res!9025) (not e!5312))))

(assert (=> b!8489 (= res!9025 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!12068))))

(declare-fun b!8490 () Bool)

(declare-fun lt!12064 () (_ BitVec 64))

(assert (=> b!8490 (= e!5312 (bvsle lt!12068 (bvmul lt!12064 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8490 (or (= lt!12064 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!12064 #b0000000000000000000000000000000000000000000000000000000000001000) lt!12064)))))

(assert (=> b!8490 (= lt!12064 ((_ sign_extend 32) (size!241 (buf!577 (_2!600 lt!12026)))))))

(assert (= (and d!2488 res!9024) b!8489))

(assert (= (and b!8489 res!9025) b!8490))

(declare-fun m!11485 () Bool)

(assert (=> d!2488 m!11485))

(assert (=> d!2488 m!11431))

(assert (=> b!8430 d!2488))

(declare-fun d!2500 () Bool)

(declare-fun e!5314 () Bool)

(assert (=> d!2500 e!5314))

(declare-fun res!9028 () Bool)

(assert (=> d!2500 (=> (not res!9028) (not e!5314))))

(declare-fun lt!12077 () (_ BitVec 64))

(declare-fun lt!12075 () (_ BitVec 64))

(declare-fun lt!12080 () (_ BitVec 64))

(assert (=> d!2500 (= res!9028 (= lt!12080 (bvsub lt!12077 lt!12075)))))

(assert (=> d!2500 (or (= (bvand lt!12077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!12075 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12077 lt!12075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2500 (= lt!12075 (remainingBits!0 ((_ sign_extend 32) (size!241 (buf!577 thiss!1486))) ((_ sign_extend 32) (currentByte!1607 thiss!1486)) ((_ sign_extend 32) (currentBit!1602 thiss!1486))))))

(declare-fun lt!12078 () (_ BitVec 64))

(declare-fun lt!12079 () (_ BitVec 64))

(assert (=> d!2500 (= lt!12077 (bvmul lt!12078 lt!12079))))

(assert (=> d!2500 (or (= lt!12078 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!12079 (bvsdiv (bvmul lt!12078 lt!12079) lt!12078)))))

(assert (=> d!2500 (= lt!12079 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2500 (= lt!12078 ((_ sign_extend 32) (size!241 (buf!577 thiss!1486))))))

(assert (=> d!2500 (= lt!12080 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1607 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1602 thiss!1486))))))

(assert (=> d!2500 (invariant!0 (currentBit!1602 thiss!1486) (currentByte!1607 thiss!1486) (size!241 (buf!577 thiss!1486)))))

(assert (=> d!2500 (= (bitIndex!0 (size!241 (buf!577 thiss!1486)) (currentByte!1607 thiss!1486) (currentBit!1602 thiss!1486)) lt!12080)))

(declare-fun b!8493 () Bool)

(declare-fun res!9029 () Bool)

(assert (=> b!8493 (=> (not res!9029) (not e!5314))))

(assert (=> b!8493 (= res!9029 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!12080))))

(declare-fun b!8494 () Bool)

(declare-fun lt!12076 () (_ BitVec 64))

(assert (=> b!8494 (= e!5314 (bvsle lt!12080 (bvmul lt!12076 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8494 (or (= lt!12076 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!12076 #b0000000000000000000000000000000000000000000000000000000000001000) lt!12076)))))

(assert (=> b!8494 (= lt!12076 ((_ sign_extend 32) (size!241 (buf!577 thiss!1486))))))

(assert (= (and d!2500 res!9028) b!8493))

(assert (= (and b!8493 res!9029) b!8494))

(assert (=> d!2500 m!11481))

(declare-fun m!11493 () Bool)

(assert (=> d!2500 m!11493))

(assert (=> b!8430 d!2500))

(declare-fun d!2506 () Bool)

(assert (=> d!2506 (= (array_inv!236 srcBuffer!6) (bvsge (size!241 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1772 d!2506))

(declare-fun d!2510 () Bool)

(assert (=> d!2510 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1602 thiss!1486) (currentByte!1607 thiss!1486) (size!241 (buf!577 thiss!1486))))))

(declare-fun bs!841 () Bool)

(assert (= bs!841 d!2510))

(assert (=> bs!841 m!11493))

(assert (=> start!1772 d!2510))

(declare-fun d!2512 () Bool)

(declare-fun res!9047 () Bool)

(declare-fun e!5325 () Bool)

(assert (=> d!2512 (=> (not res!9047) (not e!5325))))

(assert (=> d!2512 (= res!9047 (= (size!241 (buf!577 thiss!1486)) (size!241 (buf!577 (_2!600 lt!12026)))))))

(assert (=> d!2512 (= (isPrefixOf!0 thiss!1486 (_2!600 lt!12026)) e!5325)))

(declare-fun b!8510 () Bool)

(declare-fun res!9045 () Bool)

(assert (=> b!8510 (=> (not res!9045) (not e!5325))))

(assert (=> b!8510 (= res!9045 (bvsle (bitIndex!0 (size!241 (buf!577 thiss!1486)) (currentByte!1607 thiss!1486) (currentBit!1602 thiss!1486)) (bitIndex!0 (size!241 (buf!577 (_2!600 lt!12026))) (currentByte!1607 (_2!600 lt!12026)) (currentBit!1602 (_2!600 lt!12026)))))))

(declare-fun b!8511 () Bool)

(declare-fun e!5326 () Bool)

(assert (=> b!8511 (= e!5325 e!5326)))

(declare-fun res!9046 () Bool)

(assert (=> b!8511 (=> res!9046 e!5326)))

(assert (=> b!8511 (= res!9046 (= (size!241 (buf!577 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!8512 () Bool)

(declare-fun arrayBitRangesEq!0 (array!561 array!561 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8512 (= e!5326 (arrayBitRangesEq!0 (buf!577 thiss!1486) (buf!577 (_2!600 lt!12026)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!241 (buf!577 thiss!1486)) (currentByte!1607 thiss!1486) (currentBit!1602 thiss!1486))))))

(assert (= (and d!2512 res!9047) b!8510))

(assert (= (and b!8510 res!9045) b!8511))

(assert (= (and b!8511 (not res!9046)) b!8512))

(assert (=> b!8510 m!11443))

(assert (=> b!8510 m!11441))

(assert (=> b!8512 m!11443))

(assert (=> b!8512 m!11443))

(declare-fun m!11497 () Bool)

(assert (=> b!8512 m!11497))

(assert (=> b!8431 d!2512))

(declare-fun d!2520 () Bool)

(assert (=> d!2520 (= (invariant!0 (currentBit!1602 (_2!600 lt!12026)) (currentByte!1607 (_2!600 lt!12026)) (size!241 (buf!577 (_2!600 lt!12026)))) (and (bvsge (currentBit!1602 (_2!600 lt!12026)) #b00000000000000000000000000000000) (bvslt (currentBit!1602 (_2!600 lt!12026)) #b00000000000000000000000000001000) (bvsge (currentByte!1607 (_2!600 lt!12026)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1607 (_2!600 lt!12026)) (size!241 (buf!577 (_2!600 lt!12026)))) (and (= (currentBit!1602 (_2!600 lt!12026)) #b00000000000000000000000000000000) (= (currentByte!1607 (_2!600 lt!12026)) (size!241 (buf!577 (_2!600 lt!12026))))))))))

(assert (=> b!8433 d!2520))

(declare-fun bm!122 () Bool)

(declare-fun c!472 () Bool)

(declare-fun lt!12437 () tuple2!1138)

(declare-fun lt!12401 () tuple2!1138)

(declare-datatypes ((tuple2!1144 0))(
  ( (tuple2!1145 (_1!603 BitStream!460) (_2!603 BitStream!460)) )
))
(declare-fun call!125 () tuple2!1144)

(declare-fun reader!0 (BitStream!460 BitStream!460) tuple2!1144)

(assert (=> bm!122 (= call!125 (reader!0 (ite c!472 (_2!600 lt!12437) thiss!1486) (ite c!472 (_2!600 lt!12401) thiss!1486)))))

(declare-fun b!8565 () Bool)

(declare-fun res!9091 () Bool)

(declare-fun e!5349 () Bool)

(assert (=> b!8565 (=> (not res!9091) (not e!5349))))

(declare-fun lt!12430 () tuple2!1138)

(assert (=> b!8565 (= res!9091 (invariant!0 (currentBit!1602 (_2!600 lt!12430)) (currentByte!1607 (_2!600 lt!12430)) (size!241 (buf!577 (_2!600 lt!12430)))))))

(declare-fun b!8566 () Bool)

(declare-fun e!5350 () tuple2!1138)

(declare-fun Unit!721 () Unit!715)

(assert (=> b!8566 (= e!5350 (tuple2!1139 Unit!721 thiss!1486))))

(assert (=> b!8566 (= (size!241 (buf!577 thiss!1486)) (size!241 (buf!577 thiss!1486)))))

(declare-fun lt!12431 () Unit!715)

(declare-fun Unit!722 () Unit!715)

(assert (=> b!8566 (= lt!12431 Unit!722)))

(declare-fun checkByteArrayBitContent!0 (BitStream!460 array!561 array!561 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1146 0))(
  ( (tuple2!1147 (_1!604 array!561) (_2!604 BitStream!460)) )
))
(declare-fun readBits!0 (BitStream!460 (_ BitVec 64)) tuple2!1146)

(assert (=> b!8566 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!604 (readBits!0 (_1!603 call!125) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!8567 () Bool)

(declare-fun res!9087 () Bool)

(assert (=> b!8567 (=> (not res!9087) (not e!5349))))

(assert (=> b!8567 (= res!9087 (= (size!241 (buf!577 (_2!600 lt!12430))) (size!241 (buf!577 thiss!1486))))))

(declare-fun b!8568 () Bool)

(declare-fun e!5348 () Bool)

(declare-fun lt!12413 () (_ BitVec 64))

(assert (=> b!8568 (= e!5348 (validate_offset_bits!1 ((_ sign_extend 32) (size!241 (buf!577 thiss!1486))) ((_ sign_extend 32) (currentByte!1607 thiss!1486)) ((_ sign_extend 32) (currentBit!1602 thiss!1486)) lt!12413))))

(declare-fun d!2522 () Bool)

(assert (=> d!2522 e!5349))

(declare-fun res!9088 () Bool)

(assert (=> d!2522 (=> (not res!9088) (not e!5349))))

(declare-fun lt!12418 () (_ BitVec 64))

(assert (=> d!2522 (= res!9088 (= (bitIndex!0 (size!241 (buf!577 (_2!600 lt!12430))) (currentByte!1607 (_2!600 lt!12430)) (currentBit!1602 (_2!600 lt!12430))) (bvsub lt!12418 from!367)))))

(assert (=> d!2522 (or (= (bvand lt!12418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!12418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!12418 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12433 () (_ BitVec 64))

(assert (=> d!2522 (= lt!12418 (bvadd lt!12433 from!367 nBits!460))))

(assert (=> d!2522 (or (not (= (bvand lt!12433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!12433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!12433 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2522 (= lt!12433 (bitIndex!0 (size!241 (buf!577 thiss!1486)) (currentByte!1607 thiss!1486) (currentBit!1602 thiss!1486)))))

(assert (=> d!2522 (= lt!12430 e!5350)))

(assert (=> d!2522 (= c!472 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!12426 () Unit!715)

(declare-fun lt!12404 () Unit!715)

(assert (=> d!2522 (= lt!12426 lt!12404)))

(assert (=> d!2522 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!460) Unit!715)

(assert (=> d!2522 (= lt!12404 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!12412 () (_ BitVec 64))

(assert (=> d!2522 (= lt!12412 (bitIndex!0 (size!241 (buf!577 thiss!1486)) (currentByte!1607 thiss!1486) (currentBit!1602 thiss!1486)))))

(assert (=> d!2522 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2522 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!12430)))

(declare-fun b!8569 () Bool)

(declare-fun res!9089 () Bool)

(assert (=> b!8569 (=> (not res!9089) (not e!5349))))

(assert (=> b!8569 (= res!9089 (isPrefixOf!0 thiss!1486 (_2!600 lt!12430)))))

(declare-fun b!8570 () Bool)

(declare-fun Unit!723 () Unit!715)

(assert (=> b!8570 (= e!5350 (tuple2!1139 Unit!723 (_2!600 lt!12401)))))

(declare-fun appendBitFromByte!0 (BitStream!460 (_ BitVec 8) (_ BitVec 32)) tuple2!1138)

(assert (=> b!8570 (= lt!12437 (appendBitFromByte!0 thiss!1486 (select (arr!646 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!12410 () (_ BitVec 64))

(assert (=> b!8570 (= lt!12410 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12441 () (_ BitVec 64))

(assert (=> b!8570 (= lt!12441 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12425 () Unit!715)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!460 BitStream!460 (_ BitVec 64) (_ BitVec 64)) Unit!715)

(assert (=> b!8570 (= lt!12425 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!600 lt!12437) lt!12410 lt!12441))))

(assert (=> b!8570 (validate_offset_bits!1 ((_ sign_extend 32) (size!241 (buf!577 (_2!600 lt!12437)))) ((_ sign_extend 32) (currentByte!1607 (_2!600 lt!12437))) ((_ sign_extend 32) (currentBit!1602 (_2!600 lt!12437))) (bvsub lt!12410 lt!12441))))

(declare-fun lt!12434 () Unit!715)

(assert (=> b!8570 (= lt!12434 lt!12425)))

(declare-fun lt!12403 () tuple2!1144)

(assert (=> b!8570 (= lt!12403 (reader!0 thiss!1486 (_2!600 lt!12437)))))

(declare-fun lt!12435 () (_ BitVec 64))

(assert (=> b!8570 (= lt!12435 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!12402 () Unit!715)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!460 array!561 (_ BitVec 64)) Unit!715)

(assert (=> b!8570 (= lt!12402 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!577 (_2!600 lt!12437)) lt!12435))))

(assert (=> b!8570 (validate_offset_bits!1 ((_ sign_extend 32) (size!241 (buf!577 (_2!600 lt!12437)))) ((_ sign_extend 32) (currentByte!1607 thiss!1486)) ((_ sign_extend 32) (currentBit!1602 thiss!1486)) lt!12435)))

(declare-fun lt!12405 () Unit!715)

(assert (=> b!8570 (= lt!12405 lt!12402)))

(declare-datatypes ((List!138 0))(
  ( (Nil!135) (Cons!134 (h!253 Bool) (t!888 List!138)) )
))
(declare-fun head!44 (List!138) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!460 array!561 (_ BitVec 64) (_ BitVec 64)) List!138)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!460 BitStream!460 (_ BitVec 64)) List!138)

(assert (=> b!8570 (= (head!44 (byteArrayBitContentToList!0 (_2!600 lt!12437) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!44 (bitStreamReadBitsIntoList!0 (_2!600 lt!12437) (_1!603 lt!12403) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12417 () Unit!715)

(declare-fun Unit!725 () Unit!715)

(assert (=> b!8570 (= lt!12417 Unit!725)))

(assert (=> b!8570 (= lt!12401 (appendBitsMSBFirstLoop!0 (_2!600 lt!12437) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!12421 () Unit!715)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!460 BitStream!460 BitStream!460) Unit!715)

(assert (=> b!8570 (= lt!12421 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!600 lt!12437) (_2!600 lt!12401)))))

(assert (=> b!8570 (isPrefixOf!0 thiss!1486 (_2!600 lt!12401))))

(declare-fun lt!12429 () Unit!715)

(assert (=> b!8570 (= lt!12429 lt!12421)))

(assert (=> b!8570 (= (size!241 (buf!577 (_2!600 lt!12401))) (size!241 (buf!577 thiss!1486)))))

(declare-fun lt!12442 () Unit!715)

(declare-fun Unit!726 () Unit!715)

(assert (=> b!8570 (= lt!12442 Unit!726)))

(assert (=> b!8570 (= (bitIndex!0 (size!241 (buf!577 (_2!600 lt!12401))) (currentByte!1607 (_2!600 lt!12401)) (currentBit!1602 (_2!600 lt!12401))) (bvsub (bvadd (bitIndex!0 (size!241 (buf!577 thiss!1486)) (currentByte!1607 thiss!1486) (currentBit!1602 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!12427 () Unit!715)

(declare-fun Unit!727 () Unit!715)

(assert (=> b!8570 (= lt!12427 Unit!727)))

(assert (=> b!8570 (= (bitIndex!0 (size!241 (buf!577 (_2!600 lt!12401))) (currentByte!1607 (_2!600 lt!12401)) (currentBit!1602 (_2!600 lt!12401))) (bvsub (bvsub (bvadd (bitIndex!0 (size!241 (buf!577 (_2!600 lt!12437))) (currentByte!1607 (_2!600 lt!12437)) (currentBit!1602 (_2!600 lt!12437))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12439 () Unit!715)

(declare-fun Unit!728 () Unit!715)

(assert (=> b!8570 (= lt!12439 Unit!728)))

(declare-fun lt!12419 () tuple2!1144)

(assert (=> b!8570 (= lt!12419 (reader!0 thiss!1486 (_2!600 lt!12401)))))

(declare-fun lt!12416 () (_ BitVec 64))

(assert (=> b!8570 (= lt!12416 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12411 () Unit!715)

(assert (=> b!8570 (= lt!12411 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!577 (_2!600 lt!12401)) lt!12416))))

(assert (=> b!8570 (validate_offset_bits!1 ((_ sign_extend 32) (size!241 (buf!577 (_2!600 lt!12401)))) ((_ sign_extend 32) (currentByte!1607 thiss!1486)) ((_ sign_extend 32) (currentBit!1602 thiss!1486)) lt!12416)))

(declare-fun lt!12409 () Unit!715)

(assert (=> b!8570 (= lt!12409 lt!12411)))

(declare-fun lt!12438 () tuple2!1144)

(assert (=> b!8570 (= lt!12438 call!125)))

(declare-fun lt!12428 () (_ BitVec 64))

(assert (=> b!8570 (= lt!12428 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!12424 () Unit!715)

(assert (=> b!8570 (= lt!12424 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!600 lt!12437) (buf!577 (_2!600 lt!12401)) lt!12428))))

(assert (=> b!8570 (validate_offset_bits!1 ((_ sign_extend 32) (size!241 (buf!577 (_2!600 lt!12401)))) ((_ sign_extend 32) (currentByte!1607 (_2!600 lt!12437))) ((_ sign_extend 32) (currentBit!1602 (_2!600 lt!12437))) lt!12428)))

(declare-fun lt!12423 () Unit!715)

(assert (=> b!8570 (= lt!12423 lt!12424)))

(declare-fun lt!12407 () List!138)

(assert (=> b!8570 (= lt!12407 (byteArrayBitContentToList!0 (_2!600 lt!12401) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12414 () List!138)

(assert (=> b!8570 (= lt!12414 (byteArrayBitContentToList!0 (_2!600 lt!12401) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12406 () List!138)

(assert (=> b!8570 (= lt!12406 (bitStreamReadBitsIntoList!0 (_2!600 lt!12401) (_1!603 lt!12419) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!12436 () List!138)

(assert (=> b!8570 (= lt!12436 (bitStreamReadBitsIntoList!0 (_2!600 lt!12401) (_1!603 lt!12438) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!12420 () (_ BitVec 64))

(assert (=> b!8570 (= lt!12420 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!12408 () Unit!715)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!460 BitStream!460 BitStream!460 BitStream!460 (_ BitVec 64) List!138) Unit!715)

(assert (=> b!8570 (= lt!12408 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!600 lt!12401) (_2!600 lt!12401) (_1!603 lt!12419) (_1!603 lt!12438) lt!12420 lt!12406))))

(declare-fun tail!52 (List!138) List!138)

(assert (=> b!8570 (= (bitStreamReadBitsIntoList!0 (_2!600 lt!12401) (_1!603 lt!12438) (bvsub lt!12420 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!52 lt!12406))))

(declare-fun lt!12432 () Unit!715)

(assert (=> b!8570 (= lt!12432 lt!12408)))

(declare-fun lt!12444 () Unit!715)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!561 array!561 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!715)

(assert (=> b!8570 (= lt!12444 (arrayBitRangesEqImpliesEq!0 (buf!577 (_2!600 lt!12437)) (buf!577 (_2!600 lt!12401)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!12412 (bitIndex!0 (size!241 (buf!577 (_2!600 lt!12437))) (currentByte!1607 (_2!600 lt!12437)) (currentBit!1602 (_2!600 lt!12437)))))))

(declare-fun bitAt!0 (array!561 (_ BitVec 64)) Bool)

(assert (=> b!8570 (= (bitAt!0 (buf!577 (_2!600 lt!12437)) lt!12412) (bitAt!0 (buf!577 (_2!600 lt!12401)) lt!12412))))

(declare-fun lt!12415 () Unit!715)

(assert (=> b!8570 (= lt!12415 lt!12444)))

(declare-fun lt!12440 () tuple2!1144)

(declare-fun b!8571 () Bool)

(assert (=> b!8571 (= e!5349 (= (bitStreamReadBitsIntoList!0 (_2!600 lt!12430) (_1!603 lt!12440) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!600 lt!12430) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8571 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8571 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!12443 () Unit!715)

(declare-fun lt!12422 () Unit!715)

(assert (=> b!8571 (= lt!12443 lt!12422)))

(assert (=> b!8571 (validate_offset_bits!1 ((_ sign_extend 32) (size!241 (buf!577 (_2!600 lt!12430)))) ((_ sign_extend 32) (currentByte!1607 thiss!1486)) ((_ sign_extend 32) (currentBit!1602 thiss!1486)) lt!12413)))

(assert (=> b!8571 (= lt!12422 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!577 (_2!600 lt!12430)) lt!12413))))

(assert (=> b!8571 e!5348))

(declare-fun res!9090 () Bool)

(assert (=> b!8571 (=> (not res!9090) (not e!5348))))

(assert (=> b!8571 (= res!9090 (and (= (size!241 (buf!577 thiss!1486)) (size!241 (buf!577 (_2!600 lt!12430)))) (bvsge lt!12413 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8571 (= lt!12413 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8571 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8571 (= lt!12440 (reader!0 thiss!1486 (_2!600 lt!12430)))))

(declare-fun b!8572 () Bool)

(declare-fun res!9086 () Bool)

(assert (=> b!8572 (=> (not res!9086) (not e!5349))))

(assert (=> b!8572 (= res!9086 (= (size!241 (buf!577 thiss!1486)) (size!241 (buf!577 (_2!600 lt!12430)))))))

(assert (= (and d!2522 c!472) b!8570))

(assert (= (and d!2522 (not c!472)) b!8566))

(assert (= (or b!8570 b!8566) bm!122))

(assert (= (and d!2522 res!9088) b!8565))

(assert (= (and b!8565 res!9091) b!8572))

(assert (= (and b!8572 res!9086) b!8569))

(assert (= (and b!8569 res!9089) b!8567))

(assert (= (and b!8567 res!9087) b!8571))

(assert (= (and b!8571 res!9090) b!8568))

(declare-fun m!11595 () Bool)

(assert (=> b!8565 m!11595))

(declare-fun m!11597 () Bool)

(assert (=> d!2522 m!11597))

(assert (=> d!2522 m!11443))

(declare-fun m!11599 () Bool)

(assert (=> d!2522 m!11599))

(declare-fun m!11601 () Bool)

(assert (=> d!2522 m!11601))

(declare-fun m!11603 () Bool)

(assert (=> b!8570 m!11603))

(declare-fun m!11605 () Bool)

(assert (=> b!8570 m!11605))

(declare-fun m!11607 () Bool)

(assert (=> b!8570 m!11607))

(declare-fun m!11609 () Bool)

(assert (=> b!8570 m!11609))

(declare-fun m!11611 () Bool)

(assert (=> b!8570 m!11611))

(declare-fun m!11613 () Bool)

(assert (=> b!8570 m!11613))

(declare-fun m!11615 () Bool)

(assert (=> b!8570 m!11615))

(declare-fun m!11617 () Bool)

(assert (=> b!8570 m!11617))

(declare-fun m!11619 () Bool)

(assert (=> b!8570 m!11619))

(declare-fun m!11621 () Bool)

(assert (=> b!8570 m!11621))

(declare-fun m!11623 () Bool)

(assert (=> b!8570 m!11623))

(declare-fun m!11625 () Bool)

(assert (=> b!8570 m!11625))

(declare-fun m!11627 () Bool)

(assert (=> b!8570 m!11627))

(declare-fun m!11629 () Bool)

(assert (=> b!8570 m!11629))

(declare-fun m!11631 () Bool)

(assert (=> b!8570 m!11631))

(declare-fun m!11633 () Bool)

(assert (=> b!8570 m!11633))

(declare-fun m!11635 () Bool)

(assert (=> b!8570 m!11635))

(assert (=> b!8570 m!11615))

(declare-fun m!11637 () Bool)

(assert (=> b!8570 m!11637))

(assert (=> b!8570 m!11617))

(declare-fun m!11639 () Bool)

(assert (=> b!8570 m!11639))

(declare-fun m!11641 () Bool)

(assert (=> b!8570 m!11641))

(declare-fun m!11643 () Bool)

(assert (=> b!8570 m!11643))

(declare-fun m!11645 () Bool)

(assert (=> b!8570 m!11645))

(declare-fun m!11647 () Bool)

(assert (=> b!8570 m!11647))

(declare-fun m!11649 () Bool)

(assert (=> b!8570 m!11649))

(declare-fun m!11651 () Bool)

(assert (=> b!8570 m!11651))

(declare-fun m!11653 () Bool)

(assert (=> b!8570 m!11653))

(assert (=> b!8570 m!11651))

(declare-fun m!11655 () Bool)

(assert (=> b!8570 m!11655))

(declare-fun m!11657 () Bool)

(assert (=> b!8570 m!11657))

(declare-fun m!11659 () Bool)

(assert (=> b!8570 m!11659))

(assert (=> b!8570 m!11443))

(declare-fun m!11661 () Bool)

(assert (=> b!8570 m!11661))

(declare-fun m!11663 () Bool)

(assert (=> b!8570 m!11663))

(assert (=> b!8570 m!11639))

(declare-fun m!11665 () Bool)

(assert (=> b!8568 m!11665))

(declare-fun m!11667 () Bool)

(assert (=> b!8569 m!11667))

(declare-fun m!11669 () Bool)

(assert (=> bm!122 m!11669))

(declare-fun m!11671 () Bool)

(assert (=> b!8566 m!11671))

(declare-fun m!11673 () Bool)

(assert (=> b!8566 m!11673))

(declare-fun m!11675 () Bool)

(assert (=> b!8571 m!11675))

(declare-fun m!11677 () Bool)

(assert (=> b!8571 m!11677))

(declare-fun m!11679 () Bool)

(assert (=> b!8571 m!11679))

(declare-fun m!11681 () Bool)

(assert (=> b!8571 m!11681))

(declare-fun m!11683 () Bool)

(assert (=> b!8571 m!11683))

(assert (=> b!8433 d!2522))

(declare-fun d!2538 () Bool)

(assert (=> d!2538 (= (array_inv!236 (buf!577 thiss!1486)) (bvsge (size!241 (buf!577 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8428 d!2538))

(push 1)

(assert (not b!8566))

(assert (not d!2486))

(assert (not b!8568))

(assert (not b!8570))

(assert (not d!2500))

(assert (not b!8510))

(assert (not b!8512))

(assert (not d!2488))

(assert (not d!2522))

(assert (not bm!122))

(assert (not b!8569))

(assert (not d!2510))

(assert (not b!8565))

(assert (not b!8571))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

