; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2206 () Bool)

(assert start!2206)

(declare-fun b!10316 () Bool)

(declare-fun e!6313 () Bool)

(declare-fun e!6316 () Bool)

(assert (=> b!10316 (= e!6313 e!6316)))

(declare-fun res!10315 () Bool)

(assert (=> b!10316 (=> (not res!10315) (not e!6316))))

(declare-datatypes ((array!611 0))(
  ( (array!612 (arr!680 (Array (_ BitVec 32) (_ BitVec 8))) (size!263 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!492 0))(
  ( (BitStream!493 (buf!605 array!611) (currentByte!1662 (_ BitVec 32)) (currentBit!1657 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!877 0))(
  ( (Unit!878) )
))
(declare-datatypes ((tuple2!1254 0))(
  ( (tuple2!1255 (_1!670 Unit!877) (_2!670 BitStream!492)) )
))
(declare-fun lt!16136 () tuple2!1254)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10316 (= res!10315 (invariant!0 (currentBit!1657 (_2!670 lt!16136)) (currentByte!1662 (_2!670 lt!16136)) (size!263 (buf!605 (_2!670 lt!16136)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!611)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!492)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!492 array!611 (_ BitVec 64) (_ BitVec 64)) tuple2!1254)

(assert (=> b!10316 (= lt!16136 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!10317 () Bool)

(declare-fun lt!16135 () (_ BitVec 64))

(declare-fun lt!16134 () (_ BitVec 64))

(assert (=> b!10317 (= e!6316 (and (= lt!16134 (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!16134 (bvand (bvadd lt!16135 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!10317 (= lt!16134 (bvand lt!16135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10317 (= lt!16135 (bitIndex!0 (size!263 (buf!605 thiss!1486)) (currentByte!1662 thiss!1486) (currentBit!1657 thiss!1486)))))

(declare-fun b!10318 () Bool)

(declare-fun res!10316 () Bool)

(assert (=> b!10318 (=> (not res!10316) (not e!6313))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10318 (= res!10316 (validate_offset_bits!1 ((_ sign_extend 32) (size!263 (buf!605 thiss!1486))) ((_ sign_extend 32) (currentByte!1662 thiss!1486)) ((_ sign_extend 32) (currentBit!1657 thiss!1486)) nBits!460))))

(declare-fun res!10317 () Bool)

(assert (=> start!2206 (=> (not res!10317) (not e!6313))))

(assert (=> start!2206 (= res!10317 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!263 srcBuffer!6))))))))

(assert (=> start!2206 e!6313))

(assert (=> start!2206 true))

(declare-fun array_inv!255 (array!611) Bool)

(assert (=> start!2206 (array_inv!255 srcBuffer!6)))

(declare-fun e!6315 () Bool)

(declare-fun inv!12 (BitStream!492) Bool)

(assert (=> start!2206 (and (inv!12 thiss!1486) e!6315)))

(declare-fun b!10319 () Bool)

(declare-fun res!10318 () Bool)

(assert (=> b!10319 (=> (not res!10318) (not e!6316))))

(assert (=> b!10319 (= res!10318 (= (size!263 (buf!605 thiss!1486)) (size!263 (buf!605 (_2!670 lt!16136)))))))

(declare-fun b!10320 () Bool)

(assert (=> b!10320 (= e!6315 (array_inv!255 (buf!605 thiss!1486)))))

(assert (= (and start!2206 res!10317) b!10318))

(assert (= (and b!10318 res!10316) b!10316))

(assert (= (and b!10316 res!10315) b!10319))

(assert (= (and b!10319 res!10318) b!10317))

(assert (= start!2206 b!10320))

(declare-fun m!15043 () Bool)

(assert (=> b!10320 m!15043))

(declare-fun m!15045 () Bool)

(assert (=> start!2206 m!15045))

(declare-fun m!15047 () Bool)

(assert (=> start!2206 m!15047))

(declare-fun m!15049 () Bool)

(assert (=> b!10316 m!15049))

(declare-fun m!15051 () Bool)

(assert (=> b!10316 m!15051))

(declare-fun m!15053 () Bool)

(assert (=> b!10317 m!15053))

(declare-fun m!15055 () Bool)

(assert (=> b!10318 m!15055))

(check-sat (not start!2206) (not b!10318) (not b!10320) (not b!10316) (not b!10317))
(check-sat)
(get-model)

(declare-fun d!3298 () Bool)

(assert (=> d!3298 (= (array_inv!255 (buf!605 thiss!1486)) (bvsge (size!263 (buf!605 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!10320 d!3298))

(declare-fun d!3300 () Bool)

(assert (=> d!3300 (= (invariant!0 (currentBit!1657 (_2!670 lt!16136)) (currentByte!1662 (_2!670 lt!16136)) (size!263 (buf!605 (_2!670 lt!16136)))) (and (bvsge (currentBit!1657 (_2!670 lt!16136)) #b00000000000000000000000000000000) (bvslt (currentBit!1657 (_2!670 lt!16136)) #b00000000000000000000000000001000) (bvsge (currentByte!1662 (_2!670 lt!16136)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1662 (_2!670 lt!16136)) (size!263 (buf!605 (_2!670 lt!16136)))) (and (= (currentBit!1657 (_2!670 lt!16136)) #b00000000000000000000000000000000) (= (currentByte!1662 (_2!670 lt!16136)) (size!263 (buf!605 (_2!670 lt!16136))))))))))

(assert (=> b!10316 d!3300))

(declare-fun b!10374 () Bool)

(declare-fun e!6349 () tuple2!1254)

(declare-fun lt!16356 () tuple2!1254)

(declare-fun Unit!881 () Unit!877)

(assert (=> b!10374 (= e!6349 (tuple2!1255 Unit!881 (_2!670 lt!16356)))))

(declare-fun lt!16359 () tuple2!1254)

(declare-fun appendBitFromByte!0 (BitStream!492 (_ BitVec 8) (_ BitVec 32)) tuple2!1254)

(assert (=> b!10374 (= lt!16359 (appendBitFromByte!0 thiss!1486 (select (arr!680 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!16362 () (_ BitVec 64))

(assert (=> b!10374 (= lt!16362 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16381 () (_ BitVec 64))

(assert (=> b!10374 (= lt!16381 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!16366 () Unit!877)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!492 BitStream!492 (_ BitVec 64) (_ BitVec 64)) Unit!877)

(assert (=> b!10374 (= lt!16366 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!670 lt!16359) lt!16362 lt!16381))))

(assert (=> b!10374 (validate_offset_bits!1 ((_ sign_extend 32) (size!263 (buf!605 (_2!670 lt!16359)))) ((_ sign_extend 32) (currentByte!1662 (_2!670 lt!16359))) ((_ sign_extend 32) (currentBit!1657 (_2!670 lt!16359))) (bvsub lt!16362 lt!16381))))

(declare-fun lt!16371 () Unit!877)

(assert (=> b!10374 (= lt!16371 lt!16366)))

(declare-datatypes ((tuple2!1260 0))(
  ( (tuple2!1261 (_1!673 BitStream!492) (_2!673 BitStream!492)) )
))
(declare-fun lt!16386 () tuple2!1260)

(declare-fun call!193 () tuple2!1260)

(assert (=> b!10374 (= lt!16386 call!193)))

(declare-fun lt!16385 () (_ BitVec 64))

(assert (=> b!10374 (= lt!16385 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!16351 () Unit!877)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!492 array!611 (_ BitVec 64)) Unit!877)

(assert (=> b!10374 (= lt!16351 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!605 (_2!670 lt!16359)) lt!16385))))

(assert (=> b!10374 (validate_offset_bits!1 ((_ sign_extend 32) (size!263 (buf!605 (_2!670 lt!16359)))) ((_ sign_extend 32) (currentByte!1662 thiss!1486)) ((_ sign_extend 32) (currentBit!1657 thiss!1486)) lt!16385)))

(declare-fun lt!16370 () Unit!877)

(assert (=> b!10374 (= lt!16370 lt!16351)))

(declare-datatypes ((List!151 0))(
  ( (Nil!148) (Cons!147 (h!266 Bool) (t!901 List!151)) )
))
(declare-fun head!56 (List!151) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!492 array!611 (_ BitVec 64) (_ BitVec 64)) List!151)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!492 BitStream!492 (_ BitVec 64)) List!151)

(assert (=> b!10374 (= (head!56 (byteArrayBitContentToList!0 (_2!670 lt!16359) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!56 (bitStreamReadBitsIntoList!0 (_2!670 lt!16359) (_1!673 lt!16386) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16344 () Unit!877)

(declare-fun Unit!882 () Unit!877)

(assert (=> b!10374 (= lt!16344 Unit!882)))

(assert (=> b!10374 (= lt!16356 (appendBitsMSBFirstLoop!0 (_2!670 lt!16359) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!16363 () Unit!877)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!492 BitStream!492 BitStream!492) Unit!877)

(assert (=> b!10374 (= lt!16363 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!670 lt!16359) (_2!670 lt!16356)))))

(declare-fun isPrefixOf!0 (BitStream!492 BitStream!492) Bool)

(assert (=> b!10374 (isPrefixOf!0 thiss!1486 (_2!670 lt!16356))))

(declare-fun lt!16345 () Unit!877)

(assert (=> b!10374 (= lt!16345 lt!16363)))

(assert (=> b!10374 (= (size!263 (buf!605 (_2!670 lt!16356))) (size!263 (buf!605 thiss!1486)))))

(declare-fun lt!16387 () Unit!877)

(declare-fun Unit!883 () Unit!877)

(assert (=> b!10374 (= lt!16387 Unit!883)))

(assert (=> b!10374 (= (bitIndex!0 (size!263 (buf!605 (_2!670 lt!16356))) (currentByte!1662 (_2!670 lt!16356)) (currentBit!1657 (_2!670 lt!16356))) (bvsub (bvadd (bitIndex!0 (size!263 (buf!605 thiss!1486)) (currentByte!1662 thiss!1486) (currentBit!1657 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!16373 () Unit!877)

(declare-fun Unit!884 () Unit!877)

(assert (=> b!10374 (= lt!16373 Unit!884)))

(assert (=> b!10374 (= (bitIndex!0 (size!263 (buf!605 (_2!670 lt!16356))) (currentByte!1662 (_2!670 lt!16356)) (currentBit!1657 (_2!670 lt!16356))) (bvsub (bvsub (bvadd (bitIndex!0 (size!263 (buf!605 (_2!670 lt!16359))) (currentByte!1662 (_2!670 lt!16359)) (currentBit!1657 (_2!670 lt!16359))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!16369 () Unit!877)

(declare-fun Unit!885 () Unit!877)

(assert (=> b!10374 (= lt!16369 Unit!885)))

(declare-fun lt!16368 () tuple2!1260)

(declare-fun reader!0 (BitStream!492 BitStream!492) tuple2!1260)

(assert (=> b!10374 (= lt!16368 (reader!0 thiss!1486 (_2!670 lt!16356)))))

(declare-fun lt!16382 () (_ BitVec 64))

(assert (=> b!10374 (= lt!16382 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16377 () Unit!877)

(assert (=> b!10374 (= lt!16377 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!605 (_2!670 lt!16356)) lt!16382))))

(assert (=> b!10374 (validate_offset_bits!1 ((_ sign_extend 32) (size!263 (buf!605 (_2!670 lt!16356)))) ((_ sign_extend 32) (currentByte!1662 thiss!1486)) ((_ sign_extend 32) (currentBit!1657 thiss!1486)) lt!16382)))

(declare-fun lt!16346 () Unit!877)

(assert (=> b!10374 (= lt!16346 lt!16377)))

(declare-fun lt!16360 () tuple2!1260)

(assert (=> b!10374 (= lt!16360 (reader!0 (_2!670 lt!16359) (_2!670 lt!16356)))))

(declare-fun lt!16358 () (_ BitVec 64))

(assert (=> b!10374 (= lt!16358 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!16352 () Unit!877)

(assert (=> b!10374 (= lt!16352 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!670 lt!16359) (buf!605 (_2!670 lt!16356)) lt!16358))))

(assert (=> b!10374 (validate_offset_bits!1 ((_ sign_extend 32) (size!263 (buf!605 (_2!670 lt!16356)))) ((_ sign_extend 32) (currentByte!1662 (_2!670 lt!16359))) ((_ sign_extend 32) (currentBit!1657 (_2!670 lt!16359))) lt!16358)))

(declare-fun lt!16383 () Unit!877)

(assert (=> b!10374 (= lt!16383 lt!16352)))

(declare-fun lt!16348 () List!151)

(assert (=> b!10374 (= lt!16348 (byteArrayBitContentToList!0 (_2!670 lt!16356) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!16372 () List!151)

(assert (=> b!10374 (= lt!16372 (byteArrayBitContentToList!0 (_2!670 lt!16356) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16364 () List!151)

(assert (=> b!10374 (= lt!16364 (bitStreamReadBitsIntoList!0 (_2!670 lt!16356) (_1!673 lt!16368) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!16375 () List!151)

(assert (=> b!10374 (= lt!16375 (bitStreamReadBitsIntoList!0 (_2!670 lt!16356) (_1!673 lt!16360) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16365 () (_ BitVec 64))

(assert (=> b!10374 (= lt!16365 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16361 () Unit!877)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!492 BitStream!492 BitStream!492 BitStream!492 (_ BitVec 64) List!151) Unit!877)

(assert (=> b!10374 (= lt!16361 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!670 lt!16356) (_2!670 lt!16356) (_1!673 lt!16368) (_1!673 lt!16360) lt!16365 lt!16364))))

(declare-fun tail!64 (List!151) List!151)

(assert (=> b!10374 (= (bitStreamReadBitsIntoList!0 (_2!670 lt!16356) (_1!673 lt!16360) (bvsub lt!16365 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!64 lt!16364))))

(declare-fun lt!16357 () Unit!877)

(assert (=> b!10374 (= lt!16357 lt!16361)))

(declare-fun lt!16347 () Unit!877)

(declare-fun lt!16354 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!611 array!611 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!877)

(assert (=> b!10374 (= lt!16347 (arrayBitRangesEqImpliesEq!0 (buf!605 (_2!670 lt!16359)) (buf!605 (_2!670 lt!16356)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!16354 (bitIndex!0 (size!263 (buf!605 (_2!670 lt!16359))) (currentByte!1662 (_2!670 lt!16359)) (currentBit!1657 (_2!670 lt!16359)))))))

(declare-fun bitAt!0 (array!611 (_ BitVec 64)) Bool)

(assert (=> b!10374 (= (bitAt!0 (buf!605 (_2!670 lt!16359)) lt!16354) (bitAt!0 (buf!605 (_2!670 lt!16356)) lt!16354))))

(declare-fun lt!16350 () Unit!877)

(assert (=> b!10374 (= lt!16350 lt!16347)))

(declare-fun e!6350 () Bool)

(declare-fun lt!16367 () tuple2!1260)

(declare-fun b!10375 () Bool)

(declare-fun lt!16378 () tuple2!1254)

(assert (=> b!10375 (= e!6350 (= (bitStreamReadBitsIntoList!0 (_2!670 lt!16378) (_1!673 lt!16367) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!670 lt!16378) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!10375 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10375 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!16374 () Unit!877)

(declare-fun lt!16379 () Unit!877)

(assert (=> b!10375 (= lt!16374 lt!16379)))

(declare-fun lt!16353 () (_ BitVec 64))

(assert (=> b!10375 (validate_offset_bits!1 ((_ sign_extend 32) (size!263 (buf!605 (_2!670 lt!16378)))) ((_ sign_extend 32) (currentByte!1662 thiss!1486)) ((_ sign_extend 32) (currentBit!1657 thiss!1486)) lt!16353)))

(assert (=> b!10375 (= lt!16379 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!605 (_2!670 lt!16378)) lt!16353))))

(declare-fun e!6348 () Bool)

(assert (=> b!10375 e!6348))

(declare-fun res!10362 () Bool)

(assert (=> b!10375 (=> (not res!10362) (not e!6348))))

(assert (=> b!10375 (= res!10362 (and (= (size!263 (buf!605 thiss!1486)) (size!263 (buf!605 (_2!670 lt!16378)))) (bvsge lt!16353 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10375 (= lt!16353 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!10375 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10375 (= lt!16367 (reader!0 thiss!1486 (_2!670 lt!16378)))))

(declare-fun d!3302 () Bool)

(assert (=> d!3302 e!6350))

(declare-fun res!10365 () Bool)

(assert (=> d!3302 (=> (not res!10365) (not e!6350))))

(declare-fun lt!16380 () (_ BitVec 64))

(assert (=> d!3302 (= res!10365 (= (bitIndex!0 (size!263 (buf!605 (_2!670 lt!16378))) (currentByte!1662 (_2!670 lt!16378)) (currentBit!1657 (_2!670 lt!16378))) (bvsub lt!16380 from!367)))))

(assert (=> d!3302 (or (= (bvand lt!16380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16380 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!16376 () (_ BitVec 64))

(assert (=> d!3302 (= lt!16380 (bvadd lt!16376 from!367 nBits!460))))

(assert (=> d!3302 (or (not (= (bvand lt!16376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!16376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!16376 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3302 (= lt!16376 (bitIndex!0 (size!263 (buf!605 thiss!1486)) (currentByte!1662 thiss!1486) (currentBit!1657 thiss!1486)))))

(assert (=> d!3302 (= lt!16378 e!6349)))

(declare-fun c!715 () Bool)

(assert (=> d!3302 (= c!715 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!16349 () Unit!877)

(declare-fun lt!16355 () Unit!877)

(assert (=> d!3302 (= lt!16349 lt!16355)))

(assert (=> d!3302 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!492) Unit!877)

(assert (=> d!3302 (= lt!16355 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3302 (= lt!16354 (bitIndex!0 (size!263 (buf!605 thiss!1486)) (currentByte!1662 thiss!1486) (currentBit!1657 thiss!1486)))))

(assert (=> d!3302 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3302 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!16378)))

(declare-fun b!10376 () Bool)

(declare-fun Unit!891 () Unit!877)

(assert (=> b!10376 (= e!6349 (tuple2!1255 Unit!891 thiss!1486))))

(assert (=> b!10376 (= (size!263 (buf!605 thiss!1486)) (size!263 (buf!605 thiss!1486)))))

(declare-fun lt!16384 () Unit!877)

(declare-fun Unit!894 () Unit!877)

(assert (=> b!10376 (= lt!16384 Unit!894)))

(declare-fun checkByteArrayBitContent!0 (BitStream!492 array!611 array!611 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1264 0))(
  ( (tuple2!1265 (_1!675 array!611) (_2!675 BitStream!492)) )
))
(declare-fun readBits!0 (BitStream!492 (_ BitVec 64)) tuple2!1264)

(assert (=> b!10376 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!675 (readBits!0 (_1!673 call!193) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!10377 () Bool)

(declare-fun res!10366 () Bool)

(assert (=> b!10377 (=> (not res!10366) (not e!6350))))

(assert (=> b!10377 (= res!10366 (= (size!263 (buf!605 (_2!670 lt!16378))) (size!263 (buf!605 thiss!1486))))))

(declare-fun b!10378 () Bool)

(declare-fun res!10363 () Bool)

(assert (=> b!10378 (=> (not res!10363) (not e!6350))))

(assert (=> b!10378 (= res!10363 (invariant!0 (currentBit!1657 (_2!670 lt!16378)) (currentByte!1662 (_2!670 lt!16378)) (size!263 (buf!605 (_2!670 lt!16378)))))))

(declare-fun bm!190 () Bool)

(assert (=> bm!190 (= call!193 (reader!0 thiss!1486 (ite c!715 (_2!670 lt!16359) thiss!1486)))))

(declare-fun b!10379 () Bool)

(declare-fun res!10364 () Bool)

(assert (=> b!10379 (=> (not res!10364) (not e!6350))))

(assert (=> b!10379 (= res!10364 (isPrefixOf!0 thiss!1486 (_2!670 lt!16378)))))

(declare-fun b!10380 () Bool)

(assert (=> b!10380 (= e!6348 (validate_offset_bits!1 ((_ sign_extend 32) (size!263 (buf!605 thiss!1486))) ((_ sign_extend 32) (currentByte!1662 thiss!1486)) ((_ sign_extend 32) (currentBit!1657 thiss!1486)) lt!16353))))

(declare-fun b!10381 () Bool)

(declare-fun res!10361 () Bool)

(assert (=> b!10381 (=> (not res!10361) (not e!6350))))

(assert (=> b!10381 (= res!10361 (= (size!263 (buf!605 thiss!1486)) (size!263 (buf!605 (_2!670 lt!16378)))))))

(assert (= (and d!3302 c!715) b!10374))

(assert (= (and d!3302 (not c!715)) b!10376))

(assert (= (or b!10374 b!10376) bm!190))

(assert (= (and d!3302 res!10365) b!10378))

(assert (= (and b!10378 res!10363) b!10381))

(assert (= (and b!10381 res!10361) b!10379))

(assert (= (and b!10379 res!10364) b!10377))

(assert (= (and b!10377 res!10366) b!10375))

(assert (= (and b!10375 res!10362) b!10380))

(declare-fun m!15075 () Bool)

(assert (=> b!10379 m!15075))

(declare-fun m!15077 () Bool)

(assert (=> b!10374 m!15077))

(declare-fun m!15079 () Bool)

(assert (=> b!10374 m!15079))

(declare-fun m!15081 () Bool)

(assert (=> b!10374 m!15081))

(declare-fun m!15083 () Bool)

(assert (=> b!10374 m!15083))

(assert (=> b!10374 m!15081))

(declare-fun m!15085 () Bool)

(assert (=> b!10374 m!15085))

(declare-fun m!15087 () Bool)

(assert (=> b!10374 m!15087))

(declare-fun m!15089 () Bool)

(assert (=> b!10374 m!15089))

(declare-fun m!15091 () Bool)

(assert (=> b!10374 m!15091))

(declare-fun m!15093 () Bool)

(assert (=> b!10374 m!15093))

(assert (=> b!10374 m!15053))

(declare-fun m!15095 () Bool)

(assert (=> b!10374 m!15095))

(declare-fun m!15097 () Bool)

(assert (=> b!10374 m!15097))

(declare-fun m!15099 () Bool)

(assert (=> b!10374 m!15099))

(declare-fun m!15101 () Bool)

(assert (=> b!10374 m!15101))

(assert (=> b!10374 m!15077))

(assert (=> b!10374 m!15091))

(declare-fun m!15103 () Bool)

(assert (=> b!10374 m!15103))

(declare-fun m!15105 () Bool)

(assert (=> b!10374 m!15105))

(declare-fun m!15107 () Bool)

(assert (=> b!10374 m!15107))

(declare-fun m!15109 () Bool)

(assert (=> b!10374 m!15109))

(assert (=> b!10374 m!15085))

(declare-fun m!15111 () Bool)

(assert (=> b!10374 m!15111))

(declare-fun m!15113 () Bool)

(assert (=> b!10374 m!15113))

(declare-fun m!15115 () Bool)

(assert (=> b!10374 m!15115))

(declare-fun m!15117 () Bool)

(assert (=> b!10374 m!15117))

(declare-fun m!15119 () Bool)

(assert (=> b!10374 m!15119))

(declare-fun m!15121 () Bool)

(assert (=> b!10374 m!15121))

(declare-fun m!15123 () Bool)

(assert (=> b!10374 m!15123))

(declare-fun m!15125 () Bool)

(assert (=> b!10374 m!15125))

(declare-fun m!15127 () Bool)

(assert (=> b!10374 m!15127))

(declare-fun m!15129 () Bool)

(assert (=> b!10374 m!15129))

(declare-fun m!15131 () Bool)

(assert (=> b!10374 m!15131))

(declare-fun m!15133 () Bool)

(assert (=> b!10374 m!15133))

(declare-fun m!15135 () Bool)

(assert (=> b!10374 m!15135))

(declare-fun m!15137 () Bool)

(assert (=> b!10374 m!15137))

(declare-fun m!15139 () Bool)

(assert (=> b!10376 m!15139))

(declare-fun m!15141 () Bool)

(assert (=> b!10376 m!15141))

(declare-fun m!15143 () Bool)

(assert (=> b!10375 m!15143))

(declare-fun m!15145 () Bool)

(assert (=> b!10375 m!15145))

(declare-fun m!15147 () Bool)

(assert (=> b!10375 m!15147))

(declare-fun m!15149 () Bool)

(assert (=> b!10375 m!15149))

(declare-fun m!15151 () Bool)

(assert (=> b!10375 m!15151))

(declare-fun m!15153 () Bool)

(assert (=> b!10380 m!15153))

(declare-fun m!15155 () Bool)

(assert (=> b!10378 m!15155))

(declare-fun m!15157 () Bool)

(assert (=> bm!190 m!15157))

(declare-fun m!15159 () Bool)

(assert (=> d!3302 m!15159))

(assert (=> d!3302 m!15053))

(declare-fun m!15161 () Bool)

(assert (=> d!3302 m!15161))

(declare-fun m!15163 () Bool)

(assert (=> d!3302 m!15163))

(assert (=> b!10316 d!3302))

(declare-fun d!3316 () Bool)

(declare-fun e!6362 () Bool)

(assert (=> d!3316 e!6362))

(declare-fun res!10389 () Bool)

(assert (=> d!3316 (=> (not res!10389) (not e!6362))))

(declare-fun lt!16533 () (_ BitVec 64))

(declare-fun lt!16532 () (_ BitVec 64))

(declare-fun lt!16529 () (_ BitVec 64))

(assert (=> d!3316 (= res!10389 (= lt!16532 (bvsub lt!16529 lt!16533)))))

(assert (=> d!3316 (or (= (bvand lt!16529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!16533 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16529 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16529 lt!16533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3316 (= lt!16533 (remainingBits!0 ((_ sign_extend 32) (size!263 (buf!605 thiss!1486))) ((_ sign_extend 32) (currentByte!1662 thiss!1486)) ((_ sign_extend 32) (currentBit!1657 thiss!1486))))))

(declare-fun lt!16528 () (_ BitVec 64))

(declare-fun lt!16530 () (_ BitVec 64))

(assert (=> d!3316 (= lt!16529 (bvmul lt!16528 lt!16530))))

(assert (=> d!3316 (or (= lt!16528 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!16530 (bvsdiv (bvmul lt!16528 lt!16530) lt!16528)))))

(assert (=> d!3316 (= lt!16530 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3316 (= lt!16528 ((_ sign_extend 32) (size!263 (buf!605 thiss!1486))))))

(assert (=> d!3316 (= lt!16532 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1662 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1657 thiss!1486))))))

(assert (=> d!3316 (invariant!0 (currentBit!1657 thiss!1486) (currentByte!1662 thiss!1486) (size!263 (buf!605 thiss!1486)))))

(assert (=> d!3316 (= (bitIndex!0 (size!263 (buf!605 thiss!1486)) (currentByte!1662 thiss!1486) (currentBit!1657 thiss!1486)) lt!16532)))

(declare-fun b!10410 () Bool)

(declare-fun res!10390 () Bool)

(assert (=> b!10410 (=> (not res!10390) (not e!6362))))

(assert (=> b!10410 (= res!10390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!16532))))

(declare-fun b!10411 () Bool)

(declare-fun lt!16531 () (_ BitVec 64))

(assert (=> b!10411 (= e!6362 (bvsle lt!16532 (bvmul lt!16531 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10411 (or (= lt!16531 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!16531 #b0000000000000000000000000000000000000000000000000000000000001000) lt!16531)))))

(assert (=> b!10411 (= lt!16531 ((_ sign_extend 32) (size!263 (buf!605 thiss!1486))))))

(assert (= (and d!3316 res!10389) b!10410))

(assert (= (and b!10410 res!10390) b!10411))

(declare-fun m!15255 () Bool)

(assert (=> d!3316 m!15255))

(declare-fun m!15257 () Bool)

(assert (=> d!3316 m!15257))

(assert (=> b!10317 d!3316))

(declare-fun d!3320 () Bool)

(assert (=> d!3320 (= (array_inv!255 srcBuffer!6) (bvsge (size!263 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2206 d!3320))

(declare-fun d!3322 () Bool)

(assert (=> d!3322 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1657 thiss!1486) (currentByte!1662 thiss!1486) (size!263 (buf!605 thiss!1486))))))

(declare-fun bs!982 () Bool)

(assert (= bs!982 d!3322))

(assert (=> bs!982 m!15257))

(assert (=> start!2206 d!3322))

(declare-fun d!3324 () Bool)

(assert (=> d!3324 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!263 (buf!605 thiss!1486))) ((_ sign_extend 32) (currentByte!1662 thiss!1486)) ((_ sign_extend 32) (currentBit!1657 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!263 (buf!605 thiss!1486))) ((_ sign_extend 32) (currentByte!1662 thiss!1486)) ((_ sign_extend 32) (currentBit!1657 thiss!1486))) nBits!460))))

(declare-fun bs!983 () Bool)

(assert (= bs!983 d!3324))

(assert (=> bs!983 m!15255))

(assert (=> b!10318 d!3324))

(check-sat (not d!3302) (not b!10380) (not d!3324) (not b!10376) (not b!10378) (not b!10379) (not b!10375) (not d!3316) (not bm!190) (not b!10374) (not d!3322))
