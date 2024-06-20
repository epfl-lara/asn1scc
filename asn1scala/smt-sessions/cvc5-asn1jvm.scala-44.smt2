; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!890 () Bool)

(assert start!890)

(declare-fun b!3258 () Bool)

(declare-fun res!4840 () Bool)

(declare-fun e!2205 () Bool)

(assert (=> b!3258 (=> (not res!4840) (not e!2205))))

(declare-datatypes ((array!279 0))(
  ( (array!280 (arr!502 (Array (_ BitVec 32) (_ BitVec 8))) (size!115 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!208 0))(
  ( (BitStream!209 (buf!430 array!279) (currentByte!1397 (_ BitVec 32)) (currentBit!1392 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!208)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3258 (= res!4840 (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 thiss!1486))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486)) nBits!460))))

(declare-fun b!3259 () Bool)

(declare-fun res!4842 () Bool)

(declare-fun e!2206 () Bool)

(assert (=> b!3259 (=> (not res!4842) (not e!2206))))

(declare-datatypes ((Unit!232 0))(
  ( (Unit!233) )
))
(declare-datatypes ((tuple2!322 0))(
  ( (tuple2!323 (_1!171 Unit!232) (_2!171 BitStream!208)) )
))
(declare-fun lt!3475 () tuple2!322)

(assert (=> b!3259 (= res!4842 (= (size!115 (buf!430 thiss!1486)) (size!115 (buf!430 (_2!171 lt!3475)))))))

(declare-fun res!4841 () Bool)

(assert (=> start!890 (=> (not res!4841) (not e!2205))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!279)

(assert (=> start!890 (= res!4841 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!115 srcBuffer!6))))))))

(assert (=> start!890 e!2205))

(assert (=> start!890 true))

(declare-fun array_inv!110 (array!279) Bool)

(assert (=> start!890 (array_inv!110 srcBuffer!6)))

(declare-fun e!2207 () Bool)

(declare-fun inv!12 (BitStream!208) Bool)

(assert (=> start!890 (and (inv!12 thiss!1486) e!2207)))

(declare-fun b!3260 () Bool)

(assert (=> b!3260 (= e!2207 (array_inv!110 (buf!430 thiss!1486)))))

(declare-fun b!3261 () Bool)

(assert (=> b!3261 (= e!2205 e!2206)))

(declare-fun res!4839 () Bool)

(assert (=> b!3261 (=> (not res!4839) (not e!2206))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!3261 (= res!4839 (invariant!0 (currentBit!1392 (_2!171 lt!3475)) (currentByte!1397 (_2!171 lt!3475)) (size!115 (buf!430 (_2!171 lt!3475)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!208 array!279 (_ BitVec 64) (_ BitVec 64)) tuple2!322)

(assert (=> b!3261 (= lt!3475 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!3262 () Bool)

(declare-fun res!4838 () Bool)

(assert (=> b!3262 (=> (not res!4838) (not e!2206))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!3262 (= res!4838 (= (bitIndex!0 (size!115 (buf!430 (_2!171 lt!3475))) (currentByte!1397 (_2!171 lt!3475)) (currentBit!1392 (_2!171 lt!3475))) (bvadd (bitIndex!0 (size!115 (buf!430 thiss!1486)) (currentByte!1397 thiss!1486) (currentBit!1392 thiss!1486)) nBits!460)))))

(declare-fun b!3263 () Bool)

(declare-fun res!4843 () Bool)

(assert (=> b!3263 (=> (not res!4843) (not e!2206))))

(declare-fun isPrefixOf!0 (BitStream!208 BitStream!208) Bool)

(assert (=> b!3263 (= res!4843 (isPrefixOf!0 thiss!1486 (_2!171 lt!3475)))))

(declare-fun b!3264 () Bool)

(declare-datatypes ((tuple2!324 0))(
  ( (tuple2!325 (_1!172 BitStream!208) (_2!172 BitStream!208)) )
))
(declare-fun lt!3473 () tuple2!324)

(assert (=> b!3264 (= e!2206 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 (_1!172 lt!3473)))) ((_ sign_extend 32) (currentByte!1397 (_1!172 lt!3473))) ((_ sign_extend 32) (currentBit!1392 (_1!172 lt!3473))) nBits!460)))))

(declare-datatypes ((tuple2!326 0))(
  ( (tuple2!327 (_1!173 array!279) (_2!173 BitStream!208)) )
))
(declare-fun lt!3474 () tuple2!326)

(declare-fun readBits!0 (BitStream!208 (_ BitVec 64)) tuple2!326)

(assert (=> b!3264 (= lt!3474 (readBits!0 (_1!172 lt!3473) nBits!460))))

(assert (=> b!3264 (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3475)))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486)) nBits!460)))

(declare-fun lt!3476 () Unit!232)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!208 array!279 (_ BitVec 64)) Unit!232)

(assert (=> b!3264 (= lt!3476 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!430 (_2!171 lt!3475)) nBits!460))))

(declare-fun reader!0 (BitStream!208 BitStream!208) tuple2!324)

(assert (=> b!3264 (= lt!3473 (reader!0 thiss!1486 (_2!171 lt!3475)))))

(assert (= (and start!890 res!4841) b!3258))

(assert (= (and b!3258 res!4840) b!3261))

(assert (= (and b!3261 res!4839) b!3259))

(assert (= (and b!3259 res!4842) b!3262))

(assert (= (and b!3262 res!4838) b!3263))

(assert (= (and b!3263 res!4843) b!3264))

(assert (= start!890 b!3260))

(declare-fun m!3423 () Bool)

(assert (=> b!3261 m!3423))

(declare-fun m!3425 () Bool)

(assert (=> b!3261 m!3425))

(declare-fun m!3427 () Bool)

(assert (=> b!3258 m!3427))

(declare-fun m!3429 () Bool)

(assert (=> b!3263 m!3429))

(declare-fun m!3431 () Bool)

(assert (=> start!890 m!3431))

(declare-fun m!3433 () Bool)

(assert (=> start!890 m!3433))

(declare-fun m!3435 () Bool)

(assert (=> b!3264 m!3435))

(declare-fun m!3437 () Bool)

(assert (=> b!3264 m!3437))

(declare-fun m!3439 () Bool)

(assert (=> b!3264 m!3439))

(declare-fun m!3441 () Bool)

(assert (=> b!3264 m!3441))

(declare-fun m!3443 () Bool)

(assert (=> b!3264 m!3443))

(declare-fun m!3445 () Bool)

(assert (=> b!3260 m!3445))

(declare-fun m!3447 () Bool)

(assert (=> b!3262 m!3447))

(declare-fun m!3449 () Bool)

(assert (=> b!3262 m!3449))

(push 1)

(assert (not b!3263))

(assert (not b!3261))

(assert (not b!3264))

(assert (not b!3262))

(assert (not b!3260))

(assert (not start!890))

(assert (not b!3258))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1574 () Bool)

(assert (=> d!1574 (= (invariant!0 (currentBit!1392 (_2!171 lt!3475)) (currentByte!1397 (_2!171 lt!3475)) (size!115 (buf!430 (_2!171 lt!3475)))) (and (bvsge (currentBit!1392 (_2!171 lt!3475)) #b00000000000000000000000000000000) (bvslt (currentBit!1392 (_2!171 lt!3475)) #b00000000000000000000000000001000) (bvsge (currentByte!1397 (_2!171 lt!3475)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1397 (_2!171 lt!3475)) (size!115 (buf!430 (_2!171 lt!3475)))) (and (= (currentBit!1392 (_2!171 lt!3475)) #b00000000000000000000000000000000) (= (currentByte!1397 (_2!171 lt!3475)) (size!115 (buf!430 (_2!171 lt!3475))))))))))

(assert (=> b!3261 d!1574))

(declare-fun b!3403 () Bool)

(declare-fun res!4961 () Bool)

(declare-fun e!2279 () Bool)

(assert (=> b!3403 (=> (not res!4961) (not e!2279))))

(declare-fun lt!3841 () tuple2!322)

(assert (=> b!3403 (= res!4961 (isPrefixOf!0 thiss!1486 (_2!171 lt!3841)))))

(declare-fun b!3404 () Bool)

(declare-fun res!4960 () Bool)

(assert (=> b!3404 (=> (not res!4960) (not e!2279))))

(assert (=> b!3404 (= res!4960 (invariant!0 (currentBit!1392 (_2!171 lt!3841)) (currentByte!1397 (_2!171 lt!3841)) (size!115 (buf!430 (_2!171 lt!3841)))))))

(declare-fun b!3405 () Bool)

(declare-fun e!2278 () tuple2!322)

(declare-fun Unit!245 () Unit!232)

(assert (=> b!3405 (= e!2278 (tuple2!323 Unit!245 thiss!1486))))

(assert (=> b!3405 (= (size!115 (buf!430 thiss!1486)) (size!115 (buf!430 thiss!1486)))))

(declare-fun lt!3848 () Unit!232)

(declare-fun Unit!246 () Unit!232)

(assert (=> b!3405 (= lt!3848 Unit!246)))

(declare-fun call!35 () tuple2!324)

(declare-fun checkByteArrayBitContent!0 (BitStream!208 array!279 array!279 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3405 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!173 (readBits!0 (_1!172 call!35) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!3407 () Bool)

(declare-fun e!2280 () Bool)

(declare-fun lt!3862 () (_ BitVec 64))

(assert (=> b!3407 (= e!2280 (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 thiss!1486))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486)) lt!3862))))

(declare-fun b!3408 () Bool)

(declare-fun res!4964 () Bool)

(assert (=> b!3408 (=> (not res!4964) (not e!2279))))

(assert (=> b!3408 (= res!4964 (= (size!115 (buf!430 (_2!171 lt!3841))) (size!115 (buf!430 thiss!1486))))))

(declare-fun lt!3881 () tuple2!324)

(declare-fun b!3409 () Bool)

(declare-datatypes ((List!16 0))(
  ( (Nil!13) (Cons!12 (h!131 Bool) (t!766 List!16)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!208 BitStream!208 (_ BitVec 64)) List!16)

(declare-fun byteArrayBitContentToList!0 (BitStream!208 array!279 (_ BitVec 64) (_ BitVec 64)) List!16)

(assert (=> b!3409 (= e!2279 (= (bitStreamReadBitsIntoList!0 (_2!171 lt!3841) (_1!172 lt!3881) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!171 lt!3841) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!3409 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3409 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!3854 () Unit!232)

(declare-fun lt!3845 () Unit!232)

(assert (=> b!3409 (= lt!3854 lt!3845)))

(assert (=> b!3409 (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3841)))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486)) lt!3862)))

(assert (=> b!3409 (= lt!3845 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!430 (_2!171 lt!3841)) lt!3862))))

(assert (=> b!3409 e!2280))

(declare-fun res!4965 () Bool)

(assert (=> b!3409 (=> (not res!4965) (not e!2280))))

(assert (=> b!3409 (= res!4965 (and (= (size!115 (buf!430 thiss!1486)) (size!115 (buf!430 (_2!171 lt!3841)))) (bvsge lt!3862 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3409 (= lt!3862 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!3409 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3409 (= lt!3881 (reader!0 thiss!1486 (_2!171 lt!3841)))))

(declare-fun b!3410 () Bool)

(declare-fun lt!3871 () tuple2!322)

(declare-fun Unit!247 () Unit!232)

(assert (=> b!3410 (= e!2278 (tuple2!323 Unit!247 (_2!171 lt!3871)))))

(declare-fun lt!3879 () tuple2!322)

(declare-fun appendBitFromByte!0 (BitStream!208 (_ BitVec 8) (_ BitVec 32)) tuple2!322)

(assert (=> b!3410 (= lt!3879 (appendBitFromByte!0 thiss!1486 (select (arr!502 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!3838 () (_ BitVec 64))

(assert (=> b!3410 (= lt!3838 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3865 () (_ BitVec 64))

(assert (=> b!3410 (= lt!3865 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3875 () Unit!232)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!208 BitStream!208 (_ BitVec 64) (_ BitVec 64)) Unit!232)

(assert (=> b!3410 (= lt!3875 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!171 lt!3879) lt!3838 lt!3865))))

(assert (=> b!3410 (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3879)))) ((_ sign_extend 32) (currentByte!1397 (_2!171 lt!3879))) ((_ sign_extend 32) (currentBit!1392 (_2!171 lt!3879))) (bvsub lt!3838 lt!3865))))

(declare-fun lt!3851 () Unit!232)

(assert (=> b!3410 (= lt!3851 lt!3875)))

(declare-fun lt!3861 () tuple2!324)

(assert (=> b!3410 (= lt!3861 (reader!0 thiss!1486 (_2!171 lt!3879)))))

(declare-fun lt!3843 () (_ BitVec 64))

(assert (=> b!3410 (= lt!3843 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3867 () Unit!232)

(assert (=> b!3410 (= lt!3867 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!430 (_2!171 lt!3879)) lt!3843))))

(assert (=> b!3410 (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3879)))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486)) lt!3843)))

(declare-fun lt!3870 () Unit!232)

(assert (=> b!3410 (= lt!3870 lt!3867)))

(declare-fun head!15 (List!16) Bool)

(assert (=> b!3410 (= (head!15 (byteArrayBitContentToList!0 (_2!171 lt!3879) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!15 (bitStreamReadBitsIntoList!0 (_2!171 lt!3879) (_1!172 lt!3861) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3878 () Unit!232)

(declare-fun Unit!248 () Unit!232)

(assert (=> b!3410 (= lt!3878 Unit!248)))

(assert (=> b!3410 (= lt!3871 (appendBitsMSBFirstLoop!0 (_2!171 lt!3879) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!3840 () Unit!232)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!208 BitStream!208 BitStream!208) Unit!232)

(assert (=> b!3410 (= lt!3840 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!171 lt!3879) (_2!171 lt!3871)))))

(assert (=> b!3410 (isPrefixOf!0 thiss!1486 (_2!171 lt!3871))))

(declare-fun lt!3857 () Unit!232)

(assert (=> b!3410 (= lt!3857 lt!3840)))

(assert (=> b!3410 (= (size!115 (buf!430 (_2!171 lt!3871))) (size!115 (buf!430 thiss!1486)))))

(declare-fun lt!3858 () Unit!232)

(declare-fun Unit!249 () Unit!232)

(assert (=> b!3410 (= lt!3858 Unit!249)))

(assert (=> b!3410 (= (bitIndex!0 (size!115 (buf!430 (_2!171 lt!3871))) (currentByte!1397 (_2!171 lt!3871)) (currentBit!1392 (_2!171 lt!3871))) (bvsub (bvadd (bitIndex!0 (size!115 (buf!430 thiss!1486)) (currentByte!1397 thiss!1486) (currentBit!1392 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!3869 () Unit!232)

(declare-fun Unit!250 () Unit!232)

(assert (=> b!3410 (= lt!3869 Unit!250)))

(assert (=> b!3410 (= (bitIndex!0 (size!115 (buf!430 (_2!171 lt!3871))) (currentByte!1397 (_2!171 lt!3871)) (currentBit!1392 (_2!171 lt!3871))) (bvsub (bvsub (bvadd (bitIndex!0 (size!115 (buf!430 (_2!171 lt!3879))) (currentByte!1397 (_2!171 lt!3879)) (currentBit!1392 (_2!171 lt!3879))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!3856 () Unit!232)

(declare-fun Unit!252 () Unit!232)

(assert (=> b!3410 (= lt!3856 Unit!252)))

(declare-fun lt!3849 () tuple2!324)

(assert (=> b!3410 (= lt!3849 call!35)))

(declare-fun lt!3874 () (_ BitVec 64))

(assert (=> b!3410 (= lt!3874 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3873 () Unit!232)

(assert (=> b!3410 (= lt!3873 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!430 (_2!171 lt!3871)) lt!3874))))

(assert (=> b!3410 (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3871)))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486)) lt!3874)))

(declare-fun lt!3844 () Unit!232)

(assert (=> b!3410 (= lt!3844 lt!3873)))

(declare-fun lt!3880 () tuple2!324)

(assert (=> b!3410 (= lt!3880 (reader!0 (_2!171 lt!3879) (_2!171 lt!3871)))))

(declare-fun lt!3876 () (_ BitVec 64))

(assert (=> b!3410 (= lt!3876 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!3846 () Unit!232)

(assert (=> b!3410 (= lt!3846 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!171 lt!3879) (buf!430 (_2!171 lt!3871)) lt!3876))))

(assert (=> b!3410 (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3871)))) ((_ sign_extend 32) (currentByte!1397 (_2!171 lt!3879))) ((_ sign_extend 32) (currentBit!1392 (_2!171 lt!3879))) lt!3876)))

(declare-fun lt!3877 () Unit!232)

(assert (=> b!3410 (= lt!3877 lt!3846)))

(declare-fun lt!3855 () List!16)

(assert (=> b!3410 (= lt!3855 (byteArrayBitContentToList!0 (_2!171 lt!3871) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!3872 () List!16)

(assert (=> b!3410 (= lt!3872 (byteArrayBitContentToList!0 (_2!171 lt!3871) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3847 () List!16)

(assert (=> b!3410 (= lt!3847 (bitStreamReadBitsIntoList!0 (_2!171 lt!3871) (_1!172 lt!3849) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!3863 () List!16)

(assert (=> b!3410 (= lt!3863 (bitStreamReadBitsIntoList!0 (_2!171 lt!3871) (_1!172 lt!3880) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!3860 () (_ BitVec 64))

(assert (=> b!3410 (= lt!3860 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!3839 () Unit!232)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!208 BitStream!208 BitStream!208 BitStream!208 (_ BitVec 64) List!16) Unit!232)

(assert (=> b!3410 (= lt!3839 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!171 lt!3871) (_2!171 lt!3871) (_1!172 lt!3849) (_1!172 lt!3880) lt!3860 lt!3847))))

(declare-fun tail!23 (List!16) List!16)

(assert (=> b!3410 (= (bitStreamReadBitsIntoList!0 (_2!171 lt!3871) (_1!172 lt!3880) (bvsub lt!3860 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!23 lt!3847))))

(declare-fun lt!3859 () Unit!232)

(assert (=> b!3410 (= lt!3859 lt!3839)))

(declare-fun lt!3866 () Unit!232)

(declare-fun lt!3864 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!279 array!279 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!232)

(assert (=> b!3410 (= lt!3866 (arrayBitRangesEqImpliesEq!0 (buf!430 (_2!171 lt!3879)) (buf!430 (_2!171 lt!3871)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!3864 (bitIndex!0 (size!115 (buf!430 (_2!171 lt!3879))) (currentByte!1397 (_2!171 lt!3879)) (currentBit!1392 (_2!171 lt!3879)))))))

(declare-fun bitAt!0 (array!279 (_ BitVec 64)) Bool)

(assert (=> b!3410 (= (bitAt!0 (buf!430 (_2!171 lt!3879)) lt!3864) (bitAt!0 (buf!430 (_2!171 lt!3871)) lt!3864))))

(declare-fun lt!3868 () Unit!232)

(assert (=> b!3410 (= lt!3868 lt!3866)))

(declare-fun bm!32 () Bool)

(declare-fun c!143 () Bool)

(assert (=> bm!32 (= call!35 (reader!0 thiss!1486 (ite c!143 (_2!171 lt!3871) thiss!1486)))))

(declare-fun d!1576 () Bool)

(assert (=> d!1576 e!2279))

(declare-fun res!4963 () Bool)

(assert (=> d!1576 (=> (not res!4963) (not e!2279))))

(declare-fun lt!3842 () (_ BitVec 64))

(assert (=> d!1576 (= res!4963 (= (bitIndex!0 (size!115 (buf!430 (_2!171 lt!3841))) (currentByte!1397 (_2!171 lt!3841)) (currentBit!1392 (_2!171 lt!3841))) (bvsub lt!3842 from!367)))))

(assert (=> d!1576 (or (= (bvand lt!3842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3842 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!3852 () (_ BitVec 64))

(assert (=> d!1576 (= lt!3842 (bvadd lt!3852 from!367 nBits!460))))

(assert (=> d!1576 (or (not (= (bvand lt!3852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!3852 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!3852 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1576 (= lt!3852 (bitIndex!0 (size!115 (buf!430 thiss!1486)) (currentByte!1397 thiss!1486) (currentBit!1392 thiss!1486)))))

(assert (=> d!1576 (= lt!3841 e!2278)))

(assert (=> d!1576 (= c!143 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!3850 () Unit!232)

(declare-fun lt!3853 () Unit!232)

(assert (=> d!1576 (= lt!3850 lt!3853)))

(assert (=> d!1576 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!208) Unit!232)

(assert (=> d!1576 (= lt!3853 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1576 (= lt!3864 (bitIndex!0 (size!115 (buf!430 thiss!1486)) (currentByte!1397 thiss!1486) (currentBit!1392 thiss!1486)))))

(assert (=> d!1576 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1576 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!3841)))

(declare-fun b!3406 () Bool)

(declare-fun res!4962 () Bool)

(assert (=> b!3406 (=> (not res!4962) (not e!2279))))

(assert (=> b!3406 (= res!4962 (= (size!115 (buf!430 thiss!1486)) (size!115 (buf!430 (_2!171 lt!3841)))))))

(assert (= (and d!1576 c!143) b!3410))

(assert (= (and d!1576 (not c!143)) b!3405))

(assert (= (or b!3410 b!3405) bm!32))

(assert (= (and d!1576 res!4963) b!3404))

(assert (= (and b!3404 res!4960) b!3406))

(assert (= (and b!3406 res!4962) b!3403))

(assert (= (and b!3403 res!4961) b!3408))

(assert (= (and b!3408 res!4964) b!3409))

(assert (= (and b!3409 res!4965) b!3407))

(declare-fun m!3661 () Bool)

(assert (=> b!3407 m!3661))

(declare-fun m!3663 () Bool)

(assert (=> b!3409 m!3663))

(declare-fun m!3665 () Bool)

(assert (=> b!3409 m!3665))

(declare-fun m!3667 () Bool)

(assert (=> b!3409 m!3667))

(declare-fun m!3669 () Bool)

(assert (=> b!3409 m!3669))

(declare-fun m!3671 () Bool)

(assert (=> b!3409 m!3671))

(declare-fun m!3673 () Bool)

(assert (=> b!3405 m!3673))

(declare-fun m!3675 () Bool)

(assert (=> b!3405 m!3675))

(declare-fun m!3677 () Bool)

(assert (=> b!3404 m!3677))

(declare-fun m!3679 () Bool)

(assert (=> bm!32 m!3679))

(declare-fun m!3681 () Bool)

(assert (=> d!1576 m!3681))

(assert (=> d!1576 m!3449))

(declare-fun m!3683 () Bool)

(assert (=> d!1576 m!3683))

(declare-fun m!3685 () Bool)

(assert (=> d!1576 m!3685))

(declare-fun m!3687 () Bool)

(assert (=> b!3403 m!3687))

(declare-fun m!3689 () Bool)

(assert (=> b!3410 m!3689))

(declare-fun m!3691 () Bool)

(assert (=> b!3410 m!3691))

(declare-fun m!3693 () Bool)

(assert (=> b!3410 m!3693))

(declare-fun m!3695 () Bool)

(assert (=> b!3410 m!3695))

(declare-fun m!3697 () Bool)

(assert (=> b!3410 m!3697))

(declare-fun m!3699 () Bool)

(assert (=> b!3410 m!3699))

(assert (=> b!3410 m!3695))

(declare-fun m!3701 () Bool)

(assert (=> b!3410 m!3701))

(declare-fun m!3703 () Bool)

(assert (=> b!3410 m!3703))

(declare-fun m!3705 () Bool)

(assert (=> b!3410 m!3705))

(declare-fun m!3707 () Bool)

(assert (=> b!3410 m!3707))

(declare-fun m!3709 () Bool)

(assert (=> b!3410 m!3709))

(declare-fun m!3711 () Bool)

(assert (=> b!3410 m!3711))

(declare-fun m!3713 () Bool)

(assert (=> b!3410 m!3713))

(declare-fun m!3715 () Bool)

(assert (=> b!3410 m!3715))

(declare-fun m!3717 () Bool)

(assert (=> b!3410 m!3717))

(declare-fun m!3719 () Bool)

(assert (=> b!3410 m!3719))

(declare-fun m!3721 () Bool)

(assert (=> b!3410 m!3721))

(declare-fun m!3723 () Bool)

(assert (=> b!3410 m!3723))

(declare-fun m!3725 () Bool)

(assert (=> b!3410 m!3725))

(assert (=> b!3410 m!3707))

(declare-fun m!3727 () Bool)

(assert (=> b!3410 m!3727))

(declare-fun m!3729 () Bool)

(assert (=> b!3410 m!3729))

(assert (=> b!3410 m!3713))

(declare-fun m!3731 () Bool)

(assert (=> b!3410 m!3731))

(declare-fun m!3733 () Bool)

(assert (=> b!3410 m!3733))

(declare-fun m!3735 () Bool)

(assert (=> b!3410 m!3735))

(declare-fun m!3737 () Bool)

(assert (=> b!3410 m!3737))

(declare-fun m!3739 () Bool)

(assert (=> b!3410 m!3739))

(declare-fun m!3741 () Bool)

(assert (=> b!3410 m!3741))

(assert (=> b!3410 m!3449))

(assert (=> b!3410 m!3733))

(declare-fun m!3743 () Bool)

(assert (=> b!3410 m!3743))

(declare-fun m!3745 () Bool)

(assert (=> b!3410 m!3745))

(declare-fun m!3747 () Bool)

(assert (=> b!3410 m!3747))

(declare-fun m!3749 () Bool)

(assert (=> b!3410 m!3749))

(assert (=> b!3261 d!1576))

(declare-fun d!1612 () Bool)

(assert (=> d!1612 (= (array_inv!110 (buf!430 thiss!1486)) (bvsge (size!115 (buf!430 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!3260 d!1612))

(declare-fun b!3436 () Bool)

(declare-fun res!4989 () Bool)

(declare-fun e!2289 () Bool)

(assert (=> b!3436 (=> (not res!4989) (not e!2289))))

(declare-fun lt!3967 () (_ BitVec 64))

(declare-fun lt!3968 () tuple2!326)

(assert (=> b!3436 (= res!4989 (= (bvadd lt!3967 nBits!460) (bitIndex!0 (size!115 (buf!430 (_2!173 lt!3968))) (currentByte!1397 (_2!173 lt!3968)) (currentBit!1392 (_2!173 lt!3968)))))))

(assert (=> b!3436 (or (not (= (bvand lt!3967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!3967 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!3967 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3436 (= lt!3967 (bitIndex!0 (size!115 (buf!430 (_1!172 lt!3473))) (currentByte!1397 (_1!172 lt!3473)) (currentBit!1392 (_1!172 lt!3473))))))

(declare-fun b!3437 () Bool)

(declare-fun res!4988 () Bool)

(assert (=> b!3437 (=> (not res!4988) (not e!2289))))

(assert (=> b!3437 (= res!4988 (bvsle (currentByte!1397 (_1!172 lt!3473)) (currentByte!1397 (_2!173 lt!3968))))))

(declare-fun b!3438 () Bool)

(declare-fun res!4985 () Bool)

(assert (=> b!3438 (=> (not res!4985) (not e!2289))))

(assert (=> b!3438 (= res!4985 (invariant!0 (currentBit!1392 (_2!173 lt!3968)) (currentByte!1397 (_2!173 lt!3968)) (size!115 (buf!430 (_2!173 lt!3968)))))))

(declare-fun d!1614 () Bool)

(assert (=> d!1614 e!2289))

(declare-fun res!4987 () Bool)

(assert (=> d!1614 (=> (not res!4987) (not e!2289))))

(assert (=> d!1614 (= res!4987 (= (buf!430 (_2!173 lt!3968)) (buf!430 (_1!172 lt!3473))))))

(declare-datatypes ((tuple3!22 0))(
  ( (tuple3!23 (_1!181 Unit!232) (_2!181 BitStream!208) (_3!11 array!279)) )
))
(declare-fun lt!3962 () tuple3!22)

(assert (=> d!1614 (= lt!3968 (tuple2!327 (_3!11 lt!3962) (_2!181 lt!3962)))))

(declare-fun readBitsLoop!0 (BitStream!208 (_ BitVec 64) array!279 (_ BitVec 64) (_ BitVec 64)) tuple3!22)

(assert (=> d!1614 (= lt!3962 (readBitsLoop!0 (_1!172 lt!3473) nBits!460 (array!280 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!1614 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!1614 (= (readBits!0 (_1!172 lt!3473) nBits!460) lt!3968)))

(declare-fun b!3439 () Bool)

(declare-fun res!4986 () Bool)

(assert (=> b!3439 (=> (not res!4986) (not e!2289))))

(declare-fun lt!3960 () (_ BitVec 64))

(assert (=> b!3439 (= res!4986 (= (size!115 (_1!173 lt!3968)) ((_ extract 31 0) lt!3960)))))

(assert (=> b!3439 (and (bvslt lt!3960 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!3960 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!3964 () (_ BitVec 64))

(declare-fun lt!3966 () (_ BitVec 64))

(assert (=> b!3439 (= lt!3960 (bvsdiv lt!3964 lt!3966))))

(assert (=> b!3439 (and (not (= lt!3966 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!3964 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!3966 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!3439 (= lt!3966 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!3963 () (_ BitVec 64))

(declare-fun lt!3965 () (_ BitVec 64))

(assert (=> b!3439 (= lt!3964 (bvsub lt!3963 lt!3965))))

(assert (=> b!3439 (or (= (bvand lt!3963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3965 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!3963 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!3963 lt!3965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3439 (= lt!3965 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!3961 () (_ BitVec 64))

(assert (=> b!3439 (= lt!3963 (bvadd nBits!460 lt!3961))))

(assert (=> b!3439 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!3961 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!3961) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3439 (= lt!3961 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!3440 () Bool)

(assert (=> b!3440 (= e!2289 (= (byteArrayBitContentToList!0 (_2!173 lt!3968) (_1!173 lt!3968) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!173 lt!3968) (_1!172 lt!3473) nBits!460)))))

(assert (= (and d!1614 res!4987) b!3436))

(assert (= (and b!3436 res!4989) b!3438))

(assert (= (and b!3438 res!4985) b!3439))

(assert (= (and b!3439 res!4986) b!3437))

(assert (= (and b!3437 res!4988) b!3440))

(declare-fun m!3779 () Bool)

(assert (=> b!3436 m!3779))

(declare-fun m!3781 () Bool)

(assert (=> b!3436 m!3781))

(declare-fun m!3783 () Bool)

(assert (=> b!3438 m!3783))

(declare-fun m!3785 () Bool)

(assert (=> d!1614 m!3785))

(declare-fun m!3787 () Bool)

(assert (=> b!3440 m!3787))

(declare-fun m!3789 () Bool)

(assert (=> b!3440 m!3789))

(assert (=> b!3264 d!1614))

(declare-fun d!1620 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1620 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 (_1!172 lt!3473)))) ((_ sign_extend 32) (currentByte!1397 (_1!172 lt!3473))) ((_ sign_extend 32) (currentBit!1392 (_1!172 lt!3473))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!115 (buf!430 (_1!172 lt!3473)))) ((_ sign_extend 32) (currentByte!1397 (_1!172 lt!3473))) ((_ sign_extend 32) (currentBit!1392 (_1!172 lt!3473)))) nBits!460))))

(declare-fun bs!598 () Bool)

(assert (= bs!598 d!1620))

(declare-fun m!3791 () Bool)

(assert (=> bs!598 m!3791))

(assert (=> b!3264 d!1620))

(declare-fun d!1622 () Bool)

(assert (=> d!1622 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3475)))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3475)))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486))) nBits!460))))

(declare-fun bs!599 () Bool)

(assert (= bs!599 d!1622))

(declare-fun m!3793 () Bool)

(assert (=> bs!599 m!3793))

(assert (=> b!3264 d!1622))

(declare-fun b!3474 () Bool)

(declare-fun res!5019 () Bool)

(declare-fun e!2302 () Bool)

(assert (=> b!3474 (=> (not res!5019) (not e!2302))))

(declare-fun lt!4069 () tuple2!324)

(assert (=> b!3474 (= res!5019 (isPrefixOf!0 (_1!172 lt!4069) thiss!1486))))

(declare-fun d!1624 () Bool)

(assert (=> d!1624 e!2302))

(declare-fun res!5020 () Bool)

(assert (=> d!1624 (=> (not res!5020) (not e!2302))))

(assert (=> d!1624 (= res!5020 (isPrefixOf!0 (_1!172 lt!4069) (_2!172 lt!4069)))))

(declare-fun lt!4073 () BitStream!208)

(assert (=> d!1624 (= lt!4069 (tuple2!325 lt!4073 (_2!171 lt!3475)))))

(declare-fun lt!4072 () Unit!232)

(declare-fun lt!4070 () Unit!232)

(assert (=> d!1624 (= lt!4072 lt!4070)))

(assert (=> d!1624 (isPrefixOf!0 lt!4073 (_2!171 lt!3475))))

(assert (=> d!1624 (= lt!4070 (lemmaIsPrefixTransitive!0 lt!4073 (_2!171 lt!3475) (_2!171 lt!3475)))))

(declare-fun lt!4071 () Unit!232)

(declare-fun lt!4079 () Unit!232)

(assert (=> d!1624 (= lt!4071 lt!4079)))

(assert (=> d!1624 (isPrefixOf!0 lt!4073 (_2!171 lt!3475))))

(assert (=> d!1624 (= lt!4079 (lemmaIsPrefixTransitive!0 lt!4073 thiss!1486 (_2!171 lt!3475)))))

(declare-fun lt!4074 () Unit!232)

(declare-fun e!2301 () Unit!232)

(assert (=> d!1624 (= lt!4074 e!2301)))

(declare-fun c!149 () Bool)

(assert (=> d!1624 (= c!149 (not (= (size!115 (buf!430 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!4064 () Unit!232)

(declare-fun lt!4060 () Unit!232)

(assert (=> d!1624 (= lt!4064 lt!4060)))

(assert (=> d!1624 (isPrefixOf!0 (_2!171 lt!3475) (_2!171 lt!3475))))

(assert (=> d!1624 (= lt!4060 (lemmaIsPrefixRefl!0 (_2!171 lt!3475)))))

(declare-fun lt!4068 () Unit!232)

(declare-fun lt!4062 () Unit!232)

(assert (=> d!1624 (= lt!4068 lt!4062)))

(assert (=> d!1624 (= lt!4062 (lemmaIsPrefixRefl!0 (_2!171 lt!3475)))))

(declare-fun lt!4078 () Unit!232)

(declare-fun lt!4076 () Unit!232)

(assert (=> d!1624 (= lt!4078 lt!4076)))

(assert (=> d!1624 (isPrefixOf!0 lt!4073 lt!4073)))

(assert (=> d!1624 (= lt!4076 (lemmaIsPrefixRefl!0 lt!4073))))

(declare-fun lt!4066 () Unit!232)

(declare-fun lt!4065 () Unit!232)

(assert (=> d!1624 (= lt!4066 lt!4065)))

(assert (=> d!1624 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1624 (= lt!4065 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1624 (= lt!4073 (BitStream!209 (buf!430 (_2!171 lt!3475)) (currentByte!1397 thiss!1486) (currentBit!1392 thiss!1486)))))

(assert (=> d!1624 (isPrefixOf!0 thiss!1486 (_2!171 lt!3475))))

(assert (=> d!1624 (= (reader!0 thiss!1486 (_2!171 lt!3475)) lt!4069)))

(declare-fun b!3475 () Bool)

(declare-fun Unit!254 () Unit!232)

(assert (=> b!3475 (= e!2301 Unit!254)))

(declare-fun b!3476 () Bool)

(declare-fun lt!4063 () (_ BitVec 64))

(declare-fun lt!4061 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!208 (_ BitVec 64)) BitStream!208)

(assert (=> b!3476 (= e!2302 (= (_1!172 lt!4069) (withMovedBitIndex!0 (_2!172 lt!4069) (bvsub lt!4063 lt!4061))))))

(assert (=> b!3476 (or (= (bvand lt!4063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4061 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4063 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4063 lt!4061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!3476 (= lt!4061 (bitIndex!0 (size!115 (buf!430 (_2!171 lt!3475))) (currentByte!1397 (_2!171 lt!3475)) (currentBit!1392 (_2!171 lt!3475))))))

(assert (=> b!3476 (= lt!4063 (bitIndex!0 (size!115 (buf!430 thiss!1486)) (currentByte!1397 thiss!1486) (currentBit!1392 thiss!1486)))))

(declare-fun b!3477 () Bool)

(declare-fun lt!4067 () Unit!232)

(assert (=> b!3477 (= e!2301 lt!4067)))

(declare-fun lt!4075 () (_ BitVec 64))

(assert (=> b!3477 (= lt!4075 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!4077 () (_ BitVec 64))

(assert (=> b!3477 (= lt!4077 (bitIndex!0 (size!115 (buf!430 thiss!1486)) (currentByte!1397 thiss!1486) (currentBit!1392 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!279 array!279 (_ BitVec 64) (_ BitVec 64)) Unit!232)

(assert (=> b!3477 (= lt!4067 (arrayBitRangesEqSymmetric!0 (buf!430 thiss!1486) (buf!430 (_2!171 lt!3475)) lt!4075 lt!4077))))

(declare-fun arrayBitRangesEq!0 (array!279 array!279 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!3477 (arrayBitRangesEq!0 (buf!430 (_2!171 lt!3475)) (buf!430 thiss!1486) lt!4075 lt!4077)))

(declare-fun b!3478 () Bool)

(declare-fun res!5021 () Bool)

(assert (=> b!3478 (=> (not res!5021) (not e!2302))))

(assert (=> b!3478 (= res!5021 (isPrefixOf!0 (_2!172 lt!4069) (_2!171 lt!3475)))))

(assert (= (and d!1624 c!149) b!3477))

(assert (= (and d!1624 (not c!149)) b!3475))

(assert (= (and d!1624 res!5020) b!3474))

(assert (= (and b!3474 res!5019) b!3478))

(assert (= (and b!3478 res!5021) b!3476))

(declare-fun m!3811 () Bool)

(assert (=> b!3478 m!3811))

(declare-fun m!3813 () Bool)

(assert (=> b!3476 m!3813))

(assert (=> b!3476 m!3447))

(assert (=> b!3476 m!3449))

(assert (=> d!1624 m!3683))

(declare-fun m!3815 () Bool)

(assert (=> d!1624 m!3815))

(declare-fun m!3817 () Bool)

(assert (=> d!1624 m!3817))

(declare-fun m!3819 () Bool)

(assert (=> d!1624 m!3819))

(declare-fun m!3821 () Bool)

(assert (=> d!1624 m!3821))

(assert (=> d!1624 m!3429))

(assert (=> d!1624 m!3685))

(declare-fun m!3823 () Bool)

(assert (=> d!1624 m!3823))

(declare-fun m!3825 () Bool)

(assert (=> d!1624 m!3825))

(declare-fun m!3827 () Bool)

(assert (=> d!1624 m!3827))

(declare-fun m!3829 () Bool)

(assert (=> d!1624 m!3829))

(assert (=> b!3477 m!3449))

(declare-fun m!3831 () Bool)

(assert (=> b!3477 m!3831))

(declare-fun m!3833 () Bool)

(assert (=> b!3477 m!3833))

(declare-fun m!3835 () Bool)

(assert (=> b!3474 m!3835))

(assert (=> b!3264 d!1624))

(declare-fun d!1634 () Bool)

(assert (=> d!1634 (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3475)))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486)) nBits!460)))

(declare-fun lt!4082 () Unit!232)

(declare-fun choose!9 (BitStream!208 array!279 (_ BitVec 64) BitStream!208) Unit!232)

(assert (=> d!1634 (= lt!4082 (choose!9 thiss!1486 (buf!430 (_2!171 lt!3475)) nBits!460 (BitStream!209 (buf!430 (_2!171 lt!3475)) (currentByte!1397 thiss!1486) (currentBit!1392 thiss!1486))))))

(assert (=> d!1634 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!430 (_2!171 lt!3475)) nBits!460) lt!4082)))

(declare-fun bs!601 () Bool)

(assert (= bs!601 d!1634))

(assert (=> bs!601 m!3435))

(declare-fun m!3837 () Bool)

(assert (=> bs!601 m!3837))

(assert (=> b!3264 d!1634))

(declare-fun d!1636 () Bool)

(assert (=> d!1636 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!115 (buf!430 thiss!1486))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!115 (buf!430 thiss!1486))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486))) nBits!460))))

(declare-fun bs!602 () Bool)

(assert (= bs!602 d!1636))

(declare-fun m!3839 () Bool)

(assert (=> bs!602 m!3839))

(assert (=> b!3258 d!1636))

(declare-fun d!1638 () Bool)

(declare-fun res!5029 () Bool)

(declare-fun e!2310 () Bool)

(assert (=> d!1638 (=> (not res!5029) (not e!2310))))

(assert (=> d!1638 (= res!5029 (= (size!115 (buf!430 thiss!1486)) (size!115 (buf!430 (_2!171 lt!3475)))))))

(assert (=> d!1638 (= (isPrefixOf!0 thiss!1486 (_2!171 lt!3475)) e!2310)))

(declare-fun b!3489 () Bool)

(declare-fun res!5028 () Bool)

(assert (=> b!3489 (=> (not res!5028) (not e!2310))))

(assert (=> b!3489 (= res!5028 (bvsle (bitIndex!0 (size!115 (buf!430 thiss!1486)) (currentByte!1397 thiss!1486) (currentBit!1392 thiss!1486)) (bitIndex!0 (size!115 (buf!430 (_2!171 lt!3475))) (currentByte!1397 (_2!171 lt!3475)) (currentBit!1392 (_2!171 lt!3475)))))))

(declare-fun b!3490 () Bool)

(declare-fun e!2309 () Bool)

(assert (=> b!3490 (= e!2310 e!2309)))

(declare-fun res!5030 () Bool)

(assert (=> b!3490 (=> res!5030 e!2309)))

(assert (=> b!3490 (= res!5030 (= (size!115 (buf!430 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!3491 () Bool)

(assert (=> b!3491 (= e!2309 (arrayBitRangesEq!0 (buf!430 thiss!1486) (buf!430 (_2!171 lt!3475)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!115 (buf!430 thiss!1486)) (currentByte!1397 thiss!1486) (currentBit!1392 thiss!1486))))))

(assert (= (and d!1638 res!5029) b!3489))

(assert (= (and b!3489 res!5028) b!3490))

(assert (= (and b!3490 (not res!5030)) b!3491))

(assert (=> b!3489 m!3449))

(assert (=> b!3489 m!3447))

(assert (=> b!3491 m!3449))

(assert (=> b!3491 m!3449))

(declare-fun m!3841 () Bool)

(assert (=> b!3491 m!3841))

(assert (=> b!3263 d!1638))

(declare-fun d!1640 () Bool)

(assert (=> d!1640 (= (array_inv!110 srcBuffer!6) (bvsge (size!115 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!890 d!1640))

(declare-fun d!1642 () Bool)

(assert (=> d!1642 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1392 thiss!1486) (currentByte!1397 thiss!1486) (size!115 (buf!430 thiss!1486))))))

(declare-fun bs!603 () Bool)

(assert (= bs!603 d!1642))

(declare-fun m!3843 () Bool)

(assert (=> bs!603 m!3843))

(assert (=> start!890 d!1642))

(declare-fun d!1644 () Bool)

(declare-fun e!2317 () Bool)

(assert (=> d!1644 e!2317))

(declare-fun res!5047 () Bool)

(assert (=> d!1644 (=> (not res!5047) (not e!2317))))

(declare-fun lt!4187 () (_ BitVec 64))

(declare-fun lt!4186 () (_ BitVec 64))

(declare-fun lt!4184 () (_ BitVec 64))

(assert (=> d!1644 (= res!5047 (= lt!4187 (bvsub lt!4186 lt!4184)))))

(assert (=> d!1644 (or (= (bvand lt!4186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4184 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4186 lt!4184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1644 (= lt!4184 (remainingBits!0 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3475)))) ((_ sign_extend 32) (currentByte!1397 (_2!171 lt!3475))) ((_ sign_extend 32) (currentBit!1392 (_2!171 lt!3475)))))))

(declare-fun lt!4188 () (_ BitVec 64))

(declare-fun lt!4185 () (_ BitVec 64))

(assert (=> d!1644 (= lt!4186 (bvmul lt!4188 lt!4185))))

(assert (=> d!1644 (or (= lt!4188 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!4185 (bvsdiv (bvmul lt!4188 lt!4185) lt!4188)))))

(assert (=> d!1644 (= lt!4185 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1644 (= lt!4188 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3475)))))))

(assert (=> d!1644 (= lt!4187 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1397 (_2!171 lt!3475))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1392 (_2!171 lt!3475)))))))

(assert (=> d!1644 (invariant!0 (currentBit!1392 (_2!171 lt!3475)) (currentByte!1397 (_2!171 lt!3475)) (size!115 (buf!430 (_2!171 lt!3475))))))

(assert (=> d!1644 (= (bitIndex!0 (size!115 (buf!430 (_2!171 lt!3475))) (currentByte!1397 (_2!171 lt!3475)) (currentBit!1392 (_2!171 lt!3475))) lt!4187)))

(declare-fun b!3508 () Bool)

(declare-fun res!5048 () Bool)

(assert (=> b!3508 (=> (not res!5048) (not e!2317))))

(assert (=> b!3508 (= res!5048 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!4187))))

(declare-fun b!3509 () Bool)

(declare-fun lt!4183 () (_ BitVec 64))

(assert (=> b!3509 (= e!2317 (bvsle lt!4187 (bvmul lt!4183 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3509 (or (= lt!4183 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!4183 #b0000000000000000000000000000000000000000000000000000000000001000) lt!4183)))))

(assert (=> b!3509 (= lt!4183 ((_ sign_extend 32) (size!115 (buf!430 (_2!171 lt!3475)))))))

(assert (= (and d!1644 res!5047) b!3508))

(assert (= (and b!3508 res!5048) b!3509))

(declare-fun m!3845 () Bool)

(assert (=> d!1644 m!3845))

(assert (=> d!1644 m!3423))

(assert (=> b!3262 d!1644))

(declare-fun d!1646 () Bool)

(declare-fun e!2318 () Bool)

(assert (=> d!1646 e!2318))

(declare-fun res!5049 () Bool)

(assert (=> d!1646 (=> (not res!5049) (not e!2318))))

(declare-fun lt!4192 () (_ BitVec 64))

(declare-fun lt!4193 () (_ BitVec 64))

(declare-fun lt!4190 () (_ BitVec 64))

(assert (=> d!1646 (= res!5049 (= lt!4193 (bvsub lt!4192 lt!4190)))))

(assert (=> d!1646 (or (= (bvand lt!4192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!4190 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!4192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!4192 lt!4190) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1646 (= lt!4190 (remainingBits!0 ((_ sign_extend 32) (size!115 (buf!430 thiss!1486))) ((_ sign_extend 32) (currentByte!1397 thiss!1486)) ((_ sign_extend 32) (currentBit!1392 thiss!1486))))))

(declare-fun lt!4194 () (_ BitVec 64))

(declare-fun lt!4191 () (_ BitVec 64))

(assert (=> d!1646 (= lt!4192 (bvmul lt!4194 lt!4191))))

(assert (=> d!1646 (or (= lt!4194 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!4191 (bvsdiv (bvmul lt!4194 lt!4191) lt!4194)))))

(assert (=> d!1646 (= lt!4191 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1646 (= lt!4194 ((_ sign_extend 32) (size!115 (buf!430 thiss!1486))))))

(assert (=> d!1646 (= lt!4193 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1397 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1392 thiss!1486))))))

(assert (=> d!1646 (invariant!0 (currentBit!1392 thiss!1486) (currentByte!1397 thiss!1486) (size!115 (buf!430 thiss!1486)))))

(assert (=> d!1646 (= (bitIndex!0 (size!115 (buf!430 thiss!1486)) (currentByte!1397 thiss!1486) (currentBit!1392 thiss!1486)) lt!4193)))

(declare-fun b!3510 () Bool)

(declare-fun res!5050 () Bool)

(assert (=> b!3510 (=> (not res!5050) (not e!2318))))

(assert (=> b!3510 (= res!5050 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!4193))))

(declare-fun b!3511 () Bool)

(declare-fun lt!4189 () (_ BitVec 64))

(assert (=> b!3511 (= e!2318 (bvsle lt!4193 (bvmul lt!4189 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!3511 (or (= lt!4189 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!4189 #b0000000000000000000000000000000000000000000000000000000000001000) lt!4189)))))

(assert (=> b!3511 (= lt!4189 ((_ sign_extend 32) (size!115 (buf!430 thiss!1486))))))

(assert (= (and d!1646 res!5049) b!3510))

(assert (= (and b!3510 res!5050) b!3511))

(assert (=> d!1646 m!3839))

(assert (=> d!1646 m!3843))

(assert (=> b!3262 d!1646))

(push 1)

(assert (not bm!32))

(assert (not b!3438))

(assert (not d!1644))

(assert (not b!3476))

(assert (not b!3477))

(assert (not b!3489))

(assert (not b!3404))

(assert (not d!1646))

(assert (not b!3436))

(assert (not d!1634))

(assert (not b!3474))

(assert (not b!3405))

(assert (not b!3407))

(assert (not d!1620))

(assert (not b!3440))

(assert (not b!3491))

(assert (not d!1614))

(assert (not b!3410))

(assert (not d!1576))

(assert (not d!1636))

(assert (not b!3403))

(assert (not d!1622))

(assert (not b!3478))

(assert (not d!1624))

(assert (not b!3409))

(assert (not d!1642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

