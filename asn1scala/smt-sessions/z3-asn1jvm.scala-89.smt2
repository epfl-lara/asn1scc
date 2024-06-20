; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2092 () Bool)

(assert start!2092)

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!590 0))(
  ( (array!591 (arr!668 (Array (_ BitVec 32) (_ BitVec 8))) (size!254 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!480 0))(
  ( (BitStream!481 (buf!596 array!590) (currentByte!1647 (_ BitVec 32)) (currentBit!1642 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!847 0))(
  ( (Unit!848) )
))
(declare-datatypes ((tuple2!1228 0))(
  ( (tuple2!1229 (_1!654 Unit!847) (_2!654 BitStream!480)) )
))
(declare-fun lt!15326 () tuple2!1228)

(declare-fun e!6092 () Bool)

(declare-datatypes ((tuple2!1230 0))(
  ( (tuple2!1231 (_1!655 array!590) (_2!655 BitStream!480)) )
))
(declare-fun lt!15325 () tuple2!1230)

(declare-fun srcBuffer!6 () array!590)

(declare-fun b!9937 () Bool)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun checkByteArrayBitContent!0 (BitStream!480 array!590 array!590 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9937 (= e!6092 (checkByteArrayBitContent!0 (_2!654 lt!15326) srcBuffer!6 (_1!655 lt!15325) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun lt!15322 () Unit!847)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!480 array!590 array!590 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!847)

(assert (=> b!9937 (= lt!15322 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!654 lt!15326) srcBuffer!6 (_1!655 lt!15325) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!9938 () Bool)

(declare-fun res!10050 () Bool)

(assert (=> b!9938 (=> res!10050 e!6092)))

(declare-datatypes ((List!148 0))(
  ( (Nil!145) (Cons!144 (h!263 Bool) (t!898 List!148)) )
))
(declare-fun lt!15323 () List!148)

(declare-fun byteArrayBitContentToList!0 (BitStream!480 array!590 (_ BitVec 64) (_ BitVec 64)) List!148)

(assert (=> b!9938 (= res!10050 (not (= lt!15323 (byteArrayBitContentToList!0 (_2!654 lt!15326) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!9939 () Bool)

(declare-fun res!10057 () Bool)

(declare-fun e!6090 () Bool)

(assert (=> b!9939 (=> (not res!10057) (not e!6090))))

(declare-fun thiss!1486 () BitStream!480)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9939 (= res!10057 (validate_offset_bits!1 ((_ sign_extend 32) (size!254 (buf!596 thiss!1486))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486)) nBits!460))))

(declare-fun b!9940 () Bool)

(declare-fun res!10054 () Bool)

(declare-fun e!6091 () Bool)

(assert (=> b!9940 (=> (not res!10054) (not e!6091))))

(assert (=> b!9940 (= res!10054 (= (size!254 (buf!596 thiss!1486)) (size!254 (buf!596 (_2!654 lt!15326)))))))

(declare-fun b!9942 () Bool)

(declare-fun e!6088 () Bool)

(declare-fun array_inv!246 (array!590) Bool)

(assert (=> b!9942 (= e!6088 (array_inv!246 (buf!596 thiss!1486)))))

(declare-fun b!9943 () Bool)

(declare-fun res!10055 () Bool)

(assert (=> b!9943 (=> (not res!10055) (not e!6091))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!9943 (= res!10055 (= (bitIndex!0 (size!254 (buf!596 (_2!654 lt!15326))) (currentByte!1647 (_2!654 lt!15326)) (currentBit!1642 (_2!654 lt!15326))) (bvadd (bitIndex!0 (size!254 (buf!596 thiss!1486)) (currentByte!1647 thiss!1486) (currentBit!1642 thiss!1486)) nBits!460)))))

(declare-fun b!9941 () Bool)

(assert (=> b!9941 (= e!6090 e!6091)))

(declare-fun res!10052 () Bool)

(assert (=> b!9941 (=> (not res!10052) (not e!6091))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9941 (= res!10052 (invariant!0 (currentBit!1642 (_2!654 lt!15326)) (currentByte!1647 (_2!654 lt!15326)) (size!254 (buf!596 (_2!654 lt!15326)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!480 array!590 (_ BitVec 64) (_ BitVec 64)) tuple2!1228)

(assert (=> b!9941 (= lt!15326 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!10053 () Bool)

(assert (=> start!2092 (=> (not res!10053) (not e!6090))))

(assert (=> start!2092 (= res!10053 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!254 srcBuffer!6))))))))

(assert (=> start!2092 e!6090))

(assert (=> start!2092 true))

(assert (=> start!2092 (array_inv!246 srcBuffer!6)))

(declare-fun inv!12 (BitStream!480) Bool)

(assert (=> start!2092 (and (inv!12 thiss!1486) e!6088)))

(declare-fun b!9944 () Bool)

(declare-fun res!10051 () Bool)

(assert (=> b!9944 (=> (not res!10051) (not e!6091))))

(declare-fun isPrefixOf!0 (BitStream!480 BitStream!480) Bool)

(assert (=> b!9944 (= res!10051 (isPrefixOf!0 thiss!1486 (_2!654 lt!15326)))))

(declare-fun b!9945 () Bool)

(assert (=> b!9945 (= e!6091 (not e!6092))))

(declare-fun res!10056 () Bool)

(assert (=> b!9945 (=> res!10056 e!6092)))

(assert (=> b!9945 (= res!10056 (not (= (byteArrayBitContentToList!0 (_2!654 lt!15326) (_1!655 lt!15325) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!15323)))))

(declare-datatypes ((tuple2!1232 0))(
  ( (tuple2!1233 (_1!656 BitStream!480) (_2!656 BitStream!480)) )
))
(declare-fun lt!15321 () tuple2!1232)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!480 BitStream!480 (_ BitVec 64)) List!148)

(assert (=> b!9945 (= lt!15323 (bitStreamReadBitsIntoList!0 (_2!654 lt!15326) (_1!656 lt!15321) nBits!460))))

(declare-fun readBits!0 (BitStream!480 (_ BitVec 64)) tuple2!1230)

(assert (=> b!9945 (= lt!15325 (readBits!0 (_1!656 lt!15321) nBits!460))))

(assert (=> b!9945 (validate_offset_bits!1 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15326)))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486)) nBits!460)))

(declare-fun lt!15324 () Unit!847)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!480 array!590 (_ BitVec 64)) Unit!847)

(assert (=> b!9945 (= lt!15324 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!596 (_2!654 lt!15326)) nBits!460))))

(declare-fun reader!0 (BitStream!480 BitStream!480) tuple2!1232)

(assert (=> b!9945 (= lt!15321 (reader!0 thiss!1486 (_2!654 lt!15326)))))

(assert (= (and start!2092 res!10053) b!9939))

(assert (= (and b!9939 res!10057) b!9941))

(assert (= (and b!9941 res!10052) b!9940))

(assert (= (and b!9940 res!10054) b!9943))

(assert (= (and b!9943 res!10055) b!9944))

(assert (= (and b!9944 res!10051) b!9945))

(assert (= (and b!9945 (not res!10056)) b!9938))

(assert (= (and b!9938 (not res!10050)) b!9937))

(assert (= start!2092 b!9942))

(declare-fun m!14441 () Bool)

(assert (=> b!9942 m!14441))

(declare-fun m!14443 () Bool)

(assert (=> b!9945 m!14443))

(declare-fun m!14445 () Bool)

(assert (=> b!9945 m!14445))

(declare-fun m!14447 () Bool)

(assert (=> b!9945 m!14447))

(declare-fun m!14449 () Bool)

(assert (=> b!9945 m!14449))

(declare-fun m!14451 () Bool)

(assert (=> b!9945 m!14451))

(declare-fun m!14453 () Bool)

(assert (=> b!9945 m!14453))

(declare-fun m!14455 () Bool)

(assert (=> start!2092 m!14455))

(declare-fun m!14457 () Bool)

(assert (=> start!2092 m!14457))

(declare-fun m!14459 () Bool)

(assert (=> b!9941 m!14459))

(declare-fun m!14461 () Bool)

(assert (=> b!9941 m!14461))

(declare-fun m!14463 () Bool)

(assert (=> b!9939 m!14463))

(declare-fun m!14465 () Bool)

(assert (=> b!9937 m!14465))

(declare-fun m!14467 () Bool)

(assert (=> b!9937 m!14467))

(declare-fun m!14469 () Bool)

(assert (=> b!9938 m!14469))

(declare-fun m!14471 () Bool)

(assert (=> b!9944 m!14471))

(declare-fun m!14473 () Bool)

(assert (=> b!9943 m!14473))

(declare-fun m!14475 () Bool)

(assert (=> b!9943 m!14475))

(check-sat (not b!9942) (not b!9941) (not b!9939) (not b!9944) (not b!9938) (not b!9945) (not start!2092) (not b!9937) (not b!9943))
(check-sat)
(get-model)

(declare-fun d!3180 () Bool)

(declare-fun e!6130 () Bool)

(assert (=> d!3180 e!6130))

(declare-fun res!10108 () Bool)

(assert (=> d!3180 (=> (not res!10108) (not e!6130))))

(declare-fun lt!15359 () (_ BitVec 64))

(declare-fun lt!15362 () (_ BitVec 64))

(declare-fun lt!15361 () (_ BitVec 64))

(assert (=> d!3180 (= res!10108 (= lt!15361 (bvsub lt!15362 lt!15359)))))

(assert (=> d!3180 (or (= (bvand lt!15362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15359 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15362 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15362 lt!15359) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3180 (= lt!15359 (remainingBits!0 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15326)))) ((_ sign_extend 32) (currentByte!1647 (_2!654 lt!15326))) ((_ sign_extend 32) (currentBit!1642 (_2!654 lt!15326)))))))

(declare-fun lt!15360 () (_ BitVec 64))

(declare-fun lt!15358 () (_ BitVec 64))

(assert (=> d!3180 (= lt!15362 (bvmul lt!15360 lt!15358))))

(assert (=> d!3180 (or (= lt!15360 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!15358 (bvsdiv (bvmul lt!15360 lt!15358) lt!15360)))))

(assert (=> d!3180 (= lt!15358 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3180 (= lt!15360 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15326)))))))

(assert (=> d!3180 (= lt!15361 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1647 (_2!654 lt!15326))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1642 (_2!654 lt!15326)))))))

(assert (=> d!3180 (invariant!0 (currentBit!1642 (_2!654 lt!15326)) (currentByte!1647 (_2!654 lt!15326)) (size!254 (buf!596 (_2!654 lt!15326))))))

(assert (=> d!3180 (= (bitIndex!0 (size!254 (buf!596 (_2!654 lt!15326))) (currentByte!1647 (_2!654 lt!15326)) (currentBit!1642 (_2!654 lt!15326))) lt!15361)))

(declare-fun b!10003 () Bool)

(declare-fun res!10106 () Bool)

(assert (=> b!10003 (=> (not res!10106) (not e!6130))))

(assert (=> b!10003 (= res!10106 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!15361))))

(declare-fun b!10004 () Bool)

(declare-fun lt!15357 () (_ BitVec 64))

(assert (=> b!10004 (= e!6130 (bvsle lt!15361 (bvmul lt!15357 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10004 (or (= lt!15357 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!15357 #b0000000000000000000000000000000000000000000000000000000000001000) lt!15357)))))

(assert (=> b!10004 (= lt!15357 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15326)))))))

(assert (= (and d!3180 res!10108) b!10003))

(assert (= (and b!10003 res!10106) b!10004))

(declare-fun m!14525 () Bool)

(assert (=> d!3180 m!14525))

(assert (=> d!3180 m!14459))

(assert (=> b!9943 d!3180))

(declare-fun d!3194 () Bool)

(declare-fun e!6133 () Bool)

(assert (=> d!3194 e!6133))

(declare-fun res!10111 () Bool)

(assert (=> d!3194 (=> (not res!10111) (not e!6133))))

(declare-fun lt!15368 () (_ BitVec 64))

(declare-fun lt!15365 () (_ BitVec 64))

(declare-fun lt!15367 () (_ BitVec 64))

(assert (=> d!3194 (= res!10111 (= lt!15367 (bvsub lt!15368 lt!15365)))))

(assert (=> d!3194 (or (= (bvand lt!15368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15365 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15368 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15368 lt!15365) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3194 (= lt!15365 (remainingBits!0 ((_ sign_extend 32) (size!254 (buf!596 thiss!1486))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486))))))

(declare-fun lt!15366 () (_ BitVec 64))

(declare-fun lt!15364 () (_ BitVec 64))

(assert (=> d!3194 (= lt!15368 (bvmul lt!15366 lt!15364))))

(assert (=> d!3194 (or (= lt!15366 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!15364 (bvsdiv (bvmul lt!15366 lt!15364) lt!15366)))))

(assert (=> d!3194 (= lt!15364 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3194 (= lt!15366 ((_ sign_extend 32) (size!254 (buf!596 thiss!1486))))))

(assert (=> d!3194 (= lt!15367 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1647 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1642 thiss!1486))))))

(assert (=> d!3194 (invariant!0 (currentBit!1642 thiss!1486) (currentByte!1647 thiss!1486) (size!254 (buf!596 thiss!1486)))))

(assert (=> d!3194 (= (bitIndex!0 (size!254 (buf!596 thiss!1486)) (currentByte!1647 thiss!1486) (currentBit!1642 thiss!1486)) lt!15367)))

(declare-fun b!10007 () Bool)

(declare-fun res!10110 () Bool)

(assert (=> b!10007 (=> (not res!10110) (not e!6133))))

(assert (=> b!10007 (= res!10110 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!15367))))

(declare-fun b!10008 () Bool)

(declare-fun lt!15363 () (_ BitVec 64))

(assert (=> b!10008 (= e!6133 (bvsle lt!15367 (bvmul lt!15363 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10008 (or (= lt!15363 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!15363 #b0000000000000000000000000000000000000000000000000000000000001000) lt!15363)))))

(assert (=> b!10008 (= lt!15363 ((_ sign_extend 32) (size!254 (buf!596 thiss!1486))))))

(assert (= (and d!3194 res!10111) b!10007))

(assert (= (and b!10007 res!10110) b!10008))

(declare-fun m!14527 () Bool)

(assert (=> d!3194 m!14527))

(declare-fun m!14529 () Bool)

(assert (=> d!3194 m!14529))

(assert (=> b!9943 d!3194))

(declare-fun d!3196 () Bool)

(declare-fun c!668 () Bool)

(assert (=> d!3196 (= c!668 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6138 () List!148)

(assert (=> d!3196 (= (byteArrayBitContentToList!0 (_2!654 lt!15326) srcBuffer!6 from!367 nBits!460) e!6138)))

(declare-fun b!10015 () Bool)

(assert (=> b!10015 (= e!6138 Nil!145)))

(declare-fun b!10016 () Bool)

(assert (=> b!10016 (= e!6138 (Cons!144 (not (= (bvand ((_ sign_extend 24) (select (arr!668 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!654 lt!15326) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3196 c!668) b!10015))

(assert (= (and d!3196 (not c!668)) b!10016))

(declare-fun m!14539 () Bool)

(assert (=> b!10016 m!14539))

(declare-fun m!14541 () Bool)

(assert (=> b!10016 m!14541))

(declare-fun m!14543 () Bool)

(assert (=> b!10016 m!14543))

(assert (=> b!9938 d!3196))

(declare-fun d!3202 () Bool)

(assert (=> d!3202 (= (array_inv!246 srcBuffer!6) (bvsge (size!254 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2092 d!3202))

(declare-fun d!3204 () Bool)

(assert (=> d!3204 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1642 thiss!1486) (currentByte!1647 thiss!1486) (size!254 (buf!596 thiss!1486))))))

(declare-fun bs!949 () Bool)

(assert (= bs!949 d!3204))

(assert (=> bs!949 m!14529))

(assert (=> start!2092 d!3204))

(declare-fun d!3206 () Bool)

(assert (=> d!3206 (= (array_inv!246 (buf!596 thiss!1486)) (bvsge (size!254 (buf!596 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!9942 d!3206))

(declare-fun d!3208 () Bool)

(declare-fun res!10126 () Bool)

(declare-fun e!6147 () Bool)

(assert (=> d!3208 (=> res!10126 e!6147)))

(assert (=> d!3208 (= res!10126 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3208 (= (checkByteArrayBitContent!0 (_2!654 lt!15326) srcBuffer!6 (_1!655 lt!15325) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6147)))

(declare-fun b!10029 () Bool)

(declare-fun e!6148 () Bool)

(assert (=> b!10029 (= e!6147 e!6148)))

(declare-fun res!10127 () Bool)

(assert (=> b!10029 (=> (not res!10127) (not e!6148))))

(assert (=> b!10029 (= res!10127 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!668 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!668 (_1!655 lt!15325)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!10030 () Bool)

(assert (=> b!10030 (= e!6148 (checkByteArrayBitContent!0 (_2!654 lt!15326) srcBuffer!6 (_1!655 lt!15325) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3208 (not res!10126)) b!10029))

(assert (= (and b!10029 res!10127) b!10030))

(assert (=> b!10029 m!14539))

(assert (=> b!10029 m!14541))

(declare-fun m!14551 () Bool)

(assert (=> b!10029 m!14551))

(declare-fun m!14553 () Bool)

(assert (=> b!10029 m!14553))

(declare-fun m!14555 () Bool)

(assert (=> b!10030 m!14555))

(assert (=> b!9937 d!3208))

(declare-fun d!3220 () Bool)

(assert (=> d!3220 (checkByteArrayBitContent!0 (_2!654 lt!15326) srcBuffer!6 (_1!655 lt!15325) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!15398 () Unit!847)

(declare-fun choose!65 (BitStream!480 array!590 array!590 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!847)

(assert (=> d!3220 (= lt!15398 (choose!65 (_2!654 lt!15326) srcBuffer!6 (_1!655 lt!15325) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3220 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3220 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!654 lt!15326) srcBuffer!6 (_1!655 lt!15325) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!15398)))

(declare-fun bs!952 () Bool)

(assert (= bs!952 d!3220))

(assert (=> bs!952 m!14465))

(declare-fun m!14557 () Bool)

(assert (=> bs!952 m!14557))

(assert (=> b!9937 d!3220))

(declare-fun d!3224 () Bool)

(assert (=> d!3224 (= (invariant!0 (currentBit!1642 (_2!654 lt!15326)) (currentByte!1647 (_2!654 lt!15326)) (size!254 (buf!596 (_2!654 lt!15326)))) (and (bvsge (currentBit!1642 (_2!654 lt!15326)) #b00000000000000000000000000000000) (bvslt (currentBit!1642 (_2!654 lt!15326)) #b00000000000000000000000000001000) (bvsge (currentByte!1647 (_2!654 lt!15326)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1647 (_2!654 lt!15326)) (size!254 (buf!596 (_2!654 lt!15326)))) (and (= (currentBit!1642 (_2!654 lt!15326)) #b00000000000000000000000000000000) (= (currentByte!1647 (_2!654 lt!15326)) (size!254 (buf!596 (_2!654 lt!15326))))))))))

(assert (=> b!9941 d!3224))

(declare-fun bm!181 () Bool)

(declare-fun call!184 () tuple2!1232)

(declare-fun c!685 () Bool)

(declare-fun lt!15706 () tuple2!1228)

(assert (=> bm!181 (= call!184 (reader!0 thiss!1486 (ite c!685 (_2!654 lt!15706) thiss!1486)))))

(declare-fun d!3226 () Bool)

(declare-fun e!6180 () Bool)

(assert (=> d!3226 e!6180))

(declare-fun res!10179 () Bool)

(assert (=> d!3226 (=> (not res!10179) (not e!6180))))

(declare-fun lt!15684 () tuple2!1228)

(declare-fun lt!15702 () (_ BitVec 64))

(assert (=> d!3226 (= res!10179 (= (bitIndex!0 (size!254 (buf!596 (_2!654 lt!15684))) (currentByte!1647 (_2!654 lt!15684)) (currentBit!1642 (_2!654 lt!15684))) (bvsub lt!15702 from!367)))))

(assert (=> d!3226 (or (= (bvand lt!15702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15702 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!15676 () (_ BitVec 64))

(assert (=> d!3226 (= lt!15702 (bvadd lt!15676 from!367 nBits!460))))

(assert (=> d!3226 (or (not (= (bvand lt!15676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!15676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!15676 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3226 (= lt!15676 (bitIndex!0 (size!254 (buf!596 thiss!1486)) (currentByte!1647 thiss!1486) (currentBit!1642 thiss!1486)))))

(declare-fun e!6181 () tuple2!1228)

(assert (=> d!3226 (= lt!15684 e!6181)))

(assert (=> d!3226 (= c!685 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!15716 () Unit!847)

(declare-fun lt!15717 () Unit!847)

(assert (=> d!3226 (= lt!15716 lt!15717)))

(assert (=> d!3226 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!480) Unit!847)

(assert (=> d!3226 (= lt!15717 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!15679 () (_ BitVec 64))

(assert (=> d!3226 (= lt!15679 (bitIndex!0 (size!254 (buf!596 thiss!1486)) (currentByte!1647 thiss!1486) (currentBit!1642 thiss!1486)))))

(assert (=> d!3226 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3226 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!15684)))

(declare-fun b!10111 () Bool)

(declare-fun res!10176 () Bool)

(assert (=> b!10111 (=> (not res!10176) (not e!6180))))

(assert (=> b!10111 (= res!10176 (= (size!254 (buf!596 (_2!654 lt!15684))) (size!254 (buf!596 thiss!1486))))))

(declare-fun b!10112 () Bool)

(declare-fun e!6179 () Bool)

(declare-fun lt!15699 () (_ BitVec 64))

(assert (=> b!10112 (= e!6179 (validate_offset_bits!1 ((_ sign_extend 32) (size!254 (buf!596 thiss!1486))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486)) lt!15699))))

(declare-fun b!10113 () Bool)

(declare-fun lt!15677 () tuple2!1228)

(declare-fun Unit!859 () Unit!847)

(assert (=> b!10113 (= e!6181 (tuple2!1229 Unit!859 (_2!654 lt!15677)))))

(declare-fun appendBitFromByte!0 (BitStream!480 (_ BitVec 8) (_ BitVec 32)) tuple2!1228)

(assert (=> b!10113 (= lt!15706 (appendBitFromByte!0 thiss!1486 (select (arr!668 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!15681 () (_ BitVec 64))

(assert (=> b!10113 (= lt!15681 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15704 () (_ BitVec 64))

(assert (=> b!10113 (= lt!15704 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15696 () Unit!847)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!480 BitStream!480 (_ BitVec 64) (_ BitVec 64)) Unit!847)

(assert (=> b!10113 (= lt!15696 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!654 lt!15706) lt!15681 lt!15704))))

(assert (=> b!10113 (validate_offset_bits!1 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15706)))) ((_ sign_extend 32) (currentByte!1647 (_2!654 lt!15706))) ((_ sign_extend 32) (currentBit!1642 (_2!654 lt!15706))) (bvsub lt!15681 lt!15704))))

(declare-fun lt!15710 () Unit!847)

(assert (=> b!10113 (= lt!15710 lt!15696)))

(declare-fun lt!15707 () tuple2!1232)

(assert (=> b!10113 (= lt!15707 call!184)))

(declare-fun lt!15698 () (_ BitVec 64))

(assert (=> b!10113 (= lt!15698 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15685 () Unit!847)

(assert (=> b!10113 (= lt!15685 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!596 (_2!654 lt!15706)) lt!15698))))

(assert (=> b!10113 (validate_offset_bits!1 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15706)))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486)) lt!15698)))

(declare-fun lt!15688 () Unit!847)

(assert (=> b!10113 (= lt!15688 lt!15685)))

(declare-fun head!54 (List!148) Bool)

(assert (=> b!10113 (= (head!54 (byteArrayBitContentToList!0 (_2!654 lt!15706) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!54 (bitStreamReadBitsIntoList!0 (_2!654 lt!15706) (_1!656 lt!15707) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15709 () Unit!847)

(declare-fun Unit!860 () Unit!847)

(assert (=> b!10113 (= lt!15709 Unit!860)))

(assert (=> b!10113 (= lt!15677 (appendBitsMSBFirstLoop!0 (_2!654 lt!15706) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!15690 () Unit!847)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!480 BitStream!480 BitStream!480) Unit!847)

(assert (=> b!10113 (= lt!15690 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!654 lt!15706) (_2!654 lt!15677)))))

(assert (=> b!10113 (isPrefixOf!0 thiss!1486 (_2!654 lt!15677))))

(declare-fun lt!15712 () Unit!847)

(assert (=> b!10113 (= lt!15712 lt!15690)))

(assert (=> b!10113 (= (size!254 (buf!596 (_2!654 lt!15677))) (size!254 (buf!596 thiss!1486)))))

(declare-fun lt!15692 () Unit!847)

(declare-fun Unit!861 () Unit!847)

(assert (=> b!10113 (= lt!15692 Unit!861)))

(assert (=> b!10113 (= (bitIndex!0 (size!254 (buf!596 (_2!654 lt!15677))) (currentByte!1647 (_2!654 lt!15677)) (currentBit!1642 (_2!654 lt!15677))) (bvsub (bvadd (bitIndex!0 (size!254 (buf!596 thiss!1486)) (currentByte!1647 thiss!1486) (currentBit!1642 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!15695 () Unit!847)

(declare-fun Unit!863 () Unit!847)

(assert (=> b!10113 (= lt!15695 Unit!863)))

(assert (=> b!10113 (= (bitIndex!0 (size!254 (buf!596 (_2!654 lt!15677))) (currentByte!1647 (_2!654 lt!15677)) (currentBit!1642 (_2!654 lt!15677))) (bvsub (bvsub (bvadd (bitIndex!0 (size!254 (buf!596 (_2!654 lt!15706))) (currentByte!1647 (_2!654 lt!15706)) (currentBit!1642 (_2!654 lt!15706))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!15691 () Unit!847)

(declare-fun Unit!864 () Unit!847)

(assert (=> b!10113 (= lt!15691 Unit!864)))

(declare-fun lt!15705 () tuple2!1232)

(assert (=> b!10113 (= lt!15705 (reader!0 thiss!1486 (_2!654 lt!15677)))))

(declare-fun lt!15680 () (_ BitVec 64))

(assert (=> b!10113 (= lt!15680 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15713 () Unit!847)

(assert (=> b!10113 (= lt!15713 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!596 (_2!654 lt!15677)) lt!15680))))

(assert (=> b!10113 (validate_offset_bits!1 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15677)))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486)) lt!15680)))

(declare-fun lt!15708 () Unit!847)

(assert (=> b!10113 (= lt!15708 lt!15713)))

(declare-fun lt!15714 () tuple2!1232)

(assert (=> b!10113 (= lt!15714 (reader!0 (_2!654 lt!15706) (_2!654 lt!15677)))))

(declare-fun lt!15686 () (_ BitVec 64))

(assert (=> b!10113 (= lt!15686 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!15678 () Unit!847)

(assert (=> b!10113 (= lt!15678 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!654 lt!15706) (buf!596 (_2!654 lt!15677)) lt!15686))))

(assert (=> b!10113 (validate_offset_bits!1 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15677)))) ((_ sign_extend 32) (currentByte!1647 (_2!654 lt!15706))) ((_ sign_extend 32) (currentBit!1642 (_2!654 lt!15706))) lt!15686)))

(declare-fun lt!15703 () Unit!847)

(assert (=> b!10113 (= lt!15703 lt!15678)))

(declare-fun lt!15697 () List!148)

(assert (=> b!10113 (= lt!15697 (byteArrayBitContentToList!0 (_2!654 lt!15677) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!15683 () List!148)

(assert (=> b!10113 (= lt!15683 (byteArrayBitContentToList!0 (_2!654 lt!15677) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15715 () List!148)

(assert (=> b!10113 (= lt!15715 (bitStreamReadBitsIntoList!0 (_2!654 lt!15677) (_1!656 lt!15705) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!15701 () List!148)

(assert (=> b!10113 (= lt!15701 (bitStreamReadBitsIntoList!0 (_2!654 lt!15677) (_1!656 lt!15714) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15675 () (_ BitVec 64))

(assert (=> b!10113 (= lt!15675 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15682 () Unit!847)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!480 BitStream!480 BitStream!480 BitStream!480 (_ BitVec 64) List!148) Unit!847)

(assert (=> b!10113 (= lt!15682 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!654 lt!15677) (_2!654 lt!15677) (_1!656 lt!15705) (_1!656 lt!15714) lt!15675 lt!15715))))

(declare-fun tail!62 (List!148) List!148)

(assert (=> b!10113 (= (bitStreamReadBitsIntoList!0 (_2!654 lt!15677) (_1!656 lt!15714) (bvsub lt!15675 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!62 lt!15715))))

(declare-fun lt!15694 () Unit!847)

(assert (=> b!10113 (= lt!15694 lt!15682)))

(declare-fun lt!15689 () Unit!847)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!590 array!590 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!847)

(assert (=> b!10113 (= lt!15689 (arrayBitRangesEqImpliesEq!0 (buf!596 (_2!654 lt!15706)) (buf!596 (_2!654 lt!15677)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!15679 (bitIndex!0 (size!254 (buf!596 (_2!654 lt!15706))) (currentByte!1647 (_2!654 lt!15706)) (currentBit!1642 (_2!654 lt!15706)))))))

(declare-fun bitAt!0 (array!590 (_ BitVec 64)) Bool)

(assert (=> b!10113 (= (bitAt!0 (buf!596 (_2!654 lt!15706)) lt!15679) (bitAt!0 (buf!596 (_2!654 lt!15677)) lt!15679))))

(declare-fun lt!15687 () Unit!847)

(assert (=> b!10113 (= lt!15687 lt!15689)))

(declare-fun b!10114 () Bool)

(declare-fun res!10181 () Bool)

(assert (=> b!10114 (=> (not res!10181) (not e!6180))))

(assert (=> b!10114 (= res!10181 (invariant!0 (currentBit!1642 (_2!654 lt!15684)) (currentByte!1647 (_2!654 lt!15684)) (size!254 (buf!596 (_2!654 lt!15684)))))))

(declare-fun b!10115 () Bool)

(declare-fun Unit!868 () Unit!847)

(assert (=> b!10115 (= e!6181 (tuple2!1229 Unit!868 thiss!1486))))

(assert (=> b!10115 (= (size!254 (buf!596 thiss!1486)) (size!254 (buf!596 thiss!1486)))))

(declare-fun lt!15693 () Unit!847)

(declare-fun Unit!869 () Unit!847)

(assert (=> b!10115 (= lt!15693 Unit!869)))

(assert (=> b!10115 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!655 (readBits!0 (_1!656 call!184) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!10116 () Bool)

(declare-fun res!10178 () Bool)

(assert (=> b!10116 (=> (not res!10178) (not e!6180))))

(assert (=> b!10116 (= res!10178 (= (size!254 (buf!596 thiss!1486)) (size!254 (buf!596 (_2!654 lt!15684)))))))

(declare-fun b!10117 () Bool)

(declare-fun res!10177 () Bool)

(assert (=> b!10117 (=> (not res!10177) (not e!6180))))

(assert (=> b!10117 (= res!10177 (isPrefixOf!0 thiss!1486 (_2!654 lt!15684)))))

(declare-fun b!10118 () Bool)

(declare-fun lt!15700 () tuple2!1232)

(assert (=> b!10118 (= e!6180 (= (bitStreamReadBitsIntoList!0 (_2!654 lt!15684) (_1!656 lt!15700) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!654 lt!15684) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!10118 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10118 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!15711 () Unit!847)

(declare-fun lt!15674 () Unit!847)

(assert (=> b!10118 (= lt!15711 lt!15674)))

(assert (=> b!10118 (validate_offset_bits!1 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15684)))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486)) lt!15699)))

(assert (=> b!10118 (= lt!15674 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!596 (_2!654 lt!15684)) lt!15699))))

(assert (=> b!10118 e!6179))

(declare-fun res!10180 () Bool)

(assert (=> b!10118 (=> (not res!10180) (not e!6179))))

(assert (=> b!10118 (= res!10180 (and (= (size!254 (buf!596 thiss!1486)) (size!254 (buf!596 (_2!654 lt!15684)))) (bvsge lt!15699 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10118 (= lt!15699 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!10118 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10118 (= lt!15700 (reader!0 thiss!1486 (_2!654 lt!15684)))))

(assert (= (and d!3226 c!685) b!10113))

(assert (= (and d!3226 (not c!685)) b!10115))

(assert (= (or b!10113 b!10115) bm!181))

(assert (= (and d!3226 res!10179) b!10114))

(assert (= (and b!10114 res!10181) b!10116))

(assert (= (and b!10116 res!10178) b!10117))

(assert (= (and b!10117 res!10177) b!10111))

(assert (= (and b!10111 res!10176) b!10118))

(assert (= (and b!10118 res!10180) b!10112))

(declare-fun m!14619 () Bool)

(assert (=> d!3226 m!14619))

(assert (=> d!3226 m!14475))

(declare-fun m!14621 () Bool)

(assert (=> d!3226 m!14621))

(declare-fun m!14623 () Bool)

(assert (=> d!3226 m!14623))

(declare-fun m!14625 () Bool)

(assert (=> bm!181 m!14625))

(declare-fun m!14627 () Bool)

(assert (=> b!10114 m!14627))

(declare-fun m!14629 () Bool)

(assert (=> b!10118 m!14629))

(declare-fun m!14631 () Bool)

(assert (=> b!10118 m!14631))

(declare-fun m!14633 () Bool)

(assert (=> b!10118 m!14633))

(declare-fun m!14635 () Bool)

(assert (=> b!10118 m!14635))

(declare-fun m!14637 () Bool)

(assert (=> b!10118 m!14637))

(declare-fun m!14639 () Bool)

(assert (=> b!10115 m!14639))

(declare-fun m!14641 () Bool)

(assert (=> b!10115 m!14641))

(declare-fun m!14643 () Bool)

(assert (=> b!10113 m!14643))

(declare-fun m!14645 () Bool)

(assert (=> b!10113 m!14645))

(declare-fun m!14647 () Bool)

(assert (=> b!10113 m!14647))

(declare-fun m!14649 () Bool)

(assert (=> b!10113 m!14649))

(declare-fun m!14651 () Bool)

(assert (=> b!10113 m!14651))

(declare-fun m!14653 () Bool)

(assert (=> b!10113 m!14653))

(declare-fun m!14655 () Bool)

(assert (=> b!10113 m!14655))

(declare-fun m!14657 () Bool)

(assert (=> b!10113 m!14657))

(declare-fun m!14659 () Bool)

(assert (=> b!10113 m!14659))

(declare-fun m!14661 () Bool)

(assert (=> b!10113 m!14661))

(declare-fun m!14663 () Bool)

(assert (=> b!10113 m!14663))

(assert (=> b!10113 m!14475))

(declare-fun m!14665 () Bool)

(assert (=> b!10113 m!14665))

(declare-fun m!14667 () Bool)

(assert (=> b!10113 m!14667))

(declare-fun m!14669 () Bool)

(assert (=> b!10113 m!14669))

(declare-fun m!14671 () Bool)

(assert (=> b!10113 m!14671))

(declare-fun m!14673 () Bool)

(assert (=> b!10113 m!14673))

(declare-fun m!14675 () Bool)

(assert (=> b!10113 m!14675))

(declare-fun m!14677 () Bool)

(assert (=> b!10113 m!14677))

(declare-fun m!14679 () Bool)

(assert (=> b!10113 m!14679))

(declare-fun m!14681 () Bool)

(assert (=> b!10113 m!14681))

(assert (=> b!10113 m!14661))

(declare-fun m!14683 () Bool)

(assert (=> b!10113 m!14683))

(declare-fun m!14685 () Bool)

(assert (=> b!10113 m!14685))

(assert (=> b!10113 m!14677))

(declare-fun m!14687 () Bool)

(assert (=> b!10113 m!14687))

(assert (=> b!10113 m!14539))

(declare-fun m!14689 () Bool)

(assert (=> b!10113 m!14689))

(declare-fun m!14691 () Bool)

(assert (=> b!10113 m!14691))

(declare-fun m!14693 () Bool)

(assert (=> b!10113 m!14693))

(declare-fun m!14695 () Bool)

(assert (=> b!10113 m!14695))

(declare-fun m!14697 () Bool)

(assert (=> b!10113 m!14697))

(assert (=> b!10113 m!14667))

(declare-fun m!14699 () Bool)

(assert (=> b!10113 m!14699))

(assert (=> b!10113 m!14539))

(declare-fun m!14701 () Bool)

(assert (=> b!10113 m!14701))

(declare-fun m!14703 () Bool)

(assert (=> b!10117 m!14703))

(declare-fun m!14705 () Bool)

(assert (=> b!10112 m!14705))

(assert (=> b!9941 d!3226))

(declare-fun d!3242 () Bool)

(declare-fun res!10195 () Bool)

(declare-fun e!6190 () Bool)

(assert (=> d!3242 (=> (not res!10195) (not e!6190))))

(assert (=> d!3242 (= res!10195 (= (size!254 (buf!596 thiss!1486)) (size!254 (buf!596 (_2!654 lt!15326)))))))

(assert (=> d!3242 (= (isPrefixOf!0 thiss!1486 (_2!654 lt!15326)) e!6190)))

(declare-fun b!10133 () Bool)

(declare-fun res!10194 () Bool)

(assert (=> b!10133 (=> (not res!10194) (not e!6190))))

(assert (=> b!10133 (= res!10194 (bvsle (bitIndex!0 (size!254 (buf!596 thiss!1486)) (currentByte!1647 thiss!1486) (currentBit!1642 thiss!1486)) (bitIndex!0 (size!254 (buf!596 (_2!654 lt!15326))) (currentByte!1647 (_2!654 lt!15326)) (currentBit!1642 (_2!654 lt!15326)))))))

(declare-fun b!10134 () Bool)

(declare-fun e!6189 () Bool)

(assert (=> b!10134 (= e!6190 e!6189)))

(declare-fun res!10196 () Bool)

(assert (=> b!10134 (=> res!10196 e!6189)))

(assert (=> b!10134 (= res!10196 (= (size!254 (buf!596 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!10135 () Bool)

(declare-fun arrayBitRangesEq!0 (array!590 array!590 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10135 (= e!6189 (arrayBitRangesEq!0 (buf!596 thiss!1486) (buf!596 (_2!654 lt!15326)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!254 (buf!596 thiss!1486)) (currentByte!1647 thiss!1486) (currentBit!1642 thiss!1486))))))

(assert (= (and d!3242 res!10195) b!10133))

(assert (= (and b!10133 res!10194) b!10134))

(assert (= (and b!10134 (not res!10196)) b!10135))

(assert (=> b!10133 m!14475))

(assert (=> b!10133 m!14473))

(assert (=> b!10135 m!14475))

(assert (=> b!10135 m!14475))

(declare-fun m!14707 () Bool)

(assert (=> b!10135 m!14707))

(assert (=> b!9944 d!3242))

(declare-fun d!3244 () Bool)

(assert (=> d!3244 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!254 (buf!596 thiss!1486))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!254 (buf!596 thiss!1486))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486))) nBits!460))))

(declare-fun bs!955 () Bool)

(assert (= bs!955 d!3244))

(assert (=> bs!955 m!14527))

(assert (=> b!9939 d!3244))

(declare-fun d!3246 () Bool)

(declare-fun e!6201 () Bool)

(assert (=> d!3246 e!6201))

(declare-fun res!10216 () Bool)

(assert (=> d!3246 (=> (not res!10216) (not e!6201))))

(declare-fun lt!15896 () tuple2!1232)

(assert (=> d!3246 (= res!10216 (isPrefixOf!0 (_1!656 lt!15896) (_2!656 lt!15896)))))

(declare-fun lt!15897 () BitStream!480)

(assert (=> d!3246 (= lt!15896 (tuple2!1233 lt!15897 (_2!654 lt!15326)))))

(declare-fun lt!15898 () Unit!847)

(declare-fun lt!15908 () Unit!847)

(assert (=> d!3246 (= lt!15898 lt!15908)))

(assert (=> d!3246 (isPrefixOf!0 lt!15897 (_2!654 lt!15326))))

(assert (=> d!3246 (= lt!15908 (lemmaIsPrefixTransitive!0 lt!15897 (_2!654 lt!15326) (_2!654 lt!15326)))))

(declare-fun lt!15902 () Unit!847)

(declare-fun lt!15892 () Unit!847)

(assert (=> d!3246 (= lt!15902 lt!15892)))

(assert (=> d!3246 (isPrefixOf!0 lt!15897 (_2!654 lt!15326))))

(assert (=> d!3246 (= lt!15892 (lemmaIsPrefixTransitive!0 lt!15897 thiss!1486 (_2!654 lt!15326)))))

(declare-fun lt!15894 () Unit!847)

(declare-fun e!6202 () Unit!847)

(assert (=> d!3246 (= lt!15894 e!6202)))

(declare-fun c!691 () Bool)

(assert (=> d!3246 (= c!691 (not (= (size!254 (buf!596 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!15904 () Unit!847)

(declare-fun lt!15909 () Unit!847)

(assert (=> d!3246 (= lt!15904 lt!15909)))

(assert (=> d!3246 (isPrefixOf!0 (_2!654 lt!15326) (_2!654 lt!15326))))

(assert (=> d!3246 (= lt!15909 (lemmaIsPrefixRefl!0 (_2!654 lt!15326)))))

(declare-fun lt!15895 () Unit!847)

(declare-fun lt!15901 () Unit!847)

(assert (=> d!3246 (= lt!15895 lt!15901)))

(assert (=> d!3246 (= lt!15901 (lemmaIsPrefixRefl!0 (_2!654 lt!15326)))))

(declare-fun lt!15891 () Unit!847)

(declare-fun lt!15905 () Unit!847)

(assert (=> d!3246 (= lt!15891 lt!15905)))

(assert (=> d!3246 (isPrefixOf!0 lt!15897 lt!15897)))

(assert (=> d!3246 (= lt!15905 (lemmaIsPrefixRefl!0 lt!15897))))

(declare-fun lt!15890 () Unit!847)

(declare-fun lt!15906 () Unit!847)

(assert (=> d!3246 (= lt!15890 lt!15906)))

(assert (=> d!3246 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3246 (= lt!15906 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3246 (= lt!15897 (BitStream!481 (buf!596 (_2!654 lt!15326)) (currentByte!1647 thiss!1486) (currentBit!1642 thiss!1486)))))

(assert (=> d!3246 (isPrefixOf!0 thiss!1486 (_2!654 lt!15326))))

(assert (=> d!3246 (= (reader!0 thiss!1486 (_2!654 lt!15326)) lt!15896)))

(declare-fun b!10162 () Bool)

(declare-fun lt!15903 () Unit!847)

(assert (=> b!10162 (= e!6202 lt!15903)))

(declare-fun lt!15907 () (_ BitVec 64))

(assert (=> b!10162 (= lt!15907 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15899 () (_ BitVec 64))

(assert (=> b!10162 (= lt!15899 (bitIndex!0 (size!254 (buf!596 thiss!1486)) (currentByte!1647 thiss!1486) (currentBit!1642 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!590 array!590 (_ BitVec 64) (_ BitVec 64)) Unit!847)

(assert (=> b!10162 (= lt!15903 (arrayBitRangesEqSymmetric!0 (buf!596 thiss!1486) (buf!596 (_2!654 lt!15326)) lt!15907 lt!15899))))

(assert (=> b!10162 (arrayBitRangesEq!0 (buf!596 (_2!654 lt!15326)) (buf!596 thiss!1486) lt!15907 lt!15899)))

(declare-fun lt!15893 () (_ BitVec 64))

(declare-fun lt!15900 () (_ BitVec 64))

(declare-fun b!10163 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!480 (_ BitVec 64)) BitStream!480)

(assert (=> b!10163 (= e!6201 (= (_1!656 lt!15896) (withMovedBitIndex!0 (_2!656 lt!15896) (bvsub lt!15900 lt!15893))))))

(assert (=> b!10163 (or (= (bvand lt!15900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15893 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15900 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15900 lt!15893) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10163 (= lt!15893 (bitIndex!0 (size!254 (buf!596 (_2!654 lt!15326))) (currentByte!1647 (_2!654 lt!15326)) (currentBit!1642 (_2!654 lt!15326))))))

(assert (=> b!10163 (= lt!15900 (bitIndex!0 (size!254 (buf!596 thiss!1486)) (currentByte!1647 thiss!1486) (currentBit!1642 thiss!1486)))))

(declare-fun b!10164 () Bool)

(declare-fun res!10215 () Bool)

(assert (=> b!10164 (=> (not res!10215) (not e!6201))))

(assert (=> b!10164 (= res!10215 (isPrefixOf!0 (_1!656 lt!15896) thiss!1486))))

(declare-fun b!10165 () Bool)

(declare-fun Unit!874 () Unit!847)

(assert (=> b!10165 (= e!6202 Unit!874)))

(declare-fun b!10166 () Bool)

(declare-fun res!10217 () Bool)

(assert (=> b!10166 (=> (not res!10217) (not e!6201))))

(assert (=> b!10166 (= res!10217 (isPrefixOf!0 (_2!656 lt!15896) (_2!654 lt!15326)))))

(assert (= (and d!3246 c!691) b!10162))

(assert (= (and d!3246 (not c!691)) b!10165))

(assert (= (and d!3246 res!10216) b!10164))

(assert (= (and b!10164 res!10215) b!10166))

(assert (= (and b!10166 res!10217) b!10163))

(declare-fun m!14797 () Bool)

(assert (=> b!10164 m!14797))

(assert (=> b!10162 m!14475))

(declare-fun m!14799 () Bool)

(assert (=> b!10162 m!14799))

(declare-fun m!14801 () Bool)

(assert (=> b!10162 m!14801))

(declare-fun m!14803 () Bool)

(assert (=> b!10166 m!14803))

(declare-fun m!14805 () Bool)

(assert (=> b!10163 m!14805))

(assert (=> b!10163 m!14473))

(assert (=> b!10163 m!14475))

(declare-fun m!14807 () Bool)

(assert (=> d!3246 m!14807))

(declare-fun m!14809 () Bool)

(assert (=> d!3246 m!14809))

(declare-fun m!14811 () Bool)

(assert (=> d!3246 m!14811))

(assert (=> d!3246 m!14471))

(assert (=> d!3246 m!14621))

(declare-fun m!14813 () Bool)

(assert (=> d!3246 m!14813))

(declare-fun m!14815 () Bool)

(assert (=> d!3246 m!14815))

(declare-fun m!14817 () Bool)

(assert (=> d!3246 m!14817))

(assert (=> d!3246 m!14623))

(declare-fun m!14819 () Bool)

(assert (=> d!3246 m!14819))

(declare-fun m!14821 () Bool)

(assert (=> d!3246 m!14821))

(assert (=> b!9945 d!3246))

(declare-fun d!3250 () Bool)

(declare-fun c!692 () Bool)

(assert (=> d!3250 (= c!692 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6203 () List!148)

(assert (=> d!3250 (= (byteArrayBitContentToList!0 (_2!654 lt!15326) (_1!655 lt!15325) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6203)))

(declare-fun b!10167 () Bool)

(assert (=> b!10167 (= e!6203 Nil!145)))

(declare-fun b!10168 () Bool)

(assert (=> b!10168 (= e!6203 (Cons!144 (not (= (bvand ((_ sign_extend 24) (select (arr!668 (_1!655 lt!15325)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!654 lt!15326) (_1!655 lt!15325) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3250 c!692) b!10167))

(assert (= (and d!3250 (not c!692)) b!10168))

(assert (=> b!10168 m!14551))

(assert (=> b!10168 m!14553))

(declare-fun m!14823 () Bool)

(assert (=> b!10168 m!14823))

(assert (=> b!9945 d!3250))

(declare-fun lt!16069 () tuple2!1230)

(declare-fun e!6228 () Bool)

(declare-fun b!10230 () Bool)

(assert (=> b!10230 (= e!6228 (= (byteArrayBitContentToList!0 (_2!655 lt!16069) (_1!655 lt!16069) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!655 lt!16069) (_1!656 lt!15321) nBits!460)))))

(declare-fun b!10231 () Bool)

(declare-fun res!10270 () Bool)

(assert (=> b!10231 (=> (not res!10270) (not e!6228))))

(assert (=> b!10231 (= res!10270 (invariant!0 (currentBit!1642 (_2!655 lt!16069)) (currentByte!1647 (_2!655 lt!16069)) (size!254 (buf!596 (_2!655 lt!16069)))))))

(declare-fun b!10232 () Bool)

(declare-fun res!10269 () Bool)

(assert (=> b!10232 (=> (not res!10269) (not e!6228))))

(declare-fun lt!16070 () (_ BitVec 64))

(assert (=> b!10232 (= res!10269 (= (size!254 (_1!655 lt!16069)) ((_ extract 31 0) lt!16070)))))

(assert (=> b!10232 (and (bvslt lt!16070 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!16070 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!16071 () (_ BitVec 64))

(declare-fun lt!16072 () (_ BitVec 64))

(assert (=> b!10232 (= lt!16070 (bvsdiv lt!16071 lt!16072))))

(assert (=> b!10232 (and (not (= lt!16072 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!16071 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!16072 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!10232 (= lt!16072 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!16073 () (_ BitVec 64))

(declare-fun lt!16076 () (_ BitVec 64))

(assert (=> b!10232 (= lt!16071 (bvsub lt!16073 lt!16076))))

(assert (=> b!10232 (or (= (bvand lt!16073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!16076 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16073 lt!16076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10232 (= lt!16076 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!16075 () (_ BitVec 64))

(assert (=> b!10232 (= lt!16073 (bvadd nBits!460 lt!16075))))

(assert (=> b!10232 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!16075 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!16075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10232 (= lt!16075 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!10233 () Bool)

(declare-fun res!10272 () Bool)

(assert (=> b!10233 (=> (not res!10272) (not e!6228))))

(assert (=> b!10233 (= res!10272 (bvsle (currentByte!1647 (_1!656 lt!15321)) (currentByte!1647 (_2!655 lt!16069))))))

(declare-fun d!3252 () Bool)

(assert (=> d!3252 e!6228))

(declare-fun res!10271 () Bool)

(assert (=> d!3252 (=> (not res!10271) (not e!6228))))

(assert (=> d!3252 (= res!10271 (= (buf!596 (_2!655 lt!16069)) (buf!596 (_1!656 lt!15321))))))

(declare-datatypes ((tuple3!78 0))(
  ( (tuple3!79 (_1!666 Unit!847) (_2!666 BitStream!480) (_3!42 array!590)) )
))
(declare-fun lt!16074 () tuple3!78)

(assert (=> d!3252 (= lt!16069 (tuple2!1231 (_3!42 lt!16074) (_2!666 lt!16074)))))

(declare-fun readBitsLoop!0 (BitStream!480 (_ BitVec 64) array!590 (_ BitVec 64) (_ BitVec 64)) tuple3!78)

(assert (=> d!3252 (= lt!16074 (readBitsLoop!0 (_1!656 lt!15321) nBits!460 (array!591 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3252 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3252 (= (readBits!0 (_1!656 lt!15321) nBits!460) lt!16069)))

(declare-fun b!10234 () Bool)

(declare-fun res!10273 () Bool)

(assert (=> b!10234 (=> (not res!10273) (not e!6228))))

(declare-fun lt!16077 () (_ BitVec 64))

(assert (=> b!10234 (= res!10273 (= (bvadd lt!16077 nBits!460) (bitIndex!0 (size!254 (buf!596 (_2!655 lt!16069))) (currentByte!1647 (_2!655 lt!16069)) (currentBit!1642 (_2!655 lt!16069)))))))

(assert (=> b!10234 (or (not (= (bvand lt!16077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!16077 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!16077 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10234 (= lt!16077 (bitIndex!0 (size!254 (buf!596 (_1!656 lt!15321))) (currentByte!1647 (_1!656 lt!15321)) (currentBit!1642 (_1!656 lt!15321))))))

(assert (= (and d!3252 res!10271) b!10234))

(assert (= (and b!10234 res!10273) b!10231))

(assert (= (and b!10231 res!10270) b!10232))

(assert (= (and b!10232 res!10269) b!10233))

(assert (= (and b!10233 res!10272) b!10230))

(declare-fun m!14941 () Bool)

(assert (=> b!10230 m!14941))

(declare-fun m!14943 () Bool)

(assert (=> b!10230 m!14943))

(declare-fun m!14945 () Bool)

(assert (=> b!10231 m!14945))

(declare-fun m!14947 () Bool)

(assert (=> d!3252 m!14947))

(declare-fun m!14949 () Bool)

(assert (=> b!10234 m!14949))

(declare-fun m!14951 () Bool)

(assert (=> b!10234 m!14951))

(assert (=> b!9945 d!3252))

(declare-fun d!3276 () Bool)

(assert (=> d!3276 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15326)))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15326)))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486))) nBits!460))))

(declare-fun bs!960 () Bool)

(assert (= bs!960 d!3276))

(declare-fun m!14953 () Bool)

(assert (=> bs!960 m!14953))

(assert (=> b!9945 d!3276))

(declare-fun b!10256 () Bool)

(declare-datatypes ((tuple2!1248 0))(
  ( (tuple2!1249 (_1!667 List!148) (_2!667 BitStream!480)) )
))
(declare-fun e!6240 () tuple2!1248)

(assert (=> b!10256 (= e!6240 (tuple2!1249 Nil!145 (_1!656 lt!15321)))))

(declare-fun b!10259 () Bool)

(declare-fun e!6239 () Bool)

(declare-fun lt!16111 () List!148)

(declare-fun length!28 (List!148) Int)

(assert (=> b!10259 (= e!6239 (> (length!28 lt!16111) 0))))

(declare-fun lt!16110 () (_ BitVec 64))

(declare-fun b!10257 () Bool)

(declare-datatypes ((tuple2!1250 0))(
  ( (tuple2!1251 (_1!668 Bool) (_2!668 BitStream!480)) )
))
(declare-fun lt!16112 () tuple2!1250)

(assert (=> b!10257 (= e!6240 (tuple2!1249 (Cons!144 (_1!668 lt!16112) (bitStreamReadBitsIntoList!0 (_2!654 lt!15326) (_2!668 lt!16112) (bvsub nBits!460 lt!16110))) (_2!668 lt!16112)))))

(declare-fun readBit!0 (BitStream!480) tuple2!1250)

(assert (=> b!10257 (= lt!16112 (readBit!0 (_1!656 lt!15321)))))

(assert (=> b!10257 (= lt!16110 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!10258 () Bool)

(declare-fun isEmpty!33 (List!148) Bool)

(assert (=> b!10258 (= e!6239 (isEmpty!33 lt!16111))))

(declare-fun d!3278 () Bool)

(assert (=> d!3278 e!6239))

(declare-fun c!708 () Bool)

(assert (=> d!3278 (= c!708 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3278 (= lt!16111 (_1!667 e!6240))))

(declare-fun c!707 () Bool)

(assert (=> d!3278 (= c!707 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3278 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3278 (= (bitStreamReadBitsIntoList!0 (_2!654 lt!15326) (_1!656 lt!15321) nBits!460) lt!16111)))

(assert (= (and d!3278 c!707) b!10256))

(assert (= (and d!3278 (not c!707)) b!10257))

(assert (= (and d!3278 c!708) b!10258))

(assert (= (and d!3278 (not c!708)) b!10259))

(declare-fun m!14981 () Bool)

(assert (=> b!10259 m!14981))

(declare-fun m!14983 () Bool)

(assert (=> b!10257 m!14983))

(declare-fun m!14985 () Bool)

(assert (=> b!10257 m!14985))

(declare-fun m!14987 () Bool)

(assert (=> b!10258 m!14987))

(assert (=> b!9945 d!3278))

(declare-fun d!3282 () Bool)

(assert (=> d!3282 (validate_offset_bits!1 ((_ sign_extend 32) (size!254 (buf!596 (_2!654 lt!15326)))) ((_ sign_extend 32) (currentByte!1647 thiss!1486)) ((_ sign_extend 32) (currentBit!1642 thiss!1486)) nBits!460)))

(declare-fun lt!16118 () Unit!847)

(declare-fun choose!9 (BitStream!480 array!590 (_ BitVec 64) BitStream!480) Unit!847)

(assert (=> d!3282 (= lt!16118 (choose!9 thiss!1486 (buf!596 (_2!654 lt!15326)) nBits!460 (BitStream!481 (buf!596 (_2!654 lt!15326)) (currentByte!1647 thiss!1486) (currentBit!1642 thiss!1486))))))

(assert (=> d!3282 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!596 (_2!654 lt!15326)) nBits!460) lt!16118)))

(declare-fun bs!961 () Bool)

(assert (= bs!961 d!3282))

(assert (=> bs!961 m!14445))

(declare-fun m!14997 () Bool)

(assert (=> bs!961 m!14997))

(assert (=> b!9945 d!3282))

(check-sat (not b!10114) (not b!10030) (not b!10133) (not b!10135) (not d!3194) (not b!10259) (not b!10112) (not b!10117) (not d!3226) (not d!3282) (not b!10168) (not d!3276) (not b!10230) (not d!3204) (not b!10164) (not d!3220) (not d!3180) (not b!10016) (not b!10162) (not b!10257) (not d!3244) (not b!10163) (not b!10258) (not b!10113) (not b!10115) (not bm!181) (not d!3246) (not b!10118) (not b!10166) (not b!10231) (not b!10234) (not d!3252))
