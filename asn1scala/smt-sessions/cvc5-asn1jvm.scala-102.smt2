; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2372 () Bool)

(assert start!2372)

(declare-fun b!11259 () Bool)

(declare-fun res!11078 () Bool)

(declare-fun e!6884 () Bool)

(assert (=> b!11259 (=> res!11078 e!6884)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!663 0))(
  ( (array!664 (arr!706 (Array (_ BitVec 32) (_ BitVec 8))) (size!286 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!663)

(declare-datatypes ((BitStream!538 0))(
  ( (BitStream!539 (buf!631 array!663) (currentByte!1703 (_ BitVec 32)) (currentBit!1698 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!968 0))(
  ( (Unit!969) )
))
(declare-datatypes ((tuple2!1390 0))(
  ( (tuple2!1391 (_1!741 Unit!968) (_2!741 BitStream!538)) )
))
(declare-fun lt!17680 () tuple2!1390)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-datatypes ((List!165 0))(
  ( (Nil!162) (Cons!161 (h!280 Bool) (t!915 List!165)) )
))
(declare-fun lt!17681 () List!165)

(declare-fun byteArrayBitContentToList!0 (BitStream!538 array!663 (_ BitVec 64) (_ BitVec 64)) List!165)

(assert (=> b!11259 (= res!11078 (not (= lt!17681 (byteArrayBitContentToList!0 (_2!741 lt!17680) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!11260 () Bool)

(declare-fun res!11079 () Bool)

(declare-fun e!6890 () Bool)

(assert (=> b!11260 (=> (not res!11079) (not e!6890))))

(declare-fun thiss!1486 () BitStream!538)

(declare-fun isPrefixOf!0 (BitStream!538 BitStream!538) Bool)

(assert (=> b!11260 (= res!11079 (isPrefixOf!0 thiss!1486 (_2!741 lt!17680)))))

(declare-fun res!11076 () Bool)

(declare-fun e!6886 () Bool)

(assert (=> start!2372 (=> (not res!11076) (not e!6886))))

(assert (=> start!2372 (= res!11076 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!286 srcBuffer!6))))))))

(assert (=> start!2372 e!6886))

(assert (=> start!2372 true))

(declare-fun array_inv!278 (array!663) Bool)

(assert (=> start!2372 (array_inv!278 srcBuffer!6)))

(declare-fun e!6889 () Bool)

(declare-fun inv!12 (BitStream!538) Bool)

(assert (=> start!2372 (and (inv!12 thiss!1486) e!6889)))

(declare-fun b!11261 () Bool)

(declare-fun res!11077 () Bool)

(assert (=> b!11261 (=> (not res!11077) (not e!6890))))

(assert (=> b!11261 (= res!11077 (= (size!286 (buf!631 thiss!1486)) (size!286 (buf!631 (_2!741 lt!17680)))))))

(declare-fun b!11262 () Bool)

(assert (=> b!11262 (= e!6886 e!6890)))

(declare-fun res!11075 () Bool)

(assert (=> b!11262 (=> (not res!11075) (not e!6890))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11262 (= res!11075 (invariant!0 (currentBit!1698 (_2!741 lt!17680)) (currentByte!1703 (_2!741 lt!17680)) (size!286 (buf!631 (_2!741 lt!17680)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!538 array!663 (_ BitVec 64) (_ BitVec 64)) tuple2!1390)

(assert (=> b!11262 (= lt!17680 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!11263 () Bool)

(declare-fun e!6885 () Bool)

(assert (=> b!11263 (= e!6884 e!6885)))

(declare-fun res!11080 () Bool)

(assert (=> b!11263 (=> res!11080 e!6885)))

(declare-datatypes ((tuple2!1392 0))(
  ( (tuple2!1393 (_1!742 array!663) (_2!742 BitStream!538)) )
))
(declare-fun lt!17679 () tuple2!1392)

(declare-fun checkByteArrayBitContent!0 (BitStream!538 array!663 array!663 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11263 (= res!11080 (not (checkByteArrayBitContent!0 (_2!741 lt!17680) srcBuffer!6 (_1!742 lt!17679) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!17684 () Unit!968)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!538 array!663 array!663 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!968)

(assert (=> b!11263 (= lt!17684 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!741 lt!17680) srcBuffer!6 (_1!742 lt!17679) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!11264 () Bool)

(declare-fun res!11081 () Bool)

(assert (=> b!11264 (=> (not res!11081) (not e!6886))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11264 (= res!11081 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 thiss!1486))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) nBits!460))))

(declare-fun b!11265 () Bool)

(declare-datatypes ((tuple2!1394 0))(
  ( (tuple2!1395 (_1!743 BitStream!538) (_2!743 BitStream!538)) )
))
(declare-fun lt!17683 () tuple2!1394)

(assert (=> b!11265 (= e!6885 (inv!12 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))))))

(declare-fun b!11266 () Bool)

(assert (=> b!11266 (= e!6890 (not e!6884))))

(declare-fun res!11083 () Bool)

(assert (=> b!11266 (=> res!11083 e!6884)))

(assert (=> b!11266 (= res!11083 (not (= (byteArrayBitContentToList!0 (_2!741 lt!17680) (_1!742 lt!17679) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17681)))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!538 BitStream!538 (_ BitVec 64)) List!165)

(assert (=> b!11266 (= lt!17681 (bitStreamReadBitsIntoList!0 (_2!741 lt!17680) (_1!743 lt!17683) nBits!460))))

(declare-fun readBits!0 (BitStream!538 (_ BitVec 64)) tuple2!1392)

(assert (=> b!11266 (= lt!17679 (readBits!0 (_1!743 lt!17683) nBits!460))))

(assert (=> b!11266 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) nBits!460)))

(declare-fun lt!17682 () Unit!968)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!538 array!663 (_ BitVec 64)) Unit!968)

(assert (=> b!11266 (= lt!17682 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!631 (_2!741 lt!17680)) nBits!460))))

(declare-fun reader!0 (BitStream!538 BitStream!538) tuple2!1394)

(assert (=> b!11266 (= lt!17683 (reader!0 thiss!1486 (_2!741 lt!17680)))))

(declare-fun b!11267 () Bool)

(declare-fun res!11082 () Bool)

(assert (=> b!11267 (=> (not res!11082) (not e!6890))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11267 (= res!11082 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!17680))) (currentByte!1703 (_2!741 lt!17680)) (currentBit!1698 (_2!741 lt!17680))) (bvadd (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)) nBits!460)))))

(declare-fun b!11268 () Bool)

(assert (=> b!11268 (= e!6889 (array_inv!278 (buf!631 thiss!1486)))))

(assert (= (and start!2372 res!11076) b!11264))

(assert (= (and b!11264 res!11081) b!11262))

(assert (= (and b!11262 res!11075) b!11261))

(assert (= (and b!11261 res!11077) b!11267))

(assert (= (and b!11267 res!11082) b!11260))

(assert (= (and b!11260 res!11079) b!11266))

(assert (= (and b!11266 (not res!11083)) b!11259))

(assert (= (and b!11259 (not res!11078)) b!11263))

(assert (= (and b!11263 (not res!11080)) b!11265))

(assert (= start!2372 b!11268))

(declare-fun m!16433 () Bool)

(assert (=> b!11268 m!16433))

(declare-fun m!16435 () Bool)

(assert (=> b!11262 m!16435))

(declare-fun m!16437 () Bool)

(assert (=> b!11262 m!16437))

(declare-fun m!16439 () Bool)

(assert (=> b!11265 m!16439))

(declare-fun m!16441 () Bool)

(assert (=> b!11264 m!16441))

(declare-fun m!16443 () Bool)

(assert (=> b!11266 m!16443))

(declare-fun m!16445 () Bool)

(assert (=> b!11266 m!16445))

(declare-fun m!16447 () Bool)

(assert (=> b!11266 m!16447))

(declare-fun m!16449 () Bool)

(assert (=> b!11266 m!16449))

(declare-fun m!16451 () Bool)

(assert (=> b!11266 m!16451))

(declare-fun m!16453 () Bool)

(assert (=> b!11266 m!16453))

(declare-fun m!16455 () Bool)

(assert (=> start!2372 m!16455))

(declare-fun m!16457 () Bool)

(assert (=> start!2372 m!16457))

(declare-fun m!16459 () Bool)

(assert (=> b!11259 m!16459))

(declare-fun m!16461 () Bool)

(assert (=> b!11263 m!16461))

(declare-fun m!16463 () Bool)

(assert (=> b!11263 m!16463))

(declare-fun m!16465 () Bool)

(assert (=> b!11260 m!16465))

(declare-fun m!16467 () Bool)

(assert (=> b!11267 m!16467))

(declare-fun m!16469 () Bool)

(assert (=> b!11267 m!16469))

(push 1)

(assert (not b!11260))

(assert (not b!11263))

(assert (not start!2372))

(assert (not b!11264))

(assert (not b!11262))

(assert (not b!11259))

(assert (not b!11266))

(assert (not b!11267))

(assert (not b!11265))

(assert (not b!11268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3460 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3460 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 thiss!1486))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 thiss!1486))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486))) nBits!460))))

(declare-fun bs!1025 () Bool)

(assert (= bs!1025 d!3460))

(declare-fun m!16547 () Bool)

(assert (=> bs!1025 m!16547))

(assert (=> b!11264 d!3460))

(declare-fun d!3462 () Bool)

(declare-fun c!770 () Bool)

(assert (=> d!3462 (= c!770 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6935 () List!165)

(assert (=> d!3462 (= (byteArrayBitContentToList!0 (_2!741 lt!17680) srcBuffer!6 from!367 nBits!460) e!6935)))

(declare-fun b!11333 () Bool)

(assert (=> b!11333 (= e!6935 Nil!162)))

(declare-fun b!11334 () Bool)

(assert (=> b!11334 (= e!6935 (Cons!161 (not (= (bvand ((_ sign_extend 24) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!741 lt!17680) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3462 c!770) b!11333))

(assert (= (and d!3462 (not c!770)) b!11334))

(declare-fun m!16549 () Bool)

(assert (=> b!11334 m!16549))

(declare-fun m!16551 () Bool)

(assert (=> b!11334 m!16551))

(declare-fun m!16553 () Bool)

(assert (=> b!11334 m!16553))

(assert (=> b!11259 d!3462))

(declare-fun d!3464 () Bool)

(declare-fun res!11146 () Bool)

(declare-fun e!6940 () Bool)

(assert (=> d!3464 (=> (not res!11146) (not e!6940))))

(assert (=> d!3464 (= res!11146 (= (size!286 (buf!631 thiss!1486)) (size!286 (buf!631 (_2!741 lt!17680)))))))

(assert (=> d!3464 (= (isPrefixOf!0 thiss!1486 (_2!741 lt!17680)) e!6940)))

(declare-fun b!11341 () Bool)

(declare-fun res!11145 () Bool)

(assert (=> b!11341 (=> (not res!11145) (not e!6940))))

(assert (=> b!11341 (= res!11145 (bvsle (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)) (bitIndex!0 (size!286 (buf!631 (_2!741 lt!17680))) (currentByte!1703 (_2!741 lt!17680)) (currentBit!1698 (_2!741 lt!17680)))))))

(declare-fun b!11342 () Bool)

(declare-fun e!6941 () Bool)

(assert (=> b!11342 (= e!6940 e!6941)))

(declare-fun res!11144 () Bool)

(assert (=> b!11342 (=> res!11144 e!6941)))

(assert (=> b!11342 (= res!11144 (= (size!286 (buf!631 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!11343 () Bool)

(declare-fun arrayBitRangesEq!0 (array!663 array!663 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11343 (= e!6941 (arrayBitRangesEq!0 (buf!631 thiss!1486) (buf!631 (_2!741 lt!17680)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(assert (= (and d!3464 res!11146) b!11341))

(assert (= (and b!11341 res!11145) b!11342))

(assert (= (and b!11342 (not res!11144)) b!11343))

(assert (=> b!11341 m!16469))

(assert (=> b!11341 m!16467))

(assert (=> b!11343 m!16469))

(assert (=> b!11343 m!16469))

(declare-fun m!16555 () Bool)

(assert (=> b!11343 m!16555))

(assert (=> b!11260 d!3464))

(declare-fun d!3468 () Bool)

(assert (=> d!3468 (= (inv!12 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))) (invariant!0 (currentBit!1698 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))) (currentByte!1703 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))) (size!286 (buf!631 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))))))))

(declare-fun bs!1026 () Bool)

(assert (= bs!1026 d!3468))

(declare-fun m!16557 () Bool)

(assert (=> bs!1026 m!16557))

(assert (=> b!11265 d!3468))

(declare-fun d!3470 () Bool)

(assert (=> d!3470 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486))) nBits!460))))

(declare-fun bs!1027 () Bool)

(assert (= bs!1027 d!3470))

(declare-fun m!16561 () Bool)

(assert (=> bs!1027 m!16561))

(assert (=> b!11266 d!3470))

(declare-fun b!11354 () Bool)

(declare-fun e!6946 () Bool)

(declare-fun lt!17728 () List!165)

(declare-fun isEmpty!37 (List!165) Bool)

(assert (=> b!11354 (= e!6946 (isEmpty!37 lt!17728))))

(declare-fun d!3472 () Bool)

(assert (=> d!3472 e!6946))

(declare-fun c!776 () Bool)

(assert (=> d!3472 (= c!776 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!1408 0))(
  ( (tuple2!1409 (_1!750 List!165) (_2!750 BitStream!538)) )
))
(declare-fun e!6947 () tuple2!1408)

(assert (=> d!3472 (= lt!17728 (_1!750 e!6947))))

(declare-fun c!775 () Bool)

(assert (=> d!3472 (= c!775 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3472 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3472 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!17680) (_1!743 lt!17683) nBits!460) lt!17728)))

(declare-fun b!11355 () Bool)

(declare-fun length!32 (List!165) Int)

(assert (=> b!11355 (= e!6946 (> (length!32 lt!17728) 0))))

(declare-fun b!11352 () Bool)

(assert (=> b!11352 (= e!6947 (tuple2!1409 Nil!162 (_1!743 lt!17683)))))

(declare-fun b!11353 () Bool)

(declare-fun lt!17729 () (_ BitVec 64))

(declare-datatypes ((tuple2!1410 0))(
  ( (tuple2!1411 (_1!751 Bool) (_2!751 BitStream!538)) )
))
(declare-fun lt!17727 () tuple2!1410)

(assert (=> b!11353 (= e!6947 (tuple2!1409 (Cons!161 (_1!751 lt!17727) (bitStreamReadBitsIntoList!0 (_2!741 lt!17680) (_2!751 lt!17727) (bvsub nBits!460 lt!17729))) (_2!751 lt!17727)))))

(declare-fun readBit!0 (BitStream!538) tuple2!1410)

(assert (=> b!11353 (= lt!17727 (readBit!0 (_1!743 lt!17683)))))

(assert (=> b!11353 (= lt!17729 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3472 c!775) b!11352))

(assert (= (and d!3472 (not c!775)) b!11353))

(assert (= (and d!3472 c!776) b!11354))

(assert (= (and d!3472 (not c!776)) b!11355))

(declare-fun m!16563 () Bool)

(assert (=> b!11354 m!16563))

(declare-fun m!16565 () Bool)

(assert (=> b!11355 m!16565))

(declare-fun m!16567 () Bool)

(assert (=> b!11353 m!16567))

(declare-fun m!16569 () Bool)

(assert (=> b!11353 m!16569))

(assert (=> b!11266 d!3472))

(declare-fun d!3478 () Bool)

(assert (=> d!3478 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) nBits!460)))

(declare-fun lt!17732 () Unit!968)

(declare-fun choose!9 (BitStream!538 array!663 (_ BitVec 64) BitStream!538) Unit!968)

(assert (=> d!3478 (= lt!17732 (choose!9 thiss!1486 (buf!631 (_2!741 lt!17680)) nBits!460 (BitStream!539 (buf!631 (_2!741 lt!17680)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(assert (=> d!3478 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!631 (_2!741 lt!17680)) nBits!460) lt!17732)))

(declare-fun bs!1029 () Bool)

(assert (= bs!1029 d!3478))

(assert (=> bs!1029 m!16447))

(declare-fun m!16571 () Bool)

(assert (=> bs!1029 m!16571))

(assert (=> b!11266 d!3478))

(declare-fun d!3480 () Bool)

(declare-fun c!777 () Bool)

(assert (=> d!3480 (= c!777 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6948 () List!165)

(assert (=> d!3480 (= (byteArrayBitContentToList!0 (_2!741 lt!17680) (_1!742 lt!17679) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6948)))

(declare-fun b!11356 () Bool)

(assert (=> b!11356 (= e!6948 Nil!162)))

(declare-fun b!11357 () Bool)

(assert (=> b!11357 (= e!6948 (Cons!161 (not (= (bvand ((_ sign_extend 24) (select (arr!706 (_1!742 lt!17679)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!741 lt!17680) (_1!742 lt!17679) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3480 c!777) b!11356))

(assert (= (and d!3480 (not c!777)) b!11357))

(declare-fun m!16573 () Bool)

(assert (=> b!11357 m!16573))

(declare-fun m!16575 () Bool)

(assert (=> b!11357 m!16575))

(declare-fun m!16577 () Bool)

(assert (=> b!11357 m!16577))

(assert (=> b!11266 d!3480))

(declare-fun b!11368 () Bool)

(declare-fun res!11154 () Bool)

(declare-fun e!6954 () Bool)

(assert (=> b!11368 (=> (not res!11154) (not e!6954))))

(declare-fun lt!17785 () tuple2!1394)

(assert (=> b!11368 (= res!11154 (isPrefixOf!0 (_2!743 lt!17785) (_2!741 lt!17680)))))

(declare-fun lt!17777 () (_ BitVec 64))

(declare-fun lt!17792 () (_ BitVec 64))

(declare-fun b!11369 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!538 (_ BitVec 64)) BitStream!538)

(assert (=> b!11369 (= e!6954 (= (_1!743 lt!17785) (withMovedBitIndex!0 (_2!743 lt!17785) (bvsub lt!17792 lt!17777))))))

(assert (=> b!11369 (or (= (bvand lt!17792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17777 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17792 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17792 lt!17777) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11369 (= lt!17777 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!17680))) (currentByte!1703 (_2!741 lt!17680)) (currentBit!1698 (_2!741 lt!17680))))))

(assert (=> b!11369 (= lt!17792 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(declare-fun d!3482 () Bool)

(assert (=> d!3482 e!6954))

(declare-fun res!11155 () Bool)

(assert (=> d!3482 (=> (not res!11155) (not e!6954))))

(assert (=> d!3482 (= res!11155 (isPrefixOf!0 (_1!743 lt!17785) (_2!743 lt!17785)))))

(declare-fun lt!17790 () BitStream!538)

(assert (=> d!3482 (= lt!17785 (tuple2!1395 lt!17790 (_2!741 lt!17680)))))

(declare-fun lt!17781 () Unit!968)

(declare-fun lt!17774 () Unit!968)

(assert (=> d!3482 (= lt!17781 lt!17774)))

(assert (=> d!3482 (isPrefixOf!0 lt!17790 (_2!741 lt!17680))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!538 BitStream!538 BitStream!538) Unit!968)

(assert (=> d!3482 (= lt!17774 (lemmaIsPrefixTransitive!0 lt!17790 (_2!741 lt!17680) (_2!741 lt!17680)))))

(declare-fun lt!17773 () Unit!968)

(declare-fun lt!17786 () Unit!968)

(assert (=> d!3482 (= lt!17773 lt!17786)))

(assert (=> d!3482 (isPrefixOf!0 lt!17790 (_2!741 lt!17680))))

(assert (=> d!3482 (= lt!17786 (lemmaIsPrefixTransitive!0 lt!17790 thiss!1486 (_2!741 lt!17680)))))

(declare-fun lt!17776 () Unit!968)

(declare-fun e!6953 () Unit!968)

(assert (=> d!3482 (= lt!17776 e!6953)))

(declare-fun c!780 () Bool)

(assert (=> d!3482 (= c!780 (not (= (size!286 (buf!631 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!17775 () Unit!968)

(declare-fun lt!17784 () Unit!968)

(assert (=> d!3482 (= lt!17775 lt!17784)))

(assert (=> d!3482 (isPrefixOf!0 (_2!741 lt!17680) (_2!741 lt!17680))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!538) Unit!968)

(assert (=> d!3482 (= lt!17784 (lemmaIsPrefixRefl!0 (_2!741 lt!17680)))))

(declare-fun lt!17779 () Unit!968)

(declare-fun lt!17782 () Unit!968)

(assert (=> d!3482 (= lt!17779 lt!17782)))

(assert (=> d!3482 (= lt!17782 (lemmaIsPrefixRefl!0 (_2!741 lt!17680)))))

(declare-fun lt!17780 () Unit!968)

(declare-fun lt!17789 () Unit!968)

(assert (=> d!3482 (= lt!17780 lt!17789)))

(assert (=> d!3482 (isPrefixOf!0 lt!17790 lt!17790)))

(assert (=> d!3482 (= lt!17789 (lemmaIsPrefixRefl!0 lt!17790))))

(declare-fun lt!17778 () Unit!968)

(declare-fun lt!17791 () Unit!968)

(assert (=> d!3482 (= lt!17778 lt!17791)))

(assert (=> d!3482 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3482 (= lt!17791 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3482 (= lt!17790 (BitStream!539 (buf!631 (_2!741 lt!17680)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(assert (=> d!3482 (isPrefixOf!0 thiss!1486 (_2!741 lt!17680))))

(assert (=> d!3482 (= (reader!0 thiss!1486 (_2!741 lt!17680)) lt!17785)))

(declare-fun b!11370 () Bool)

(declare-fun res!11153 () Bool)

(assert (=> b!11370 (=> (not res!11153) (not e!6954))))

(assert (=> b!11370 (= res!11153 (isPrefixOf!0 (_1!743 lt!17785) thiss!1486))))

(declare-fun b!11371 () Bool)

(declare-fun lt!17787 () Unit!968)

(assert (=> b!11371 (= e!6953 lt!17787)))

(declare-fun lt!17783 () (_ BitVec 64))

(assert (=> b!11371 (= lt!17783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!17788 () (_ BitVec 64))

(assert (=> b!11371 (= lt!17788 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!663 array!663 (_ BitVec 64) (_ BitVec 64)) Unit!968)

(assert (=> b!11371 (= lt!17787 (arrayBitRangesEqSymmetric!0 (buf!631 thiss!1486) (buf!631 (_2!741 lt!17680)) lt!17783 lt!17788))))

(assert (=> b!11371 (arrayBitRangesEq!0 (buf!631 (_2!741 lt!17680)) (buf!631 thiss!1486) lt!17783 lt!17788)))

(declare-fun b!11372 () Bool)

(declare-fun Unit!974 () Unit!968)

(assert (=> b!11372 (= e!6953 Unit!974)))

(assert (= (and d!3482 c!780) b!11371))

(assert (= (and d!3482 (not c!780)) b!11372))

(assert (= (and d!3482 res!11155) b!11370))

(assert (= (and b!11370 res!11153) b!11368))

(assert (= (and b!11368 res!11154) b!11369))

(declare-fun m!16579 () Bool)

(assert (=> b!11369 m!16579))

(assert (=> b!11369 m!16467))

(assert (=> b!11369 m!16469))

(declare-fun m!16581 () Bool)

(assert (=> b!11370 m!16581))

(declare-fun m!16583 () Bool)

(assert (=> d!3482 m!16583))

(assert (=> d!3482 m!16465))

(declare-fun m!16585 () Bool)

(assert (=> d!3482 m!16585))

(declare-fun m!16587 () Bool)

(assert (=> d!3482 m!16587))

(declare-fun m!16589 () Bool)

(assert (=> d!3482 m!16589))

(declare-fun m!16591 () Bool)

(assert (=> d!3482 m!16591))

(declare-fun m!16593 () Bool)

(assert (=> d!3482 m!16593))

(declare-fun m!16595 () Bool)

(assert (=> d!3482 m!16595))

(declare-fun m!16597 () Bool)

(assert (=> d!3482 m!16597))

(declare-fun m!16599 () Bool)

(assert (=> d!3482 m!16599))

(declare-fun m!16601 () Bool)

(assert (=> d!3482 m!16601))

(assert (=> b!11371 m!16469))

(declare-fun m!16603 () Bool)

(assert (=> b!11371 m!16603))

(declare-fun m!16605 () Bool)

(assert (=> b!11371 m!16605))

(declare-fun m!16607 () Bool)

(assert (=> b!11368 m!16607))

(assert (=> b!11266 d!3482))

(declare-fun b!11400 () Bool)

(declare-fun res!11184 () Bool)

(declare-fun e!6967 () Bool)

(assert (=> b!11400 (=> (not res!11184) (not e!6967))))

(declare-fun lt!17836 () tuple2!1392)

(assert (=> b!11400 (= res!11184 (bvsle (currentByte!1703 (_1!743 lt!17683)) (currentByte!1703 (_2!742 lt!17836))))))

(declare-fun b!11401 () Bool)

(assert (=> b!11401 (= e!6967 (= (byteArrayBitContentToList!0 (_2!742 lt!17836) (_1!742 lt!17836) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!742 lt!17836) (_1!743 lt!17683) nBits!460)))))

(declare-fun d!3484 () Bool)

(assert (=> d!3484 e!6967))

(declare-fun res!11183 () Bool)

(assert (=> d!3484 (=> (not res!11183) (not e!6967))))

(assert (=> d!3484 (= res!11183 (= (buf!631 (_2!742 lt!17836)) (buf!631 (_1!743 lt!17683))))))

(declare-datatypes ((tuple3!86 0))(
  ( (tuple3!87 (_1!752 Unit!968) (_2!752 BitStream!538) (_3!46 array!663)) )
))
(declare-fun lt!17841 () tuple3!86)

(assert (=> d!3484 (= lt!17836 (tuple2!1393 (_3!46 lt!17841) (_2!752 lt!17841)))))

(declare-fun readBitsLoop!0 (BitStream!538 (_ BitVec 64) array!663 (_ BitVec 64) (_ BitVec 64)) tuple3!86)

(assert (=> d!3484 (= lt!17841 (readBitsLoop!0 (_1!743 lt!17683) nBits!460 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3484 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3484 (= (readBits!0 (_1!743 lt!17683) nBits!460) lt!17836)))

(declare-fun b!11402 () Bool)

(declare-fun res!11186 () Bool)

(assert (=> b!11402 (=> (not res!11186) (not e!6967))))

(declare-fun lt!17839 () (_ BitVec 64))

(assert (=> b!11402 (= res!11186 (= (size!286 (_1!742 lt!17836)) ((_ extract 31 0) lt!17839)))))

(assert (=> b!11402 (and (bvslt lt!17839 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!17839 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!17837 () (_ BitVec 64))

(declare-fun lt!17835 () (_ BitVec 64))

(assert (=> b!11402 (= lt!17839 (bvsdiv lt!17837 lt!17835))))

(assert (=> b!11402 (and (not (= lt!17835 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!17837 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!17835 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!11402 (= lt!17835 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!17843 () (_ BitVec 64))

(declare-fun lt!17838 () (_ BitVec 64))

(assert (=> b!11402 (= lt!17837 (bvsub lt!17843 lt!17838))))

(assert (=> b!11402 (or (= (bvand lt!17843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17838 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17843 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17843 lt!17838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11402 (= lt!17838 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!17840 () (_ BitVec 64))

(assert (=> b!11402 (= lt!17843 (bvadd nBits!460 lt!17840))))

(assert (=> b!11402 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17840 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!17840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11402 (= lt!17840 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!11403 () Bool)

(declare-fun res!11187 () Bool)

(assert (=> b!11403 (=> (not res!11187) (not e!6967))))

(assert (=> b!11403 (= res!11187 (invariant!0 (currentBit!1698 (_2!742 lt!17836)) (currentByte!1703 (_2!742 lt!17836)) (size!286 (buf!631 (_2!742 lt!17836)))))))

(declare-fun b!11404 () Bool)

(declare-fun res!11185 () Bool)

(assert (=> b!11404 (=> (not res!11185) (not e!6967))))

(declare-fun lt!17842 () (_ BitVec 64))

(assert (=> b!11404 (= res!11185 (= (bvadd lt!17842 nBits!460) (bitIndex!0 (size!286 (buf!631 (_2!742 lt!17836))) (currentByte!1703 (_2!742 lt!17836)) (currentBit!1698 (_2!742 lt!17836)))))))

(assert (=> b!11404 (or (not (= (bvand lt!17842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!17842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!17842 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11404 (= lt!17842 (bitIndex!0 (size!286 (buf!631 (_1!743 lt!17683))) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_1!743 lt!17683))))))

(assert (= (and d!3484 res!11183) b!11404))

(assert (= (and b!11404 res!11185) b!11403))

(assert (= (and b!11403 res!11187) b!11402))

(assert (= (and b!11402 res!11186) b!11400))

(assert (= (and b!11400 res!11184) b!11401))

(declare-fun m!16617 () Bool)

(assert (=> b!11401 m!16617))

(declare-fun m!16619 () Bool)

(assert (=> b!11401 m!16619))

(declare-fun m!16621 () Bool)

(assert (=> d!3484 m!16621))

(declare-fun m!16623 () Bool)

(assert (=> b!11403 m!16623))

(declare-fun m!16625 () Bool)

(assert (=> b!11404 m!16625))

(declare-fun m!16627 () Bool)

(assert (=> b!11404 m!16627))

(assert (=> b!11266 d!3484))

(declare-fun d!3498 () Bool)

(assert (=> d!3498 (= (invariant!0 (currentBit!1698 (_2!741 lt!17680)) (currentByte!1703 (_2!741 lt!17680)) (size!286 (buf!631 (_2!741 lt!17680)))) (and (bvsge (currentBit!1698 (_2!741 lt!17680)) #b00000000000000000000000000000000) (bvslt (currentBit!1698 (_2!741 lt!17680)) #b00000000000000000000000000001000) (bvsge (currentByte!1703 (_2!741 lt!17680)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1703 (_2!741 lt!17680)) (size!286 (buf!631 (_2!741 lt!17680)))) (and (= (currentBit!1698 (_2!741 lt!17680)) #b00000000000000000000000000000000) (= (currentByte!1703 (_2!741 lt!17680)) (size!286 (buf!631 (_2!741 lt!17680))))))))))

(assert (=> b!11262 d!3498))

(declare-fun lt!18270 () tuple2!1390)

(declare-fun c!801 () Bool)

(declare-fun bm!212 () Bool)

(declare-fun call!215 () tuple2!1394)

(assert (=> bm!212 (= call!215 (reader!0 thiss!1486 (ite c!801 (_2!741 lt!18270) thiss!1486)))))

(declare-fun b!11502 () Bool)

(declare-fun e!7007 () Bool)

(declare-fun lt!18303 () (_ BitVec 64))

(assert (=> b!11502 (= e!7007 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 thiss!1486))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) lt!18303))))

(declare-fun b!11503 () Bool)

(declare-fun e!7008 () tuple2!1390)

(declare-fun Unit!975 () Unit!968)

(assert (=> b!11503 (= e!7008 (tuple2!1391 Unit!975 thiss!1486))))

(assert (=> b!11503 (= (size!286 (buf!631 thiss!1486)) (size!286 (buf!631 thiss!1486)))))

(declare-fun lt!18278 () Unit!968)

(declare-fun Unit!976 () Unit!968)

(assert (=> b!11503 (= lt!18278 Unit!976)))

(assert (=> b!11503 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!742 (readBits!0 (_1!743 call!215) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!11504 () Bool)

(declare-fun res!11249 () Bool)

(declare-fun e!7009 () Bool)

(assert (=> b!11504 (=> (not res!11249) (not e!7009))))

(declare-fun lt!18271 () tuple2!1390)

(assert (=> b!11504 (= res!11249 (= (size!286 (buf!631 (_2!741 lt!18271))) (size!286 (buf!631 thiss!1486))))))

(declare-fun d!3500 () Bool)

(assert (=> d!3500 e!7009))

(declare-fun res!11250 () Bool)

(assert (=> d!3500 (=> (not res!11250) (not e!7009))))

(declare-fun lt!18301 () (_ BitVec 64))

(assert (=> d!3500 (= res!11250 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18271))) (currentByte!1703 (_2!741 lt!18271)) (currentBit!1698 (_2!741 lt!18271))) (bvsub lt!18301 from!367)))))

(assert (=> d!3500 (or (= (bvand lt!18301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18301 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!18280 () (_ BitVec 64))

(assert (=> d!3500 (= lt!18301 (bvadd lt!18280 from!367 nBits!460))))

(assert (=> d!3500 (or (not (= (bvand lt!18280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!18280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!18280 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3500 (= lt!18280 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(assert (=> d!3500 (= lt!18271 e!7008)))

(assert (=> d!3500 (= c!801 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!18285 () Unit!968)

(declare-fun lt!18268 () Unit!968)

(assert (=> d!3500 (= lt!18285 lt!18268)))

(assert (=> d!3500 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3500 (= lt!18268 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!18296 () (_ BitVec 64))

(assert (=> d!3500 (= lt!18296 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(assert (=> d!3500 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3500 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!18271)))

(declare-fun b!11505 () Bool)

(declare-fun res!11245 () Bool)

(assert (=> b!11505 (=> (not res!11245) (not e!7009))))

(assert (=> b!11505 (= res!11245 (invariant!0 (currentBit!1698 (_2!741 lt!18271)) (currentByte!1703 (_2!741 lt!18271)) (size!286 (buf!631 (_2!741 lt!18271)))))))

(declare-fun lt!18298 () tuple2!1394)

(declare-fun b!11506 () Bool)

(assert (=> b!11506 (= e!7009 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!18271) (_1!743 lt!18298) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!741 lt!18271) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!11506 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11506 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!18291 () Unit!968)

(declare-fun lt!18294 () Unit!968)

(assert (=> b!11506 (= lt!18291 lt!18294)))

(assert (=> b!11506 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18271)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) lt!18303)))

(assert (=> b!11506 (= lt!18294 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!631 (_2!741 lt!18271)) lt!18303))))

(assert (=> b!11506 e!7007))

(declare-fun res!11247 () Bool)

(assert (=> b!11506 (=> (not res!11247) (not e!7007))))

(assert (=> b!11506 (= res!11247 (and (= (size!286 (buf!631 thiss!1486)) (size!286 (buf!631 (_2!741 lt!18271)))) (bvsge lt!18303 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11506 (= lt!18303 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!11506 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11506 (= lt!18298 (reader!0 thiss!1486 (_2!741 lt!18271)))))

(declare-fun b!11507 () Bool)

(declare-fun res!11246 () Bool)

(assert (=> b!11507 (=> (not res!11246) (not e!7009))))

(assert (=> b!11507 (= res!11246 (isPrefixOf!0 thiss!1486 (_2!741 lt!18271)))))

(declare-fun b!11508 () Bool)

(declare-fun lt!18304 () tuple2!1390)

(declare-fun Unit!980 () Unit!968)

(assert (=> b!11508 (= e!7008 (tuple2!1391 Unit!980 (_2!741 lt!18304)))))

(declare-fun appendBitFromByte!0 (BitStream!538 (_ BitVec 8) (_ BitVec 32)) tuple2!1390)

(assert (=> b!11508 (= lt!18270 (appendBitFromByte!0 thiss!1486 (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!18292 () (_ BitVec 64))

(assert (=> b!11508 (= lt!18292 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!18276 () (_ BitVec 64))

(assert (=> b!11508 (= lt!18276 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18289 () Unit!968)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!538 BitStream!538 (_ BitVec 64) (_ BitVec 64)) Unit!968)

(assert (=> b!11508 (= lt!18289 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!741 lt!18270) lt!18292 lt!18276))))

(assert (=> b!11508 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270))) (bvsub lt!18292 lt!18276))))

(declare-fun lt!18282 () Unit!968)

(assert (=> b!11508 (= lt!18282 lt!18289)))

(declare-fun lt!18272 () tuple2!1394)

(assert (=> b!11508 (= lt!18272 call!215)))

(declare-fun lt!18274 () (_ BitVec 64))

(assert (=> b!11508 (= lt!18274 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18307 () Unit!968)

(assert (=> b!11508 (= lt!18307 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!631 (_2!741 lt!18270)) lt!18274))))

(assert (=> b!11508 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) lt!18274)))

(declare-fun lt!18293 () Unit!968)

(assert (=> b!11508 (= lt!18293 lt!18307)))

(declare-fun head!63 (List!165) Bool)

(assert (=> b!11508 (= (head!63 (byteArrayBitContentToList!0 (_2!741 lt!18270) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!63 (bitStreamReadBitsIntoList!0 (_2!741 lt!18270) (_1!743 lt!18272) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18297 () Unit!968)

(declare-fun Unit!985 () Unit!968)

(assert (=> b!11508 (= lt!18297 Unit!985)))

(assert (=> b!11508 (= lt!18304 (appendBitsMSBFirstLoop!0 (_2!741 lt!18270) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!18311 () Unit!968)

(assert (=> b!11508 (= lt!18311 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!741 lt!18270) (_2!741 lt!18304)))))

(assert (=> b!11508 (isPrefixOf!0 thiss!1486 (_2!741 lt!18304))))

(declare-fun lt!18281 () Unit!968)

(assert (=> b!11508 (= lt!18281 lt!18311)))

(assert (=> b!11508 (= (size!286 (buf!631 (_2!741 lt!18304))) (size!286 (buf!631 thiss!1486)))))

(declare-fun lt!18279 () Unit!968)

(declare-fun Unit!986 () Unit!968)

(assert (=> b!11508 (= lt!18279 Unit!986)))

(assert (=> b!11508 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18304))) (currentByte!1703 (_2!741 lt!18304)) (currentBit!1698 (_2!741 lt!18304))) (bvsub (bvadd (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!18299 () Unit!968)

(declare-fun Unit!987 () Unit!968)

(assert (=> b!11508 (= lt!18299 Unit!987)))

(assert (=> b!11508 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18304))) (currentByte!1703 (_2!741 lt!18304)) (currentBit!1698 (_2!741 lt!18304))) (bvsub (bvsub (bvadd (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18270))) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!18284 () Unit!968)

(declare-fun Unit!988 () Unit!968)

(assert (=> b!11508 (= lt!18284 Unit!988)))

(declare-fun lt!18295 () tuple2!1394)

(assert (=> b!11508 (= lt!18295 (reader!0 thiss!1486 (_2!741 lt!18304)))))

(declare-fun lt!18269 () (_ BitVec 64))

(assert (=> b!11508 (= lt!18269 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!18273 () Unit!968)

(assert (=> b!11508 (= lt!18273 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!631 (_2!741 lt!18304)) lt!18269))))

(assert (=> b!11508 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18304)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) lt!18269)))

(declare-fun lt!18302 () Unit!968)

(assert (=> b!11508 (= lt!18302 lt!18273)))

(declare-fun lt!18305 () tuple2!1394)

(assert (=> b!11508 (= lt!18305 (reader!0 (_2!741 lt!18270) (_2!741 lt!18304)))))

(declare-fun lt!18283 () (_ BitVec 64))

(assert (=> b!11508 (= lt!18283 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!18309 () Unit!968)

(assert (=> b!11508 (= lt!18309 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!741 lt!18270) (buf!631 (_2!741 lt!18304)) lt!18283))))

(assert (=> b!11508 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18304)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270))) lt!18283)))

(declare-fun lt!18306 () Unit!968)

(assert (=> b!11508 (= lt!18306 lt!18309)))

(declare-fun lt!18275 () List!165)

(assert (=> b!11508 (= lt!18275 (byteArrayBitContentToList!0 (_2!741 lt!18304) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!18308 () List!165)

(assert (=> b!11508 (= lt!18308 (byteArrayBitContentToList!0 (_2!741 lt!18304) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18277 () List!165)

(assert (=> b!11508 (= lt!18277 (bitStreamReadBitsIntoList!0 (_2!741 lt!18304) (_1!743 lt!18295) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!18310 () List!165)

(assert (=> b!11508 (= lt!18310 (bitStreamReadBitsIntoList!0 (_2!741 lt!18304) (_1!743 lt!18305) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!18300 () (_ BitVec 64))

(assert (=> b!11508 (= lt!18300 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!18288 () Unit!968)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!538 BitStream!538 BitStream!538 BitStream!538 (_ BitVec 64) List!165) Unit!968)

(assert (=> b!11508 (= lt!18288 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!741 lt!18304) (_2!741 lt!18304) (_1!743 lt!18295) (_1!743 lt!18305) lt!18300 lt!18277))))

(declare-fun tail!71 (List!165) List!165)

(assert (=> b!11508 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!18304) (_1!743 lt!18305) (bvsub lt!18300 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!71 lt!18277))))

(declare-fun lt!18290 () Unit!968)

(assert (=> b!11508 (= lt!18290 lt!18288)))

(declare-fun lt!18286 () Unit!968)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!663 array!663 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!968)

(assert (=> b!11508 (= lt!18286 (arrayBitRangesEqImpliesEq!0 (buf!631 (_2!741 lt!18270)) (buf!631 (_2!741 lt!18304)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!18296 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18270))) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270)))))))

(declare-fun bitAt!0 (array!663 (_ BitVec 64)) Bool)

(assert (=> b!11508 (= (bitAt!0 (buf!631 (_2!741 lt!18270)) lt!18296) (bitAt!0 (buf!631 (_2!741 lt!18304)) lt!18296))))

(declare-fun lt!18287 () Unit!968)

(assert (=> b!11508 (= lt!18287 lt!18286)))

(declare-fun b!11509 () Bool)

(declare-fun res!11248 () Bool)

(assert (=> b!11509 (=> (not res!11248) (not e!7009))))

(assert (=> b!11509 (= res!11248 (= (size!286 (buf!631 thiss!1486)) (size!286 (buf!631 (_2!741 lt!18271)))))))

(assert (= (and d!3500 c!801) b!11508))

(assert (= (and d!3500 (not c!801)) b!11503))

(assert (= (or b!11508 b!11503) bm!212))

(assert (= (and d!3500 res!11250) b!11505))

(assert (= (and b!11505 res!11245) b!11509))

(assert (= (and b!11509 res!11248) b!11507))

(assert (= (and b!11507 res!11246) b!11504))

(assert (= (and b!11504 res!11249) b!11506))

(assert (= (and b!11506 res!11247) b!11502))

(declare-fun m!16855 () Bool)

(assert (=> d!3500 m!16855))

(assert (=> d!3500 m!16469))

(assert (=> d!3500 m!16601))

(assert (=> d!3500 m!16599))

(declare-fun m!16857 () Bool)

(assert (=> b!11508 m!16857))

(declare-fun m!16859 () Bool)

(assert (=> b!11508 m!16859))

(declare-fun m!16861 () Bool)

(assert (=> b!11508 m!16861))

(declare-fun m!16863 () Bool)

(assert (=> b!11508 m!16863))

(declare-fun m!16865 () Bool)

(assert (=> b!11508 m!16865))

(declare-fun m!16867 () Bool)

(assert (=> b!11508 m!16867))

(declare-fun m!16869 () Bool)

(assert (=> b!11508 m!16869))

(declare-fun m!16871 () Bool)

(assert (=> b!11508 m!16871))

(declare-fun m!16873 () Bool)

(assert (=> b!11508 m!16873))

(declare-fun m!16875 () Bool)

(assert (=> b!11508 m!16875))

(declare-fun m!16877 () Bool)

(assert (=> b!11508 m!16877))

(declare-fun m!16879 () Bool)

(assert (=> b!11508 m!16879))

(declare-fun m!16881 () Bool)

(assert (=> b!11508 m!16881))

(declare-fun m!16883 () Bool)

(assert (=> b!11508 m!16883))

(assert (=> b!11508 m!16857))

(declare-fun m!16885 () Bool)

(assert (=> b!11508 m!16885))

(declare-fun m!16887 () Bool)

(assert (=> b!11508 m!16887))

(declare-fun m!16889 () Bool)

(assert (=> b!11508 m!16889))

(declare-fun m!16891 () Bool)

(assert (=> b!11508 m!16891))

(declare-fun m!16893 () Bool)

(assert (=> b!11508 m!16893))

(assert (=> b!11508 m!16873))

(assert (=> b!11508 m!16469))

(declare-fun m!16895 () Bool)

(assert (=> b!11508 m!16895))

(assert (=> b!11508 m!16883))

(declare-fun m!16897 () Bool)

(assert (=> b!11508 m!16897))

(declare-fun m!16899 () Bool)

(assert (=> b!11508 m!16899))

(declare-fun m!16901 () Bool)

(assert (=> b!11508 m!16901))

(declare-fun m!16903 () Bool)

(assert (=> b!11508 m!16903))

(declare-fun m!16905 () Bool)

(assert (=> b!11508 m!16905))

(declare-fun m!16907 () Bool)

(assert (=> b!11508 m!16907))

(declare-fun m!16909 () Bool)

(assert (=> b!11508 m!16909))

(declare-fun m!16911 () Bool)

(assert (=> b!11508 m!16911))

(declare-fun m!16913 () Bool)

(assert (=> b!11508 m!16913))

(assert (=> b!11508 m!16549))

(assert (=> b!11508 m!16549))

(declare-fun m!16915 () Bool)

(assert (=> b!11508 m!16915))

(declare-fun m!16917 () Bool)

(assert (=> b!11502 m!16917))

(declare-fun m!16919 () Bool)

(assert (=> b!11505 m!16919))

(declare-fun m!16921 () Bool)

(assert (=> b!11506 m!16921))

(declare-fun m!16923 () Bool)

(assert (=> b!11506 m!16923))

(declare-fun m!16925 () Bool)

(assert (=> b!11506 m!16925))

(declare-fun m!16927 () Bool)

(assert (=> b!11506 m!16927))

(declare-fun m!16929 () Bool)

(assert (=> b!11506 m!16929))

(declare-fun m!16931 () Bool)

(assert (=> b!11503 m!16931))

(declare-fun m!16933 () Bool)

(assert (=> b!11503 m!16933))

(declare-fun m!16935 () Bool)

(assert (=> b!11507 m!16935))

(declare-fun m!16937 () Bool)

(assert (=> bm!212 m!16937))

(assert (=> b!11262 d!3500))

(declare-fun d!3518 () Bool)

(declare-fun e!7012 () Bool)

(assert (=> d!3518 e!7012))

(declare-fun res!11255 () Bool)

(assert (=> d!3518 (=> (not res!11255) (not e!7012))))

(declare-fun lt!18327 () (_ BitVec 64))

(declare-fun lt!18324 () (_ BitVec 64))

(declare-fun lt!18329 () (_ BitVec 64))

(assert (=> d!3518 (= res!11255 (= lt!18324 (bvsub lt!18327 lt!18329)))))

(assert (=> d!3518 (or (= (bvand lt!18327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18329 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18327 lt!18329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3518 (= lt!18329 (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!17680))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!17680)))))))

(declare-fun lt!18325 () (_ BitVec 64))

(declare-fun lt!18328 () (_ BitVec 64))

(assert (=> d!3518 (= lt!18327 (bvmul lt!18325 lt!18328))))

(assert (=> d!3518 (or (= lt!18325 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!18328 (bvsdiv (bvmul lt!18325 lt!18328) lt!18325)))))

(assert (=> d!3518 (= lt!18328 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3518 (= lt!18325 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))))))

(assert (=> d!3518 (= lt!18324 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!17680))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!17680)))))))

(assert (=> d!3518 (invariant!0 (currentBit!1698 (_2!741 lt!17680)) (currentByte!1703 (_2!741 lt!17680)) (size!286 (buf!631 (_2!741 lt!17680))))))

(assert (=> d!3518 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!17680))) (currentByte!1703 (_2!741 lt!17680)) (currentBit!1698 (_2!741 lt!17680))) lt!18324)))

(declare-fun b!11514 () Bool)

(declare-fun res!11256 () Bool)

(assert (=> b!11514 (=> (not res!11256) (not e!7012))))

(assert (=> b!11514 (= res!11256 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18324))))

(declare-fun b!11515 () Bool)

(declare-fun lt!18326 () (_ BitVec 64))

(assert (=> b!11515 (= e!7012 (bvsle lt!18324 (bvmul lt!18326 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11515 (or (= lt!18326 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!18326 #b0000000000000000000000000000000000000000000000000000000000001000) lt!18326)))))

(assert (=> b!11515 (= lt!18326 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))))))

(assert (= (and d!3518 res!11255) b!11514))

(assert (= (and b!11514 res!11256) b!11515))

(declare-fun m!16939 () Bool)

(assert (=> d!3518 m!16939))

(assert (=> d!3518 m!16435))

(assert (=> b!11267 d!3518))

(declare-fun d!3520 () Bool)

(declare-fun e!7013 () Bool)

(assert (=> d!3520 e!7013))

(declare-fun res!11257 () Bool)

(assert (=> d!3520 (=> (not res!11257) (not e!7013))))

(declare-fun lt!18333 () (_ BitVec 64))

(declare-fun lt!18335 () (_ BitVec 64))

(declare-fun lt!18330 () (_ BitVec 64))

(assert (=> d!3520 (= res!11257 (= lt!18330 (bvsub lt!18333 lt!18335)))))

(assert (=> d!3520 (or (= (bvand lt!18333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18335 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18333 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18333 lt!18335) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3520 (= lt!18335 (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 thiss!1486))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486))))))

(declare-fun lt!18331 () (_ BitVec 64))

(declare-fun lt!18334 () (_ BitVec 64))

(assert (=> d!3520 (= lt!18333 (bvmul lt!18331 lt!18334))))

(assert (=> d!3520 (or (= lt!18331 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!18334 (bvsdiv (bvmul lt!18331 lt!18334) lt!18331)))))

(assert (=> d!3520 (= lt!18334 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3520 (= lt!18331 ((_ sign_extend 32) (size!286 (buf!631 thiss!1486))))))

(assert (=> d!3520 (= lt!18330 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1703 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1698 thiss!1486))))))

(assert (=> d!3520 (invariant!0 (currentBit!1698 thiss!1486) (currentByte!1703 thiss!1486) (size!286 (buf!631 thiss!1486)))))

(assert (=> d!3520 (= (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)) lt!18330)))

(declare-fun b!11516 () Bool)

(declare-fun res!11258 () Bool)

(assert (=> b!11516 (=> (not res!11258) (not e!7013))))

(assert (=> b!11516 (= res!11258 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18330))))

(declare-fun b!11517 () Bool)

(declare-fun lt!18332 () (_ BitVec 64))

(assert (=> b!11517 (= e!7013 (bvsle lt!18330 (bvmul lt!18332 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11517 (or (= lt!18332 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!18332 #b0000000000000000000000000000000000000000000000000000000000001000) lt!18332)))))

(assert (=> b!11517 (= lt!18332 ((_ sign_extend 32) (size!286 (buf!631 thiss!1486))))))

(assert (= (and d!3520 res!11257) b!11516))

(assert (= (and b!11516 res!11258) b!11517))

(assert (=> d!3520 m!16547))

(declare-fun m!16941 () Bool)

(assert (=> d!3520 m!16941))

(assert (=> b!11267 d!3520))

(declare-fun d!3522 () Bool)

(assert (=> d!3522 (= (array_inv!278 (buf!631 thiss!1486)) (bvsge (size!286 (buf!631 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!11268 d!3522))

(declare-fun d!3524 () Bool)

(assert (=> d!3524 (= (array_inv!278 srcBuffer!6) (bvsge (size!286 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2372 d!3524))

(declare-fun d!3526 () Bool)

(assert (=> d!3526 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1698 thiss!1486) (currentByte!1703 thiss!1486) (size!286 (buf!631 thiss!1486))))))

(declare-fun bs!1034 () Bool)

(assert (= bs!1034 d!3526))

(assert (=> bs!1034 m!16941))

(assert (=> start!2372 d!3526))

(declare-fun d!3528 () Bool)

(declare-fun res!11293 () Bool)

(declare-fun e!7024 () Bool)

(assert (=> d!3528 (=> res!11293 e!7024)))

(assert (=> d!3528 (= res!11293 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3528 (= (checkByteArrayBitContent!0 (_2!741 lt!17680) srcBuffer!6 (_1!742 lt!17679) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7024)))

(declare-fun b!11552 () Bool)

(declare-fun e!7025 () Bool)

(assert (=> b!11552 (= e!7024 e!7025)))

(declare-fun res!11294 () Bool)

(assert (=> b!11552 (=> (not res!11294) (not e!7025))))

(assert (=> b!11552 (= res!11294 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!706 (_1!742 lt!17679)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!11553 () Bool)

(assert (=> b!11553 (= e!7025 (checkByteArrayBitContent!0 (_2!741 lt!17680) srcBuffer!6 (_1!742 lt!17679) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3528 (not res!11293)) b!11552))

(assert (= (and b!11552 res!11294) b!11553))

(assert (=> b!11552 m!16549))

(assert (=> b!11552 m!16551))

(assert (=> b!11552 m!16573))

(assert (=> b!11552 m!16575))

(declare-fun m!16969 () Bool)

(assert (=> b!11553 m!16969))

(assert (=> b!11263 d!3528))

(declare-fun d!3536 () Bool)

(assert (=> d!3536 (checkByteArrayBitContent!0 (_2!741 lt!17680) srcBuffer!6 (_1!742 lt!17679) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!18395 () Unit!968)

(declare-fun choose!65 (BitStream!538 array!663 array!663 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!968)

(assert (=> d!3536 (= lt!18395 (choose!65 (_2!741 lt!17680) srcBuffer!6 (_1!742 lt!17679) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3536 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3536 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!741 lt!17680) srcBuffer!6 (_1!742 lt!17679) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!18395)))

(declare-fun bs!1037 () Bool)

(assert (= bs!1037 d!3536))

(assert (=> bs!1037 m!16461))

(declare-fun m!16977 () Bool)

(assert (=> bs!1037 m!16977))

(assert (=> b!11263 d!3536))

(push 1)

(assert (not b!11508))

(assert (not b!11341))

(assert (not b!11334))

(assert (not d!3478))

(assert (not d!3520))

(assert (not b!11357))

(assert (not d!3468))

(assert (not d!3470))

(assert (not d!3484))

(assert (not d!3536))

(assert (not d!3500))

(assert (not b!11401))

(assert (not b!11369))

(assert (not b!11503))

(assert (not bm!212))

(assert (not d!3518))

(assert (not b!11505))

(assert (not b!11553))

(assert (not b!11370))

(assert (not b!11353))

(assert (not d!3482))

(assert (not b!11507))

(assert (not b!11404))

(assert (not d!3460))

(assert (not b!11502))

(assert (not b!11368))

(assert (not b!11355))

(assert (not b!11371))

(assert (not b!11506))

(assert (not d!3526))

(assert (not b!11343))

(assert (not b!11403))

(assert (not b!11354))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!11371 d!3520))

(declare-fun d!3730 () Bool)

(assert (=> d!3730 (arrayBitRangesEq!0 (buf!631 (_2!741 lt!17680)) (buf!631 thiss!1486) lt!17783 lt!17788)))

(declare-fun lt!18893 () Unit!968)

(declare-fun choose!8 (array!663 array!663 (_ BitVec 64) (_ BitVec 64)) Unit!968)

(assert (=> d!3730 (= lt!18893 (choose!8 (buf!631 thiss!1486) (buf!631 (_2!741 lt!17680)) lt!17783 lt!17788))))

(assert (=> d!3730 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!17783) (bvsle lt!17783 lt!17788))))

(assert (=> d!3730 (= (arrayBitRangesEqSymmetric!0 (buf!631 thiss!1486) (buf!631 (_2!741 lt!17680)) lt!17783 lt!17788) lt!18893)))

(declare-fun bs!1067 () Bool)

(assert (= bs!1067 d!3730))

(assert (=> bs!1067 m!16605))

(declare-fun m!17541 () Bool)

(assert (=> bs!1067 m!17541))

(assert (=> b!11371 d!3730))

(declare-fun b!11842 () Bool)

(declare-fun e!7205 () Bool)

(declare-fun call!229 () Bool)

(assert (=> b!11842 (= e!7205 call!229)))

(declare-fun d!3732 () Bool)

(declare-fun res!11486 () Bool)

(declare-fun e!7204 () Bool)

(assert (=> d!3732 (=> res!11486 e!7204)))

(assert (=> d!3732 (= res!11486 (bvsge lt!17783 lt!17788))))

(assert (=> d!3732 (= (arrayBitRangesEq!0 (buf!631 (_2!741 lt!17680)) (buf!631 thiss!1486) lt!17783 lt!17788) e!7204)))

(declare-fun b!11843 () Bool)

(declare-fun res!11488 () Bool)

(declare-fun lt!18900 () (_ BitVec 32))

(assert (=> b!11843 (= res!11488 (= lt!18900 #b00000000000000000000000000000000))))

(declare-fun e!7201 () Bool)

(assert (=> b!11843 (=> res!11488 e!7201)))

(declare-fun e!7203 () Bool)

(assert (=> b!11843 (= e!7203 e!7201)))

(declare-fun b!11844 () Bool)

(assert (=> b!11844 (= e!7201 call!229)))

(declare-fun b!11845 () Bool)

(declare-fun e!7202 () Bool)

(assert (=> b!11845 (= e!7202 e!7205)))

(declare-fun c!851 () Bool)

(declare-datatypes ((tuple4!8 0))(
  ( (tuple4!9 (_1!761 (_ BitVec 32)) (_2!761 (_ BitVec 32)) (_3!50 (_ BitVec 32)) (_4!4 (_ BitVec 32))) )
))
(declare-fun lt!18901 () tuple4!8)

(assert (=> b!11845 (= c!851 (= (_3!50 lt!18901) (_4!4 lt!18901)))))

(declare-fun b!11846 () Bool)

(assert (=> b!11846 (= e!7205 e!7203)))

(declare-fun lt!18902 () (_ BitVec 32))

(declare-fun res!11484 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11846 (= res!11484 (byteRangesEq!0 (select (arr!706 (buf!631 (_2!741 lt!17680))) (_3!50 lt!18901)) (select (arr!706 (buf!631 thiss!1486)) (_3!50 lt!18901)) lt!18902 #b00000000000000000000000000001000))))

(assert (=> b!11846 (=> (not res!11484) (not e!7203))))

(declare-fun b!11847 () Bool)

(assert (=> b!11847 (= e!7204 e!7202)))

(declare-fun res!11487 () Bool)

(assert (=> b!11847 (=> (not res!11487) (not e!7202))))

(declare-fun e!7206 () Bool)

(assert (=> b!11847 (= res!11487 e!7206)))

(declare-fun res!11485 () Bool)

(assert (=> b!11847 (=> res!11485 e!7206)))

(assert (=> b!11847 (= res!11485 (bvsge (_1!761 lt!18901) (_2!761 lt!18901)))))

(assert (=> b!11847 (= lt!18900 ((_ extract 31 0) (bvsrem lt!17788 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11847 (= lt!18902 ((_ extract 31 0) (bvsrem lt!17783 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!8)

(assert (=> b!11847 (= lt!18901 (arrayBitIndices!0 lt!17783 lt!17788))))

(declare-fun bm!226 () Bool)

(assert (=> bm!226 (= call!229 (byteRangesEq!0 (ite c!851 (select (arr!706 (buf!631 (_2!741 lt!17680))) (_3!50 lt!18901)) (select (arr!706 (buf!631 (_2!741 lt!17680))) (_4!4 lt!18901))) (ite c!851 (select (arr!706 (buf!631 thiss!1486)) (_3!50 lt!18901)) (select (arr!706 (buf!631 thiss!1486)) (_4!4 lt!18901))) (ite c!851 lt!18902 #b00000000000000000000000000000000) lt!18900))))

(declare-fun b!11848 () Bool)

(declare-fun arrayRangesEq!5 (array!663 array!663 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11848 (= e!7206 (arrayRangesEq!5 (buf!631 (_2!741 lt!17680)) (buf!631 thiss!1486) (_1!761 lt!18901) (_2!761 lt!18901)))))

(assert (= (and d!3732 (not res!11486)) b!11847))

(assert (= (and b!11847 (not res!11485)) b!11848))

(assert (= (and b!11847 res!11487) b!11845))

(assert (= (and b!11845 c!851) b!11842))

(assert (= (and b!11845 (not c!851)) b!11846))

(assert (= (and b!11846 res!11484) b!11843))

(assert (= (and b!11843 (not res!11488)) b!11844))

(assert (= (or b!11842 b!11844) bm!226))

(declare-fun m!17543 () Bool)

(assert (=> b!11846 m!17543))

(declare-fun m!17545 () Bool)

(assert (=> b!11846 m!17545))

(assert (=> b!11846 m!17543))

(assert (=> b!11846 m!17545))

(declare-fun m!17547 () Bool)

(assert (=> b!11846 m!17547))

(declare-fun m!17549 () Bool)

(assert (=> b!11847 m!17549))

(declare-fun m!17551 () Bool)

(assert (=> bm!226 m!17551))

(declare-fun m!17553 () Bool)

(assert (=> bm!226 m!17553))

(assert (=> bm!226 m!17545))

(declare-fun m!17555 () Bool)

(assert (=> bm!226 m!17555))

(assert (=> bm!226 m!17543))

(declare-fun m!17557 () Bool)

(assert (=> b!11848 m!17557))

(assert (=> b!11371 d!3732))

(declare-fun d!3734 () Bool)

(declare-fun res!11491 () Bool)

(declare-fun e!7207 () Bool)

(assert (=> d!3734 (=> (not res!11491) (not e!7207))))

(assert (=> d!3734 (= res!11491 (= (size!286 (buf!631 (_2!743 lt!17785))) (size!286 (buf!631 (_2!741 lt!17680)))))))

(assert (=> d!3734 (= (isPrefixOf!0 (_2!743 lt!17785) (_2!741 lt!17680)) e!7207)))

(declare-fun b!11849 () Bool)

(declare-fun res!11490 () Bool)

(assert (=> b!11849 (=> (not res!11490) (not e!7207))))

(assert (=> b!11849 (= res!11490 (bvsle (bitIndex!0 (size!286 (buf!631 (_2!743 lt!17785))) (currentByte!1703 (_2!743 lt!17785)) (currentBit!1698 (_2!743 lt!17785))) (bitIndex!0 (size!286 (buf!631 (_2!741 lt!17680))) (currentByte!1703 (_2!741 lt!17680)) (currentBit!1698 (_2!741 lt!17680)))))))

(declare-fun b!11850 () Bool)

(declare-fun e!7208 () Bool)

(assert (=> b!11850 (= e!7207 e!7208)))

(declare-fun res!11489 () Bool)

(assert (=> b!11850 (=> res!11489 e!7208)))

(assert (=> b!11850 (= res!11489 (= (size!286 (buf!631 (_2!743 lt!17785))) #b00000000000000000000000000000000))))

(declare-fun b!11851 () Bool)

(assert (=> b!11851 (= e!7208 (arrayBitRangesEq!0 (buf!631 (_2!743 lt!17785)) (buf!631 (_2!741 lt!17680)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 (_2!743 lt!17785))) (currentByte!1703 (_2!743 lt!17785)) (currentBit!1698 (_2!743 lt!17785)))))))

(assert (= (and d!3734 res!11491) b!11849))

(assert (= (and b!11849 res!11490) b!11850))

(assert (= (and b!11850 (not res!11489)) b!11851))

(declare-fun m!17559 () Bool)

(assert (=> b!11849 m!17559))

(assert (=> b!11849 m!16467))

(assert (=> b!11851 m!17559))

(assert (=> b!11851 m!17559))

(declare-fun m!17561 () Bool)

(assert (=> b!11851 m!17561))

(assert (=> b!11368 d!3734))

(declare-fun d!3736 () Bool)

(declare-fun size!290 (List!165) Int)

(assert (=> d!3736 (= (length!32 lt!17728) (size!290 lt!17728))))

(declare-fun bs!1068 () Bool)

(assert (= bs!1068 d!3736))

(declare-fun m!17563 () Bool)

(assert (=> bs!1068 m!17563))

(assert (=> b!11355 d!3736))

(declare-fun d!3738 () Bool)

(assert (=> d!3738 (= (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!17680))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!17680)))) (bvsub (bvmul ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!17680))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!17680))))))))

(assert (=> d!3518 d!3738))

(assert (=> d!3518 d!3498))

(declare-fun d!3740 () Bool)

(assert (=> d!3740 (= (invariant!0 (currentBit!1698 thiss!1486) (currentByte!1703 thiss!1486) (size!286 (buf!631 thiss!1486))) (and (bvsge (currentBit!1698 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1698 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1703 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1703 thiss!1486) (size!286 (buf!631 thiss!1486))) (and (= (currentBit!1698 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1703 thiss!1486) (size!286 (buf!631 thiss!1486)))))))))

(assert (=> d!3526 d!3740))

(declare-fun d!3742 () Bool)

(declare-fun e!7211 () Bool)

(assert (=> d!3742 e!7211))

(declare-fun res!11494 () Bool)

(assert (=> d!3742 (=> (not res!11494) (not e!7211))))

(declare-fun lt!18908 () (_ BitVec 64))

(declare-fun lt!18907 () BitStream!538)

(assert (=> d!3742 (= res!11494 (= (bvadd lt!18908 (bvsub lt!17792 lt!17777)) (bitIndex!0 (size!286 (buf!631 lt!18907)) (currentByte!1703 lt!18907) (currentBit!1698 lt!18907))))))

(assert (=> d!3742 (or (not (= (bvand lt!18908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17792 lt!17777) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!18908 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!18908 (bvsub lt!17792 lt!17777)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3742 (= lt!18908 (bitIndex!0 (size!286 (buf!631 (_2!743 lt!17785))) (currentByte!1703 (_2!743 lt!17785)) (currentBit!1698 (_2!743 lt!17785))))))

(declare-fun moveBitIndex!0 (BitStream!538 (_ BitVec 64)) tuple2!1390)

(assert (=> d!3742 (= lt!18907 (_2!741 (moveBitIndex!0 (_2!743 lt!17785) (bvsub lt!17792 lt!17777))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!538 (_ BitVec 64)) Bool)

(assert (=> d!3742 (moveBitIndexPrecond!0 (_2!743 lt!17785) (bvsub lt!17792 lt!17777))))

(assert (=> d!3742 (= (withMovedBitIndex!0 (_2!743 lt!17785) (bvsub lt!17792 lt!17777)) lt!18907)))

(declare-fun b!11854 () Bool)

(assert (=> b!11854 (= e!7211 (= (size!286 (buf!631 (_2!743 lt!17785))) (size!286 (buf!631 lt!18907))))))

(assert (= (and d!3742 res!11494) b!11854))

(declare-fun m!17565 () Bool)

(assert (=> d!3742 m!17565))

(assert (=> d!3742 m!17559))

(declare-fun m!17567 () Bool)

(assert (=> d!3742 m!17567))

(declare-fun m!17569 () Bool)

(assert (=> d!3742 m!17569))

(assert (=> b!11369 d!3742))

(assert (=> b!11369 d!3518))

(assert (=> b!11369 d!3520))

(declare-fun d!3744 () Bool)

(declare-fun res!11497 () Bool)

(declare-fun e!7212 () Bool)

(assert (=> d!3744 (=> (not res!11497) (not e!7212))))

(assert (=> d!3744 (= res!11497 (= (size!286 (buf!631 (_1!743 lt!17785))) (size!286 (buf!631 thiss!1486))))))

(assert (=> d!3744 (= (isPrefixOf!0 (_1!743 lt!17785) thiss!1486) e!7212)))

(declare-fun b!11855 () Bool)

(declare-fun res!11496 () Bool)

(assert (=> b!11855 (=> (not res!11496) (not e!7212))))

(assert (=> b!11855 (= res!11496 (bvsle (bitIndex!0 (size!286 (buf!631 (_1!743 lt!17785))) (currentByte!1703 (_1!743 lt!17785)) (currentBit!1698 (_1!743 lt!17785))) (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(declare-fun b!11856 () Bool)

(declare-fun e!7213 () Bool)

(assert (=> b!11856 (= e!7212 e!7213)))

(declare-fun res!11495 () Bool)

(assert (=> b!11856 (=> res!11495 e!7213)))

(assert (=> b!11856 (= res!11495 (= (size!286 (buf!631 (_1!743 lt!17785))) #b00000000000000000000000000000000))))

(declare-fun b!11857 () Bool)

(assert (=> b!11857 (= e!7213 (arrayBitRangesEq!0 (buf!631 (_1!743 lt!17785)) (buf!631 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 (_1!743 lt!17785))) (currentByte!1703 (_1!743 lt!17785)) (currentBit!1698 (_1!743 lt!17785)))))))

(assert (= (and d!3744 res!11497) b!11855))

(assert (= (and b!11855 res!11496) b!11856))

(assert (= (and b!11856 (not res!11495)) b!11857))

(declare-fun m!17571 () Bool)

(assert (=> b!11855 m!17571))

(assert (=> b!11855 m!16469))

(assert (=> b!11857 m!17571))

(assert (=> b!11857 m!17571))

(declare-fun m!17573 () Bool)

(assert (=> b!11857 m!17573))

(assert (=> b!11370 d!3744))

(declare-fun d!3746 () Bool)

(assert (=> d!3746 (= (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1703 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1698 thiss!1486)))))))

(assert (=> d!3470 d!3746))

(declare-fun d!3748 () Bool)

(declare-fun res!11498 () Bool)

(declare-fun e!7214 () Bool)

(assert (=> d!3748 (=> res!11498 e!7214)))

(assert (=> d!3748 (= res!11498 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3748 (= (checkByteArrayBitContent!0 (_2!741 lt!17680) srcBuffer!6 (_1!742 lt!17679) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!7214)))

(declare-fun b!11858 () Bool)

(declare-fun e!7215 () Bool)

(assert (=> b!11858 (= e!7214 e!7215)))

(declare-fun res!11499 () Bool)

(assert (=> b!11858 (=> (not res!11499) (not e!7215))))

(assert (=> b!11858 (= res!11499 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!706 (_1!742 lt!17679)) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!11859 () Bool)

(assert (=> b!11859 (= e!7215 (checkByteArrayBitContent!0 (_2!741 lt!17680) srcBuffer!6 (_1!742 lt!17679) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3748 (not res!11498)) b!11858))

(assert (= (and b!11858 res!11499) b!11859))

(declare-fun m!17575 () Bool)

(assert (=> b!11858 m!17575))

(declare-fun m!17577 () Bool)

(assert (=> b!11858 m!17577))

(declare-fun m!17579 () Bool)

(assert (=> b!11858 m!17579))

(declare-fun m!17581 () Bool)

(assert (=> b!11858 m!17581))

(declare-fun m!17583 () Bool)

(assert (=> b!11859 m!17583))

(assert (=> b!11553 d!3748))

(assert (=> d!3478 d!3470))

(declare-fun d!3750 () Bool)

(assert (=> d!3750 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!17680)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) nBits!460)))

(assert (=> d!3750 true))

(declare-fun _$6!171 () Unit!968)

(assert (=> d!3750 (= (choose!9 thiss!1486 (buf!631 (_2!741 lt!17680)) nBits!460 (BitStream!539 (buf!631 (_2!741 lt!17680)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))) _$6!171)))

(declare-fun bs!1069 () Bool)

(assert (= bs!1069 d!3750))

(assert (=> bs!1069 m!16447))

(assert (=> d!3478 d!3750))

(declare-fun d!3752 () Bool)

(declare-fun c!852 () Bool)

(assert (=> d!3752 (= c!852 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7216 () List!165)

(assert (=> d!3752 (= (byteArrayBitContentToList!0 (_2!741 lt!17680) (_1!742 lt!17679) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!7216)))

(declare-fun b!11860 () Bool)

(assert (=> b!11860 (= e!7216 Nil!162)))

(declare-fun b!11861 () Bool)

(assert (=> b!11861 (= e!7216 (Cons!161 (not (= (bvand ((_ sign_extend 24) (select (arr!706 (_1!742 lt!17679)) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!741 lt!17680) (_1!742 lt!17679) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3752 c!852) b!11860))

(assert (= (and d!3752 (not c!852)) b!11861))

(assert (=> b!11861 m!17579))

(assert (=> b!11861 m!17581))

(declare-fun m!17585 () Bool)

(assert (=> b!11861 m!17585))

(assert (=> b!11357 d!3752))

(assert (=> d!3536 d!3528))

(declare-fun d!3754 () Bool)

(assert (=> d!3754 (checkByteArrayBitContent!0 (_2!741 lt!17680) srcBuffer!6 (_1!742 lt!17679) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(assert (=> d!3754 true))

(declare-fun _$35!11 () Unit!968)

(assert (=> d!3754 (= (choose!65 (_2!741 lt!17680) srcBuffer!6 (_1!742 lt!17679) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) _$35!11)))

(declare-fun bs!1070 () Bool)

(assert (= bs!1070 d!3754))

(assert (=> bs!1070 m!16461))

(assert (=> d!3536 d!3754))

(declare-fun d!3756 () Bool)

(declare-fun res!11502 () Bool)

(declare-fun e!7217 () Bool)

(assert (=> d!3756 (=> (not res!11502) (not e!7217))))

(assert (=> d!3756 (= res!11502 (= (size!286 (buf!631 thiss!1486)) (size!286 (buf!631 thiss!1486))))))

(assert (=> d!3756 (= (isPrefixOf!0 thiss!1486 thiss!1486) e!7217)))

(declare-fun b!11862 () Bool)

(declare-fun res!11501 () Bool)

(assert (=> b!11862 (=> (not res!11501) (not e!7217))))

(assert (=> b!11862 (= res!11501 (bvsle (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)) (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(declare-fun b!11863 () Bool)

(declare-fun e!7218 () Bool)

(assert (=> b!11863 (= e!7217 e!7218)))

(declare-fun res!11500 () Bool)

(assert (=> b!11863 (=> res!11500 e!7218)))

(assert (=> b!11863 (= res!11500 (= (size!286 (buf!631 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!11864 () Bool)

(assert (=> b!11864 (= e!7218 (arrayBitRangesEq!0 (buf!631 thiss!1486) (buf!631 thiss!1486) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(assert (= (and d!3756 res!11502) b!11862))

(assert (= (and b!11862 res!11501) b!11863))

(assert (= (and b!11863 (not res!11500)) b!11864))

(assert (=> b!11862 m!16469))

(assert (=> b!11862 m!16469))

(assert (=> b!11864 m!16469))

(assert (=> b!11864 m!16469))

(declare-fun m!17587 () Bool)

(assert (=> b!11864 m!17587))

(assert (=> d!3482 d!3756))

(declare-fun d!3758 () Bool)

(assert (=> d!3758 (isPrefixOf!0 lt!17790 lt!17790)))

(declare-fun lt!18911 () Unit!968)

(declare-fun choose!11 (BitStream!538) Unit!968)

(assert (=> d!3758 (= lt!18911 (choose!11 lt!17790))))

(assert (=> d!3758 (= (lemmaIsPrefixRefl!0 lt!17790) lt!18911)))

(declare-fun bs!1072 () Bool)

(assert (= bs!1072 d!3758))

(assert (=> bs!1072 m!16597))

(declare-fun m!17589 () Bool)

(assert (=> bs!1072 m!17589))

(assert (=> d!3482 d!3758))

(declare-fun d!3760 () Bool)

(assert (=> d!3760 (isPrefixOf!0 lt!17790 (_2!741 lt!17680))))

(declare-fun lt!18914 () Unit!968)

(declare-fun choose!30 (BitStream!538 BitStream!538 BitStream!538) Unit!968)

(assert (=> d!3760 (= lt!18914 (choose!30 lt!17790 thiss!1486 (_2!741 lt!17680)))))

(assert (=> d!3760 (isPrefixOf!0 lt!17790 thiss!1486)))

(assert (=> d!3760 (= (lemmaIsPrefixTransitive!0 lt!17790 thiss!1486 (_2!741 lt!17680)) lt!18914)))

(declare-fun bs!1073 () Bool)

(assert (= bs!1073 d!3760))

(assert (=> bs!1073 m!16583))

(declare-fun m!17591 () Bool)

(assert (=> bs!1073 m!17591))

(declare-fun m!17593 () Bool)

(assert (=> bs!1073 m!17593))

(assert (=> d!3482 d!3760))

(declare-fun d!3762 () Bool)

(assert (=> d!3762 (isPrefixOf!0 lt!17790 (_2!741 lt!17680))))

(declare-fun lt!18915 () Unit!968)

(assert (=> d!3762 (= lt!18915 (choose!30 lt!17790 (_2!741 lt!17680) (_2!741 lt!17680)))))

(assert (=> d!3762 (isPrefixOf!0 lt!17790 (_2!741 lt!17680))))

(assert (=> d!3762 (= (lemmaIsPrefixTransitive!0 lt!17790 (_2!741 lt!17680) (_2!741 lt!17680)) lt!18915)))

(declare-fun bs!1074 () Bool)

(assert (= bs!1074 d!3762))

(assert (=> bs!1074 m!16583))

(declare-fun m!17595 () Bool)

(assert (=> bs!1074 m!17595))

(assert (=> bs!1074 m!16583))

(assert (=> d!3482 d!3762))

(declare-fun d!3764 () Bool)

(declare-fun res!11505 () Bool)

(declare-fun e!7219 () Bool)

(assert (=> d!3764 (=> (not res!11505) (not e!7219))))

(assert (=> d!3764 (= res!11505 (= (size!286 (buf!631 (_2!741 lt!17680))) (size!286 (buf!631 (_2!741 lt!17680)))))))

(assert (=> d!3764 (= (isPrefixOf!0 (_2!741 lt!17680) (_2!741 lt!17680)) e!7219)))

(declare-fun b!11865 () Bool)

(declare-fun res!11504 () Bool)

(assert (=> b!11865 (=> (not res!11504) (not e!7219))))

(assert (=> b!11865 (= res!11504 (bvsle (bitIndex!0 (size!286 (buf!631 (_2!741 lt!17680))) (currentByte!1703 (_2!741 lt!17680)) (currentBit!1698 (_2!741 lt!17680))) (bitIndex!0 (size!286 (buf!631 (_2!741 lt!17680))) (currentByte!1703 (_2!741 lt!17680)) (currentBit!1698 (_2!741 lt!17680)))))))

(declare-fun b!11866 () Bool)

(declare-fun e!7220 () Bool)

(assert (=> b!11866 (= e!7219 e!7220)))

(declare-fun res!11503 () Bool)

(assert (=> b!11866 (=> res!11503 e!7220)))

(assert (=> b!11866 (= res!11503 (= (size!286 (buf!631 (_2!741 lt!17680))) #b00000000000000000000000000000000))))

(declare-fun b!11867 () Bool)

(assert (=> b!11867 (= e!7220 (arrayBitRangesEq!0 (buf!631 (_2!741 lt!17680)) (buf!631 (_2!741 lt!17680)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!17680))) (currentByte!1703 (_2!741 lt!17680)) (currentBit!1698 (_2!741 lt!17680)))))))

(assert (= (and d!3764 res!11505) b!11865))

(assert (= (and b!11865 res!11504) b!11866))

(assert (= (and b!11866 (not res!11503)) b!11867))

(assert (=> b!11865 m!16467))

(assert (=> b!11865 m!16467))

(assert (=> b!11867 m!16467))

(assert (=> b!11867 m!16467))

(declare-fun m!17597 () Bool)

(assert (=> b!11867 m!17597))

(assert (=> d!3482 d!3764))

(declare-fun d!3766 () Bool)

(declare-fun res!11508 () Bool)

(declare-fun e!7221 () Bool)

(assert (=> d!3766 (=> (not res!11508) (not e!7221))))

(assert (=> d!3766 (= res!11508 (= (size!286 (buf!631 lt!17790)) (size!286 (buf!631 (_2!741 lt!17680)))))))

(assert (=> d!3766 (= (isPrefixOf!0 lt!17790 (_2!741 lt!17680)) e!7221)))

(declare-fun b!11868 () Bool)

(declare-fun res!11507 () Bool)

(assert (=> b!11868 (=> (not res!11507) (not e!7221))))

(assert (=> b!11868 (= res!11507 (bvsle (bitIndex!0 (size!286 (buf!631 lt!17790)) (currentByte!1703 lt!17790) (currentBit!1698 lt!17790)) (bitIndex!0 (size!286 (buf!631 (_2!741 lt!17680))) (currentByte!1703 (_2!741 lt!17680)) (currentBit!1698 (_2!741 lt!17680)))))))

(declare-fun b!11869 () Bool)

(declare-fun e!7222 () Bool)

(assert (=> b!11869 (= e!7221 e!7222)))

(declare-fun res!11506 () Bool)

(assert (=> b!11869 (=> res!11506 e!7222)))

(assert (=> b!11869 (= res!11506 (= (size!286 (buf!631 lt!17790)) #b00000000000000000000000000000000))))

(declare-fun b!11870 () Bool)

(assert (=> b!11870 (= e!7222 (arrayBitRangesEq!0 (buf!631 lt!17790) (buf!631 (_2!741 lt!17680)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 lt!17790)) (currentByte!1703 lt!17790) (currentBit!1698 lt!17790))))))

(assert (= (and d!3766 res!11508) b!11868))

(assert (= (and b!11868 res!11507) b!11869))

(assert (= (and b!11869 (not res!11506)) b!11870))

(declare-fun m!17599 () Bool)

(assert (=> b!11868 m!17599))

(assert (=> b!11868 m!16467))

(assert (=> b!11870 m!17599))

(assert (=> b!11870 m!17599))

(declare-fun m!17601 () Bool)

(assert (=> b!11870 m!17601))

(assert (=> d!3482 d!3766))

(declare-fun d!3768 () Bool)

(assert (=> d!3768 (isPrefixOf!0 (_2!741 lt!17680) (_2!741 lt!17680))))

(declare-fun lt!18916 () Unit!968)

(assert (=> d!3768 (= lt!18916 (choose!11 (_2!741 lt!17680)))))

(assert (=> d!3768 (= (lemmaIsPrefixRefl!0 (_2!741 lt!17680)) lt!18916)))

(declare-fun bs!1075 () Bool)

(assert (= bs!1075 d!3768))

(assert (=> bs!1075 m!16585))

(declare-fun m!17603 () Bool)

(assert (=> bs!1075 m!17603))

(assert (=> d!3482 d!3768))

(declare-fun d!3770 () Bool)

(declare-fun res!11511 () Bool)

(declare-fun e!7223 () Bool)

(assert (=> d!3770 (=> (not res!11511) (not e!7223))))

(assert (=> d!3770 (= res!11511 (= (size!286 (buf!631 lt!17790)) (size!286 (buf!631 lt!17790))))))

(assert (=> d!3770 (= (isPrefixOf!0 lt!17790 lt!17790) e!7223)))

(declare-fun b!11871 () Bool)

(declare-fun res!11510 () Bool)

(assert (=> b!11871 (=> (not res!11510) (not e!7223))))

(assert (=> b!11871 (= res!11510 (bvsle (bitIndex!0 (size!286 (buf!631 lt!17790)) (currentByte!1703 lt!17790) (currentBit!1698 lt!17790)) (bitIndex!0 (size!286 (buf!631 lt!17790)) (currentByte!1703 lt!17790) (currentBit!1698 lt!17790))))))

(declare-fun b!11872 () Bool)

(declare-fun e!7224 () Bool)

(assert (=> b!11872 (= e!7223 e!7224)))

(declare-fun res!11509 () Bool)

(assert (=> b!11872 (=> res!11509 e!7224)))

(assert (=> b!11872 (= res!11509 (= (size!286 (buf!631 lt!17790)) #b00000000000000000000000000000000))))

(declare-fun b!11873 () Bool)

(assert (=> b!11873 (= e!7224 (arrayBitRangesEq!0 (buf!631 lt!17790) (buf!631 lt!17790) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 lt!17790)) (currentByte!1703 lt!17790) (currentBit!1698 lt!17790))))))

(assert (= (and d!3770 res!11511) b!11871))

(assert (= (and b!11871 res!11510) b!11872))

(assert (= (and b!11872 (not res!11509)) b!11873))

(assert (=> b!11871 m!17599))

(assert (=> b!11871 m!17599))

(assert (=> b!11873 m!17599))

(assert (=> b!11873 m!17599))

(declare-fun m!17605 () Bool)

(assert (=> b!11873 m!17605))

(assert (=> d!3482 d!3770))

(declare-fun d!3772 () Bool)

(declare-fun res!11514 () Bool)

(declare-fun e!7225 () Bool)

(assert (=> d!3772 (=> (not res!11514) (not e!7225))))

(assert (=> d!3772 (= res!11514 (= (size!286 (buf!631 (_1!743 lt!17785))) (size!286 (buf!631 (_2!743 lt!17785)))))))

(assert (=> d!3772 (= (isPrefixOf!0 (_1!743 lt!17785) (_2!743 lt!17785)) e!7225)))

(declare-fun b!11874 () Bool)

(declare-fun res!11513 () Bool)

(assert (=> b!11874 (=> (not res!11513) (not e!7225))))

(assert (=> b!11874 (= res!11513 (bvsle (bitIndex!0 (size!286 (buf!631 (_1!743 lt!17785))) (currentByte!1703 (_1!743 lt!17785)) (currentBit!1698 (_1!743 lt!17785))) (bitIndex!0 (size!286 (buf!631 (_2!743 lt!17785))) (currentByte!1703 (_2!743 lt!17785)) (currentBit!1698 (_2!743 lt!17785)))))))

(declare-fun b!11875 () Bool)

(declare-fun e!7226 () Bool)

(assert (=> b!11875 (= e!7225 e!7226)))

(declare-fun res!11512 () Bool)

(assert (=> b!11875 (=> res!11512 e!7226)))

(assert (=> b!11875 (= res!11512 (= (size!286 (buf!631 (_1!743 lt!17785))) #b00000000000000000000000000000000))))

(declare-fun b!11876 () Bool)

(assert (=> b!11876 (= e!7226 (arrayBitRangesEq!0 (buf!631 (_1!743 lt!17785)) (buf!631 (_2!743 lt!17785)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 (_1!743 lt!17785))) (currentByte!1703 (_1!743 lt!17785)) (currentBit!1698 (_1!743 lt!17785)))))))

(assert (= (and d!3772 res!11514) b!11874))

(assert (= (and b!11874 res!11513) b!11875))

(assert (= (and b!11875 (not res!11512)) b!11876))

(assert (=> b!11874 m!17571))

(assert (=> b!11874 m!17559))

(assert (=> b!11876 m!17571))

(assert (=> b!11876 m!17571))

(declare-fun m!17607 () Bool)

(assert (=> b!11876 m!17607))

(assert (=> d!3482 d!3772))

(declare-fun d!3774 () Bool)

(assert (=> d!3774 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lt!18917 () Unit!968)

(assert (=> d!3774 (= lt!18917 (choose!11 thiss!1486))))

(assert (=> d!3774 (= (lemmaIsPrefixRefl!0 thiss!1486) lt!18917)))

(declare-fun bs!1076 () Bool)

(assert (= bs!1076 d!3774))

(assert (=> bs!1076 m!16601))

(declare-fun m!17609 () Bool)

(assert (=> bs!1076 m!17609))

(assert (=> d!3482 d!3774))

(assert (=> d!3482 d!3464))

(assert (=> b!11341 d!3520))

(assert (=> b!11341 d!3518))

(declare-fun d!3776 () Bool)

(assert (=> d!3776 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 thiss!1486))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) lt!18303) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 thiss!1486))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486))) lt!18303))))

(declare-fun bs!1077 () Bool)

(assert (= bs!1077 d!3776))

(assert (=> bs!1077 m!16547))

(assert (=> b!11502 d!3776))

(declare-fun d!3778 () Bool)

(declare-fun c!853 () Bool)

(assert (=> d!3778 (= c!853 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7227 () List!165)

(assert (=> d!3778 (= (byteArrayBitContentToList!0 (_2!742 lt!17836) (_1!742 lt!17836) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!7227)))

(declare-fun b!11877 () Bool)

(assert (=> b!11877 (= e!7227 Nil!162)))

(declare-fun b!11878 () Bool)

(assert (=> b!11878 (= e!7227 (Cons!161 (not (= (bvand ((_ sign_extend 24) (select (arr!706 (_1!742 lt!17836)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!742 lt!17836) (_1!742 lt!17836) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3778 c!853) b!11877))

(assert (= (and d!3778 (not c!853)) b!11878))

(declare-fun m!17611 () Bool)

(assert (=> b!11878 m!17611))

(assert (=> b!11878 m!16575))

(declare-fun m!17613 () Bool)

(assert (=> b!11878 m!17613))

(assert (=> b!11401 d!3778))

(declare-fun b!11881 () Bool)

(declare-fun e!7228 () Bool)

(declare-fun lt!18919 () List!165)

(assert (=> b!11881 (= e!7228 (isEmpty!37 lt!18919))))

(declare-fun d!3780 () Bool)

(assert (=> d!3780 e!7228))

(declare-fun c!855 () Bool)

(assert (=> d!3780 (= c!855 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7229 () tuple2!1408)

(assert (=> d!3780 (= lt!18919 (_1!750 e!7229))))

(declare-fun c!854 () Bool)

(assert (=> d!3780 (= c!854 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3780 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3780 (= (bitStreamReadBitsIntoList!0 (_2!742 lt!17836) (_1!743 lt!17683) nBits!460) lt!18919)))

(declare-fun b!11882 () Bool)

(assert (=> b!11882 (= e!7228 (> (length!32 lt!18919) 0))))

(declare-fun b!11879 () Bool)

(assert (=> b!11879 (= e!7229 (tuple2!1409 Nil!162 (_1!743 lt!17683)))))

(declare-fun b!11880 () Bool)

(declare-fun lt!18918 () tuple2!1410)

(declare-fun lt!18920 () (_ BitVec 64))

(assert (=> b!11880 (= e!7229 (tuple2!1409 (Cons!161 (_1!751 lt!18918) (bitStreamReadBitsIntoList!0 (_2!742 lt!17836) (_2!751 lt!18918) (bvsub nBits!460 lt!18920))) (_2!751 lt!18918)))))

(assert (=> b!11880 (= lt!18918 (readBit!0 (_1!743 lt!17683)))))

(assert (=> b!11880 (= lt!18920 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3780 c!854) b!11879))

(assert (= (and d!3780 (not c!854)) b!11880))

(assert (= (and d!3780 c!855) b!11881))

(assert (= (and d!3780 (not c!855)) b!11882))

(declare-fun m!17615 () Bool)

(assert (=> b!11881 m!17615))

(declare-fun m!17617 () Bool)

(assert (=> b!11882 m!17617))

(declare-fun m!17619 () Bool)

(assert (=> b!11880 m!17619))

(assert (=> b!11880 m!16569))

(assert (=> b!11401 d!3780))

(declare-fun d!3782 () Bool)

(declare-fun e!7238 () Bool)

(assert (=> d!3782 e!7238))

(declare-fun res!11533 () Bool)

(assert (=> d!3782 (=> (not res!11533) (not e!7238))))

(declare-fun lt!19008 () (_ BitVec 64))

(declare-fun lt!19015 () tuple3!86)

(assert (=> d!3782 (= res!11533 (= (bvsub lt!19008 #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!286 (buf!631 (_2!752 lt!19015))) (currentByte!1703 (_2!752 lt!19015)) (currentBit!1698 (_2!752 lt!19015)))))))

(assert (=> d!3782 (or (= (bvand lt!19008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19008 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!19009 () (_ BitVec 64))

(assert (=> d!3782 (= lt!19008 (bvadd lt!19009 nBits!460))))

(assert (=> d!3782 (or (not (= (bvand lt!19009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19009 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3782 (= lt!19009 (bitIndex!0 (size!286 (buf!631 (_1!743 lt!17683))) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_1!743 lt!17683))))))

(declare-fun e!7240 () tuple3!86)

(assert (=> d!3782 (= lt!19015 e!7240)))

(declare-fun c!858 () Bool)

(assert (=> d!3782 (= c!858 (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3782 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3782 (= (readBitsLoop!0 (_1!743 lt!17683) nBits!460 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!19015)))

(declare-fun b!11901 () Bool)

(declare-fun res!11529 () Bool)

(assert (=> b!11901 (=> (not res!11529) (not e!7238))))

(declare-fun e!7239 () Bool)

(assert (=> b!11901 (= res!11529 e!7239)))

(declare-fun res!11530 () Bool)

(assert (=> b!11901 (=> res!11530 e!7239)))

(assert (=> b!11901 (= res!11530 (not (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun b!11902 () Bool)

(declare-fun res!11534 () Bool)

(assert (=> b!11902 (=> (not res!11534) (not e!7238))))

(assert (=> b!11902 (= res!11534 (and (= (buf!631 (_1!743 lt!17683)) (buf!631 (_2!752 lt!19015))) (= (size!286 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!286 (_3!46 lt!19015)))))))

(declare-fun b!11903 () Bool)

(assert (=> b!11903 (= e!7238 (= (byteArrayBitContentToList!0 (_2!752 lt!19015) (_3!46 lt!19015) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)) (bitStreamReadBitsIntoList!0 (_2!752 lt!19015) (_1!743 lt!17683) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!11903 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11903 (or (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!11904 () Bool)

(declare-datatypes ((tuple2!1422 0))(
  ( (tuple2!1423 (_1!762 BitStream!538) (_2!762 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!538) tuple2!1422)

(assert (=> b!11904 (= e!7239 (= (bitAt!0 (_3!46 lt!19015) #b0000000000000000000000000000000000000000000000000000000000000000) (_2!762 (readBitPure!0 (_1!743 lt!17683)))))))

(declare-fun b!11905 () Bool)

(declare-fun res!11535 () Bool)

(assert (=> b!11905 (=> (not res!11535) (not e!7238))))

(assert (=> b!11905 (= res!11535 (invariant!0 (currentBit!1698 (_2!752 lt!19015)) (currentByte!1703 (_2!752 lt!19015)) (size!286 (buf!631 (_2!752 lt!19015)))))))

(declare-fun call!234 () Bool)

(declare-fun bm!231 () Bool)

(declare-fun lt!19012 () tuple3!86)

(declare-fun lt!19017 () (_ BitVec 64))

(assert (=> bm!231 (= call!234 (arrayBitRangesEq!0 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (ite c!858 (_3!46 lt!19012) (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (ite c!858 lt!19017 #b0000000000000000000000000000000000000000000000000000000000000000) (ite c!858 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul ((_ sign_extend 32) (size!286 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!11906 () Bool)

(declare-fun e!7241 () Bool)

(assert (=> b!11906 (= e!7241 (and (= (buf!631 (_1!743 lt!17683)) (buf!631 (_2!752 lt!19012))) (= (size!286 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) (size!286 (_3!46 lt!19012)))))))

(declare-fun b!11907 () Bool)

(declare-fun res!11532 () Bool)

(assert (=> b!11907 (=> (not res!11532) (not e!7238))))

(assert (=> b!11907 (= res!11532 (arrayBitRangesEq!0 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (_3!46 lt!19015) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!11908 () Bool)

(declare-fun lt!19028 () Unit!968)

(assert (=> b!11908 (= e!7240 (tuple3!87 lt!19028 (_2!752 lt!19012) (_3!46 lt!19012)))))

(declare-fun lt!19007 () tuple2!1410)

(assert (=> b!11908 (= lt!19007 (readBit!0 (_1!743 lt!17683)))))

(declare-fun lt!19010 () (_ BitVec 32))

(assert (=> b!11908 (= lt!19010 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!18993 () (_ BitVec 32))

(assert (=> b!11908 (= lt!18993 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!19025 () array!663)

(assert (=> b!11908 (= lt!19025 (array!664 (store (arr!706 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!19010 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!706 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!19010)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!18993)))) ((_ sign_extend 24) (ite (_1!751 lt!19007) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!18993) #b00000000))))) (size!286 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!19001 () (_ BitVec 64))

(assert (=> b!11908 (= lt!19001 (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!19022 () (_ BitVec 64))

(assert (=> b!11908 (= lt!19022 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!18997 () Unit!968)

(assert (=> b!11908 (= lt!18997 (validateOffsetBitsIneqLemma!0 (_1!743 lt!17683) (_2!751 lt!19007) lt!19001 lt!19022))))

(assert (=> b!11908 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!751 lt!19007)))) ((_ sign_extend 32) (currentByte!1703 (_2!751 lt!19007))) ((_ sign_extend 32) (currentBit!1698 (_2!751 lt!19007))) (bvsub lt!19001 lt!19022))))

(declare-fun lt!19026 () Unit!968)

(assert (=> b!11908 (= lt!19026 lt!18997)))

(assert (=> b!11908 (= lt!19012 (readBitsLoop!0 (_2!751 lt!19007) nBits!460 lt!19025 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!460))))

(declare-fun res!11531 () Bool)

(assert (=> b!11908 (= res!11531 (= (bvsub (bvadd (bitIndex!0 (size!286 (buf!631 (_1!743 lt!17683))) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_1!743 lt!17683))) nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000) (bitIndex!0 (size!286 (buf!631 (_2!752 lt!19012))) (currentByte!1703 (_2!752 lt!19012)) (currentBit!1698 (_2!752 lt!19012)))))))

(assert (=> b!11908 (=> (not res!11531) (not e!7241))))

(assert (=> b!11908 e!7241))

(declare-fun lt!19019 () Unit!968)

(declare-fun Unit!1013 () Unit!968)

(assert (=> b!11908 (= lt!19019 Unit!1013)))

(declare-fun lt!19023 () (_ BitVec 32))

(assert (=> b!11908 (= lt!19023 ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!19016 () (_ BitVec 32))

(assert (=> b!11908 (= lt!19016 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!19027 () Unit!968)

(declare-fun arrayBitRangesUpdatedAtLemma!0 (array!663 (_ BitVec 64) Bool) Unit!968)

(assert (=> b!11908 (= lt!19027 (arrayBitRangesUpdatedAtLemma!0 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (_1!751 lt!19007)))))

(assert (=> b!11908 (arrayBitRangesEq!0 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) (array!664 (store (arr!706 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!19023 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!706 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) lt!19023)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!19016)))) ((_ sign_extend 24) (ite (_1!751 lt!19007) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!19016) #b00000000))))) (size!286 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19003 () Unit!968)

(assert (=> b!11908 (= lt!19003 lt!19027)))

(assert (=> b!11908 (= lt!19017 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19005 () Unit!968)

(declare-fun arrayBitRangesEqTransitive!0 (array!663 array!663 array!663 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!968)

(assert (=> b!11908 (= lt!19005 (arrayBitRangesEqTransitive!0 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!19025 (_3!46 lt!19012) lt!19017 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11908 call!234))

(declare-fun lt!18998 () Unit!968)

(assert (=> b!11908 (= lt!18998 lt!19005)))

(declare-fun call!235 () Bool)

(assert (=> b!11908 call!235))

(declare-fun lt!19018 () Unit!968)

(declare-fun Unit!1014 () Unit!968)

(assert (=> b!11908 (= lt!19018 Unit!1014)))

(declare-fun lt!18996 () Unit!968)

(assert (=> b!11908 (= lt!18996 (arrayBitRangesEqImpliesEq!0 lt!19025 (_3!46 lt!19012) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11908 (= (bitAt!0 lt!19025 #b0000000000000000000000000000000000000000000000000000000000000000) (bitAt!0 (_3!46 lt!19012) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!19000 () Unit!968)

(assert (=> b!11908 (= lt!19000 lt!18996)))

(declare-fun lt!19021 () Unit!968)

(declare-fun Unit!1015 () Unit!968)

(assert (=> b!11908 (= lt!19021 Unit!1015)))

(declare-fun lt!19013 () Bool)

(assert (=> b!11908 (= lt!19013 (= (bitAt!0 (_3!46 lt!19012) #b0000000000000000000000000000000000000000000000000000000000000000) (_1!751 lt!19007)))))

(declare-fun Unit!1016 () Unit!968)

(assert (=> b!11908 (= lt!19028 Unit!1016)))

(assert (=> b!11908 lt!19013))

(declare-fun bm!232 () Bool)

(declare-fun lt!19004 () array!663)

(declare-fun lt!19011 () array!663)

(declare-fun lt!19020 () (_ BitVec 64))

(declare-fun lt!19002 () (_ BitVec 64))

(assert (=> bm!232 (= call!235 (arrayBitRangesEq!0 (ite c!858 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!19004) (ite c!858 (_3!46 lt!19012) lt!19011) (ite c!858 #b0000000000000000000000000000000000000000000000000000000000000000 lt!19002) (ite c!858 #b0000000000000000000000000000000000000000000000000000000000000000 lt!19020)))))

(declare-fun lt!19006 () Unit!968)

(declare-fun b!11909 () Bool)

(assert (=> b!11909 (= e!7240 (tuple3!87 lt!19006 (_1!743 lt!17683) (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(declare-fun lt!19024 () Unit!968)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!663) Unit!968)

(assert (=> b!11909 (= lt!19024 (arrayBitRangesEqReflexiveLemma!0 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))))))

(assert (=> b!11909 call!234))

(declare-fun lt!18999 () Unit!968)

(assert (=> b!11909 (= lt!18999 lt!19024)))

(assert (=> b!11909 (= lt!19004 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!11909 (= lt!19011 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!18994 () (_ BitVec 64))

(assert (=> b!11909 (= lt!18994 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!18995 () (_ BitVec 64))

(assert (=> b!11909 (= lt!18995 ((_ sign_extend 32) (size!286 (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))))

(declare-fun lt!19014 () (_ BitVec 64))

(assert (=> b!11909 (= lt!19014 (bvmul lt!18995 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!11909 (= lt!19002 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!11909 (= lt!19020 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!663 array!663 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!968)

(assert (=> b!11909 (= lt!19006 (arrayBitRangesEqSlicedLemma!0 lt!19004 lt!19011 lt!18994 lt!19014 lt!19002 lt!19020))))

(assert (=> b!11909 call!235))

(assert (= (and d!3782 c!858) b!11908))

(assert (= (and d!3782 (not c!858)) b!11909))

(assert (= (and b!11908 res!11531) b!11906))

(assert (= (or b!11908 b!11909) bm!232))

(assert (= (or b!11908 b!11909) bm!231))

(assert (= (and d!3782 res!11533) b!11902))

(assert (= (and b!11902 res!11534) b!11907))

(assert (= (and b!11907 res!11532) b!11901))

(assert (= (and b!11901 (not res!11530)) b!11904))

(assert (= (and b!11901 res!11529) b!11905))

(assert (= (and b!11905 res!11535) b!11903))

(declare-fun m!17621 () Bool)

(assert (=> bm!232 m!17621))

(declare-fun m!17623 () Bool)

(assert (=> b!11903 m!17623))

(declare-fun m!17625 () Bool)

(assert (=> b!11903 m!17625))

(declare-fun m!17627 () Bool)

(assert (=> b!11904 m!17627))

(declare-fun m!17629 () Bool)

(assert (=> b!11904 m!17629))

(declare-fun m!17631 () Bool)

(assert (=> b!11907 m!17631))

(declare-fun m!17633 () Bool)

(assert (=> b!11905 m!17633))

(declare-fun m!17635 () Bool)

(assert (=> bm!231 m!17635))

(declare-fun m!17637 () Bool)

(assert (=> b!11908 m!17637))

(assert (=> b!11908 m!16569))

(declare-fun m!17639 () Bool)

(assert (=> b!11908 m!17639))

(declare-fun m!17641 () Bool)

(assert (=> b!11908 m!17641))

(declare-fun m!17643 () Bool)

(assert (=> b!11908 m!17643))

(declare-fun m!17645 () Bool)

(assert (=> b!11908 m!17645))

(declare-fun m!17647 () Bool)

(assert (=> b!11908 m!17647))

(declare-fun m!17649 () Bool)

(assert (=> b!11908 m!17649))

(declare-fun m!17651 () Bool)

(assert (=> b!11908 m!17651))

(declare-fun m!17653 () Bool)

(assert (=> b!11908 m!17653))

(declare-fun m!17655 () Bool)

(assert (=> b!11908 m!17655))

(declare-fun m!17657 () Bool)

(assert (=> b!11908 m!17657))

(assert (=> b!11908 m!16627))

(declare-fun m!17659 () Bool)

(assert (=> b!11908 m!17659))

(declare-fun m!17661 () Bool)

(assert (=> b!11908 m!17661))

(declare-fun m!17663 () Bool)

(assert (=> b!11908 m!17663))

(declare-fun m!17665 () Bool)

(assert (=> b!11908 m!17665))

(declare-fun m!17667 () Bool)

(assert (=> b!11908 m!17667))

(declare-fun m!17669 () Bool)

(assert (=> d!3782 m!17669))

(assert (=> d!3782 m!16627))

(declare-fun m!17671 () Bool)

(assert (=> b!11909 m!17671))

(declare-fun m!17673 () Bool)

(assert (=> b!11909 m!17673))

(assert (=> d!3484 d!3782))

(declare-fun d!3784 () Bool)

(declare-fun res!11536 () Bool)

(declare-fun e!7242 () Bool)

(assert (=> d!3784 (=> res!11536 e!7242)))

(assert (=> d!3784 (= res!11536 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3784 (= (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!742 (readBits!0 (_1!743 call!215) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) e!7242)))

(declare-fun b!11910 () Bool)

(declare-fun e!7243 () Bool)

(assert (=> b!11910 (= e!7242 e!7243)))

(declare-fun res!11537 () Bool)

(assert (=> b!11910 (=> (not res!11537) (not e!7243))))

(assert (=> b!11910 (= res!11537 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!706 (_1!742 (readBits!0 (_1!743 call!215) (bvsub (bvadd from!367 nBits!460) from!367)))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!11911 () Bool)

(assert (=> b!11911 (= e!7243 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!742 (readBits!0 (_1!743 call!215) (bvsub (bvadd from!367 nBits!460) from!367))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3784 (not res!11536)) b!11910))

(assert (= (and b!11910 res!11537) b!11911))

(assert (=> b!11910 m!16549))

(assert (=> b!11910 m!16551))

(declare-fun m!17675 () Bool)

(assert (=> b!11910 m!17675))

(assert (=> b!11910 m!16575))

(declare-fun m!17677 () Bool)

(assert (=> b!11911 m!17677))

(assert (=> b!11503 d!3784))

(declare-fun b!11912 () Bool)

(declare-fun res!11539 () Bool)

(declare-fun e!7244 () Bool)

(assert (=> b!11912 (=> (not res!11539) (not e!7244))))

(declare-fun lt!19030 () tuple2!1392)

(assert (=> b!11912 (= res!11539 (bvsle (currentByte!1703 (_1!743 call!215)) (currentByte!1703 (_2!742 lt!19030))))))

(declare-fun b!11913 () Bool)

(assert (=> b!11913 (= e!7244 (= (byteArrayBitContentToList!0 (_2!742 lt!19030) (_1!742 lt!19030) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bitStreamReadBitsIntoList!0 (_2!742 lt!19030) (_1!743 call!215) (bvsub (bvadd from!367 nBits!460) from!367))))))

(declare-fun d!3786 () Bool)

(assert (=> d!3786 e!7244))

(declare-fun res!11538 () Bool)

(assert (=> d!3786 (=> (not res!11538) (not e!7244))))

(assert (=> d!3786 (= res!11538 (= (buf!631 (_2!742 lt!19030)) (buf!631 (_1!743 call!215))))))

(declare-fun lt!19035 () tuple3!86)

(assert (=> d!3786 (= lt!19030 (tuple2!1393 (_3!46 lt!19035) (_2!752 lt!19035)))))

(assert (=> d!3786 (= lt!19035 (readBitsLoop!0 (_1!743 call!215) (bvsub (bvadd from!367 nBits!460) from!367) (array!664 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)))))

(assert (=> d!3786 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367)) (bvsle (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3786 (= (readBits!0 (_1!743 call!215) (bvsub (bvadd from!367 nBits!460) from!367)) lt!19030)))

(declare-fun b!11914 () Bool)

(declare-fun res!11541 () Bool)

(assert (=> b!11914 (=> (not res!11541) (not e!7244))))

(declare-fun lt!19033 () (_ BitVec 64))

(assert (=> b!11914 (= res!11541 (= (size!286 (_1!742 lt!19030)) ((_ extract 31 0) lt!19033)))))

(assert (=> b!11914 (and (bvslt lt!19033 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!19033 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!19031 () (_ BitVec 64))

(declare-fun lt!19029 () (_ BitVec 64))

(assert (=> b!11914 (= lt!19033 (bvsdiv lt!19031 lt!19029))))

(assert (=> b!11914 (and (not (= lt!19029 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!19031 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!19029 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!11914 (= lt!19029 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!19037 () (_ BitVec 64))

(declare-fun lt!19032 () (_ BitVec 64))

(assert (=> b!11914 (= lt!19031 (bvsub lt!19037 lt!19032))))

(assert (=> b!11914 (or (= (bvand lt!19037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19032 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19037 lt!19032) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11914 (= lt!19032 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!19034 () (_ BitVec 64))

(assert (=> b!11914 (= lt!19037 (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!19034))))

(assert (=> b!11914 (or (not (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19034 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub (bvadd from!367 nBits!460) from!367) lt!19034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11914 (= lt!19034 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!11915 () Bool)

(declare-fun res!11542 () Bool)

(assert (=> b!11915 (=> (not res!11542) (not e!7244))))

(assert (=> b!11915 (= res!11542 (invariant!0 (currentBit!1698 (_2!742 lt!19030)) (currentByte!1703 (_2!742 lt!19030)) (size!286 (buf!631 (_2!742 lt!19030)))))))

(declare-fun b!11916 () Bool)

(declare-fun res!11540 () Bool)

(assert (=> b!11916 (=> (not res!11540) (not e!7244))))

(declare-fun lt!19036 () (_ BitVec 64))

(assert (=> b!11916 (= res!11540 (= (bvadd lt!19036 (bvsub (bvadd from!367 nBits!460) from!367)) (bitIndex!0 (size!286 (buf!631 (_2!742 lt!19030))) (currentByte!1703 (_2!742 lt!19030)) (currentBit!1698 (_2!742 lt!19030)))))))

(assert (=> b!11916 (or (not (= (bvand lt!19036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19036 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19036 (bvsub (bvadd from!367 nBits!460) from!367)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11916 (= lt!19036 (bitIndex!0 (size!286 (buf!631 (_1!743 call!215))) (currentByte!1703 (_1!743 call!215)) (currentBit!1698 (_1!743 call!215))))))

(assert (= (and d!3786 res!11538) b!11916))

(assert (= (and b!11916 res!11540) b!11915))

(assert (= (and b!11915 res!11542) b!11914))

(assert (= (and b!11914 res!11541) b!11912))

(assert (= (and b!11912 res!11539) b!11913))

(declare-fun m!17679 () Bool)

(assert (=> b!11913 m!17679))

(declare-fun m!17681 () Bool)

(assert (=> b!11913 m!17681))

(declare-fun m!17683 () Bool)

(assert (=> d!3786 m!17683))

(declare-fun m!17685 () Bool)

(assert (=> b!11915 m!17685))

(declare-fun m!17687 () Bool)

(assert (=> b!11916 m!17687))

(declare-fun m!17689 () Bool)

(assert (=> b!11916 m!17689))

(assert (=> b!11503 d!3786))

(declare-fun b!11917 () Bool)

(declare-fun e!7249 () Bool)

(declare-fun call!236 () Bool)

(assert (=> b!11917 (= e!7249 call!236)))

(declare-fun d!3788 () Bool)

(declare-fun res!11545 () Bool)

(declare-fun e!7248 () Bool)

(assert (=> d!3788 (=> res!11545 e!7248)))

(assert (=> d!3788 (= res!11545 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(assert (=> d!3788 (= (arrayBitRangesEq!0 (buf!631 thiss!1486) (buf!631 (_2!741 lt!17680)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))) e!7248)))

(declare-fun b!11918 () Bool)

(declare-fun res!11547 () Bool)

(declare-fun lt!19038 () (_ BitVec 32))

(assert (=> b!11918 (= res!11547 (= lt!19038 #b00000000000000000000000000000000))))

(declare-fun e!7245 () Bool)

(assert (=> b!11918 (=> res!11547 e!7245)))

(declare-fun e!7247 () Bool)

(assert (=> b!11918 (= e!7247 e!7245)))

(declare-fun b!11919 () Bool)

(assert (=> b!11919 (= e!7245 call!236)))

(declare-fun b!11920 () Bool)

(declare-fun e!7246 () Bool)

(assert (=> b!11920 (= e!7246 e!7249)))

(declare-fun c!859 () Bool)

(declare-fun lt!19039 () tuple4!8)

(assert (=> b!11920 (= c!859 (= (_3!50 lt!19039) (_4!4 lt!19039)))))

(declare-fun b!11921 () Bool)

(assert (=> b!11921 (= e!7249 e!7247)))

(declare-fun lt!19040 () (_ BitVec 32))

(declare-fun res!11543 () Bool)

(assert (=> b!11921 (= res!11543 (byteRangesEq!0 (select (arr!706 (buf!631 thiss!1486)) (_3!50 lt!19039)) (select (arr!706 (buf!631 (_2!741 lt!17680))) (_3!50 lt!19039)) lt!19040 #b00000000000000000000000000001000))))

(assert (=> b!11921 (=> (not res!11543) (not e!7247))))

(declare-fun b!11922 () Bool)

(assert (=> b!11922 (= e!7248 e!7246)))

(declare-fun res!11546 () Bool)

(assert (=> b!11922 (=> (not res!11546) (not e!7246))))

(declare-fun e!7250 () Bool)

(assert (=> b!11922 (= res!11546 e!7250)))

(declare-fun res!11544 () Bool)

(assert (=> b!11922 (=> res!11544 e!7250)))

(assert (=> b!11922 (= res!11544 (bvsge (_1!761 lt!19039) (_2!761 lt!19039)))))

(assert (=> b!11922 (= lt!19038 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11922 (= lt!19040 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11922 (= lt!19039 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(declare-fun bm!233 () Bool)

(assert (=> bm!233 (= call!236 (byteRangesEq!0 (ite c!859 (select (arr!706 (buf!631 thiss!1486)) (_3!50 lt!19039)) (select (arr!706 (buf!631 thiss!1486)) (_4!4 lt!19039))) (ite c!859 (select (arr!706 (buf!631 (_2!741 lt!17680))) (_3!50 lt!19039)) (select (arr!706 (buf!631 (_2!741 lt!17680))) (_4!4 lt!19039))) (ite c!859 lt!19040 #b00000000000000000000000000000000) lt!19038))))

(declare-fun b!11923 () Bool)

(assert (=> b!11923 (= e!7250 (arrayRangesEq!5 (buf!631 thiss!1486) (buf!631 (_2!741 lt!17680)) (_1!761 lt!19039) (_2!761 lt!19039)))))

(assert (= (and d!3788 (not res!11545)) b!11922))

(assert (= (and b!11922 (not res!11544)) b!11923))

(assert (= (and b!11922 res!11546) b!11920))

(assert (= (and b!11920 c!859) b!11917))

(assert (= (and b!11920 (not c!859)) b!11921))

(assert (= (and b!11921 res!11543) b!11918))

(assert (= (and b!11918 (not res!11547)) b!11919))

(assert (= (or b!11917 b!11919) bm!233))

(declare-fun m!17691 () Bool)

(assert (=> b!11921 m!17691))

(declare-fun m!17693 () Bool)

(assert (=> b!11921 m!17693))

(assert (=> b!11921 m!17691))

(assert (=> b!11921 m!17693))

(declare-fun m!17695 () Bool)

(assert (=> b!11921 m!17695))

(assert (=> b!11922 m!16469))

(declare-fun m!17697 () Bool)

(assert (=> b!11922 m!17697))

(declare-fun m!17699 () Bool)

(assert (=> bm!233 m!17699))

(declare-fun m!17701 () Bool)

(assert (=> bm!233 m!17701))

(assert (=> bm!233 m!17693))

(declare-fun m!17703 () Bool)

(assert (=> bm!233 m!17703))

(assert (=> bm!233 m!17691))

(declare-fun m!17705 () Bool)

(assert (=> b!11923 m!17705))

(assert (=> b!11343 d!3788))

(assert (=> b!11343 d!3520))

(declare-fun d!3790 () Bool)

(assert (=> d!3790 (= (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 thiss!1486))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486))) (bvsub (bvmul ((_ sign_extend 32) (size!286 (buf!631 thiss!1486))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!1703 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1698 thiss!1486)))))))

(assert (=> d!3460 d!3790))

(declare-fun b!11924 () Bool)

(declare-fun res!11549 () Bool)

(declare-fun e!7252 () Bool)

(assert (=> b!11924 (=> (not res!11549) (not e!7252))))

(declare-fun lt!19053 () tuple2!1394)

(assert (=> b!11924 (= res!11549 (isPrefixOf!0 (_2!743 lt!19053) (ite c!801 (_2!741 lt!18270) thiss!1486)))))

(declare-fun lt!19060 () (_ BitVec 64))

(declare-fun lt!19045 () (_ BitVec 64))

(declare-fun b!11925 () Bool)

(assert (=> b!11925 (= e!7252 (= (_1!743 lt!19053) (withMovedBitIndex!0 (_2!743 lt!19053) (bvsub lt!19060 lt!19045))))))

(assert (=> b!11925 (or (= (bvand lt!19060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19045 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19060 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19060 lt!19045) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11925 (= lt!19045 (bitIndex!0 (size!286 (buf!631 (ite c!801 (_2!741 lt!18270) thiss!1486))) (currentByte!1703 (ite c!801 (_2!741 lt!18270) thiss!1486)) (currentBit!1698 (ite c!801 (_2!741 lt!18270) thiss!1486))))))

(assert (=> b!11925 (= lt!19060 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(declare-fun d!3792 () Bool)

(assert (=> d!3792 e!7252))

(declare-fun res!11550 () Bool)

(assert (=> d!3792 (=> (not res!11550) (not e!7252))))

(assert (=> d!3792 (= res!11550 (isPrefixOf!0 (_1!743 lt!19053) (_2!743 lt!19053)))))

(declare-fun lt!19058 () BitStream!538)

(assert (=> d!3792 (= lt!19053 (tuple2!1395 lt!19058 (ite c!801 (_2!741 lt!18270) thiss!1486)))))

(declare-fun lt!19049 () Unit!968)

(declare-fun lt!19042 () Unit!968)

(assert (=> d!3792 (= lt!19049 lt!19042)))

(assert (=> d!3792 (isPrefixOf!0 lt!19058 (ite c!801 (_2!741 lt!18270) thiss!1486))))

(assert (=> d!3792 (= lt!19042 (lemmaIsPrefixTransitive!0 lt!19058 (ite c!801 (_2!741 lt!18270) thiss!1486) (ite c!801 (_2!741 lt!18270) thiss!1486)))))

(declare-fun lt!19041 () Unit!968)

(declare-fun lt!19054 () Unit!968)

(assert (=> d!3792 (= lt!19041 lt!19054)))

(assert (=> d!3792 (isPrefixOf!0 lt!19058 (ite c!801 (_2!741 lt!18270) thiss!1486))))

(assert (=> d!3792 (= lt!19054 (lemmaIsPrefixTransitive!0 lt!19058 thiss!1486 (ite c!801 (_2!741 lt!18270) thiss!1486)))))

(declare-fun lt!19044 () Unit!968)

(declare-fun e!7251 () Unit!968)

(assert (=> d!3792 (= lt!19044 e!7251)))

(declare-fun c!860 () Bool)

(assert (=> d!3792 (= c!860 (not (= (size!286 (buf!631 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!19043 () Unit!968)

(declare-fun lt!19052 () Unit!968)

(assert (=> d!3792 (= lt!19043 lt!19052)))

(assert (=> d!3792 (isPrefixOf!0 (ite c!801 (_2!741 lt!18270) thiss!1486) (ite c!801 (_2!741 lt!18270) thiss!1486))))

(assert (=> d!3792 (= lt!19052 (lemmaIsPrefixRefl!0 (ite c!801 (_2!741 lt!18270) thiss!1486)))))

(declare-fun lt!19047 () Unit!968)

(declare-fun lt!19050 () Unit!968)

(assert (=> d!3792 (= lt!19047 lt!19050)))

(assert (=> d!3792 (= lt!19050 (lemmaIsPrefixRefl!0 (ite c!801 (_2!741 lt!18270) thiss!1486)))))

(declare-fun lt!19048 () Unit!968)

(declare-fun lt!19057 () Unit!968)

(assert (=> d!3792 (= lt!19048 lt!19057)))

(assert (=> d!3792 (isPrefixOf!0 lt!19058 lt!19058)))

(assert (=> d!3792 (= lt!19057 (lemmaIsPrefixRefl!0 lt!19058))))

(declare-fun lt!19046 () Unit!968)

(declare-fun lt!19059 () Unit!968)

(assert (=> d!3792 (= lt!19046 lt!19059)))

(assert (=> d!3792 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3792 (= lt!19059 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3792 (= lt!19058 (BitStream!539 (buf!631 (ite c!801 (_2!741 lt!18270) thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(assert (=> d!3792 (isPrefixOf!0 thiss!1486 (ite c!801 (_2!741 lt!18270) thiss!1486))))

(assert (=> d!3792 (= (reader!0 thiss!1486 (ite c!801 (_2!741 lt!18270) thiss!1486)) lt!19053)))

(declare-fun b!11926 () Bool)

(declare-fun res!11548 () Bool)

(assert (=> b!11926 (=> (not res!11548) (not e!7252))))

(assert (=> b!11926 (= res!11548 (isPrefixOf!0 (_1!743 lt!19053) thiss!1486))))

(declare-fun b!11927 () Bool)

(declare-fun lt!19055 () Unit!968)

(assert (=> b!11927 (= e!7251 lt!19055)))

(declare-fun lt!19051 () (_ BitVec 64))

(assert (=> b!11927 (= lt!19051 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19056 () (_ BitVec 64))

(assert (=> b!11927 (= lt!19056 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(assert (=> b!11927 (= lt!19055 (arrayBitRangesEqSymmetric!0 (buf!631 thiss!1486) (buf!631 (ite c!801 (_2!741 lt!18270) thiss!1486)) lt!19051 lt!19056))))

(assert (=> b!11927 (arrayBitRangesEq!0 (buf!631 (ite c!801 (_2!741 lt!18270) thiss!1486)) (buf!631 thiss!1486) lt!19051 lt!19056)))

(declare-fun b!11928 () Bool)

(declare-fun Unit!1017 () Unit!968)

(assert (=> b!11928 (= e!7251 Unit!1017)))

(assert (= (and d!3792 c!860) b!11927))

(assert (= (and d!3792 (not c!860)) b!11928))

(assert (= (and d!3792 res!11550) b!11926))

(assert (= (and b!11926 res!11548) b!11924))

(assert (= (and b!11924 res!11549) b!11925))

(declare-fun m!17707 () Bool)

(assert (=> b!11925 m!17707))

(declare-fun m!17709 () Bool)

(assert (=> b!11925 m!17709))

(assert (=> b!11925 m!16469))

(declare-fun m!17711 () Bool)

(assert (=> b!11926 m!17711))

(declare-fun m!17713 () Bool)

(assert (=> d!3792 m!17713))

(declare-fun m!17715 () Bool)

(assert (=> d!3792 m!17715))

(declare-fun m!17717 () Bool)

(assert (=> d!3792 m!17717))

(declare-fun m!17719 () Bool)

(assert (=> d!3792 m!17719))

(declare-fun m!17721 () Bool)

(assert (=> d!3792 m!17721))

(declare-fun m!17723 () Bool)

(assert (=> d!3792 m!17723))

(declare-fun m!17725 () Bool)

(assert (=> d!3792 m!17725))

(declare-fun m!17727 () Bool)

(assert (=> d!3792 m!17727))

(declare-fun m!17729 () Bool)

(assert (=> d!3792 m!17729))

(assert (=> d!3792 m!16599))

(assert (=> d!3792 m!16601))

(assert (=> b!11927 m!16469))

(declare-fun m!17731 () Bool)

(assert (=> b!11927 m!17731))

(declare-fun m!17733 () Bool)

(assert (=> b!11927 m!17733))

(declare-fun m!17735 () Bool)

(assert (=> b!11924 m!17735))

(assert (=> bm!212 d!3792))

(declare-fun d!3794 () Bool)

(declare-fun res!11553 () Bool)

(declare-fun e!7253 () Bool)

(assert (=> d!3794 (=> (not res!11553) (not e!7253))))

(assert (=> d!3794 (= res!11553 (= (size!286 (buf!631 thiss!1486)) (size!286 (buf!631 (_2!741 lt!18271)))))))

(assert (=> d!3794 (= (isPrefixOf!0 thiss!1486 (_2!741 lt!18271)) e!7253)))

(declare-fun b!11929 () Bool)

(declare-fun res!11552 () Bool)

(assert (=> b!11929 (=> (not res!11552) (not e!7253))))

(assert (=> b!11929 (= res!11552 (bvsle (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)) (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18271))) (currentByte!1703 (_2!741 lt!18271)) (currentBit!1698 (_2!741 lt!18271)))))))

(declare-fun b!11930 () Bool)

(declare-fun e!7254 () Bool)

(assert (=> b!11930 (= e!7253 e!7254)))

(declare-fun res!11551 () Bool)

(assert (=> b!11930 (=> res!11551 e!7254)))

(assert (=> b!11930 (= res!11551 (= (size!286 (buf!631 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!11931 () Bool)

(assert (=> b!11931 (= e!7254 (arrayBitRangesEq!0 (buf!631 thiss!1486) (buf!631 (_2!741 lt!18271)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(assert (= (and d!3794 res!11553) b!11929))

(assert (= (and b!11929 res!11552) b!11930))

(assert (= (and b!11930 (not res!11551)) b!11931))

(assert (=> b!11929 m!16469))

(assert (=> b!11929 m!16855))

(assert (=> b!11931 m!16469))

(assert (=> b!11931 m!16469))

(declare-fun m!17737 () Bool)

(assert (=> b!11931 m!17737))

(assert (=> b!11507 d!3794))

(declare-fun b!11934 () Bool)

(declare-fun e!7255 () Bool)

(declare-fun lt!19062 () List!165)

(assert (=> b!11934 (= e!7255 (isEmpty!37 lt!19062))))

(declare-fun d!3796 () Bool)

(assert (=> d!3796 e!7255))

(declare-fun c!862 () Bool)

(assert (=> d!3796 (= c!862 (= (bvsub nBits!460 lt!17729) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7256 () tuple2!1408)

(assert (=> d!3796 (= lt!19062 (_1!750 e!7256))))

(declare-fun c!861 () Bool)

(assert (=> d!3796 (= c!861 (= (bvsub nBits!460 lt!17729) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3796 (bvsge (bvsub nBits!460 lt!17729) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3796 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!17680) (_2!751 lt!17727) (bvsub nBits!460 lt!17729)) lt!19062)))

(declare-fun b!11935 () Bool)

(assert (=> b!11935 (= e!7255 (> (length!32 lt!19062) 0))))

(declare-fun b!11932 () Bool)

(assert (=> b!11932 (= e!7256 (tuple2!1409 Nil!162 (_2!751 lt!17727)))))

(declare-fun b!11933 () Bool)

(declare-fun lt!19061 () tuple2!1410)

(declare-fun lt!19063 () (_ BitVec 64))

(assert (=> b!11933 (= e!7256 (tuple2!1409 (Cons!161 (_1!751 lt!19061) (bitStreamReadBitsIntoList!0 (_2!741 lt!17680) (_2!751 lt!19061) (bvsub (bvsub nBits!460 lt!17729) lt!19063))) (_2!751 lt!19061)))))

(assert (=> b!11933 (= lt!19061 (readBit!0 (_2!751 lt!17727)))))

(assert (=> b!11933 (= lt!19063 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3796 c!861) b!11932))

(assert (= (and d!3796 (not c!861)) b!11933))

(assert (= (and d!3796 c!862) b!11934))

(assert (= (and d!3796 (not c!862)) b!11935))

(declare-fun m!17739 () Bool)

(assert (=> b!11934 m!17739))

(declare-fun m!17741 () Bool)

(assert (=> b!11935 m!17741))

(declare-fun m!17743 () Bool)

(assert (=> b!11933 m!17743))

(declare-fun m!17745 () Bool)

(assert (=> b!11933 m!17745))

(assert (=> b!11353 d!3796))

(declare-fun d!3798 () Bool)

(declare-fun e!7263 () Bool)

(assert (=> d!3798 e!7263))

(declare-fun res!11556 () Bool)

(assert (=> d!3798 (=> (not res!11556) (not e!7263))))

(declare-fun increaseBitIndex!0 (BitStream!538) tuple2!1390)

(assert (=> d!3798 (= res!11556 (= (buf!631 (_2!741 (increaseBitIndex!0 (_1!743 lt!17683)))) (buf!631 (_1!743 lt!17683))))))

(declare-fun lt!19083 () Bool)

(assert (=> d!3798 (= lt!19083 (not (= (bvand ((_ sign_extend 24) (select (arr!706 (buf!631 (_1!743 lt!17683))) (currentByte!1703 (_1!743 lt!17683)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1698 (_1!743 lt!17683))))) #b00000000000000000000000000000000)))))

(declare-fun lt!19080 () tuple2!1410)

(assert (=> d!3798 (= lt!19080 (tuple2!1411 (not (= (bvand ((_ sign_extend 24) (select (arr!706 (buf!631 (_1!743 lt!17683))) (currentByte!1703 (_1!743 lt!17683)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1698 (_1!743 lt!17683))))) #b00000000000000000000000000000000)) (_2!741 (increaseBitIndex!0 (_1!743 lt!17683)))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!3798 (validate_offset_bit!0 ((_ sign_extend 32) (size!286 (buf!631 (_1!743 lt!17683)))) ((_ sign_extend 32) (currentByte!1703 (_1!743 lt!17683))) ((_ sign_extend 32) (currentBit!1698 (_1!743 lt!17683))))))

(assert (=> d!3798 (= (readBit!0 (_1!743 lt!17683)) lt!19080)))

(declare-fun b!11938 () Bool)

(declare-fun lt!19082 () (_ BitVec 64))

(declare-fun lt!19081 () (_ BitVec 64))

(assert (=> b!11938 (= e!7263 (= (bitIndex!0 (size!286 (buf!631 (_2!741 (increaseBitIndex!0 (_1!743 lt!17683))))) (currentByte!1703 (_2!741 (increaseBitIndex!0 (_1!743 lt!17683)))) (currentBit!1698 (_2!741 (increaseBitIndex!0 (_1!743 lt!17683))))) (bvadd lt!19082 lt!19081)))))

(assert (=> b!11938 (or (not (= (bvand lt!19082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19081 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19082 lt!19081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11938 (= lt!19081 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!11938 (= lt!19082 (bitIndex!0 (size!286 (buf!631 (_1!743 lt!17683))) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_1!743 lt!17683))))))

(declare-fun lt!19084 () Bool)

(assert (=> b!11938 (= lt!19084 (not (= (bvand ((_ sign_extend 24) (select (arr!706 (buf!631 (_1!743 lt!17683))) (currentByte!1703 (_1!743 lt!17683)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1698 (_1!743 lt!17683))))) #b00000000000000000000000000000000)))))

(declare-fun lt!19078 () Bool)

(assert (=> b!11938 (= lt!19078 (not (= (bvand ((_ sign_extend 24) (select (arr!706 (buf!631 (_1!743 lt!17683))) (currentByte!1703 (_1!743 lt!17683)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1698 (_1!743 lt!17683))))) #b00000000000000000000000000000000)))))

(declare-fun lt!19079 () Bool)

(assert (=> b!11938 (= lt!19079 (not (= (bvand ((_ sign_extend 24) (select (arr!706 (buf!631 (_1!743 lt!17683))) (currentByte!1703 (_1!743 lt!17683)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!1698 (_1!743 lt!17683))))) #b00000000000000000000000000000000)))))

(assert (= (and d!3798 res!11556) b!11938))

(declare-fun m!17747 () Bool)

(assert (=> d!3798 m!17747))

(declare-fun m!17749 () Bool)

(assert (=> d!3798 m!17749))

(declare-fun m!17751 () Bool)

(assert (=> d!3798 m!17751))

(declare-fun m!17753 () Bool)

(assert (=> d!3798 m!17753))

(declare-fun m!17755 () Bool)

(assert (=> b!11938 m!17755))

(assert (=> b!11938 m!16627))

(assert (=> b!11938 m!17747))

(assert (=> b!11938 m!17749))

(assert (=> b!11938 m!17751))

(assert (=> b!11353 d!3798))

(declare-fun d!3800 () Bool)

(assert (=> d!3800 (= (invariant!0 (currentBit!1698 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))) (currentByte!1703 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))) (size!286 (buf!631 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))))) (and (bvsge (currentBit!1698 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))) #b00000000000000000000000000000000) (bvslt (currentBit!1698 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))) #b00000000000000000000000000001000) (bvsge (currentByte!1703 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!1703 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))) (size!286 (buf!631 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))))) (and (= (currentBit!1698 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))) #b00000000000000000000000000000000) (= (currentByte!1703 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679)))) (size!286 (buf!631 (BitStream!539 (buf!631 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_2!742 lt!17679))))))))))))

(assert (=> d!3468 d!3800))

(declare-fun d!3802 () Bool)

(assert (=> d!3802 (= (isEmpty!37 lt!17728) (is-Nil!162 lt!17728))))

(assert (=> b!11354 d!3802))

(declare-fun d!3804 () Bool)

(declare-fun e!7266 () Bool)

(assert (=> d!3804 e!7266))

(declare-fun res!11559 () Bool)

(assert (=> d!3804 (=> (not res!11559) (not e!7266))))

(declare-fun lt!19090 () (_ BitVec 64))

(assert (=> d!3804 (= res!11559 (or (= (bvand lt!18300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19090 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18300 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18300 lt!19090) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!3804 (= lt!19090 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!19089 () Unit!968)

(declare-fun choose!42 (BitStream!538 BitStream!538 BitStream!538 BitStream!538 (_ BitVec 64) List!165) Unit!968)

(assert (=> d!3804 (= lt!19089 (choose!42 (_2!741 lt!18304) (_2!741 lt!18304) (_1!743 lt!18295) (_1!743 lt!18305) lt!18300 lt!18277))))

(assert (=> d!3804 (bvsgt lt!18300 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3804 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!741 lt!18304) (_2!741 lt!18304) (_1!743 lt!18295) (_1!743 lt!18305) lt!18300 lt!18277) lt!19089)))

(declare-fun b!11941 () Bool)

(assert (=> b!11941 (= e!7266 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!18304) (_1!743 lt!18305) (bvsub lt!18300 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!71 lt!18277)))))

(assert (= (and d!3804 res!11559) b!11941))

(declare-fun m!17757 () Bool)

(assert (=> d!3804 m!17757))

(assert (=> b!11941 m!16913))

(assert (=> b!11941 m!16901))

(assert (=> b!11508 d!3804))

(declare-fun d!3806 () Bool)

(assert (=> d!3806 (= (tail!71 lt!18277) (t!915 lt!18277))))

(assert (=> b!11508 d!3806))

(declare-fun d!3808 () Bool)

(assert (=> d!3808 (= (bitAt!0 (buf!631 (_2!741 lt!18304)) lt!18296) (not (= (bvand ((_ sign_extend 24) (select (arr!706 (buf!631 (_2!741 lt!18304))) ((_ extract 31 0) (bvsdiv lt!18296 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!18296 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!1078 () Bool)

(assert (= bs!1078 d!3808))

(declare-fun m!17759 () Bool)

(assert (=> bs!1078 m!17759))

(declare-fun m!17761 () Bool)

(assert (=> bs!1078 m!17761))

(assert (=> b!11508 d!3808))

(declare-fun d!3810 () Bool)

(declare-fun e!7267 () Bool)

(assert (=> d!3810 e!7267))

(declare-fun res!11560 () Bool)

(assert (=> d!3810 (=> (not res!11560) (not e!7267))))

(declare-fun lt!19096 () (_ BitVec 64))

(declare-fun lt!19091 () (_ BitVec 64))

(declare-fun lt!19094 () (_ BitVec 64))

(assert (=> d!3810 (= res!11560 (= lt!19091 (bvsub lt!19094 lt!19096)))))

(assert (=> d!3810 (or (= (bvand lt!19094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19096 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19094 lt!19096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3810 (= lt!19096 (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270)))))))

(declare-fun lt!19092 () (_ BitVec 64))

(declare-fun lt!19095 () (_ BitVec 64))

(assert (=> d!3810 (= lt!19094 (bvmul lt!19092 lt!19095))))

(assert (=> d!3810 (or (= lt!19092 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19095 (bvsdiv (bvmul lt!19092 lt!19095) lt!19092)))))

(assert (=> d!3810 (= lt!19095 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3810 (= lt!19092 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))))))

(assert (=> d!3810 (= lt!19091 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270)))))))

(assert (=> d!3810 (invariant!0 (currentBit!1698 (_2!741 lt!18270)) (currentByte!1703 (_2!741 lt!18270)) (size!286 (buf!631 (_2!741 lt!18270))))))

(assert (=> d!3810 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18270))) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270))) lt!19091)))

(declare-fun b!11942 () Bool)

(declare-fun res!11561 () Bool)

(assert (=> b!11942 (=> (not res!11561) (not e!7267))))

(assert (=> b!11942 (= res!11561 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19091))))

(declare-fun b!11943 () Bool)

(declare-fun lt!19093 () (_ BitVec 64))

(assert (=> b!11943 (= e!7267 (bvsle lt!19091 (bvmul lt!19093 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11943 (or (= lt!19093 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19093 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19093)))))

(assert (=> b!11943 (= lt!19093 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))))))

(assert (= (and d!3810 res!11560) b!11942))

(assert (= (and b!11942 res!11561) b!11943))

(declare-fun m!17763 () Bool)

(assert (=> d!3810 m!17763))

(declare-fun m!17765 () Bool)

(assert (=> d!3810 m!17765))

(assert (=> b!11508 d!3810))

(declare-fun b!11944 () Bool)

(declare-fun res!11563 () Bool)

(declare-fun e!7269 () Bool)

(assert (=> b!11944 (=> (not res!11563) (not e!7269))))

(declare-fun lt!19109 () tuple2!1394)

(assert (=> b!11944 (= res!11563 (isPrefixOf!0 (_2!743 lt!19109) (_2!741 lt!18304)))))

(declare-fun b!11945 () Bool)

(declare-fun lt!19116 () (_ BitVec 64))

(declare-fun lt!19101 () (_ BitVec 64))

(assert (=> b!11945 (= e!7269 (= (_1!743 lt!19109) (withMovedBitIndex!0 (_2!743 lt!19109) (bvsub lt!19116 lt!19101))))))

(assert (=> b!11945 (or (= (bvand lt!19116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19101 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19116 lt!19101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11945 (= lt!19101 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18304))) (currentByte!1703 (_2!741 lt!18304)) (currentBit!1698 (_2!741 lt!18304))))))

(assert (=> b!11945 (= lt!19116 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(declare-fun d!3812 () Bool)

(assert (=> d!3812 e!7269))

(declare-fun res!11564 () Bool)

(assert (=> d!3812 (=> (not res!11564) (not e!7269))))

(assert (=> d!3812 (= res!11564 (isPrefixOf!0 (_1!743 lt!19109) (_2!743 lt!19109)))))

(declare-fun lt!19114 () BitStream!538)

(assert (=> d!3812 (= lt!19109 (tuple2!1395 lt!19114 (_2!741 lt!18304)))))

(declare-fun lt!19105 () Unit!968)

(declare-fun lt!19098 () Unit!968)

(assert (=> d!3812 (= lt!19105 lt!19098)))

(assert (=> d!3812 (isPrefixOf!0 lt!19114 (_2!741 lt!18304))))

(assert (=> d!3812 (= lt!19098 (lemmaIsPrefixTransitive!0 lt!19114 (_2!741 lt!18304) (_2!741 lt!18304)))))

(declare-fun lt!19097 () Unit!968)

(declare-fun lt!19110 () Unit!968)

(assert (=> d!3812 (= lt!19097 lt!19110)))

(assert (=> d!3812 (isPrefixOf!0 lt!19114 (_2!741 lt!18304))))

(assert (=> d!3812 (= lt!19110 (lemmaIsPrefixTransitive!0 lt!19114 thiss!1486 (_2!741 lt!18304)))))

(declare-fun lt!19100 () Unit!968)

(declare-fun e!7268 () Unit!968)

(assert (=> d!3812 (= lt!19100 e!7268)))

(declare-fun c!863 () Bool)

(assert (=> d!3812 (= c!863 (not (= (size!286 (buf!631 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!19099 () Unit!968)

(declare-fun lt!19108 () Unit!968)

(assert (=> d!3812 (= lt!19099 lt!19108)))

(assert (=> d!3812 (isPrefixOf!0 (_2!741 lt!18304) (_2!741 lt!18304))))

(assert (=> d!3812 (= lt!19108 (lemmaIsPrefixRefl!0 (_2!741 lt!18304)))))

(declare-fun lt!19103 () Unit!968)

(declare-fun lt!19106 () Unit!968)

(assert (=> d!3812 (= lt!19103 lt!19106)))

(assert (=> d!3812 (= lt!19106 (lemmaIsPrefixRefl!0 (_2!741 lt!18304)))))

(declare-fun lt!19104 () Unit!968)

(declare-fun lt!19113 () Unit!968)

(assert (=> d!3812 (= lt!19104 lt!19113)))

(assert (=> d!3812 (isPrefixOf!0 lt!19114 lt!19114)))

(assert (=> d!3812 (= lt!19113 (lemmaIsPrefixRefl!0 lt!19114))))

(declare-fun lt!19102 () Unit!968)

(declare-fun lt!19115 () Unit!968)

(assert (=> d!3812 (= lt!19102 lt!19115)))

(assert (=> d!3812 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3812 (= lt!19115 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3812 (= lt!19114 (BitStream!539 (buf!631 (_2!741 lt!18304)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(assert (=> d!3812 (isPrefixOf!0 thiss!1486 (_2!741 lt!18304))))

(assert (=> d!3812 (= (reader!0 thiss!1486 (_2!741 lt!18304)) lt!19109)))

(declare-fun b!11946 () Bool)

(declare-fun res!11562 () Bool)

(assert (=> b!11946 (=> (not res!11562) (not e!7269))))

(assert (=> b!11946 (= res!11562 (isPrefixOf!0 (_1!743 lt!19109) thiss!1486))))

(declare-fun b!11947 () Bool)

(declare-fun lt!19111 () Unit!968)

(assert (=> b!11947 (= e!7268 lt!19111)))

(declare-fun lt!19107 () (_ BitVec 64))

(assert (=> b!11947 (= lt!19107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19112 () (_ BitVec 64))

(assert (=> b!11947 (= lt!19112 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(assert (=> b!11947 (= lt!19111 (arrayBitRangesEqSymmetric!0 (buf!631 thiss!1486) (buf!631 (_2!741 lt!18304)) lt!19107 lt!19112))))

(assert (=> b!11947 (arrayBitRangesEq!0 (buf!631 (_2!741 lt!18304)) (buf!631 thiss!1486) lt!19107 lt!19112)))

(declare-fun b!11948 () Bool)

(declare-fun Unit!1018 () Unit!968)

(assert (=> b!11948 (= e!7268 Unit!1018)))

(assert (= (and d!3812 c!863) b!11947))

(assert (= (and d!3812 (not c!863)) b!11948))

(assert (= (and d!3812 res!11564) b!11946))

(assert (= (and b!11946 res!11562) b!11944))

(assert (= (and b!11944 res!11563) b!11945))

(declare-fun m!17767 () Bool)

(assert (=> b!11945 m!17767))

(assert (=> b!11945 m!16871))

(assert (=> b!11945 m!16469))

(declare-fun m!17769 () Bool)

(assert (=> b!11946 m!17769))

(declare-fun m!17771 () Bool)

(assert (=> d!3812 m!17771))

(assert (=> d!3812 m!16861))

(declare-fun m!17773 () Bool)

(assert (=> d!3812 m!17773))

(declare-fun m!17775 () Bool)

(assert (=> d!3812 m!17775))

(declare-fun m!17777 () Bool)

(assert (=> d!3812 m!17777))

(declare-fun m!17779 () Bool)

(assert (=> d!3812 m!17779))

(declare-fun m!17781 () Bool)

(assert (=> d!3812 m!17781))

(declare-fun m!17783 () Bool)

(assert (=> d!3812 m!17783))

(declare-fun m!17785 () Bool)

(assert (=> d!3812 m!17785))

(assert (=> d!3812 m!16599))

(assert (=> d!3812 m!16601))

(assert (=> b!11947 m!16469))

(declare-fun m!17787 () Bool)

(assert (=> b!11947 m!17787))

(declare-fun m!17789 () Bool)

(assert (=> b!11947 m!17789))

(declare-fun m!17791 () Bool)

(assert (=> b!11944 m!17791))

(assert (=> b!11508 d!3812))

(declare-fun d!3814 () Bool)

(declare-fun c!864 () Bool)

(assert (=> d!3814 (= c!864 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7270 () List!165)

(assert (=> d!3814 (= (byteArrayBitContentToList!0 (_2!741 lt!18304) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!7270)))

(declare-fun b!11949 () Bool)

(assert (=> b!11949 (= e!7270 Nil!162)))

(declare-fun b!11950 () Bool)

(assert (=> b!11950 (= e!7270 (Cons!161 (not (= (bvand ((_ sign_extend 24) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!741 lt!18304) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3814 c!864) b!11949))

(assert (= (and d!3814 (not c!864)) b!11950))

(assert (=> b!11950 m!16549))

(assert (=> b!11950 m!16551))

(assert (=> b!11950 m!16885))

(assert (=> b!11508 d!3814))

(declare-fun d!3816 () Bool)

(assert (=> d!3816 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18304)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270))) lt!18283)))

(declare-fun lt!19117 () Unit!968)

(assert (=> d!3816 (= lt!19117 (choose!9 (_2!741 lt!18270) (buf!631 (_2!741 lt!18304)) lt!18283 (BitStream!539 (buf!631 (_2!741 lt!18304)) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270)))))))

(assert (=> d!3816 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!741 lt!18270) (buf!631 (_2!741 lt!18304)) lt!18283) lt!19117)))

(declare-fun bs!1079 () Bool)

(assert (= bs!1079 d!3816))

(assert (=> bs!1079 m!16881))

(declare-fun m!17793 () Bool)

(assert (=> bs!1079 m!17793))

(assert (=> b!11508 d!3816))

(declare-fun d!3818 () Bool)

(assert (=> d!3818 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18304)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) lt!18269)))

(declare-fun lt!19118 () Unit!968)

(assert (=> d!3818 (= lt!19118 (choose!9 thiss!1486 (buf!631 (_2!741 lt!18304)) lt!18269 (BitStream!539 (buf!631 (_2!741 lt!18304)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(assert (=> d!3818 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!631 (_2!741 lt!18304)) lt!18269) lt!19118)))

(declare-fun bs!1080 () Bool)

(assert (= bs!1080 d!3818))

(assert (=> bs!1080 m!16869))

(declare-fun m!17795 () Bool)

(assert (=> bs!1080 m!17795))

(assert (=> b!11508 d!3818))

(declare-fun d!3820 () Bool)

(assert (=> d!3820 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270))) (bvsub lt!18292 lt!18276)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270)))) (bvsub lt!18292 lt!18276)))))

(declare-fun bs!1081 () Bool)

(assert (= bs!1081 d!3820))

(assert (=> bs!1081 m!17763))

(assert (=> b!11508 d!3820))

(declare-fun d!3822 () Bool)

(assert (=> d!3822 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18304)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270))) lt!18283) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18304)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270)))) lt!18283))))

(declare-fun bs!1082 () Bool)

(assert (= bs!1082 d!3822))

(declare-fun m!17797 () Bool)

(assert (=> bs!1082 m!17797))

(assert (=> b!11508 d!3822))

(declare-fun d!3824 () Bool)

(assert (=> d!3824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) lt!18274) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486))) lt!18274))))

(declare-fun bs!1083 () Bool)

(assert (= bs!1083 d!3824))

(declare-fun m!17799 () Bool)

(assert (=> bs!1083 m!17799))

(assert (=> b!11508 d!3824))

(declare-fun d!3826 () Bool)

(declare-fun e!7273 () Bool)

(assert (=> d!3826 e!7273))

(declare-fun res!11567 () Bool)

(assert (=> d!3826 (=> (not res!11567) (not e!7273))))

(assert (=> d!3826 (= res!11567 (or (= (bvand lt!18292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!18276 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!18292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!18292 lt!18276) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19121 () Unit!968)

(declare-fun choose!27 (BitStream!538 BitStream!538 (_ BitVec 64) (_ BitVec 64)) Unit!968)

(assert (=> d!3826 (= lt!19121 (choose!27 thiss!1486 (_2!741 lt!18270) lt!18292 lt!18276))))

(assert (=> d!3826 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!18276) (bvsle lt!18276 lt!18292))))

(assert (=> d!3826 (= (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!741 lt!18270) lt!18292 lt!18276) lt!19121)))

(declare-fun b!11953 () Bool)

(assert (=> b!11953 (= e!7273 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270))) (bvsub lt!18292 lt!18276)))))

(assert (= (and d!3826 res!11567) b!11953))

(declare-fun m!17801 () Bool)

(assert (=> d!3826 m!17801))

(assert (=> b!11953 m!16909))

(assert (=> b!11508 d!3826))

(declare-fun d!3828 () Bool)

(assert (=> d!3828 (= (head!63 (byteArrayBitContentToList!0 (_2!741 lt!18270) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!280 (byteArrayBitContentToList!0 (_2!741 lt!18270) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11508 d!3828))

(declare-fun d!3830 () Bool)

(declare-fun c!865 () Bool)

(assert (=> d!3830 (= c!865 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7274 () List!165)

(assert (=> d!3830 (= (byteArrayBitContentToList!0 (_2!741 lt!18304) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) e!7274)))

(declare-fun b!11954 () Bool)

(assert (=> b!11954 (= e!7274 Nil!162)))

(declare-fun b!11955 () Bool)

(assert (=> b!11955 (= e!7274 (Cons!161 (not (= (bvand ((_ sign_extend 24) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!741 lt!18304) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3830 c!865) b!11954))

(assert (= (and d!3830 (not c!865)) b!11955))

(assert (=> b!11955 m!17575))

(assert (=> b!11955 m!17577))

(declare-fun m!17803 () Bool)

(assert (=> b!11955 m!17803))

(assert (=> b!11508 d!3830))

(declare-fun d!3832 () Bool)

(assert (=> d!3832 (= (bitAt!0 (buf!631 (_2!741 lt!18270)) lt!18296) (bitAt!0 (buf!631 (_2!741 lt!18304)) lt!18296))))

(declare-fun lt!19124 () Unit!968)

(declare-fun choose!31 (array!663 array!663 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!968)

(assert (=> d!3832 (= lt!19124 (choose!31 (buf!631 (_2!741 lt!18270)) (buf!631 (_2!741 lt!18304)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!18296 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18270))) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270)))))))

(assert (=> d!3832 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18270))) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270)))))))

(assert (=> d!3832 (= (arrayBitRangesEqImpliesEq!0 (buf!631 (_2!741 lt!18270)) (buf!631 (_2!741 lt!18304)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!18296 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18270))) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270)))) lt!19124)))

(declare-fun bs!1084 () Bool)

(assert (= bs!1084 d!3832))

(assert (=> bs!1084 m!16903))

(assert (=> bs!1084 m!16887))

(assert (=> bs!1084 m!16857))

(declare-fun m!17805 () Bool)

(assert (=> bs!1084 m!17805))

(assert (=> b!11508 d!3832))

(declare-fun d!3834 () Bool)

(declare-fun c!866 () Bool)

(assert (=> d!3834 (= c!866 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7275 () List!165)

(assert (=> d!3834 (= (byteArrayBitContentToList!0 (_2!741 lt!18270) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001) e!7275)))

(declare-fun b!11956 () Bool)

(assert (=> b!11956 (= e!7275 Nil!162)))

(declare-fun b!11957 () Bool)

(assert (=> b!11957 (= e!7275 (Cons!161 (not (= (bvand ((_ sign_extend 24) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!741 lt!18270) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3834 c!866) b!11956))

(assert (= (and d!3834 (not c!866)) b!11957))

(assert (=> b!11957 m!16549))

(assert (=> b!11957 m!16551))

(declare-fun m!17807 () Bool)

(assert (=> b!11957 m!17807))

(assert (=> b!11508 d!3834))

(assert (=> b!11508 d!3520))

(declare-fun d!3836 () Bool)

(assert (=> d!3836 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18304)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) lt!18269) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18304)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486))) lt!18269))))

(declare-fun bs!1085 () Bool)

(assert (= bs!1085 d!3836))

(declare-fun m!17809 () Bool)

(assert (=> bs!1085 m!17809))

(assert (=> b!11508 d!3836))

(declare-fun b!11960 () Bool)

(declare-fun e!7276 () Bool)

(declare-fun lt!19126 () List!165)

(assert (=> b!11960 (= e!7276 (isEmpty!37 lt!19126))))

(declare-fun d!3838 () Bool)

(assert (=> d!3838 e!7276))

(declare-fun c!868 () Bool)

(assert (=> d!3838 (= c!868 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7277 () tuple2!1408)

(assert (=> d!3838 (= lt!19126 (_1!750 e!7277))))

(declare-fun c!867 () Bool)

(assert (=> d!3838 (= c!867 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3838 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3838 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!18270) (_1!743 lt!18272) #b0000000000000000000000000000000000000000000000000000000000000001) lt!19126)))

(declare-fun b!11961 () Bool)

(assert (=> b!11961 (= e!7276 (> (length!32 lt!19126) 0))))

(declare-fun b!11958 () Bool)

(assert (=> b!11958 (= e!7277 (tuple2!1409 Nil!162 (_1!743 lt!18272)))))

(declare-fun lt!19127 () (_ BitVec 64))

(declare-fun lt!19125 () tuple2!1410)

(declare-fun b!11959 () Bool)

(assert (=> b!11959 (= e!7277 (tuple2!1409 (Cons!161 (_1!751 lt!19125) (bitStreamReadBitsIntoList!0 (_2!741 lt!18270) (_2!751 lt!19125) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!19127))) (_2!751 lt!19125)))))

(assert (=> b!11959 (= lt!19125 (readBit!0 (_1!743 lt!18272)))))

(assert (=> b!11959 (= lt!19127 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3838 c!867) b!11958))

(assert (= (and d!3838 (not c!867)) b!11959))

(assert (= (and d!3838 c!868) b!11960))

(assert (= (and d!3838 (not c!868)) b!11961))

(declare-fun m!17811 () Bool)

(assert (=> b!11960 m!17811))

(declare-fun m!17813 () Bool)

(assert (=> b!11961 m!17813))

(declare-fun m!17815 () Bool)

(assert (=> b!11959 m!17815))

(declare-fun m!17817 () Bool)

(assert (=> b!11959 m!17817))

(assert (=> b!11508 d!3838))

(declare-fun c!869 () Bool)

(declare-fun lt!19130 () tuple2!1390)

(declare-fun call!237 () tuple2!1394)

(declare-fun bm!234 () Bool)

(assert (=> bm!234 (= call!237 (reader!0 (_2!741 lt!18270) (ite c!869 (_2!741 lt!19130) (_2!741 lt!18270))))))

(declare-fun b!11962 () Bool)

(declare-fun e!7278 () Bool)

(declare-fun lt!19163 () (_ BitVec 64))

(assert (=> b!11962 (= e!7278 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270))) lt!19163))))

(declare-fun b!11963 () Bool)

(declare-fun e!7279 () tuple2!1390)

(declare-fun Unit!1019 () Unit!968)

(assert (=> b!11963 (= e!7279 (tuple2!1391 Unit!1019 (_2!741 lt!18270)))))

(assert (=> b!11963 (= (size!286 (buf!631 (_2!741 lt!18270))) (size!286 (buf!631 (_2!741 lt!18270))))))

(declare-fun lt!19138 () Unit!968)

(declare-fun Unit!1020 () Unit!968)

(assert (=> b!11963 (= lt!19138 Unit!1020)))

(assert (=> b!11963 (checkByteArrayBitContent!0 (_2!741 lt!18270) srcBuffer!6 (_1!742 (readBits!0 (_1!743 call!237) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!11964 () Bool)

(declare-fun res!11572 () Bool)

(declare-fun e!7280 () Bool)

(assert (=> b!11964 (=> (not res!11572) (not e!7280))))

(declare-fun lt!19131 () tuple2!1390)

(assert (=> b!11964 (= res!11572 (= (size!286 (buf!631 (_2!741 lt!19131))) (size!286 (buf!631 (_2!741 lt!18270)))))))

(declare-fun d!3840 () Bool)

(assert (=> d!3840 e!7280))

(declare-fun res!11573 () Bool)

(assert (=> d!3840 (=> (not res!11573) (not e!7280))))

(declare-fun lt!19161 () (_ BitVec 64))

(assert (=> d!3840 (= res!11573 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!19131))) (currentByte!1703 (_2!741 lt!19131)) (currentBit!1698 (_2!741 lt!19131))) (bvsub lt!19161 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!3840 (or (= (bvand lt!19161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19161 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!19140 () (_ BitVec 64))

(assert (=> d!3840 (= lt!19161 (bvadd lt!19140 from!367 nBits!460))))

(assert (=> d!3840 (or (not (= (bvand lt!19140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19140 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19140 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3840 (= lt!19140 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18270))) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270))))))

(assert (=> d!3840 (= lt!19131 e!7279)))

(assert (=> d!3840 (= c!869 (bvslt (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!19145 () Unit!968)

(declare-fun lt!19128 () Unit!968)

(assert (=> d!3840 (= lt!19145 lt!19128)))

(assert (=> d!3840 (isPrefixOf!0 (_2!741 lt!18270) (_2!741 lt!18270))))

(assert (=> d!3840 (= lt!19128 (lemmaIsPrefixRefl!0 (_2!741 lt!18270)))))

(declare-fun lt!19156 () (_ BitVec 64))

(assert (=> d!3840 (= lt!19156 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18270))) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270))))))

(assert (=> d!3840 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3840 (= (appendBitsMSBFirstLoop!0 (_2!741 lt!18270) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)) lt!19131)))

(declare-fun b!11965 () Bool)

(declare-fun res!11568 () Bool)

(assert (=> b!11965 (=> (not res!11568) (not e!7280))))

(assert (=> b!11965 (= res!11568 (invariant!0 (currentBit!1698 (_2!741 lt!19131)) (currentByte!1703 (_2!741 lt!19131)) (size!286 (buf!631 (_2!741 lt!19131)))))))

(declare-fun lt!19158 () tuple2!1394)

(declare-fun b!11966 () Bool)

(assert (=> b!11966 (= e!7280 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!19131) (_1!743 lt!19158) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!741 lt!19131) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!11966 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11966 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!19151 () Unit!968)

(declare-fun lt!19154 () Unit!968)

(assert (=> b!11966 (= lt!19151 lt!19154)))

(assert (=> b!11966 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!19131)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270))) lt!19163)))

(assert (=> b!11966 (= lt!19154 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!741 lt!18270) (buf!631 (_2!741 lt!19131)) lt!19163))))

(assert (=> b!11966 e!7278))

(declare-fun res!11570 () Bool)

(assert (=> b!11966 (=> (not res!11570) (not e!7278))))

(assert (=> b!11966 (= res!11570 (and (= (size!286 (buf!631 (_2!741 lt!18270))) (size!286 (buf!631 (_2!741 lt!19131)))) (bvsge lt!19163 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11966 (= lt!19163 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11966 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11966 (= lt!19158 (reader!0 (_2!741 lt!18270) (_2!741 lt!19131)))))

(declare-fun b!11967 () Bool)

(declare-fun res!11569 () Bool)

(assert (=> b!11967 (=> (not res!11569) (not e!7280))))

(assert (=> b!11967 (= res!11569 (isPrefixOf!0 (_2!741 lt!18270) (_2!741 lt!19131)))))

(declare-fun b!11968 () Bool)

(declare-fun lt!19164 () tuple2!1390)

(declare-fun Unit!1021 () Unit!968)

(assert (=> b!11968 (= e!7279 (tuple2!1391 Unit!1021 (_2!741 lt!19164)))))

(assert (=> b!11968 (= lt!19130 (appendBitFromByte!0 (_2!741 lt!18270) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!19152 () (_ BitVec 64))

(assert (=> b!11968 (= lt!19152 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19136 () (_ BitVec 64))

(assert (=> b!11968 (= lt!19136 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!19149 () Unit!968)

(assert (=> b!11968 (= lt!19149 (validateOffsetBitsIneqLemma!0 (_2!741 lt!18270) (_2!741 lt!19130) lt!19152 lt!19136))))

(assert (=> b!11968 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!19130)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!19130))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!19130))) (bvsub lt!19152 lt!19136))))

(declare-fun lt!19142 () Unit!968)

(assert (=> b!11968 (= lt!19142 lt!19149)))

(declare-fun lt!19132 () tuple2!1394)

(assert (=> b!11968 (= lt!19132 call!237)))

(declare-fun lt!19134 () (_ BitVec 64))

(assert (=> b!11968 (= lt!19134 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!19167 () Unit!968)

(assert (=> b!11968 (= lt!19167 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!741 lt!18270) (buf!631 (_2!741 lt!19130)) lt!19134))))

(assert (=> b!11968 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!19130)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270))) lt!19134)))

(declare-fun lt!19153 () Unit!968)

(assert (=> b!11968 (= lt!19153 lt!19167)))

(assert (=> b!11968 (= (head!63 (byteArrayBitContentToList!0 (_2!741 lt!19130) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!63 (bitStreamReadBitsIntoList!0 (_2!741 lt!19130) (_1!743 lt!19132) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19157 () Unit!968)

(declare-fun Unit!1022 () Unit!968)

(assert (=> b!11968 (= lt!19157 Unit!1022)))

(assert (=> b!11968 (= lt!19164 (appendBitsMSBFirstLoop!0 (_2!741 lt!19130) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!19171 () Unit!968)

(assert (=> b!11968 (= lt!19171 (lemmaIsPrefixTransitive!0 (_2!741 lt!18270) (_2!741 lt!19130) (_2!741 lt!19164)))))

(assert (=> b!11968 (isPrefixOf!0 (_2!741 lt!18270) (_2!741 lt!19164))))

(declare-fun lt!19141 () Unit!968)

(assert (=> b!11968 (= lt!19141 lt!19171)))

(assert (=> b!11968 (= (size!286 (buf!631 (_2!741 lt!19164))) (size!286 (buf!631 (_2!741 lt!18270))))))

(declare-fun lt!19139 () Unit!968)

(declare-fun Unit!1023 () Unit!968)

(assert (=> b!11968 (= lt!19139 Unit!1023)))

(assert (=> b!11968 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!19164))) (currentByte!1703 (_2!741 lt!19164)) (currentBit!1698 (_2!741 lt!19164))) (bvsub (bvadd (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18270))) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19159 () Unit!968)

(declare-fun Unit!1024 () Unit!968)

(assert (=> b!11968 (= lt!19159 Unit!1024)))

(assert (=> b!11968 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!19164))) (currentByte!1703 (_2!741 lt!19164)) (currentBit!1698 (_2!741 lt!19164))) (bvsub (bvsub (bvadd (bitIndex!0 (size!286 (buf!631 (_2!741 lt!19130))) (currentByte!1703 (_2!741 lt!19130)) (currentBit!1698 (_2!741 lt!19130))) from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!19144 () Unit!968)

(declare-fun Unit!1025 () Unit!968)

(assert (=> b!11968 (= lt!19144 Unit!1025)))

(declare-fun lt!19155 () tuple2!1394)

(assert (=> b!11968 (= lt!19155 (reader!0 (_2!741 lt!18270) (_2!741 lt!19164)))))

(declare-fun lt!19129 () (_ BitVec 64))

(assert (=> b!11968 (= lt!19129 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19133 () Unit!968)

(assert (=> b!11968 (= lt!19133 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!741 lt!18270) (buf!631 (_2!741 lt!19164)) lt!19129))))

(assert (=> b!11968 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!19164)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18270))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18270))) lt!19129)))

(declare-fun lt!19162 () Unit!968)

(assert (=> b!11968 (= lt!19162 lt!19133)))

(declare-fun lt!19165 () tuple2!1394)

(assert (=> b!11968 (= lt!19165 (reader!0 (_2!741 lt!19130) (_2!741 lt!19164)))))

(declare-fun lt!19143 () (_ BitVec 64))

(assert (=> b!11968 (= lt!19143 (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!19169 () Unit!968)

(assert (=> b!11968 (= lt!19169 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!741 lt!19130) (buf!631 (_2!741 lt!19164)) lt!19143))))

(assert (=> b!11968 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!19164)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!19130))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!19130))) lt!19143)))

(declare-fun lt!19166 () Unit!968)

(assert (=> b!11968 (= lt!19166 lt!19169)))

(declare-fun lt!19135 () List!165)

(assert (=> b!11968 (= lt!19135 (byteArrayBitContentToList!0 (_2!741 lt!19164) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!19168 () List!165)

(assert (=> b!11968 (= lt!19168 (byteArrayBitContentToList!0 (_2!741 lt!19164) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19137 () List!165)

(assert (=> b!11968 (= lt!19137 (bitStreamReadBitsIntoList!0 (_2!741 lt!19164) (_1!743 lt!19155) (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!19170 () List!165)

(assert (=> b!11968 (= lt!19170 (bitStreamReadBitsIntoList!0 (_2!741 lt!19164) (_1!743 lt!19165) (bvsub (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19160 () (_ BitVec 64))

(assert (=> b!11968 (= lt!19160 (bvsub (bvadd from!367 nBits!460) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!19148 () Unit!968)

(assert (=> b!11968 (= lt!19148 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!741 lt!19164) (_2!741 lt!19164) (_1!743 lt!19155) (_1!743 lt!19165) lt!19160 lt!19137))))

(assert (=> b!11968 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!19164) (_1!743 lt!19165) (bvsub lt!19160 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!71 lt!19137))))

(declare-fun lt!19150 () Unit!968)

(assert (=> b!11968 (= lt!19150 lt!19148)))

(declare-fun lt!19146 () Unit!968)

(assert (=> b!11968 (= lt!19146 (arrayBitRangesEqImpliesEq!0 (buf!631 (_2!741 lt!19130)) (buf!631 (_2!741 lt!19164)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!19156 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!19130))) (currentByte!1703 (_2!741 lt!19130)) (currentBit!1698 (_2!741 lt!19130)))))))

(assert (=> b!11968 (= (bitAt!0 (buf!631 (_2!741 lt!19130)) lt!19156) (bitAt!0 (buf!631 (_2!741 lt!19164)) lt!19156))))

(declare-fun lt!19147 () Unit!968)

(assert (=> b!11968 (= lt!19147 lt!19146)))

(declare-fun b!11969 () Bool)

(declare-fun res!11571 () Bool)

(assert (=> b!11969 (=> (not res!11571) (not e!7280))))

(assert (=> b!11969 (= res!11571 (= (size!286 (buf!631 (_2!741 lt!18270))) (size!286 (buf!631 (_2!741 lt!19131)))))))

(assert (= (and d!3840 c!869) b!11968))

(assert (= (and d!3840 (not c!869)) b!11963))

(assert (= (or b!11968 b!11963) bm!234))

(assert (= (and d!3840 res!11573) b!11965))

(assert (= (and b!11965 res!11568) b!11969))

(assert (= (and b!11969 res!11571) b!11967))

(assert (= (and b!11967 res!11569) b!11964))

(assert (= (and b!11964 res!11572) b!11966))

(assert (= (and b!11966 res!11570) b!11962))

(declare-fun m!17819 () Bool)

(assert (=> d!3840 m!17819))

(assert (=> d!3840 m!16857))

(declare-fun m!17821 () Bool)

(assert (=> d!3840 m!17821))

(declare-fun m!17823 () Bool)

(assert (=> d!3840 m!17823))

(declare-fun m!17825 () Bool)

(assert (=> b!11968 m!17825))

(declare-fun m!17827 () Bool)

(assert (=> b!11968 m!17827))

(declare-fun m!17829 () Bool)

(assert (=> b!11968 m!17829))

(declare-fun m!17831 () Bool)

(assert (=> b!11968 m!17831))

(declare-fun m!17833 () Bool)

(assert (=> b!11968 m!17833))

(declare-fun m!17835 () Bool)

(assert (=> b!11968 m!17835))

(declare-fun m!17837 () Bool)

(assert (=> b!11968 m!17837))

(declare-fun m!17839 () Bool)

(assert (=> b!11968 m!17839))

(declare-fun m!17841 () Bool)

(assert (=> b!11968 m!17841))

(declare-fun m!17843 () Bool)

(assert (=> b!11968 m!17843))

(declare-fun m!17845 () Bool)

(assert (=> b!11968 m!17845))

(declare-fun m!17847 () Bool)

(assert (=> b!11968 m!17847))

(declare-fun m!17849 () Bool)

(assert (=> b!11968 m!17849))

(declare-fun m!17851 () Bool)

(assert (=> b!11968 m!17851))

(assert (=> b!11968 m!17825))

(declare-fun m!17853 () Bool)

(assert (=> b!11968 m!17853))

(declare-fun m!17855 () Bool)

(assert (=> b!11968 m!17855))

(declare-fun m!17857 () Bool)

(assert (=> b!11968 m!17857))

(declare-fun m!17859 () Bool)

(assert (=> b!11968 m!17859))

(declare-fun m!17861 () Bool)

(assert (=> b!11968 m!17861))

(assert (=> b!11968 m!17841))

(assert (=> b!11968 m!16857))

(declare-fun m!17863 () Bool)

(assert (=> b!11968 m!17863))

(assert (=> b!11968 m!17851))

(declare-fun m!17865 () Bool)

(assert (=> b!11968 m!17865))

(declare-fun m!17867 () Bool)

(assert (=> b!11968 m!17867))

(declare-fun m!17869 () Bool)

(assert (=> b!11968 m!17869))

(declare-fun m!17871 () Bool)

(assert (=> b!11968 m!17871))

(declare-fun m!17873 () Bool)

(assert (=> b!11968 m!17873))

(declare-fun m!17875 () Bool)

(assert (=> b!11968 m!17875))

(declare-fun m!17877 () Bool)

(assert (=> b!11968 m!17877))

(declare-fun m!17879 () Bool)

(assert (=> b!11968 m!17879))

(declare-fun m!17881 () Bool)

(assert (=> b!11968 m!17881))

(assert (=> b!11968 m!17575))

(assert (=> b!11968 m!17575))

(declare-fun m!17883 () Bool)

(assert (=> b!11968 m!17883))

(declare-fun m!17885 () Bool)

(assert (=> b!11962 m!17885))

(declare-fun m!17887 () Bool)

(assert (=> b!11965 m!17887))

(declare-fun m!17889 () Bool)

(assert (=> b!11966 m!17889))

(declare-fun m!17891 () Bool)

(assert (=> b!11966 m!17891))

(declare-fun m!17893 () Bool)

(assert (=> b!11966 m!17893))

(declare-fun m!17895 () Bool)

(assert (=> b!11966 m!17895))

(declare-fun m!17897 () Bool)

(assert (=> b!11966 m!17897))

(declare-fun m!17899 () Bool)

(assert (=> b!11963 m!17899))

(declare-fun m!17901 () Bool)

(assert (=> b!11963 m!17901))

(declare-fun m!17903 () Bool)

(assert (=> b!11967 m!17903))

(declare-fun m!17905 () Bool)

(assert (=> bm!234 m!17905))

(assert (=> b!11508 d!3840))

(declare-fun d!3842 () Bool)

(assert (=> d!3842 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18270)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) lt!18274)))

(declare-fun lt!19172 () Unit!968)

(assert (=> d!3842 (= lt!19172 (choose!9 thiss!1486 (buf!631 (_2!741 lt!18270)) lt!18274 (BitStream!539 (buf!631 (_2!741 lt!18270)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(assert (=> d!3842 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!631 (_2!741 lt!18270)) lt!18274) lt!19172)))

(declare-fun bs!1086 () Bool)

(assert (= bs!1086 d!3842))

(assert (=> bs!1086 m!16895))

(declare-fun m!17907 () Bool)

(assert (=> bs!1086 m!17907))

(assert (=> b!11508 d!3842))

(declare-fun d!3844 () Bool)

(assert (=> d!3844 (= (bitAt!0 (buf!631 (_2!741 lt!18270)) lt!18296) (not (= (bvand ((_ sign_extend 24) (select (arr!706 (buf!631 (_2!741 lt!18270))) ((_ extract 31 0) (bvsdiv lt!18296 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!18296 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!1087 () Bool)

(assert (= bs!1087 d!3844))

(declare-fun m!17909 () Bool)

(assert (=> bs!1087 m!17909))

(assert (=> bs!1087 m!17761))

(assert (=> b!11508 d!3844))

(declare-fun b!11972 () Bool)

(declare-fun e!7281 () Bool)

(declare-fun lt!19174 () List!165)

(assert (=> b!11972 (= e!7281 (isEmpty!37 lt!19174))))

(declare-fun d!3846 () Bool)

(assert (=> d!3846 e!7281))

(declare-fun c!871 () Bool)

(assert (=> d!3846 (= c!871 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7282 () tuple2!1408)

(assert (=> d!3846 (= lt!19174 (_1!750 e!7282))))

(declare-fun c!870 () Bool)

(assert (=> d!3846 (= c!870 (= (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3846 (bvsge (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3846 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!18304) (_1!743 lt!18305) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!19174)))

(declare-fun b!11973 () Bool)

(assert (=> b!11973 (= e!7281 (> (length!32 lt!19174) 0))))

(declare-fun b!11970 () Bool)

(assert (=> b!11970 (= e!7282 (tuple2!1409 Nil!162 (_1!743 lt!18305)))))

(declare-fun lt!19175 () (_ BitVec 64))

(declare-fun b!11971 () Bool)

(declare-fun lt!19173 () tuple2!1410)

(assert (=> b!11971 (= e!7282 (tuple2!1409 (Cons!161 (_1!751 lt!19173) (bitStreamReadBitsIntoList!0 (_2!741 lt!18304) (_2!751 lt!19173) (bvsub (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001) lt!19175))) (_2!751 lt!19173)))))

(assert (=> b!11971 (= lt!19173 (readBit!0 (_1!743 lt!18305)))))

(assert (=> b!11971 (= lt!19175 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3846 c!870) b!11970))

(assert (= (and d!3846 (not c!870)) b!11971))

(assert (= (and d!3846 c!871) b!11972))

(assert (= (and d!3846 (not c!871)) b!11973))

(declare-fun m!17911 () Bool)

(assert (=> b!11972 m!17911))

(declare-fun m!17913 () Bool)

(assert (=> b!11973 m!17913))

(declare-fun m!17915 () Bool)

(assert (=> b!11971 m!17915))

(declare-fun m!17917 () Bool)

(assert (=> b!11971 m!17917))

(assert (=> b!11508 d!3846))

(declare-fun b!11974 () Bool)

(declare-fun res!11575 () Bool)

(declare-fun e!7284 () Bool)

(assert (=> b!11974 (=> (not res!11575) (not e!7284))))

(declare-fun lt!19188 () tuple2!1394)

(assert (=> b!11974 (= res!11575 (isPrefixOf!0 (_2!743 lt!19188) (_2!741 lt!18304)))))

(declare-fun b!11975 () Bool)

(declare-fun lt!19195 () (_ BitVec 64))

(declare-fun lt!19180 () (_ BitVec 64))

(assert (=> b!11975 (= e!7284 (= (_1!743 lt!19188) (withMovedBitIndex!0 (_2!743 lt!19188) (bvsub lt!19195 lt!19180))))))

(assert (=> b!11975 (or (= (bvand lt!19195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19180 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19195 lt!19180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!11975 (= lt!19180 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18304))) (currentByte!1703 (_2!741 lt!18304)) (currentBit!1698 (_2!741 lt!18304))))))

(assert (=> b!11975 (= lt!19195 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18270))) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270))))))

(declare-fun d!3848 () Bool)

(assert (=> d!3848 e!7284))

(declare-fun res!11576 () Bool)

(assert (=> d!3848 (=> (not res!11576) (not e!7284))))

(assert (=> d!3848 (= res!11576 (isPrefixOf!0 (_1!743 lt!19188) (_2!743 lt!19188)))))

(declare-fun lt!19193 () BitStream!538)

(assert (=> d!3848 (= lt!19188 (tuple2!1395 lt!19193 (_2!741 lt!18304)))))

(declare-fun lt!19184 () Unit!968)

(declare-fun lt!19177 () Unit!968)

(assert (=> d!3848 (= lt!19184 lt!19177)))

(assert (=> d!3848 (isPrefixOf!0 lt!19193 (_2!741 lt!18304))))

(assert (=> d!3848 (= lt!19177 (lemmaIsPrefixTransitive!0 lt!19193 (_2!741 lt!18304) (_2!741 lt!18304)))))

(declare-fun lt!19176 () Unit!968)

(declare-fun lt!19189 () Unit!968)

(assert (=> d!3848 (= lt!19176 lt!19189)))

(assert (=> d!3848 (isPrefixOf!0 lt!19193 (_2!741 lt!18304))))

(assert (=> d!3848 (= lt!19189 (lemmaIsPrefixTransitive!0 lt!19193 (_2!741 lt!18270) (_2!741 lt!18304)))))

(declare-fun lt!19179 () Unit!968)

(declare-fun e!7283 () Unit!968)

(assert (=> d!3848 (= lt!19179 e!7283)))

(declare-fun c!872 () Bool)

(assert (=> d!3848 (= c!872 (not (= (size!286 (buf!631 (_2!741 lt!18270))) #b00000000000000000000000000000000)))))

(declare-fun lt!19178 () Unit!968)

(declare-fun lt!19187 () Unit!968)

(assert (=> d!3848 (= lt!19178 lt!19187)))

(assert (=> d!3848 (isPrefixOf!0 (_2!741 lt!18304) (_2!741 lt!18304))))

(assert (=> d!3848 (= lt!19187 (lemmaIsPrefixRefl!0 (_2!741 lt!18304)))))

(declare-fun lt!19182 () Unit!968)

(declare-fun lt!19185 () Unit!968)

(assert (=> d!3848 (= lt!19182 lt!19185)))

(assert (=> d!3848 (= lt!19185 (lemmaIsPrefixRefl!0 (_2!741 lt!18304)))))

(declare-fun lt!19183 () Unit!968)

(declare-fun lt!19192 () Unit!968)

(assert (=> d!3848 (= lt!19183 lt!19192)))

(assert (=> d!3848 (isPrefixOf!0 lt!19193 lt!19193)))

(assert (=> d!3848 (= lt!19192 (lemmaIsPrefixRefl!0 lt!19193))))

(declare-fun lt!19181 () Unit!968)

(declare-fun lt!19194 () Unit!968)

(assert (=> d!3848 (= lt!19181 lt!19194)))

(assert (=> d!3848 (isPrefixOf!0 (_2!741 lt!18270) (_2!741 lt!18270))))

(assert (=> d!3848 (= lt!19194 (lemmaIsPrefixRefl!0 (_2!741 lt!18270)))))

(assert (=> d!3848 (= lt!19193 (BitStream!539 (buf!631 (_2!741 lt!18304)) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270))))))

(assert (=> d!3848 (isPrefixOf!0 (_2!741 lt!18270) (_2!741 lt!18304))))

(assert (=> d!3848 (= (reader!0 (_2!741 lt!18270) (_2!741 lt!18304)) lt!19188)))

(declare-fun b!11976 () Bool)

(declare-fun res!11574 () Bool)

(assert (=> b!11976 (=> (not res!11574) (not e!7284))))

(assert (=> b!11976 (= res!11574 (isPrefixOf!0 (_1!743 lt!19188) (_2!741 lt!18270)))))

(declare-fun b!11977 () Bool)

(declare-fun lt!19190 () Unit!968)

(assert (=> b!11977 (= e!7283 lt!19190)))

(declare-fun lt!19186 () (_ BitVec 64))

(assert (=> b!11977 (= lt!19186 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19191 () (_ BitVec 64))

(assert (=> b!11977 (= lt!19191 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18270))) (currentByte!1703 (_2!741 lt!18270)) (currentBit!1698 (_2!741 lt!18270))))))

(assert (=> b!11977 (= lt!19190 (arrayBitRangesEqSymmetric!0 (buf!631 (_2!741 lt!18270)) (buf!631 (_2!741 lt!18304)) lt!19186 lt!19191))))

(assert (=> b!11977 (arrayBitRangesEq!0 (buf!631 (_2!741 lt!18304)) (buf!631 (_2!741 lt!18270)) lt!19186 lt!19191)))

(declare-fun b!11978 () Bool)

(declare-fun Unit!1026 () Unit!968)

(assert (=> b!11978 (= e!7283 Unit!1026)))

(assert (= (and d!3848 c!872) b!11977))

(assert (= (and d!3848 (not c!872)) b!11978))

(assert (= (and d!3848 res!11576) b!11976))

(assert (= (and b!11976 res!11574) b!11974))

(assert (= (and b!11974 res!11575) b!11975))

(declare-fun m!17919 () Bool)

(assert (=> b!11975 m!17919))

(assert (=> b!11975 m!16871))

(assert (=> b!11975 m!16857))

(declare-fun m!17921 () Bool)

(assert (=> b!11976 m!17921))

(declare-fun m!17923 () Bool)

(assert (=> d!3848 m!17923))

(declare-fun m!17925 () Bool)

(assert (=> d!3848 m!17925))

(assert (=> d!3848 m!17773))

(declare-fun m!17927 () Bool)

(assert (=> d!3848 m!17927))

(assert (=> d!3848 m!17777))

(declare-fun m!17929 () Bool)

(assert (=> d!3848 m!17929))

(declare-fun m!17931 () Bool)

(assert (=> d!3848 m!17931))

(declare-fun m!17933 () Bool)

(assert (=> d!3848 m!17933))

(declare-fun m!17935 () Bool)

(assert (=> d!3848 m!17935))

(assert (=> d!3848 m!17823))

(assert (=> d!3848 m!17821))

(assert (=> b!11977 m!16857))

(declare-fun m!17937 () Bool)

(assert (=> b!11977 m!17937))

(declare-fun m!17939 () Bool)

(assert (=> b!11977 m!17939))

(declare-fun m!17941 () Bool)

(assert (=> b!11974 m!17941))

(assert (=> b!11508 d!3848))

(declare-fun d!3850 () Bool)

(assert (=> d!3850 (isPrefixOf!0 thiss!1486 (_2!741 lt!18304))))

(declare-fun lt!19196 () Unit!968)

(assert (=> d!3850 (= lt!19196 (choose!30 thiss!1486 (_2!741 lt!18270) (_2!741 lt!18304)))))

(assert (=> d!3850 (isPrefixOf!0 thiss!1486 (_2!741 lt!18270))))

(assert (=> d!3850 (= (lemmaIsPrefixTransitive!0 thiss!1486 (_2!741 lt!18270) (_2!741 lt!18304)) lt!19196)))

(declare-fun bs!1088 () Bool)

(assert (= bs!1088 d!3850))

(assert (=> bs!1088 m!16861))

(declare-fun m!17943 () Bool)

(assert (=> bs!1088 m!17943))

(declare-fun m!17945 () Bool)

(assert (=> bs!1088 m!17945))

(assert (=> b!11508 d!3850))

(declare-fun b!11981 () Bool)

(declare-fun e!7285 () Bool)

(declare-fun lt!19198 () List!165)

(assert (=> b!11981 (= e!7285 (isEmpty!37 lt!19198))))

(declare-fun d!3852 () Bool)

(assert (=> d!3852 e!7285))

(declare-fun c!874 () Bool)

(assert (=> d!3852 (= c!874 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7286 () tuple2!1408)

(assert (=> d!3852 (= lt!19198 (_1!750 e!7286))))

(declare-fun c!873 () Bool)

(assert (=> d!3852 (= c!873 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3852 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3852 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!18304) (_1!743 lt!18295) (bvsub (bvadd from!367 nBits!460) from!367)) lt!19198)))

(declare-fun b!11982 () Bool)

(assert (=> b!11982 (= e!7285 (> (length!32 lt!19198) 0))))

(declare-fun b!11979 () Bool)

(assert (=> b!11979 (= e!7286 (tuple2!1409 Nil!162 (_1!743 lt!18295)))))

(declare-fun lt!19197 () tuple2!1410)

(declare-fun b!11980 () Bool)

(declare-fun lt!19199 () (_ BitVec 64))

(assert (=> b!11980 (= e!7286 (tuple2!1409 (Cons!161 (_1!751 lt!19197) (bitStreamReadBitsIntoList!0 (_2!741 lt!18304) (_2!751 lt!19197) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!19199))) (_2!751 lt!19197)))))

(assert (=> b!11980 (= lt!19197 (readBit!0 (_1!743 lt!18295)))))

(assert (=> b!11980 (= lt!19199 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3852 c!873) b!11979))

(assert (= (and d!3852 (not c!873)) b!11980))

(assert (= (and d!3852 c!874) b!11981))

(assert (= (and d!3852 (not c!874)) b!11982))

(declare-fun m!17947 () Bool)

(assert (=> b!11981 m!17947))

(declare-fun m!17949 () Bool)

(assert (=> b!11982 m!17949))

(declare-fun m!17951 () Bool)

(assert (=> b!11980 m!17951))

(declare-fun m!17953 () Bool)

(assert (=> b!11980 m!17953))

(assert (=> b!11508 d!3852))

(declare-fun b!11985 () Bool)

(declare-fun e!7287 () Bool)

(declare-fun lt!19201 () List!165)

(assert (=> b!11985 (= e!7287 (isEmpty!37 lt!19201))))

(declare-fun d!3854 () Bool)

(assert (=> d!3854 e!7287))

(declare-fun c!876 () Bool)

(assert (=> d!3854 (= c!876 (= (bvsub lt!18300 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7288 () tuple2!1408)

(assert (=> d!3854 (= lt!19201 (_1!750 e!7288))))

(declare-fun c!875 () Bool)

(assert (=> d!3854 (= c!875 (= (bvsub lt!18300 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3854 (bvsge (bvsub lt!18300 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3854 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!18304) (_1!743 lt!18305) (bvsub lt!18300 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!19201)))

(declare-fun b!11986 () Bool)

(assert (=> b!11986 (= e!7287 (> (length!32 lt!19201) 0))))

(declare-fun b!11983 () Bool)

(assert (=> b!11983 (= e!7288 (tuple2!1409 Nil!162 (_1!743 lt!18305)))))

(declare-fun lt!19202 () (_ BitVec 64))

(declare-fun lt!19200 () tuple2!1410)

(declare-fun b!11984 () Bool)

(assert (=> b!11984 (= e!7288 (tuple2!1409 (Cons!161 (_1!751 lt!19200) (bitStreamReadBitsIntoList!0 (_2!741 lt!18304) (_2!751 lt!19200) (bvsub (bvsub lt!18300 #b0000000000000000000000000000000000000000000000000000000000000001) lt!19202))) (_2!751 lt!19200)))))

(assert (=> b!11984 (= lt!19200 (readBit!0 (_1!743 lt!18305)))))

(assert (=> b!11984 (= lt!19202 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3854 c!875) b!11983))

(assert (= (and d!3854 (not c!875)) b!11984))

(assert (= (and d!3854 c!876) b!11985))

(assert (= (and d!3854 (not c!876)) b!11986))

(declare-fun m!17955 () Bool)

(assert (=> b!11985 m!17955))

(declare-fun m!17957 () Bool)

(assert (=> b!11986 m!17957))

(declare-fun m!17959 () Bool)

(assert (=> b!11984 m!17959))

(assert (=> b!11984 m!17917))

(assert (=> b!11508 d!3854))

(declare-fun d!3856 () Bool)

(declare-fun res!11579 () Bool)

(declare-fun e!7289 () Bool)

(assert (=> d!3856 (=> (not res!11579) (not e!7289))))

(assert (=> d!3856 (= res!11579 (= (size!286 (buf!631 thiss!1486)) (size!286 (buf!631 (_2!741 lt!18304)))))))

(assert (=> d!3856 (= (isPrefixOf!0 thiss!1486 (_2!741 lt!18304)) e!7289)))

(declare-fun b!11987 () Bool)

(declare-fun res!11578 () Bool)

(assert (=> b!11987 (=> (not res!11578) (not e!7289))))

(assert (=> b!11987 (= res!11578 (bvsle (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)) (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18304))) (currentByte!1703 (_2!741 lt!18304)) (currentBit!1698 (_2!741 lt!18304)))))))

(declare-fun b!11988 () Bool)

(declare-fun e!7290 () Bool)

(assert (=> b!11988 (= e!7289 e!7290)))

(declare-fun res!11577 () Bool)

(assert (=> b!11988 (=> res!11577 e!7290)))

(assert (=> b!11988 (= res!11577 (= (size!286 (buf!631 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!11989 () Bool)

(assert (=> b!11989 (= e!7290 (arrayBitRangesEq!0 (buf!631 thiss!1486) (buf!631 (_2!741 lt!18304)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(assert (= (and d!3856 res!11579) b!11987))

(assert (= (and b!11987 res!11578) b!11988))

(assert (= (and b!11988 (not res!11577)) b!11989))

(assert (=> b!11987 m!16469))

(assert (=> b!11987 m!16871))

(assert (=> b!11989 m!16469))

(assert (=> b!11989 m!16469))

(declare-fun m!17961 () Bool)

(assert (=> b!11989 m!17961))

(assert (=> b!11508 d!3856))

(declare-fun d!3858 () Bool)

(declare-fun e!7291 () Bool)

(assert (=> d!3858 e!7291))

(declare-fun res!11580 () Bool)

(assert (=> d!3858 (=> (not res!11580) (not e!7291))))

(declare-fun lt!19203 () (_ BitVec 64))

(declare-fun lt!19208 () (_ BitVec 64))

(declare-fun lt!19206 () (_ BitVec 64))

(assert (=> d!3858 (= res!11580 (= lt!19203 (bvsub lt!19206 lt!19208)))))

(assert (=> d!3858 (or (= (bvand lt!19206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19208 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19206 lt!19208) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3858 (= lt!19208 (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18304)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18304))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18304)))))))

(declare-fun lt!19204 () (_ BitVec 64))

(declare-fun lt!19207 () (_ BitVec 64))

(assert (=> d!3858 (= lt!19206 (bvmul lt!19204 lt!19207))))

(assert (=> d!3858 (or (= lt!19204 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19207 (bvsdiv (bvmul lt!19204 lt!19207) lt!19204)))))

(assert (=> d!3858 (= lt!19207 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3858 (= lt!19204 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18304)))))))

(assert (=> d!3858 (= lt!19203 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18304))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18304)))))))

(assert (=> d!3858 (invariant!0 (currentBit!1698 (_2!741 lt!18304)) (currentByte!1703 (_2!741 lt!18304)) (size!286 (buf!631 (_2!741 lt!18304))))))

(assert (=> d!3858 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18304))) (currentByte!1703 (_2!741 lt!18304)) (currentBit!1698 (_2!741 lt!18304))) lt!19203)))

(declare-fun b!11990 () Bool)

(declare-fun res!11581 () Bool)

(assert (=> b!11990 (=> (not res!11581) (not e!7291))))

(assert (=> b!11990 (= res!11581 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19203))))

(declare-fun b!11991 () Bool)

(declare-fun lt!19205 () (_ BitVec 64))

(assert (=> b!11991 (= e!7291 (bvsle lt!19203 (bvmul lt!19205 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!11991 (or (= lt!19205 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19205 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19205)))))

(assert (=> b!11991 (= lt!19205 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18304)))))))

(assert (= (and d!3858 res!11580) b!11990))

(assert (= (and b!11990 res!11581) b!11991))

(declare-fun m!17963 () Bool)

(assert (=> d!3858 m!17963))

(declare-fun m!17965 () Bool)

(assert (=> d!3858 m!17965))

(assert (=> b!11508 d!3858))

(declare-fun d!3860 () Bool)

(assert (=> d!3860 (= (head!63 (bitStreamReadBitsIntoList!0 (_2!741 lt!18270) (_1!743 lt!18272) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!280 (bitStreamReadBitsIntoList!0 (_2!741 lt!18270) (_1!743 lt!18272) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!11508 d!3860))

(declare-fun b!12009 () Bool)

(declare-fun res!11603 () Bool)

(declare-fun e!7303 () Bool)

(assert (=> b!12009 (=> (not res!11603) (not e!7303))))

(declare-fun lt!19242 () tuple2!1390)

(assert (=> b!12009 (= res!11603 (isPrefixOf!0 thiss!1486 (_2!741 lt!19242)))))

(declare-fun b!12010 () Bool)

(declare-fun e!7302 () Bool)

(assert (=> b!12010 (= e!7303 e!7302)))

(declare-fun res!11601 () Bool)

(assert (=> b!12010 (=> (not res!11601) (not e!7302))))

(declare-fun lt!19233 () Bool)

(declare-fun lt!19238 () tuple2!1422)

(assert (=> b!12010 (= res!11601 (and (= (_2!762 lt!19238) lt!19233) (= (_1!762 lt!19238) (_2!741 lt!19242))))))

(declare-fun readerFrom!0 (BitStream!538 (_ BitVec 32) (_ BitVec 32)) BitStream!538)

(assert (=> b!12010 (= lt!19238 (readBitPure!0 (readerFrom!0 (_2!741 lt!19242) (currentBit!1698 thiss!1486) (currentByte!1703 thiss!1486))))))

(declare-fun b!12011 () Bool)

(assert (=> b!12011 (= e!7302 (= (bitIndex!0 (size!286 (buf!631 (_1!762 lt!19238))) (currentByte!1703 (_1!762 lt!19238)) (currentBit!1698 (_1!762 lt!19238))) (bitIndex!0 (size!286 (buf!631 (_2!741 lt!19242))) (currentByte!1703 (_2!741 lt!19242)) (currentBit!1698 (_2!741 lt!19242)))))))

(declare-fun b!12012 () Bool)

(declare-fun e!7300 () Bool)

(declare-fun e!7301 () Bool)

(assert (=> b!12012 (= e!7300 e!7301)))

(declare-fun res!11599 () Bool)

(assert (=> b!12012 (=> (not res!11599) (not e!7301))))

(declare-fun lt!19234 () tuple2!1390)

(declare-fun lt!19235 () tuple2!1422)

(declare-fun lt!19241 () (_ BitVec 8))

(assert (=> b!12012 (= res!11599 (and (= (_2!762 lt!19235) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!19241)) #b00000000000000000000000000000000))) (= (_1!762 lt!19235) (_2!741 lt!19234))))))

(declare-fun lt!19236 () tuple2!1392)

(declare-fun lt!19244 () BitStream!538)

(assert (=> b!12012 (= lt!19236 (readBits!0 lt!19244 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!12012 (= lt!19235 (readBitPure!0 lt!19244))))

(assert (=> b!12012 (= lt!19244 (readerFrom!0 (_2!741 lt!19234) (currentBit!1698 thiss!1486) (currentByte!1703 thiss!1486)))))

(declare-fun d!3862 () Bool)

(assert (=> d!3862 e!7300))

(declare-fun res!11604 () Bool)

(assert (=> d!3862 (=> (not res!11604) (not e!7300))))

(assert (=> d!3862 (= res!11604 (= (size!286 (buf!631 (_2!741 lt!19234))) (size!286 (buf!631 thiss!1486))))))

(declare-fun lt!19243 () array!663)

(assert (=> d!3862 (= lt!19241 (select (arr!706 lt!19243) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!3862 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!286 lt!19243)))))

(assert (=> d!3862 (= lt!19243 (array!664 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!19237 () tuple2!1390)

(assert (=> d!3862 (= lt!19234 (tuple2!1391 (_1!741 lt!19237) (_2!741 lt!19237)))))

(assert (=> d!3862 (= lt!19237 lt!19242)))

(assert (=> d!3862 e!7303))

(declare-fun res!11600 () Bool)

(assert (=> d!3862 (=> (not res!11600) (not e!7303))))

(assert (=> d!3862 (= res!11600 (= (size!286 (buf!631 thiss!1486)) (size!286 (buf!631 (_2!741 lt!19242)))))))

(declare-fun appendBit!0 (BitStream!538 Bool) tuple2!1390)

(assert (=> d!3862 (= lt!19242 (appendBit!0 thiss!1486 lt!19233))))

(assert (=> d!3862 (= lt!19233 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!3862 (and (bvsge ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!3862 (= (appendBitFromByte!0 thiss!1486 (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!19234)))

(declare-fun b!12013 () Bool)

(assert (=> b!12013 (= e!7301 (= (bitIndex!0 (size!286 (buf!631 (_1!762 lt!19235))) (currentByte!1703 (_1!762 lt!19235)) (currentBit!1698 (_1!762 lt!19235))) (bitIndex!0 (size!286 (buf!631 (_2!741 lt!19234))) (currentByte!1703 (_2!741 lt!19234)) (currentBit!1698 (_2!741 lt!19234)))))))

(declare-fun b!12014 () Bool)

(declare-fun res!11605 () Bool)

(assert (=> b!12014 (=> (not res!11605) (not e!7300))))

(assert (=> b!12014 (= res!11605 (isPrefixOf!0 thiss!1486 (_2!741 lt!19234)))))

(declare-fun b!12015 () Bool)

(declare-fun res!11602 () Bool)

(assert (=> b!12015 (=> (not res!11602) (not e!7303))))

(assert (=> b!12015 (= res!11602 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!19242))) (currentByte!1703 (_2!741 lt!19242)) (currentBit!1698 (_2!741 lt!19242))) (bvadd (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!12016 () Bool)

(declare-fun res!11598 () Bool)

(assert (=> b!12016 (=> (not res!11598) (not e!7300))))

(declare-fun lt!19240 () (_ BitVec 64))

(declare-fun lt!19239 () (_ BitVec 64))

(assert (=> b!12016 (= res!11598 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!19234))) (currentByte!1703 (_2!741 lt!19234)) (currentBit!1698 (_2!741 lt!19234))) (bvadd lt!19240 lt!19239)))))

(assert (=> b!12016 (or (not (= (bvand lt!19240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19239 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!19240 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!19240 lt!19239) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12016 (= lt!19239 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!12016 (= lt!19240 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(assert (= (and d!3862 res!11600) b!12015))

(assert (= (and b!12015 res!11602) b!12009))

(assert (= (and b!12009 res!11603) b!12010))

(assert (= (and b!12010 res!11601) b!12011))

(assert (= (and d!3862 res!11604) b!12016))

(assert (= (and b!12016 res!11598) b!12014))

(assert (= (and b!12014 res!11605) b!12012))

(assert (= (and b!12012 res!11599) b!12013))

(declare-fun m!17967 () Bool)

(assert (=> b!12016 m!17967))

(assert (=> b!12016 m!16469))

(declare-fun m!17969 () Bool)

(assert (=> d!3862 m!17969))

(declare-fun m!17971 () Bool)

(assert (=> d!3862 m!17971))

(assert (=> d!3862 m!16551))

(declare-fun m!17973 () Bool)

(assert (=> b!12015 m!17973))

(assert (=> b!12015 m!16469))

(declare-fun m!17975 () Bool)

(assert (=> b!12013 m!17975))

(assert (=> b!12013 m!17967))

(declare-fun m!17977 () Bool)

(assert (=> b!12010 m!17977))

(assert (=> b!12010 m!17977))

(declare-fun m!17979 () Bool)

(assert (=> b!12010 m!17979))

(declare-fun m!17981 () Bool)

(assert (=> b!12011 m!17981))

(assert (=> b!12011 m!17973))

(declare-fun m!17983 () Bool)

(assert (=> b!12009 m!17983))

(declare-fun m!17985 () Bool)

(assert (=> b!12012 m!17985))

(declare-fun m!17987 () Bool)

(assert (=> b!12012 m!17987))

(declare-fun m!17989 () Bool)

(assert (=> b!12012 m!17989))

(declare-fun m!17991 () Bool)

(assert (=> b!12014 m!17991))

(assert (=> b!11508 d!3862))

(declare-fun d!3864 () Bool)

(declare-fun c!877 () Bool)

(assert (=> d!3864 (= c!877 (= (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7304 () List!165)

(assert (=> d!3864 (= (byteArrayBitContentToList!0 (_2!741 lt!17680) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)) e!7304)))

(declare-fun b!12017 () Bool)

(assert (=> b!12017 (= e!7304 Nil!162)))

(declare-fun b!12018 () Bool)

(assert (=> b!12018 (= e!7304 (Cons!161 (not (= (bvand ((_ sign_extend 24) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!741 lt!17680) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3864 c!877) b!12017))

(assert (= (and d!3864 (not c!877)) b!12018))

(assert (=> b!12018 m!17575))

(assert (=> b!12018 m!17577))

(declare-fun m!17993 () Bool)

(assert (=> b!12018 m!17993))

(assert (=> b!11334 d!3864))

(assert (=> d!3520 d!3790))

(assert (=> d!3520 d!3740))

(declare-fun d!3866 () Bool)

(assert (=> d!3866 (= (invariant!0 (currentBit!1698 (_2!742 lt!17836)) (currentByte!1703 (_2!742 lt!17836)) (size!286 (buf!631 (_2!742 lt!17836)))) (and (bvsge (currentBit!1698 (_2!742 lt!17836)) #b00000000000000000000000000000000) (bvslt (currentBit!1698 (_2!742 lt!17836)) #b00000000000000000000000000001000) (bvsge (currentByte!1703 (_2!742 lt!17836)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1703 (_2!742 lt!17836)) (size!286 (buf!631 (_2!742 lt!17836)))) (and (= (currentBit!1698 (_2!742 lt!17836)) #b00000000000000000000000000000000) (= (currentByte!1703 (_2!742 lt!17836)) (size!286 (buf!631 (_2!742 lt!17836))))))))))

(assert (=> b!11403 d!3866))

(declare-fun d!3868 () Bool)

(declare-fun e!7305 () Bool)

(assert (=> d!3868 e!7305))

(declare-fun res!11606 () Bool)

(assert (=> d!3868 (=> (not res!11606) (not e!7305))))

(declare-fun lt!19245 () (_ BitVec 64))

(declare-fun lt!19250 () (_ BitVec 64))

(declare-fun lt!19248 () (_ BitVec 64))

(assert (=> d!3868 (= res!11606 (= lt!19245 (bvsub lt!19248 lt!19250)))))

(assert (=> d!3868 (or (= (bvand lt!19248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19250 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19248 lt!19250) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3868 (= lt!19250 (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!742 lt!17836)))) ((_ sign_extend 32) (currentByte!1703 (_2!742 lt!17836))) ((_ sign_extend 32) (currentBit!1698 (_2!742 lt!17836)))))))

(declare-fun lt!19246 () (_ BitVec 64))

(declare-fun lt!19249 () (_ BitVec 64))

(assert (=> d!3868 (= lt!19248 (bvmul lt!19246 lt!19249))))

(assert (=> d!3868 (or (= lt!19246 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19249 (bvsdiv (bvmul lt!19246 lt!19249) lt!19246)))))

(assert (=> d!3868 (= lt!19249 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3868 (= lt!19246 ((_ sign_extend 32) (size!286 (buf!631 (_2!742 lt!17836)))))))

(assert (=> d!3868 (= lt!19245 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1703 (_2!742 lt!17836))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1698 (_2!742 lt!17836)))))))

(assert (=> d!3868 (invariant!0 (currentBit!1698 (_2!742 lt!17836)) (currentByte!1703 (_2!742 lt!17836)) (size!286 (buf!631 (_2!742 lt!17836))))))

(assert (=> d!3868 (= (bitIndex!0 (size!286 (buf!631 (_2!742 lt!17836))) (currentByte!1703 (_2!742 lt!17836)) (currentBit!1698 (_2!742 lt!17836))) lt!19245)))

(declare-fun b!12019 () Bool)

(declare-fun res!11607 () Bool)

(assert (=> b!12019 (=> (not res!11607) (not e!7305))))

(assert (=> b!12019 (= res!11607 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19245))))

(declare-fun b!12020 () Bool)

(declare-fun lt!19247 () (_ BitVec 64))

(assert (=> b!12020 (= e!7305 (bvsle lt!19245 (bvmul lt!19247 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12020 (or (= lt!19247 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19247 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19247)))))

(assert (=> b!12020 (= lt!19247 ((_ sign_extend 32) (size!286 (buf!631 (_2!742 lt!17836)))))))

(assert (= (and d!3868 res!11606) b!12019))

(assert (= (and b!12019 res!11607) b!12020))

(declare-fun m!17995 () Bool)

(assert (=> d!3868 m!17995))

(assert (=> d!3868 m!16623))

(assert (=> b!11404 d!3868))

(declare-fun d!3870 () Bool)

(declare-fun e!7306 () Bool)

(assert (=> d!3870 e!7306))

(declare-fun res!11608 () Bool)

(assert (=> d!3870 (=> (not res!11608) (not e!7306))))

(declare-fun lt!19251 () (_ BitVec 64))

(declare-fun lt!19256 () (_ BitVec 64))

(declare-fun lt!19254 () (_ BitVec 64))

(assert (=> d!3870 (= res!11608 (= lt!19251 (bvsub lt!19254 lt!19256)))))

(assert (=> d!3870 (or (= (bvand lt!19254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19256 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19254 lt!19256) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3870 (= lt!19256 (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_1!743 lt!17683)))) ((_ sign_extend 32) (currentByte!1703 (_1!743 lt!17683))) ((_ sign_extend 32) (currentBit!1698 (_1!743 lt!17683)))))))

(declare-fun lt!19252 () (_ BitVec 64))

(declare-fun lt!19255 () (_ BitVec 64))

(assert (=> d!3870 (= lt!19254 (bvmul lt!19252 lt!19255))))

(assert (=> d!3870 (or (= lt!19252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19255 (bvsdiv (bvmul lt!19252 lt!19255) lt!19252)))))

(assert (=> d!3870 (= lt!19255 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3870 (= lt!19252 ((_ sign_extend 32) (size!286 (buf!631 (_1!743 lt!17683)))))))

(assert (=> d!3870 (= lt!19251 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1703 (_1!743 lt!17683))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1698 (_1!743 lt!17683)))))))

(assert (=> d!3870 (invariant!0 (currentBit!1698 (_1!743 lt!17683)) (currentByte!1703 (_1!743 lt!17683)) (size!286 (buf!631 (_1!743 lt!17683))))))

(assert (=> d!3870 (= (bitIndex!0 (size!286 (buf!631 (_1!743 lt!17683))) (currentByte!1703 (_1!743 lt!17683)) (currentBit!1698 (_1!743 lt!17683))) lt!19251)))

(declare-fun b!12021 () Bool)

(declare-fun res!11609 () Bool)

(assert (=> b!12021 (=> (not res!11609) (not e!7306))))

(assert (=> b!12021 (= res!11609 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19251))))

(declare-fun b!12022 () Bool)

(declare-fun lt!19253 () (_ BitVec 64))

(assert (=> b!12022 (= e!7306 (bvsle lt!19251 (bvmul lt!19253 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12022 (or (= lt!19253 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19253 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19253)))))

(assert (=> b!12022 (= lt!19253 ((_ sign_extend 32) (size!286 (buf!631 (_1!743 lt!17683)))))))

(assert (= (and d!3870 res!11608) b!12021))

(assert (= (and b!12021 res!11609) b!12022))

(declare-fun m!17997 () Bool)

(assert (=> d!3870 m!17997))

(declare-fun m!17999 () Bool)

(assert (=> d!3870 m!17999))

(assert (=> b!11404 d!3870))

(declare-fun d!3872 () Bool)

(declare-fun e!7307 () Bool)

(assert (=> d!3872 e!7307))

(declare-fun res!11610 () Bool)

(assert (=> d!3872 (=> (not res!11610) (not e!7307))))

(declare-fun lt!19262 () (_ BitVec 64))

(declare-fun lt!19260 () (_ BitVec 64))

(declare-fun lt!19257 () (_ BitVec 64))

(assert (=> d!3872 (= res!11610 (= lt!19257 (bvsub lt!19260 lt!19262)))))

(assert (=> d!3872 (or (= (bvand lt!19260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19262 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19260 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19260 lt!19262) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3872 (= lt!19262 (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18271)))) ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18271))) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18271)))))))

(declare-fun lt!19258 () (_ BitVec 64))

(declare-fun lt!19261 () (_ BitVec 64))

(assert (=> d!3872 (= lt!19260 (bvmul lt!19258 lt!19261))))

(assert (=> d!3872 (or (= lt!19258 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!19261 (bvsdiv (bvmul lt!19258 lt!19261) lt!19258)))))

(assert (=> d!3872 (= lt!19261 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3872 (= lt!19258 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18271)))))))

(assert (=> d!3872 (= lt!19257 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1703 (_2!741 lt!18271))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1698 (_2!741 lt!18271)))))))

(assert (=> d!3872 (invariant!0 (currentBit!1698 (_2!741 lt!18271)) (currentByte!1703 (_2!741 lt!18271)) (size!286 (buf!631 (_2!741 lt!18271))))))

(assert (=> d!3872 (= (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18271))) (currentByte!1703 (_2!741 lt!18271)) (currentBit!1698 (_2!741 lt!18271))) lt!19257)))

(declare-fun b!12023 () Bool)

(declare-fun res!11611 () Bool)

(assert (=> b!12023 (=> (not res!11611) (not e!7307))))

(assert (=> b!12023 (= res!11611 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!19257))))

(declare-fun b!12024 () Bool)

(declare-fun lt!19259 () (_ BitVec 64))

(assert (=> b!12024 (= e!7307 (bvsle lt!19257 (bvmul lt!19259 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!12024 (or (= lt!19259 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!19259 #b0000000000000000000000000000000000000000000000000000000000001000) lt!19259)))))

(assert (=> b!12024 (= lt!19259 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18271)))))))

(assert (= (and d!3872 res!11610) b!12023))

(assert (= (and b!12023 res!11611) b!12024))

(declare-fun m!18001 () Bool)

(assert (=> d!3872 m!18001))

(assert (=> d!3872 m!16919))

(assert (=> d!3500 d!3872))

(assert (=> d!3500 d!3520))

(assert (=> d!3500 d!3756))

(assert (=> d!3500 d!3774))

(declare-fun d!3874 () Bool)

(assert (=> d!3874 (= (invariant!0 (currentBit!1698 (_2!741 lt!18271)) (currentByte!1703 (_2!741 lt!18271)) (size!286 (buf!631 (_2!741 lt!18271)))) (and (bvsge (currentBit!1698 (_2!741 lt!18271)) #b00000000000000000000000000000000) (bvslt (currentBit!1698 (_2!741 lt!18271)) #b00000000000000000000000000001000) (bvsge (currentByte!1703 (_2!741 lt!18271)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1703 (_2!741 lt!18271)) (size!286 (buf!631 (_2!741 lt!18271)))) (and (= (currentBit!1698 (_2!741 lt!18271)) #b00000000000000000000000000000000) (= (currentByte!1703 (_2!741 lt!18271)) (size!286 (buf!631 (_2!741 lt!18271))))))))))

(assert (=> b!11505 d!3874))

(declare-fun b!12025 () Bool)

(declare-fun res!11613 () Bool)

(declare-fun e!7309 () Bool)

(assert (=> b!12025 (=> (not res!11613) (not e!7309))))

(declare-fun lt!19275 () tuple2!1394)

(assert (=> b!12025 (= res!11613 (isPrefixOf!0 (_2!743 lt!19275) (_2!741 lt!18271)))))

(declare-fun b!12026 () Bool)

(declare-fun lt!19282 () (_ BitVec 64))

(declare-fun lt!19267 () (_ BitVec 64))

(assert (=> b!12026 (= e!7309 (= (_1!743 lt!19275) (withMovedBitIndex!0 (_2!743 lt!19275) (bvsub lt!19282 lt!19267))))))

(assert (=> b!12026 (or (= (bvand lt!19282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!19267 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!19282 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!19282 lt!19267) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!12026 (= lt!19267 (bitIndex!0 (size!286 (buf!631 (_2!741 lt!18271))) (currentByte!1703 (_2!741 lt!18271)) (currentBit!1698 (_2!741 lt!18271))))))

(assert (=> b!12026 (= lt!19282 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(declare-fun d!3876 () Bool)

(assert (=> d!3876 e!7309))

(declare-fun res!11614 () Bool)

(assert (=> d!3876 (=> (not res!11614) (not e!7309))))

(assert (=> d!3876 (= res!11614 (isPrefixOf!0 (_1!743 lt!19275) (_2!743 lt!19275)))))

(declare-fun lt!19280 () BitStream!538)

(assert (=> d!3876 (= lt!19275 (tuple2!1395 lt!19280 (_2!741 lt!18271)))))

(declare-fun lt!19271 () Unit!968)

(declare-fun lt!19264 () Unit!968)

(assert (=> d!3876 (= lt!19271 lt!19264)))

(assert (=> d!3876 (isPrefixOf!0 lt!19280 (_2!741 lt!18271))))

(assert (=> d!3876 (= lt!19264 (lemmaIsPrefixTransitive!0 lt!19280 (_2!741 lt!18271) (_2!741 lt!18271)))))

(declare-fun lt!19263 () Unit!968)

(declare-fun lt!19276 () Unit!968)

(assert (=> d!3876 (= lt!19263 lt!19276)))

(assert (=> d!3876 (isPrefixOf!0 lt!19280 (_2!741 lt!18271))))

(assert (=> d!3876 (= lt!19276 (lemmaIsPrefixTransitive!0 lt!19280 thiss!1486 (_2!741 lt!18271)))))

(declare-fun lt!19266 () Unit!968)

(declare-fun e!7308 () Unit!968)

(assert (=> d!3876 (= lt!19266 e!7308)))

(declare-fun c!878 () Bool)

(assert (=> d!3876 (= c!878 (not (= (size!286 (buf!631 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!19265 () Unit!968)

(declare-fun lt!19274 () Unit!968)

(assert (=> d!3876 (= lt!19265 lt!19274)))

(assert (=> d!3876 (isPrefixOf!0 (_2!741 lt!18271) (_2!741 lt!18271))))

(assert (=> d!3876 (= lt!19274 (lemmaIsPrefixRefl!0 (_2!741 lt!18271)))))

(declare-fun lt!19269 () Unit!968)

(declare-fun lt!19272 () Unit!968)

(assert (=> d!3876 (= lt!19269 lt!19272)))

(assert (=> d!3876 (= lt!19272 (lemmaIsPrefixRefl!0 (_2!741 lt!18271)))))

(declare-fun lt!19270 () Unit!968)

(declare-fun lt!19279 () Unit!968)

(assert (=> d!3876 (= lt!19270 lt!19279)))

(assert (=> d!3876 (isPrefixOf!0 lt!19280 lt!19280)))

(assert (=> d!3876 (= lt!19279 (lemmaIsPrefixRefl!0 lt!19280))))

(declare-fun lt!19268 () Unit!968)

(declare-fun lt!19281 () Unit!968)

(assert (=> d!3876 (= lt!19268 lt!19281)))

(assert (=> d!3876 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3876 (= lt!19281 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3876 (= lt!19280 (BitStream!539 (buf!631 (_2!741 lt!18271)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(assert (=> d!3876 (isPrefixOf!0 thiss!1486 (_2!741 lt!18271))))

(assert (=> d!3876 (= (reader!0 thiss!1486 (_2!741 lt!18271)) lt!19275)))

(declare-fun b!12027 () Bool)

(declare-fun res!11612 () Bool)

(assert (=> b!12027 (=> (not res!11612) (not e!7309))))

(assert (=> b!12027 (= res!11612 (isPrefixOf!0 (_1!743 lt!19275) thiss!1486))))

(declare-fun b!12028 () Bool)

(declare-fun lt!19277 () Unit!968)

(assert (=> b!12028 (= e!7308 lt!19277)))

(declare-fun lt!19273 () (_ BitVec 64))

(assert (=> b!12028 (= lt!19273 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19278 () (_ BitVec 64))

(assert (=> b!12028 (= lt!19278 (bitIndex!0 (size!286 (buf!631 thiss!1486)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486)))))

(assert (=> b!12028 (= lt!19277 (arrayBitRangesEqSymmetric!0 (buf!631 thiss!1486) (buf!631 (_2!741 lt!18271)) lt!19273 lt!19278))))

(assert (=> b!12028 (arrayBitRangesEq!0 (buf!631 (_2!741 lt!18271)) (buf!631 thiss!1486) lt!19273 lt!19278)))

(declare-fun b!12029 () Bool)

(declare-fun Unit!1027 () Unit!968)

(assert (=> b!12029 (= e!7308 Unit!1027)))

(assert (= (and d!3876 c!878) b!12028))

(assert (= (and d!3876 (not c!878)) b!12029))

(assert (= (and d!3876 res!11614) b!12027))

(assert (= (and b!12027 res!11612) b!12025))

(assert (= (and b!12025 res!11613) b!12026))

(declare-fun m!18003 () Bool)

(assert (=> b!12026 m!18003))

(assert (=> b!12026 m!16855))

(assert (=> b!12026 m!16469))

(declare-fun m!18005 () Bool)

(assert (=> b!12027 m!18005))

(declare-fun m!18007 () Bool)

(assert (=> d!3876 m!18007))

(assert (=> d!3876 m!16935))

(declare-fun m!18009 () Bool)

(assert (=> d!3876 m!18009))

(declare-fun m!18011 () Bool)

(assert (=> d!3876 m!18011))

(declare-fun m!18013 () Bool)

(assert (=> d!3876 m!18013))

(declare-fun m!18015 () Bool)

(assert (=> d!3876 m!18015))

(declare-fun m!18017 () Bool)

(assert (=> d!3876 m!18017))

(declare-fun m!18019 () Bool)

(assert (=> d!3876 m!18019))

(declare-fun m!18021 () Bool)

(assert (=> d!3876 m!18021))

(assert (=> d!3876 m!16599))

(assert (=> d!3876 m!16601))

(assert (=> b!12028 m!16469))

(declare-fun m!18023 () Bool)

(assert (=> b!12028 m!18023))

(declare-fun m!18025 () Bool)

(assert (=> b!12028 m!18025))

(declare-fun m!18027 () Bool)

(assert (=> b!12025 m!18027))

(assert (=> b!11506 d!3876))

(declare-fun d!3878 () Bool)

(declare-fun c!879 () Bool)

(assert (=> d!3878 (= c!879 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7310 () List!165)

(assert (=> d!3878 (= (byteArrayBitContentToList!0 (_2!741 lt!18271) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)) e!7310)))

(declare-fun b!12030 () Bool)

(assert (=> b!12030 (= e!7310 Nil!162)))

(declare-fun b!12031 () Bool)

(assert (=> b!12031 (= e!7310 (Cons!161 (not (= (bvand ((_ sign_extend 24) (select (arr!706 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!741 lt!18271) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3878 c!879) b!12030))

(assert (= (and d!3878 (not c!879)) b!12031))

(assert (=> b!12031 m!16549))

(assert (=> b!12031 m!16551))

(declare-fun m!18029 () Bool)

(assert (=> b!12031 m!18029))

(assert (=> b!11506 d!3878))

(declare-fun d!3880 () Bool)

(assert (=> d!3880 (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18271)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) lt!18303)))

(declare-fun lt!19283 () Unit!968)

(assert (=> d!3880 (= lt!19283 (choose!9 thiss!1486 (buf!631 (_2!741 lt!18271)) lt!18303 (BitStream!539 (buf!631 (_2!741 lt!18271)) (currentByte!1703 thiss!1486) (currentBit!1698 thiss!1486))))))

(assert (=> d!3880 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!631 (_2!741 lt!18271)) lt!18303) lt!19283)))

(declare-fun bs!1089 () Bool)

(assert (= bs!1089 d!3880))

(assert (=> bs!1089 m!16927))

(declare-fun m!18031 () Bool)

(assert (=> bs!1089 m!18031))

(assert (=> b!11506 d!3880))

(declare-fun b!12034 () Bool)

(declare-fun e!7311 () Bool)

(declare-fun lt!19285 () List!165)

(assert (=> b!12034 (= e!7311 (isEmpty!37 lt!19285))))

(declare-fun d!3882 () Bool)

(assert (=> d!3882 e!7311))

(declare-fun c!881 () Bool)

(assert (=> d!3882 (= c!881 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!7312 () tuple2!1408)

(assert (=> d!3882 (= lt!19285 (_1!750 e!7312))))

(declare-fun c!880 () Bool)

(assert (=> d!3882 (= c!880 (= (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3882 (bvsge (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3882 (= (bitStreamReadBitsIntoList!0 (_2!741 lt!18271) (_1!743 lt!18298) (bvsub (bvadd from!367 nBits!460) from!367)) lt!19285)))

(declare-fun b!12035 () Bool)

(assert (=> b!12035 (= e!7311 (> (length!32 lt!19285) 0))))

(declare-fun b!12032 () Bool)

(assert (=> b!12032 (= e!7312 (tuple2!1409 Nil!162 (_1!743 lt!18298)))))

(declare-fun lt!19286 () (_ BitVec 64))

(declare-fun lt!19284 () tuple2!1410)

(declare-fun b!12033 () Bool)

(assert (=> b!12033 (= e!7312 (tuple2!1409 (Cons!161 (_1!751 lt!19284) (bitStreamReadBitsIntoList!0 (_2!741 lt!18271) (_2!751 lt!19284) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) lt!19286))) (_2!751 lt!19284)))))

(assert (=> b!12033 (= lt!19284 (readBit!0 (_1!743 lt!18298)))))

(assert (=> b!12033 (= lt!19286 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!3882 c!880) b!12032))

(assert (= (and d!3882 (not c!880)) b!12033))

(assert (= (and d!3882 c!881) b!12034))

(assert (= (and d!3882 (not c!881)) b!12035))

(declare-fun m!18033 () Bool)

(assert (=> b!12034 m!18033))

(declare-fun m!18035 () Bool)

(assert (=> b!12035 m!18035))

(declare-fun m!18037 () Bool)

(assert (=> b!12033 m!18037))

(declare-fun m!18039 () Bool)

(assert (=> b!12033 m!18039))

(assert (=> b!11506 d!3882))

(declare-fun d!3884 () Bool)

(assert (=> d!3884 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18271)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486)) lt!18303) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!286 (buf!631 (_2!741 lt!18271)))) ((_ sign_extend 32) (currentByte!1703 thiss!1486)) ((_ sign_extend 32) (currentBit!1698 thiss!1486))) lt!18303))))

(declare-fun bs!1090 () Bool)

(assert (= bs!1090 d!3884))

(declare-fun m!18041 () Bool)

(assert (=> bs!1090 m!18041))

(assert (=> b!11506 d!3884))

(push 1)

(assert (not b!11944))

(assert (not b!11960))

(assert (not d!3782))

(assert (not d!3870))

(assert (not b!12014))

(assert (not b!11868))

(assert (not d!3760))

(assert (not b!11864))

(assert (not b!11966))

(assert (not b!11972))

(assert (not b!11907))

(assert (not b!11962))

(assert (not d!3826))

(assert (not d!3832))

(assert (not b!11904))

(assert (not d!3750))

(assert (not d!3758))

(assert (not b!11985))

(assert (not d!3730))

(assert (not b!12009))

(assert (not b!12015))

(assert (not b!11976))

(assert (not b!11911))

(assert (not d!3742))

(assert (not b!11882))

(assert (not b!11903))

(assert (not b!11947))

(assert (not b!11855))

(assert (not b!11935))

(assert (not b!11963))

(assert (not b!11950))

(assert (not b!11973))

(assert (not bm!233))

(assert (not b!11909))

(assert (not b!12034))

(assert (not d!3842))

(assert (not b!12018))

(assert (not b!11938))

(assert (not d!3850))

(assert (not b!11984))

(assert (not b!11876))

(assert (not b!11934))

(assert (not d!3810))

(assert (not b!12031))

(assert (not b!11916))

(assert (not b!11933))

(assert (not b!11923))

(assert (not b!11982))

(assert (not b!11867))

(assert (not b!11870))

(assert (not b!11955))

(assert (not d!3872))

(assert (not b!11865))

(assert (not b!11922))

(assert (not d!3858))

(assert (not b!11968))

(assert (not b!11981))

(assert (not b!11915))

(assert (not b!11849))

(assert (not d!3818))

(assert (not b!11925))

(assert (not bm!226))

(assert (not d!3876))

(assert (not d!3816))

(assert (not b!11929))

(assert (not d!3822))

(assert (not b!11851))

(assert (not b!11974))

(assert (not b!11913))

(assert (not d!3836))

(assert (not b!11927))

(assert (not b!11848))

(assert (not b!11862))

(assert (not d!3754))

(assert (not d!3862))

(assert (not d!3768))

(assert (not b!11878))

(assert (not b!11871))

(assert (not b!12033))

(assert (not d!3762))

(assert (not d!3776))

(assert (not d!3798))

(assert (not b!12026))

(assert (not b!11924))

(assert (not b!11971))

(assert (not b!11926))

(assert (not b!11953))

(assert (not d!3824))

(assert (not b!11989))

(assert (not d!3804))

(assert (not d!3736))

(assert (not b!11941))

(assert (not b!12012))

(assert (not d!3786))

(assert (not b!11874))

(assert (not b!11945))

(assert (not b!11965))

(assert (not b!11921))

(assert (not b!11905))

(assert (not b!11961))

(assert (not d!3848))

(assert (not b!11959))

(assert (not b!11847))

(assert (not bm!232))

(assert (not b!11977))

(assert (not b!11975))

(assert (not d!3868))

(assert (not b!11857))

(assert (not d!3840))

(assert (not d!3820))

(assert (not b!11986))

(assert (not b!11980))

(assert (not b!12016))

(assert (not d!3812))

(assert (not b!11861))

(assert (not b!11957))

(assert (not b!12013))

(assert (not d!3792))

(assert (not bm!234))

(assert (not b!11846))

(assert (not b!12010))

(assert (not b!11946))

(assert (not b!12027))

(assert (not d!3880))

(assert (not b!12028))

(assert (not b!11908))

(assert (not bm!231))

(assert (not b!12025))

(assert (not b!12035))

(assert (not b!11881))

(assert (not d!3884))

(assert (not b!11859))

(assert (not b!12011))

(assert (not b!11967))

(assert (not b!11873))

(assert (not b!11880))

(assert (not b!11931))

(assert (not b!11987))

(assert (not d!3774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

