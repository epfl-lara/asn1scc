; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1106 () Bool)

(assert start!1106)

(declare-fun b!4651 () Bool)

(declare-fun res!5979 () Bool)

(declare-fun e!3050 () Bool)

(assert (=> b!4651 (=> (not res!5979) (not e!3050))))

(declare-datatypes ((array!369 0))(
  ( (array!370 (arr!547 (Array (_ BitVec 32) (_ BitVec 8))) (size!157 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!292 0))(
  ( (BitStream!293 (buf!478 array!369) (currentByte!1457 (_ BitVec 32)) (currentBit!1452 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!364 0))(
  ( (Unit!365) )
))
(declare-datatypes ((tuple2!586 0))(
  ( (tuple2!587 (_1!309 Unit!364) (_2!309 BitStream!292)) )
))
(declare-fun lt!5584 () tuple2!586)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!292)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!4651 (= res!5979 (= (bitIndex!0 (size!157 (buf!478 (_2!309 lt!5584))) (currentByte!1457 (_2!309 lt!5584)) (currentBit!1452 (_2!309 lt!5584))) (bvadd (bitIndex!0 (size!157 (buf!478 thiss!1486)) (currentByte!1457 thiss!1486) (currentBit!1452 thiss!1486)) nBits!460)))))

(declare-fun b!4652 () Bool)

(declare-fun e!3052 () Bool)

(declare-fun array_inv!152 (array!369) Bool)

(assert (=> b!4652 (= e!3052 (array_inv!152 (buf!478 thiss!1486)))))

(declare-fun b!4653 () Bool)

(declare-fun res!5982 () Bool)

(declare-fun e!3049 () Bool)

(assert (=> b!4653 (=> (not res!5982) (not e!3049))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4653 (= res!5982 (validate_offset_bits!1 ((_ sign_extend 32) (size!157 (buf!478 thiss!1486))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486)) nBits!460))))

(declare-fun b!4654 () Bool)

(declare-fun res!5985 () Bool)

(assert (=> b!4654 (=> (not res!5985) (not e!3050))))

(declare-fun isPrefixOf!0 (BitStream!292 BitStream!292) Bool)

(assert (=> b!4654 (= res!5985 (isPrefixOf!0 thiss!1486 (_2!309 lt!5584)))))

(declare-fun b!4655 () Bool)

(assert (=> b!4655 (= e!3049 e!3050)))

(declare-fun res!5983 () Bool)

(assert (=> b!4655 (=> (not res!5983) (not e!3050))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!4655 (= res!5983 (invariant!0 (currentBit!1452 (_2!309 lt!5584)) (currentByte!1457 (_2!309 lt!5584)) (size!157 (buf!478 (_2!309 lt!5584)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!369)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!292 array!369 (_ BitVec 64) (_ BitVec 64)) tuple2!586)

(assert (=> b!4655 (= lt!5584 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!4656 () Bool)

(declare-fun e!3048 () Bool)

(assert (=> b!4656 (= e!3050 (not e!3048))))

(declare-fun res!5984 () Bool)

(assert (=> b!4656 (=> res!5984 e!3048)))

(declare-datatypes ((List!57 0))(
  ( (Nil!54) (Cons!53 (h!172 Bool) (t!807 List!57)) )
))
(declare-fun lt!5583 () List!57)

(declare-datatypes ((tuple2!588 0))(
  ( (tuple2!589 (_1!310 array!369) (_2!310 BitStream!292)) )
))
(declare-fun lt!5585 () tuple2!588)

(declare-fun byteArrayBitContentToList!0 (BitStream!292 array!369 (_ BitVec 64) (_ BitVec 64)) List!57)

(assert (=> b!4656 (= res!5984 (not (= (byteArrayBitContentToList!0 (_2!309 lt!5584) (_1!310 lt!5585) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!5583)))))

(declare-datatypes ((tuple2!590 0))(
  ( (tuple2!591 (_1!311 BitStream!292) (_2!311 BitStream!292)) )
))
(declare-fun lt!5581 () tuple2!590)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!292 BitStream!292 (_ BitVec 64)) List!57)

(assert (=> b!4656 (= lt!5583 (bitStreamReadBitsIntoList!0 (_2!309 lt!5584) (_1!311 lt!5581) nBits!460))))

(declare-fun readBits!0 (BitStream!292 (_ BitVec 64)) tuple2!588)

(assert (=> b!4656 (= lt!5585 (readBits!0 (_1!311 lt!5581) nBits!460))))

(assert (=> b!4656 (validate_offset_bits!1 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5584)))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486)) nBits!460)))

(declare-fun lt!5582 () Unit!364)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!292 array!369 (_ BitVec 64)) Unit!364)

(assert (=> b!4656 (= lt!5582 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!478 (_2!309 lt!5584)) nBits!460))))

(declare-fun reader!0 (BitStream!292 BitStream!292) tuple2!590)

(assert (=> b!4656 (= lt!5581 (reader!0 thiss!1486 (_2!309 lt!5584)))))

(declare-fun b!4657 () Bool)

(declare-fun res!5980 () Bool)

(assert (=> b!4657 (=> res!5980 e!3048)))

(assert (=> b!4657 (= res!5980 (not (= lt!5583 (byteArrayBitContentToList!0 (_2!309 lt!5584) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!4658 () Bool)

(declare-fun res!5986 () Bool)

(assert (=> b!4658 (=> (not res!5986) (not e!3050))))

(assert (=> b!4658 (= res!5986 (= (size!157 (buf!478 thiss!1486)) (size!157 (buf!478 (_2!309 lt!5584)))))))

(declare-fun res!5981 () Bool)

(assert (=> start!1106 (=> (not res!5981) (not e!3049))))

(assert (=> start!1106 (= res!5981 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!157 srcBuffer!6))))))))

(assert (=> start!1106 e!3049))

(assert (=> start!1106 true))

(assert (=> start!1106 (array_inv!152 srcBuffer!6)))

(declare-fun inv!12 (BitStream!292) Bool)

(assert (=> start!1106 (and (inv!12 thiss!1486) e!3052)))

(declare-fun b!4659 () Bool)

(assert (=> b!4659 (= e!3048 (or (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle nBits!460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!157 (_1!310 lt!5585)))))))))

(assert (= (and start!1106 res!5981) b!4653))

(assert (= (and b!4653 res!5982) b!4655))

(assert (= (and b!4655 res!5983) b!4658))

(assert (= (and b!4658 res!5986) b!4651))

(assert (= (and b!4651 res!5979) b!4654))

(assert (= (and b!4654 res!5985) b!4656))

(assert (= (and b!4656 (not res!5984)) b!4657))

(assert (= (and b!4657 (not res!5980)) b!4659))

(assert (= start!1106 b!4652))

(declare-fun m!5517 () Bool)

(assert (=> b!4654 m!5517))

(declare-fun m!5519 () Bool)

(assert (=> b!4655 m!5519))

(declare-fun m!5521 () Bool)

(assert (=> b!4655 m!5521))

(declare-fun m!5523 () Bool)

(assert (=> b!4651 m!5523))

(declare-fun m!5525 () Bool)

(assert (=> b!4651 m!5525))

(declare-fun m!5527 () Bool)

(assert (=> b!4653 m!5527))

(declare-fun m!5529 () Bool)

(assert (=> b!4657 m!5529))

(declare-fun m!5531 () Bool)

(assert (=> b!4652 m!5531))

(declare-fun m!5533 () Bool)

(assert (=> b!4656 m!5533))

(declare-fun m!5535 () Bool)

(assert (=> b!4656 m!5535))

(declare-fun m!5537 () Bool)

(assert (=> b!4656 m!5537))

(declare-fun m!5539 () Bool)

(assert (=> b!4656 m!5539))

(declare-fun m!5541 () Bool)

(assert (=> b!4656 m!5541))

(declare-fun m!5543 () Bool)

(assert (=> b!4656 m!5543))

(declare-fun m!5545 () Bool)

(assert (=> start!1106 m!5545))

(declare-fun m!5547 () Bool)

(assert (=> start!1106 m!5547))

(push 1)

(assert (not b!4657))

(assert (not b!4656))

(assert (not start!1106))

(assert (not b!4652))

(assert (not b!4655))

(assert (not b!4651))

(assert (not b!4653))

(assert (not b!4654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1794 () Bool)

(assert (=> d!1794 (= (invariant!0 (currentBit!1452 (_2!309 lt!5584)) (currentByte!1457 (_2!309 lt!5584)) (size!157 (buf!478 (_2!309 lt!5584)))) (and (bvsge (currentBit!1452 (_2!309 lt!5584)) #b00000000000000000000000000000000) (bvslt (currentBit!1452 (_2!309 lt!5584)) #b00000000000000000000000000001000) (bvsge (currentByte!1457 (_2!309 lt!5584)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1457 (_2!309 lt!5584)) (size!157 (buf!478 (_2!309 lt!5584)))) (and (= (currentBit!1452 (_2!309 lt!5584)) #b00000000000000000000000000000000) (= (currentByte!1457 (_2!309 lt!5584)) (size!157 (buf!478 (_2!309 lt!5584))))))))))

(assert (=> b!4655 d!1794))

(declare-fun b!4799 () Bool)

(declare-fun res!6099 () Bool)

(declare-fun e!3128 () Bool)

(assert (=> b!4799 (=> (not res!6099) (not e!3128))))

(declare-fun lt!5951 () tuple2!586)

(assert (=> b!4799 (= res!6099 (invariant!0 (currentBit!1452 (_2!309 lt!5951)) (currentByte!1457 (_2!309 lt!5951)) (size!157 (buf!478 (_2!309 lt!5951)))))))

(declare-fun b!4800 () Bool)

(declare-fun res!6095 () Bool)

(assert (=> b!4800 (=> (not res!6095) (not e!3128))))

(assert (=> b!4800 (= res!6095 (= (size!157 (buf!478 (_2!309 lt!5951))) (size!157 (buf!478 thiss!1486))))))

(declare-fun b!4801 () Bool)

(declare-fun res!6097 () Bool)

(assert (=> b!4801 (=> (not res!6097) (not e!3128))))

(assert (=> b!4801 (= res!6097 (= (size!157 (buf!478 thiss!1486)) (size!157 (buf!478 (_2!309 lt!5951)))))))

(declare-fun b!4802 () Bool)

(declare-fun e!3129 () Bool)

(declare-fun lt!5963 () (_ BitVec 64))

(assert (=> b!4802 (= e!3129 (validate_offset_bits!1 ((_ sign_extend 32) (size!157 (buf!478 thiss!1486))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486)) lt!5963))))

(declare-fun bm!52 () Bool)

(declare-fun lt!5959 () tuple2!586)

(declare-fun call!55 () tuple2!590)

(declare-fun c!211 () Bool)

(assert (=> bm!52 (= call!55 (reader!0 thiss!1486 (ite c!211 (_2!309 lt!5959) thiss!1486)))))

(declare-fun b!4803 () Bool)

(declare-fun lt!5966 () tuple2!590)

(assert (=> b!4803 (= e!3128 (= (bitStreamReadBitsIntoList!0 (_2!309 lt!5951) (_1!311 lt!5966) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!309 lt!5951) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!4803 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4803 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!5968 () Unit!364)

(declare-fun lt!5952 () Unit!364)

(assert (=> b!4803 (= lt!5968 lt!5952)))

(assert (=> b!4803 (validate_offset_bits!1 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5951)))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486)) lt!5963)))

(assert (=> b!4803 (= lt!5952 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!478 (_2!309 lt!5951)) lt!5963))))

(assert (=> b!4803 e!3129))

(declare-fun res!6094 () Bool)

(assert (=> b!4803 (=> (not res!6094) (not e!3129))))

(assert (=> b!4803 (= res!6094 (and (= (size!157 (buf!478 thiss!1486)) (size!157 (buf!478 (_2!309 lt!5951)))) (bvsge lt!5963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4803 (= lt!5963 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!4803 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4803 (= lt!5966 (reader!0 thiss!1486 (_2!309 lt!5951)))))

(declare-fun b!4804 () Bool)

(declare-fun e!3127 () tuple2!586)

(declare-fun Unit!384 () Unit!364)

(assert (=> b!4804 (= e!3127 (tuple2!587 Unit!384 (_2!309 lt!5959)))))

(declare-fun lt!5985 () tuple2!586)

(declare-fun appendBitFromByte!0 (BitStream!292 (_ BitVec 8) (_ BitVec 32)) tuple2!586)

(assert (=> b!4804 (= lt!5985 (appendBitFromByte!0 thiss!1486 (select (arr!547 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!5975 () (_ BitVec 64))

(assert (=> b!4804 (= lt!5975 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!5974 () (_ BitVec 64))

(assert (=> b!4804 (= lt!5974 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!5978 () Unit!364)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!292 BitStream!292 (_ BitVec 64) (_ BitVec 64)) Unit!364)

(assert (=> b!4804 (= lt!5978 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!309 lt!5985) lt!5975 lt!5974))))

(assert (=> b!4804 (validate_offset_bits!1 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5985)))) ((_ sign_extend 32) (currentByte!1457 (_2!309 lt!5985))) ((_ sign_extend 32) (currentBit!1452 (_2!309 lt!5985))) (bvsub lt!5975 lt!5974))))

(declare-fun lt!5991 () Unit!364)

(assert (=> b!4804 (= lt!5991 lt!5978)))

(declare-fun lt!5962 () tuple2!590)

(assert (=> b!4804 (= lt!5962 (reader!0 thiss!1486 (_2!309 lt!5985)))))

(declare-fun lt!5969 () (_ BitVec 64))

(assert (=> b!4804 (= lt!5969 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!5977 () Unit!364)

(assert (=> b!4804 (= lt!5977 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!478 (_2!309 lt!5985)) lt!5969))))

(assert (=> b!4804 (validate_offset_bits!1 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5985)))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486)) lt!5969)))

(declare-fun lt!5950 () Unit!364)

(assert (=> b!4804 (= lt!5950 lt!5977)))

(declare-fun head!22 (List!57) Bool)

(assert (=> b!4804 (= (head!22 (byteArrayBitContentToList!0 (_2!309 lt!5985) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!22 (bitStreamReadBitsIntoList!0 (_2!309 lt!5985) (_1!311 lt!5962) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!5989 () Unit!364)

(declare-fun Unit!385 () Unit!364)

(assert (=> b!4804 (= lt!5989 Unit!385)))

(assert (=> b!4804 (= lt!5959 (appendBitsMSBFirstLoop!0 (_2!309 lt!5985) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!5971 () Unit!364)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!292 BitStream!292 BitStream!292) Unit!364)

(assert (=> b!4804 (= lt!5971 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!309 lt!5985) (_2!309 lt!5959)))))

(assert (=> b!4804 (isPrefixOf!0 thiss!1486 (_2!309 lt!5959))))

(declare-fun lt!5954 () Unit!364)

(assert (=> b!4804 (= lt!5954 lt!5971)))

(assert (=> b!4804 (= (size!157 (buf!478 (_2!309 lt!5959))) (size!157 (buf!478 thiss!1486)))))

(declare-fun lt!5960 () Unit!364)

(declare-fun Unit!386 () Unit!364)

(assert (=> b!4804 (= lt!5960 Unit!386)))

(assert (=> b!4804 (= (bitIndex!0 (size!157 (buf!478 (_2!309 lt!5959))) (currentByte!1457 (_2!309 lt!5959)) (currentBit!1452 (_2!309 lt!5959))) (bvsub (bvadd (bitIndex!0 (size!157 (buf!478 thiss!1486)) (currentByte!1457 thiss!1486) (currentBit!1452 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!5983 () Unit!364)

(declare-fun Unit!387 () Unit!364)

(assert (=> b!4804 (= lt!5983 Unit!387)))

(assert (=> b!4804 (= (bitIndex!0 (size!157 (buf!478 (_2!309 lt!5959))) (currentByte!1457 (_2!309 lt!5959)) (currentBit!1452 (_2!309 lt!5959))) (bvsub (bvsub (bvadd (bitIndex!0 (size!157 (buf!478 (_2!309 lt!5985))) (currentByte!1457 (_2!309 lt!5985)) (currentBit!1452 (_2!309 lt!5985))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!5987 () Unit!364)

(declare-fun Unit!388 () Unit!364)

(assert (=> b!4804 (= lt!5987 Unit!388)))

(declare-fun lt!5982 () tuple2!590)

(assert (=> b!4804 (= lt!5982 call!55)))

(declare-fun lt!5973 () (_ BitVec 64))

(assert (=> b!4804 (= lt!5973 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!5964 () Unit!364)

(assert (=> b!4804 (= lt!5964 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!478 (_2!309 lt!5959)) lt!5973))))

(assert (=> b!4804 (validate_offset_bits!1 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5959)))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486)) lt!5973)))

(declare-fun lt!5981 () Unit!364)

(assert (=> b!4804 (= lt!5981 lt!5964)))

(declare-fun lt!5958 () tuple2!590)

(assert (=> b!4804 (= lt!5958 (reader!0 (_2!309 lt!5985) (_2!309 lt!5959)))))

(declare-fun lt!5956 () (_ BitVec 64))

(assert (=> b!4804 (= lt!5956 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!5976 () Unit!364)

(assert (=> b!4804 (= lt!5976 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!309 lt!5985) (buf!478 (_2!309 lt!5959)) lt!5956))))

(assert (=> b!4804 (validate_offset_bits!1 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5959)))) ((_ sign_extend 32) (currentByte!1457 (_2!309 lt!5985))) ((_ sign_extend 32) (currentBit!1452 (_2!309 lt!5985))) lt!5956)))

(declare-fun lt!5967 () Unit!364)

(assert (=> b!4804 (= lt!5967 lt!5976)))

(declare-fun lt!5986 () List!57)

(assert (=> b!4804 (= lt!5986 (byteArrayBitContentToList!0 (_2!309 lt!5959) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!5955 () List!57)

(assert (=> b!4804 (= lt!5955 (byteArrayBitContentToList!0 (_2!309 lt!5959) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!5961 () List!57)

(assert (=> b!4804 (= lt!5961 (bitStreamReadBitsIntoList!0 (_2!309 lt!5959) (_1!311 lt!5982) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!5965 () List!57)

(assert (=> b!4804 (= lt!5965 (bitStreamReadBitsIntoList!0 (_2!309 lt!5959) (_1!311 lt!5958) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!5948 () (_ BitVec 64))

(assert (=> b!4804 (= lt!5948 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!5972 () Unit!364)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!292 BitStream!292 BitStream!292 BitStream!292 (_ BitVec 64) List!57) Unit!364)

(assert (=> b!4804 (= lt!5972 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!309 lt!5959) (_2!309 lt!5959) (_1!311 lt!5982) (_1!311 lt!5958) lt!5948 lt!5961))))

(declare-fun tail!30 (List!57) List!57)

(assert (=> b!4804 (= (bitStreamReadBitsIntoList!0 (_2!309 lt!5959) (_1!311 lt!5958) (bvsub lt!5948 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!30 lt!5961))))

(declare-fun lt!5970 () Unit!364)

(assert (=> b!4804 (= lt!5970 lt!5972)))

(declare-fun lt!5957 () (_ BitVec 64))

(declare-fun lt!5953 () Unit!364)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!369 array!369 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!364)

(assert (=> b!4804 (= lt!5953 (arrayBitRangesEqImpliesEq!0 (buf!478 (_2!309 lt!5985)) (buf!478 (_2!309 lt!5959)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!5957 (bitIndex!0 (size!157 (buf!478 (_2!309 lt!5985))) (currentByte!1457 (_2!309 lt!5985)) (currentBit!1452 (_2!309 lt!5985)))))))

(declare-fun bitAt!0 (array!369 (_ BitVec 64)) Bool)

(assert (=> b!4804 (= (bitAt!0 (buf!478 (_2!309 lt!5985)) lt!5957) (bitAt!0 (buf!478 (_2!309 lt!5959)) lt!5957))))

(declare-fun lt!5984 () Unit!364)

(assert (=> b!4804 (= lt!5984 lt!5953)))

(declare-fun b!4805 () Bool)

(declare-fun res!6098 () Bool)

(assert (=> b!4805 (=> (not res!6098) (not e!3128))))

(assert (=> b!4805 (= res!6098 (isPrefixOf!0 thiss!1486 (_2!309 lt!5951)))))

(declare-fun b!4806 () Bool)

(declare-fun Unit!390 () Unit!364)

(assert (=> b!4806 (= e!3127 (tuple2!587 Unit!390 thiss!1486))))

(assert (=> b!4806 (= (size!157 (buf!478 thiss!1486)) (size!157 (buf!478 thiss!1486)))))

(declare-fun lt!5979 () Unit!364)

(declare-fun Unit!391 () Unit!364)

(assert (=> b!4806 (= lt!5979 Unit!391)))

(declare-fun checkByteArrayBitContent!0 (BitStream!292 array!369 array!369 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4806 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!310 (readBits!0 (_1!311 call!55) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun d!1798 () Bool)

(assert (=> d!1798 e!3128))

(declare-fun res!6096 () Bool)

(assert (=> d!1798 (=> (not res!6096) (not e!3128))))

(declare-fun lt!5949 () (_ BitVec 64))

(assert (=> d!1798 (= res!6096 (= (bitIndex!0 (size!157 (buf!478 (_2!309 lt!5951))) (currentByte!1457 (_2!309 lt!5951)) (currentBit!1452 (_2!309 lt!5951))) (bvsub lt!5949 from!367)))))

(assert (=> d!1798 (or (= (bvand lt!5949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!5949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!5949 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!5988 () (_ BitVec 64))

(assert (=> d!1798 (= lt!5949 (bvadd lt!5988 from!367 nBits!460))))

(assert (=> d!1798 (or (not (= (bvand lt!5988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!5988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!5988 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1798 (= lt!5988 (bitIndex!0 (size!157 (buf!478 thiss!1486)) (currentByte!1457 thiss!1486) (currentBit!1452 thiss!1486)))))

(assert (=> d!1798 (= lt!5951 e!3127)))

(assert (=> d!1798 (= c!211 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!5980 () Unit!364)

(declare-fun lt!5990 () Unit!364)

(assert (=> d!1798 (= lt!5980 lt!5990)))

(assert (=> d!1798 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!292) Unit!364)

(assert (=> d!1798 (= lt!5990 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1798 (= lt!5957 (bitIndex!0 (size!157 (buf!478 thiss!1486)) (currentByte!1457 thiss!1486) (currentBit!1452 thiss!1486)))))

(assert (=> d!1798 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1798 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!5951)))

(assert (= (and d!1798 c!211) b!4804))

(assert (= (and d!1798 (not c!211)) b!4806))

(assert (= (or b!4804 b!4806) bm!52))

(assert (= (and d!1798 res!6096) b!4799))

(assert (= (and b!4799 res!6099) b!4801))

(assert (= (and b!4801 res!6097) b!4805))

(assert (= (and b!4805 res!6098) b!4800))

(assert (= (and b!4800 res!6095) b!4803))

(assert (= (and b!4803 res!6094) b!4802))

(declare-fun m!5729 () Bool)

(assert (=> bm!52 m!5729))

(declare-fun m!5731 () Bool)

(assert (=> b!4802 m!5731))

(declare-fun m!5733 () Bool)

(assert (=> b!4805 m!5733))

(declare-fun m!5735 () Bool)

(assert (=> b!4806 m!5735))

(declare-fun m!5737 () Bool)

(assert (=> b!4806 m!5737))

(declare-fun m!5739 () Bool)

(assert (=> d!1798 m!5739))

(assert (=> d!1798 m!5525))

(declare-fun m!5741 () Bool)

(assert (=> d!1798 m!5741))

(declare-fun m!5743 () Bool)

(assert (=> d!1798 m!5743))

(declare-fun m!5745 () Bool)

(assert (=> b!4799 m!5745))

(declare-fun m!5747 () Bool)

(assert (=> b!4803 m!5747))

(declare-fun m!5749 () Bool)

(assert (=> b!4803 m!5749))

(declare-fun m!5751 () Bool)

(assert (=> b!4803 m!5751))

(declare-fun m!5753 () Bool)

(assert (=> b!4803 m!5753))

(declare-fun m!5755 () Bool)

(assert (=> b!4803 m!5755))

(declare-fun m!5757 () Bool)

(assert (=> b!4804 m!5757))

(declare-fun m!5759 () Bool)

(assert (=> b!4804 m!5759))

(declare-fun m!5761 () Bool)

(assert (=> b!4804 m!5761))

(declare-fun m!5763 () Bool)

(assert (=> b!4804 m!5763))

(declare-fun m!5765 () Bool)

(assert (=> b!4804 m!5765))

(declare-fun m!5767 () Bool)

(assert (=> b!4804 m!5767))

(declare-fun m!5769 () Bool)

(assert (=> b!4804 m!5769))

(declare-fun m!5771 () Bool)

(assert (=> b!4804 m!5771))

(declare-fun m!5773 () Bool)

(assert (=> b!4804 m!5773))

(declare-fun m!5775 () Bool)

(assert (=> b!4804 m!5775))

(declare-fun m!5777 () Bool)

(assert (=> b!4804 m!5777))

(declare-fun m!5779 () Bool)

(assert (=> b!4804 m!5779))

(declare-fun m!5781 () Bool)

(assert (=> b!4804 m!5781))

(assert (=> b!4804 m!5777))

(declare-fun m!5783 () Bool)

(assert (=> b!4804 m!5783))

(declare-fun m!5785 () Bool)

(assert (=> b!4804 m!5785))

(assert (=> b!4804 m!5525))

(declare-fun m!5787 () Bool)

(assert (=> b!4804 m!5787))

(declare-fun m!5789 () Bool)

(assert (=> b!4804 m!5789))

(declare-fun m!5791 () Bool)

(assert (=> b!4804 m!5791))

(declare-fun m!5793 () Bool)

(assert (=> b!4804 m!5793))

(declare-fun m!5795 () Bool)

(assert (=> b!4804 m!5795))

(declare-fun m!5797 () Bool)

(assert (=> b!4804 m!5797))

(declare-fun m!5799 () Bool)

(assert (=> b!4804 m!5799))

(assert (=> b!4804 m!5775))

(declare-fun m!5801 () Bool)

(assert (=> b!4804 m!5801))

(declare-fun m!5803 () Bool)

(assert (=> b!4804 m!5803))

(declare-fun m!5805 () Bool)

(assert (=> b!4804 m!5805))

(declare-fun m!5807 () Bool)

(assert (=> b!4804 m!5807))

(assert (=> b!4804 m!5799))

(declare-fun m!5809 () Bool)

(assert (=> b!4804 m!5809))

(declare-fun m!5811 () Bool)

(assert (=> b!4804 m!5811))

(assert (=> b!4804 m!5803))

(declare-fun m!5813 () Bool)

(assert (=> b!4804 m!5813))

(declare-fun m!5815 () Bool)

(assert (=> b!4804 m!5815))

(declare-fun m!5817 () Bool)

(assert (=> b!4804 m!5817))

(assert (=> b!4655 d!1798))

(declare-fun d!1808 () Bool)

(assert (=> d!1808 (= (array_inv!152 srcBuffer!6) (bvsge (size!157 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1106 d!1808))

(declare-fun d!1810 () Bool)

(assert (=> d!1810 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1452 thiss!1486) (currentByte!1457 thiss!1486) (size!157 (buf!478 thiss!1486))))))

(declare-fun bs!665 () Bool)

(assert (= bs!665 d!1810))

(declare-fun m!5819 () Bool)

(assert (=> bs!665 m!5819))

(assert (=> start!1106 d!1810))

(declare-fun d!1812 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1812 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5584)))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5584)))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486))) nBits!460))))

(declare-fun bs!666 () Bool)

(assert (= bs!666 d!1812))

(declare-fun m!5821 () Bool)

(assert (=> bs!666 m!5821))

(assert (=> b!4656 d!1812))

(declare-fun b!4840 () Bool)

(declare-fun e!3141 () Bool)

(declare-fun lt!6125 () tuple2!588)

(assert (=> b!4840 (= e!3141 (= (byteArrayBitContentToList!0 (_2!310 lt!6125) (_1!310 lt!6125) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!310 lt!6125) (_1!311 lt!5581) nBits!460)))))

(declare-fun b!4841 () Bool)

(declare-fun res!6127 () Bool)

(assert (=> b!4841 (=> (not res!6127) (not e!3141))))

(assert (=> b!4841 (= res!6127 (invariant!0 (currentBit!1452 (_2!310 lt!6125)) (currentByte!1457 (_2!310 lt!6125)) (size!157 (buf!478 (_2!310 lt!6125)))))))

(declare-fun b!4842 () Bool)

(declare-fun res!6126 () Bool)

(assert (=> b!4842 (=> (not res!6126) (not e!3141))))

(declare-fun lt!6124 () (_ BitVec 64))

(assert (=> b!4842 (= res!6126 (= (size!157 (_1!310 lt!6125)) ((_ extract 31 0) lt!6124)))))

(assert (=> b!4842 (and (bvslt lt!6124 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!6124 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!6121 () (_ BitVec 64))

(declare-fun lt!6118 () (_ BitVec 64))

(assert (=> b!4842 (= lt!6124 (bvsdiv lt!6121 lt!6118))))

(assert (=> b!4842 (and (not (= lt!6118 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!6121 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!6118 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!4842 (= lt!6118 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!6117 () (_ BitVec 64))

(declare-fun lt!6120 () (_ BitVec 64))

(assert (=> b!4842 (= lt!6121 (bvsub lt!6117 lt!6120))))

(assert (=> b!4842 (or (= (bvand lt!6117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6120 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6117 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6117 lt!6120) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4842 (= lt!6120 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!6119 () (_ BitVec 64))

(assert (=> b!4842 (= lt!6117 (bvadd nBits!460 lt!6119))))

(assert (=> b!4842 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6119 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!6119) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4842 (= lt!6119 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!4844 () Bool)

(declare-fun res!6125 () Bool)

(assert (=> b!4844 (=> (not res!6125) (not e!3141))))

(assert (=> b!4844 (= res!6125 (bvsle (currentByte!1457 (_1!311 lt!5581)) (currentByte!1457 (_2!310 lt!6125))))))

(declare-fun d!1814 () Bool)

(assert (=> d!1814 e!3141))

(declare-fun res!6129 () Bool)

(assert (=> d!1814 (=> (not res!6129) (not e!3141))))

(assert (=> d!1814 (= res!6129 (= (buf!478 (_2!310 lt!6125)) (buf!478 (_1!311 lt!5581))))))

(declare-datatypes ((tuple3!36 0))(
  ( (tuple3!37 (_1!324 Unit!364) (_2!324 BitStream!292) (_3!18 array!369)) )
))
(declare-fun lt!6122 () tuple3!36)

(assert (=> d!1814 (= lt!6125 (tuple2!589 (_3!18 lt!6122) (_2!324 lt!6122)))))

(declare-fun readBitsLoop!0 (BitStream!292 (_ BitVec 64) array!369 (_ BitVec 64) (_ BitVec 64)) tuple3!36)

(assert (=> d!1814 (= lt!6122 (readBitsLoop!0 (_1!311 lt!5581) nBits!460 (array!370 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1814 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1814 (= (readBits!0 (_1!311 lt!5581) nBits!460) lt!6125)))

(declare-fun b!4843 () Bool)

(declare-fun res!6128 () Bool)

(assert (=> b!4843 (=> (not res!6128) (not e!3141))))

(declare-fun lt!6123 () (_ BitVec 64))

(assert (=> b!4843 (= res!6128 (= (bvadd lt!6123 nBits!460) (bitIndex!0 (size!157 (buf!478 (_2!310 lt!6125))) (currentByte!1457 (_2!310 lt!6125)) (currentBit!1452 (_2!310 lt!6125)))))))

(assert (=> b!4843 (or (not (= (bvand lt!6123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!6123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!6123 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4843 (= lt!6123 (bitIndex!0 (size!157 (buf!478 (_1!311 lt!5581))) (currentByte!1457 (_1!311 lt!5581)) (currentBit!1452 (_1!311 lt!5581))))))

(assert (= (and d!1814 res!6129) b!4843))

(assert (= (and b!4843 res!6128) b!4841))

(assert (= (and b!4841 res!6127) b!4842))

(assert (= (and b!4842 res!6126) b!4844))

(assert (= (and b!4844 res!6125) b!4840))

(declare-fun m!5939 () Bool)

(assert (=> b!4840 m!5939))

(declare-fun m!5941 () Bool)

(assert (=> b!4840 m!5941))

(declare-fun m!5943 () Bool)

(assert (=> b!4841 m!5943))

(declare-fun m!5945 () Bool)

(assert (=> d!1814 m!5945))

(declare-fun m!5947 () Bool)

(assert (=> b!4843 m!5947))

(declare-fun m!5949 () Bool)

(assert (=> b!4843 m!5949))

(assert (=> b!4656 d!1814))

(declare-fun lt!6179 () (_ BitVec 64))

(declare-fun b!4879 () Bool)

(declare-datatypes ((tuple2!612 0))(
  ( (tuple2!613 (_1!325 List!57) (_2!325 BitStream!292)) )
))
(declare-fun e!3152 () tuple2!612)

(declare-datatypes ((tuple2!614 0))(
  ( (tuple2!615 (_1!326 Bool) (_2!326 BitStream!292)) )
))
(declare-fun lt!6178 () tuple2!614)

(assert (=> b!4879 (= e!3152 (tuple2!613 (Cons!53 (_1!326 lt!6178) (bitStreamReadBitsIntoList!0 (_2!309 lt!5584) (_2!326 lt!6178) (bvsub nBits!460 lt!6179))) (_2!326 lt!6178)))))

(declare-fun readBit!0 (BitStream!292) tuple2!614)

(assert (=> b!4879 (= lt!6178 (readBit!0 (_1!311 lt!5581)))))

(assert (=> b!4879 (= lt!6179 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!4880 () Bool)

(declare-fun e!3151 () Bool)

(declare-fun lt!6177 () List!57)

(declare-fun isEmpty!12 (List!57) Bool)

(assert (=> b!4880 (= e!3151 (isEmpty!12 lt!6177))))

(declare-fun b!4881 () Bool)

(declare-fun length!7 (List!57) Int)

(assert (=> b!4881 (= e!3151 (> (length!7 lt!6177) 0))))

(declare-fun b!4878 () Bool)

(assert (=> b!4878 (= e!3152 (tuple2!613 Nil!54 (_1!311 lt!5581)))))

(declare-fun d!1822 () Bool)

(assert (=> d!1822 e!3151))

(declare-fun c!221 () Bool)

(assert (=> d!1822 (= c!221 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1822 (= lt!6177 (_1!325 e!3152))))

(declare-fun c!220 () Bool)

(assert (=> d!1822 (= c!220 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1822 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1822 (= (bitStreamReadBitsIntoList!0 (_2!309 lt!5584) (_1!311 lt!5581) nBits!460) lt!6177)))

(assert (= (and d!1822 c!220) b!4878))

(assert (= (and d!1822 (not c!220)) b!4879))

(assert (= (and d!1822 c!221) b!4880))

(assert (= (and d!1822 (not c!221)) b!4881))

(declare-fun m!5963 () Bool)

(assert (=> b!4879 m!5963))

(declare-fun m!5965 () Bool)

(assert (=> b!4879 m!5965))

(declare-fun m!5967 () Bool)

(assert (=> b!4880 m!5967))

(declare-fun m!5969 () Bool)

(assert (=> b!4881 m!5969))

(assert (=> b!4656 d!1822))

(declare-fun d!1826 () Bool)

(declare-fun c!224 () Bool)

(assert (=> d!1826 (= c!224 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3156 () List!57)

(assert (=> d!1826 (= (byteArrayBitContentToList!0 (_2!309 lt!5584) (_1!310 lt!5585) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3156)))

(declare-fun b!4891 () Bool)

(assert (=> b!4891 (= e!3156 Nil!54)))

(declare-fun b!4892 () Bool)

(assert (=> b!4892 (= e!3156 (Cons!53 (not (= (bvand ((_ sign_extend 24) (select (arr!547 (_1!310 lt!5585)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!309 lt!5584) (_1!310 lt!5585) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1826 c!224) b!4891))

(assert (= (and d!1826 (not c!224)) b!4892))

(declare-fun m!5983 () Bool)

(assert (=> b!4892 m!5983))

(declare-fun m!5985 () Bool)

(assert (=> b!4892 m!5985))

(declare-fun m!5987 () Bool)

(assert (=> b!4892 m!5987))

(assert (=> b!4656 d!1826))

(declare-fun b!4957 () Bool)

(declare-fun res!6193 () Bool)

(declare-fun e!3188 () Bool)

(assert (=> b!4957 (=> (not res!6193) (not e!3188))))

(declare-fun lt!6333 () tuple2!590)

(assert (=> b!4957 (= res!6193 (isPrefixOf!0 (_2!311 lt!6333) (_2!309 lt!5584)))))

(declare-fun d!1830 () Bool)

(assert (=> d!1830 e!3188))

(declare-fun res!6194 () Bool)

(assert (=> d!1830 (=> (not res!6194) (not e!3188))))

(assert (=> d!1830 (= res!6194 (isPrefixOf!0 (_1!311 lt!6333) (_2!311 lt!6333)))))

(declare-fun lt!6344 () BitStream!292)

(assert (=> d!1830 (= lt!6333 (tuple2!591 lt!6344 (_2!309 lt!5584)))))

(declare-fun lt!6347 () Unit!364)

(declare-fun lt!6335 () Unit!364)

(assert (=> d!1830 (= lt!6347 lt!6335)))

(assert (=> d!1830 (isPrefixOf!0 lt!6344 (_2!309 lt!5584))))

(assert (=> d!1830 (= lt!6335 (lemmaIsPrefixTransitive!0 lt!6344 (_2!309 lt!5584) (_2!309 lt!5584)))))

(declare-fun lt!6339 () Unit!364)

(declare-fun lt!6349 () Unit!364)

(assert (=> d!1830 (= lt!6339 lt!6349)))

(assert (=> d!1830 (isPrefixOf!0 lt!6344 (_2!309 lt!5584))))

(assert (=> d!1830 (= lt!6349 (lemmaIsPrefixTransitive!0 lt!6344 thiss!1486 (_2!309 lt!5584)))))

(declare-fun lt!6348 () Unit!364)

(declare-fun e!3189 () Unit!364)

(assert (=> d!1830 (= lt!6348 e!3189)))

(declare-fun c!241 () Bool)

(assert (=> d!1830 (= c!241 (not (= (size!157 (buf!478 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!6334 () Unit!364)

(declare-fun lt!6332 () Unit!364)

(assert (=> d!1830 (= lt!6334 lt!6332)))

(assert (=> d!1830 (isPrefixOf!0 (_2!309 lt!5584) (_2!309 lt!5584))))

(assert (=> d!1830 (= lt!6332 (lemmaIsPrefixRefl!0 (_2!309 lt!5584)))))

(declare-fun lt!6343 () Unit!364)

(declare-fun lt!6340 () Unit!364)

(assert (=> d!1830 (= lt!6343 lt!6340)))

(assert (=> d!1830 (= lt!6340 (lemmaIsPrefixRefl!0 (_2!309 lt!5584)))))

(declare-fun lt!6345 () Unit!364)

(declare-fun lt!6337 () Unit!364)

(assert (=> d!1830 (= lt!6345 lt!6337)))

(assert (=> d!1830 (isPrefixOf!0 lt!6344 lt!6344)))

(assert (=> d!1830 (= lt!6337 (lemmaIsPrefixRefl!0 lt!6344))))

(declare-fun lt!6342 () Unit!364)

(declare-fun lt!6336 () Unit!364)

(assert (=> d!1830 (= lt!6342 lt!6336)))

(assert (=> d!1830 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1830 (= lt!6336 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1830 (= lt!6344 (BitStream!293 (buf!478 (_2!309 lt!5584)) (currentByte!1457 thiss!1486) (currentBit!1452 thiss!1486)))))

(assert (=> d!1830 (isPrefixOf!0 thiss!1486 (_2!309 lt!5584))))

(assert (=> d!1830 (= (reader!0 thiss!1486 (_2!309 lt!5584)) lt!6333)))

(declare-fun b!4958 () Bool)

(declare-fun res!6192 () Bool)

(assert (=> b!4958 (=> (not res!6192) (not e!3188))))

(assert (=> b!4958 (= res!6192 (isPrefixOf!0 (_1!311 lt!6333) thiss!1486))))

(declare-fun lt!6346 () (_ BitVec 64))

(declare-fun b!4959 () Bool)

(declare-fun lt!6350 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!292 (_ BitVec 64)) BitStream!292)

(assert (=> b!4959 (= e!3188 (= (_1!311 lt!6333) (withMovedBitIndex!0 (_2!311 lt!6333) (bvsub lt!6346 lt!6350))))))

(assert (=> b!4959 (or (= (bvand lt!6346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6350 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6346 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6346 lt!6350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!4959 (= lt!6350 (bitIndex!0 (size!157 (buf!478 (_2!309 lt!5584))) (currentByte!1457 (_2!309 lt!5584)) (currentBit!1452 (_2!309 lt!5584))))))

(assert (=> b!4959 (= lt!6346 (bitIndex!0 (size!157 (buf!478 thiss!1486)) (currentByte!1457 thiss!1486) (currentBit!1452 thiss!1486)))))

(declare-fun b!4960 () Bool)

(declare-fun lt!6331 () Unit!364)

(assert (=> b!4960 (= e!3189 lt!6331)))

(declare-fun lt!6341 () (_ BitVec 64))

(assert (=> b!4960 (= lt!6341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!6338 () (_ BitVec 64))

(assert (=> b!4960 (= lt!6338 (bitIndex!0 (size!157 (buf!478 thiss!1486)) (currentByte!1457 thiss!1486) (currentBit!1452 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!369 array!369 (_ BitVec 64) (_ BitVec 64)) Unit!364)

(assert (=> b!4960 (= lt!6331 (arrayBitRangesEqSymmetric!0 (buf!478 thiss!1486) (buf!478 (_2!309 lt!5584)) lt!6341 lt!6338))))

(declare-fun arrayBitRangesEq!0 (array!369 array!369 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!4960 (arrayBitRangesEq!0 (buf!478 (_2!309 lt!5584)) (buf!478 thiss!1486) lt!6341 lt!6338)))

(declare-fun b!4961 () Bool)

(declare-fun Unit!393 () Unit!364)

(assert (=> b!4961 (= e!3189 Unit!393)))

(assert (= (and d!1830 c!241) b!4960))

(assert (= (and d!1830 (not c!241)) b!4961))

(assert (= (and d!1830 res!6194) b!4958))

(assert (= (and b!4958 res!6192) b!4957))

(assert (= (and b!4957 res!6193) b!4959))

(assert (=> b!4960 m!5525))

(declare-fun m!6045 () Bool)

(assert (=> b!4960 m!6045))

(declare-fun m!6049 () Bool)

(assert (=> b!4960 m!6049))

(declare-fun m!6053 () Bool)

(assert (=> b!4958 m!6053))

(declare-fun m!6055 () Bool)

(assert (=> b!4959 m!6055))

(assert (=> b!4959 m!5523))

(assert (=> b!4959 m!5525))

(declare-fun m!6057 () Bool)

(assert (=> d!1830 m!6057))

(assert (=> d!1830 m!5517))

(declare-fun m!6059 () Bool)

(assert (=> d!1830 m!6059))

(declare-fun m!6061 () Bool)

(assert (=> d!1830 m!6061))

(assert (=> d!1830 m!5743))

(declare-fun m!6063 () Bool)

(assert (=> d!1830 m!6063))

(declare-fun m!6065 () Bool)

(assert (=> d!1830 m!6065))

(declare-fun m!6067 () Bool)

(assert (=> d!1830 m!6067))

(assert (=> d!1830 m!5741))

(declare-fun m!6069 () Bool)

(assert (=> d!1830 m!6069))

(declare-fun m!6071 () Bool)

(assert (=> d!1830 m!6071))

(declare-fun m!6073 () Bool)

(assert (=> b!4957 m!6073))

(assert (=> b!4656 d!1830))

(declare-fun d!1854 () Bool)

(assert (=> d!1854 (validate_offset_bits!1 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5584)))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486)) nBits!460)))

(declare-fun lt!6356 () Unit!364)

(declare-fun choose!9 (BitStream!292 array!369 (_ BitVec 64) BitStream!292) Unit!364)

(assert (=> d!1854 (= lt!6356 (choose!9 thiss!1486 (buf!478 (_2!309 lt!5584)) nBits!460 (BitStream!293 (buf!478 (_2!309 lt!5584)) (currentByte!1457 thiss!1486) (currentBit!1452 thiss!1486))))))

(assert (=> d!1854 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!478 (_2!309 lt!5584)) nBits!460) lt!6356)))

(declare-fun bs!672 () Bool)

(assert (= bs!672 d!1854))

(assert (=> bs!672 m!5535))

(declare-fun m!6075 () Bool)

(assert (=> bs!672 m!6075))

(assert (=> b!4656 d!1854))

(declare-fun d!1860 () Bool)

(declare-fun res!6201 () Bool)

(declare-fun e!3197 () Bool)

(assert (=> d!1860 (=> (not res!6201) (not e!3197))))

(assert (=> d!1860 (= res!6201 (= (size!157 (buf!478 thiss!1486)) (size!157 (buf!478 (_2!309 lt!5584)))))))

(assert (=> d!1860 (= (isPrefixOf!0 thiss!1486 (_2!309 lt!5584)) e!3197)))

(declare-fun b!4974 () Bool)

(declare-fun res!6202 () Bool)

(assert (=> b!4974 (=> (not res!6202) (not e!3197))))

(assert (=> b!4974 (= res!6202 (bvsle (bitIndex!0 (size!157 (buf!478 thiss!1486)) (currentByte!1457 thiss!1486) (currentBit!1452 thiss!1486)) (bitIndex!0 (size!157 (buf!478 (_2!309 lt!5584))) (currentByte!1457 (_2!309 lt!5584)) (currentBit!1452 (_2!309 lt!5584)))))))

(declare-fun b!4975 () Bool)

(declare-fun e!3198 () Bool)

(assert (=> b!4975 (= e!3197 e!3198)))

(declare-fun res!6203 () Bool)

(assert (=> b!4975 (=> res!6203 e!3198)))

(assert (=> b!4975 (= res!6203 (= (size!157 (buf!478 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!4976 () Bool)

(assert (=> b!4976 (= e!3198 (arrayBitRangesEq!0 (buf!478 thiss!1486) (buf!478 (_2!309 lt!5584)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!157 (buf!478 thiss!1486)) (currentByte!1457 thiss!1486) (currentBit!1452 thiss!1486))))))

(assert (= (and d!1860 res!6201) b!4974))

(assert (= (and b!4974 res!6202) b!4975))

(assert (= (and b!4975 (not res!6203)) b!4976))

(assert (=> b!4974 m!5525))

(assert (=> b!4974 m!5523))

(assert (=> b!4976 m!5525))

(assert (=> b!4976 m!5525))

(declare-fun m!6077 () Bool)

(assert (=> b!4976 m!6077))

(assert (=> b!4654 d!1860))

(declare-fun d!1862 () Bool)

(assert (=> d!1862 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!157 (buf!478 thiss!1486))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!157 (buf!478 thiss!1486))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486))) nBits!460))))

(declare-fun bs!673 () Bool)

(assert (= bs!673 d!1862))

(declare-fun m!6079 () Bool)

(assert (=> bs!673 m!6079))

(assert (=> b!4653 d!1862))

(declare-fun d!1864 () Bool)

(declare-fun e!3201 () Bool)

(assert (=> d!1864 e!3201))

(declare-fun res!6209 () Bool)

(assert (=> d!1864 (=> (not res!6209) (not e!3201))))

(declare-fun lt!6372 () (_ BitVec 64))

(declare-fun lt!6371 () (_ BitVec 64))

(declare-fun lt!6374 () (_ BitVec 64))

(assert (=> d!1864 (= res!6209 (= lt!6371 (bvsub lt!6372 lt!6374)))))

(assert (=> d!1864 (or (= (bvand lt!6372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6374 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6372 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6372 lt!6374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1864 (= lt!6374 (remainingBits!0 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5584)))) ((_ sign_extend 32) (currentByte!1457 (_2!309 lt!5584))) ((_ sign_extend 32) (currentBit!1452 (_2!309 lt!5584)))))))

(declare-fun lt!6369 () (_ BitVec 64))

(declare-fun lt!6370 () (_ BitVec 64))

(assert (=> d!1864 (= lt!6372 (bvmul lt!6369 lt!6370))))

(assert (=> d!1864 (or (= lt!6369 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!6370 (bvsdiv (bvmul lt!6369 lt!6370) lt!6369)))))

(assert (=> d!1864 (= lt!6370 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1864 (= lt!6369 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5584)))))))

(assert (=> d!1864 (= lt!6371 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1457 (_2!309 lt!5584))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1452 (_2!309 lt!5584)))))))

(assert (=> d!1864 (invariant!0 (currentBit!1452 (_2!309 lt!5584)) (currentByte!1457 (_2!309 lt!5584)) (size!157 (buf!478 (_2!309 lt!5584))))))

(assert (=> d!1864 (= (bitIndex!0 (size!157 (buf!478 (_2!309 lt!5584))) (currentByte!1457 (_2!309 lt!5584)) (currentBit!1452 (_2!309 lt!5584))) lt!6371)))

(declare-fun b!4981 () Bool)

(declare-fun res!6208 () Bool)

(assert (=> b!4981 (=> (not res!6208) (not e!3201))))

(assert (=> b!4981 (= res!6208 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!6371))))

(declare-fun b!4982 () Bool)

(declare-fun lt!6373 () (_ BitVec 64))

(assert (=> b!4982 (= e!3201 (bvsle lt!6371 (bvmul lt!6373 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!4982 (or (= lt!6373 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!6373 #b0000000000000000000000000000000000000000000000000000000000001000) lt!6373)))))

(assert (=> b!4982 (= lt!6373 ((_ sign_extend 32) (size!157 (buf!478 (_2!309 lt!5584)))))))

(assert (= (and d!1864 res!6209) b!4981))

(assert (= (and b!4981 res!6208) b!4982))

(declare-fun m!6081 () Bool)

(assert (=> d!1864 m!6081))

(assert (=> d!1864 m!5519))

(assert (=> b!4651 d!1864))

(declare-fun d!1866 () Bool)

(declare-fun e!3202 () Bool)

(assert (=> d!1866 e!3202))

(declare-fun res!6211 () Bool)

(assert (=> d!1866 (=> (not res!6211) (not e!3202))))

(declare-fun lt!6378 () (_ BitVec 64))

(declare-fun lt!6380 () (_ BitVec 64))

(declare-fun lt!6377 () (_ BitVec 64))

(assert (=> d!1866 (= res!6211 (= lt!6377 (bvsub lt!6378 lt!6380)))))

(assert (=> d!1866 (or (= (bvand lt!6378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!6380 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!6378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!6378 lt!6380) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1866 (= lt!6380 (remainingBits!0 ((_ sign_extend 32) (size!157 (buf!478 thiss!1486))) ((_ sign_extend 32) (currentByte!1457 thiss!1486)) ((_ sign_extend 32) (currentBit!1452 thiss!1486))))))

(declare-fun lt!6375 () (_ BitVec 64))

(declare-fun lt!6376 () (_ BitVec 64))

(assert (=> d!1866 (= lt!6378 (bvmul lt!6375 lt!6376))))

(assert (=> d!1866 (or (= lt!6375 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!6376 (bvsdiv (bvmul lt!6375 lt!6376) lt!6375)))))

(assert (=> d!1866 (= lt!6376 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1866 (= lt!6375 ((_ sign_extend 32) (size!157 (buf!478 thiss!1486))))))

(assert (=> d!1866 (= lt!6377 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1457 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1452 thiss!1486))))))

(assert (=> d!1866 (invariant!0 (currentBit!1452 thiss!1486) (currentByte!1457 thiss!1486) (size!157 (buf!478 thiss!1486)))))

(assert (=> d!1866 (= (bitIndex!0 (size!157 (buf!478 thiss!1486)) (currentByte!1457 thiss!1486) (currentBit!1452 thiss!1486)) lt!6377)))

(declare-fun b!4983 () Bool)

(declare-fun res!6210 () Bool)

(assert (=> b!4983 (=> (not res!6210) (not e!3202))))

(assert (=> b!4983 (= res!6210 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!6377))))

(declare-fun b!4984 () Bool)

(declare-fun lt!6379 () (_ BitVec 64))

(assert (=> b!4984 (= e!3202 (bvsle lt!6377 (bvmul lt!6379 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!4984 (or (= lt!6379 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!6379 #b0000000000000000000000000000000000000000000000000000000000001000) lt!6379)))))

(assert (=> b!4984 (= lt!6379 ((_ sign_extend 32) (size!157 (buf!478 thiss!1486))))))

(assert (= (and d!1866 res!6211) b!4983))

(assert (= (and b!4983 res!6210) b!4984))

(assert (=> d!1866 m!6079))

(assert (=> d!1866 m!5819))

(assert (=> b!4651 d!1866))

(declare-fun d!1868 () Bool)

(declare-fun c!245 () Bool)

(assert (=> d!1868 (= c!245 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3203 () List!57)

(assert (=> d!1868 (= (byteArrayBitContentToList!0 (_2!309 lt!5584) srcBuffer!6 from!367 nBits!460) e!3203)))

(declare-fun b!4985 () Bool)

(assert (=> b!4985 (= e!3203 Nil!54)))

(declare-fun b!4986 () Bool)

(assert (=> b!4986 (= e!3203 (Cons!53 (not (= (bvand ((_ sign_extend 24) (select (arr!547 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!309 lt!5584) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!1868 c!245) b!4985))

(assert (= (and d!1868 (not c!245)) b!4986))

(assert (=> b!4986 m!5775))

(declare-fun m!6083 () Bool)

(assert (=> b!4986 m!6083))

(declare-fun m!6085 () Bool)

(assert (=> b!4986 m!6085))

(assert (=> b!4657 d!1868))

(declare-fun d!1870 () Bool)

(assert (=> d!1870 (= (array_inv!152 (buf!478 thiss!1486)) (bvsge (size!157 (buf!478 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!4652 d!1870))

(push 1)

(assert (not b!4960))

(assert (not b!4806))

(assert (not d!1814))

(assert (not b!4799))

(assert (not b!4805))

(assert (not d!1798))

(assert (not b!4803))

(assert (not d!1862))

(assert (not b!4881))

(assert (not b!4986))

(assert (not b!4804))

(assert (not bm!52))

(assert (not b!4974))

(assert (not b!4976))

(assert (not d!1812))

(assert (not d!1810))

(assert (not b!4892))

(assert (not b!4840))

(assert (not b!4879))

(assert (not d!1830))

(assert (not d!1864))

(assert (not b!4959))

(assert (not b!4841))

(assert (not d!1866))

(assert (not b!4843))

(assert (not d!1854))

(assert (not b!4880))

(assert (not b!4957))

(assert (not b!4958))

(assert (not b!4802))

(check-sat)

(pop 1)

(push 1)

(check-sat)

