; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1730 () Bool)

(assert start!1730)

(declare-fun b!8285 () Bool)

(declare-fun e!5182 () Bool)

(declare-datatypes ((array!552 0))(
  ( (array!553 (arr!643 (Array (_ BitVec 32) (_ BitVec 8))) (size!238 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!454 0))(
  ( (BitStream!455 (buf!574 array!552) (currentByte!1595 (_ BitVec 32)) (currentBit!1590 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!454)

(declare-fun array_inv!233 (array!552) Bool)

(assert (=> b!8285 (= e!5182 (array_inv!233 (buf!574 thiss!1486)))))

(declare-datatypes ((Unit!688 0))(
  ( (Unit!689) )
))
(declare-datatypes ((tuple2!1120 0))(
  ( (tuple2!1121 (_1!591 Unit!688) (_2!591 BitStream!454)) )
))
(declare-fun lt!11549 () tuple2!1120)

(declare-fun b!8287 () Bool)

(declare-fun e!5186 () Bool)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!8287 (= e!5186 (not (= (bitIndex!0 (size!238 (buf!574 (_2!591 lt!11549))) (currentByte!1595 (_2!591 lt!11549)) (currentBit!1590 (_2!591 lt!11549))) (bvadd (bitIndex!0 (size!238 (buf!574 thiss!1486)) (currentByte!1595 thiss!1486) (currentBit!1590 thiss!1486)) nBits!460))))))

(declare-fun b!8288 () Bool)

(declare-fun e!5184 () Bool)

(assert (=> b!8288 (= e!5184 e!5186)))

(declare-fun res!8854 () Bool)

(assert (=> b!8288 (=> (not res!8854) (not e!5186))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!8288 (= res!8854 (invariant!0 (currentBit!1590 (_2!591 lt!11549)) (currentByte!1595 (_2!591 lt!11549)) (size!238 (buf!574 (_2!591 lt!11549)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!552)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!454 array!552 (_ BitVec 64) (_ BitVec 64)) tuple2!1120)

(assert (=> b!8288 (= lt!11549 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!8289 () Bool)

(declare-fun res!8855 () Bool)

(assert (=> b!8289 (=> (not res!8855) (not e!5184))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!8289 (= res!8855 (validate_offset_bits!1 ((_ sign_extend 32) (size!238 (buf!574 thiss!1486))) ((_ sign_extend 32) (currentByte!1595 thiss!1486)) ((_ sign_extend 32) (currentBit!1590 thiss!1486)) nBits!460))))

(declare-fun b!8286 () Bool)

(declare-fun res!8856 () Bool)

(assert (=> b!8286 (=> (not res!8856) (not e!5186))))

(assert (=> b!8286 (= res!8856 (= (size!238 (buf!574 thiss!1486)) (size!238 (buf!574 (_2!591 lt!11549)))))))

(declare-fun res!8857 () Bool)

(assert (=> start!1730 (=> (not res!8857) (not e!5184))))

(assert (=> start!1730 (= res!8857 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!238 srcBuffer!6))))))))

(assert (=> start!1730 e!5184))

(assert (=> start!1730 true))

(assert (=> start!1730 (array_inv!233 srcBuffer!6)))

(declare-fun inv!12 (BitStream!454) Bool)

(assert (=> start!1730 (and (inv!12 thiss!1486) e!5182)))

(assert (= (and start!1730 res!8857) b!8289))

(assert (= (and b!8289 res!8855) b!8288))

(assert (= (and b!8288 res!8854) b!8286))

(assert (= (and b!8286 res!8856) b!8287))

(assert (= start!1730 b!8285))

(declare-fun m!11091 () Bool)

(assert (=> start!1730 m!11091))

(declare-fun m!11093 () Bool)

(assert (=> start!1730 m!11093))

(declare-fun m!11095 () Bool)

(assert (=> b!8289 m!11095))

(declare-fun m!11097 () Bool)

(assert (=> b!8287 m!11097))

(declare-fun m!11099 () Bool)

(assert (=> b!8287 m!11099))

(declare-fun m!11101 () Bool)

(assert (=> b!8288 m!11101))

(declare-fun m!11103 () Bool)

(assert (=> b!8288 m!11103))

(declare-fun m!11105 () Bool)

(assert (=> b!8285 m!11105))

(push 1)

(assert (not start!1730))

(assert (not b!8287))

(assert (not b!8285))

(assert (not b!8288))

(assert (not b!8289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2442 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!2442 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!238 (buf!574 thiss!1486))) ((_ sign_extend 32) (currentByte!1595 thiss!1486)) ((_ sign_extend 32) (currentBit!1590 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!238 (buf!574 thiss!1486))) ((_ sign_extend 32) (currentByte!1595 thiss!1486)) ((_ sign_extend 32) (currentBit!1590 thiss!1486))) nBits!460))))

(declare-fun bs!831 () Bool)

(assert (= bs!831 d!2442))

(declare-fun m!11141 () Bool)

(assert (=> bs!831 m!11141))

(assert (=> b!8289 d!2442))

(declare-fun d!2444 () Bool)

(assert (=> d!2444 (= (array_inv!233 (buf!574 thiss!1486)) (bvsge (size!238 (buf!574 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!8285 d!2444))

(declare-fun d!2446 () Bool)

(assert (=> d!2446 (= (array_inv!233 srcBuffer!6) (bvsge (size!238 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1730 d!2446))

(declare-fun d!2448 () Bool)

(assert (=> d!2448 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1590 thiss!1486) (currentByte!1595 thiss!1486) (size!238 (buf!574 thiss!1486))))))

(declare-fun bs!832 () Bool)

(assert (= bs!832 d!2448))

(declare-fun m!11143 () Bool)

(assert (=> bs!832 m!11143))

(assert (=> start!1730 d!2448))

(declare-fun d!2450 () Bool)

(declare-fun e!5219 () Bool)

(assert (=> d!2450 e!5219))

(declare-fun res!8887 () Bool)

(assert (=> d!2450 (=> (not res!8887) (not e!5219))))

(declare-fun lt!11568 () (_ BitVec 64))

(declare-fun lt!11572 () (_ BitVec 64))

(declare-fun lt!11569 () (_ BitVec 64))

(assert (=> d!2450 (= res!8887 (= lt!11572 (bvsub lt!11569 lt!11568)))))

(assert (=> d!2450 (or (= (bvand lt!11569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!11568 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11569 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11569 lt!11568) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2450 (= lt!11568 (remainingBits!0 ((_ sign_extend 32) (size!238 (buf!574 (_2!591 lt!11549)))) ((_ sign_extend 32) (currentByte!1595 (_2!591 lt!11549))) ((_ sign_extend 32) (currentBit!1590 (_2!591 lt!11549)))))))

(declare-fun lt!11570 () (_ BitVec 64))

(declare-fun lt!11571 () (_ BitVec 64))

(assert (=> d!2450 (= lt!11569 (bvmul lt!11570 lt!11571))))

(assert (=> d!2450 (or (= lt!11570 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!11571 (bvsdiv (bvmul lt!11570 lt!11571) lt!11570)))))

(assert (=> d!2450 (= lt!11571 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2450 (= lt!11570 ((_ sign_extend 32) (size!238 (buf!574 (_2!591 lt!11549)))))))

(assert (=> d!2450 (= lt!11572 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1595 (_2!591 lt!11549))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1590 (_2!591 lt!11549)))))))

(assert (=> d!2450 (invariant!0 (currentBit!1590 (_2!591 lt!11549)) (currentByte!1595 (_2!591 lt!11549)) (size!238 (buf!574 (_2!591 lt!11549))))))

(assert (=> d!2450 (= (bitIndex!0 (size!238 (buf!574 (_2!591 lt!11549))) (currentByte!1595 (_2!591 lt!11549)) (currentBit!1590 (_2!591 lt!11549))) lt!11572)))

(declare-fun b!8324 () Bool)

(declare-fun res!8886 () Bool)

(assert (=> b!8324 (=> (not res!8886) (not e!5219))))

(assert (=> b!8324 (= res!8886 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!11572))))

(declare-fun b!8325 () Bool)

(declare-fun lt!11573 () (_ BitVec 64))

(assert (=> b!8325 (= e!5219 (bvsle lt!11572 (bvmul lt!11573 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8325 (or (= lt!11573 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!11573 #b0000000000000000000000000000000000000000000000000000000000001000) lt!11573)))))

(assert (=> b!8325 (= lt!11573 ((_ sign_extend 32) (size!238 (buf!574 (_2!591 lt!11549)))))))

(assert (= (and d!2450 res!8887) b!8324))

(assert (= (and b!8324 res!8886) b!8325))

(declare-fun m!11145 () Bool)

(assert (=> d!2450 m!11145))

(assert (=> d!2450 m!11101))

(assert (=> b!8287 d!2450))

(declare-fun d!2456 () Bool)

(declare-fun e!5220 () Bool)

(assert (=> d!2456 e!5220))

(declare-fun res!8889 () Bool)

(assert (=> d!2456 (=> (not res!8889) (not e!5220))))

(declare-fun lt!11575 () (_ BitVec 64))

(declare-fun lt!11578 () (_ BitVec 64))

(declare-fun lt!11574 () (_ BitVec 64))

(assert (=> d!2456 (= res!8889 (= lt!11578 (bvsub lt!11575 lt!11574)))))

(assert (=> d!2456 (or (= (bvand lt!11575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!11574 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11575 lt!11574) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2456 (= lt!11574 (remainingBits!0 ((_ sign_extend 32) (size!238 (buf!574 thiss!1486))) ((_ sign_extend 32) (currentByte!1595 thiss!1486)) ((_ sign_extend 32) (currentBit!1590 thiss!1486))))))

(declare-fun lt!11576 () (_ BitVec 64))

(declare-fun lt!11577 () (_ BitVec 64))

(assert (=> d!2456 (= lt!11575 (bvmul lt!11576 lt!11577))))

(assert (=> d!2456 (or (= lt!11576 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!11577 (bvsdiv (bvmul lt!11576 lt!11577) lt!11576)))))

(assert (=> d!2456 (= lt!11577 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2456 (= lt!11576 ((_ sign_extend 32) (size!238 (buf!574 thiss!1486))))))

(assert (=> d!2456 (= lt!11578 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1595 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1590 thiss!1486))))))

(assert (=> d!2456 (invariant!0 (currentBit!1590 thiss!1486) (currentByte!1595 thiss!1486) (size!238 (buf!574 thiss!1486)))))

(assert (=> d!2456 (= (bitIndex!0 (size!238 (buf!574 thiss!1486)) (currentByte!1595 thiss!1486) (currentBit!1590 thiss!1486)) lt!11578)))

(declare-fun b!8326 () Bool)

(declare-fun res!8888 () Bool)

(assert (=> b!8326 (=> (not res!8888) (not e!5220))))

(assert (=> b!8326 (= res!8888 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!11578))))

(declare-fun b!8327 () Bool)

(declare-fun lt!11579 () (_ BitVec 64))

(assert (=> b!8327 (= e!5220 (bvsle lt!11578 (bvmul lt!11579 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!8327 (or (= lt!11579 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!11579 #b0000000000000000000000000000000000000000000000000000000000001000) lt!11579)))))

(assert (=> b!8327 (= lt!11579 ((_ sign_extend 32) (size!238 (buf!574 thiss!1486))))))

(assert (= (and d!2456 res!8889) b!8326))

(assert (= (and b!8326 res!8888) b!8327))

(assert (=> d!2456 m!11141))

(assert (=> d!2456 m!11143))

(assert (=> b!8287 d!2456))

(declare-fun d!2458 () Bool)

(assert (=> d!2458 (= (invariant!0 (currentBit!1590 (_2!591 lt!11549)) (currentByte!1595 (_2!591 lt!11549)) (size!238 (buf!574 (_2!591 lt!11549)))) (and (bvsge (currentBit!1590 (_2!591 lt!11549)) #b00000000000000000000000000000000) (bvslt (currentBit!1590 (_2!591 lt!11549)) #b00000000000000000000000000001000) (bvsge (currentByte!1595 (_2!591 lt!11549)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1595 (_2!591 lt!11549)) (size!238 (buf!574 (_2!591 lt!11549)))) (and (= (currentBit!1590 (_2!591 lt!11549)) #b00000000000000000000000000000000) (= (currentByte!1595 (_2!591 lt!11549)) (size!238 (buf!574 (_2!591 lt!11549))))))))))

(assert (=> b!8288 d!2458))

(declare-fun b!8400 () Bool)

(declare-fun e!5250 () tuple2!1120)

(declare-fun lt!11976 () tuple2!1120)

(declare-fun Unit!701 () Unit!688)

(assert (=> b!8400 (= e!5250 (tuple2!1121 Unit!701 (_2!591 lt!11976)))))

(declare-fun lt!11956 () tuple2!1120)

(declare-fun appendBitFromByte!0 (BitStream!454 (_ BitVec 8) (_ BitVec 32)) tuple2!1120)

(assert (=> b!8400 (= lt!11956 (appendBitFromByte!0 thiss!1486 (select (arr!643 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!11940 () (_ BitVec 64))

(assert (=> b!8400 (= lt!11940 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11968 () (_ BitVec 64))

(assert (=> b!8400 (= lt!11968 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11967 () Unit!688)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!454 BitStream!454 (_ BitVec 64) (_ BitVec 64)) Unit!688)

(assert (=> b!8400 (= lt!11967 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!591 lt!11956) lt!11940 lt!11968))))

(assert (=> b!8400 (validate_offset_bits!1 ((_ sign_extend 32) (size!238 (buf!574 (_2!591 lt!11956)))) ((_ sign_extend 32) (currentByte!1595 (_2!591 lt!11956))) ((_ sign_extend 32) (currentBit!1590 (_2!591 lt!11956))) (bvsub lt!11940 lt!11968))))

(declare-fun lt!11971 () Unit!688)

(assert (=> b!8400 (= lt!11971 lt!11967)))

(declare-datatypes ((tuple2!1130 0))(
  ( (tuple2!1131 (_1!596 BitStream!454) (_2!596 BitStream!454)) )
))
(declare-fun lt!11943 () tuple2!1130)

(declare-fun reader!0 (BitStream!454 BitStream!454) tuple2!1130)

(assert (=> b!8400 (= lt!11943 (reader!0 thiss!1486 (_2!591 lt!11956)))))

(declare-fun lt!11964 () (_ BitVec 64))

(assert (=> b!8400 (= lt!11964 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!11949 () Unit!688)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!454 array!552 (_ BitVec 64)) Unit!688)

(assert (=> b!8400 (= lt!11949 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!574 (_2!591 lt!11956)) lt!11964))))

(assert (=> b!8400 (validate_offset_bits!1 ((_ sign_extend 32) (size!238 (buf!574 (_2!591 lt!11956)))) ((_ sign_extend 32) (currentByte!1595 thiss!1486)) ((_ sign_extend 32) (currentBit!1590 thiss!1486)) lt!11964)))

(declare-fun lt!11947 () Unit!688)

(assert (=> b!8400 (= lt!11947 lt!11949)))

(declare-datatypes ((List!136 0))(
  ( (Nil!133) (Cons!132 (h!251 Bool) (t!886 List!136)) )
))
(declare-fun head!42 (List!136) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!454 array!552 (_ BitVec 64) (_ BitVec 64)) List!136)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!454 BitStream!454 (_ BitVec 64)) List!136)

(assert (=> b!8400 (= (head!42 (byteArrayBitContentToList!0 (_2!591 lt!11956) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!42 (bitStreamReadBitsIntoList!0 (_2!591 lt!11956) (_1!596 lt!11943) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11963 () Unit!688)

(declare-fun Unit!702 () Unit!688)

(assert (=> b!8400 (= lt!11963 Unit!702)))

(assert (=> b!8400 (= lt!11976 (appendBitsMSBFirstLoop!0 (_2!591 lt!11956) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!11979 () Unit!688)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!454 BitStream!454 BitStream!454) Unit!688)

(assert (=> b!8400 (= lt!11979 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!591 lt!11956) (_2!591 lt!11976)))))

(declare-fun isPrefixOf!0 (BitStream!454 BitStream!454) Bool)

(assert (=> b!8400 (isPrefixOf!0 thiss!1486 (_2!591 lt!11976))))

(declare-fun lt!11965 () Unit!688)

(assert (=> b!8400 (= lt!11965 lt!11979)))

(assert (=> b!8400 (= (size!238 (buf!574 (_2!591 lt!11976))) (size!238 (buf!574 thiss!1486)))))

(declare-fun lt!11972 () Unit!688)

(declare-fun Unit!703 () Unit!688)

(assert (=> b!8400 (= lt!11972 Unit!703)))

(assert (=> b!8400 (= (bitIndex!0 (size!238 (buf!574 (_2!591 lt!11976))) (currentByte!1595 (_2!591 lt!11976)) (currentBit!1590 (_2!591 lt!11976))) (bvsub (bvadd (bitIndex!0 (size!238 (buf!574 thiss!1486)) (currentByte!1595 thiss!1486) (currentBit!1590 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!11937 () Unit!688)

(declare-fun Unit!704 () Unit!688)

(assert (=> b!8400 (= lt!11937 Unit!704)))

(assert (=> b!8400 (= (bitIndex!0 (size!238 (buf!574 (_2!591 lt!11976))) (currentByte!1595 (_2!591 lt!11976)) (currentBit!1590 (_2!591 lt!11976))) (bvsub (bvsub (bvadd (bitIndex!0 (size!238 (buf!574 (_2!591 lt!11956))) (currentByte!1595 (_2!591 lt!11956)) (currentBit!1590 (_2!591 lt!11956))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11978 () Unit!688)

(declare-fun Unit!705 () Unit!688)

(assert (=> b!8400 (= lt!11978 Unit!705)))

(declare-fun lt!11973 () tuple2!1130)

(assert (=> b!8400 (= lt!11973 (reader!0 thiss!1486 (_2!591 lt!11976)))))

(declare-fun lt!11952 () (_ BitVec 64))

(assert (=> b!8400 (= lt!11952 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11939 () Unit!688)

(assert (=> b!8400 (= lt!11939 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!574 (_2!591 lt!11976)) lt!11952))))

(assert (=> b!8400 (validate_offset_bits!1 ((_ sign_extend 32) (size!238 (buf!574 (_2!591 lt!11976)))) ((_ sign_extend 32) (currentByte!1595 thiss!1486)) ((_ sign_extend 32) (currentBit!1590 thiss!1486)) lt!11952)))

(declare-fun lt!11941 () Unit!688)

(assert (=> b!8400 (= lt!11941 lt!11939)))

(declare-fun lt!11953 () tuple2!1130)

(declare-fun call!118 () tuple2!1130)

(assert (=> b!8400 (= lt!11953 call!118)))

(declare-fun lt!11944 () (_ BitVec 64))

(assert (=> b!8400 (= lt!11944 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!11961 () Unit!688)

(assert (=> b!8400 (= lt!11961 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!591 lt!11956) (buf!574 (_2!591 lt!11976)) lt!11944))))

(assert (=> b!8400 (validate_offset_bits!1 ((_ sign_extend 32) (size!238 (buf!574 (_2!591 lt!11976)))) ((_ sign_extend 32) (currentByte!1595 (_2!591 lt!11956))) ((_ sign_extend 32) (currentBit!1590 (_2!591 lt!11956))) lt!11944)))

(declare-fun lt!11977 () Unit!688)

(assert (=> b!8400 (= lt!11977 lt!11961)))

(declare-fun lt!11969 () List!136)

(assert (=> b!8400 (= lt!11969 (byteArrayBitContentToList!0 (_2!591 lt!11976) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11960 () List!136)

(assert (=> b!8400 (= lt!11960 (byteArrayBitContentToList!0 (_2!591 lt!11976) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11951 () List!136)

(assert (=> b!8400 (= lt!11951 (bitStreamReadBitsIntoList!0 (_2!591 lt!11976) (_1!596 lt!11973) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!11958 () List!136)

(assert (=> b!8400 (= lt!11958 (bitStreamReadBitsIntoList!0 (_2!591 lt!11976) (_1!596 lt!11953) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!11955 () (_ BitVec 64))

(assert (=> b!8400 (= lt!11955 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!11936 () Unit!688)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!454 BitStream!454 BitStream!454 BitStream!454 (_ BitVec 64) List!136) Unit!688)

(assert (=> b!8400 (= lt!11936 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!591 lt!11976) (_2!591 lt!11976) (_1!596 lt!11973) (_1!596 lt!11953) lt!11955 lt!11951))))

(declare-fun tail!50 (List!136) List!136)

(assert (=> b!8400 (= (bitStreamReadBitsIntoList!0 (_2!591 lt!11976) (_1!596 lt!11953) (bvsub lt!11955 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!50 lt!11951))))

(declare-fun lt!11974 () Unit!688)

(assert (=> b!8400 (= lt!11974 lt!11936)))

(declare-fun lt!11950 () Unit!688)

(declare-fun lt!11954 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!552 array!552 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!688)

(assert (=> b!8400 (= lt!11950 (arrayBitRangesEqImpliesEq!0 (buf!574 (_2!591 lt!11956)) (buf!574 (_2!591 lt!11976)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!11954 (bitIndex!0 (size!238 (buf!574 (_2!591 lt!11956))) (currentByte!1595 (_2!591 lt!11956)) (currentBit!1590 (_2!591 lt!11956)))))))

(declare-fun bitAt!0 (array!552 (_ BitVec 64)) Bool)

(assert (=> b!8400 (= (bitAt!0 (buf!574 (_2!591 lt!11956)) lt!11954) (bitAt!0 (buf!574 (_2!591 lt!11976)) lt!11954))))

(declare-fun lt!11959 () Unit!688)

(assert (=> b!8400 (= lt!11959 lt!11950)))

(declare-fun b!8401 () Bool)

(declare-fun res!8951 () Bool)

(declare-fun e!5251 () Bool)

(assert (=> b!8401 (=> (not res!8951) (not e!5251))))

(declare-fun lt!11966 () tuple2!1120)

(assert (=> b!8401 (= res!8951 (invariant!0 (currentBit!1590 (_2!591 lt!11966)) (currentByte!1595 (_2!591 lt!11966)) (size!238 (buf!574 (_2!591 lt!11966)))))))

(declare-fun b!8402 () Bool)

(declare-fun res!8953 () Bool)

(assert (=> b!8402 (=> (not res!8953) (not e!5251))))

(assert (=> b!8402 (= res!8953 (isPrefixOf!0 thiss!1486 (_2!591 lt!11966)))))

(declare-fun b!8403 () Bool)

(declare-fun res!8949 () Bool)

(assert (=> b!8403 (=> (not res!8949) (not e!5251))))

(assert (=> b!8403 (= res!8949 (= (size!238 (buf!574 (_2!591 lt!11966))) (size!238 (buf!574 thiss!1486))))))

(declare-fun b!8404 () Bool)

(declare-fun lt!11957 () tuple2!1130)

(assert (=> b!8404 (= e!5251 (= (bitStreamReadBitsIntoList!0 (_2!591 lt!11966) (_1!596 lt!11957) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!591 lt!11966) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!8404 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8404 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11970 () Unit!688)

(declare-fun lt!11962 () Unit!688)

(assert (=> b!8404 (= lt!11970 lt!11962)))

(declare-fun lt!11942 () (_ BitVec 64))

(assert (=> b!8404 (validate_offset_bits!1 ((_ sign_extend 32) (size!238 (buf!574 (_2!591 lt!11966)))) ((_ sign_extend 32) (currentByte!1595 thiss!1486)) ((_ sign_extend 32) (currentBit!1590 thiss!1486)) lt!11942)))

(assert (=> b!8404 (= lt!11962 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!574 (_2!591 lt!11966)) lt!11942))))

(declare-fun e!5252 () Bool)

(assert (=> b!8404 e!5252))

(declare-fun res!8952 () Bool)

(assert (=> b!8404 (=> (not res!8952) (not e!5252))))

(assert (=> b!8404 (= res!8952 (and (= (size!238 (buf!574 thiss!1486)) (size!238 (buf!574 (_2!591 lt!11966)))) (bvsge lt!11942 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8404 (= lt!11942 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!8404 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!8404 (= lt!11957 (reader!0 thiss!1486 (_2!591 lt!11966)))))

(declare-fun d!2460 () Bool)

(assert (=> d!2460 e!5251))

(declare-fun res!8948 () Bool)

(assert (=> d!2460 (=> (not res!8948) (not e!5251))))

(declare-fun lt!11948 () (_ BitVec 64))

(assert (=> d!2460 (= res!8948 (= (bitIndex!0 (size!238 (buf!574 (_2!591 lt!11966))) (currentByte!1595 (_2!591 lt!11966)) (currentBit!1590 (_2!591 lt!11966))) (bvsub lt!11948 from!367)))))

(assert (=> d!2460 (or (= (bvand lt!11948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!11948 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!11948 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!11975 () (_ BitVec 64))

(assert (=> d!2460 (= lt!11948 (bvadd lt!11975 from!367 nBits!460))))

(assert (=> d!2460 (or (not (= (bvand lt!11975 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!11975 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!11975 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2460 (= lt!11975 (bitIndex!0 (size!238 (buf!574 thiss!1486)) (currentByte!1595 thiss!1486) (currentBit!1590 thiss!1486)))))

(assert (=> d!2460 (= lt!11966 e!5250)))

(declare-fun c!463 () Bool)

(assert (=> d!2460 (= c!463 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!11946 () Unit!688)

(declare-fun lt!11938 () Unit!688)

(assert (=> d!2460 (= lt!11946 lt!11938)))

(assert (=> d!2460 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!454) Unit!688)

(assert (=> d!2460 (= lt!11938 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2460 (= lt!11954 (bitIndex!0 (size!238 (buf!574 thiss!1486)) (currentByte!1595 thiss!1486) (currentBit!1590 thiss!1486)))))

(assert (=> d!2460 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2460 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!11966)))

(declare-fun b!8405 () Bool)

(declare-fun res!8950 () Bool)

(assert (=> b!8405 (=> (not res!8950) (not e!5251))))

(assert (=> b!8405 (= res!8950 (= (size!238 (buf!574 thiss!1486)) (size!238 (buf!574 (_2!591 lt!11966)))))))

(declare-fun b!8406 () Bool)

(assert (=> b!8406 (= e!5252 (validate_offset_bits!1 ((_ sign_extend 32) (size!238 (buf!574 thiss!1486))) ((_ sign_extend 32) (currentByte!1595 thiss!1486)) ((_ sign_extend 32) (currentBit!1590 thiss!1486)) lt!11942))))

(declare-fun b!8407 () Bool)

(declare-fun Unit!707 () Unit!688)

(assert (=> b!8407 (= e!5250 (tuple2!1121 Unit!707 thiss!1486))))

(assert (=> b!8407 (= (size!238 (buf!574 thiss!1486)) (size!238 (buf!574 thiss!1486)))))

(declare-fun lt!11945 () Unit!688)

(declare-fun Unit!708 () Unit!688)

(assert (=> b!8407 (= lt!11945 Unit!708)))

(declare-fun checkByteArrayBitContent!0 (BitStream!454 array!552 array!552 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1132 0))(
  ( (tuple2!1133 (_1!597 array!552) (_2!597 BitStream!454)) )
))
(declare-fun readBits!0 (BitStream!454 (_ BitVec 64)) tuple2!1132)

(assert (=> b!8407 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!597 (readBits!0 (_1!596 call!118) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun bm!115 () Bool)

(assert (=> bm!115 (= call!118 (reader!0 (ite c!463 (_2!591 lt!11956) thiss!1486) (ite c!463 (_2!591 lt!11976) thiss!1486)))))

(assert (= (and d!2460 c!463) b!8400))

(assert (= (and d!2460 (not c!463)) b!8407))

(assert (= (or b!8400 b!8407) bm!115))

(assert (= (and d!2460 res!8948) b!8401))

(assert (= (and b!8401 res!8951) b!8405))

(assert (= (and b!8405 res!8950) b!8402))

(assert (= (and b!8402 res!8953) b!8403))

(assert (= (and b!8403 res!8949) b!8404))

(assert (= (and b!8404 res!8952) b!8406))

(declare-fun m!11247 () Bool)

(assert (=> bm!115 m!11247))

(declare-fun m!11249 () Bool)

(assert (=> b!8404 m!11249))

(declare-fun m!11251 () Bool)

(assert (=> b!8404 m!11251))

(declare-fun m!11253 () Bool)

(assert (=> b!8404 m!11253))

(declare-fun m!11255 () Bool)

(assert (=> b!8404 m!11255))

(declare-fun m!11257 () Bool)

(assert (=> b!8404 m!11257))

(declare-fun m!11259 () Bool)

(assert (=> b!8407 m!11259))

(declare-fun m!11261 () Bool)

(assert (=> b!8407 m!11261))

(declare-fun m!11263 () Bool)

(assert (=> b!8400 m!11263))

(declare-fun m!11265 () Bool)

(assert (=> b!8400 m!11265))

(declare-fun m!11267 () Bool)

(assert (=> b!8400 m!11267))

(declare-fun m!11269 () Bool)

(assert (=> b!8400 m!11269))

(declare-fun m!11271 () Bool)

(assert (=> b!8400 m!11271))

(assert (=> b!8400 m!11267))

(declare-fun m!11273 () Bool)

(assert (=> b!8400 m!11273))

(declare-fun m!11275 () Bool)

(assert (=> b!8400 m!11275))

(declare-fun m!11277 () Bool)

(assert (=> b!8400 m!11277))

(declare-fun m!11279 () Bool)

(assert (=> b!8400 m!11279))

(declare-fun m!11281 () Bool)

(assert (=> b!8400 m!11281))

(declare-fun m!11283 () Bool)

(assert (=> b!8400 m!11283))

(declare-fun m!11285 () Bool)

(assert (=> b!8400 m!11285))

(declare-fun m!11287 () Bool)

(assert (=> b!8400 m!11287))

(declare-fun m!11289 () Bool)

(assert (=> b!8400 m!11289))

(declare-fun m!11291 () Bool)

(assert (=> b!8400 m!11291))

(assert (=> b!8400 m!11281))

(declare-fun m!11293 () Bool)

(assert (=> b!8400 m!11293))

(declare-fun m!11295 () Bool)

(assert (=> b!8400 m!11295))

(assert (=> b!8400 m!11099))

(declare-fun m!11297 () Bool)

(assert (=> b!8400 m!11297))

(declare-fun m!11299 () Bool)

(assert (=> b!8400 m!11299))

(declare-fun m!11301 () Bool)

(assert (=> b!8400 m!11301))

(declare-fun m!11303 () Bool)

(assert (=> b!8400 m!11303))

(declare-fun m!11305 () Bool)

(assert (=> b!8400 m!11305))

(declare-fun m!11307 () Bool)

(assert (=> b!8400 m!11307))

(declare-fun m!11309 () Bool)

(assert (=> b!8400 m!11309))

(declare-fun m!11311 () Bool)

(assert (=> b!8400 m!11311))

(declare-fun m!11313 () Bool)

(assert (=> b!8400 m!11313))

(declare-fun m!11315 () Bool)

(assert (=> b!8400 m!11315))

(assert (=> b!8400 m!11313))

(assert (=> b!8400 m!11275))

(declare-fun m!11317 () Bool)

(assert (=> b!8400 m!11317))

(declare-fun m!11319 () Bool)

(assert (=> b!8400 m!11319))

(declare-fun m!11321 () Bool)

(assert (=> b!8400 m!11321))

(declare-fun m!11323 () Bool)

(assert (=> b!8400 m!11323))

(declare-fun m!11325 () Bool)

(assert (=> b!8401 m!11325))

(declare-fun m!11327 () Bool)

(assert (=> b!8406 m!11327))

(declare-fun m!11329 () Bool)

(assert (=> b!8402 m!11329))

(declare-fun m!11331 () Bool)

(assert (=> d!2460 m!11331))

(assert (=> d!2460 m!11099))

(declare-fun m!11333 () Bool)

(assert (=> d!2460 m!11333))

(declare-fun m!11335 () Bool)

(assert (=> d!2460 m!11335))

(assert (=> b!8288 d!2460))

(push 1)

(assert (not b!8407))

(assert (not bm!115))

(assert (not b!8400))

(assert (not d!2456))

(assert (not d!2442))

(assert (not d!2460))

(assert (not b!8402))

(assert (not b!8406))

(assert (not b!8401))

(assert (not d!2450))

(assert (not d!2448))

(assert (not b!8404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

