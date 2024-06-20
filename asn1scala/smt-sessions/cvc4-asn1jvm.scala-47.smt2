; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!972 () Bool)

(assert start!972)

(declare-fun b!3710 () Bool)

(declare-fun e!2461 () Bool)

(declare-fun e!2465 () Bool)

(assert (=> b!3710 (= e!2461 e!2465)))

(declare-fun res!5222 () Bool)

(assert (=> b!3710 (=> (not res!5222) (not e!2465))))

(declare-datatypes ((array!304 0))(
  ( (array!305 (arr!513 (Array (_ BitVec 32) (_ BitVec 8))) (size!126 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!230 0))(
  ( (BitStream!231 (buf!444 array!304) (currentByte!1417 (_ BitVec 32)) (currentBit!1412 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!278 0))(
  ( (Unit!279) )
))
(declare-datatypes ((tuple2!388 0))(
  ( (tuple2!389 (_1!207 Unit!278) (_2!207 BitStream!230)) )
))
(declare-fun lt!4355 () tuple2!388)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3710 (= res!5222 (invariant!0 (currentBit!1412 (_2!207 lt!4355)) (currentByte!1417 (_2!207 lt!4355)) (size!126 (buf!444 (_2!207 lt!4355)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!304)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!230)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!230 array!304 (_ BitVec 64) (_ BitVec 64)) tuple2!388)

(assert (=> b!3710 (= lt!4355 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3711 () Bool)

(declare-fun res!5223 () Bool)

(assert (=> b!3711 (=> (not res!5223) (not e!2461))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3711 (= res!5223 (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 thiss!1486))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486)) nBits!460))))

(declare-fun b!3712 () Bool)

(declare-fun res!5221 () Bool)

(assert (=> b!3712 (=> (not res!5221) (not e!2465))))

(assert (=> b!3712 (= res!5221 (= (size!126 (buf!444 thiss!1486)) (size!126 (buf!444 (_2!207 lt!4355)))))))

(declare-fun b!3713 () Bool)

(declare-fun res!5227 () Bool)

(assert (=> b!3713 (=> (not res!5227) (not e!2465))))

(declare-fun isPrefixOf!0 (BitStream!230 BitStream!230) Bool)

(assert (=> b!3713 (= res!5227 (isPrefixOf!0 thiss!1486 (_2!207 lt!4355)))))

(declare-fun b!3714 () Bool)

(declare-fun res!5224 () Bool)

(assert (=> b!3714 (=> (not res!5224) (not e!2465))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3714 (= res!5224 (= (bitIndex!0 (size!126 (buf!444 (_2!207 lt!4355))) (currentByte!1417 (_2!207 lt!4355)) (currentBit!1412 (_2!207 lt!4355))) (bvadd (bitIndex!0 (size!126 (buf!444 thiss!1486)) (currentByte!1417 thiss!1486) (currentBit!1412 thiss!1486)) nBits!460)))))

(declare-fun b!3715 () Bool)

(declare-fun e!2464 () Bool)

(declare-datatypes ((tuple2!390 0))(
  ( (tuple2!391 (_1!208 BitStream!230) (_2!208 BitStream!230)) )
))
(declare-fun lt!4354 () tuple2!390)

(assert (=> b!3715 (= e!2464 (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 (_1!208 lt!4354)))) ((_ sign_extend 32) (currentByte!1417 (_1!208 lt!4354))) ((_ sign_extend 32) (currentBit!1412 (_1!208 lt!4354))) nBits!460))))

(declare-fun b!3716 () Bool)

(declare-fun e!2462 () Bool)

(declare-fun array_inv!121 (array!304) Bool)

(assert (=> b!3716 (= e!2462 (array_inv!121 (buf!444 thiss!1486)))))

(declare-fun b!3717 () Bool)

(assert (=> b!3717 (= e!2465 (not e!2464))))

(declare-fun res!5226 () Bool)

(assert (=> b!3717 (=> res!5226 e!2464)))

(declare-datatypes ((List!26 0))(
  ( (Nil!23) (Cons!22 (h!141 Bool) (t!776 List!26)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!230 array!304 (_ BitVec 64) (_ BitVec 64)) List!26)

(declare-datatypes ((tuple2!392 0))(
  ( (tuple2!393 (_1!209 array!304) (_2!209 BitStream!230)) )
))
(declare-fun readBits!0 (BitStream!230 (_ BitVec 64)) tuple2!392)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!230 BitStream!230 (_ BitVec 64)) List!26)

(assert (=> b!3717 (= res!5226 (not (= (byteArrayBitContentToList!0 (_2!207 lt!4355) (_1!209 (readBits!0 (_1!208 lt!4354) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!207 lt!4355) (_1!208 lt!4354) nBits!460))))))

(assert (=> b!3717 (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!4355)))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486)) nBits!460)))

(declare-fun lt!4353 () Unit!278)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!230 array!304 (_ BitVec 64)) Unit!278)

(assert (=> b!3717 (= lt!4353 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!444 (_2!207 lt!4355)) nBits!460))))

(declare-fun reader!0 (BitStream!230 BitStream!230) tuple2!390)

(assert (=> b!3717 (= lt!4354 (reader!0 thiss!1486 (_2!207 lt!4355)))))

(declare-fun res!5225 () Bool)

(assert (=> start!972 (=> (not res!5225) (not e!2461))))

(assert (=> start!972 (= res!5225 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!126 srcBuffer!6))))))))

(assert (=> start!972 e!2461))

(assert (=> start!972 true))

(assert (=> start!972 (array_inv!121 srcBuffer!6)))

(declare-fun inv!12 (BitStream!230) Bool)

(assert (=> start!972 (and (inv!12 thiss!1486) e!2462)))

(assert (= (and start!972 res!5225) b!3711))

(assert (= (and b!3711 res!5223) b!3710))

(assert (= (and b!3710 res!5222) b!3712))

(assert (= (and b!3712 res!5221) b!3714))

(assert (= (and b!3714 res!5224) b!3713))

(assert (= (and b!3713 res!5227) b!3717))

(assert (= (and b!3717 (not res!5226)) b!3715))

(assert (= start!972 b!3716))

(declare-fun m!4165 () Bool)

(assert (=> b!3714 m!4165))

(declare-fun m!4167 () Bool)

(assert (=> b!3714 m!4167))

(declare-fun m!4169 () Bool)

(assert (=> start!972 m!4169))

(declare-fun m!4171 () Bool)

(assert (=> start!972 m!4171))

(declare-fun m!4173 () Bool)

(assert (=> b!3711 m!4173))

(declare-fun m!4175 () Bool)

(assert (=> b!3710 m!4175))

(declare-fun m!4177 () Bool)

(assert (=> b!3710 m!4177))

(declare-fun m!4179 () Bool)

(assert (=> b!3716 m!4179))

(declare-fun m!4181 () Bool)

(assert (=> b!3717 m!4181))

(declare-fun m!4183 () Bool)

(assert (=> b!3717 m!4183))

(declare-fun m!4185 () Bool)

(assert (=> b!3717 m!4185))

(declare-fun m!4187 () Bool)

(assert (=> b!3717 m!4187))

(declare-fun m!4189 () Bool)

(assert (=> b!3717 m!4189))

(declare-fun m!4191 () Bool)

(assert (=> b!3717 m!4191))

(declare-fun m!4193 () Bool)

(assert (=> b!3713 m!4193))

(declare-fun m!4195 () Bool)

(assert (=> b!3715 m!4195))

(push 1)

(assert (not b!3713))

(assert (not start!972))

(assert (not b!3710))

(assert (not b!3717))

(assert (not b!3711))

(assert (not b!3714))

(assert (not b!3716))

(assert (not b!3715))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1672 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1672 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!4355)))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!4355)))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486))) nBits!460))))

(declare-fun bs!616 () Bool)

(assert (= bs!616 d!1672))

(declare-fun m!4213 () Bool)

(assert (=> bs!616 m!4213))

(assert (=> b!3717 d!1672))

(declare-fun d!1674 () Bool)

(declare-fun c!164 () Bool)

(assert (=> d!1674 (= c!164 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!2492 () List!26)

(assert (=> d!1674 (= (byteArrayBitContentToList!0 (_2!207 lt!4355) (_1!209 (readBits!0 (_1!208 lt!4354) nBits!460)) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!2492)))

(declare-fun b!3767 () Bool)

(assert (=> b!3767 (= e!2492 Nil!23)))

(declare-fun b!3768 () Bool)

(assert (=> b!3768 (= e!2492 (Cons!22 (not (= (bvand ((_ sign_extend 24) (select (arr!513 (_1!209 (readBits!0 (_1!208 lt!4354) nBits!460))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!207 lt!4355) (_1!209 (readBits!0 (_1!208 lt!4354) nBits!460)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1674 c!164) b!3767))

(assert (= (and d!1674 (not c!164)) b!3768))

(declare-fun m!4221 () Bool)

(assert (=> b!3768 m!4221))

(declare-fun m!4223 () Bool)

(assert (=> b!3768 m!4223))

(declare-fun m!4227 () Bool)

(assert (=> b!3768 m!4227))

(assert (=> b!3717 d!1674))

(declare-fun d!1680 () Bool)

(assert (=> d!1680 (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!4355)))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486)) nBits!460)))

(declare-fun lt!4433 () Unit!278)

(declare-fun choose!9 (BitStream!230 array!304 (_ BitVec 64) BitStream!230) Unit!278)

(assert (=> d!1680 (= lt!4433 (choose!9 thiss!1486 (buf!444 (_2!207 lt!4355)) nBits!460 (BitStream!231 (buf!444 (_2!207 lt!4355)) (currentByte!1417 thiss!1486) (currentBit!1412 thiss!1486))))))

(assert (=> d!1680 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!444 (_2!207 lt!4355)) nBits!460) lt!4433)))

(declare-fun bs!620 () Bool)

(assert (= bs!620 d!1680))

(assert (=> bs!620 m!4191))

(declare-fun m!4257 () Bool)

(assert (=> bs!620 m!4257))

(assert (=> b!3717 d!1680))

(declare-fun b!3795 () Bool)

(declare-fun res!5273 () Bool)

(declare-fun e!2503 () Bool)

(assert (=> b!3795 (=> (not res!5273) (not e!2503))))

(declare-fun lt!4492 () tuple2!390)

(assert (=> b!3795 (= res!5273 (isPrefixOf!0 (_1!208 lt!4492) thiss!1486))))

(declare-fun b!3796 () Bool)

(declare-fun e!2502 () Unit!278)

(declare-fun lt!4498 () Unit!278)

(assert (=> b!3796 (= e!2502 lt!4498)))

(declare-fun lt!4493 () (_ BitVec 64))

(assert (=> b!3796 (= lt!4493 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4494 () (_ BitVec 64))

(assert (=> b!3796 (= lt!4494 (bitIndex!0 (size!126 (buf!444 thiss!1486)) (currentByte!1417 thiss!1486) (currentBit!1412 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!304 array!304 (_ BitVec 64) (_ BitVec 64)) Unit!278)

(assert (=> b!3796 (= lt!4498 (arrayBitRangesEqSymmetric!0 (buf!444 thiss!1486) (buf!444 (_2!207 lt!4355)) lt!4493 lt!4494))))

(declare-fun arrayBitRangesEq!0 (array!304 array!304 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3796 (arrayBitRangesEq!0 (buf!444 (_2!207 lt!4355)) (buf!444 thiss!1486) lt!4493 lt!4494)))

(declare-fun b!3797 () Bool)

(declare-fun Unit!281 () Unit!278)

(assert (=> b!3797 (= e!2502 Unit!281)))

(declare-fun d!1686 () Bool)

(assert (=> d!1686 e!2503))

(declare-fun res!5271 () Bool)

(assert (=> d!1686 (=> (not res!5271) (not e!2503))))

(assert (=> d!1686 (= res!5271 (isPrefixOf!0 (_1!208 lt!4492) (_2!208 lt!4492)))))

(declare-fun lt!4505 () BitStream!230)

(assert (=> d!1686 (= lt!4492 (tuple2!391 lt!4505 (_2!207 lt!4355)))))

(declare-fun lt!4503 () Unit!278)

(declare-fun lt!4499 () Unit!278)

(assert (=> d!1686 (= lt!4503 lt!4499)))

(assert (=> d!1686 (isPrefixOf!0 lt!4505 (_2!207 lt!4355))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!230 BitStream!230 BitStream!230) Unit!278)

(assert (=> d!1686 (= lt!4499 (lemmaIsPrefixTransitive!0 lt!4505 (_2!207 lt!4355) (_2!207 lt!4355)))))

(declare-fun lt!4507 () Unit!278)

(declare-fun lt!4506 () Unit!278)

(assert (=> d!1686 (= lt!4507 lt!4506)))

(assert (=> d!1686 (isPrefixOf!0 lt!4505 (_2!207 lt!4355))))

(assert (=> d!1686 (= lt!4506 (lemmaIsPrefixTransitive!0 lt!4505 thiss!1486 (_2!207 lt!4355)))))

(declare-fun lt!4497 () Unit!278)

(assert (=> d!1686 (= lt!4497 e!2502)))

(declare-fun c!170 () Bool)

(assert (=> d!1686 (= c!170 (not (= (size!126 (buf!444 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!4500 () Unit!278)

(declare-fun lt!4501 () Unit!278)

(assert (=> d!1686 (= lt!4500 lt!4501)))

(assert (=> d!1686 (isPrefixOf!0 (_2!207 lt!4355) (_2!207 lt!4355))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!230) Unit!278)

(assert (=> d!1686 (= lt!4501 (lemmaIsPrefixRefl!0 (_2!207 lt!4355)))))

(declare-fun lt!4509 () Unit!278)

(declare-fun lt!4511 () Unit!278)

(assert (=> d!1686 (= lt!4509 lt!4511)))

(assert (=> d!1686 (= lt!4511 (lemmaIsPrefixRefl!0 (_2!207 lt!4355)))))

(declare-fun lt!4495 () Unit!278)

(declare-fun lt!4504 () Unit!278)

(assert (=> d!1686 (= lt!4495 lt!4504)))

(assert (=> d!1686 (isPrefixOf!0 lt!4505 lt!4505)))

(assert (=> d!1686 (= lt!4504 (lemmaIsPrefixRefl!0 lt!4505))))

(declare-fun lt!4502 () Unit!278)

(declare-fun lt!4510 () Unit!278)

(assert (=> d!1686 (= lt!4502 lt!4510)))

(assert (=> d!1686 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1686 (= lt!4510 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1686 (= lt!4505 (BitStream!231 (buf!444 (_2!207 lt!4355)) (currentByte!1417 thiss!1486) (currentBit!1412 thiss!1486)))))

(assert (=> d!1686 (isPrefixOf!0 thiss!1486 (_2!207 lt!4355))))

(assert (=> d!1686 (= (reader!0 thiss!1486 (_2!207 lt!4355)) lt!4492)))

(declare-fun b!3798 () Bool)

(declare-fun res!5272 () Bool)

(assert (=> b!3798 (=> (not res!5272) (not e!2503))))

(assert (=> b!3798 (= res!5272 (isPrefixOf!0 (_2!208 lt!4492) (_2!207 lt!4355)))))

(declare-fun lt!4496 () (_ BitVec 64))

(declare-fun lt!4508 () (_ BitVec 64))

(declare-fun b!3799 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!230 (_ BitVec 64)) BitStream!230)

(assert (=> b!3799 (= e!2503 (= (_1!208 lt!4492) (withMovedBitIndex!0 (_2!208 lt!4492) (bvsub lt!4496 lt!4508))))))

(assert (=> b!3799 (or (= (bvand lt!4496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4508 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4496 lt!4508) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3799 (= lt!4508 (bitIndex!0 (size!126 (buf!444 (_2!207 lt!4355))) (currentByte!1417 (_2!207 lt!4355)) (currentBit!1412 (_2!207 lt!4355))))))

(assert (=> b!3799 (= lt!4496 (bitIndex!0 (size!126 (buf!444 thiss!1486)) (currentByte!1417 thiss!1486) (currentBit!1412 thiss!1486)))))

(assert (= (and d!1686 c!170) b!3796))

(assert (= (and d!1686 (not c!170)) b!3797))

(assert (= (and d!1686 res!5271) b!3795))

(assert (= (and b!3795 res!5273) b!3798))

(assert (= (and b!3798 res!5272) b!3799))

(declare-fun m!4265 () Bool)

(assert (=> b!3795 m!4265))

(declare-fun m!4269 () Bool)

(assert (=> b!3798 m!4269))

(declare-fun m!4273 () Bool)

(assert (=> b!3799 m!4273))

(assert (=> b!3799 m!4165))

(assert (=> b!3799 m!4167))

(assert (=> b!3796 m!4167))

(declare-fun m!4281 () Bool)

(assert (=> b!3796 m!4281))

(declare-fun m!4283 () Bool)

(assert (=> b!3796 m!4283))

(declare-fun m!4287 () Bool)

(assert (=> d!1686 m!4287))

(declare-fun m!4289 () Bool)

(assert (=> d!1686 m!4289))

(declare-fun m!4291 () Bool)

(assert (=> d!1686 m!4291))

(declare-fun m!4293 () Bool)

(assert (=> d!1686 m!4293))

(declare-fun m!4295 () Bool)

(assert (=> d!1686 m!4295))

(declare-fun m!4297 () Bool)

(assert (=> d!1686 m!4297))

(declare-fun m!4299 () Bool)

(assert (=> d!1686 m!4299))

(declare-fun m!4301 () Bool)

(assert (=> d!1686 m!4301))

(declare-fun m!4303 () Bool)

(assert (=> d!1686 m!4303))

(declare-fun m!4305 () Bool)

(assert (=> d!1686 m!4305))

(assert (=> d!1686 m!4193))

(assert (=> b!3717 d!1686))

(declare-fun b!3836 () Bool)

(declare-fun e!2516 () Bool)

(declare-fun lt!4555 () List!26)

(declare-fun isEmpty!9 (List!26) Bool)

(assert (=> b!3836 (= e!2516 (isEmpty!9 lt!4555))))

(declare-fun b!3834 () Bool)

(declare-datatypes ((tuple2!402 0))(
  ( (tuple2!403 (_1!216 List!26) (_2!216 BitStream!230)) )
))
(declare-fun e!2515 () tuple2!402)

(assert (=> b!3834 (= e!2515 (tuple2!403 Nil!23 (_1!208 lt!4354)))))

(declare-fun b!3835 () Bool)

(declare-datatypes ((tuple2!404 0))(
  ( (tuple2!405 (_1!217 Bool) (_2!217 BitStream!230)) )
))
(declare-fun lt!4554 () tuple2!404)

(declare-fun lt!4556 () (_ BitVec 64))

(assert (=> b!3835 (= e!2515 (tuple2!403 (Cons!22 (_1!217 lt!4554) (bitStreamReadBitsIntoList!0 (_2!207 lt!4355) (_2!217 lt!4554) (bvsub nBits!460 lt!4556))) (_2!217 lt!4554)))))

(declare-fun readBit!0 (BitStream!230) tuple2!404)

(assert (=> b!3835 (= lt!4554 (readBit!0 (_1!208 lt!4354)))))

(assert (=> b!3835 (= lt!4556 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!1692 () Bool)

(assert (=> d!1692 e!2516))

(declare-fun c!179 () Bool)

(assert (=> d!1692 (= c!179 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1692 (= lt!4555 (_1!216 e!2515))))

(declare-fun c!178 () Bool)

(assert (=> d!1692 (= c!178 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1692 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1692 (= (bitStreamReadBitsIntoList!0 (_2!207 lt!4355) (_1!208 lt!4354) nBits!460) lt!4555)))

(declare-fun b!3837 () Bool)

(declare-fun length!4 (List!26) Int)

(assert (=> b!3837 (= e!2516 (> (length!4 lt!4555) 0))))

(assert (= (and d!1692 c!178) b!3834))

(assert (= (and d!1692 (not c!178)) b!3835))

(assert (= (and d!1692 c!179) b!3836))

(assert (= (and d!1692 (not c!179)) b!3837))

(declare-fun m!4325 () Bool)

(assert (=> b!3836 m!4325))

(declare-fun m!4327 () Bool)

(assert (=> b!3835 m!4327))

(declare-fun m!4329 () Bool)

(assert (=> b!3835 m!4329))

(declare-fun m!4331 () Bool)

(assert (=> b!3837 m!4331))

(assert (=> b!3717 d!1692))

(declare-fun b!3875 () Bool)

(declare-fun res!5314 () Bool)

(declare-fun e!2531 () Bool)

(assert (=> b!3875 (=> (not res!5314) (not e!2531))))

(declare-fun lt!4648 () (_ BitVec 64))

(declare-fun lt!4649 () tuple2!392)

(assert (=> b!3875 (= res!5314 (= (bvadd lt!4648 nBits!460) (bitIndex!0 (size!126 (buf!444 (_2!209 lt!4649))) (currentByte!1417 (_2!209 lt!4649)) (currentBit!1412 (_2!209 lt!4649)))))))

(assert (=> b!3875 (or (not (= (bvand lt!4648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!4648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!4648 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3875 (= lt!4648 (bitIndex!0 (size!126 (buf!444 (_1!208 lt!4354))) (currentByte!1417 (_1!208 lt!4354)) (currentBit!1412 (_1!208 lt!4354))))))

(declare-fun b!3876 () Bool)

(declare-fun res!5316 () Bool)

(assert (=> b!3876 (=> (not res!5316) (not e!2531))))

(assert (=> b!3876 (= res!5316 (bvsle (currentByte!1417 (_1!208 lt!4354)) (currentByte!1417 (_2!209 lt!4649))))))

(declare-fun d!1698 () Bool)

(assert (=> d!1698 e!2531))

(declare-fun res!5315 () Bool)

(assert (=> d!1698 (=> (not res!5315) (not e!2531))))

(assert (=> d!1698 (= res!5315 (= (buf!444 (_2!209 lt!4649)) (buf!444 (_1!208 lt!4354))))))

(declare-datatypes ((tuple3!30 0))(
  ( (tuple3!31 (_1!218 Unit!278) (_2!218 BitStream!230) (_3!15 array!304)) )
))
(declare-fun lt!4645 () tuple3!30)

(assert (=> d!1698 (= lt!4649 (tuple2!393 (_3!15 lt!4645) (_2!218 lt!4645)))))

(declare-fun readBitsLoop!0 (BitStream!230 (_ BitVec 64) array!304 (_ BitVec 64) (_ BitVec 64)) tuple3!30)

(assert (=> d!1698 (= lt!4645 (readBitsLoop!0 (_1!208 lt!4354) nBits!460 (array!305 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1698 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1698 (= (readBits!0 (_1!208 lt!4354) nBits!460) lt!4649)))

(declare-fun b!3877 () Bool)

(declare-fun res!5317 () Bool)

(assert (=> b!3877 (=> (not res!5317) (not e!2531))))

(declare-fun lt!4651 () (_ BitVec 64))

(assert (=> b!3877 (= res!5317 (= (size!126 (_1!209 lt!4649)) ((_ extract 31 0) lt!4651)))))

(assert (=> b!3877 (and (bvslt lt!4651 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!4651 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!4644 () (_ BitVec 64))

(declare-fun lt!4652 () (_ BitVec 64))

(assert (=> b!3877 (= lt!4651 (bvsdiv lt!4644 lt!4652))))

(assert (=> b!3877 (and (not (= lt!4652 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!4644 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!4652 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!3877 (= lt!4652 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!4646 () (_ BitVec 64))

(declare-fun lt!4650 () (_ BitVec 64))

(assert (=> b!3877 (= lt!4644 (bvsub lt!4646 lt!4650))))

(assert (=> b!3877 (or (= (bvand lt!4646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4650 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4646 lt!4650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3877 (= lt!4650 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!4647 () (_ BitVec 64))

(assert (=> b!3877 (= lt!4646 (bvadd nBits!460 lt!4647))))

(assert (=> b!3877 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4647 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!4647) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3877 (= lt!4647 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!3878 () Bool)

(declare-fun res!5313 () Bool)

(assert (=> b!3878 (=> (not res!5313) (not e!2531))))

(assert (=> b!3878 (= res!5313 (invariant!0 (currentBit!1412 (_2!209 lt!4649)) (currentByte!1417 (_2!209 lt!4649)) (size!126 (buf!444 (_2!209 lt!4649)))))))

(declare-fun b!3879 () Bool)

(assert (=> b!3879 (= e!2531 (= (byteArrayBitContentToList!0 (_2!209 lt!4649) (_1!209 lt!4649) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!209 lt!4649) (_1!208 lt!4354) nBits!460)))))

(assert (= (and d!1698 res!5315) b!3875))

(assert (= (and b!3875 res!5314) b!3878))

(assert (= (and b!3878 res!5313) b!3877))

(assert (= (and b!3877 res!5317) b!3876))

(assert (= (and b!3876 res!5316) b!3879))

(declare-fun m!4375 () Bool)

(assert (=> b!3875 m!4375))

(declare-fun m!4377 () Bool)

(assert (=> b!3875 m!4377))

(declare-fun m!4379 () Bool)

(assert (=> d!1698 m!4379))

(declare-fun m!4381 () Bool)

(assert (=> b!3878 m!4381))

(declare-fun m!4383 () Bool)

(assert (=> b!3879 m!4383))

(declare-fun m!4385 () Bool)

(assert (=> b!3879 m!4385))

(assert (=> b!3717 d!1698))

(declare-fun d!1716 () Bool)

(assert (=> d!1716 (= (invariant!0 (currentBit!1412 (_2!207 lt!4355)) (currentByte!1417 (_2!207 lt!4355)) (size!126 (buf!444 (_2!207 lt!4355)))) (and (bvsge (currentBit!1412 (_2!207 lt!4355)) #b00000000000000000000000000000000) (bvslt (currentBit!1412 (_2!207 lt!4355)) #b00000000000000000000000000001000) (bvsge (currentByte!1417 (_2!207 lt!4355)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1417 (_2!207 lt!4355)) (size!126 (buf!444 (_2!207 lt!4355)))) (and (= (currentBit!1412 (_2!207 lt!4355)) #b00000000000000000000000000000000) (= (currentByte!1417 (_2!207 lt!4355)) (size!126 (buf!444 (_2!207 lt!4355))))))))))

(assert (=> b!3710 d!1716))

(declare-fun b!3952 () Bool)

(declare-fun e!2562 () tuple2!388)

(declare-fun Unit!294 () Unit!278)

(assert (=> b!3952 (= e!2562 (tuple2!389 Unit!294 thiss!1486))))

(assert (=> b!3952 (= (size!126 (buf!444 thiss!1486)) (size!126 (buf!444 thiss!1486)))))

(declare-fun lt!5069 () Unit!278)

(declare-fun Unit!295 () Unit!278)

(assert (=> b!3952 (= lt!5069 Unit!295)))

(declare-fun call!47 () tuple2!390)

(declare-fun checkByteArrayBitContent!0 (BitStream!230 array!304 array!304 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3952 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!209 (readBits!0 (_1!208 call!47) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!3953 () Bool)

(declare-fun res!5377 () Bool)

(declare-fun e!2560 () Bool)

(assert (=> b!3953 (=> (not res!5377) (not e!2560))))

(declare-fun lt!5062 () tuple2!388)

(assert (=> b!3953 (= res!5377 (= (size!126 (buf!444 thiss!1486)) (size!126 (buf!444 (_2!207 lt!5062)))))))

(declare-fun b!3954 () Bool)

(declare-fun res!5376 () Bool)

(assert (=> b!3954 (=> (not res!5376) (not e!2560))))

(assert (=> b!3954 (= res!5376 (isPrefixOf!0 thiss!1486 (_2!207 lt!5062)))))

(declare-fun lt!5033 () tuple2!388)

(declare-fun c!197 () Bool)

(declare-fun bm!44 () Bool)

(declare-fun lt!5031 () tuple2!388)

(assert (=> bm!44 (= call!47 (reader!0 (ite c!197 (_2!207 lt!5031) thiss!1486) (ite c!197 (_2!207 lt!5033) thiss!1486)))))

(declare-fun b!3956 () Bool)

(declare-fun e!2561 () Bool)

(declare-fun lt!5060 () (_ BitVec 64))

(assert (=> b!3956 (= e!2561 (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 thiss!1486))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486)) lt!5060))))

(declare-fun b!3957 () Bool)

(declare-fun lt!5040 () tuple2!390)

(assert (=> b!3957 (= e!2560 (= (bitStreamReadBitsIntoList!0 (_2!207 lt!5062) (_1!208 lt!5040) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!207 lt!5062) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!3957 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3957 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!5070 () Unit!278)

(declare-fun lt!5046 () Unit!278)

(assert (=> b!3957 (= lt!5070 lt!5046)))

(assert (=> b!3957 (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!5062)))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486)) lt!5060)))

(assert (=> b!3957 (= lt!5046 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!444 (_2!207 lt!5062)) lt!5060))))

(assert (=> b!3957 e!2561))

(declare-fun res!5378 () Bool)

(assert (=> b!3957 (=> (not res!5378) (not e!2561))))

(assert (=> b!3957 (= res!5378 (and (= (size!126 (buf!444 thiss!1486)) (size!126 (buf!444 (_2!207 lt!5062)))) (bvsge lt!5060 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3957 (= lt!5060 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!3957 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3957 (= lt!5040 (reader!0 thiss!1486 (_2!207 lt!5062)))))

(declare-fun b!3958 () Bool)

(declare-fun res!5379 () Bool)

(assert (=> b!3958 (=> (not res!5379) (not e!2560))))

(assert (=> b!3958 (= res!5379 (= (size!126 (buf!444 (_2!207 lt!5062))) (size!126 (buf!444 thiss!1486))))))

(declare-fun b!3959 () Bool)

(declare-fun Unit!299 () Unit!278)

(assert (=> b!3959 (= e!2562 (tuple2!389 Unit!299 (_2!207 lt!5033)))))

(declare-fun appendBitFromByte!0 (BitStream!230 (_ BitVec 8) (_ BitVec 32)) tuple2!388)

(assert (=> b!3959 (= lt!5031 (appendBitFromByte!0 thiss!1486 (select (arr!513 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!5063 () (_ BitVec 64))

(assert (=> b!3959 (= lt!5063 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!5041 () (_ BitVec 64))

(assert (=> b!3959 (= lt!5041 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!5054 () Unit!278)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!230 BitStream!230 (_ BitVec 64) (_ BitVec 64)) Unit!278)

(assert (=> b!3959 (= lt!5054 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!207 lt!5031) lt!5063 lt!5041))))

(assert (=> b!3959 (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!5031)))) ((_ sign_extend 32) (currentByte!1417 (_2!207 lt!5031))) ((_ sign_extend 32) (currentBit!1412 (_2!207 lt!5031))) (bvsub lt!5063 lt!5041))))

(declare-fun lt!5061 () Unit!278)

(assert (=> b!3959 (= lt!5061 lt!5054)))

(declare-fun lt!5055 () tuple2!390)

(assert (=> b!3959 (= lt!5055 (reader!0 thiss!1486 (_2!207 lt!5031)))))

(declare-fun lt!5029 () (_ BitVec 64))

(assert (=> b!3959 (= lt!5029 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!5068 () Unit!278)

(assert (=> b!3959 (= lt!5068 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!444 (_2!207 lt!5031)) lt!5029))))

(assert (=> b!3959 (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!5031)))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486)) lt!5029)))

(declare-fun lt!5071 () Unit!278)

(assert (=> b!3959 (= lt!5071 lt!5068)))

(declare-fun head!19 (List!26) Bool)

(assert (=> b!3959 (= (head!19 (byteArrayBitContentToList!0 (_2!207 lt!5031) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!19 (bitStreamReadBitsIntoList!0 (_2!207 lt!5031) (_1!208 lt!5055) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!5065 () Unit!278)

(declare-fun Unit!300 () Unit!278)

(assert (=> b!3959 (= lt!5065 Unit!300)))

(assert (=> b!3959 (= lt!5033 (appendBitsMSBFirstLoop!0 (_2!207 lt!5031) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!5072 () Unit!278)

(assert (=> b!3959 (= lt!5072 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!207 lt!5031) (_2!207 lt!5033)))))

(assert (=> b!3959 (isPrefixOf!0 thiss!1486 (_2!207 lt!5033))))

(declare-fun lt!5045 () Unit!278)

(assert (=> b!3959 (= lt!5045 lt!5072)))

(assert (=> b!3959 (= (size!126 (buf!444 (_2!207 lt!5033))) (size!126 (buf!444 thiss!1486)))))

(declare-fun lt!5052 () Unit!278)

(declare-fun Unit!301 () Unit!278)

(assert (=> b!3959 (= lt!5052 Unit!301)))

(assert (=> b!3959 (= (bitIndex!0 (size!126 (buf!444 (_2!207 lt!5033))) (currentByte!1417 (_2!207 lt!5033)) (currentBit!1412 (_2!207 lt!5033))) (bvsub (bvadd (bitIndex!0 (size!126 (buf!444 thiss!1486)) (currentByte!1417 thiss!1486) (currentBit!1412 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!5032 () Unit!278)

(declare-fun Unit!302 () Unit!278)

(assert (=> b!3959 (= lt!5032 Unit!302)))

(assert (=> b!3959 (= (bitIndex!0 (size!126 (buf!444 (_2!207 lt!5033))) (currentByte!1417 (_2!207 lt!5033)) (currentBit!1412 (_2!207 lt!5033))) (bvsub (bvsub (bvadd (bitIndex!0 (size!126 (buf!444 (_2!207 lt!5031))) (currentByte!1417 (_2!207 lt!5031)) (currentBit!1412 (_2!207 lt!5031))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!5056 () Unit!278)

(declare-fun Unit!303 () Unit!278)

(assert (=> b!3959 (= lt!5056 Unit!303)))

(declare-fun lt!5059 () tuple2!390)

(assert (=> b!3959 (= lt!5059 (reader!0 thiss!1486 (_2!207 lt!5033)))))

(declare-fun lt!5035 () (_ BitVec 64))

(assert (=> b!3959 (= lt!5035 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!5048 () Unit!278)

(assert (=> b!3959 (= lt!5048 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!444 (_2!207 lt!5033)) lt!5035))))

(assert (=> b!3959 (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!5033)))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486)) lt!5035)))

(declare-fun lt!5043 () Unit!278)

(assert (=> b!3959 (= lt!5043 lt!5048)))

(declare-fun lt!5047 () tuple2!390)

(assert (=> b!3959 (= lt!5047 call!47)))

(declare-fun lt!5044 () (_ BitVec 64))

(assert (=> b!3959 (= lt!5044 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!5030 () Unit!278)

(assert (=> b!3959 (= lt!5030 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!207 lt!5031) (buf!444 (_2!207 lt!5033)) lt!5044))))

(assert (=> b!3959 (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!5033)))) ((_ sign_extend 32) (currentByte!1417 (_2!207 lt!5031))) ((_ sign_extend 32) (currentBit!1412 (_2!207 lt!5031))) lt!5044)))

(declare-fun lt!5042 () Unit!278)

(assert (=> b!3959 (= lt!5042 lt!5030)))

(declare-fun lt!5067 () List!26)

(assert (=> b!3959 (= lt!5067 (byteArrayBitContentToList!0 (_2!207 lt!5033) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!5057 () List!26)

(assert (=> b!3959 (= lt!5057 (byteArrayBitContentToList!0 (_2!207 lt!5033) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!5036 () List!26)

(assert (=> b!3959 (= lt!5036 (bitStreamReadBitsIntoList!0 (_2!207 lt!5033) (_1!208 lt!5059) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!5034 () List!26)

(assert (=> b!3959 (= lt!5034 (bitStreamReadBitsIntoList!0 (_2!207 lt!5033) (_1!208 lt!5047) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!5058 () (_ BitVec 64))

(assert (=> b!3959 (= lt!5058 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!5039 () Unit!278)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!230 BitStream!230 BitStream!230 BitStream!230 (_ BitVec 64) List!26) Unit!278)

(assert (=> b!3959 (= lt!5039 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!207 lt!5033) (_2!207 lt!5033) (_1!208 lt!5059) (_1!208 lt!5047) lt!5058 lt!5036))))

(declare-fun tail!27 (List!26) List!26)

(assert (=> b!3959 (= (bitStreamReadBitsIntoList!0 (_2!207 lt!5033) (_1!208 lt!5047) (bvsub lt!5058 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!27 lt!5036))))

(declare-fun lt!5064 () Unit!278)

(assert (=> b!3959 (= lt!5064 lt!5039)))

(declare-fun lt!5049 () (_ BitVec 64))

(declare-fun lt!5053 () Unit!278)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!304 array!304 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!278)

(assert (=> b!3959 (= lt!5053 (arrayBitRangesEqImpliesEq!0 (buf!444 (_2!207 lt!5031)) (buf!444 (_2!207 lt!5033)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!5049 (bitIndex!0 (size!126 (buf!444 (_2!207 lt!5031))) (currentByte!1417 (_2!207 lt!5031)) (currentBit!1412 (_2!207 lt!5031)))))))

(declare-fun bitAt!0 (array!304 (_ BitVec 64)) Bool)

(assert (=> b!3959 (= (bitAt!0 (buf!444 (_2!207 lt!5031)) lt!5049) (bitAt!0 (buf!444 (_2!207 lt!5033)) lt!5049))))

(declare-fun lt!5066 () Unit!278)

(assert (=> b!3959 (= lt!5066 lt!5053)))

(declare-fun b!3955 () Bool)

(declare-fun res!5374 () Bool)

(assert (=> b!3955 (=> (not res!5374) (not e!2560))))

(assert (=> b!3955 (= res!5374 (invariant!0 (currentBit!1412 (_2!207 lt!5062)) (currentByte!1417 (_2!207 lt!5062)) (size!126 (buf!444 (_2!207 lt!5062)))))))

(declare-fun d!1718 () Bool)

(assert (=> d!1718 e!2560))

(declare-fun res!5375 () Bool)

(assert (=> d!1718 (=> (not res!5375) (not e!2560))))

(declare-fun lt!5038 () (_ BitVec 64))

(assert (=> d!1718 (= res!5375 (= (bitIndex!0 (size!126 (buf!444 (_2!207 lt!5062))) (currentByte!1417 (_2!207 lt!5062)) (currentBit!1412 (_2!207 lt!5062))) (bvsub lt!5038 from!367)))))

(assert (=> d!1718 (or (= (bvand lt!5038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5038 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5038 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!5051 () (_ BitVec 64))

(assert (=> d!1718 (= lt!5038 (bvadd lt!5051 from!367 nBits!460))))

(assert (=> d!1718 (or (not (= (bvand lt!5051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!5051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!5051 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1718 (= lt!5051 (bitIndex!0 (size!126 (buf!444 thiss!1486)) (currentByte!1417 thiss!1486) (currentBit!1412 thiss!1486)))))

(assert (=> d!1718 (= lt!5062 e!2562)))

(assert (=> d!1718 (= c!197 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!5050 () Unit!278)

(declare-fun lt!5037 () Unit!278)

(assert (=> d!1718 (= lt!5050 lt!5037)))

(assert (=> d!1718 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1718 (= lt!5037 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1718 (= lt!5049 (bitIndex!0 (size!126 (buf!444 thiss!1486)) (currentByte!1417 thiss!1486) (currentBit!1412 thiss!1486)))))

(assert (=> d!1718 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1718 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!5062)))

(assert (= (and d!1718 c!197) b!3959))

(assert (= (and d!1718 (not c!197)) b!3952))

(assert (= (or b!3959 b!3952) bm!44))

(assert (= (and d!1718 res!5375) b!3955))

(assert (= (and b!3955 res!5374) b!3953))

(assert (= (and b!3953 res!5377) b!3954))

(assert (= (and b!3954 res!5376) b!3958))

(assert (= (and b!3958 res!5379) b!3957))

(assert (= (and b!3957 res!5378) b!3956))

(declare-fun m!4559 () Bool)

(assert (=> b!3954 m!4559))

(declare-fun m!4561 () Bool)

(assert (=> b!3957 m!4561))

(declare-fun m!4565 () Bool)

(assert (=> b!3957 m!4565))

(declare-fun m!4569 () Bool)

(assert (=> b!3957 m!4569))

(declare-fun m!4573 () Bool)

(assert (=> b!3957 m!4573))

(declare-fun m!4575 () Bool)

(assert (=> b!3957 m!4575))

(declare-fun m!4577 () Bool)

(assert (=> d!1718 m!4577))

(assert (=> d!1718 m!4167))

(assert (=> d!1718 m!4289))

(assert (=> d!1718 m!4291))

(declare-fun m!4579 () Bool)

(assert (=> b!3956 m!4579))

(declare-fun m!4581 () Bool)

(assert (=> b!3952 m!4581))

(declare-fun m!4583 () Bool)

(assert (=> b!3952 m!4583))

(declare-fun m!4585 () Bool)

(assert (=> b!3955 m!4585))

(declare-fun m!4587 () Bool)

(assert (=> b!3959 m!4587))

(declare-fun m!4589 () Bool)

(assert (=> b!3959 m!4589))

(declare-fun m!4591 () Bool)

(assert (=> b!3959 m!4591))

(declare-fun m!4593 () Bool)

(assert (=> b!3959 m!4593))

(declare-fun m!4595 () Bool)

(assert (=> b!3959 m!4595))

(declare-fun m!4597 () Bool)

(assert (=> b!3959 m!4597))

(declare-fun m!4599 () Bool)

(assert (=> b!3959 m!4599))

(declare-fun m!4601 () Bool)

(assert (=> b!3959 m!4601))

(declare-fun m!4603 () Bool)

(assert (=> b!3959 m!4603))

(declare-fun m!4605 () Bool)

(assert (=> b!3959 m!4605))

(declare-fun m!4607 () Bool)

(assert (=> b!3959 m!4607))

(assert (=> b!3959 m!4167))

(declare-fun m!4609 () Bool)

(assert (=> b!3959 m!4609))

(declare-fun m!4611 () Bool)

(assert (=> b!3959 m!4611))

(declare-fun m!4613 () Bool)

(assert (=> b!3959 m!4613))

(declare-fun m!4615 () Bool)

(assert (=> b!3959 m!4615))

(declare-fun m!4617 () Bool)

(assert (=> b!3959 m!4617))

(declare-fun m!4619 () Bool)

(assert (=> b!3959 m!4619))

(declare-fun m!4621 () Bool)

(assert (=> b!3959 m!4621))

(declare-fun m!4623 () Bool)

(assert (=> b!3959 m!4623))

(declare-fun m!4625 () Bool)

(assert (=> b!3959 m!4625))

(declare-fun m!4627 () Bool)

(assert (=> b!3959 m!4627))

(declare-fun m!4629 () Bool)

(assert (=> b!3959 m!4629))

(assert (=> b!3959 m!4595))

(declare-fun m!4631 () Bool)

(assert (=> b!3959 m!4631))

(declare-fun m!4633 () Bool)

(assert (=> b!3959 m!4633))

(assert (=> b!3959 m!4629))

(declare-fun m!4635 () Bool)

(assert (=> b!3959 m!4635))

(declare-fun m!4637 () Bool)

(assert (=> b!3959 m!4637))

(assert (=> b!3959 m!4621))

(declare-fun m!4639 () Bool)

(assert (=> b!3959 m!4639))

(declare-fun m!4641 () Bool)

(assert (=> b!3959 m!4641))

(declare-fun m!4643 () Bool)

(assert (=> b!3959 m!4643))

(declare-fun m!4645 () Bool)

(assert (=> b!3959 m!4645))

(assert (=> b!3959 m!4605))

(declare-fun m!4647 () Bool)

(assert (=> b!3959 m!4647))

(declare-fun m!4649 () Bool)

(assert (=> bm!44 m!4649))

(assert (=> b!3710 d!1718))

(declare-fun d!1734 () Bool)

(assert (=> d!1734 (= (array_inv!121 (buf!444 thiss!1486)) (bvsge (size!126 (buf!444 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!3716 d!1734))

(declare-fun d!1736 () Bool)

(assert (=> d!1736 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 thiss!1486))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!126 (buf!444 thiss!1486))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486))) nBits!460))))

(declare-fun bs!625 () Bool)

(assert (= bs!625 d!1736))

(declare-fun m!4651 () Bool)

(assert (=> bs!625 m!4651))

(assert (=> b!3711 d!1736))

(declare-fun d!1738 () Bool)

(declare-fun e!2569 () Bool)

(assert (=> d!1738 e!2569))

(declare-fun res!5393 () Bool)

(assert (=> d!1738 (=> (not res!5393) (not e!2569))))

(declare-fun lt!5109 () (_ BitVec 64))

(declare-fun lt!5113 () (_ BitVec 64))

(declare-fun lt!5110 () (_ BitVec 64))

(assert (=> d!1738 (= res!5393 (= lt!5113 (bvsub lt!5110 lt!5109)))))

(assert (=> d!1738 (or (= (bvand lt!5110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!5109 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5110 lt!5109) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1738 (= lt!5109 (remainingBits!0 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!4355)))) ((_ sign_extend 32) (currentByte!1417 (_2!207 lt!4355))) ((_ sign_extend 32) (currentBit!1412 (_2!207 lt!4355)))))))

(declare-fun lt!5114 () (_ BitVec 64))

(declare-fun lt!5112 () (_ BitVec 64))

(assert (=> d!1738 (= lt!5110 (bvmul lt!5114 lt!5112))))

(assert (=> d!1738 (or (= lt!5114 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!5112 (bvsdiv (bvmul lt!5114 lt!5112) lt!5114)))))

(assert (=> d!1738 (= lt!5112 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1738 (= lt!5114 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!4355)))))))

(assert (=> d!1738 (= lt!5113 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1417 (_2!207 lt!4355))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1412 (_2!207 lt!4355)))))))

(assert (=> d!1738 (invariant!0 (currentBit!1412 (_2!207 lt!4355)) (currentByte!1417 (_2!207 lt!4355)) (size!126 (buf!444 (_2!207 lt!4355))))))

(assert (=> d!1738 (= (bitIndex!0 (size!126 (buf!444 (_2!207 lt!4355))) (currentByte!1417 (_2!207 lt!4355)) (currentBit!1412 (_2!207 lt!4355))) lt!5113)))

(declare-fun b!3972 () Bool)

(declare-fun res!5392 () Bool)

(assert (=> b!3972 (=> (not res!5392) (not e!2569))))

(assert (=> b!3972 (= res!5392 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!5113))))

(declare-fun b!3973 () Bool)

(declare-fun lt!5111 () (_ BitVec 64))

(assert (=> b!3973 (= e!2569 (bvsle lt!5113 (bvmul lt!5111 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3973 (or (= lt!5111 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!5111 #b0000000000000000000000000000000000000000000000000000000000001000) lt!5111)))))

(assert (=> b!3973 (= lt!5111 ((_ sign_extend 32) (size!126 (buf!444 (_2!207 lt!4355)))))))

(assert (= (and d!1738 res!5393) b!3972))

(assert (= (and b!3972 res!5392) b!3973))

(declare-fun m!4657 () Bool)

(assert (=> d!1738 m!4657))

(assert (=> d!1738 m!4175))

(assert (=> b!3714 d!1738))

(declare-fun d!1744 () Bool)

(declare-fun e!2570 () Bool)

(assert (=> d!1744 e!2570))

(declare-fun res!5395 () Bool)

(assert (=> d!1744 (=> (not res!5395) (not e!2570))))

(declare-fun lt!5115 () (_ BitVec 64))

(declare-fun lt!5119 () (_ BitVec 64))

(declare-fun lt!5116 () (_ BitVec 64))

(assert (=> d!1744 (= res!5395 (= lt!5119 (bvsub lt!5116 lt!5115)))))

(assert (=> d!1744 (or (= (bvand lt!5116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!5115 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5116 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5116 lt!5115) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1744 (= lt!5115 (remainingBits!0 ((_ sign_extend 32) (size!126 (buf!444 thiss!1486))) ((_ sign_extend 32) (currentByte!1417 thiss!1486)) ((_ sign_extend 32) (currentBit!1412 thiss!1486))))))

(declare-fun lt!5120 () (_ BitVec 64))

(declare-fun lt!5118 () (_ BitVec 64))

(assert (=> d!1744 (= lt!5116 (bvmul lt!5120 lt!5118))))

(assert (=> d!1744 (or (= lt!5120 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!5118 (bvsdiv (bvmul lt!5120 lt!5118) lt!5120)))))

(assert (=> d!1744 (= lt!5118 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1744 (= lt!5120 ((_ sign_extend 32) (size!126 (buf!444 thiss!1486))))))

(assert (=> d!1744 (= lt!5119 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1417 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1412 thiss!1486))))))

(assert (=> d!1744 (invariant!0 (currentBit!1412 thiss!1486) (currentByte!1417 thiss!1486) (size!126 (buf!444 thiss!1486)))))

(assert (=> d!1744 (= (bitIndex!0 (size!126 (buf!444 thiss!1486)) (currentByte!1417 thiss!1486) (currentBit!1412 thiss!1486)) lt!5119)))

(declare-fun b!3974 () Bool)

(declare-fun res!5394 () Bool)

(assert (=> b!3974 (=> (not res!5394) (not e!2570))))

(assert (=> b!3974 (= res!5394 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!5119))))

(declare-fun b!3975 () Bool)

(declare-fun lt!5117 () (_ BitVec 64))

(assert (=> b!3975 (= e!2570 (bvsle lt!5119 (bvmul lt!5117 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3975 (or (= lt!5117 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!5117 #b0000000000000000000000000000000000000000000000000000000000001000) lt!5117)))))

(assert (=> b!3975 (= lt!5117 ((_ sign_extend 32) (size!126 (buf!444 thiss!1486))))))

(assert (= (and d!1744 res!5395) b!3974))

(assert (= (and b!3974 res!5394) b!3975))

(assert (=> d!1744 m!4651))

(declare-fun m!4659 () Bool)

(assert (=> d!1744 m!4659))

(assert (=> b!3714 d!1744))

(declare-fun d!1746 () Bool)

(assert (=> d!1746 (= (array_inv!121 srcBuffer!6) (bvsge (size!126 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!972 d!1746))

(declare-fun d!1748 () Bool)

(assert (=> d!1748 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1412 thiss!1486) (currentByte!1417 thiss!1486) (size!126 (buf!444 thiss!1486))))))

(declare-fun bs!627 () Bool)

(assert (= bs!627 d!1748))

(assert (=> bs!627 m!4659))

(assert (=> start!972 d!1748))

(declare-fun d!1750 () Bool)

(assert (=> d!1750 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!126 (buf!444 (_1!208 lt!4354)))) ((_ sign_extend 32) (currentByte!1417 (_1!208 lt!4354))) ((_ sign_extend 32) (currentBit!1412 (_1!208 lt!4354))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!126 (buf!444 (_1!208 lt!4354)))) ((_ sign_extend 32) (currentByte!1417 (_1!208 lt!4354))) ((_ sign_extend 32) (currentBit!1412 (_1!208 lt!4354)))) nBits!460))))

(declare-fun bs!628 () Bool)

(assert (= bs!628 d!1750))

(declare-fun m!4661 () Bool)

(assert (=> bs!628 m!4661))

(assert (=> b!3715 d!1750))

(declare-fun d!1752 () Bool)

(declare-fun res!5403 () Bool)

(declare-fun e!2576 () Bool)

(assert (=> d!1752 (=> (not res!5403) (not e!2576))))

(assert (=> d!1752 (= res!5403 (= (size!126 (buf!444 thiss!1486)) (size!126 (buf!444 (_2!207 lt!4355)))))))

(assert (=> d!1752 (= (isPrefixOf!0 thiss!1486 (_2!207 lt!4355)) e!2576)))

(declare-fun b!3982 () Bool)

(declare-fun res!5404 () Bool)

(assert (=> b!3982 (=> (not res!5404) (not e!2576))))

(assert (=> b!3982 (= res!5404 (bvsle (bitIndex!0 (size!126 (buf!444 thiss!1486)) (currentByte!1417 thiss!1486) (currentBit!1412 thiss!1486)) (bitIndex!0 (size!126 (buf!444 (_2!207 lt!4355))) (currentByte!1417 (_2!207 lt!4355)) (currentBit!1412 (_2!207 lt!4355)))))))

(declare-fun b!3983 () Bool)

(declare-fun e!2575 () Bool)

(assert (=> b!3983 (= e!2576 e!2575)))

(declare-fun res!5402 () Bool)

(assert (=> b!3983 (=> res!5402 e!2575)))

(assert (=> b!3983 (= res!5402 (= (size!126 (buf!444 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!3984 () Bool)

(assert (=> b!3984 (= e!2575 (arrayBitRangesEq!0 (buf!444 thiss!1486) (buf!444 (_2!207 lt!4355)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!126 (buf!444 thiss!1486)) (currentByte!1417 thiss!1486) (currentBit!1412 thiss!1486))))))

(assert (= (and d!1752 res!5403) b!3982))

(assert (= (and b!3982 res!5404) b!3983))

(assert (= (and b!3983 (not res!5402)) b!3984))

(assert (=> b!3982 m!4167))

(assert (=> b!3982 m!4165))

(assert (=> b!3984 m!4167))

(assert (=> b!3984 m!4167))

(declare-fun m!4663 () Bool)

(assert (=> b!3984 m!4663))

(assert (=> b!3713 d!1752))

(push 1)

(assert (not bm!44))

(assert (not b!3956))

(assert (not d!1686))

(assert (not b!3799))

(assert (not d!1718))

(assert (not b!3984))

(assert (not d!1744))

(assert (not b!3878))

(assert (not b!3768))

(assert (not b!3837))

(assert (not b!3798))

(assert (not b!3795))

(assert (not b!3796))

(assert (not b!3836))

(assert (not d!1738))

(assert (not d!1748))

(assert (not b!3957))

(assert (not b!3982))

(assert (not b!3954))

(assert (not d!1672))

(assert (not b!3879))

(assert (not b!3875))

(assert (not d!1680))

(assert (not b!3959))

(assert (not b!3835))

(assert (not d!1736))

(assert (not d!1698))

(assert (not d!1750))

(assert (not b!3955))

(assert (not b!3952))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

