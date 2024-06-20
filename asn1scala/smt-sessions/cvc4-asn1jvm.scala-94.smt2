; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2208 () Bool)

(assert start!2208)

(declare-fun b!10331 () Bool)

(declare-fun e!6328 () Bool)

(declare-datatypes ((array!613 0))(
  ( (array!614 (arr!681 (Array (_ BitVec 32) (_ BitVec 8))) (size!264 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!494 0))(
  ( (BitStream!495 (buf!606 array!613) (currentByte!1663 (_ BitVec 32)) (currentBit!1658 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!494)

(declare-fun array_inv!256 (array!613) Bool)

(assert (=> b!10331 (= e!6328 (array_inv!256 (buf!606 thiss!1486)))))

(declare-fun e!6331 () Bool)

(declare-fun b!10332 () Bool)

(declare-fun lt!16145 () (_ BitVec 64))

(declare-fun lt!16144 () (_ BitVec 64))

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> b!10332 (= e!6331 (and (= lt!16145 (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!16145 (bvand (bvadd lt!16144 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!10332 (= lt!16145 (bvand lt!16144 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10332 (= lt!16144 (bitIndex!0 (size!264 (buf!606 thiss!1486)) (currentByte!1663 thiss!1486) (currentBit!1658 thiss!1486)))))

(declare-fun b!10333 () Bool)

(declare-fun res!10330 () Bool)

(assert (=> b!10333 (=> (not res!10330) (not e!6331))))

(declare-datatypes ((Unit!879 0))(
  ( (Unit!880) )
))
(declare-datatypes ((tuple2!1256 0))(
  ( (tuple2!1257 (_1!671 Unit!879) (_2!671 BitStream!494)) )
))
(declare-fun lt!16143 () tuple2!1256)

(assert (=> b!10333 (= res!10330 (= (size!264 (buf!606 thiss!1486)) (size!264 (buf!606 (_2!671 lt!16143)))))))

(declare-fun b!10334 () Bool)

(declare-fun res!10329 () Bool)

(declare-fun e!6330 () Bool)

(assert (=> b!10334 (=> (not res!10329) (not e!6330))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10334 (= res!10329 (validate_offset_bits!1 ((_ sign_extend 32) (size!264 (buf!606 thiss!1486))) ((_ sign_extend 32) (currentByte!1663 thiss!1486)) ((_ sign_extend 32) (currentBit!1658 thiss!1486)) nBits!460))))

(declare-fun res!10327 () Bool)

(assert (=> start!2208 (=> (not res!10327) (not e!6330))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!613)

(assert (=> start!2208 (= res!10327 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!264 srcBuffer!6))))))))

(assert (=> start!2208 e!6330))

(assert (=> start!2208 true))

(assert (=> start!2208 (array_inv!256 srcBuffer!6)))

(declare-fun inv!12 (BitStream!494) Bool)

(assert (=> start!2208 (and (inv!12 thiss!1486) e!6328)))

(declare-fun b!10335 () Bool)

(assert (=> b!10335 (= e!6330 e!6331)))

(declare-fun res!10328 () Bool)

(assert (=> b!10335 (=> (not res!10328) (not e!6331))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10335 (= res!10328 (invariant!0 (currentBit!1658 (_2!671 lt!16143)) (currentByte!1663 (_2!671 lt!16143)) (size!264 (buf!606 (_2!671 lt!16143)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!494 array!613 (_ BitVec 64) (_ BitVec 64)) tuple2!1256)

(assert (=> b!10335 (= lt!16143 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(assert (= (and start!2208 res!10327) b!10334))

(assert (= (and b!10334 res!10329) b!10335))

(assert (= (and b!10335 res!10328) b!10333))

(assert (= (and b!10333 res!10330) b!10332))

(assert (= start!2208 b!10331))

(declare-fun m!15057 () Bool)

(assert (=> b!10335 m!15057))

(declare-fun m!15059 () Bool)

(assert (=> b!10335 m!15059))

(declare-fun m!15061 () Bool)

(assert (=> start!2208 m!15061))

(declare-fun m!15063 () Bool)

(assert (=> start!2208 m!15063))

(declare-fun m!15065 () Bool)

(assert (=> b!10332 m!15065))

(declare-fun m!15067 () Bool)

(assert (=> b!10334 m!15067))

(declare-fun m!15069 () Bool)

(assert (=> b!10331 m!15069))

(push 1)

(assert (not b!10335))

(assert (not b!10331))

(assert (not b!10332))

(assert (not b!10334))

(assert (not start!2208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3304 () Bool)

(assert (=> d!3304 (= (array_inv!256 srcBuffer!6) (bvsge (size!264 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2208 d!3304))

(declare-fun d!3306 () Bool)

(assert (=> d!3306 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1658 thiss!1486) (currentByte!1663 thiss!1486) (size!264 (buf!606 thiss!1486))))))

(declare-fun bs!980 () Bool)

(assert (= bs!980 d!3306))

(declare-fun m!15071 () Bool)

(assert (=> bs!980 m!15071))

(assert (=> start!2208 d!3306))

(declare-fun d!3308 () Bool)

(declare-fun e!6335 () Bool)

(assert (=> d!3308 e!6335))

(declare-fun res!10336 () Bool)

(assert (=> d!3308 (=> (not res!10336) (not e!6335))))

(declare-fun lt!16160 () (_ BitVec 64))

(declare-fun lt!16159 () (_ BitVec 64))

(declare-fun lt!16162 () (_ BitVec 64))

(assert (=> d!3308 (= res!10336 (= lt!16160 (bvsub lt!16159 lt!16162)))))

(assert (=> d!3308 (or (= (bvand lt!16159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!16162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16159 lt!16162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3308 (= lt!16162 (remainingBits!0 ((_ sign_extend 32) (size!264 (buf!606 thiss!1486))) ((_ sign_extend 32) (currentByte!1663 thiss!1486)) ((_ sign_extend 32) (currentBit!1658 thiss!1486))))))

(declare-fun lt!16163 () (_ BitVec 64))

(declare-fun lt!16161 () (_ BitVec 64))

(assert (=> d!3308 (= lt!16159 (bvmul lt!16163 lt!16161))))

(assert (=> d!3308 (or (= lt!16163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!16161 (bvsdiv (bvmul lt!16163 lt!16161) lt!16163)))))

(assert (=> d!3308 (= lt!16161 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3308 (= lt!16163 ((_ sign_extend 32) (size!264 (buf!606 thiss!1486))))))

(assert (=> d!3308 (= lt!16160 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1663 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1658 thiss!1486))))))

(assert (=> d!3308 (invariant!0 (currentBit!1658 thiss!1486) (currentByte!1663 thiss!1486) (size!264 (buf!606 thiss!1486)))))

(assert (=> d!3308 (= (bitIndex!0 (size!264 (buf!606 thiss!1486)) (currentByte!1663 thiss!1486) (currentBit!1658 thiss!1486)) lt!16160)))

(declare-fun b!10340 () Bool)

(declare-fun res!10335 () Bool)

(assert (=> b!10340 (=> (not res!10335) (not e!6335))))

(assert (=> b!10340 (= res!10335 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!16160))))

(declare-fun b!10341 () Bool)

(declare-fun lt!16158 () (_ BitVec 64))

(assert (=> b!10341 (= e!6335 (bvsle lt!16160 (bvmul lt!16158 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10341 (or (= lt!16158 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!16158 #b0000000000000000000000000000000000000000000000000000000000001000) lt!16158)))))

(assert (=> b!10341 (= lt!16158 ((_ sign_extend 32) (size!264 (buf!606 thiss!1486))))))

(assert (= (and d!3308 res!10336) b!10340))

(assert (= (and b!10340 res!10335) b!10341))

(declare-fun m!15073 () Bool)

(assert (=> d!3308 m!15073))

(assert (=> d!3308 m!15071))

(assert (=> b!10332 d!3308))

(declare-fun d!3310 () Bool)

(assert (=> d!3310 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!264 (buf!606 thiss!1486))) ((_ sign_extend 32) (currentByte!1663 thiss!1486)) ((_ sign_extend 32) (currentBit!1658 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!264 (buf!606 thiss!1486))) ((_ sign_extend 32) (currentByte!1663 thiss!1486)) ((_ sign_extend 32) (currentBit!1658 thiss!1486))) nBits!460))))

(declare-fun bs!981 () Bool)

(assert (= bs!981 d!3310))

(assert (=> bs!981 m!15073))

(assert (=> b!10334 d!3310))

(declare-fun d!3312 () Bool)

(assert (=> d!3312 (= (invariant!0 (currentBit!1658 (_2!671 lt!16143)) (currentByte!1663 (_2!671 lt!16143)) (size!264 (buf!606 (_2!671 lt!16143)))) (and (bvsge (currentBit!1658 (_2!671 lt!16143)) #b00000000000000000000000000000000) (bvslt (currentBit!1658 (_2!671 lt!16143)) #b00000000000000000000000000001000) (bvsge (currentByte!1663 (_2!671 lt!16143)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1663 (_2!671 lt!16143)) (size!264 (buf!606 (_2!671 lt!16143)))) (and (= (currentBit!1658 (_2!671 lt!16143)) #b00000000000000000000000000000000) (= (currentByte!1663 (_2!671 lt!16143)) (size!264 (buf!606 (_2!671 lt!16143))))))))))

(assert (=> b!10335 d!3312))

(declare-fun b!10418 () Bool)

(declare-fun res!10398 () Bool)

(declare-fun e!6366 () Bool)

(assert (=> b!10418 (=> (not res!10398) (not e!6366))))

(declare-fun lt!16577 () tuple2!1256)

(assert (=> b!10418 (= res!10398 (invariant!0 (currentBit!1658 (_2!671 lt!16577)) (currentByte!1663 (_2!671 lt!16577)) (size!264 (buf!606 (_2!671 lt!16577)))))))

(declare-fun b!10419 () Bool)

(declare-fun e!6368 () tuple2!1256)

(declare-fun Unit!893 () Unit!879)

(assert (=> b!10419 (= e!6368 (tuple2!1257 Unit!893 thiss!1486))))

(assert (=> b!10419 (= (size!264 (buf!606 thiss!1486)) (size!264 (buf!606 thiss!1486)))))

(declare-fun lt!16565 () Unit!879)

(declare-fun Unit!896 () Unit!879)

(assert (=> b!10419 (= lt!16565 Unit!896)))

(declare-datatypes ((tuple2!1266 0))(
  ( (tuple2!1267 (_1!676 BitStream!494) (_2!676 BitStream!494)) )
))
(declare-fun call!197 () tuple2!1266)

(declare-fun checkByteArrayBitContent!0 (BitStream!494 array!613 array!613 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!1268 0))(
  ( (tuple2!1269 (_1!677 array!613) (_2!677 BitStream!494)) )
))
(declare-fun readBits!0 (BitStream!494 (_ BitVec 64)) tuple2!1268)

(assert (=> b!10419 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!677 (readBits!0 (_1!676 call!197) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!10421 () Bool)

(declare-fun res!10397 () Bool)

(assert (=> b!10421 (=> (not res!10397) (not e!6366))))

(assert (=> b!10421 (= res!10397 (= (size!264 (buf!606 (_2!671 lt!16577))) (size!264 (buf!606 thiss!1486))))))

(declare-fun b!10422 () Bool)

(declare-fun res!10400 () Bool)

(assert (=> b!10422 (=> (not res!10400) (not e!6366))))

(declare-fun isPrefixOf!0 (BitStream!494 BitStream!494) Bool)

(assert (=> b!10422 (= res!10400 (isPrefixOf!0 thiss!1486 (_2!671 lt!16577)))))

(declare-fun lt!16588 () tuple2!1266)

(declare-fun b!10423 () Bool)

(declare-datatypes ((List!152 0))(
  ( (Nil!149) (Cons!148 (h!267 Bool) (t!902 List!152)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!494 BitStream!494 (_ BitVec 64)) List!152)

(declare-fun byteArrayBitContentToList!0 (BitStream!494 array!613 (_ BitVec 64) (_ BitVec 64)) List!152)

(assert (=> b!10423 (= e!6366 (= (bitStreamReadBitsIntoList!0 (_2!671 lt!16577) (_1!676 lt!16588) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!671 lt!16577) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!10423 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10423 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!16580 () Unit!879)

(declare-fun lt!16587 () Unit!879)

(assert (=> b!10423 (= lt!16580 lt!16587)))

(declare-fun lt!16557 () (_ BitVec 64))

(assert (=> b!10423 (validate_offset_bits!1 ((_ sign_extend 32) (size!264 (buf!606 (_2!671 lt!16577)))) ((_ sign_extend 32) (currentByte!1663 thiss!1486)) ((_ sign_extend 32) (currentBit!1658 thiss!1486)) lt!16557)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!494 array!613 (_ BitVec 64)) Unit!879)

(assert (=> b!10423 (= lt!16587 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!606 (_2!671 lt!16577)) lt!16557))))

(declare-fun e!6367 () Bool)

(assert (=> b!10423 e!6367))

(declare-fun res!10399 () Bool)

(assert (=> b!10423 (=> (not res!10399) (not e!6367))))

(assert (=> b!10423 (= res!10399 (and (= (size!264 (buf!606 thiss!1486)) (size!264 (buf!606 (_2!671 lt!16577)))) (bvsge lt!16557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10423 (= lt!16557 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!10423 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!494 BitStream!494) tuple2!1266)

(assert (=> b!10423 (= lt!16588 (reader!0 thiss!1486 (_2!671 lt!16577)))))

(declare-fun lt!16582 () tuple2!1256)

(declare-fun bm!194 () Bool)

(declare-fun lt!16590 () tuple2!1256)

(declare-fun c!719 () Bool)

(assert (=> bm!194 (= call!197 (reader!0 (ite c!719 (_2!671 lt!16590) thiss!1486) (ite c!719 (_2!671 lt!16582) thiss!1486)))))

(declare-fun b!10424 () Bool)

(declare-fun Unit!897 () Unit!879)

(assert (=> b!10424 (= e!6368 (tuple2!1257 Unit!897 (_2!671 lt!16582)))))

(declare-fun appendBitFromByte!0 (BitStream!494 (_ BitVec 8) (_ BitVec 32)) tuple2!1256)

(assert (=> b!10424 (= lt!16590 (appendBitFromByte!0 thiss!1486 (select (arr!681 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!16574 () (_ BitVec 64))

(assert (=> b!10424 (= lt!16574 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16594 () (_ BitVec 64))

(assert (=> b!10424 (= lt!16594 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!16554 () Unit!879)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!494 BitStream!494 (_ BitVec 64) (_ BitVec 64)) Unit!879)

(assert (=> b!10424 (= lt!16554 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!671 lt!16590) lt!16574 lt!16594))))

(assert (=> b!10424 (validate_offset_bits!1 ((_ sign_extend 32) (size!264 (buf!606 (_2!671 lt!16590)))) ((_ sign_extend 32) (currentByte!1663 (_2!671 lt!16590))) ((_ sign_extend 32) (currentBit!1658 (_2!671 lt!16590))) (bvsub lt!16574 lt!16594))))

(declare-fun lt!16553 () Unit!879)

(assert (=> b!10424 (= lt!16553 lt!16554)))

(declare-fun lt!16564 () tuple2!1266)

(assert (=> b!10424 (= lt!16564 (reader!0 thiss!1486 (_2!671 lt!16590)))))

(declare-fun lt!16552 () (_ BitVec 64))

(assert (=> b!10424 (= lt!16552 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!16560 () Unit!879)

(assert (=> b!10424 (= lt!16560 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!606 (_2!671 lt!16590)) lt!16552))))

(assert (=> b!10424 (validate_offset_bits!1 ((_ sign_extend 32) (size!264 (buf!606 (_2!671 lt!16590)))) ((_ sign_extend 32) (currentByte!1663 thiss!1486)) ((_ sign_extend 32) (currentBit!1658 thiss!1486)) lt!16552)))

(declare-fun lt!16562 () Unit!879)

(assert (=> b!10424 (= lt!16562 lt!16560)))

(declare-fun head!58 (List!152) Bool)

(assert (=> b!10424 (= (head!58 (byteArrayBitContentToList!0 (_2!671 lt!16590) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!58 (bitStreamReadBitsIntoList!0 (_2!671 lt!16590) (_1!676 lt!16564) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16555 () Unit!879)

(declare-fun Unit!898 () Unit!879)

(assert (=> b!10424 (= lt!16555 Unit!898)))

(assert (=> b!10424 (= lt!16582 (appendBitsMSBFirstLoop!0 (_2!671 lt!16590) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!16561 () Unit!879)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!494 BitStream!494 BitStream!494) Unit!879)

(assert (=> b!10424 (= lt!16561 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!671 lt!16590) (_2!671 lt!16582)))))

(assert (=> b!10424 (isPrefixOf!0 thiss!1486 (_2!671 lt!16582))))

(declare-fun lt!16556 () Unit!879)

(assert (=> b!10424 (= lt!16556 lt!16561)))

(assert (=> b!10424 (= (size!264 (buf!606 (_2!671 lt!16582))) (size!264 (buf!606 thiss!1486)))))

(declare-fun lt!16568 () Unit!879)

(declare-fun Unit!899 () Unit!879)

(assert (=> b!10424 (= lt!16568 Unit!899)))

(assert (=> b!10424 (= (bitIndex!0 (size!264 (buf!606 (_2!671 lt!16582))) (currentByte!1663 (_2!671 lt!16582)) (currentBit!1658 (_2!671 lt!16582))) (bvsub (bvadd (bitIndex!0 (size!264 (buf!606 thiss!1486)) (currentByte!1663 thiss!1486) (currentBit!1658 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!16589 () Unit!879)

(declare-fun Unit!900 () Unit!879)

(assert (=> b!10424 (= lt!16589 Unit!900)))

(assert (=> b!10424 (= (bitIndex!0 (size!264 (buf!606 (_2!671 lt!16582))) (currentByte!1663 (_2!671 lt!16582)) (currentBit!1658 (_2!671 lt!16582))) (bvsub (bvsub (bvadd (bitIndex!0 (size!264 (buf!606 (_2!671 lt!16590))) (currentByte!1663 (_2!671 lt!16590)) (currentBit!1658 (_2!671 lt!16590))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!16591 () Unit!879)

(declare-fun Unit!901 () Unit!879)

(assert (=> b!10424 (= lt!16591 Unit!901)))

(declare-fun lt!16563 () tuple2!1266)

(assert (=> b!10424 (= lt!16563 (reader!0 thiss!1486 (_2!671 lt!16582)))))

(declare-fun lt!16586 () (_ BitVec 64))

(assert (=> b!10424 (= lt!16586 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16570 () Unit!879)

(assert (=> b!10424 (= lt!16570 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!606 (_2!671 lt!16582)) lt!16586))))

(assert (=> b!10424 (validate_offset_bits!1 ((_ sign_extend 32) (size!264 (buf!606 (_2!671 lt!16582)))) ((_ sign_extend 32) (currentByte!1663 thiss!1486)) ((_ sign_extend 32) (currentBit!1658 thiss!1486)) lt!16586)))

(declare-fun lt!16592 () Unit!879)

(assert (=> b!10424 (= lt!16592 lt!16570)))

(declare-fun lt!16584 () tuple2!1266)

(assert (=> b!10424 (= lt!16584 call!197)))

(declare-fun lt!16578 () (_ BitVec 64))

(assert (=> b!10424 (= lt!16578 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!16576 () Unit!879)

(assert (=> b!10424 (= lt!16576 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!671 lt!16590) (buf!606 (_2!671 lt!16582)) lt!16578))))

(assert (=> b!10424 (validate_offset_bits!1 ((_ sign_extend 32) (size!264 (buf!606 (_2!671 lt!16582)))) ((_ sign_extend 32) (currentByte!1663 (_2!671 lt!16590))) ((_ sign_extend 32) (currentBit!1658 (_2!671 lt!16590))) lt!16578)))

(declare-fun lt!16567 () Unit!879)

(assert (=> b!10424 (= lt!16567 lt!16576)))

(declare-fun lt!16585 () List!152)

(assert (=> b!10424 (= lt!16585 (byteArrayBitContentToList!0 (_2!671 lt!16582) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!16559 () List!152)

(assert (=> b!10424 (= lt!16559 (byteArrayBitContentToList!0 (_2!671 lt!16582) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16569 () List!152)

(assert (=> b!10424 (= lt!16569 (bitStreamReadBitsIntoList!0 (_2!671 lt!16582) (_1!676 lt!16563) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!16579 () List!152)

(assert (=> b!10424 (= lt!16579 (bitStreamReadBitsIntoList!0 (_2!671 lt!16582) (_1!676 lt!16584) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16581 () (_ BitVec 64))

(assert (=> b!10424 (= lt!16581 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!16575 () Unit!879)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!494 BitStream!494 BitStream!494 BitStream!494 (_ BitVec 64) List!152) Unit!879)

(assert (=> b!10424 (= lt!16575 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!671 lt!16582) (_2!671 lt!16582) (_1!676 lt!16563) (_1!676 lt!16584) lt!16581 lt!16569))))

(declare-fun tail!66 (List!152) List!152)

(assert (=> b!10424 (= (bitStreamReadBitsIntoList!0 (_2!671 lt!16582) (_1!676 lt!16584) (bvsub lt!16581 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!66 lt!16569))))

(declare-fun lt!16595 () Unit!879)

(assert (=> b!10424 (= lt!16595 lt!16575)))

(declare-fun lt!16566 () (_ BitVec 64))

(declare-fun lt!16593 () Unit!879)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!613 array!613 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!879)

(assert (=> b!10424 (= lt!16593 (arrayBitRangesEqImpliesEq!0 (buf!606 (_2!671 lt!16590)) (buf!606 (_2!671 lt!16582)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!16566 (bitIndex!0 (size!264 (buf!606 (_2!671 lt!16590))) (currentByte!1663 (_2!671 lt!16590)) (currentBit!1658 (_2!671 lt!16590)))))))

(declare-fun bitAt!0 (array!613 (_ BitVec 64)) Bool)

(assert (=> b!10424 (= (bitAt!0 (buf!606 (_2!671 lt!16590)) lt!16566) (bitAt!0 (buf!606 (_2!671 lt!16582)) lt!16566))))

(declare-fun lt!16583 () Unit!879)

(assert (=> b!10424 (= lt!16583 lt!16593)))

(declare-fun b!10425 () Bool)

(assert (=> b!10425 (= e!6367 (validate_offset_bits!1 ((_ sign_extend 32) (size!264 (buf!606 thiss!1486))) ((_ sign_extend 32) (currentByte!1663 thiss!1486)) ((_ sign_extend 32) (currentBit!1658 thiss!1486)) lt!16557))))

(declare-fun b!10420 () Bool)

(declare-fun res!10402 () Bool)

(assert (=> b!10420 (=> (not res!10402) (not e!6366))))

(assert (=> b!10420 (= res!10402 (= (size!264 (buf!606 thiss!1486)) (size!264 (buf!606 (_2!671 lt!16577)))))))

(declare-fun d!3314 () Bool)

(assert (=> d!3314 e!6366))

(declare-fun res!10401 () Bool)

(assert (=> d!3314 (=> (not res!10401) (not e!6366))))

(declare-fun lt!16558 () (_ BitVec 64))

(assert (=> d!3314 (= res!10401 (= (bitIndex!0 (size!264 (buf!606 (_2!671 lt!16577))) (currentByte!1663 (_2!671 lt!16577)) (currentBit!1658 (_2!671 lt!16577))) (bvsub lt!16558 from!367)))))

(assert (=> d!3314 (or (= (bvand lt!16558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16558 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!16571 () (_ BitVec 64))

(assert (=> d!3314 (= lt!16558 (bvadd lt!16571 from!367 nBits!460))))

(assert (=> d!3314 (or (not (= (bvand lt!16571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!16571 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!16571 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3314 (= lt!16571 (bitIndex!0 (size!264 (buf!606 thiss!1486)) (currentByte!1663 thiss!1486) (currentBit!1658 thiss!1486)))))

(assert (=> d!3314 (= lt!16577 e!6368)))

(assert (=> d!3314 (= c!719 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!16573 () Unit!879)

(declare-fun lt!16572 () Unit!879)

(assert (=> d!3314 (= lt!16573 lt!16572)))

(assert (=> d!3314 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!494) Unit!879)

(assert (=> d!3314 (= lt!16572 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3314 (= lt!16566 (bitIndex!0 (size!264 (buf!606 thiss!1486)) (currentByte!1663 thiss!1486) (currentBit!1658 thiss!1486)))))

(assert (=> d!3314 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3314 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!16577)))

(assert (= (and d!3314 c!719) b!10424))

(assert (= (and d!3314 (not c!719)) b!10419))

(assert (= (or b!10424 b!10419) bm!194))

(assert (= (and d!3314 res!10401) b!10418))

(assert (= (and b!10418 res!10398) b!10420))

(assert (= (and b!10420 res!10402) b!10422))

(assert (= (and b!10422 res!10400) b!10421))

(assert (= (and b!10421 res!10397) b!10423))

(assert (= (and b!10423 res!10399) b!10425))

(declare-fun m!15263 () Bool)

(assert (=> b!10425 m!15263))

(declare-fun m!15265 () Bool)

(assert (=> b!10424 m!15265))

(declare-fun m!15267 () Bool)

(assert (=> b!10424 m!15267))

(declare-fun m!15269 () Bool)

(assert (=> b!10424 m!15269))

(declare-fun m!15271 () Bool)

(assert (=> b!10424 m!15271))

(declare-fun m!15273 () Bool)

(assert (=> b!10424 m!15273))

(declare-fun m!15275 () Bool)

(assert (=> b!10424 m!15275))

(declare-fun m!15277 () Bool)

(assert (=> b!10424 m!15277))

(declare-fun m!15279 () Bool)

(assert (=> b!10424 m!15279))

(declare-fun m!15281 () Bool)

(assert (=> b!10424 m!15281))

(declare-fun m!15283 () Bool)

(assert (=> b!10424 m!15283))

(assert (=> b!10424 m!15281))

(declare-fun m!15285 () Bool)

(assert (=> b!10424 m!15285))

(assert (=> b!10424 m!15065))

(declare-fun m!15287 () Bool)

(assert (=> b!10424 m!15287))

(declare-fun m!15289 () Bool)

(assert (=> b!10424 m!15289))

(declare-fun m!15291 () Bool)

(assert (=> b!10424 m!15291))

(declare-fun m!15293 () Bool)

(assert (=> b!10424 m!15293))

(assert (=> b!10424 m!15291))

(declare-fun m!15295 () Bool)

(assert (=> b!10424 m!15295))

(declare-fun m!15297 () Bool)

(assert (=> b!10424 m!15297))

(declare-fun m!15299 () Bool)

(assert (=> b!10424 m!15299))

(declare-fun m!15301 () Bool)

(assert (=> b!10424 m!15301))

(declare-fun m!15303 () Bool)

(assert (=> b!10424 m!15303))

(assert (=> b!10424 m!15303))

(declare-fun m!15305 () Bool)

(assert (=> b!10424 m!15305))

(declare-fun m!15307 () Bool)

(assert (=> b!10424 m!15307))

(declare-fun m!15309 () Bool)

(assert (=> b!10424 m!15309))

(assert (=> b!10424 m!15299))

(declare-fun m!15311 () Bool)

(assert (=> b!10424 m!15311))

(declare-fun m!15313 () Bool)

(assert (=> b!10424 m!15313))

(declare-fun m!15315 () Bool)

(assert (=> b!10424 m!15315))

(declare-fun m!15317 () Bool)

(assert (=> b!10424 m!15317))

(declare-fun m!15319 () Bool)

(assert (=> b!10424 m!15319))

(declare-fun m!15321 () Bool)

(assert (=> b!10424 m!15321))

(declare-fun m!15323 () Bool)

(assert (=> b!10424 m!15323))

(declare-fun m!15325 () Bool)

(assert (=> b!10424 m!15325))

(declare-fun m!15327 () Bool)

(assert (=> b!10418 m!15327))

(declare-fun m!15329 () Bool)

(assert (=> bm!194 m!15329))

(declare-fun m!15331 () Bool)

(assert (=> b!10422 m!15331))

(declare-fun m!15333 () Bool)

(assert (=> b!10423 m!15333))

(declare-fun m!15335 () Bool)

(assert (=> b!10423 m!15335))

(declare-fun m!15337 () Bool)

(assert (=> b!10423 m!15337))

(declare-fun m!15339 () Bool)

(assert (=> b!10423 m!15339))

(declare-fun m!15341 () Bool)

(assert (=> b!10423 m!15341))

(declare-fun m!15343 () Bool)

(assert (=> b!10419 m!15343))

(declare-fun m!15345 () Bool)

(assert (=> b!10419 m!15345))

(declare-fun m!15347 () Bool)

(assert (=> d!3314 m!15347))

(assert (=> d!3314 m!15065))

(declare-fun m!15349 () Bool)

(assert (=> d!3314 m!15349))

(declare-fun m!15351 () Bool)

(assert (=> d!3314 m!15351))

(assert (=> b!10335 d!3314))

(declare-fun d!3334 () Bool)

(assert (=> d!3334 (= (array_inv!256 (buf!606 thiss!1486)) (bvsge (size!264 (buf!606 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!10331 d!3334))

(push 1)

(assert (not bm!194))

(assert (not d!3310))

(assert (not b!10422))

(assert (not b!10418))

(assert (not d!3308))

(assert (not d!3306))

(assert (not b!10419))

(assert (not b!10424))

(assert (not b!10425))

(assert (not b!10423))

(assert (not d!3314))

(check-sat)

(pop 1)

(push 1)

(check-sat)

