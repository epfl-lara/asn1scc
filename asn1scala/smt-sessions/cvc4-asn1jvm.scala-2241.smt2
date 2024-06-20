; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56990 () Bool)

(assert start!56990)

(declare-fun b!261579 () Bool)

(declare-fun e!182041 () Bool)

(declare-fun e!182038 () Bool)

(assert (=> b!261579 (= e!182041 (not e!182038))))

(declare-fun res!218950 () Bool)

(assert (=> b!261579 (=> (not res!218950) (not e!182038))))

(declare-datatypes ((array!14506 0))(
  ( (array!14507 (arr!7317 (Array (_ BitVec 32) (_ BitVec 8))) (size!6330 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11582 0))(
  ( (BitStream!11583 (buf!6852 array!14506) (currentByte!12674 (_ BitVec 32)) (currentBit!12669 (_ BitVec 32))) )
))
(declare-fun thiss!914 () BitStream!11582)

(declare-datatypes ((Unit!18659 0))(
  ( (Unit!18660) )
))
(declare-datatypes ((tuple2!22390 0))(
  ( (tuple2!22391 (_1!12131 Unit!18659) (_2!12131 BitStream!11582)) )
))
(declare-fun lt!403546 () tuple2!22390)

(assert (=> b!261579 (= res!218950 (= (size!6330 (buf!6852 thiss!914)) (size!6330 (buf!6852 (_2!12131 lt!403546)))))))

(declare-fun lt!403550 () tuple2!22390)

(declare-fun increaseBitIndex!0 (BitStream!11582) tuple2!22390)

(assert (=> b!261579 (= lt!403546 (increaseBitIndex!0 (_2!12131 lt!403550)))))

(declare-fun arrayRangesEq!955 (array!14506 array!14506 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261579 (arrayRangesEq!955 (buf!6852 thiss!914) (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914))) #b00000000000000000000000000000000 (currentByte!12674 (_2!12131 lt!403550)))))

(declare-fun lt!403547 () Unit!18659)

(declare-fun arrayUpdatedAtPrefixLemma!471 (array!14506 (_ BitVec 32) (_ BitVec 8)) Unit!18659)

(assert (=> b!261579 (= lt!403547 (arrayUpdatedAtPrefixLemma!471 (buf!6852 thiss!914) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))))))

(declare-fun b!187 () Bool)

(declare-fun Unit!18661 () Unit!18659)

(declare-fun Unit!18662 () Unit!18659)

(assert (=> b!261579 (= lt!403550 (ite b!187 (tuple2!22391 Unit!18661 (BitStream!11583 (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) ((_ extract 7 0) (bvor ((_ sign_extend 24) (select (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 thiss!914))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12669 thiss!914)))))) (size!6330 (buf!6852 thiss!914))) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914))) (tuple2!22391 Unit!18662 (BitStream!11583 (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 thiss!914))) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12669 thiss!914))))))) (size!6330 (buf!6852 thiss!914))) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914)))))))

(declare-fun b!261580 () Bool)

(declare-fun e!182039 () Bool)

(declare-fun array_inv!6071 (array!14506) Bool)

(assert (=> b!261580 (= e!182039 (array_inv!6071 (buf!6852 thiss!914)))))

(declare-fun res!218947 () Bool)

(assert (=> start!56990 (=> (not res!218947) (not e!182041))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!56990 (= res!218947 (validate_offset_bit!0 ((_ sign_extend 32) (size!6330 (buf!6852 thiss!914))) ((_ sign_extend 32) (currentByte!12674 thiss!914)) ((_ sign_extend 32) (currentBit!12669 thiss!914))))))

(assert (=> start!56990 e!182041))

(declare-fun inv!12 (BitStream!11582) Bool)

(assert (=> start!56990 (and (inv!12 thiss!914) e!182039)))

(assert (=> start!56990 true))

(declare-fun b!261581 () Bool)

(declare-fun e!182040 () Bool)

(declare-fun e!182036 () Bool)

(assert (=> b!261581 (= e!182040 e!182036)))

(declare-fun res!218948 () Bool)

(assert (=> b!261581 (=> (not res!218948) (not e!182036))))

(declare-datatypes ((tuple2!22392 0))(
  ( (tuple2!22393 (_1!12132 BitStream!11582) (_2!12132 Bool)) )
))
(declare-fun lt!403549 () tuple2!22392)

(assert (=> b!261581 (= res!218948 (and (= (_2!12132 lt!403549) b!187) (= (_1!12132 lt!403549) (_2!12131 lt!403546))))))

(declare-fun readBitPure!0 (BitStream!11582) tuple2!22392)

(declare-fun readerFrom!0 (BitStream!11582 (_ BitVec 32) (_ BitVec 32)) BitStream!11582)

(assert (=> b!261581 (= lt!403549 (readBitPure!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))

(declare-fun b!261582 () Bool)

(declare-fun lt!403545 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!261582 (= e!182036 (= (bitIndex!0 (size!6330 (buf!6852 (_1!12132 lt!403549))) (currentByte!12674 (_1!12132 lt!403549)) (currentBit!12669 (_1!12132 lt!403549))) lt!403545))))

(declare-fun b!261583 () Bool)

(declare-fun res!218949 () Bool)

(assert (=> b!261583 (=> (not res!218949) (not e!182040))))

(declare-fun isPrefixOf!0 (BitStream!11582 BitStream!11582) Bool)

(assert (=> b!261583 (= res!218949 (isPrefixOf!0 thiss!914 (_2!12131 lt!403546)))))

(declare-fun b!261584 () Bool)

(assert (=> b!261584 (= e!182038 e!182040)))

(declare-fun res!218951 () Bool)

(assert (=> b!261584 (=> (not res!218951) (not e!182040))))

(declare-fun lt!403548 () (_ BitVec 64))

(assert (=> b!261584 (= res!218951 (= lt!403545 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!403548)))))

(assert (=> b!261584 (= lt!403545 (bitIndex!0 (size!6330 (buf!6852 (_2!12131 lt!403546))) (currentByte!12674 (_2!12131 lt!403546)) (currentBit!12669 (_2!12131 lt!403546))))))

(assert (=> b!261584 (= lt!403548 (bitIndex!0 (size!6330 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914)))))

(assert (= (and start!56990 res!218947) b!261579))

(assert (= (and b!261579 res!218950) b!261584))

(assert (= (and b!261584 res!218951) b!261583))

(assert (= (and b!261583 res!218949) b!261581))

(assert (= (and b!261581 res!218948) b!261582))

(assert (= start!56990 b!261580))

(declare-fun m!391507 () Bool)

(assert (=> start!56990 m!391507))

(declare-fun m!391509 () Bool)

(assert (=> start!56990 m!391509))

(declare-fun m!391511 () Bool)

(assert (=> b!261579 m!391511))

(declare-fun m!391513 () Bool)

(assert (=> b!261579 m!391513))

(declare-fun m!391515 () Bool)

(assert (=> b!261579 m!391515))

(declare-fun m!391517 () Bool)

(assert (=> b!261579 m!391517))

(assert (=> b!261579 m!391511))

(declare-fun m!391519 () Bool)

(assert (=> b!261579 m!391519))

(declare-fun m!391521 () Bool)

(assert (=> b!261579 m!391521))

(declare-fun m!391523 () Bool)

(assert (=> b!261579 m!391523))

(declare-fun m!391525 () Bool)

(assert (=> b!261579 m!391525))

(declare-fun m!391527 () Bool)

(assert (=> b!261579 m!391527))

(declare-fun m!391529 () Bool)

(assert (=> b!261581 m!391529))

(assert (=> b!261581 m!391529))

(declare-fun m!391531 () Bool)

(assert (=> b!261581 m!391531))

(declare-fun m!391533 () Bool)

(assert (=> b!261580 m!391533))

(declare-fun m!391535 () Bool)

(assert (=> b!261583 m!391535))

(declare-fun m!391537 () Bool)

(assert (=> b!261582 m!391537))

(declare-fun m!391539 () Bool)

(assert (=> b!261584 m!391539))

(declare-fun m!391541 () Bool)

(assert (=> b!261584 m!391541))

(push 1)

(assert (not b!261582))

(assert (not b!261579))

(assert (not b!261580))

(assert (not b!261581))

(assert (not b!261583))

(assert (not b!261584))

(assert (not start!56990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88204 () Bool)

(assert (=> d!88204 (= (array_inv!6071 (buf!6852 thiss!914)) (bvsge (size!6330 (buf!6852 thiss!914)) #b00000000000000000000000000000000))))

(assert (=> b!261580 d!88204))

(declare-fun d!88206 () Bool)

(declare-datatypes ((tuple2!22396 0))(
  ( (tuple2!22397 (_1!12134 Bool) (_2!12134 BitStream!11582)) )
))
(declare-fun lt!403616 () tuple2!22396)

(declare-fun readBit!0 (BitStream!11582) tuple2!22396)

(assert (=> d!88206 (= lt!403616 (readBit!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))

(assert (=> d!88206 (= (readBitPure!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) (tuple2!22393 (_2!12134 lt!403616) (_1!12134 lt!403616)))))

(declare-fun bs!22355 () Bool)

(assert (= bs!22355 d!88206))

(assert (=> bs!22355 m!391529))

(declare-fun m!391571 () Bool)

(assert (=> bs!22355 m!391571))

(assert (=> b!261581 d!88206))

(declare-fun d!88208 () Bool)

(declare-fun e!182063 () Bool)

(assert (=> d!88208 e!182063))

(declare-fun res!218988 () Bool)

(assert (=> d!88208 (=> (not res!218988) (not e!182063))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88208 (= res!218988 (invariant!0 (currentBit!12669 (_2!12131 lt!403546)) (currentByte!12674 (_2!12131 lt!403546)) (size!6330 (buf!6852 (_2!12131 lt!403546)))))))

(assert (=> d!88208 (= (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)) (BitStream!11583 (buf!6852 (_2!12131 lt!403546)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914)))))

(declare-fun b!261619 () Bool)

(assert (=> b!261619 (= e!182063 (invariant!0 (currentBit!12669 thiss!914) (currentByte!12674 thiss!914) (size!6330 (buf!6852 (_2!12131 lt!403546)))))))

(assert (= (and d!88208 res!218988) b!261619))

(declare-fun m!391575 () Bool)

(assert (=> d!88208 m!391575))

(declare-fun m!391577 () Bool)

(assert (=> b!261619 m!391577))

(assert (=> b!261581 d!88208))

(declare-fun d!88212 () Bool)

(declare-fun e!182080 () Bool)

(assert (=> d!88212 e!182080))

(declare-fun res!219011 () Bool)

(assert (=> d!88212 (=> (not res!219011) (not e!182080))))

(declare-fun lt!403650 () (_ BitVec 64))

(declare-fun lt!403652 () (_ BitVec 64))

(declare-fun lt!403653 () (_ BitVec 64))

(assert (=> d!88212 (= res!219011 (= lt!403652 (bvsub lt!403653 lt!403650)))))

(assert (=> d!88212 (or (= (bvand lt!403653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403650 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403653 lt!403650) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88212 (= lt!403650 (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_1!12132 lt!403549)))) ((_ sign_extend 32) (currentByte!12674 (_1!12132 lt!403549))) ((_ sign_extend 32) (currentBit!12669 (_1!12132 lt!403549)))))))

(declare-fun lt!403651 () (_ BitVec 64))

(declare-fun lt!403656 () (_ BitVec 64))

(assert (=> d!88212 (= lt!403653 (bvmul lt!403651 lt!403656))))

(assert (=> d!88212 (or (= lt!403651 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403656 (bvsdiv (bvmul lt!403651 lt!403656) lt!403651)))))

(assert (=> d!88212 (= lt!403656 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88212 (= lt!403651 ((_ sign_extend 32) (size!6330 (buf!6852 (_1!12132 lt!403549)))))))

(assert (=> d!88212 (= lt!403652 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 (_1!12132 lt!403549))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 (_1!12132 lt!403549)))))))

(assert (=> d!88212 (invariant!0 (currentBit!12669 (_1!12132 lt!403549)) (currentByte!12674 (_1!12132 lt!403549)) (size!6330 (buf!6852 (_1!12132 lt!403549))))))

(assert (=> d!88212 (= (bitIndex!0 (size!6330 (buf!6852 (_1!12132 lt!403549))) (currentByte!12674 (_1!12132 lt!403549)) (currentBit!12669 (_1!12132 lt!403549))) lt!403652)))

(declare-fun b!261639 () Bool)

(declare-fun res!219010 () Bool)

(assert (=> b!261639 (=> (not res!219010) (not e!182080))))

(assert (=> b!261639 (= res!219010 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403652))))

(declare-fun b!261640 () Bool)

(declare-fun lt!403649 () (_ BitVec 64))

(assert (=> b!261640 (= e!182080 (bvsle lt!403652 (bvmul lt!403649 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261640 (or (= lt!403649 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403649 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403649)))))

(assert (=> b!261640 (= lt!403649 ((_ sign_extend 32) (size!6330 (buf!6852 (_1!12132 lt!403549)))))))

(assert (= (and d!88212 res!219011) b!261639))

(assert (= (and b!261639 res!219010) b!261640))

(declare-fun m!391595 () Bool)

(assert (=> d!88212 m!391595))

(declare-fun m!391597 () Bool)

(assert (=> d!88212 m!391597))

(assert (=> b!261582 d!88212))

(declare-fun d!88220 () Bool)

(assert (=> d!88220 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6330 (buf!6852 thiss!914))) ((_ sign_extend 32) (currentByte!12674 thiss!914)) ((_ sign_extend 32) (currentBit!12669 thiss!914))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 thiss!914))) ((_ sign_extend 32) (currentByte!12674 thiss!914)) ((_ sign_extend 32) (currentBit!12669 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22356 () Bool)

(assert (= bs!22356 d!88220))

(declare-fun m!391599 () Bool)

(assert (=> bs!22356 m!391599))

(assert (=> start!56990 d!88220))

(declare-fun d!88222 () Bool)

(assert (=> d!88222 (= (inv!12 thiss!914) (invariant!0 (currentBit!12669 thiss!914) (currentByte!12674 thiss!914) (size!6330 (buf!6852 thiss!914))))))

(declare-fun bs!22357 () Bool)

(assert (= bs!22357 d!88222))

(declare-fun m!391601 () Bool)

(assert (=> bs!22357 m!391601))

(assert (=> start!56990 d!88222))

(declare-fun d!88224 () Bool)

(declare-fun res!219038 () Bool)

(declare-fun e!182099 () Bool)

(assert (=> d!88224 (=> (not res!219038) (not e!182099))))

(assert (=> d!88224 (= res!219038 (= (size!6330 (buf!6852 thiss!914)) (size!6330 (buf!6852 (_2!12131 lt!403546)))))))

(assert (=> d!88224 (= (isPrefixOf!0 thiss!914 (_2!12131 lt!403546)) e!182099)))

(declare-fun b!261668 () Bool)

(declare-fun res!219039 () Bool)

(assert (=> b!261668 (=> (not res!219039) (not e!182099))))

(assert (=> b!261668 (= res!219039 (bvsle (bitIndex!0 (size!6330 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914)) (bitIndex!0 (size!6330 (buf!6852 (_2!12131 lt!403546))) (currentByte!12674 (_2!12131 lt!403546)) (currentBit!12669 (_2!12131 lt!403546)))))))

(declare-fun b!261669 () Bool)

(declare-fun e!182098 () Bool)

(assert (=> b!261669 (= e!182099 e!182098)))

(declare-fun res!219037 () Bool)

(assert (=> b!261669 (=> res!219037 e!182098)))

(assert (=> b!261669 (= res!219037 (= (size!6330 (buf!6852 thiss!914)) #b00000000000000000000000000000000))))

(declare-fun b!261670 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14506 array!14506 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!261670 (= e!182098 (arrayBitRangesEq!0 (buf!6852 thiss!914) (buf!6852 (_2!12131 lt!403546)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6330 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914))))))

(assert (= (and d!88224 res!219038) b!261668))

(assert (= (and b!261668 res!219039) b!261669))

(assert (= (and b!261669 (not res!219037)) b!261670))

(assert (=> b!261668 m!391541))

(assert (=> b!261668 m!391539))

(assert (=> b!261670 m!391541))

(assert (=> b!261670 m!391541))

(declare-fun m!391619 () Bool)

(assert (=> b!261670 m!391619))

(assert (=> b!261583 d!88224))

(declare-fun d!88232 () Bool)

(declare-fun e!182100 () Bool)

(assert (=> d!88232 e!182100))

(declare-fun res!219041 () Bool)

(assert (=> d!88232 (=> (not res!219041) (not e!182100))))

(declare-fun lt!403669 () (_ BitVec 64))

(declare-fun lt!403671 () (_ BitVec 64))

(declare-fun lt!403672 () (_ BitVec 64))

(assert (=> d!88232 (= res!219041 (= lt!403671 (bvsub lt!403672 lt!403669)))))

(assert (=> d!88232 (or (= (bvand lt!403672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403669 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403672 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403672 lt!403669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88232 (= lt!403669 (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403546)))) ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403546))) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403546)))))))

(declare-fun lt!403670 () (_ BitVec 64))

(declare-fun lt!403673 () (_ BitVec 64))

(assert (=> d!88232 (= lt!403672 (bvmul lt!403670 lt!403673))))

(assert (=> d!88232 (or (= lt!403670 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403673 (bvsdiv (bvmul lt!403670 lt!403673) lt!403670)))))

(assert (=> d!88232 (= lt!403673 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88232 (= lt!403670 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403546)))))))

(assert (=> d!88232 (= lt!403671 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403546))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403546)))))))

(assert (=> d!88232 (invariant!0 (currentBit!12669 (_2!12131 lt!403546)) (currentByte!12674 (_2!12131 lt!403546)) (size!6330 (buf!6852 (_2!12131 lt!403546))))))

(assert (=> d!88232 (= (bitIndex!0 (size!6330 (buf!6852 (_2!12131 lt!403546))) (currentByte!12674 (_2!12131 lt!403546)) (currentBit!12669 (_2!12131 lt!403546))) lt!403671)))

(declare-fun b!261671 () Bool)

(declare-fun res!219040 () Bool)

(assert (=> b!261671 (=> (not res!219040) (not e!182100))))

(assert (=> b!261671 (= res!219040 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403671))))

(declare-fun b!261672 () Bool)

(declare-fun lt!403668 () (_ BitVec 64))

(assert (=> b!261672 (= e!182100 (bvsle lt!403671 (bvmul lt!403668 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261672 (or (= lt!403668 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403668 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403668)))))

(assert (=> b!261672 (= lt!403668 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403546)))))))

(assert (= (and d!88232 res!219041) b!261671))

(assert (= (and b!261671 res!219040) b!261672))

(declare-fun m!391621 () Bool)

(assert (=> d!88232 m!391621))

(assert (=> d!88232 m!391575))

(assert (=> b!261584 d!88232))

(declare-fun d!88234 () Bool)

(declare-fun e!182101 () Bool)

(assert (=> d!88234 e!182101))

(declare-fun res!219043 () Bool)

(assert (=> d!88234 (=> (not res!219043) (not e!182101))))

(declare-fun lt!403680 () (_ BitVec 64))

(declare-fun lt!403678 () (_ BitVec 64))

(declare-fun lt!403681 () (_ BitVec 64))

(assert (=> d!88234 (= res!219043 (= lt!403680 (bvsub lt!403681 lt!403678)))))

(assert (=> d!88234 (or (= (bvand lt!403681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403678 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403681 lt!403678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88234 (= lt!403678 (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 thiss!914))) ((_ sign_extend 32) (currentByte!12674 thiss!914)) ((_ sign_extend 32) (currentBit!12669 thiss!914))))))

(declare-fun lt!403679 () (_ BitVec 64))

(declare-fun lt!403682 () (_ BitVec 64))

(assert (=> d!88234 (= lt!403681 (bvmul lt!403679 lt!403682))))

(assert (=> d!88234 (or (= lt!403679 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403682 (bvsdiv (bvmul lt!403679 lt!403682) lt!403679)))))

(assert (=> d!88234 (= lt!403682 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88234 (= lt!403679 ((_ sign_extend 32) (size!6330 (buf!6852 thiss!914))))))

(assert (=> d!88234 (= lt!403680 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 thiss!914))))))

(assert (=> d!88234 (invariant!0 (currentBit!12669 thiss!914) (currentByte!12674 thiss!914) (size!6330 (buf!6852 thiss!914)))))

(assert (=> d!88234 (= (bitIndex!0 (size!6330 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914)) lt!403680)))

(declare-fun b!261673 () Bool)

(declare-fun res!219042 () Bool)

(assert (=> b!261673 (=> (not res!219042) (not e!182101))))

(assert (=> b!261673 (= res!219042 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403680))))

(declare-fun b!261674 () Bool)

(declare-fun lt!403677 () (_ BitVec 64))

(assert (=> b!261674 (= e!182101 (bvsle lt!403680 (bvmul lt!403677 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261674 (or (= lt!403677 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403677 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403677)))))

(assert (=> b!261674 (= lt!403677 ((_ sign_extend 32) (size!6330 (buf!6852 thiss!914))))))

(assert (= (and d!88234 res!219043) b!261673))

(assert (= (and b!261673 res!219042) b!261674))

(assert (=> d!88234 m!391599))

(assert (=> d!88234 m!391601))

(assert (=> b!261584 d!88234))

(declare-fun d!88238 () Bool)

(declare-fun e!182110 () Bool)

(assert (=> d!88238 e!182110))

(declare-fun res!219056 () Bool)

(assert (=> d!88238 (=> (not res!219056) (not e!182110))))

(declare-fun lt!403700 () (_ BitVec 64))

(declare-fun lt!403698 () (_ BitVec 64))

(declare-fun lt!403696 () tuple2!22390)

(assert (=> d!88238 (= res!219056 (= (bvadd lt!403698 lt!403700) (bitIndex!0 (size!6330 (buf!6852 (_2!12131 lt!403696))) (currentByte!12674 (_2!12131 lt!403696)) (currentBit!12669 (_2!12131 lt!403696)))))))

(assert (=> d!88238 (or (not (= (bvand lt!403698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403700 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403698 lt!403700) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88238 (= lt!403700 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!88238 (= lt!403698 (bitIndex!0 (size!6330 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)) (currentBit!12669 (_2!12131 lt!403550))))))

(declare-fun Unit!18667 () Unit!18659)

(declare-fun Unit!18668 () Unit!18659)

(assert (=> d!88238 (= lt!403696 (ite (bvslt (currentBit!12669 (_2!12131 lt!403550)) #b00000000000000000000000000000111) (tuple2!22391 Unit!18667 (BitStream!11583 (buf!6852 (_2!12131 lt!403550)) (currentByte!12674 (_2!12131 lt!403550)) (bvadd (currentBit!12669 (_2!12131 lt!403550)) #b00000000000000000000000000000001))) (tuple2!22391 Unit!18668 (BitStream!11583 (buf!6852 (_2!12131 lt!403550)) (bvadd (currentByte!12674 (_2!12131 lt!403550)) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!88238 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403550)))) ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403550))) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403550)))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!88238 (= (increaseBitIndex!0 (_2!12131 lt!403550)) lt!403696)))

(declare-fun b!261685 () Bool)

(declare-fun res!219055 () Bool)

(assert (=> b!261685 (=> (not res!219055) (not e!182110))))

(declare-fun lt!403699 () (_ BitVec 64))

(declare-fun lt!403697 () (_ BitVec 64))

(assert (=> b!261685 (= res!219055 (= (bvsub lt!403699 lt!403697) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261685 (or (= (bvand lt!403699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403697 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403699 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403699 lt!403697) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261685 (= lt!403697 (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403696)))) ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403696))) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403696)))))))

(assert (=> b!261685 (= lt!403699 (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403550)))) ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403550))) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403550)))))))

(declare-fun b!261686 () Bool)

(assert (=> b!261686 (= e!182110 (= (size!6330 (buf!6852 (_2!12131 lt!403550))) (size!6330 (buf!6852 (_2!12131 lt!403696)))))))

(assert (= (and d!88238 res!219056) b!261685))

(assert (= (and b!261685 res!219055) b!261686))

(declare-fun m!391629 () Bool)

(assert (=> d!88238 m!391629))

(declare-fun m!391631 () Bool)

(assert (=> d!88238 m!391631))

(declare-fun m!391633 () Bool)

(assert (=> d!88238 m!391633))

(declare-fun m!391635 () Bool)

(assert (=> b!261685 m!391635))

(assert (=> b!261685 m!391633))

(assert (=> b!261579 d!88238))

(declare-fun d!88240 () Bool)

(declare-fun res!219061 () Bool)

(declare-fun e!182115 () Bool)

(assert (=> d!88240 (=> res!219061 e!182115)))

(assert (=> d!88240 (= res!219061 (= #b00000000000000000000000000000000 (currentByte!12674 (_2!12131 lt!403550))))))

(assert (=> d!88240 (= (arrayRangesEq!955 (buf!6852 thiss!914) (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914))) #b00000000000000000000000000000000 (currentByte!12674 (_2!12131 lt!403550))) e!182115)))

(declare-fun b!261691 () Bool)

(declare-fun e!182116 () Bool)

(assert (=> b!261691 (= e!182115 e!182116)))

(declare-fun res!219062 () Bool)

(assert (=> b!261691 (=> (not res!219062) (not e!182116))))

(assert (=> b!261691 (= res!219062 (= (select (arr!7317 (buf!6852 thiss!914)) #b00000000000000000000000000000000) (select (arr!7317 (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914)))) #b00000000000000000000000000000000)))))

(declare-fun b!261692 () Bool)

(assert (=> b!261692 (= e!182116 (arrayRangesEq!955 (buf!6852 thiss!914) (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12674 (_2!12131 lt!403550))))))

(assert (= (and d!88240 (not res!219061)) b!261691))

(assert (= (and b!261691 res!219062) b!261692))

(declare-fun m!391637 () Bool)

(assert (=> b!261691 m!391637))

(declare-fun m!391639 () Bool)

(assert (=> b!261691 m!391639))

(declare-fun m!391641 () Bool)

(assert (=> b!261692 m!391641))

(assert (=> b!261579 d!88240))

(declare-fun d!88242 () Bool)

(declare-fun e!182119 () Bool)

(assert (=> d!88242 e!182119))

(declare-fun res!219065 () Bool)

(assert (=> d!88242 (=> (not res!219065) (not e!182119))))

(assert (=> d!88242 (= res!219065 (and (bvsge (currentByte!12674 (_2!12131 lt!403550)) #b00000000000000000000000000000000) (bvslt (currentByte!12674 (_2!12131 lt!403550)) (size!6330 (buf!6852 thiss!914)))))))

(declare-fun lt!403703 () Unit!18659)

(declare-fun choose!365 (array!14506 (_ BitVec 32) (_ BitVec 8)) Unit!18659)

(assert (=> d!88242 (= lt!403703 (choose!365 (buf!6852 thiss!914) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))))))

(assert (=> d!88242 (and (bvsle #b00000000000000000000000000000000 (currentByte!12674 (_2!12131 lt!403550))) (bvslt (currentByte!12674 (_2!12131 lt!403550)) (size!6330 (buf!6852 thiss!914))))))

(assert (=> d!88242 (= (arrayUpdatedAtPrefixLemma!471 (buf!6852 thiss!914) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) lt!403703)))

(declare-fun b!261695 () Bool)

(assert (=> b!261695 (= e!182119 (arrayRangesEq!955 (buf!6852 thiss!914) (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914))) #b00000000000000000000000000000000 (currentByte!12674 (_2!12131 lt!403550))))))

(assert (= (and d!88242 res!219065) b!261695))

(assert (=> d!88242 m!391511))

(declare-fun m!391643 () Bool)

(assert (=> d!88242 m!391643))

(assert (=> b!261695 m!391519))

(assert (=> b!261695 m!391521))

(assert (=> b!261579 d!88242))

(push 1)

(assert (not b!261670))

(assert (not b!261668))

(assert (not d!88232))

(assert (not d!88220))

(assert (not d!88222))

(assert (not b!261685))

(assert (not d!88242))

(assert (not b!261695))

(assert (not d!88206))

(assert (not d!88208))

(assert (not b!261692))

(assert (not d!88234))

(assert (not d!88238))

(assert (not d!88212))

(assert (not b!261619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88304 () Bool)

(assert (=> d!88304 (= (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 thiss!914))) ((_ sign_extend 32) (currentByte!12674 thiss!914)) ((_ sign_extend 32) (currentBit!12669 thiss!914))) (bvsub (bvmul ((_ sign_extend 32) (size!6330 (buf!6852 thiss!914))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 thiss!914)))))))

(assert (=> d!88234 d!88304))

(declare-fun d!88306 () Bool)

(assert (=> d!88306 (= (invariant!0 (currentBit!12669 thiss!914) (currentByte!12674 thiss!914) (size!6330 (buf!6852 thiss!914))) (and (bvsge (currentBit!12669 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12669 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12674 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12674 thiss!914) (size!6330 (buf!6852 thiss!914))) (and (= (currentBit!12669 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12674 thiss!914) (size!6330 (buf!6852 thiss!914)))))))))

(assert (=> d!88234 d!88306))

(declare-fun d!88308 () Bool)

(declare-fun e!182184 () Bool)

(assert (=> d!88308 e!182184))

(declare-fun res!219116 () Bool)

(assert (=> d!88308 (=> (not res!219116) (not e!182184))))

(assert (=> d!88308 (= res!219116 (= (buf!6852 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))))

(declare-fun lt!403806 () Bool)

(assert (=> d!88308 (= lt!403806 (not (= (bvand ((_ sign_extend 24) (select (arr!7317 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!403808 () tuple2!22396)

(assert (=> d!88308 (= lt!403808 (tuple2!22397 (not (= (bvand ((_ sign_extend 24) (select (arr!7317 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))) #b00000000000000000000000000000000)) (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))))

(assert (=> d!88308 (validate_offset_bit!0 ((_ sign_extend 32) (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) ((_ sign_extend 32) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) ((_ sign_extend 32) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))))

(assert (=> d!88308 (= (readBit!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) lt!403808)))

(declare-fun b!261758 () Bool)

(declare-fun lt!403804 () (_ BitVec 64))

(declare-fun lt!403802 () (_ BitVec 64))

(assert (=> b!261758 (= e!182184 (= (bitIndex!0 (size!6330 (buf!6852 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))) (currentByte!12674 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) (currentBit!12669 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))) (bvadd lt!403804 lt!403802)))))

(assert (=> b!261758 (or (not (= (bvand lt!403804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403802 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403804 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403804 lt!403802) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261758 (= lt!403802 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!261758 (= lt!403804 (bitIndex!0 (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))))

(declare-fun lt!403805 () Bool)

(assert (=> b!261758 (= lt!403805 (not (= (bvand ((_ sign_extend 24) (select (arr!7317 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!403803 () Bool)

(assert (=> b!261758 (= lt!403803 (not (= (bvand ((_ sign_extend 24) (select (arr!7317 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!403807 () Bool)

(assert (=> b!261758 (= lt!403807 (not (= (bvand ((_ sign_extend 24) (select (arr!7317 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!88308 res!219116) b!261758))

(assert (=> d!88308 m!391529))

(declare-fun m!391721 () Bool)

(assert (=> d!88308 m!391721))

(declare-fun m!391723 () Bool)

(assert (=> d!88308 m!391723))

(declare-fun m!391725 () Bool)

(assert (=> d!88308 m!391725))

(declare-fun m!391727 () Bool)

(assert (=> d!88308 m!391727))

(assert (=> b!261758 m!391725))

(declare-fun m!391729 () Bool)

(assert (=> b!261758 m!391729))

(assert (=> b!261758 m!391723))

(declare-fun m!391731 () Bool)

(assert (=> b!261758 m!391731))

(assert (=> b!261758 m!391529))

(assert (=> b!261758 m!391721))

(assert (=> d!88206 d!88308))

(declare-fun d!88310 () Bool)

(declare-fun e!182185 () Bool)

(assert (=> d!88310 e!182185))

(declare-fun res!219118 () Bool)

(assert (=> d!88310 (=> (not res!219118) (not e!182185))))

(declare-fun lt!403812 () (_ BitVec 64))

(declare-fun lt!403810 () (_ BitVec 64))

(declare-fun lt!403813 () (_ BitVec 64))

(assert (=> d!88310 (= res!219118 (= lt!403812 (bvsub lt!403813 lt!403810)))))

(assert (=> d!88310 (or (= (bvand lt!403813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403810 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403813 lt!403810) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88310 (= lt!403810 (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403696)))) ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403696))) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403696)))))))

(declare-fun lt!403811 () (_ BitVec 64))

(declare-fun lt!403814 () (_ BitVec 64))

(assert (=> d!88310 (= lt!403813 (bvmul lt!403811 lt!403814))))

(assert (=> d!88310 (or (= lt!403811 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403814 (bvsdiv (bvmul lt!403811 lt!403814) lt!403811)))))

(assert (=> d!88310 (= lt!403814 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88310 (= lt!403811 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403696)))))))

(assert (=> d!88310 (= lt!403812 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403696))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403696)))))))

(assert (=> d!88310 (invariant!0 (currentBit!12669 (_2!12131 lt!403696)) (currentByte!12674 (_2!12131 lt!403696)) (size!6330 (buf!6852 (_2!12131 lt!403696))))))

(assert (=> d!88310 (= (bitIndex!0 (size!6330 (buf!6852 (_2!12131 lt!403696))) (currentByte!12674 (_2!12131 lt!403696)) (currentBit!12669 (_2!12131 lt!403696))) lt!403812)))

(declare-fun b!261759 () Bool)

(declare-fun res!219117 () Bool)

(assert (=> b!261759 (=> (not res!219117) (not e!182185))))

(assert (=> b!261759 (= res!219117 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403812))))

(declare-fun b!261760 () Bool)

(declare-fun lt!403809 () (_ BitVec 64))

(assert (=> b!261760 (= e!182185 (bvsle lt!403812 (bvmul lt!403809 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261760 (or (= lt!403809 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403809 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403809)))))

(assert (=> b!261760 (= lt!403809 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403696)))))))

(assert (= (and d!88310 res!219118) b!261759))

(assert (= (and b!261759 res!219117) b!261760))

(assert (=> d!88310 m!391635))

(declare-fun m!391733 () Bool)

(assert (=> d!88310 m!391733))

(assert (=> d!88238 d!88310))

(declare-fun d!88312 () Bool)

(declare-fun e!182186 () Bool)

(assert (=> d!88312 e!182186))

(declare-fun res!219120 () Bool)

(assert (=> d!88312 (=> (not res!219120) (not e!182186))))

(declare-fun lt!403816 () (_ BitVec 64))

(declare-fun lt!403818 () (_ BitVec 64))

(declare-fun lt!403819 () (_ BitVec 64))

(assert (=> d!88312 (= res!219120 (= lt!403818 (bvsub lt!403819 lt!403816)))))

(assert (=> d!88312 (or (= (bvand lt!403819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403816 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403819 lt!403816) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88312 (= lt!403816 (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403550)))) ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403550))) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403550)))))))

(declare-fun lt!403817 () (_ BitVec 64))

(declare-fun lt!403820 () (_ BitVec 64))

(assert (=> d!88312 (= lt!403819 (bvmul lt!403817 lt!403820))))

(assert (=> d!88312 (or (= lt!403817 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403820 (bvsdiv (bvmul lt!403817 lt!403820) lt!403817)))))

(assert (=> d!88312 (= lt!403820 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88312 (= lt!403817 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403550)))))))

(assert (=> d!88312 (= lt!403818 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403550))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403550)))))))

(assert (=> d!88312 (invariant!0 (currentBit!12669 (_2!12131 lt!403550)) (currentByte!12674 (_2!12131 lt!403550)) (size!6330 (buf!6852 (_2!12131 lt!403550))))))

(assert (=> d!88312 (= (bitIndex!0 (size!6330 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)) (currentBit!12669 (_2!12131 lt!403550))) lt!403818)))

(declare-fun b!261761 () Bool)

(declare-fun res!219119 () Bool)

(assert (=> b!261761 (=> (not res!219119) (not e!182186))))

(assert (=> b!261761 (= res!219119 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403818))))

(declare-fun b!261762 () Bool)

(declare-fun lt!403815 () (_ BitVec 64))

(assert (=> b!261762 (= e!182186 (bvsle lt!403818 (bvmul lt!403815 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261762 (or (= lt!403815 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403815 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403815)))))

(assert (=> b!261762 (= lt!403815 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403550)))))))

(assert (= (and d!88312 res!219120) b!261761))

(assert (= (and b!261761 res!219119) b!261762))

(assert (=> d!88312 m!391633))

(declare-fun m!391735 () Bool)

(assert (=> d!88312 m!391735))

(assert (=> d!88238 d!88312))

(declare-fun d!88314 () Bool)

(assert (=> d!88314 (= (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403550)))) ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403550))) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403550)))) (bvsub (bvmul ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403550)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403550))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403550))))))))

(assert (=> d!88238 d!88314))

(declare-fun d!88316 () Bool)

(declare-fun res!219121 () Bool)

(declare-fun e!182187 () Bool)

(assert (=> d!88316 (=> res!219121 e!182187)))

(assert (=> d!88316 (= res!219121 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12674 (_2!12131 lt!403550))))))

(assert (=> d!88316 (= (arrayRangesEq!955 (buf!6852 thiss!914) (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12674 (_2!12131 lt!403550))) e!182187)))

(declare-fun b!261763 () Bool)

(declare-fun e!182188 () Bool)

(assert (=> b!261763 (= e!182187 e!182188)))

(declare-fun res!219122 () Bool)

(assert (=> b!261763 (=> (not res!219122) (not e!182188))))

(assert (=> b!261763 (= res!219122 (= (select (arr!7317 (buf!6852 thiss!914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!7317 (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!261764 () Bool)

(assert (=> b!261764 (= e!182188 (arrayRangesEq!955 (buf!6852 thiss!914) (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12674 (_2!12131 lt!403550))))))

(assert (= (and d!88316 (not res!219121)) b!261763))

(assert (= (and b!261763 res!219122) b!261764))

(declare-fun m!391737 () Bool)

(assert (=> b!261763 m!391737))

(declare-fun m!391739 () Bool)

(assert (=> b!261763 m!391739))

(declare-fun m!391741 () Bool)

(assert (=> b!261764 m!391741))

(assert (=> b!261692 d!88316))

(declare-fun d!88318 () Bool)

(assert (=> d!88318 (= (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_1!12132 lt!403549)))) ((_ sign_extend 32) (currentByte!12674 (_1!12132 lt!403549))) ((_ sign_extend 32) (currentBit!12669 (_1!12132 lt!403549)))) (bvsub (bvmul ((_ sign_extend 32) (size!6330 (buf!6852 (_1!12132 lt!403549)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 (_1!12132 lt!403549))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 (_1!12132 lt!403549))))))))

(assert (=> d!88212 d!88318))

(declare-fun d!88320 () Bool)

(assert (=> d!88320 (= (invariant!0 (currentBit!12669 (_1!12132 lt!403549)) (currentByte!12674 (_1!12132 lt!403549)) (size!6330 (buf!6852 (_1!12132 lt!403549)))) (and (bvsge (currentBit!12669 (_1!12132 lt!403549)) #b00000000000000000000000000000000) (bvslt (currentBit!12669 (_1!12132 lt!403549)) #b00000000000000000000000000001000) (bvsge (currentByte!12674 (_1!12132 lt!403549)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12674 (_1!12132 lt!403549)) (size!6330 (buf!6852 (_1!12132 lt!403549)))) (and (= (currentBit!12669 (_1!12132 lt!403549)) #b00000000000000000000000000000000) (= (currentByte!12674 (_1!12132 lt!403549)) (size!6330 (buf!6852 (_1!12132 lt!403549))))))))))

(assert (=> d!88212 d!88320))

(declare-datatypes ((tuple4!316 0))(
  ( (tuple4!317 (_1!12138 (_ BitVec 32)) (_2!12138 (_ BitVec 32)) (_3!938 (_ BitVec 32)) (_4!158 (_ BitVec 32))) )
))
(declare-fun lt!403827 () tuple4!316)

(declare-fun e!182202 () Bool)

(declare-fun b!261779 () Bool)

(assert (=> b!261779 (= e!182202 (arrayRangesEq!955 (buf!6852 thiss!914) (buf!6852 (_2!12131 lt!403546)) (_1!12138 lt!403827) (_2!12138 lt!403827)))))

(declare-fun b!261780 () Bool)

(declare-fun e!182206 () Bool)

(declare-fun e!182203 () Bool)

(assert (=> b!261780 (= e!182206 e!182203)))

(declare-fun c!11994 () Bool)

(assert (=> b!261780 (= c!11994 (= (_3!938 lt!403827) (_4!158 lt!403827)))))

(declare-fun b!261781 () Bool)

(declare-fun call!4025 () Bool)

(assert (=> b!261781 (= e!182203 call!4025)))

(declare-fun b!261782 () Bool)

(declare-fun lt!403828 () (_ BitVec 32))

(declare-fun e!182205 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261782 (= e!182205 (byteRangesEq!0 (select (arr!7317 (buf!6852 thiss!914)) (_4!158 lt!403827)) (select (arr!7317 (buf!6852 (_2!12131 lt!403546))) (_4!158 lt!403827)) #b00000000000000000000000000000000 lt!403828))))

(declare-fun b!261783 () Bool)

(declare-fun res!219137 () Bool)

(assert (=> b!261783 (= res!219137 (= lt!403828 #b00000000000000000000000000000000))))

(assert (=> b!261783 (=> res!219137 e!182205)))

(declare-fun e!182201 () Bool)

(assert (=> b!261783 (= e!182201 e!182205)))

(declare-fun b!261784 () Bool)

(assert (=> b!261784 (= e!182203 e!182201)))

(declare-fun res!219135 () Bool)

(assert (=> b!261784 (= res!219135 call!4025)))

(assert (=> b!261784 (=> (not res!219135) (not e!182201))))

(declare-fun b!261785 () Bool)

(declare-fun e!182204 () Bool)

(assert (=> b!261785 (= e!182204 e!182206)))

(declare-fun res!219136 () Bool)

(assert (=> b!261785 (=> (not res!219136) (not e!182206))))

(assert (=> b!261785 (= res!219136 e!182202)))

(declare-fun res!219134 () Bool)

(assert (=> b!261785 (=> res!219134 e!182202)))

(assert (=> b!261785 (= res!219134 (bvsge (_1!12138 lt!403827) (_2!12138 lt!403827)))))

(assert (=> b!261785 (= lt!403828 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6330 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!403829 () (_ BitVec 32))

(assert (=> b!261785 (= lt!403829 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!316)

(assert (=> b!261785 (= lt!403827 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6330 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914))))))

(declare-fun bm!4022 () Bool)

(assert (=> bm!4022 (= call!4025 (byteRangesEq!0 (select (arr!7317 (buf!6852 thiss!914)) (_3!938 lt!403827)) (select (arr!7317 (buf!6852 (_2!12131 lt!403546))) (_3!938 lt!403827)) lt!403829 (ite c!11994 lt!403828 #b00000000000000000000000000001000)))))

(declare-fun d!88322 () Bool)

(declare-fun res!219133 () Bool)

(assert (=> d!88322 (=> res!219133 e!182204)))

(assert (=> d!88322 (= res!219133 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6330 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914))))))

(assert (=> d!88322 (= (arrayBitRangesEq!0 (buf!6852 thiss!914) (buf!6852 (_2!12131 lt!403546)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6330 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914))) e!182204)))

(assert (= (and d!88322 (not res!219133)) b!261785))

(assert (= (and b!261785 (not res!219134)) b!261779))

(assert (= (and b!261785 res!219136) b!261780))

(assert (= (and b!261780 c!11994) b!261781))

(assert (= (and b!261780 (not c!11994)) b!261784))

(assert (= (and b!261784 res!219135) b!261783))

(assert (= (and b!261783 (not res!219137)) b!261782))

(assert (= (or b!261781 b!261784) bm!4022))

(declare-fun m!391743 () Bool)

(assert (=> b!261779 m!391743))

(declare-fun m!391745 () Bool)

(assert (=> b!261782 m!391745))

(declare-fun m!391747 () Bool)

(assert (=> b!261782 m!391747))

(assert (=> b!261782 m!391745))

(assert (=> b!261782 m!391747))

(declare-fun m!391749 () Bool)

(assert (=> b!261782 m!391749))

(assert (=> b!261785 m!391541))

(declare-fun m!391751 () Bool)

(assert (=> b!261785 m!391751))

(declare-fun m!391753 () Bool)

(assert (=> bm!4022 m!391753))

(declare-fun m!391755 () Bool)

(assert (=> bm!4022 m!391755))

(assert (=> bm!4022 m!391753))

(assert (=> bm!4022 m!391755))

(declare-fun m!391757 () Bool)

(assert (=> bm!4022 m!391757))

(assert (=> b!261670 d!88322))

(assert (=> b!261670 d!88234))

(declare-fun d!88324 () Bool)

(assert (=> d!88324 (arrayRangesEq!955 (buf!6852 thiss!914) (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914))) #b00000000000000000000000000000000 (currentByte!12674 (_2!12131 lt!403550)))))

(assert (=> d!88324 true))

(declare-fun _$8!229 () Unit!18659)

(assert (=> d!88324 (= (choose!365 (buf!6852 thiss!914) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) _$8!229)))

(declare-fun bs!22361 () Bool)

(assert (= bs!22361 d!88324))

(assert (=> bs!22361 m!391519))

(assert (=> bs!22361 m!391521))

(assert (=> d!88242 d!88324))

(declare-fun d!88326 () Bool)

(assert (=> d!88326 (= (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403696)))) ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403696))) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403696)))) (bvsub (bvmul ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403696)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403696))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403696))))))))

(assert (=> b!261685 d!88326))

(assert (=> b!261685 d!88314))

(assert (=> b!261668 d!88234))

(assert (=> b!261668 d!88232))

(assert (=> b!261695 d!88240))

(assert (=> d!88222 d!88306))

(declare-fun d!88328 () Bool)

(assert (=> d!88328 (= (invariant!0 (currentBit!12669 (_2!12131 lt!403546)) (currentByte!12674 (_2!12131 lt!403546)) (size!6330 (buf!6852 (_2!12131 lt!403546)))) (and (bvsge (currentBit!12669 (_2!12131 lt!403546)) #b00000000000000000000000000000000) (bvslt (currentBit!12669 (_2!12131 lt!403546)) #b00000000000000000000000000001000) (bvsge (currentByte!12674 (_2!12131 lt!403546)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12674 (_2!12131 lt!403546)) (size!6330 (buf!6852 (_2!12131 lt!403546)))) (and (= (currentBit!12669 (_2!12131 lt!403546)) #b00000000000000000000000000000000) (= (currentByte!12674 (_2!12131 lt!403546)) (size!6330 (buf!6852 (_2!12131 lt!403546))))))))))

(assert (=> d!88208 d!88328))

(assert (=> d!88220 d!88304))

(declare-fun d!88330 () Bool)

(assert (=> d!88330 (= (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403546)))) ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403546))) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403546)))) (bvsub (bvmul ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403546)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403546))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403546))))))))

(assert (=> d!88232 d!88330))

(assert (=> d!88232 d!88328))

(declare-fun d!88332 () Bool)

(assert (=> d!88332 (= (invariant!0 (currentBit!12669 thiss!914) (currentByte!12674 thiss!914) (size!6330 (buf!6852 (_2!12131 lt!403546)))) (and (bvsge (currentBit!12669 thiss!914) #b00000000000000000000000000000000) (bvslt (currentBit!12669 thiss!914) #b00000000000000000000000000001000) (bvsge (currentByte!12674 thiss!914) #b00000000000000000000000000000000) (or (bvslt (currentByte!12674 thiss!914) (size!6330 (buf!6852 (_2!12131 lt!403546)))) (and (= (currentBit!12669 thiss!914) #b00000000000000000000000000000000) (= (currentByte!12674 thiss!914) (size!6330 (buf!6852 (_2!12131 lt!403546))))))))))

(assert (=> b!261619 d!88332))

(push 1)

(assert (not b!261758))

(assert (not d!88312))

(assert (not b!261782))

(assert (not b!261785))

(assert (not d!88310))

(assert (not bm!4022))

(assert (not b!261764))

(assert (not b!261779))

(assert (not d!88308))

(assert (not d!88324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88356 () Bool)

(assert (=> d!88356 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6330 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914))) (tuple4!317 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6330 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!6330 (buf!6852 thiss!914)) (currentByte!12674 thiss!914) (currentBit!12669 thiss!914)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!261785 d!88356))

(assert (=> d!88310 d!88326))

(declare-fun d!88358 () Bool)

(assert (=> d!88358 (= (invariant!0 (currentBit!12669 (_2!12131 lt!403696)) (currentByte!12674 (_2!12131 lt!403696)) (size!6330 (buf!6852 (_2!12131 lt!403696)))) (and (bvsge (currentBit!12669 (_2!12131 lt!403696)) #b00000000000000000000000000000000) (bvslt (currentBit!12669 (_2!12131 lt!403696)) #b00000000000000000000000000001000) (bvsge (currentByte!12674 (_2!12131 lt!403696)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12674 (_2!12131 lt!403696)) (size!6330 (buf!6852 (_2!12131 lt!403696)))) (and (= (currentBit!12669 (_2!12131 lt!403696)) #b00000000000000000000000000000000) (= (currentByte!12674 (_2!12131 lt!403696)) (size!6330 (buf!6852 (_2!12131 lt!403696))))))))))

(assert (=> d!88310 d!88358))

(declare-fun d!88360 () Bool)

(declare-fun e!182214 () Bool)

(assert (=> d!88360 e!182214))

(declare-fun res!219149 () Bool)

(assert (=> d!88360 (=> (not res!219149) (not e!182214))))

(declare-fun lt!403851 () (_ BitVec 64))

(declare-fun lt!403847 () tuple2!22390)

(declare-fun lt!403849 () (_ BitVec 64))

(assert (=> d!88360 (= res!219149 (= (bvadd lt!403849 lt!403851) (bitIndex!0 (size!6330 (buf!6852 (_2!12131 lt!403847))) (currentByte!12674 (_2!12131 lt!403847)) (currentBit!12669 (_2!12131 lt!403847)))))))

(assert (=> d!88360 (or (not (= (bvand lt!403849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403851 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!403849 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!403849 lt!403851) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88360 (= lt!403851 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!88360 (= lt!403849 (bitIndex!0 (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))))

(declare-fun Unit!18671 () Unit!18659)

(declare-fun Unit!18672 () Unit!18659)

(assert (=> d!88360 (= lt!403847 (ite (bvslt (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) #b00000000000000000000000000000111) (tuple2!22391 Unit!18671 (BitStream!11583 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) (bvadd (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) #b00000000000000000000000000000001))) (tuple2!22391 Unit!18672 (BitStream!11583 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) (bvadd (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!88360 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) ((_ sign_extend 32) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) ((_ sign_extend 32) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!88360 (= (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) lt!403847)))

(declare-fun b!261796 () Bool)

(declare-fun res!219148 () Bool)

(assert (=> b!261796 (=> (not res!219148) (not e!182214))))

(declare-fun lt!403850 () (_ BitVec 64))

(declare-fun lt!403848 () (_ BitVec 64))

(assert (=> b!261796 (= res!219148 (= (bvsub lt!403850 lt!403848) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!261796 (or (= (bvand lt!403850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403848 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403850 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403850 lt!403848) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!261796 (= lt!403848 (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 lt!403847)))) ((_ sign_extend 32) (currentByte!12674 (_2!12131 lt!403847))) ((_ sign_extend 32) (currentBit!12669 (_2!12131 lt!403847)))))))

(assert (=> b!261796 (= lt!403850 (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) ((_ sign_extend 32) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) ((_ sign_extend 32) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))))

(declare-fun b!261797 () Bool)

(assert (=> b!261797 (= e!182214 (= (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) (size!6330 (buf!6852 (_2!12131 lt!403847)))))))

(assert (= (and d!88360 res!219149) b!261796))

(assert (= (and b!261796 res!219148) b!261797))

(declare-fun m!391791 () Bool)

(assert (=> d!88360 m!391791))

(assert (=> d!88360 m!391729))

(declare-fun m!391793 () Bool)

(assert (=> d!88360 m!391793))

(declare-fun m!391795 () Bool)

(assert (=> b!261796 m!391795))

(assert (=> b!261796 m!391793))

(assert (=> d!88308 d!88360))

(declare-fun d!88362 () Bool)

(assert (=> d!88362 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) ((_ sign_extend 32) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) ((_ sign_extend 32) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) ((_ sign_extend 32) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) ((_ sign_extend 32) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!22365 () Bool)

(assert (= bs!22365 d!88362))

(assert (=> bs!22365 m!391793))

(assert (=> d!88308 d!88362))

(assert (=> d!88324 d!88240))

(declare-fun d!88364 () Bool)

(declare-fun e!182215 () Bool)

(assert (=> d!88364 e!182215))

(declare-fun res!219151 () Bool)

(assert (=> d!88364 (=> (not res!219151) (not e!182215))))

(declare-fun lt!403856 () (_ BitVec 64))

(declare-fun lt!403853 () (_ BitVec 64))

(declare-fun lt!403855 () (_ BitVec 64))

(assert (=> d!88364 (= res!219151 (= lt!403855 (bvsub lt!403856 lt!403853)))))

(assert (=> d!88364 (or (= (bvand lt!403856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403853 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403856 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403856 lt!403853) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88364 (= lt!403853 (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))) ((_ sign_extend 32) (currentByte!12674 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))) ((_ sign_extend 32) (currentBit!12669 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))))))

(declare-fun lt!403854 () (_ BitVec 64))

(declare-fun lt!403857 () (_ BitVec 64))

(assert (=> d!88364 (= lt!403856 (bvmul lt!403854 lt!403857))))

(assert (=> d!88364 (or (= lt!403854 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403857 (bvsdiv (bvmul lt!403854 lt!403857) lt!403854)))))

(assert (=> d!88364 (= lt!403857 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88364 (= lt!403854 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))))))

(assert (=> d!88364 (= lt!403855 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))))))

(assert (=> d!88364 (invariant!0 (currentBit!12669 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) (currentByte!12674 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) (size!6330 (buf!6852 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))))))

(assert (=> d!88364 (= (bitIndex!0 (size!6330 (buf!6852 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))) (currentByte!12674 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) (currentBit!12669 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))) lt!403855)))

(declare-fun b!261798 () Bool)

(declare-fun res!219150 () Bool)

(assert (=> b!261798 (=> (not res!219150) (not e!182215))))

(assert (=> b!261798 (= res!219150 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403855))))

(declare-fun b!261799 () Bool)

(declare-fun lt!403852 () (_ BitVec 64))

(assert (=> b!261799 (= e!182215 (bvsle lt!403855 (bvmul lt!403852 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261799 (or (= lt!403852 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403852 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403852)))))

(assert (=> b!261799 (= lt!403852 ((_ sign_extend 32) (size!6330 (buf!6852 (_2!12131 (increaseBitIndex!0 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))))))

(assert (= (and d!88364 res!219151) b!261798))

(assert (= (and b!261798 res!219150) b!261799))

(declare-fun m!391797 () Bool)

(assert (=> d!88364 m!391797))

(declare-fun m!391799 () Bool)

(assert (=> d!88364 m!391799))

(assert (=> b!261758 d!88364))

(assert (=> b!261758 d!88360))

(declare-fun d!88366 () Bool)

(declare-fun e!182216 () Bool)

(assert (=> d!88366 e!182216))

(declare-fun res!219153 () Bool)

(assert (=> d!88366 (=> (not res!219153) (not e!182216))))

(declare-fun lt!403862 () (_ BitVec 64))

(declare-fun lt!403861 () (_ BitVec 64))

(declare-fun lt!403859 () (_ BitVec 64))

(assert (=> d!88366 (= res!219153 (= lt!403861 (bvsub lt!403862 lt!403859)))))

(assert (=> d!88366 (or (= (bvand lt!403862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!403859 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!403862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!403862 lt!403859) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!88366 (= lt!403859 (remainingBits!0 ((_ sign_extend 32) (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))) ((_ sign_extend 32) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) ((_ sign_extend 32) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))))

(declare-fun lt!403860 () (_ BitVec 64))

(declare-fun lt!403863 () (_ BitVec 64))

(assert (=> d!88366 (= lt!403862 (bvmul lt!403860 lt!403863))))

(assert (=> d!88366 (or (= lt!403860 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!403863 (bvsdiv (bvmul lt!403860 lt!403863) lt!403860)))))

(assert (=> d!88366 (= lt!403863 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88366 (= lt!403860 ((_ sign_extend 32) (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))))

(assert (=> d!88366 (= lt!403861 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))))

(assert (=> d!88366 (invariant!0 (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))))))

(assert (=> d!88366 (= (bitIndex!0 (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) (currentByte!12674 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))) (currentBit!12669 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914)))) lt!403861)))

(declare-fun b!261800 () Bool)

(declare-fun res!219152 () Bool)

(assert (=> b!261800 (=> (not res!219152) (not e!182216))))

(assert (=> b!261800 (= res!219152 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!403861))))

(declare-fun b!261801 () Bool)

(declare-fun lt!403858 () (_ BitVec 64))

(assert (=> b!261801 (= e!182216 (bvsle lt!403861 (bvmul lt!403858 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!261801 (or (= lt!403858 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!403858 #b0000000000000000000000000000000000000000000000000000000000001000) lt!403858)))))

(assert (=> b!261801 (= lt!403858 ((_ sign_extend 32) (size!6330 (buf!6852 (readerFrom!0 (_2!12131 lt!403546) (currentBit!12669 thiss!914) (currentByte!12674 thiss!914))))))))

(assert (= (and d!88366 res!219153) b!261800))

(assert (= (and b!261800 res!219152) b!261801))

(assert (=> d!88366 m!391793))

(declare-fun m!391801 () Bool)

(assert (=> d!88366 m!391801))

(assert (=> b!261758 d!88366))

(declare-fun d!88368 () Bool)

(assert (=> d!88368 (= (byteRangesEq!0 (select (arr!7317 (buf!6852 thiss!914)) (_3!938 lt!403827)) (select (arr!7317 (buf!6852 (_2!12131 lt!403546))) (_3!938 lt!403827)) lt!403829 (ite c!11994 lt!403828 #b00000000000000000000000000001000)) (or (= lt!403829 (ite c!11994 lt!403828 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7317 (buf!6852 thiss!914)) (_3!938 lt!403827))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!11994 lt!403828 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!403829)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7317 (buf!6852 (_2!12131 lt!403546))) (_3!938 lt!403827))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!11994 lt!403828 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!403829)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22366 () Bool)

(assert (= bs!22366 d!88368))

(declare-fun m!391803 () Bool)

(assert (=> bs!22366 m!391803))

(declare-fun m!391805 () Bool)

(assert (=> bs!22366 m!391805))

(assert (=> bm!4022 d!88368))

(declare-fun d!88370 () Bool)

(assert (=> d!88370 (= (byteRangesEq!0 (select (arr!7317 (buf!6852 thiss!914)) (_4!158 lt!403827)) (select (arr!7317 (buf!6852 (_2!12131 lt!403546))) (_4!158 lt!403827)) #b00000000000000000000000000000000 lt!403828) (or (= #b00000000000000000000000000000000 lt!403828) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7317 (buf!6852 thiss!914)) (_4!158 lt!403827))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!403828))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7317 (buf!6852 (_2!12131 lt!403546))) (_4!158 lt!403827))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!403828))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!22367 () Bool)

(assert (= bs!22367 d!88370))

(declare-fun m!391807 () Bool)

(assert (=> bs!22367 m!391807))

(declare-fun m!391809 () Bool)

(assert (=> bs!22367 m!391809))

(assert (=> b!261782 d!88370))

(declare-fun d!88372 () Bool)

(declare-fun res!219154 () Bool)

(declare-fun e!182217 () Bool)

(assert (=> d!88372 (=> res!219154 e!182217)))

(assert (=> d!88372 (= res!219154 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12674 (_2!12131 lt!403550))))))

(assert (=> d!88372 (= (arrayRangesEq!955 (buf!6852 thiss!914) (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12674 (_2!12131 lt!403550))) e!182217)))

(declare-fun b!261802 () Bool)

(declare-fun e!182218 () Bool)

(assert (=> b!261802 (= e!182217 e!182218)))

(declare-fun res!219155 () Bool)

(assert (=> b!261802 (=> (not res!219155) (not e!182218))))

(assert (=> b!261802 (= res!219155 (= (select (arr!7317 (buf!6852 thiss!914)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!7317 (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!261803 () Bool)

(assert (=> b!261803 (= e!182218 (arrayRangesEq!955 (buf!6852 thiss!914) (array!14507 (store (arr!7317 (buf!6852 thiss!914)) (currentByte!12674 (_2!12131 lt!403550)) (select (arr!7317 (buf!6852 (_2!12131 lt!403550))) (currentByte!12674 (_2!12131 lt!403550)))) (size!6330 (buf!6852 thiss!914))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!12674 (_2!12131 lt!403550))))))

(assert (= (and d!88372 (not res!219154)) b!261802))

(assert (= (and b!261802 res!219155) b!261803))

(declare-fun m!391811 () Bool)

(assert (=> b!261802 m!391811))

(declare-fun m!391813 () Bool)

(assert (=> b!261802 m!391813))

(declare-fun m!391815 () Bool)

(assert (=> b!261803 m!391815))

(assert (=> b!261764 d!88372))

(assert (=> d!88312 d!88314))

(declare-fun d!88374 () Bool)

(assert (=> d!88374 (= (invariant!0 (currentBit!12669 (_2!12131 lt!403550)) (currentByte!12674 (_2!12131 lt!403550)) (size!6330 (buf!6852 (_2!12131 lt!403550)))) (and (bvsge (currentBit!12669 (_2!12131 lt!403550)) #b00000000000000000000000000000000) (bvslt (currentBit!12669 (_2!12131 lt!403550)) #b00000000000000000000000000001000) (bvsge (currentByte!12674 (_2!12131 lt!403550)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12674 (_2!12131 lt!403550)) (size!6330 (buf!6852 (_2!12131 lt!403550)))) (and (= (currentBit!12669 (_2!12131 lt!403550)) #b00000000000000000000000000000000) (= (currentByte!12674 (_2!12131 lt!403550)) (size!6330 (buf!6852 (_2!12131 lt!403550))))))))))

(assert (=> d!88312 d!88374))

(declare-fun d!88376 () Bool)

(declare-fun res!219156 () Bool)

(declare-fun e!182219 () Bool)

(assert (=> d!88376 (=> res!219156 e!182219)))

(assert (=> d!88376 (= res!219156 (= (_1!12138 lt!403827) (_2!12138 lt!403827)))))

(assert (=> d!88376 (= (arrayRangesEq!955 (buf!6852 thiss!914) (buf!6852 (_2!12131 lt!403546)) (_1!12138 lt!403827) (_2!12138 lt!403827)) e!182219)))

(declare-fun b!261804 () Bool)

(declare-fun e!182220 () Bool)

(assert (=> b!261804 (= e!182219 e!182220)))

(declare-fun res!219157 () Bool)

(assert (=> b!261804 (=> (not res!219157) (not e!182220))))

(assert (=> b!261804 (= res!219157 (= (select (arr!7317 (buf!6852 thiss!914)) (_1!12138 lt!403827)) (select (arr!7317 (buf!6852 (_2!12131 lt!403546))) (_1!12138 lt!403827))))))

(declare-fun b!261805 () Bool)

(assert (=> b!261805 (= e!182220 (arrayRangesEq!955 (buf!6852 thiss!914) (buf!6852 (_2!12131 lt!403546)) (bvadd (_1!12138 lt!403827) #b00000000000000000000000000000001) (_2!12138 lt!403827)))))

(assert (= (and d!88376 (not res!219156)) b!261804))

(assert (= (and b!261804 res!219157) b!261805))

(declare-fun m!391817 () Bool)

(assert (=> b!261804 m!391817))

(declare-fun m!391819 () Bool)

(assert (=> b!261804 m!391819))

(declare-fun m!391821 () Bool)

(assert (=> b!261805 m!391821))

(assert (=> b!261779 d!88376))

(push 1)

(assert (not b!261803))

(assert (not d!88366))

(assert (not d!88364))

(assert (not d!88360))

(assert (not d!88362))

(assert (not b!261796))

(assert (not b!261805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

