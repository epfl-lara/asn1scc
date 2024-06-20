; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21882 () Bool)

(assert start!21882)

(declare-fun b!110505 () Bool)

(declare-fun res!91225 () Bool)

(declare-fun e!72484 () Bool)

(assert (=> b!110505 (=> (not res!91225) (not e!72484))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!110505 (= res!91225 (bvsge i!615 nBits!396))))

(declare-fun b!110506 () Bool)

(declare-fun res!91223 () Bool)

(assert (=> b!110506 (=> (not res!91223) (not e!72484))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110506 (= res!91223 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110507 () Bool)

(declare-fun e!72486 () Bool)

(assert (=> b!110507 (= e!72486 e!72484)))

(declare-fun res!91224 () Bool)

(assert (=> b!110507 (=> (not res!91224) (not e!72484))))

(declare-datatypes ((array!5062 0))(
  ( (array!5063 (arr!2896 (Array (_ BitVec 32) (_ BitVec 8))) (size!2303 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4080 0))(
  ( (BitStream!4081 (buf!2697 array!5062) (currentByte!5251 (_ BitVec 32)) (currentBit!5246 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4080)

(declare-fun lt!167186 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110507 (= res!91224 (validate_offset_bits!1 ((_ sign_extend 32) (size!2303 (buf!2697 thiss!1305))) ((_ sign_extend 32) (currentByte!5251 thiss!1305)) ((_ sign_extend 32) (currentBit!5246 thiss!1305)) lt!167186))))

(assert (=> b!110507 (= lt!167186 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110508 () Bool)

(declare-fun e!72485 () Bool)

(assert (=> b!110508 (= e!72484 (not e!72485))))

(declare-fun res!91221 () Bool)

(assert (=> b!110508 (=> res!91221 e!72485)))

(declare-fun lt!167189 () (_ BitVec 64))

(assert (=> b!110508 (= res!91221 (not (= lt!167189 (bvadd lt!167189 lt!167186))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110508 (= lt!167189 (bitIndex!0 (size!2303 (buf!2697 thiss!1305)) (currentByte!5251 thiss!1305) (currentBit!5246 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4080 BitStream!4080) Bool)

(assert (=> b!110508 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6771 0))(
  ( (Unit!6772) )
))
(declare-fun lt!167187 () Unit!6771)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4080) Unit!6771)

(assert (=> b!110508 (= lt!167187 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110509 () Bool)

(declare-fun e!72488 () Bool)

(declare-fun array_inv!2105 (array!5062) Bool)

(assert (=> b!110509 (= e!72488 (array_inv!2105 (buf!2697 thiss!1305)))))

(declare-fun res!91222 () Bool)

(assert (=> start!21882 (=> (not res!91222) (not e!72486))))

(assert (=> start!21882 (= res!91222 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21882 e!72486))

(assert (=> start!21882 true))

(declare-fun inv!12 (BitStream!4080) Bool)

(assert (=> start!21882 (and (inv!12 thiss!1305) e!72488)))

(declare-fun b!110504 () Bool)

(declare-datatypes ((tuple2!9200 0))(
  ( (tuple2!9201 (_1!4857 BitStream!4080) (_2!4857 BitStream!4080)) )
))
(declare-fun lt!167188 () tuple2!9200)

(assert (=> b!110504 (= e!72485 (validate_offset_bits!1 ((_ sign_extend 32) (size!2303 (buf!2697 (_1!4857 lt!167188)))) ((_ sign_extend 32) (currentByte!5251 (_1!4857 lt!167188))) ((_ sign_extend 32) (currentBit!5246 (_1!4857 lt!167188))) lt!167186))))

(declare-fun lt!167185 () Unit!6771)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4080 array!5062 (_ BitVec 64)) Unit!6771)

(assert (=> b!110504 (= lt!167185 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2697 thiss!1305) lt!167186))))

(declare-fun reader!0 (BitStream!4080 BitStream!4080) tuple2!9200)

(assert (=> b!110504 (= lt!167188 (reader!0 thiss!1305 thiss!1305))))

(assert (= (and start!21882 res!91222) b!110507))

(assert (= (and b!110507 res!91224) b!110506))

(assert (= (and b!110506 res!91223) b!110505))

(assert (= (and b!110505 res!91225) b!110508))

(assert (= (and b!110508 (not res!91221)) b!110504))

(assert (= start!21882 b!110509))

(declare-fun m!164071 () Bool)

(assert (=> start!21882 m!164071))

(declare-fun m!164073 () Bool)

(assert (=> b!110507 m!164073))

(declare-fun m!164075 () Bool)

(assert (=> b!110509 m!164075))

(declare-fun m!164077 () Bool)

(assert (=> b!110508 m!164077))

(declare-fun m!164079 () Bool)

(assert (=> b!110508 m!164079))

(declare-fun m!164081 () Bool)

(assert (=> b!110508 m!164081))

(declare-fun m!164083 () Bool)

(assert (=> b!110506 m!164083))

(declare-fun m!164085 () Bool)

(assert (=> b!110504 m!164085))

(declare-fun m!164087 () Bool)

(assert (=> b!110504 m!164087))

(declare-fun m!164089 () Bool)

(assert (=> b!110504 m!164089))

(check-sat (not b!110508) (not b!110506) (not b!110509) (not b!110504) (not b!110507) (not start!21882))
(check-sat)
(get-model)

(declare-fun d!34750 () Bool)

(assert (=> d!34750 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110506 d!34750))

(declare-fun d!34754 () Bool)

(assert (=> d!34754 (= (array_inv!2105 (buf!2697 thiss!1305)) (bvsge (size!2303 (buf!2697 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110509 d!34754))

(declare-fun d!34756 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34756 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2303 (buf!2697 (_1!4857 lt!167188)))) ((_ sign_extend 32) (currentByte!5251 (_1!4857 lt!167188))) ((_ sign_extend 32) (currentBit!5246 (_1!4857 lt!167188))) lt!167186) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2303 (buf!2697 (_1!4857 lt!167188)))) ((_ sign_extend 32) (currentByte!5251 (_1!4857 lt!167188))) ((_ sign_extend 32) (currentBit!5246 (_1!4857 lt!167188)))) lt!167186))))

(declare-fun bs!8514 () Bool)

(assert (= bs!8514 d!34756))

(declare-fun m!164113 () Bool)

(assert (=> bs!8514 m!164113))

(assert (=> b!110504 d!34756))

(declare-fun d!34762 () Bool)

(assert (=> d!34762 (validate_offset_bits!1 ((_ sign_extend 32) (size!2303 (buf!2697 thiss!1305))) ((_ sign_extend 32) (currentByte!5251 thiss!1305)) ((_ sign_extend 32) (currentBit!5246 thiss!1305)) lt!167186)))

(declare-fun lt!167210 () Unit!6771)

(declare-fun choose!9 (BitStream!4080 array!5062 (_ BitVec 64) BitStream!4080) Unit!6771)

(assert (=> d!34762 (= lt!167210 (choose!9 thiss!1305 (buf!2697 thiss!1305) lt!167186 (BitStream!4081 (buf!2697 thiss!1305) (currentByte!5251 thiss!1305) (currentBit!5246 thiss!1305))))))

(assert (=> d!34762 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2697 thiss!1305) lt!167186) lt!167210)))

(declare-fun bs!8518 () Bool)

(assert (= bs!8518 d!34762))

(assert (=> bs!8518 m!164073))

(declare-fun m!164121 () Bool)

(assert (=> bs!8518 m!164121))

(assert (=> b!110504 d!34762))

(declare-fun b!110564 () Bool)

(declare-fun e!72519 () Unit!6771)

(declare-fun Unit!6775 () Unit!6771)

(assert (=> b!110564 (= e!72519 Unit!6775)))

(declare-fun b!110565 () Bool)

(declare-fun e!72518 () Bool)

(declare-fun lt!167365 () (_ BitVec 64))

(declare-fun lt!167366 () tuple2!9200)

(declare-fun lt!167370 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4080 (_ BitVec 64)) BitStream!4080)

(assert (=> b!110565 (= e!72518 (= (_1!4857 lt!167366) (withMovedBitIndex!0 (_2!4857 lt!167366) (bvsub lt!167365 lt!167370))))))

(assert (=> b!110565 (or (= (bvand lt!167365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167370 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167365 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167365 lt!167370) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!110565 (= lt!167370 (bitIndex!0 (size!2303 (buf!2697 thiss!1305)) (currentByte!5251 thiss!1305) (currentBit!5246 thiss!1305)))))

(assert (=> b!110565 (= lt!167365 (bitIndex!0 (size!2303 (buf!2697 thiss!1305)) (currentByte!5251 thiss!1305) (currentBit!5246 thiss!1305)))))

(declare-fun b!110566 () Bool)

(declare-fun res!91263 () Bool)

(assert (=> b!110566 (=> (not res!91263) (not e!72518))))

(assert (=> b!110566 (= res!91263 (isPrefixOf!0 (_1!4857 lt!167366) thiss!1305))))

(declare-fun b!110567 () Bool)

(declare-fun lt!167368 () Unit!6771)

(assert (=> b!110567 (= e!72519 lt!167368)))

(declare-fun lt!167361 () (_ BitVec 64))

(assert (=> b!110567 (= lt!167361 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!167363 () (_ BitVec 64))

(assert (=> b!110567 (= lt!167363 (bitIndex!0 (size!2303 (buf!2697 thiss!1305)) (currentByte!5251 thiss!1305) (currentBit!5246 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5062 array!5062 (_ BitVec 64) (_ BitVec 64)) Unit!6771)

(assert (=> b!110567 (= lt!167368 (arrayBitRangesEqSymmetric!0 (buf!2697 thiss!1305) (buf!2697 thiss!1305) lt!167361 lt!167363))))

(declare-fun arrayBitRangesEq!0 (array!5062 array!5062 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110567 (arrayBitRangesEq!0 (buf!2697 thiss!1305) (buf!2697 thiss!1305) lt!167361 lt!167363)))

(declare-fun b!110563 () Bool)

(declare-fun res!91264 () Bool)

(assert (=> b!110563 (=> (not res!91264) (not e!72518))))

(assert (=> b!110563 (= res!91264 (isPrefixOf!0 (_2!4857 lt!167366) thiss!1305))))

(declare-fun d!34770 () Bool)

(assert (=> d!34770 e!72518))

(declare-fun res!91262 () Bool)

(assert (=> d!34770 (=> (not res!91262) (not e!72518))))

(assert (=> d!34770 (= res!91262 (isPrefixOf!0 (_1!4857 lt!167366) (_2!4857 lt!167366)))))

(declare-fun lt!167369 () BitStream!4080)

(assert (=> d!34770 (= lt!167366 (tuple2!9201 lt!167369 thiss!1305))))

(declare-fun lt!167367 () Unit!6771)

(declare-fun lt!167371 () Unit!6771)

(assert (=> d!34770 (= lt!167367 lt!167371)))

(assert (=> d!34770 (isPrefixOf!0 lt!167369 thiss!1305)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4080 BitStream!4080 BitStream!4080) Unit!6771)

(assert (=> d!34770 (= lt!167371 (lemmaIsPrefixTransitive!0 lt!167369 thiss!1305 thiss!1305))))

(declare-fun lt!167356 () Unit!6771)

(declare-fun lt!167355 () Unit!6771)

(assert (=> d!34770 (= lt!167356 lt!167355)))

(assert (=> d!34770 (isPrefixOf!0 lt!167369 thiss!1305)))

(assert (=> d!34770 (= lt!167355 (lemmaIsPrefixTransitive!0 lt!167369 thiss!1305 thiss!1305))))

(declare-fun lt!167362 () Unit!6771)

(assert (=> d!34770 (= lt!167362 e!72519)))

(declare-fun c!6727 () Bool)

(assert (=> d!34770 (= c!6727 (not (= (size!2303 (buf!2697 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!167358 () Unit!6771)

(declare-fun lt!167359 () Unit!6771)

(assert (=> d!34770 (= lt!167358 lt!167359)))

(assert (=> d!34770 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34770 (= lt!167359 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!167372 () Unit!6771)

(declare-fun lt!167354 () Unit!6771)

(assert (=> d!34770 (= lt!167372 lt!167354)))

(assert (=> d!34770 (= lt!167354 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun lt!167373 () Unit!6771)

(declare-fun lt!167360 () Unit!6771)

(assert (=> d!34770 (= lt!167373 lt!167360)))

(assert (=> d!34770 (isPrefixOf!0 lt!167369 lt!167369)))

(assert (=> d!34770 (= lt!167360 (lemmaIsPrefixRefl!0 lt!167369))))

(declare-fun lt!167364 () Unit!6771)

(declare-fun lt!167357 () Unit!6771)

(assert (=> d!34770 (= lt!167364 lt!167357)))

(assert (=> d!34770 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34770 (= lt!167357 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34770 (= lt!167369 (BitStream!4081 (buf!2697 thiss!1305) (currentByte!5251 thiss!1305) (currentBit!5246 thiss!1305)))))

(assert (=> d!34770 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34770 (= (reader!0 thiss!1305 thiss!1305) lt!167366)))

(assert (= (and d!34770 c!6727) b!110567))

(assert (= (and d!34770 (not c!6727)) b!110564))

(assert (= (and d!34770 res!91262) b!110566))

(assert (= (and b!110566 res!91263) b!110563))

(assert (= (and b!110563 res!91264) b!110565))

(assert (=> b!110567 m!164077))

(declare-fun m!164133 () Bool)

(assert (=> b!110567 m!164133))

(declare-fun m!164135 () Bool)

(assert (=> b!110567 m!164135))

(declare-fun m!164139 () Bool)

(assert (=> b!110563 m!164139))

(declare-fun m!164143 () Bool)

(assert (=> b!110565 m!164143))

(assert (=> b!110565 m!164077))

(assert (=> b!110565 m!164077))

(assert (=> d!34770 m!164081))

(declare-fun m!164149 () Bool)

(assert (=> d!34770 m!164149))

(assert (=> d!34770 m!164079))

(assert (=> d!34770 m!164081))

(assert (=> d!34770 m!164079))

(declare-fun m!164153 () Bool)

(assert (=> d!34770 m!164153))

(assert (=> d!34770 m!164079))

(declare-fun m!164157 () Bool)

(assert (=> d!34770 m!164157))

(declare-fun m!164159 () Bool)

(assert (=> d!34770 m!164159))

(declare-fun m!164161 () Bool)

(assert (=> d!34770 m!164161))

(assert (=> d!34770 m!164161))

(declare-fun m!164163 () Bool)

(assert (=> b!110566 m!164163))

(assert (=> b!110504 d!34770))

(declare-fun d!34776 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!34776 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5246 thiss!1305) (currentByte!5251 thiss!1305) (size!2303 (buf!2697 thiss!1305))))))

(declare-fun bs!8521 () Bool)

(assert (= bs!8521 d!34776))

(declare-fun m!164171 () Bool)

(assert (=> bs!8521 m!164171))

(assert (=> start!21882 d!34776))

(declare-fun d!34782 () Bool)

(declare-fun e!72528 () Bool)

(assert (=> d!34782 e!72528))

(declare-fun res!91280 () Bool)

(assert (=> d!34782 (=> (not res!91280) (not e!72528))))

(declare-fun lt!167433 () (_ BitVec 64))

(declare-fun lt!167430 () (_ BitVec 64))

(declare-fun lt!167434 () (_ BitVec 64))

(assert (=> d!34782 (= res!91280 (= lt!167430 (bvsub lt!167434 lt!167433)))))

(assert (=> d!34782 (or (= (bvand lt!167434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!167433 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167434 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!167434 lt!167433) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34782 (= lt!167433 (remainingBits!0 ((_ sign_extend 32) (size!2303 (buf!2697 thiss!1305))) ((_ sign_extend 32) (currentByte!5251 thiss!1305)) ((_ sign_extend 32) (currentBit!5246 thiss!1305))))))

(declare-fun lt!167432 () (_ BitVec 64))

(declare-fun lt!167431 () (_ BitVec 64))

(assert (=> d!34782 (= lt!167434 (bvmul lt!167432 lt!167431))))

(assert (=> d!34782 (or (= lt!167432 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!167431 (bvsdiv (bvmul lt!167432 lt!167431) lt!167432)))))

(assert (=> d!34782 (= lt!167431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34782 (= lt!167432 ((_ sign_extend 32) (size!2303 (buf!2697 thiss!1305))))))

(assert (=> d!34782 (= lt!167430 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5251 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5246 thiss!1305))))))

(assert (=> d!34782 (invariant!0 (currentBit!5246 thiss!1305) (currentByte!5251 thiss!1305) (size!2303 (buf!2697 thiss!1305)))))

(assert (=> d!34782 (= (bitIndex!0 (size!2303 (buf!2697 thiss!1305)) (currentByte!5251 thiss!1305) (currentBit!5246 thiss!1305)) lt!167430)))

(declare-fun b!110585 () Bool)

(declare-fun res!91281 () Bool)

(assert (=> b!110585 (=> (not res!91281) (not e!72528))))

(assert (=> b!110585 (= res!91281 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!167430))))

(declare-fun b!110586 () Bool)

(declare-fun lt!167435 () (_ BitVec 64))

(assert (=> b!110586 (= e!72528 (bvsle lt!167430 (bvmul lt!167435 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!110586 (or (= lt!167435 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!167435 #b0000000000000000000000000000000000000000000000000000000000001000) lt!167435)))))

(assert (=> b!110586 (= lt!167435 ((_ sign_extend 32) (size!2303 (buf!2697 thiss!1305))))))

(assert (= (and d!34782 res!91280) b!110585))

(assert (= (and b!110585 res!91281) b!110586))

(declare-fun m!164191 () Bool)

(assert (=> d!34782 m!164191))

(assert (=> d!34782 m!164171))

(assert (=> b!110508 d!34782))

(declare-fun d!34794 () Bool)

(declare-fun res!91306 () Bool)

(declare-fun e!72543 () Bool)

(assert (=> d!34794 (=> (not res!91306) (not e!72543))))

(assert (=> d!34794 (= res!91306 (= (size!2303 (buf!2697 thiss!1305)) (size!2303 (buf!2697 thiss!1305))))))

(assert (=> d!34794 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!72543)))

(declare-fun b!110609 () Bool)

(declare-fun res!91305 () Bool)

(assert (=> b!110609 (=> (not res!91305) (not e!72543))))

(assert (=> b!110609 (= res!91305 (bvsle (bitIndex!0 (size!2303 (buf!2697 thiss!1305)) (currentByte!5251 thiss!1305) (currentBit!5246 thiss!1305)) (bitIndex!0 (size!2303 (buf!2697 thiss!1305)) (currentByte!5251 thiss!1305) (currentBit!5246 thiss!1305))))))

(declare-fun b!110610 () Bool)

(declare-fun e!72544 () Bool)

(assert (=> b!110610 (= e!72543 e!72544)))

(declare-fun res!91304 () Bool)

(assert (=> b!110610 (=> res!91304 e!72544)))

(assert (=> b!110610 (= res!91304 (= (size!2303 (buf!2697 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110611 () Bool)

(assert (=> b!110611 (= e!72544 (arrayBitRangesEq!0 (buf!2697 thiss!1305) (buf!2697 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2303 (buf!2697 thiss!1305)) (currentByte!5251 thiss!1305) (currentBit!5246 thiss!1305))))))

(assert (= (and d!34794 res!91306) b!110609))

(assert (= (and b!110609 res!91305) b!110610))

(assert (= (and b!110610 (not res!91304)) b!110611))

(assert (=> b!110609 m!164077))

(assert (=> b!110609 m!164077))

(assert (=> b!110611 m!164077))

(assert (=> b!110611 m!164077))

(declare-fun m!164195 () Bool)

(assert (=> b!110611 m!164195))

(assert (=> b!110508 d!34794))

(declare-fun d!34800 () Bool)

(assert (=> d!34800 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!167450 () Unit!6771)

(declare-fun choose!11 (BitStream!4080) Unit!6771)

(assert (=> d!34800 (= lt!167450 (choose!11 thiss!1305))))

(assert (=> d!34800 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!167450)))

(declare-fun bs!8524 () Bool)

(assert (= bs!8524 d!34800))

(assert (=> bs!8524 m!164079))

(declare-fun m!164201 () Bool)

(assert (=> bs!8524 m!164201))

(assert (=> b!110508 d!34800))

(declare-fun d!34806 () Bool)

(assert (=> d!34806 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2303 (buf!2697 thiss!1305))) ((_ sign_extend 32) (currentByte!5251 thiss!1305)) ((_ sign_extend 32) (currentBit!5246 thiss!1305)) lt!167186) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2303 (buf!2697 thiss!1305))) ((_ sign_extend 32) (currentByte!5251 thiss!1305)) ((_ sign_extend 32) (currentBit!5246 thiss!1305))) lt!167186))))

(declare-fun bs!8525 () Bool)

(assert (= bs!8525 d!34806))

(assert (=> bs!8525 m!164191))

(assert (=> b!110507 d!34806))

(check-sat (not d!34762) (not d!34806) (not d!34776) (not d!34782) (not d!34800) (not b!110565) (not b!110563) (not b!110609) (not d!34756) (not b!110611) (not b!110567) (not b!110566) (not d!34770))
(check-sat)
