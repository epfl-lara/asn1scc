; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22868 () Bool)

(assert start!22868)

(declare-fun b!115562 () Bool)

(declare-fun e!75744 () Bool)

(declare-datatypes ((array!5213 0))(
  ( (array!5214 (arr!2958 (Array (_ BitVec 32) (_ BitVec 8))) (size!2365 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4204 0))(
  ( (BitStream!4205 (buf!2775 array!5213) (currentByte!5403 (_ BitVec 32)) (currentBit!5398 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9526 0))(
  ( (tuple2!9527 (_1!5028 BitStream!4204) (_2!5028 Bool)) )
))
(declare-fun lt!176360 () tuple2!9526)

(declare-fun lt!176354 () tuple2!9526)

(assert (=> b!115562 (= e!75744 (= (_2!5028 lt!176360) (_2!5028 lt!176354)))))

(declare-fun b!115563 () Bool)

(declare-fun res!95506 () Bool)

(declare-fun e!75742 () Bool)

(assert (=> b!115563 (=> (not res!95506) (not e!75742))))

(declare-fun thiss!1305 () BitStream!4204)

(declare-datatypes ((Unit!7111 0))(
  ( (Unit!7112) )
))
(declare-datatypes ((tuple2!9528 0))(
  ( (tuple2!9529 (_1!5029 Unit!7111) (_2!5029 BitStream!4204)) )
))
(declare-fun lt!176359 () tuple2!9528)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!115563 (= res!95506 (invariant!0 (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305) (size!2365 (buf!2775 (_2!5029 lt!176359)))))))

(declare-fun b!115564 () Bool)

(declare-fun e!75743 () Bool)

(declare-fun e!75745 () Bool)

(assert (=> b!115564 (= e!75743 e!75745)))

(declare-fun res!95508 () Bool)

(assert (=> b!115564 (=> (not res!95508) (not e!75745))))

(declare-fun lt!176356 () Bool)

(declare-fun lt!176352 () tuple2!9526)

(assert (=> b!115564 (= res!95508 (and (= (_2!5028 lt!176352) lt!176356) (= (_1!5028 lt!176352) (_2!5029 lt!176359))))))

(declare-fun readBitPure!0 (BitStream!4204) tuple2!9526)

(declare-fun readerFrom!0 (BitStream!4204 (_ BitVec 32) (_ BitVec 32)) BitStream!4204)

(assert (=> b!115564 (= lt!176352 (readBitPure!0 (readerFrom!0 (_2!5029 lt!176359) (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305))))))

(declare-fun b!115565 () Bool)

(declare-fun e!75740 () Bool)

(assert (=> b!115565 (= e!75740 e!75743)))

(declare-fun res!95501 () Bool)

(assert (=> b!115565 (=> (not res!95501) (not e!75743))))

(declare-fun lt!176353 () (_ BitVec 64))

(declare-fun lt!176358 () (_ BitVec 64))

(assert (=> b!115565 (= res!95501 (= lt!176353 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!176358)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115565 (= lt!176353 (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176359))) (currentByte!5403 (_2!5029 lt!176359)) (currentBit!5398 (_2!5029 lt!176359))))))

(assert (=> b!115565 (= lt!176358 (bitIndex!0 (size!2365 (buf!2775 thiss!1305)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305)))))

(declare-fun b!115566 () Bool)

(declare-fun res!95509 () Bool)

(assert (=> b!115566 (=> (not res!95509) (not e!75743))))

(declare-fun isPrefixOf!0 (BitStream!4204 BitStream!4204) Bool)

(assert (=> b!115566 (= res!95509 (isPrefixOf!0 thiss!1305 (_2!5029 lt!176359)))))

(declare-fun b!115567 () Bool)

(declare-fun lt!176355 () tuple2!9528)

(assert (=> b!115567 (= e!75742 (invariant!0 (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305) (size!2365 (buf!2775 (_2!5029 lt!176355)))))))

(declare-fun b!115568 () Bool)

(declare-fun e!75741 () Bool)

(assert (=> b!115568 (= e!75741 (not (= (size!2365 (buf!2775 thiss!1305)) (size!2365 (buf!2775 (_2!5029 lt!176355))))))))

(declare-datatypes ((tuple2!9530 0))(
  ( (tuple2!9531 (_1!5030 BitStream!4204) (_2!5030 BitStream!4204)) )
))
(declare-fun lt!176361 () tuple2!9530)

(assert (=> b!115568 (= (_2!5028 (readBitPure!0 (_1!5030 lt!176361))) lt!176356)))

(declare-fun lt!176349 () tuple2!9530)

(declare-fun reader!0 (BitStream!4204 BitStream!4204) tuple2!9530)

(assert (=> b!115568 (= lt!176349 (reader!0 (_2!5029 lt!176359) (_2!5029 lt!176355)))))

(assert (=> b!115568 (= lt!176361 (reader!0 thiss!1305 (_2!5029 lt!176355)))))

(assert (=> b!115568 e!75744))

(declare-fun res!95505 () Bool)

(assert (=> b!115568 (=> (not res!95505) (not e!75744))))

(assert (=> b!115568 (= res!95505 (= (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!176360))) (currentByte!5403 (_1!5028 lt!176360)) (currentBit!5398 (_1!5028 lt!176360))) (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!176354))) (currentByte!5403 (_1!5028 lt!176354)) (currentBit!5398 (_1!5028 lt!176354)))))))

(declare-fun lt!176351 () Unit!7111)

(declare-fun lt!176357 () BitStream!4204)

(declare-fun readBitPrefixLemma!0 (BitStream!4204 BitStream!4204) Unit!7111)

(assert (=> b!115568 (= lt!176351 (readBitPrefixLemma!0 lt!176357 (_2!5029 lt!176355)))))

(assert (=> b!115568 (= lt!176354 (readBitPure!0 (BitStream!4205 (buf!2775 (_2!5029 lt!176355)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305))))))

(assert (=> b!115568 (= lt!176360 (readBitPure!0 lt!176357))))

(assert (=> b!115568 (= lt!176357 (BitStream!4205 (buf!2775 (_2!5029 lt!176359)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305)))))

(assert (=> b!115568 e!75742))

(declare-fun res!95507 () Bool)

(assert (=> b!115568 (=> (not res!95507) (not e!75742))))

(assert (=> b!115568 (= res!95507 (isPrefixOf!0 thiss!1305 (_2!5029 lt!176355)))))

(declare-fun lt!176350 () Unit!7111)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4204 BitStream!4204 BitStream!4204) Unit!7111)

(assert (=> b!115568 (= lt!176350 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5029 lt!176359) (_2!5029 lt!176355)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4204 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9528)

(assert (=> b!115568 (= lt!176355 (appendNLeastSignificantBitsLoop!0 (_2!5029 lt!176359) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!115568 e!75740))

(declare-fun res!95502 () Bool)

(assert (=> b!115568 (=> (not res!95502) (not e!75740))))

(assert (=> b!115568 (= res!95502 (= (size!2365 (buf!2775 thiss!1305)) (size!2365 (buf!2775 (_2!5029 lt!176359)))))))

(declare-fun appendBit!0 (BitStream!4204 Bool) tuple2!9528)

(assert (=> b!115568 (= lt!176359 (appendBit!0 thiss!1305 lt!176356))))

(assert (=> b!115568 (= lt!176356 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115569 () Bool)

(declare-fun res!95503 () Bool)

(assert (=> b!115569 (=> (not res!95503) (not e!75741))))

(assert (=> b!115569 (= res!95503 (bvslt i!615 nBits!396))))

(declare-fun res!95504 () Bool)

(assert (=> start!22868 (=> (not res!95504) (not e!75741))))

(assert (=> start!22868 (= res!95504 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22868 e!75741))

(assert (=> start!22868 true))

(declare-fun e!75747 () Bool)

(declare-fun inv!12 (BitStream!4204) Bool)

(assert (=> start!22868 (and (inv!12 thiss!1305) e!75747)))

(declare-fun b!115570 () Bool)

(declare-fun res!95510 () Bool)

(assert (=> b!115570 (=> (not res!95510) (not e!75741))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115570 (= res!95510 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!115571 () Bool)

(declare-fun res!95511 () Bool)

(assert (=> b!115571 (=> (not res!95511) (not e!75741))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115571 (= res!95511 (validate_offset_bits!1 ((_ sign_extend 32) (size!2365 (buf!2775 thiss!1305))) ((_ sign_extend 32) (currentByte!5403 thiss!1305)) ((_ sign_extend 32) (currentBit!5398 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!115572 () Bool)

(declare-fun array_inv!2167 (array!5213) Bool)

(assert (=> b!115572 (= e!75747 (array_inv!2167 (buf!2775 thiss!1305)))))

(declare-fun b!115573 () Bool)

(assert (=> b!115573 (= e!75745 (= (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!176352))) (currentByte!5403 (_1!5028 lt!176352)) (currentBit!5398 (_1!5028 lt!176352))) lt!176353))))

(assert (= (and start!22868 res!95504) b!115571))

(assert (= (and b!115571 res!95511) b!115570))

(assert (= (and b!115570 res!95510) b!115569))

(assert (= (and b!115569 res!95503) b!115568))

(assert (= (and b!115568 res!95502) b!115565))

(assert (= (and b!115565 res!95501) b!115566))

(assert (= (and b!115566 res!95509) b!115564))

(assert (= (and b!115564 res!95508) b!115573))

(assert (= (and b!115568 res!95507) b!115563))

(assert (= (and b!115563 res!95506) b!115567))

(assert (= (and b!115568 res!95505) b!115562))

(assert (= start!22868 b!115572))

(declare-fun m!172955 () Bool)

(assert (=> b!115567 m!172955))

(declare-fun m!172957 () Bool)

(assert (=> b!115564 m!172957))

(assert (=> b!115564 m!172957))

(declare-fun m!172959 () Bool)

(assert (=> b!115564 m!172959))

(declare-fun m!172961 () Bool)

(assert (=> b!115573 m!172961))

(declare-fun m!172963 () Bool)

(assert (=> b!115572 m!172963))

(declare-fun m!172965 () Bool)

(assert (=> b!115570 m!172965))

(declare-fun m!172967 () Bool)

(assert (=> b!115563 m!172967))

(declare-fun m!172969 () Bool)

(assert (=> b!115568 m!172969))

(declare-fun m!172971 () Bool)

(assert (=> b!115568 m!172971))

(declare-fun m!172973 () Bool)

(assert (=> b!115568 m!172973))

(declare-fun m!172975 () Bool)

(assert (=> b!115568 m!172975))

(declare-fun m!172977 () Bool)

(assert (=> b!115568 m!172977))

(declare-fun m!172979 () Bool)

(assert (=> b!115568 m!172979))

(declare-fun m!172981 () Bool)

(assert (=> b!115568 m!172981))

(declare-fun m!172983 () Bool)

(assert (=> b!115568 m!172983))

(declare-fun m!172985 () Bool)

(assert (=> b!115568 m!172985))

(declare-fun m!172987 () Bool)

(assert (=> b!115568 m!172987))

(declare-fun m!172989 () Bool)

(assert (=> b!115568 m!172989))

(declare-fun m!172991 () Bool)

(assert (=> b!115568 m!172991))

(declare-fun m!172993 () Bool)

(assert (=> b!115565 m!172993))

(declare-fun m!172995 () Bool)

(assert (=> b!115565 m!172995))

(declare-fun m!172997 () Bool)

(assert (=> b!115571 m!172997))

(declare-fun m!172999 () Bool)

(assert (=> b!115566 m!172999))

(declare-fun m!173001 () Bool)

(assert (=> start!22868 m!173001))

(push 1)

(assert (not b!115564))

(assert (not start!22868))

(assert (not b!115565))

(assert (not b!115566))

(assert (not b!115563))

(assert (not b!115572))

(assert (not b!115573))

(assert (not b!115568))

(assert (not b!115571))

(assert (not b!115570))

(assert (not b!115567))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37210 () Bool)

(assert (=> d!37210 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!115570 d!37210))

(declare-fun d!37212 () Bool)

(declare-fun e!75817 () Bool)

(assert (=> d!37212 e!75817))

(declare-fun res!95617 () Bool)

(assert (=> d!37212 (=> (not res!95617) (not e!75817))))

(declare-fun lt!176495 () (_ BitVec 64))

(declare-fun lt!176496 () (_ BitVec 64))

(declare-fun lt!176499 () (_ BitVec 64))

(assert (=> d!37212 (= res!95617 (= lt!176495 (bvsub lt!176499 lt!176496)))))

(assert (=> d!37212 (or (= (bvand lt!176499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176496 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176499 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176499 lt!176496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37212 (= lt!176496 (remainingBits!0 ((_ sign_extend 32) (size!2365 (buf!2775 (_1!5028 lt!176352)))) ((_ sign_extend 32) (currentByte!5403 (_1!5028 lt!176352))) ((_ sign_extend 32) (currentBit!5398 (_1!5028 lt!176352)))))))

(declare-fun lt!176498 () (_ BitVec 64))

(declare-fun lt!176494 () (_ BitVec 64))

(assert (=> d!37212 (= lt!176499 (bvmul lt!176498 lt!176494))))

(assert (=> d!37212 (or (= lt!176498 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176494 (bvsdiv (bvmul lt!176498 lt!176494) lt!176498)))))

(assert (=> d!37212 (= lt!176494 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37212 (= lt!176498 ((_ sign_extend 32) (size!2365 (buf!2775 (_1!5028 lt!176352)))))))

(assert (=> d!37212 (= lt!176495 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5403 (_1!5028 lt!176352))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5398 (_1!5028 lt!176352)))))))

(assert (=> d!37212 (invariant!0 (currentBit!5398 (_1!5028 lt!176352)) (currentByte!5403 (_1!5028 lt!176352)) (size!2365 (buf!2775 (_1!5028 lt!176352))))))

(assert (=> d!37212 (= (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!176352))) (currentByte!5403 (_1!5028 lt!176352)) (currentBit!5398 (_1!5028 lt!176352))) lt!176495)))

(declare-fun b!115685 () Bool)

(declare-fun res!95616 () Bool)

(assert (=> b!115685 (=> (not res!95616) (not e!75817))))

(assert (=> b!115685 (= res!95616 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176495))))

(declare-fun b!115686 () Bool)

(declare-fun lt!176497 () (_ BitVec 64))

(assert (=> b!115686 (= e!75817 (bvsle lt!176495 (bvmul lt!176497 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115686 (or (= lt!176497 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176497 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176497)))))

(assert (=> b!115686 (= lt!176497 ((_ sign_extend 32) (size!2365 (buf!2775 (_1!5028 lt!176352)))))))

(assert (= (and d!37212 res!95617) b!115685))

(assert (= (and b!115685 res!95616) b!115686))

(declare-fun m!173131 () Bool)

(assert (=> d!37212 m!173131))

(declare-fun m!173133 () Bool)

(assert (=> d!37212 m!173133))

(assert (=> b!115573 d!37212))

(declare-fun d!37214 () Bool)

(assert (=> d!37214 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2365 (buf!2775 thiss!1305))) ((_ sign_extend 32) (currentByte!5403 thiss!1305)) ((_ sign_extend 32) (currentBit!5398 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2365 (buf!2775 thiss!1305))) ((_ sign_extend 32) (currentByte!5403 thiss!1305)) ((_ sign_extend 32) (currentBit!5398 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!9002 () Bool)

(assert (= bs!9002 d!37214))

(declare-fun m!173135 () Bool)

(assert (=> bs!9002 m!173135))

(assert (=> b!115571 d!37214))

(declare-fun d!37216 () Bool)

(assert (=> d!37216 (= (array_inv!2167 (buf!2775 thiss!1305)) (bvsge (size!2365 (buf!2775 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!115572 d!37216))

(declare-fun d!37218 () Bool)

(declare-fun e!75818 () Bool)

(assert (=> d!37218 e!75818))

(declare-fun res!95619 () Bool)

(assert (=> d!37218 (=> (not res!95619) (not e!75818))))

(declare-fun lt!176505 () (_ BitVec 64))

(declare-fun lt!176501 () (_ BitVec 64))

(declare-fun lt!176502 () (_ BitVec 64))

(assert (=> d!37218 (= res!95619 (= lt!176501 (bvsub lt!176505 lt!176502)))))

(assert (=> d!37218 (or (= (bvand lt!176505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176505 lt!176502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37218 (= lt!176502 (remainingBits!0 ((_ sign_extend 32) (size!2365 (buf!2775 (_2!5029 lt!176359)))) ((_ sign_extend 32) (currentByte!5403 (_2!5029 lt!176359))) ((_ sign_extend 32) (currentBit!5398 (_2!5029 lt!176359)))))))

(declare-fun lt!176504 () (_ BitVec 64))

(declare-fun lt!176500 () (_ BitVec 64))

(assert (=> d!37218 (= lt!176505 (bvmul lt!176504 lt!176500))))

(assert (=> d!37218 (or (= lt!176504 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176500 (bvsdiv (bvmul lt!176504 lt!176500) lt!176504)))))

(assert (=> d!37218 (= lt!176500 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37218 (= lt!176504 ((_ sign_extend 32) (size!2365 (buf!2775 (_2!5029 lt!176359)))))))

(assert (=> d!37218 (= lt!176501 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5403 (_2!5029 lt!176359))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5398 (_2!5029 lt!176359)))))))

(assert (=> d!37218 (invariant!0 (currentBit!5398 (_2!5029 lt!176359)) (currentByte!5403 (_2!5029 lt!176359)) (size!2365 (buf!2775 (_2!5029 lt!176359))))))

(assert (=> d!37218 (= (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176359))) (currentByte!5403 (_2!5029 lt!176359)) (currentBit!5398 (_2!5029 lt!176359))) lt!176501)))

(declare-fun b!115687 () Bool)

(declare-fun res!95618 () Bool)

(assert (=> b!115687 (=> (not res!95618) (not e!75818))))

(assert (=> b!115687 (= res!95618 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176501))))

(declare-fun b!115688 () Bool)

(declare-fun lt!176503 () (_ BitVec 64))

(assert (=> b!115688 (= e!75818 (bvsle lt!176501 (bvmul lt!176503 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115688 (or (= lt!176503 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176503 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176503)))))

(assert (=> b!115688 (= lt!176503 ((_ sign_extend 32) (size!2365 (buf!2775 (_2!5029 lt!176359)))))))

(assert (= (and d!37218 res!95619) b!115687))

(assert (= (and b!115687 res!95618) b!115688))

(declare-fun m!173137 () Bool)

(assert (=> d!37218 m!173137))

(declare-fun m!173139 () Bool)

(assert (=> d!37218 m!173139))

(assert (=> b!115565 d!37218))

(declare-fun d!37220 () Bool)

(declare-fun e!75819 () Bool)

(assert (=> d!37220 e!75819))

(declare-fun res!95621 () Bool)

(assert (=> d!37220 (=> (not res!95621) (not e!75819))))

(declare-fun lt!176511 () (_ BitVec 64))

(declare-fun lt!176508 () (_ BitVec 64))

(declare-fun lt!176507 () (_ BitVec 64))

(assert (=> d!37220 (= res!95621 (= lt!176507 (bvsub lt!176511 lt!176508)))))

(assert (=> d!37220 (or (= (bvand lt!176511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176508 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176511 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176511 lt!176508) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37220 (= lt!176508 (remainingBits!0 ((_ sign_extend 32) (size!2365 (buf!2775 thiss!1305))) ((_ sign_extend 32) (currentByte!5403 thiss!1305)) ((_ sign_extend 32) (currentBit!5398 thiss!1305))))))

(declare-fun lt!176510 () (_ BitVec 64))

(declare-fun lt!176506 () (_ BitVec 64))

(assert (=> d!37220 (= lt!176511 (bvmul lt!176510 lt!176506))))

(assert (=> d!37220 (or (= lt!176510 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176506 (bvsdiv (bvmul lt!176510 lt!176506) lt!176510)))))

(assert (=> d!37220 (= lt!176506 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37220 (= lt!176510 ((_ sign_extend 32) (size!2365 (buf!2775 thiss!1305))))))

(assert (=> d!37220 (= lt!176507 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5403 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5398 thiss!1305))))))

(assert (=> d!37220 (invariant!0 (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305) (size!2365 (buf!2775 thiss!1305)))))

(assert (=> d!37220 (= (bitIndex!0 (size!2365 (buf!2775 thiss!1305)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305)) lt!176507)))

(declare-fun b!115689 () Bool)

(declare-fun res!95620 () Bool)

(assert (=> b!115689 (=> (not res!95620) (not e!75819))))

(assert (=> b!115689 (= res!95620 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176507))))

(declare-fun b!115690 () Bool)

(declare-fun lt!176509 () (_ BitVec 64))

(assert (=> b!115690 (= e!75819 (bvsle lt!176507 (bvmul lt!176509 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115690 (or (= lt!176509 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176509 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176509)))))

(assert (=> b!115690 (= lt!176509 ((_ sign_extend 32) (size!2365 (buf!2775 thiss!1305))))))

(assert (= (and d!37220 res!95621) b!115689))

(assert (= (and b!115689 res!95620) b!115690))

(assert (=> d!37220 m!173135))

(declare-fun m!173141 () Bool)

(assert (=> d!37220 m!173141))

(assert (=> b!115565 d!37220))

(declare-fun d!37222 () Bool)

(assert (=> d!37222 (= (invariant!0 (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305) (size!2365 (buf!2775 (_2!5029 lt!176359)))) (and (bvsge (currentBit!5398 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5398 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5403 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5403 thiss!1305) (size!2365 (buf!2775 (_2!5029 lt!176359)))) (and (= (currentBit!5398 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5403 thiss!1305) (size!2365 (buf!2775 (_2!5029 lt!176359))))))))))

(assert (=> b!115563 d!37222))

(declare-fun d!37224 () Bool)

(declare-datatypes ((tuple2!9544 0))(
  ( (tuple2!9545 (_1!5037 Bool) (_2!5037 BitStream!4204)) )
))
(declare-fun lt!176522 () tuple2!9544)

(declare-fun readBit!0 (BitStream!4204) tuple2!9544)

(assert (=> d!37224 (= lt!176522 (readBit!0 (readerFrom!0 (_2!5029 lt!176359) (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305))))))

(assert (=> d!37224 (= (readBitPure!0 (readerFrom!0 (_2!5029 lt!176359) (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305))) (tuple2!9527 (_2!5037 lt!176522) (_1!5037 lt!176522)))))

(declare-fun bs!9003 () Bool)

(assert (= bs!9003 d!37224))

(assert (=> bs!9003 m!172957))

(declare-fun m!173143 () Bool)

(assert (=> bs!9003 m!173143))

(assert (=> b!115564 d!37224))

(declare-fun d!37226 () Bool)

(declare-fun e!75826 () Bool)

(assert (=> d!37226 e!75826))

(declare-fun res!95631 () Bool)

(assert (=> d!37226 (=> (not res!95631) (not e!75826))))

(assert (=> d!37226 (= res!95631 (invariant!0 (currentBit!5398 (_2!5029 lt!176359)) (currentByte!5403 (_2!5029 lt!176359)) (size!2365 (buf!2775 (_2!5029 lt!176359)))))))

(assert (=> d!37226 (= (readerFrom!0 (_2!5029 lt!176359) (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305)) (BitStream!4205 (buf!2775 (_2!5029 lt!176359)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305)))))

(declare-fun b!115703 () Bool)

(assert (=> b!115703 (= e!75826 (invariant!0 (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305) (size!2365 (buf!2775 (_2!5029 lt!176359)))))))

(assert (= (and d!37226 res!95631) b!115703))

(assert (=> d!37226 m!173139))

(assert (=> b!115703 m!172967))

(assert (=> b!115564 d!37226))

(declare-fun d!37228 () Bool)

(assert (=> d!37228 (= (invariant!0 (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305) (size!2365 (buf!2775 (_2!5029 lt!176355)))) (and (bvsge (currentBit!5398 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5398 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5403 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5403 thiss!1305) (size!2365 (buf!2775 (_2!5029 lt!176355)))) (and (= (currentBit!5398 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5403 thiss!1305) (size!2365 (buf!2775 (_2!5029 lt!176355))))))))))

(assert (=> b!115567 d!37228))

(declare-fun b!115721 () Bool)

(declare-fun res!95648 () Bool)

(declare-fun e!75836 () Bool)

(assert (=> b!115721 (=> (not res!95648) (not e!75836))))

(declare-fun lt!176596 () (_ BitVec 64))

(declare-fun lt!176595 () tuple2!9528)

(declare-fun lt!176598 () (_ BitVec 64))

(assert (=> b!115721 (= res!95648 (= (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176595))) (currentByte!5403 (_2!5029 lt!176595)) (currentBit!5398 (_2!5029 lt!176595))) (bvadd lt!176596 lt!176598)))))

(assert (=> b!115721 (or (not (= (bvand lt!176596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176598 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!176596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!176596 lt!176598) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115721 (= lt!176598 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!115721 (= lt!176596 (bitIndex!0 (size!2365 (buf!2775 thiss!1305)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305)))))

(declare-fun d!37230 () Bool)

(assert (=> d!37230 e!75836))

(declare-fun res!95647 () Bool)

(assert (=> d!37230 (=> (not res!95647) (not e!75836))))

(assert (=> d!37230 (= res!95647 (= (size!2365 (buf!2775 thiss!1305)) (size!2365 (buf!2775 (_2!5029 lt!176595)))))))

(declare-fun choose!16 (BitStream!4204 Bool) tuple2!9528)

(assert (=> d!37230 (= lt!176595 (choose!16 thiss!1305 lt!176356))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37230 (validate_offset_bit!0 ((_ sign_extend 32) (size!2365 (buf!2775 thiss!1305))) ((_ sign_extend 32) (currentByte!5403 thiss!1305)) ((_ sign_extend 32) (currentBit!5398 thiss!1305)))))

(assert (=> d!37230 (= (appendBit!0 thiss!1305 lt!176356) lt!176595)))

(declare-fun b!115723 () Bool)

(declare-fun e!75837 () Bool)

(assert (=> b!115723 (= e!75836 e!75837)))

(declare-fun res!95646 () Bool)

(assert (=> b!115723 (=> (not res!95646) (not e!75837))))

(declare-fun lt!176597 () tuple2!9526)

(assert (=> b!115723 (= res!95646 (and (= (_2!5028 lt!176597) lt!176356) (= (_1!5028 lt!176597) (_2!5029 lt!176595))))))

(assert (=> b!115723 (= lt!176597 (readBitPure!0 (readerFrom!0 (_2!5029 lt!176595) (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305))))))

(declare-fun b!115722 () Bool)

(declare-fun res!95649 () Bool)

(assert (=> b!115722 (=> (not res!95649) (not e!75836))))

(assert (=> b!115722 (= res!95649 (isPrefixOf!0 thiss!1305 (_2!5029 lt!176595)))))

(declare-fun b!115724 () Bool)

(assert (=> b!115724 (= e!75837 (= (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!176597))) (currentByte!5403 (_1!5028 lt!176597)) (currentBit!5398 (_1!5028 lt!176597))) (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176595))) (currentByte!5403 (_2!5029 lt!176595)) (currentBit!5398 (_2!5029 lt!176595)))))))

(assert (= (and d!37230 res!95647) b!115721))

(assert (= (and b!115721 res!95648) b!115722))

(assert (= (and b!115722 res!95649) b!115723))

(assert (= (and b!115723 res!95646) b!115724))

(declare-fun m!173187 () Bool)

(assert (=> b!115722 m!173187))

(declare-fun m!173189 () Bool)

(assert (=> d!37230 m!173189))

(declare-fun m!173191 () Bool)

(assert (=> d!37230 m!173191))

(declare-fun m!173193 () Bool)

(assert (=> b!115724 m!173193))

(declare-fun m!173195 () Bool)

(assert (=> b!115724 m!173195))

(assert (=> b!115721 m!173195))

(assert (=> b!115721 m!172995))

(declare-fun m!173197 () Bool)

(assert (=> b!115723 m!173197))

(assert (=> b!115723 m!173197))

(declare-fun m!173199 () Bool)

(assert (=> b!115723 m!173199))

(assert (=> b!115568 d!37230))

(declare-fun d!37236 () Bool)

(declare-fun e!75846 () Bool)

(assert (=> d!37236 e!75846))

(declare-fun res!95661 () Bool)

(assert (=> d!37236 (=> (not res!95661) (not e!75846))))

(declare-fun lt!176609 () tuple2!9526)

(declare-fun lt!176607 () tuple2!9526)

(assert (=> d!37236 (= res!95661 (= (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!176609))) (currentByte!5403 (_1!5028 lt!176609)) (currentBit!5398 (_1!5028 lt!176609))) (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!176607))) (currentByte!5403 (_1!5028 lt!176607)) (currentBit!5398 (_1!5028 lt!176607)))))))

(declare-fun lt!176610 () Unit!7111)

(declare-fun lt!176608 () BitStream!4204)

(declare-fun choose!50 (BitStream!4204 BitStream!4204 BitStream!4204 tuple2!9526 tuple2!9526 BitStream!4204 Bool tuple2!9526 tuple2!9526 BitStream!4204 Bool) Unit!7111)

(assert (=> d!37236 (= lt!176610 (choose!50 lt!176357 (_2!5029 lt!176355) lt!176608 lt!176609 (tuple2!9527 (_1!5028 lt!176609) (_2!5028 lt!176609)) (_1!5028 lt!176609) (_2!5028 lt!176609) lt!176607 (tuple2!9527 (_1!5028 lt!176607) (_2!5028 lt!176607)) (_1!5028 lt!176607) (_2!5028 lt!176607)))))

(assert (=> d!37236 (= lt!176607 (readBitPure!0 lt!176608))))

(assert (=> d!37236 (= lt!176609 (readBitPure!0 lt!176357))))

(assert (=> d!37236 (= lt!176608 (BitStream!4205 (buf!2775 (_2!5029 lt!176355)) (currentByte!5403 lt!176357) (currentBit!5398 lt!176357)))))

(assert (=> d!37236 (invariant!0 (currentBit!5398 lt!176357) (currentByte!5403 lt!176357) (size!2365 (buf!2775 (_2!5029 lt!176355))))))

(assert (=> d!37236 (= (readBitPrefixLemma!0 lt!176357 (_2!5029 lt!176355)) lt!176610)))

(declare-fun b!115736 () Bool)

(assert (=> b!115736 (= e!75846 (= (_2!5028 lt!176609) (_2!5028 lt!176607)))))

(assert (= (and d!37236 res!95661) b!115736))

(assert (=> d!37236 m!172975))

(declare-fun m!173205 () Bool)

(assert (=> d!37236 m!173205))

(declare-fun m!173207 () Bool)

(assert (=> d!37236 m!173207))

(declare-fun m!173209 () Bool)

(assert (=> d!37236 m!173209))

(declare-fun m!173211 () Bool)

(assert (=> d!37236 m!173211))

(declare-fun m!173213 () Bool)

(assert (=> d!37236 m!173213))

(assert (=> b!115568 d!37236))

(declare-fun b!115767 () Bool)

(declare-fun res!95689 () Bool)

(declare-fun e!75863 () Bool)

(assert (=> b!115767 (=> (not res!95689) (not e!75863))))

(declare-fun lt!176688 () tuple2!9530)

(assert (=> b!115767 (= res!95689 (isPrefixOf!0 (_1!5030 lt!176688) thiss!1305))))

(declare-fun b!115768 () Bool)

(declare-fun e!75862 () Unit!7111)

(declare-fun lt!176697 () Unit!7111)

(assert (=> b!115768 (= e!75862 lt!176697)))

(declare-fun lt!176687 () (_ BitVec 64))

(assert (=> b!115768 (= lt!176687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!176698 () (_ BitVec 64))

(assert (=> b!115768 (= lt!176698 (bitIndex!0 (size!2365 (buf!2775 thiss!1305)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5213 array!5213 (_ BitVec 64) (_ BitVec 64)) Unit!7111)

(assert (=> b!115768 (= lt!176697 (arrayBitRangesEqSymmetric!0 (buf!2775 thiss!1305) (buf!2775 (_2!5029 lt!176355)) lt!176687 lt!176698))))

(declare-fun arrayBitRangesEq!0 (array!5213 array!5213 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115768 (arrayBitRangesEq!0 (buf!2775 (_2!5029 lt!176355)) (buf!2775 thiss!1305) lt!176687 lt!176698)))

(declare-fun d!37248 () Bool)

(assert (=> d!37248 e!75863))

(declare-fun res!95690 () Bool)

(assert (=> d!37248 (=> (not res!95690) (not e!75863))))

(assert (=> d!37248 (= res!95690 (isPrefixOf!0 (_1!5030 lt!176688) (_2!5030 lt!176688)))))

(declare-fun lt!176705 () BitStream!4204)

(assert (=> d!37248 (= lt!176688 (tuple2!9531 lt!176705 (_2!5029 lt!176355)))))

(declare-fun lt!176692 () Unit!7111)

(declare-fun lt!176703 () Unit!7111)

(assert (=> d!37248 (= lt!176692 lt!176703)))

(assert (=> d!37248 (isPrefixOf!0 lt!176705 (_2!5029 lt!176355))))

(assert (=> d!37248 (= lt!176703 (lemmaIsPrefixTransitive!0 lt!176705 (_2!5029 lt!176355) (_2!5029 lt!176355)))))

(declare-fun lt!176700 () Unit!7111)

(declare-fun lt!176689 () Unit!7111)

(assert (=> d!37248 (= lt!176700 lt!176689)))

(assert (=> d!37248 (isPrefixOf!0 lt!176705 (_2!5029 lt!176355))))

(assert (=> d!37248 (= lt!176689 (lemmaIsPrefixTransitive!0 lt!176705 thiss!1305 (_2!5029 lt!176355)))))

(declare-fun lt!176691 () Unit!7111)

(assert (=> d!37248 (= lt!176691 e!75862)))

(declare-fun c!7006 () Bool)

(assert (=> d!37248 (= c!7006 (not (= (size!2365 (buf!2775 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!176704 () Unit!7111)

(declare-fun lt!176695 () Unit!7111)

(assert (=> d!37248 (= lt!176704 lt!176695)))

(assert (=> d!37248 (isPrefixOf!0 (_2!5029 lt!176355) (_2!5029 lt!176355))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4204) Unit!7111)

(assert (=> d!37248 (= lt!176695 (lemmaIsPrefixRefl!0 (_2!5029 lt!176355)))))

(declare-fun lt!176699 () Unit!7111)

(declare-fun lt!176701 () Unit!7111)

(assert (=> d!37248 (= lt!176699 lt!176701)))

(assert (=> d!37248 (= lt!176701 (lemmaIsPrefixRefl!0 (_2!5029 lt!176355)))))

(declare-fun lt!176694 () Unit!7111)

(declare-fun lt!176693 () Unit!7111)

(assert (=> d!37248 (= lt!176694 lt!176693)))

(assert (=> d!37248 (isPrefixOf!0 lt!176705 lt!176705)))

(assert (=> d!37248 (= lt!176693 (lemmaIsPrefixRefl!0 lt!176705))))

(declare-fun lt!176690 () Unit!7111)

(declare-fun lt!176686 () Unit!7111)

(assert (=> d!37248 (= lt!176690 lt!176686)))

(assert (=> d!37248 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37248 (= lt!176686 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37248 (= lt!176705 (BitStream!4205 (buf!2775 (_2!5029 lt!176355)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305)))))

(assert (=> d!37248 (isPrefixOf!0 thiss!1305 (_2!5029 lt!176355))))

(assert (=> d!37248 (= (reader!0 thiss!1305 (_2!5029 lt!176355)) lt!176688)))

(declare-fun b!115769 () Bool)

(declare-fun Unit!7124 () Unit!7111)

(assert (=> b!115769 (= e!75862 Unit!7124)))

(declare-fun lt!176696 () (_ BitVec 64))

(declare-fun b!115770 () Bool)

(declare-fun lt!176702 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4204 (_ BitVec 64)) BitStream!4204)

(assert (=> b!115770 (= e!75863 (= (_1!5030 lt!176688) (withMovedBitIndex!0 (_2!5030 lt!176688) (bvsub lt!176696 lt!176702))))))

(assert (=> b!115770 (or (= (bvand lt!176696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176702 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176696 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176696 lt!176702) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115770 (= lt!176702 (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176355))) (currentByte!5403 (_2!5029 lt!176355)) (currentBit!5398 (_2!5029 lt!176355))))))

(assert (=> b!115770 (= lt!176696 (bitIndex!0 (size!2365 (buf!2775 thiss!1305)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305)))))

(declare-fun b!115771 () Bool)

(declare-fun res!95688 () Bool)

(assert (=> b!115771 (=> (not res!95688) (not e!75863))))

(assert (=> b!115771 (= res!95688 (isPrefixOf!0 (_2!5030 lt!176688) (_2!5029 lt!176355)))))

(assert (= (and d!37248 c!7006) b!115768))

(assert (= (and d!37248 (not c!7006)) b!115769))

(assert (= (and d!37248 res!95690) b!115767))

(assert (= (and b!115767 res!95689) b!115771))

(assert (= (and b!115771 res!95688) b!115770))

(declare-fun m!173223 () Bool)

(assert (=> d!37248 m!173223))

(declare-fun m!173225 () Bool)

(assert (=> d!37248 m!173225))

(declare-fun m!173227 () Bool)

(assert (=> d!37248 m!173227))

(assert (=> d!37248 m!172987))

(declare-fun m!173229 () Bool)

(assert (=> d!37248 m!173229))

(declare-fun m!173231 () Bool)

(assert (=> d!37248 m!173231))

(declare-fun m!173233 () Bool)

(assert (=> d!37248 m!173233))

(declare-fun m!173235 () Bool)

(assert (=> d!37248 m!173235))

(declare-fun m!173237 () Bool)

(assert (=> d!37248 m!173237))

(declare-fun m!173239 () Bool)

(assert (=> d!37248 m!173239))

(declare-fun m!173241 () Bool)

(assert (=> d!37248 m!173241))

(declare-fun m!173243 () Bool)

(assert (=> b!115770 m!173243))

(declare-fun m!173245 () Bool)

(assert (=> b!115770 m!173245))

(assert (=> b!115770 m!172995))

(declare-fun m!173247 () Bool)

(assert (=> b!115767 m!173247))

(declare-fun m!173249 () Bool)

(assert (=> b!115771 m!173249))

(assert (=> b!115768 m!172995))

(declare-fun m!173251 () Bool)

(assert (=> b!115768 m!173251))

(declare-fun m!173253 () Bool)

(assert (=> b!115768 m!173253))

(assert (=> b!115568 d!37248))

(declare-fun d!37262 () Bool)

(declare-fun lt!176706 () tuple2!9544)

(assert (=> d!37262 (= lt!176706 (readBit!0 (BitStream!4205 (buf!2775 (_2!5029 lt!176355)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305))))))

(assert (=> d!37262 (= (readBitPure!0 (BitStream!4205 (buf!2775 (_2!5029 lt!176355)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305))) (tuple2!9527 (_2!5037 lt!176706) (_1!5037 lt!176706)))))

(declare-fun bs!9006 () Bool)

(assert (= bs!9006 d!37262))

(declare-fun m!173255 () Bool)

(assert (=> bs!9006 m!173255))

(assert (=> b!115568 d!37262))

(declare-fun d!37264 () Bool)

(declare-fun res!95703 () Bool)

(declare-fun e!75872 () Bool)

(assert (=> d!37264 (=> (not res!95703) (not e!75872))))

(assert (=> d!37264 (= res!95703 (= (size!2365 (buf!2775 thiss!1305)) (size!2365 (buf!2775 (_2!5029 lt!176355)))))))

(assert (=> d!37264 (= (isPrefixOf!0 thiss!1305 (_2!5029 lt!176355)) e!75872)))

(declare-fun b!115784 () Bool)

(declare-fun res!95705 () Bool)

(assert (=> b!115784 (=> (not res!95705) (not e!75872))))

(assert (=> b!115784 (= res!95705 (bvsle (bitIndex!0 (size!2365 (buf!2775 thiss!1305)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305)) (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176355))) (currentByte!5403 (_2!5029 lt!176355)) (currentBit!5398 (_2!5029 lt!176355)))))))

(declare-fun b!115785 () Bool)

(declare-fun e!75871 () Bool)

(assert (=> b!115785 (= e!75872 e!75871)))

(declare-fun res!95704 () Bool)

(assert (=> b!115785 (=> res!95704 e!75871)))

(assert (=> b!115785 (= res!95704 (= (size!2365 (buf!2775 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!115786 () Bool)

(assert (=> b!115786 (= e!75871 (arrayBitRangesEq!0 (buf!2775 thiss!1305) (buf!2775 (_2!5029 lt!176355)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2365 (buf!2775 thiss!1305)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305))))))

(assert (= (and d!37264 res!95703) b!115784))

(assert (= (and b!115784 res!95705) b!115785))

(assert (= (and b!115785 (not res!95704)) b!115786))

(assert (=> b!115784 m!172995))

(assert (=> b!115784 m!173245))

(assert (=> b!115786 m!172995))

(assert (=> b!115786 m!172995))

(declare-fun m!173279 () Bool)

(assert (=> b!115786 m!173279))

(assert (=> b!115568 d!37264))

(declare-fun d!37274 () Bool)

(declare-fun lt!176719 () tuple2!9544)

(assert (=> d!37274 (= lt!176719 (readBit!0 lt!176357))))

(assert (=> d!37274 (= (readBitPure!0 lt!176357) (tuple2!9527 (_2!5037 lt!176719) (_1!5037 lt!176719)))))

(declare-fun bs!9009 () Bool)

(assert (= bs!9009 d!37274))

(declare-fun m!173281 () Bool)

(assert (=> bs!9009 m!173281))

(assert (=> b!115568 d!37274))

(declare-fun d!37276 () Bool)

(declare-fun e!75873 () Bool)

(assert (=> d!37276 e!75873))

(declare-fun res!95707 () Bool)

(assert (=> d!37276 (=> (not res!95707) (not e!75873))))

(declare-fun lt!176725 () (_ BitVec 64))

(declare-fun lt!176722 () (_ BitVec 64))

(declare-fun lt!176721 () (_ BitVec 64))

(assert (=> d!37276 (= res!95707 (= lt!176721 (bvsub lt!176725 lt!176722)))))

(assert (=> d!37276 (or (= (bvand lt!176725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176722 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176725 lt!176722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37276 (= lt!176722 (remainingBits!0 ((_ sign_extend 32) (size!2365 (buf!2775 (_1!5028 lt!176354)))) ((_ sign_extend 32) (currentByte!5403 (_1!5028 lt!176354))) ((_ sign_extend 32) (currentBit!5398 (_1!5028 lt!176354)))))))

(declare-fun lt!176724 () (_ BitVec 64))

(declare-fun lt!176720 () (_ BitVec 64))

(assert (=> d!37276 (= lt!176725 (bvmul lt!176724 lt!176720))))

(assert (=> d!37276 (or (= lt!176724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176720 (bvsdiv (bvmul lt!176724 lt!176720) lt!176724)))))

(assert (=> d!37276 (= lt!176720 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37276 (= lt!176724 ((_ sign_extend 32) (size!2365 (buf!2775 (_1!5028 lt!176354)))))))

(assert (=> d!37276 (= lt!176721 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5403 (_1!5028 lt!176354))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5398 (_1!5028 lt!176354)))))))

(assert (=> d!37276 (invariant!0 (currentBit!5398 (_1!5028 lt!176354)) (currentByte!5403 (_1!5028 lt!176354)) (size!2365 (buf!2775 (_1!5028 lt!176354))))))

(assert (=> d!37276 (= (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!176354))) (currentByte!5403 (_1!5028 lt!176354)) (currentBit!5398 (_1!5028 lt!176354))) lt!176721)))

(declare-fun b!115787 () Bool)

(declare-fun res!95706 () Bool)

(assert (=> b!115787 (=> (not res!95706) (not e!75873))))

(assert (=> b!115787 (= res!95706 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176721))))

(declare-fun b!115788 () Bool)

(declare-fun lt!176723 () (_ BitVec 64))

(assert (=> b!115788 (= e!75873 (bvsle lt!176721 (bvmul lt!176723 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115788 (or (= lt!176723 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176723 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176723)))))

(assert (=> b!115788 (= lt!176723 ((_ sign_extend 32) (size!2365 (buf!2775 (_1!5028 lt!176354)))))))

(assert (= (and d!37276 res!95707) b!115787))

(assert (= (and b!115787 res!95706) b!115788))

(declare-fun m!173283 () Bool)

(assert (=> d!37276 m!173283))

(declare-fun m!173285 () Bool)

(assert (=> d!37276 m!173285))

(assert (=> b!115568 d!37276))

(declare-fun b!115789 () Bool)

(declare-fun res!95709 () Bool)

(declare-fun e!75875 () Bool)

(assert (=> b!115789 (=> (not res!95709) (not e!75875))))

(declare-fun lt!176728 () tuple2!9530)

(assert (=> b!115789 (= res!95709 (isPrefixOf!0 (_1!5030 lt!176728) (_2!5029 lt!176359)))))

(declare-fun b!115790 () Bool)

(declare-fun e!75874 () Unit!7111)

(declare-fun lt!176737 () Unit!7111)

(assert (=> b!115790 (= e!75874 lt!176737)))

(declare-fun lt!176727 () (_ BitVec 64))

(assert (=> b!115790 (= lt!176727 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!176738 () (_ BitVec 64))

(assert (=> b!115790 (= lt!176738 (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176359))) (currentByte!5403 (_2!5029 lt!176359)) (currentBit!5398 (_2!5029 lt!176359))))))

(assert (=> b!115790 (= lt!176737 (arrayBitRangesEqSymmetric!0 (buf!2775 (_2!5029 lt!176359)) (buf!2775 (_2!5029 lt!176355)) lt!176727 lt!176738))))

(assert (=> b!115790 (arrayBitRangesEq!0 (buf!2775 (_2!5029 lt!176355)) (buf!2775 (_2!5029 lt!176359)) lt!176727 lt!176738)))

(declare-fun d!37278 () Bool)

(assert (=> d!37278 e!75875))

(declare-fun res!95710 () Bool)

(assert (=> d!37278 (=> (not res!95710) (not e!75875))))

(assert (=> d!37278 (= res!95710 (isPrefixOf!0 (_1!5030 lt!176728) (_2!5030 lt!176728)))))

(declare-fun lt!176745 () BitStream!4204)

(assert (=> d!37278 (= lt!176728 (tuple2!9531 lt!176745 (_2!5029 lt!176355)))))

(declare-fun lt!176732 () Unit!7111)

(declare-fun lt!176743 () Unit!7111)

(assert (=> d!37278 (= lt!176732 lt!176743)))

(assert (=> d!37278 (isPrefixOf!0 lt!176745 (_2!5029 lt!176355))))

(assert (=> d!37278 (= lt!176743 (lemmaIsPrefixTransitive!0 lt!176745 (_2!5029 lt!176355) (_2!5029 lt!176355)))))

(declare-fun lt!176740 () Unit!7111)

(declare-fun lt!176729 () Unit!7111)

(assert (=> d!37278 (= lt!176740 lt!176729)))

(assert (=> d!37278 (isPrefixOf!0 lt!176745 (_2!5029 lt!176355))))

(assert (=> d!37278 (= lt!176729 (lemmaIsPrefixTransitive!0 lt!176745 (_2!5029 lt!176359) (_2!5029 lt!176355)))))

(declare-fun lt!176731 () Unit!7111)

(assert (=> d!37278 (= lt!176731 e!75874)))

(declare-fun c!7007 () Bool)

(assert (=> d!37278 (= c!7007 (not (= (size!2365 (buf!2775 (_2!5029 lt!176359))) #b00000000000000000000000000000000)))))

(declare-fun lt!176744 () Unit!7111)

(declare-fun lt!176735 () Unit!7111)

(assert (=> d!37278 (= lt!176744 lt!176735)))

(assert (=> d!37278 (isPrefixOf!0 (_2!5029 lt!176355) (_2!5029 lt!176355))))

(assert (=> d!37278 (= lt!176735 (lemmaIsPrefixRefl!0 (_2!5029 lt!176355)))))

(declare-fun lt!176739 () Unit!7111)

(declare-fun lt!176741 () Unit!7111)

(assert (=> d!37278 (= lt!176739 lt!176741)))

(assert (=> d!37278 (= lt!176741 (lemmaIsPrefixRefl!0 (_2!5029 lt!176355)))))

(declare-fun lt!176734 () Unit!7111)

(declare-fun lt!176733 () Unit!7111)

(assert (=> d!37278 (= lt!176734 lt!176733)))

(assert (=> d!37278 (isPrefixOf!0 lt!176745 lt!176745)))

(assert (=> d!37278 (= lt!176733 (lemmaIsPrefixRefl!0 lt!176745))))

(declare-fun lt!176730 () Unit!7111)

(declare-fun lt!176726 () Unit!7111)

(assert (=> d!37278 (= lt!176730 lt!176726)))

(assert (=> d!37278 (isPrefixOf!0 (_2!5029 lt!176359) (_2!5029 lt!176359))))

(assert (=> d!37278 (= lt!176726 (lemmaIsPrefixRefl!0 (_2!5029 lt!176359)))))

(assert (=> d!37278 (= lt!176745 (BitStream!4205 (buf!2775 (_2!5029 lt!176355)) (currentByte!5403 (_2!5029 lt!176359)) (currentBit!5398 (_2!5029 lt!176359))))))

(assert (=> d!37278 (isPrefixOf!0 (_2!5029 lt!176359) (_2!5029 lt!176355))))

(assert (=> d!37278 (= (reader!0 (_2!5029 lt!176359) (_2!5029 lt!176355)) lt!176728)))

(declare-fun b!115791 () Bool)

(declare-fun Unit!7126 () Unit!7111)

(assert (=> b!115791 (= e!75874 Unit!7126)))

(declare-fun lt!176742 () (_ BitVec 64))

(declare-fun lt!176736 () (_ BitVec 64))

(declare-fun b!115792 () Bool)

(assert (=> b!115792 (= e!75875 (= (_1!5030 lt!176728) (withMovedBitIndex!0 (_2!5030 lt!176728) (bvsub lt!176736 lt!176742))))))

(assert (=> b!115792 (or (= (bvand lt!176736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176742 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176736 lt!176742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115792 (= lt!176742 (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176355))) (currentByte!5403 (_2!5029 lt!176355)) (currentBit!5398 (_2!5029 lt!176355))))))

(assert (=> b!115792 (= lt!176736 (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176359))) (currentByte!5403 (_2!5029 lt!176359)) (currentBit!5398 (_2!5029 lt!176359))))))

(declare-fun b!115793 () Bool)

(declare-fun res!95708 () Bool)

(assert (=> b!115793 (=> (not res!95708) (not e!75875))))

(assert (=> b!115793 (= res!95708 (isPrefixOf!0 (_2!5030 lt!176728) (_2!5029 lt!176355)))))

(assert (= (and d!37278 c!7007) b!115790))

(assert (= (and d!37278 (not c!7007)) b!115791))

(assert (= (and d!37278 res!95710) b!115789))

(assert (= (and b!115789 res!95709) b!115793))

(assert (= (and b!115793 res!95708) b!115792))

(declare-fun m!173287 () Bool)

(assert (=> d!37278 m!173287))

(declare-fun m!173289 () Bool)

(assert (=> d!37278 m!173289))

(assert (=> d!37278 m!173227))

(declare-fun m!173291 () Bool)

(assert (=> d!37278 m!173291))

(declare-fun m!173293 () Bool)

(assert (=> d!37278 m!173293))

(assert (=> d!37278 m!173231))

(declare-fun m!173295 () Bool)

(assert (=> d!37278 m!173295))

(declare-fun m!173297 () Bool)

(assert (=> d!37278 m!173297))

(declare-fun m!173299 () Bool)

(assert (=> d!37278 m!173299))

(declare-fun m!173301 () Bool)

(assert (=> d!37278 m!173301))

(declare-fun m!173303 () Bool)

(assert (=> d!37278 m!173303))

(declare-fun m!173305 () Bool)

(assert (=> b!115792 m!173305))

(assert (=> b!115792 m!173245))

(assert (=> b!115792 m!172993))

(declare-fun m!173307 () Bool)

(assert (=> b!115789 m!173307))

(declare-fun m!173309 () Bool)

(assert (=> b!115793 m!173309))

(assert (=> b!115790 m!172993))

(declare-fun m!173311 () Bool)

(assert (=> b!115790 m!173311))

(declare-fun m!173313 () Bool)

(assert (=> b!115790 m!173313))

(assert (=> b!115568 d!37278))

(declare-fun d!37280 () Bool)

(assert (=> d!37280 (isPrefixOf!0 thiss!1305 (_2!5029 lt!176355))))

(declare-fun lt!176748 () Unit!7111)

(declare-fun choose!30 (BitStream!4204 BitStream!4204 BitStream!4204) Unit!7111)

(assert (=> d!37280 (= lt!176748 (choose!30 thiss!1305 (_2!5029 lt!176359) (_2!5029 lt!176355)))))

(assert (=> d!37280 (isPrefixOf!0 thiss!1305 (_2!5029 lt!176359))))

(assert (=> d!37280 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5029 lt!176359) (_2!5029 lt!176355)) lt!176748)))

(declare-fun bs!9010 () Bool)

(assert (= bs!9010 d!37280))

(assert (=> bs!9010 m!172987))

(declare-fun m!173315 () Bool)

(assert (=> bs!9010 m!173315))

(assert (=> bs!9010 m!172999))

(assert (=> b!115568 d!37280))

(declare-fun d!37282 () Bool)

(declare-fun lt!176749 () tuple2!9544)

(assert (=> d!37282 (= lt!176749 (readBit!0 (_1!5030 lt!176361)))))

(assert (=> d!37282 (= (readBitPure!0 (_1!5030 lt!176361)) (tuple2!9527 (_2!5037 lt!176749) (_1!5037 lt!176749)))))

(declare-fun bs!9011 () Bool)

(assert (= bs!9011 d!37282))

(declare-fun m!173317 () Bool)

(assert (=> bs!9011 m!173317))

(assert (=> b!115568 d!37282))

(declare-fun b!115886 () Bool)

(declare-fun e!75930 () (_ BitVec 64))

(assert (=> b!115886 (= e!75930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!115888 () Bool)

(declare-fun lt!177080 () tuple2!9526)

(declare-fun lt!177092 () tuple2!9528)

(assert (=> b!115888 (= lt!177080 (readBitPure!0 (readerFrom!0 (_2!5029 lt!177092) (currentBit!5398 (_2!5029 lt!176359)) (currentByte!5403 (_2!5029 lt!176359)))))))

(declare-fun lt!177082 () Bool)

(declare-fun res!95780 () Bool)

(assert (=> b!115888 (= res!95780 (and (= (_2!5028 lt!177080) lt!177082) (= (_1!5028 lt!177080) (_2!5029 lt!177092))))))

(declare-fun e!75928 () Bool)

(assert (=> b!115888 (=> (not res!95780) (not e!75928))))

(declare-fun e!75929 () Bool)

(assert (=> b!115888 (= e!75929 e!75928)))

(declare-fun b!115889 () Bool)

(declare-fun res!95778 () Bool)

(declare-fun call!1505 () Bool)

(assert (=> b!115889 (= res!95778 call!1505)))

(assert (=> b!115889 (=> (not res!95778) (not e!75929))))

(declare-fun b!115890 () Bool)

(declare-fun e!75927 () tuple2!9528)

(declare-fun lt!177119 () Unit!7111)

(assert (=> b!115890 (= e!75927 (tuple2!9529 lt!177119 (_2!5029 lt!176359)))))

(declare-fun lt!177101 () BitStream!4204)

(assert (=> b!115890 (= lt!177101 (_2!5029 lt!176359))))

(assert (=> b!115890 (= lt!177119 (lemmaIsPrefixRefl!0 lt!177101))))

(assert (=> b!115890 call!1505))

(declare-fun b!115891 () Bool)

(declare-fun res!95777 () Bool)

(declare-fun e!75924 () Bool)

(assert (=> b!115891 (=> (not res!95777) (not e!75924))))

(declare-fun lt!177107 () tuple2!9528)

(declare-fun lt!177118 () (_ BitVec 64))

(declare-fun lt!177076 () (_ BitVec 64))

(assert (=> b!115891 (= res!95777 (= (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!177107))) (currentByte!5403 (_2!5029 lt!177107)) (currentBit!5398 (_2!5029 lt!177107))) (bvadd lt!177118 lt!177076)))))

(assert (=> b!115891 (or (not (= (bvand lt!177118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!177076 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!177118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!177118 lt!177076) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115891 (= lt!177076 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115891 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115891 (= lt!177118 (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176359))) (currentByte!5403 (_2!5029 lt!176359)) (currentBit!5398 (_2!5029 lt!176359))))))

(declare-fun b!115892 () Bool)

(declare-fun res!95776 () Bool)

(assert (=> b!115892 (= res!95776 (= (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!177092))) (currentByte!5403 (_2!5029 lt!177092)) (currentBit!5398 (_2!5029 lt!177092))) (bvadd (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176359))) (currentByte!5403 (_2!5029 lt!176359)) (currentBit!5398 (_2!5029 lt!176359))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!115892 (=> (not res!95776) (not e!75929))))

(declare-fun b!115893 () Bool)

(declare-fun res!95779 () Bool)

(assert (=> b!115893 (=> (not res!95779) (not e!75924))))

(assert (=> b!115893 (= res!95779 (isPrefixOf!0 (_2!5029 lt!176359) (_2!5029 lt!177107)))))

(declare-fun b!115894 () Bool)

(declare-fun lt!177089 () tuple2!9528)

(declare-fun Unit!7127 () Unit!7111)

(assert (=> b!115894 (= e!75927 (tuple2!9529 Unit!7127 (_2!5029 lt!177089)))))

(assert (=> b!115894 (= lt!177082 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115894 (= lt!177092 (appendBit!0 (_2!5029 lt!176359) lt!177082))))

(declare-fun res!95782 () Bool)

(assert (=> b!115894 (= res!95782 (= (size!2365 (buf!2775 (_2!5029 lt!176359))) (size!2365 (buf!2775 (_2!5029 lt!177092)))))))

(assert (=> b!115894 (=> (not res!95782) (not e!75929))))

(assert (=> b!115894 e!75929))

(declare-fun lt!177086 () tuple2!9528)

(assert (=> b!115894 (= lt!177086 lt!177092)))

(assert (=> b!115894 (= lt!177089 (appendNLeastSignificantBitsLoop!0 (_2!5029 lt!177086) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!177100 () Unit!7111)

(assert (=> b!115894 (= lt!177100 (lemmaIsPrefixTransitive!0 (_2!5029 lt!176359) (_2!5029 lt!177086) (_2!5029 lt!177089)))))

(assert (=> b!115894 (isPrefixOf!0 (_2!5029 lt!176359) (_2!5029 lt!177089))))

(declare-fun lt!177097 () Unit!7111)

(assert (=> b!115894 (= lt!177097 lt!177100)))

(assert (=> b!115894 (invariant!0 (currentBit!5398 (_2!5029 lt!176359)) (currentByte!5403 (_2!5029 lt!176359)) (size!2365 (buf!2775 (_2!5029 lt!177086))))))

(declare-fun lt!177098 () BitStream!4204)

(assert (=> b!115894 (= lt!177098 (BitStream!4205 (buf!2775 (_2!5029 lt!177086)) (currentByte!5403 (_2!5029 lt!176359)) (currentBit!5398 (_2!5029 lt!176359))))))

(assert (=> b!115894 (invariant!0 (currentBit!5398 lt!177098) (currentByte!5403 lt!177098) (size!2365 (buf!2775 (_2!5029 lt!177089))))))

(declare-fun lt!177113 () BitStream!4204)

(assert (=> b!115894 (= lt!177113 (BitStream!4205 (buf!2775 (_2!5029 lt!177089)) (currentByte!5403 lt!177098) (currentBit!5398 lt!177098)))))

(declare-fun lt!177083 () tuple2!9526)

(assert (=> b!115894 (= lt!177083 (readBitPure!0 lt!177098))))

(declare-fun lt!177120 () tuple2!9526)

(assert (=> b!115894 (= lt!177120 (readBitPure!0 lt!177113))))

(declare-fun lt!177102 () Unit!7111)

(assert (=> b!115894 (= lt!177102 (readBitPrefixLemma!0 lt!177098 (_2!5029 lt!177089)))))

(declare-fun res!95781 () Bool)

(assert (=> b!115894 (= res!95781 (= (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!177083))) (currentByte!5403 (_1!5028 lt!177083)) (currentBit!5398 (_1!5028 lt!177083))) (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!177120))) (currentByte!5403 (_1!5028 lt!177120)) (currentBit!5398 (_1!5028 lt!177120)))))))

(declare-fun e!75926 () Bool)

(assert (=> b!115894 (=> (not res!95781) (not e!75926))))

(assert (=> b!115894 e!75926))

(declare-fun lt!177104 () Unit!7111)

(assert (=> b!115894 (= lt!177104 lt!177102)))

(declare-fun lt!177085 () tuple2!9530)

(assert (=> b!115894 (= lt!177085 (reader!0 (_2!5029 lt!176359) (_2!5029 lt!177089)))))

(declare-fun lt!177091 () tuple2!9530)

(assert (=> b!115894 (= lt!177091 (reader!0 (_2!5029 lt!177086) (_2!5029 lt!177089)))))

(declare-fun lt!177088 () tuple2!9526)

(assert (=> b!115894 (= lt!177088 (readBitPure!0 (_1!5030 lt!177085)))))

(assert (=> b!115894 (= (_2!5028 lt!177088) lt!177082)))

(declare-fun lt!177081 () Unit!7111)

(declare-fun Unit!7128 () Unit!7111)

(assert (=> b!115894 (= lt!177081 Unit!7128)))

(declare-fun lt!177096 () (_ BitVec 64))

(assert (=> b!115894 (= lt!177096 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!177105 () (_ BitVec 64))

(assert (=> b!115894 (= lt!177105 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!177110 () Unit!7111)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4204 array!5213 (_ BitVec 64)) Unit!7111)

(assert (=> b!115894 (= lt!177110 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5029 lt!176359) (buf!2775 (_2!5029 lt!177089)) lt!177105))))

(assert (=> b!115894 (validate_offset_bits!1 ((_ sign_extend 32) (size!2365 (buf!2775 (_2!5029 lt!177089)))) ((_ sign_extend 32) (currentByte!5403 (_2!5029 lt!176359))) ((_ sign_extend 32) (currentBit!5398 (_2!5029 lt!176359))) lt!177105)))

(declare-fun lt!177106 () Unit!7111)

(assert (=> b!115894 (= lt!177106 lt!177110)))

(declare-datatypes ((tuple2!9552 0))(
  ( (tuple2!9553 (_1!5041 BitStream!4204) (_2!5041 (_ BitVec 64))) )
))
(declare-fun lt!177093 () tuple2!9552)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9552)

(assert (=> b!115894 (= lt!177093 (readNLeastSignificantBitsLoopPure!0 (_1!5030 lt!177085) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!177096))))

(declare-fun lt!177114 () (_ BitVec 64))

(assert (=> b!115894 (= lt!177114 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!177103 () Unit!7111)

(assert (=> b!115894 (= lt!177103 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5029 lt!177086) (buf!2775 (_2!5029 lt!177089)) lt!177114))))

(assert (=> b!115894 (validate_offset_bits!1 ((_ sign_extend 32) (size!2365 (buf!2775 (_2!5029 lt!177089)))) ((_ sign_extend 32) (currentByte!5403 (_2!5029 lt!177086))) ((_ sign_extend 32) (currentBit!5398 (_2!5029 lt!177086))) lt!177114)))

(declare-fun lt!177077 () Unit!7111)

(assert (=> b!115894 (= lt!177077 lt!177103)))

(declare-fun lt!177099 () tuple2!9552)

(assert (=> b!115894 (= lt!177099 (readNLeastSignificantBitsLoopPure!0 (_1!5030 lt!177091) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!177096 (ite (_2!5028 lt!177088) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!177111 () tuple2!9552)

(assert (=> b!115894 (= lt!177111 (readNLeastSignificantBitsLoopPure!0 (_1!5030 lt!177085) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!177096))))

(declare-fun c!7022 () Bool)

(assert (=> b!115894 (= c!7022 (_2!5028 (readBitPure!0 (_1!5030 lt!177085))))))

(declare-fun lt!177094 () tuple2!9552)

(assert (=> b!115894 (= lt!177094 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5030 lt!177085) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!177096 e!75930)))))

(declare-fun lt!177087 () Unit!7111)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7111)

(assert (=> b!115894 (= lt!177087 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5030 lt!177085) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!177096))))

(assert (=> b!115894 (and (= (_2!5041 lt!177111) (_2!5041 lt!177094)) (= (_1!5041 lt!177111) (_1!5041 lt!177094)))))

(declare-fun lt!177117 () Unit!7111)

(assert (=> b!115894 (= lt!177117 lt!177087)))

(assert (=> b!115894 (= (_1!5030 lt!177085) (withMovedBitIndex!0 (_2!5030 lt!177085) (bvsub (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176359))) (currentByte!5403 (_2!5029 lt!176359)) (currentBit!5398 (_2!5029 lt!176359))) (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!177089))) (currentByte!5403 (_2!5029 lt!177089)) (currentBit!5398 (_2!5029 lt!177089))))))))

(declare-fun lt!177108 () Unit!7111)

(declare-fun Unit!7129 () Unit!7111)

(assert (=> b!115894 (= lt!177108 Unit!7129)))

(assert (=> b!115894 (= (_1!5030 lt!177091) (withMovedBitIndex!0 (_2!5030 lt!177091) (bvsub (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!177086))) (currentByte!5403 (_2!5029 lt!177086)) (currentBit!5398 (_2!5029 lt!177086))) (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!177089))) (currentByte!5403 (_2!5029 lt!177089)) (currentBit!5398 (_2!5029 lt!177089))))))))

(declare-fun lt!177078 () Unit!7111)

(declare-fun Unit!7130 () Unit!7111)

(assert (=> b!115894 (= lt!177078 Unit!7130)))

(assert (=> b!115894 (= (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176359))) (currentByte!5403 (_2!5029 lt!176359)) (currentBit!5398 (_2!5029 lt!176359))) (bvsub (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!177086))) (currentByte!5403 (_2!5029 lt!177086)) (currentBit!5398 (_2!5029 lt!177086))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!177116 () Unit!7111)

(declare-fun Unit!7131 () Unit!7111)

(assert (=> b!115894 (= lt!177116 Unit!7131)))

(assert (=> b!115894 (= (_2!5041 lt!177093) (_2!5041 lt!177099))))

(declare-fun lt!177090 () Unit!7111)

(declare-fun Unit!7132 () Unit!7111)

(assert (=> b!115894 (= lt!177090 Unit!7132)))

(assert (=> b!115894 (= (_1!5041 lt!177093) (_2!5030 lt!177085))))

(declare-fun b!115895 () Bool)

(declare-fun e!75925 () Bool)

(declare-fun lt!177084 () (_ BitVec 64))

(assert (=> b!115895 (= e!75925 (validate_offset_bits!1 ((_ sign_extend 32) (size!2365 (buf!2775 (_2!5029 lt!176359)))) ((_ sign_extend 32) (currentByte!5403 (_2!5029 lt!176359))) ((_ sign_extend 32) (currentBit!5398 (_2!5029 lt!176359))) lt!177084))))

(declare-fun b!115896 () Bool)

(assert (=> b!115896 (= e!75930 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!115897 () Bool)

(assert (=> b!115897 (= e!75926 (= (_2!5028 lt!177083) (_2!5028 lt!177120)))))

(declare-fun d!37284 () Bool)

(assert (=> d!37284 e!75924))

(declare-fun res!95783 () Bool)

(assert (=> d!37284 (=> (not res!95783) (not e!75924))))

(assert (=> d!37284 (= res!95783 (= (size!2365 (buf!2775 (_2!5029 lt!176359))) (size!2365 (buf!2775 (_2!5029 lt!177107)))))))

(assert (=> d!37284 (= lt!177107 e!75927)))

(declare-fun c!7023 () Bool)

(assert (=> d!37284 (= c!7023 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37284 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37284 (= (appendNLeastSignificantBitsLoop!0 (_2!5029 lt!176359) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!177107)))

(declare-fun lt!177115 () tuple2!9530)

(declare-fun lt!177112 () tuple2!9552)

(declare-fun b!115887 () Bool)

(assert (=> b!115887 (= e!75924 (and (= (_2!5041 lt!177112) v!199) (= (_1!5041 lt!177112) (_2!5030 lt!177115))))))

(declare-fun lt!177109 () (_ BitVec 64))

(assert (=> b!115887 (= lt!177112 (readNLeastSignificantBitsLoopPure!0 (_1!5030 lt!177115) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!177109))))

(declare-fun lt!177095 () Unit!7111)

(declare-fun lt!177079 () Unit!7111)

(assert (=> b!115887 (= lt!177095 lt!177079)))

(assert (=> b!115887 (validate_offset_bits!1 ((_ sign_extend 32) (size!2365 (buf!2775 (_2!5029 lt!177107)))) ((_ sign_extend 32) (currentByte!5403 (_2!5029 lt!176359))) ((_ sign_extend 32) (currentBit!5398 (_2!5029 lt!176359))) lt!177084)))

(assert (=> b!115887 (= lt!177079 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5029 lt!176359) (buf!2775 (_2!5029 lt!177107)) lt!177084))))

(assert (=> b!115887 e!75925))

(declare-fun res!95784 () Bool)

(assert (=> b!115887 (=> (not res!95784) (not e!75925))))

(assert (=> b!115887 (= res!95784 (and (= (size!2365 (buf!2775 (_2!5029 lt!176359))) (size!2365 (buf!2775 (_2!5029 lt!177107)))) (bvsge lt!177084 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115887 (= lt!177084 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115887 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115887 (= lt!177109 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!115887 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115887 (= lt!177115 (reader!0 (_2!5029 lt!176359) (_2!5029 lt!177107)))))

(declare-fun bm!1502 () Bool)

(assert (=> bm!1502 (= call!1505 (isPrefixOf!0 (ite c!7023 (_2!5029 lt!176359) lt!177101) (ite c!7023 (_2!5029 lt!177092) lt!177101)))))

(declare-fun b!115898 () Bool)

(assert (=> b!115898 (= e!75928 (= (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!177080))) (currentByte!5403 (_1!5028 lt!177080)) (currentBit!5398 (_1!5028 lt!177080))) (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!177092))) (currentByte!5403 (_2!5029 lt!177092)) (currentBit!5398 (_2!5029 lt!177092)))))))

(assert (= (and d!37284 c!7023) b!115894))

(assert (= (and d!37284 (not c!7023)) b!115890))

(assert (= (and b!115894 res!95782) b!115892))

(assert (= (and b!115892 res!95776) b!115889))

(assert (= (and b!115889 res!95778) b!115888))

(assert (= (and b!115888 res!95780) b!115898))

(assert (= (and b!115894 res!95781) b!115897))

(assert (= (and b!115894 c!7022) b!115896))

(assert (= (and b!115894 (not c!7022)) b!115886))

(assert (= (or b!115889 b!115890) bm!1502))

(assert (= (and d!37284 res!95783) b!115891))

(assert (= (and b!115891 res!95777) b!115893))

(assert (= (and b!115893 res!95779) b!115887))

(assert (= (and b!115887 res!95784) b!115895))

(declare-fun m!173477 () Bool)

(assert (=> b!115893 m!173477))

(declare-fun m!173479 () Bool)

(assert (=> b!115888 m!173479))

(assert (=> b!115888 m!173479))

(declare-fun m!173481 () Bool)

(assert (=> b!115888 m!173481))

(declare-fun m!173483 () Bool)

(assert (=> b!115892 m!173483))

(assert (=> b!115892 m!172993))

(declare-fun m!173485 () Bool)

(assert (=> b!115890 m!173485))

(declare-fun m!173487 () Bool)

(assert (=> b!115887 m!173487))

(declare-fun m!173489 () Bool)

(assert (=> b!115887 m!173489))

(declare-fun m!173491 () Bool)

(assert (=> b!115887 m!173491))

(declare-fun m!173493 () Bool)

(assert (=> b!115887 m!173493))

(declare-fun m!173495 () Bool)

(assert (=> b!115887 m!173495))

(declare-fun m!173497 () Bool)

(assert (=> b!115898 m!173497))

(assert (=> b!115898 m!173483))

(declare-fun m!173499 () Bool)

(assert (=> b!115891 m!173499))

(assert (=> b!115891 m!172993))

(declare-fun m!173501 () Bool)

(assert (=> b!115895 m!173501))

(declare-fun m!173503 () Bool)

(assert (=> bm!1502 m!173503))

(declare-fun m!173505 () Bool)

(assert (=> b!115894 m!173505))

(declare-fun m!173507 () Bool)

(assert (=> b!115894 m!173507))

(declare-fun m!173509 () Bool)

(assert (=> b!115894 m!173509))

(declare-fun m!173511 () Bool)

(assert (=> b!115894 m!173511))

(declare-fun m!173513 () Bool)

(assert (=> b!115894 m!173513))

(declare-fun m!173515 () Bool)

(assert (=> b!115894 m!173515))

(declare-fun m!173517 () Bool)

(assert (=> b!115894 m!173517))

(declare-fun m!173519 () Bool)

(assert (=> b!115894 m!173519))

(declare-fun m!173521 () Bool)

(assert (=> b!115894 m!173521))

(declare-fun m!173523 () Bool)

(assert (=> b!115894 m!173523))

(declare-fun m!173525 () Bool)

(assert (=> b!115894 m!173525))

(declare-fun m!173527 () Bool)

(assert (=> b!115894 m!173527))

(declare-fun m!173529 () Bool)

(assert (=> b!115894 m!173529))

(declare-fun m!173531 () Bool)

(assert (=> b!115894 m!173531))

(declare-fun m!173533 () Bool)

(assert (=> b!115894 m!173533))

(declare-fun m!173535 () Bool)

(assert (=> b!115894 m!173535))

(declare-fun m!173537 () Bool)

(assert (=> b!115894 m!173537))

(declare-fun m!173539 () Bool)

(assert (=> b!115894 m!173539))

(declare-fun m!173541 () Bool)

(assert (=> b!115894 m!173541))

(declare-fun m!173543 () Bool)

(assert (=> b!115894 m!173543))

(declare-fun m!173545 () Bool)

(assert (=> b!115894 m!173545))

(declare-fun m!173547 () Bool)

(assert (=> b!115894 m!173547))

(assert (=> b!115894 m!173535))

(declare-fun m!173549 () Bool)

(assert (=> b!115894 m!173549))

(assert (=> b!115894 m!173493))

(assert (=> b!115894 m!172993))

(declare-fun m!173551 () Bool)

(assert (=> b!115894 m!173551))

(declare-fun m!173553 () Bool)

(assert (=> b!115894 m!173553))

(declare-fun m!173555 () Bool)

(assert (=> b!115894 m!173555))

(declare-fun m!173557 () Bool)

(assert (=> b!115894 m!173557))

(assert (=> b!115568 d!37284))

(declare-fun d!37314 () Bool)

(declare-fun e!75931 () Bool)

(assert (=> d!37314 e!75931))

(declare-fun res!95786 () Bool)

(assert (=> d!37314 (=> (not res!95786) (not e!75931))))

(declare-fun lt!177123 () (_ BitVec 64))

(declare-fun lt!177122 () (_ BitVec 64))

(declare-fun lt!177126 () (_ BitVec 64))

(assert (=> d!37314 (= res!95786 (= lt!177122 (bvsub lt!177126 lt!177123)))))

(assert (=> d!37314 (or (= (bvand lt!177126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!177123 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!177126 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!177126 lt!177123) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37314 (= lt!177123 (remainingBits!0 ((_ sign_extend 32) (size!2365 (buf!2775 (_1!5028 lt!176360)))) ((_ sign_extend 32) (currentByte!5403 (_1!5028 lt!176360))) ((_ sign_extend 32) (currentBit!5398 (_1!5028 lt!176360)))))))

(declare-fun lt!177125 () (_ BitVec 64))

(declare-fun lt!177121 () (_ BitVec 64))

(assert (=> d!37314 (= lt!177126 (bvmul lt!177125 lt!177121))))

(assert (=> d!37314 (or (= lt!177125 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!177121 (bvsdiv (bvmul lt!177125 lt!177121) lt!177125)))))

(assert (=> d!37314 (= lt!177121 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37314 (= lt!177125 ((_ sign_extend 32) (size!2365 (buf!2775 (_1!5028 lt!176360)))))))

(assert (=> d!37314 (= lt!177122 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5403 (_1!5028 lt!176360))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5398 (_1!5028 lt!176360)))))))

(assert (=> d!37314 (invariant!0 (currentBit!5398 (_1!5028 lt!176360)) (currentByte!5403 (_1!5028 lt!176360)) (size!2365 (buf!2775 (_1!5028 lt!176360))))))

(assert (=> d!37314 (= (bitIndex!0 (size!2365 (buf!2775 (_1!5028 lt!176360))) (currentByte!5403 (_1!5028 lt!176360)) (currentBit!5398 (_1!5028 lt!176360))) lt!177122)))

(declare-fun b!115899 () Bool)

(declare-fun res!95785 () Bool)

(assert (=> b!115899 (=> (not res!95785) (not e!75931))))

(assert (=> b!115899 (= res!95785 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!177122))))

(declare-fun b!115900 () Bool)

(declare-fun lt!177124 () (_ BitVec 64))

(assert (=> b!115900 (= e!75931 (bvsle lt!177122 (bvmul lt!177124 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115900 (or (= lt!177124 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!177124 #b0000000000000000000000000000000000000000000000000000000000001000) lt!177124)))))

(assert (=> b!115900 (= lt!177124 ((_ sign_extend 32) (size!2365 (buf!2775 (_1!5028 lt!176360)))))))

(assert (= (and d!37314 res!95786) b!115899))

(assert (= (and b!115899 res!95785) b!115900))

(declare-fun m!173559 () Bool)

(assert (=> d!37314 m!173559))

(declare-fun m!173561 () Bool)

(assert (=> d!37314 m!173561))

(assert (=> b!115568 d!37314))

(declare-fun d!37316 () Bool)

(assert (=> d!37316 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5398 thiss!1305) (currentByte!5403 thiss!1305) (size!2365 (buf!2775 thiss!1305))))))

(declare-fun bs!9019 () Bool)

(assert (= bs!9019 d!37316))

(assert (=> bs!9019 m!173141))

(assert (=> start!22868 d!37316))

(declare-fun d!37318 () Bool)

(declare-fun res!95787 () Bool)

(declare-fun e!75933 () Bool)

(assert (=> d!37318 (=> (not res!95787) (not e!75933))))

(assert (=> d!37318 (= res!95787 (= (size!2365 (buf!2775 thiss!1305)) (size!2365 (buf!2775 (_2!5029 lt!176359)))))))

(assert (=> d!37318 (= (isPrefixOf!0 thiss!1305 (_2!5029 lt!176359)) e!75933)))

(declare-fun b!115901 () Bool)

(declare-fun res!95789 () Bool)

(assert (=> b!115901 (=> (not res!95789) (not e!75933))))

(assert (=> b!115901 (= res!95789 (bvsle (bitIndex!0 (size!2365 (buf!2775 thiss!1305)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305)) (bitIndex!0 (size!2365 (buf!2775 (_2!5029 lt!176359))) (currentByte!5403 (_2!5029 lt!176359)) (currentBit!5398 (_2!5029 lt!176359)))))))

(declare-fun b!115902 () Bool)

(declare-fun e!75932 () Bool)

(assert (=> b!115902 (= e!75933 e!75932)))

(declare-fun res!95788 () Bool)

(assert (=> b!115902 (=> res!95788 e!75932)))

(assert (=> b!115902 (= res!95788 (= (size!2365 (buf!2775 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!115903 () Bool)

(assert (=> b!115903 (= e!75932 (arrayBitRangesEq!0 (buf!2775 thiss!1305) (buf!2775 (_2!5029 lt!176359)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2365 (buf!2775 thiss!1305)) (currentByte!5403 thiss!1305) (currentBit!5398 thiss!1305))))))

(assert (= (and d!37318 res!95787) b!115901))

(assert (= (and b!115901 res!95789) b!115902))

(assert (= (and b!115902 (not res!95788)) b!115903))

(assert (=> b!115901 m!172995))

(assert (=> b!115901 m!172993))

(assert (=> b!115903 m!172995))

(assert (=> b!115903 m!172995))

(declare-fun m!173563 () Bool)

(assert (=> b!115903 m!173563))

(assert (=> b!115566 d!37318))

(push 1)

(assert (not b!115723))

(assert (not b!115792))

(assert (not d!37276))

(assert (not b!115703))

(assert (not d!37282))

(assert (not d!37230))

(assert (not d!37220))

(assert (not b!115786))

(assert (not b!115888))

(assert (not b!115724))

(assert (not bm!1502))

(assert (not b!115784))

(assert (not b!115770))

(assert (not b!115892))

(assert (not b!115895))

(assert (not b!115893))

(assert (not b!115721))

(assert (not b!115793))

(assert (not d!37224))

(assert (not d!37218))

(assert (not b!115891))

(assert (not d!37212))

(assert (not b!115768))

(assert (not d!37314))

(assert (not b!115901))

(assert (not b!115894))

(assert (not d!37214))

(assert (not b!115890))

(assert (not b!115789))

(assert (not d!37226))

(assert (not d!37248))

(assert (not d!37274))

(assert (not b!115903))

(assert (not b!115898))

(assert (not d!37236))

(assert (not d!37262))

(assert (not b!115767))

(assert (not d!37316))

(assert (not d!37280))

(assert (not b!115887))

(assert (not d!37278))

(assert (not b!115790))

(assert (not b!115771))

(assert (not b!115722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

