; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1316 () Bool)

(assert start!1316)

(declare-fun b!6000 () Bool)

(declare-fun res!7048 () Bool)

(declare-fun e!3819 () Bool)

(assert (=> b!6000 (=> (not res!7048) (not e!3819))))

(declare-datatypes ((array!435 0))(
  ( (array!436 (arr!583 (Array (_ BitVec 32) (_ BitVec 8))) (size!187 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!352 0))(
  ( (BitStream!353 (buf!514 array!435) (currentByte!1505 (_ BitVec 32)) (currentBit!1500 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!472 0))(
  ( (Unit!473) )
))
(declare-datatypes ((tuple2!790 0))(
  ( (tuple2!791 (_1!417 Unit!472) (_2!417 BitStream!352)) )
))
(declare-fun lt!7664 () tuple2!790)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!352)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!6000 (= res!7048 (= (bitIndex!0 (size!187 (buf!514 (_2!417 lt!7664))) (currentByte!1505 (_2!417 lt!7664)) (currentBit!1500 (_2!417 lt!7664))) (bvadd (bitIndex!0 (size!187 (buf!514 thiss!1486)) (currentByte!1505 thiss!1486) (currentBit!1500 thiss!1486)) nBits!460)))))

(declare-fun b!6001 () Bool)

(declare-fun res!7050 () Bool)

(assert (=> b!6001 (=> (not res!7050) (not e!3819))))

(assert (=> b!6001 (= res!7050 (= (size!187 (buf!514 thiss!1486)) (size!187 (buf!514 (_2!417 lt!7664)))))))

(declare-fun b!6002 () Bool)

(declare-fun e!3820 () Bool)

(assert (=> b!6002 (= e!3820 e!3819)))

(declare-fun res!7052 () Bool)

(assert (=> b!6002 (=> (not res!7052) (not e!3819))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!6002 (= res!7052 (invariant!0 (currentBit!1500 (_2!417 lt!7664)) (currentByte!1505 (_2!417 lt!7664)) (size!187 (buf!514 (_2!417 lt!7664)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!435)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!352 array!435 (_ BitVec 64) (_ BitVec 64)) tuple2!790)

(assert (=> b!6002 (= lt!7664 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!6003 () Bool)

(declare-fun res!7051 () Bool)

(declare-fun e!3823 () Bool)

(assert (=> b!6003 (=> res!7051 e!3823)))

(declare-datatypes ((List!87 0))(
  ( (Nil!84) (Cons!83 (h!202 Bool) (t!837 List!87)) )
))
(declare-fun lt!7662 () List!87)

(declare-fun byteArrayBitContentToList!0 (BitStream!352 array!435 (_ BitVec 64) (_ BitVec 64)) List!87)

(assert (=> b!6003 (= res!7051 (not (= lt!7662 (byteArrayBitContentToList!0 (_2!417 lt!7664) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!6004 () Bool)

(declare-fun res!7047 () Bool)

(assert (=> b!6004 (=> (not res!7047) (not e!3820))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6004 (= res!7047 (validate_offset_bits!1 ((_ sign_extend 32) (size!187 (buf!514 thiss!1486))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486)) nBits!460))))

(declare-fun res!7053 () Bool)

(assert (=> start!1316 (=> (not res!7053) (not e!3820))))

(assert (=> start!1316 (= res!7053 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!187 srcBuffer!6))))))))

(assert (=> start!1316 e!3820))

(assert (=> start!1316 true))

(declare-fun array_inv!182 (array!435) Bool)

(assert (=> start!1316 (array_inv!182 srcBuffer!6)))

(declare-fun e!3822 () Bool)

(declare-fun inv!12 (BitStream!352) Bool)

(assert (=> start!1316 (and (inv!12 thiss!1486) e!3822)))

(declare-fun b!6005 () Bool)

(declare-fun res!7049 () Bool)

(assert (=> b!6005 (=> (not res!7049) (not e!3819))))

(declare-fun isPrefixOf!0 (BitStream!352 BitStream!352) Bool)

(assert (=> b!6005 (= res!7049 (isPrefixOf!0 thiss!1486 (_2!417 lt!7664)))))

(declare-fun b!6006 () Bool)

(assert (=> b!6006 (= e!3819 (not e!3823))))

(declare-fun res!7054 () Bool)

(assert (=> b!6006 (=> res!7054 e!3823)))

(declare-datatypes ((tuple2!792 0))(
  ( (tuple2!793 (_1!418 array!435) (_2!418 BitStream!352)) )
))
(declare-fun lt!7666 () tuple2!792)

(assert (=> b!6006 (= res!7054 (not (= (byteArrayBitContentToList!0 (_2!417 lt!7664) (_1!418 lt!7666) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7662)))))

(declare-datatypes ((tuple2!794 0))(
  ( (tuple2!795 (_1!419 BitStream!352) (_2!419 BitStream!352)) )
))
(declare-fun lt!7663 () tuple2!794)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!352 BitStream!352 (_ BitVec 64)) List!87)

(assert (=> b!6006 (= lt!7662 (bitStreamReadBitsIntoList!0 (_2!417 lt!7664) (_1!419 lt!7663) nBits!460))))

(declare-fun readBits!0 (BitStream!352 (_ BitVec 64)) tuple2!792)

(assert (=> b!6006 (= lt!7666 (readBits!0 (_1!419 lt!7663) nBits!460))))

(assert (=> b!6006 (validate_offset_bits!1 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!7664)))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486)) nBits!460)))

(declare-fun lt!7665 () Unit!472)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!352 array!435 (_ BitVec 64)) Unit!472)

(assert (=> b!6006 (= lt!7665 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!514 (_2!417 lt!7664)) nBits!460))))

(declare-fun reader!0 (BitStream!352 BitStream!352) tuple2!794)

(assert (=> b!6006 (= lt!7663 (reader!0 thiss!1486 (_2!417 lt!7664)))))

(declare-fun b!6007 () Bool)

(assert (=> b!6007 (= e!3822 (array_inv!182 (buf!514 thiss!1486)))))

(declare-fun b!6008 () Bool)

(declare-fun e!3824 () Bool)

(assert (=> b!6008 (= e!3824 (invariant!0 (currentBit!1500 thiss!1486) (currentByte!1505 thiss!1486) (size!187 (buf!514 thiss!1486))))))

(declare-fun b!6009 () Bool)

(assert (=> b!6009 (= e!3823 e!3824)))

(declare-fun res!7046 () Bool)

(assert (=> b!6009 (=> res!7046 e!3824)))

(declare-fun checkByteArrayBitContent!0 (BitStream!352 array!435 array!435 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6009 (= res!7046 (not (checkByteArrayBitContent!0 (_2!417 lt!7664) srcBuffer!6 (_1!418 lt!7666) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!7667 () Unit!472)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!352 array!435 array!435 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!472)

(assert (=> b!6009 (= lt!7667 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!417 lt!7664) srcBuffer!6 (_1!418 lt!7666) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!1316 res!7053) b!6004))

(assert (= (and b!6004 res!7047) b!6002))

(assert (= (and b!6002 res!7052) b!6001))

(assert (= (and b!6001 res!7050) b!6000))

(assert (= (and b!6000 res!7048) b!6005))

(assert (= (and b!6005 res!7049) b!6006))

(assert (= (and b!6006 (not res!7054)) b!6003))

(assert (= (and b!6003 (not res!7051)) b!6009))

(assert (= (and b!6009 (not res!7046)) b!6008))

(assert (= start!1316 b!6007))

(declare-fun m!7485 () Bool)

(assert (=> start!1316 m!7485))

(declare-fun m!7487 () Bool)

(assert (=> start!1316 m!7487))

(declare-fun m!7489 () Bool)

(assert (=> b!6003 m!7489))

(declare-fun m!7491 () Bool)

(assert (=> b!6005 m!7491))

(declare-fun m!7493 () Bool)

(assert (=> b!6004 m!7493))

(declare-fun m!7495 () Bool)

(assert (=> b!6002 m!7495))

(declare-fun m!7497 () Bool)

(assert (=> b!6002 m!7497))

(declare-fun m!7499 () Bool)

(assert (=> b!6009 m!7499))

(declare-fun m!7501 () Bool)

(assert (=> b!6009 m!7501))

(declare-fun m!7503 () Bool)

(assert (=> b!6000 m!7503))

(declare-fun m!7505 () Bool)

(assert (=> b!6000 m!7505))

(declare-fun m!7507 () Bool)

(assert (=> b!6008 m!7507))

(declare-fun m!7509 () Bool)

(assert (=> b!6006 m!7509))

(declare-fun m!7511 () Bool)

(assert (=> b!6006 m!7511))

(declare-fun m!7513 () Bool)

(assert (=> b!6006 m!7513))

(declare-fun m!7515 () Bool)

(assert (=> b!6006 m!7515))

(declare-fun m!7517 () Bool)

(assert (=> b!6006 m!7517))

(declare-fun m!7519 () Bool)

(assert (=> b!6006 m!7519))

(declare-fun m!7521 () Bool)

(assert (=> b!6007 m!7521))

(push 1)

(assert (not b!6003))

(assert (not b!6000))

(assert (not b!6008))

(assert (not b!6002))

(assert (not b!6005))

(assert (not b!6009))

(assert (not b!6006))

(assert (not start!1316))

(assert (not b!6004))

(assert (not b!6007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1994 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1994 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!187 (buf!514 thiss!1486))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!187 (buf!514 thiss!1486))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486))) nBits!460))))

(declare-fun bs!719 () Bool)

(assert (= bs!719 d!1994))

(declare-fun m!7599 () Bool)

(assert (=> bs!719 m!7599))

(assert (=> b!6004 d!1994))

(declare-fun d!1998 () Bool)

(declare-fun res!7113 () Bool)

(declare-fun e!3874 () Bool)

(assert (=> d!1998 (=> res!7113 e!3874)))

(assert (=> d!1998 (= res!7113 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!1998 (= (checkByteArrayBitContent!0 (_2!417 lt!7664) srcBuffer!6 (_1!418 lt!7666) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3874)))

(declare-fun b!6080 () Bool)

(declare-fun e!3875 () Bool)

(assert (=> b!6080 (= e!3874 e!3875)))

(declare-fun res!7114 () Bool)

(assert (=> b!6080 (=> (not res!7114) (not e!3875))))

(assert (=> b!6080 (= res!7114 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!583 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!583 (_1!418 lt!7666)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!6081 () Bool)

(assert (=> b!6081 (= e!3875 (checkByteArrayBitContent!0 (_2!417 lt!7664) srcBuffer!6 (_1!418 lt!7666) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!1998 (not res!7113)) b!6080))

(assert (= (and b!6080 res!7114) b!6081))

(declare-fun m!7607 () Bool)

(assert (=> b!6080 m!7607))

(declare-fun m!7609 () Bool)

(assert (=> b!6080 m!7609))

(declare-fun m!7611 () Bool)

(assert (=> b!6080 m!7611))

(declare-fun m!7613 () Bool)

(assert (=> b!6080 m!7613))

(declare-fun m!7615 () Bool)

(assert (=> b!6081 m!7615))

(assert (=> b!6009 d!1998))

(declare-fun d!2004 () Bool)

(assert (=> d!2004 (checkByteArrayBitContent!0 (_2!417 lt!7664) srcBuffer!6 (_1!418 lt!7666) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!7718 () Unit!472)

(declare-fun choose!65 (BitStream!352 array!435 array!435 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!472)

(assert (=> d!2004 (= lt!7718 (choose!65 (_2!417 lt!7664) srcBuffer!6 (_1!418 lt!7666) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2004 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2004 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!417 lt!7664) srcBuffer!6 (_1!418 lt!7666) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!7718)))

(declare-fun bs!720 () Bool)

(assert (= bs!720 d!2004))

(assert (=> bs!720 m!7499))

(declare-fun m!7619 () Bool)

(assert (=> bs!720 m!7619))

(assert (=> b!6009 d!2004))

(declare-fun d!2008 () Bool)

(assert (=> d!2008 (= (array_inv!182 srcBuffer!6) (bvsge (size!187 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!1316 d!2008))

(declare-fun d!2012 () Bool)

(assert (=> d!2012 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1500 thiss!1486) (currentByte!1505 thiss!1486) (size!187 (buf!514 thiss!1486))))))

(declare-fun bs!722 () Bool)

(assert (= bs!722 d!2012))

(assert (=> bs!722 m!7507))

(assert (=> start!1316 d!2012))

(declare-fun d!2018 () Bool)

(declare-fun e!3898 () Bool)

(assert (=> d!2018 e!3898))

(declare-fun res!7147 () Bool)

(assert (=> d!2018 (=> (not res!7147) (not e!3898))))

(declare-fun lt!7747 () (_ BitVec 64))

(declare-fun lt!7745 () (_ BitVec 64))

(declare-fun lt!7744 () (_ BitVec 64))

(assert (=> d!2018 (= res!7147 (= lt!7744 (bvsub lt!7747 lt!7745)))))

(assert (=> d!2018 (or (= (bvand lt!7747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7745 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7747 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7747 lt!7745) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2018 (= lt!7745 (remainingBits!0 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!7664)))) ((_ sign_extend 32) (currentByte!1505 (_2!417 lt!7664))) ((_ sign_extend 32) (currentBit!1500 (_2!417 lt!7664)))))))

(declare-fun lt!7748 () (_ BitVec 64))

(declare-fun lt!7746 () (_ BitVec 64))

(assert (=> d!2018 (= lt!7747 (bvmul lt!7748 lt!7746))))

(assert (=> d!2018 (or (= lt!7748 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!7746 (bvsdiv (bvmul lt!7748 lt!7746) lt!7748)))))

(assert (=> d!2018 (= lt!7746 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2018 (= lt!7748 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!7664)))))))

(assert (=> d!2018 (= lt!7744 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1505 (_2!417 lt!7664))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1500 (_2!417 lt!7664)))))))

(assert (=> d!2018 (invariant!0 (currentBit!1500 (_2!417 lt!7664)) (currentByte!1505 (_2!417 lt!7664)) (size!187 (buf!514 (_2!417 lt!7664))))))

(assert (=> d!2018 (= (bitIndex!0 (size!187 (buf!514 (_2!417 lt!7664))) (currentByte!1505 (_2!417 lt!7664)) (currentBit!1500 (_2!417 lt!7664))) lt!7744)))

(declare-fun b!6113 () Bool)

(declare-fun res!7146 () Bool)

(assert (=> b!6113 (=> (not res!7146) (not e!3898))))

(assert (=> b!6113 (= res!7146 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!7744))))

(declare-fun b!6114 () Bool)

(declare-fun lt!7743 () (_ BitVec 64))

(assert (=> b!6114 (= e!3898 (bvsle lt!7744 (bvmul lt!7743 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!6114 (or (= lt!7743 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!7743 #b0000000000000000000000000000000000000000000000000000000000001000) lt!7743)))))

(assert (=> b!6114 (= lt!7743 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!7664)))))))

(assert (= (and d!2018 res!7147) b!6113))

(assert (= (and b!6113 res!7146) b!6114))

(declare-fun m!7635 () Bool)

(assert (=> d!2018 m!7635))

(assert (=> d!2018 m!7495))

(assert (=> b!6000 d!2018))

(declare-fun d!2028 () Bool)

(declare-fun e!3901 () Bool)

(assert (=> d!2028 e!3901))

(declare-fun res!7151 () Bool)

(assert (=> d!2028 (=> (not res!7151) (not e!3901))))

(declare-fun lt!7750 () (_ BitVec 64))

(declare-fun lt!7751 () (_ BitVec 64))

(declare-fun lt!7753 () (_ BitVec 64))

(assert (=> d!2028 (= res!7151 (= lt!7750 (bvsub lt!7753 lt!7751)))))

(assert (=> d!2028 (or (= (bvand lt!7753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7751 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7753 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7753 lt!7751) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2028 (= lt!7751 (remainingBits!0 ((_ sign_extend 32) (size!187 (buf!514 thiss!1486))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486))))))

(declare-fun lt!7754 () (_ BitVec 64))

(declare-fun lt!7752 () (_ BitVec 64))

(assert (=> d!2028 (= lt!7753 (bvmul lt!7754 lt!7752))))

(assert (=> d!2028 (or (= lt!7754 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!7752 (bvsdiv (bvmul lt!7754 lt!7752) lt!7754)))))

(assert (=> d!2028 (= lt!7752 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!2028 (= lt!7754 ((_ sign_extend 32) (size!187 (buf!514 thiss!1486))))))

(assert (=> d!2028 (= lt!7750 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1505 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1500 thiss!1486))))))

(assert (=> d!2028 (invariant!0 (currentBit!1500 thiss!1486) (currentByte!1505 thiss!1486) (size!187 (buf!514 thiss!1486)))))

(assert (=> d!2028 (= (bitIndex!0 (size!187 (buf!514 thiss!1486)) (currentByte!1505 thiss!1486) (currentBit!1500 thiss!1486)) lt!7750)))

(declare-fun b!6117 () Bool)

(declare-fun res!7150 () Bool)

(assert (=> b!6117 (=> (not res!7150) (not e!3901))))

(assert (=> b!6117 (= res!7150 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!7750))))

(declare-fun b!6118 () Bool)

(declare-fun lt!7749 () (_ BitVec 64))

(assert (=> b!6118 (= e!3901 (bvsle lt!7750 (bvmul lt!7749 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!6118 (or (= lt!7749 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!7749 #b0000000000000000000000000000000000000000000000000000000000001000) lt!7749)))))

(assert (=> b!6118 (= lt!7749 ((_ sign_extend 32) (size!187 (buf!514 thiss!1486))))))

(assert (= (and d!2028 res!7151) b!6117))

(assert (= (and b!6117 res!7150) b!6118))

(assert (=> d!2028 m!7599))

(assert (=> d!2028 m!7507))

(assert (=> b!6000 d!2028))

(declare-fun d!2032 () Bool)

(declare-fun res!7160 () Bool)

(declare-fun e!3906 () Bool)

(assert (=> d!2032 (=> (not res!7160) (not e!3906))))

(assert (=> d!2032 (= res!7160 (= (size!187 (buf!514 thiss!1486)) (size!187 (buf!514 (_2!417 lt!7664)))))))

(assert (=> d!2032 (= (isPrefixOf!0 thiss!1486 (_2!417 lt!7664)) e!3906)))

(declare-fun b!6125 () Bool)

(declare-fun res!7159 () Bool)

(assert (=> b!6125 (=> (not res!7159) (not e!3906))))

(assert (=> b!6125 (= res!7159 (bvsle (bitIndex!0 (size!187 (buf!514 thiss!1486)) (currentByte!1505 thiss!1486) (currentBit!1500 thiss!1486)) (bitIndex!0 (size!187 (buf!514 (_2!417 lt!7664))) (currentByte!1505 (_2!417 lt!7664)) (currentBit!1500 (_2!417 lt!7664)))))))

(declare-fun b!6126 () Bool)

(declare-fun e!3907 () Bool)

(assert (=> b!6126 (= e!3906 e!3907)))

(declare-fun res!7158 () Bool)

(assert (=> b!6126 (=> res!7158 e!3907)))

(assert (=> b!6126 (= res!7158 (= (size!187 (buf!514 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!6127 () Bool)

(declare-fun arrayBitRangesEq!0 (array!435 array!435 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!6127 (= e!3907 (arrayBitRangesEq!0 (buf!514 thiss!1486) (buf!514 (_2!417 lt!7664)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!187 (buf!514 thiss!1486)) (currentByte!1505 thiss!1486) (currentBit!1500 thiss!1486))))))

(assert (= (and d!2032 res!7160) b!6125))

(assert (= (and b!6125 res!7159) b!6126))

(assert (= (and b!6126 (not res!7158)) b!6127))

(assert (=> b!6125 m!7505))

(assert (=> b!6125 m!7503))

(assert (=> b!6127 m!7505))

(assert (=> b!6127 m!7505))

(declare-fun m!7647 () Bool)

(assert (=> b!6127 m!7647))

(assert (=> b!6005 d!2032))

(declare-fun d!2048 () Bool)

(assert (=> d!2048 (= (array_inv!182 (buf!514 thiss!1486)) (bvsge (size!187 (buf!514 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!6007 d!2048))

(declare-fun b!6161 () Bool)

(declare-fun e!3925 () Unit!472)

(declare-fun lt!7839 () Unit!472)

(assert (=> b!6161 (= e!3925 lt!7839)))

(declare-fun lt!7840 () (_ BitVec 64))

(assert (=> b!6161 (= lt!7840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!7828 () (_ BitVec 64))

(assert (=> b!6161 (= lt!7828 (bitIndex!0 (size!187 (buf!514 thiss!1486)) (currentByte!1505 thiss!1486) (currentBit!1500 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!435 array!435 (_ BitVec 64) (_ BitVec 64)) Unit!472)

(assert (=> b!6161 (= lt!7839 (arrayBitRangesEqSymmetric!0 (buf!514 thiss!1486) (buf!514 (_2!417 lt!7664)) lt!7840 lt!7828))))

(assert (=> b!6161 (arrayBitRangesEq!0 (buf!514 (_2!417 lt!7664)) (buf!514 thiss!1486) lt!7840 lt!7828)))

(declare-fun d!2050 () Bool)

(declare-fun e!3926 () Bool)

(assert (=> d!2050 e!3926))

(declare-fun res!7184 () Bool)

(assert (=> d!2050 (=> (not res!7184) (not e!3926))))

(declare-fun lt!7837 () tuple2!794)

(assert (=> d!2050 (= res!7184 (isPrefixOf!0 (_1!419 lt!7837) (_2!419 lt!7837)))))

(declare-fun lt!7832 () BitStream!352)

(assert (=> d!2050 (= lt!7837 (tuple2!795 lt!7832 (_2!417 lt!7664)))))

(declare-fun lt!7841 () Unit!472)

(declare-fun lt!7833 () Unit!472)

(assert (=> d!2050 (= lt!7841 lt!7833)))

(assert (=> d!2050 (isPrefixOf!0 lt!7832 (_2!417 lt!7664))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!352 BitStream!352 BitStream!352) Unit!472)

(assert (=> d!2050 (= lt!7833 (lemmaIsPrefixTransitive!0 lt!7832 (_2!417 lt!7664) (_2!417 lt!7664)))))

(declare-fun lt!7825 () Unit!472)

(declare-fun lt!7842 () Unit!472)

(assert (=> d!2050 (= lt!7825 lt!7842)))

(assert (=> d!2050 (isPrefixOf!0 lt!7832 (_2!417 lt!7664))))

(assert (=> d!2050 (= lt!7842 (lemmaIsPrefixTransitive!0 lt!7832 thiss!1486 (_2!417 lt!7664)))))

(declare-fun lt!7827 () Unit!472)

(assert (=> d!2050 (= lt!7827 e!3925)))

(declare-fun c!302 () Bool)

(assert (=> d!2050 (= c!302 (not (= (size!187 (buf!514 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!7830 () Unit!472)

(declare-fun lt!7829 () Unit!472)

(assert (=> d!2050 (= lt!7830 lt!7829)))

(assert (=> d!2050 (isPrefixOf!0 (_2!417 lt!7664) (_2!417 lt!7664))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!352) Unit!472)

(assert (=> d!2050 (= lt!7829 (lemmaIsPrefixRefl!0 (_2!417 lt!7664)))))

(declare-fun lt!7835 () Unit!472)

(declare-fun lt!7831 () Unit!472)

(assert (=> d!2050 (= lt!7835 lt!7831)))

(assert (=> d!2050 (= lt!7831 (lemmaIsPrefixRefl!0 (_2!417 lt!7664)))))

(declare-fun lt!7826 () Unit!472)

(declare-fun lt!7834 () Unit!472)

(assert (=> d!2050 (= lt!7826 lt!7834)))

(assert (=> d!2050 (isPrefixOf!0 lt!7832 lt!7832)))

(assert (=> d!2050 (= lt!7834 (lemmaIsPrefixRefl!0 lt!7832))))

(declare-fun lt!7836 () Unit!472)

(declare-fun lt!7843 () Unit!472)

(assert (=> d!2050 (= lt!7836 lt!7843)))

(assert (=> d!2050 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2050 (= lt!7843 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2050 (= lt!7832 (BitStream!353 (buf!514 (_2!417 lt!7664)) (currentByte!1505 thiss!1486) (currentBit!1500 thiss!1486)))))

(assert (=> d!2050 (isPrefixOf!0 thiss!1486 (_2!417 lt!7664))))

(assert (=> d!2050 (= (reader!0 thiss!1486 (_2!417 lt!7664)) lt!7837)))

(declare-fun b!6162 () Bool)

(declare-fun Unit!478 () Unit!472)

(assert (=> b!6162 (= e!3925 Unit!478)))

(declare-fun b!6163 () Bool)

(declare-fun res!7185 () Bool)

(assert (=> b!6163 (=> (not res!7185) (not e!3926))))

(assert (=> b!6163 (= res!7185 (isPrefixOf!0 (_2!419 lt!7837) (_2!417 lt!7664)))))

(declare-fun b!6164 () Bool)

(declare-fun res!7186 () Bool)

(assert (=> b!6164 (=> (not res!7186) (not e!3926))))

(assert (=> b!6164 (= res!7186 (isPrefixOf!0 (_1!419 lt!7837) thiss!1486))))

(declare-fun b!6165 () Bool)

(declare-fun lt!7844 () (_ BitVec 64))

(declare-fun lt!7838 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!352 (_ BitVec 64)) BitStream!352)

(assert (=> b!6165 (= e!3926 (= (_1!419 lt!7837) (withMovedBitIndex!0 (_2!419 lt!7837) (bvsub lt!7844 lt!7838))))))

(assert (=> b!6165 (or (= (bvand lt!7844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7838 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7844 lt!7838) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6165 (= lt!7838 (bitIndex!0 (size!187 (buf!514 (_2!417 lt!7664))) (currentByte!1505 (_2!417 lt!7664)) (currentBit!1500 (_2!417 lt!7664))))))

(assert (=> b!6165 (= lt!7844 (bitIndex!0 (size!187 (buf!514 thiss!1486)) (currentByte!1505 thiss!1486) (currentBit!1500 thiss!1486)))))

(assert (= (and d!2050 c!302) b!6161))

(assert (= (and d!2050 (not c!302)) b!6162))

(assert (= (and d!2050 res!7184) b!6164))

(assert (= (and b!6164 res!7186) b!6163))

(assert (= (and b!6163 res!7185) b!6165))

(declare-fun m!7657 () Bool)

(assert (=> b!6163 m!7657))

(assert (=> b!6161 m!7505))

(declare-fun m!7659 () Bool)

(assert (=> b!6161 m!7659))

(declare-fun m!7661 () Bool)

(assert (=> b!6161 m!7661))

(declare-fun m!7663 () Bool)

(assert (=> d!2050 m!7663))

(declare-fun m!7665 () Bool)

(assert (=> d!2050 m!7665))

(declare-fun m!7667 () Bool)

(assert (=> d!2050 m!7667))

(declare-fun m!7669 () Bool)

(assert (=> d!2050 m!7669))

(declare-fun m!7671 () Bool)

(assert (=> d!2050 m!7671))

(declare-fun m!7673 () Bool)

(assert (=> d!2050 m!7673))

(declare-fun m!7675 () Bool)

(assert (=> d!2050 m!7675))

(declare-fun m!7677 () Bool)

(assert (=> d!2050 m!7677))

(declare-fun m!7679 () Bool)

(assert (=> d!2050 m!7679))

(declare-fun m!7681 () Bool)

(assert (=> d!2050 m!7681))

(assert (=> d!2050 m!7491))

(declare-fun m!7683 () Bool)

(assert (=> b!6164 m!7683))

(declare-fun m!7685 () Bool)

(assert (=> b!6165 m!7685))

(assert (=> b!6165 m!7503))

(assert (=> b!6165 m!7505))

(assert (=> b!6006 d!2050))

(declare-fun lt!7852 () (_ BitVec 64))

(declare-datatypes ((tuple2!808 0))(
  ( (tuple2!809 (_1!426 Bool) (_2!426 BitStream!352)) )
))
(declare-fun lt!7851 () tuple2!808)

(declare-datatypes ((tuple2!810 0))(
  ( (tuple2!811 (_1!427 List!87) (_2!427 BitStream!352)) )
))
(declare-fun e!3931 () tuple2!810)

(declare-fun b!6175 () Bool)

(assert (=> b!6175 (= e!3931 (tuple2!811 (Cons!83 (_1!426 lt!7851) (bitStreamReadBitsIntoList!0 (_2!417 lt!7664) (_2!426 lt!7851) (bvsub nBits!460 lt!7852))) (_2!426 lt!7851)))))

(declare-fun readBit!0 (BitStream!352) tuple2!808)

(assert (=> b!6175 (= lt!7851 (readBit!0 (_1!419 lt!7663)))))

(assert (=> b!6175 (= lt!7852 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!6176 () Bool)

(declare-fun e!3932 () Bool)

(declare-fun lt!7853 () List!87)

(declare-fun isEmpty!16 (List!87) Bool)

(assert (=> b!6176 (= e!3932 (isEmpty!16 lt!7853))))

(declare-fun b!6174 () Bool)

(assert (=> b!6174 (= e!3931 (tuple2!811 Nil!84 (_1!419 lt!7663)))))

(declare-fun d!2066 () Bool)

(assert (=> d!2066 e!3932))

(declare-fun c!308 () Bool)

(assert (=> d!2066 (= c!308 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2066 (= lt!7853 (_1!427 e!3931))))

(declare-fun c!307 () Bool)

(assert (=> d!2066 (= c!307 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!2066 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2066 (= (bitStreamReadBitsIntoList!0 (_2!417 lt!7664) (_1!419 lt!7663) nBits!460) lt!7853)))

(declare-fun b!6177 () Bool)

(declare-fun length!11 (List!87) Int)

(assert (=> b!6177 (= e!3932 (> (length!11 lt!7853) 0))))

(assert (= (and d!2066 c!307) b!6174))

(assert (= (and d!2066 (not c!307)) b!6175))

(assert (= (and d!2066 c!308) b!6176))

(assert (= (and d!2066 (not c!308)) b!6177))

(declare-fun m!7687 () Bool)

(assert (=> b!6175 m!7687))

(declare-fun m!7689 () Bool)

(assert (=> b!6175 m!7689))

(declare-fun m!7691 () Bool)

(assert (=> b!6176 m!7691))

(declare-fun m!7693 () Bool)

(assert (=> b!6177 m!7693))

(assert (=> b!6006 d!2066))

(declare-fun d!2068 () Bool)

(declare-fun c!311 () Bool)

(assert (=> d!2068 (= c!311 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3935 () List!87)

(assert (=> d!2068 (= (byteArrayBitContentToList!0 (_2!417 lt!7664) (_1!418 lt!7666) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!3935)))

(declare-fun b!6182 () Bool)

(assert (=> b!6182 (= e!3935 Nil!84)))

(declare-fun b!6183 () Bool)

(assert (=> b!6183 (= e!3935 (Cons!83 (not (= (bvand ((_ sign_extend 24) (select (arr!583 (_1!418 lt!7666)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!417 lt!7664) (_1!418 lt!7666) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2068 c!311) b!6182))

(assert (= (and d!2068 (not c!311)) b!6183))

(assert (=> b!6183 m!7611))

(assert (=> b!6183 m!7613))

(declare-fun m!7695 () Bool)

(assert (=> b!6183 m!7695))

(assert (=> b!6006 d!2068))

(declare-fun d!2070 () Bool)

(assert (=> d!2070 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!7664)))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!7664)))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486))) nBits!460))))

(declare-fun bs!728 () Bool)

(assert (= bs!728 d!2070))

(declare-fun m!7697 () Bool)

(assert (=> bs!728 m!7697))

(assert (=> b!6006 d!2070))

(declare-fun d!2072 () Bool)

(assert (=> d!2072 (validate_offset_bits!1 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!7664)))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486)) nBits!460)))

(declare-fun lt!7856 () Unit!472)

(declare-fun choose!9 (BitStream!352 array!435 (_ BitVec 64) BitStream!352) Unit!472)

(assert (=> d!2072 (= lt!7856 (choose!9 thiss!1486 (buf!514 (_2!417 lt!7664)) nBits!460 (BitStream!353 (buf!514 (_2!417 lt!7664)) (currentByte!1505 thiss!1486) (currentBit!1500 thiss!1486))))))

(assert (=> d!2072 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!514 (_2!417 lt!7664)) nBits!460) lt!7856)))

(declare-fun bs!729 () Bool)

(assert (= bs!729 d!2072))

(assert (=> bs!729 m!7509))

(declare-fun m!7699 () Bool)

(assert (=> bs!729 m!7699))

(assert (=> b!6006 d!2072))

(declare-fun b!6194 () Bool)

(declare-fun res!7201 () Bool)

(declare-fun e!3938 () Bool)

(assert (=> b!6194 (=> (not res!7201) (not e!3938))))

(declare-fun lt!7878 () tuple2!792)

(assert (=> b!6194 (= res!7201 (bvsle (currentByte!1505 (_1!419 lt!7663)) (currentByte!1505 (_2!418 lt!7878))))))

(declare-fun b!6195 () Bool)

(declare-fun res!7197 () Bool)

(assert (=> b!6195 (=> (not res!7197) (not e!3938))))

(declare-fun lt!7880 () (_ BitVec 64))

(assert (=> b!6195 (= res!7197 (= (bvadd lt!7880 nBits!460) (bitIndex!0 (size!187 (buf!514 (_2!418 lt!7878))) (currentByte!1505 (_2!418 lt!7878)) (currentBit!1500 (_2!418 lt!7878)))))))

(assert (=> b!6195 (or (not (= (bvand lt!7880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!7880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!7880 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6195 (= lt!7880 (bitIndex!0 (size!187 (buf!514 (_1!419 lt!7663))) (currentByte!1505 (_1!419 lt!7663)) (currentBit!1500 (_1!419 lt!7663))))))

(declare-fun b!6196 () Bool)

(declare-fun res!7200 () Bool)

(assert (=> b!6196 (=> (not res!7200) (not e!3938))))

(declare-fun lt!7881 () (_ BitVec 64))

(assert (=> b!6196 (= res!7200 (= (size!187 (_1!418 lt!7878)) ((_ extract 31 0) lt!7881)))))

(assert (=> b!6196 (and (bvslt lt!7881 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!7881 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!7879 () (_ BitVec 64))

(declare-fun lt!7882 () (_ BitVec 64))

(assert (=> b!6196 (= lt!7881 (bvsdiv lt!7879 lt!7882))))

(assert (=> b!6196 (and (not (= lt!7882 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!7879 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!7882 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!6196 (= lt!7882 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!7875 () (_ BitVec 64))

(declare-fun lt!7876 () (_ BitVec 64))

(assert (=> b!6196 (= lt!7879 (bvsub lt!7875 lt!7876))))

(assert (=> b!6196 (or (= (bvand lt!7875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7876 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!7875 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!7875 lt!7876) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6196 (= lt!7876 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!7877 () (_ BitVec 64))

(assert (=> b!6196 (= lt!7875 (bvadd nBits!460 lt!7877))))

(assert (=> b!6196 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!7877 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!7877) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6196 (= lt!7877 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun d!2074 () Bool)

(assert (=> d!2074 e!3938))

(declare-fun res!7198 () Bool)

(assert (=> d!2074 (=> (not res!7198) (not e!3938))))

(assert (=> d!2074 (= res!7198 (= (buf!514 (_2!418 lt!7878)) (buf!514 (_1!419 lt!7663))))))

(declare-datatypes ((tuple3!44 0))(
  ( (tuple3!45 (_1!428 Unit!472) (_2!428 BitStream!352) (_3!22 array!435)) )
))
(declare-fun lt!7883 () tuple3!44)

(assert (=> d!2074 (= lt!7878 (tuple2!793 (_3!22 lt!7883) (_2!428 lt!7883)))))

(declare-fun readBitsLoop!0 (BitStream!352 (_ BitVec 64) array!435 (_ BitVec 64) (_ BitVec 64)) tuple3!44)

(assert (=> d!2074 (= lt!7883 (readBitsLoop!0 (_1!419 lt!7663) nBits!460 (array!436 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!2074 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!2074 (= (readBits!0 (_1!419 lt!7663) nBits!460) lt!7878)))

(declare-fun b!6197 () Bool)

(assert (=> b!6197 (= e!3938 (= (byteArrayBitContentToList!0 (_2!418 lt!7878) (_1!418 lt!7878) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!418 lt!7878) (_1!419 lt!7663) nBits!460)))))

(declare-fun b!6198 () Bool)

(declare-fun res!7199 () Bool)

(assert (=> b!6198 (=> (not res!7199) (not e!3938))))

(assert (=> b!6198 (= res!7199 (invariant!0 (currentBit!1500 (_2!418 lt!7878)) (currentByte!1505 (_2!418 lt!7878)) (size!187 (buf!514 (_2!418 lt!7878)))))))

(assert (= (and d!2074 res!7198) b!6195))

(assert (= (and b!6195 res!7197) b!6198))

(assert (= (and b!6198 res!7199) b!6196))

(assert (= (and b!6196 res!7200) b!6194))

(assert (= (and b!6194 res!7201) b!6197))

(declare-fun m!7701 () Bool)

(assert (=> b!6195 m!7701))

(declare-fun m!7703 () Bool)

(assert (=> b!6195 m!7703))

(declare-fun m!7705 () Bool)

(assert (=> d!2074 m!7705))

(declare-fun m!7707 () Bool)

(assert (=> b!6197 m!7707))

(declare-fun m!7709 () Bool)

(assert (=> b!6197 m!7709))

(declare-fun m!7711 () Bool)

(assert (=> b!6198 m!7711))

(assert (=> b!6006 d!2074))

(declare-fun d!2076 () Bool)

(declare-fun c!312 () Bool)

(assert (=> d!2076 (= c!312 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!3939 () List!87)

(assert (=> d!2076 (= (byteArrayBitContentToList!0 (_2!417 lt!7664) srcBuffer!6 from!367 nBits!460) e!3939)))

(declare-fun b!6199 () Bool)

(assert (=> b!6199 (= e!3939 Nil!84)))

(declare-fun b!6200 () Bool)

(assert (=> b!6200 (= e!3939 (Cons!83 (not (= (bvand ((_ sign_extend 24) (select (arr!583 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!417 lt!7664) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!2076 c!312) b!6199))

(assert (= (and d!2076 (not c!312)) b!6200))

(assert (=> b!6200 m!7607))

(assert (=> b!6200 m!7609))

(declare-fun m!7713 () Bool)

(assert (=> b!6200 m!7713))

(assert (=> b!6003 d!2076))

(declare-fun d!2078 () Bool)

(assert (=> d!2078 (= (invariant!0 (currentBit!1500 thiss!1486) (currentByte!1505 thiss!1486) (size!187 (buf!514 thiss!1486))) (and (bvsge (currentBit!1500 thiss!1486) #b00000000000000000000000000000000) (bvslt (currentBit!1500 thiss!1486) #b00000000000000000000000000001000) (bvsge (currentByte!1505 thiss!1486) #b00000000000000000000000000000000) (or (bvslt (currentByte!1505 thiss!1486) (size!187 (buf!514 thiss!1486))) (and (= (currentBit!1500 thiss!1486) #b00000000000000000000000000000000) (= (currentByte!1505 thiss!1486) (size!187 (buf!514 thiss!1486)))))))))

(assert (=> b!6008 d!2078))

(declare-fun d!2080 () Bool)

(assert (=> d!2080 (= (invariant!0 (currentBit!1500 (_2!417 lt!7664)) (currentByte!1505 (_2!417 lt!7664)) (size!187 (buf!514 (_2!417 lt!7664)))) (and (bvsge (currentBit!1500 (_2!417 lt!7664)) #b00000000000000000000000000000000) (bvslt (currentBit!1500 (_2!417 lt!7664)) #b00000000000000000000000000001000) (bvsge (currentByte!1505 (_2!417 lt!7664)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1505 (_2!417 lt!7664)) (size!187 (buf!514 (_2!417 lt!7664)))) (and (= (currentBit!1500 (_2!417 lt!7664)) #b00000000000000000000000000000000) (= (currentByte!1505 (_2!417 lt!7664)) (size!187 (buf!514 (_2!417 lt!7664))))))))))

(assert (=> b!6002 d!2080))

(declare-fun b!6314 () Bool)

(declare-fun res!7291 () Bool)

(declare-fun e!3978 () Bool)

(assert (=> b!6314 (=> (not res!7291) (not e!3978))))

(declare-fun lt!8375 () tuple2!790)

(assert (=> b!6314 (= res!7291 (isPrefixOf!0 thiss!1486 (_2!417 lt!8375)))))

(declare-fun bm!71 () Bool)

(declare-fun call!74 () tuple2!794)

(declare-fun c!326 () Bool)

(declare-fun lt!8371 () tuple2!790)

(assert (=> bm!71 (= call!74 (reader!0 thiss!1486 (ite c!326 (_2!417 lt!8371) thiss!1486)))))

(declare-fun b!6315 () Bool)

(declare-fun e!3979 () tuple2!790)

(declare-fun Unit!493 () Unit!472)

(assert (=> b!6315 (= e!3979 (tuple2!791 Unit!493 thiss!1486))))

(assert (=> b!6315 (= (size!187 (buf!514 thiss!1486)) (size!187 (buf!514 thiss!1486)))))

(declare-fun lt!8370 () Unit!472)

(declare-fun Unit!494 () Unit!472)

(assert (=> b!6315 (= lt!8370 Unit!494)))

(assert (=> b!6315 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!418 (readBits!0 (_1!419 call!74) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!6316 () Bool)

(declare-fun e!3980 () Bool)

(declare-fun lt!8376 () (_ BitVec 64))

(assert (=> b!6316 (= e!3980 (validate_offset_bits!1 ((_ sign_extend 32) (size!187 (buf!514 thiss!1486))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486)) lt!8376))))

(declare-fun b!6317 () Bool)

(declare-fun res!7293 () Bool)

(assert (=> b!6317 (=> (not res!7293) (not e!3978))))

(assert (=> b!6317 (= res!7293 (= (size!187 (buf!514 (_2!417 lt!8375))) (size!187 (buf!514 thiss!1486))))))

(declare-fun b!6318 () Bool)

(declare-fun res!7294 () Bool)

(assert (=> b!6318 (=> (not res!7294) (not e!3978))))

(assert (=> b!6318 (= res!7294 (invariant!0 (currentBit!1500 (_2!417 lt!8375)) (currentByte!1505 (_2!417 lt!8375)) (size!187 (buf!514 (_2!417 lt!8375)))))))

(declare-fun b!6319 () Bool)

(declare-fun res!7289 () Bool)

(assert (=> b!6319 (=> (not res!7289) (not e!3978))))

(assert (=> b!6319 (= res!7289 (= (size!187 (buf!514 thiss!1486)) (size!187 (buf!514 (_2!417 lt!8375)))))))

(declare-fun b!6320 () Bool)

(declare-fun lt!8403 () tuple2!790)

(declare-fun Unit!495 () Unit!472)

(assert (=> b!6320 (= e!3979 (tuple2!791 Unit!495 (_2!417 lt!8403)))))

(declare-fun appendBitFromByte!0 (BitStream!352 (_ BitVec 8) (_ BitVec 32)) tuple2!790)

(assert (=> b!6320 (= lt!8371 (appendBitFromByte!0 thiss!1486 (select (arr!583 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!8358 () (_ BitVec 64))

(assert (=> b!6320 (= lt!8358 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!8366 () (_ BitVec 64))

(assert (=> b!6320 (= lt!8366 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!8372 () Unit!472)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!352 BitStream!352 (_ BitVec 64) (_ BitVec 64)) Unit!472)

(assert (=> b!6320 (= lt!8372 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!417 lt!8371) lt!8358 lt!8366))))

(assert (=> b!6320 (validate_offset_bits!1 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!8371)))) ((_ sign_extend 32) (currentByte!1505 (_2!417 lt!8371))) ((_ sign_extend 32) (currentBit!1500 (_2!417 lt!8371))) (bvsub lt!8358 lt!8366))))

(declare-fun lt!8388 () Unit!472)

(assert (=> b!6320 (= lt!8388 lt!8372)))

(declare-fun lt!8383 () tuple2!794)

(assert (=> b!6320 (= lt!8383 call!74)))

(declare-fun lt!8389 () (_ BitVec 64))

(assert (=> b!6320 (= lt!8389 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!8396 () Unit!472)

(assert (=> b!6320 (= lt!8396 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!514 (_2!417 lt!8371)) lt!8389))))

(assert (=> b!6320 (validate_offset_bits!1 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!8371)))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486)) lt!8389)))

(declare-fun lt!8390 () Unit!472)

(assert (=> b!6320 (= lt!8390 lt!8396)))

(declare-fun head!28 (List!87) Bool)

(assert (=> b!6320 (= (head!28 (byteArrayBitContentToList!0 (_2!417 lt!8371) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!28 (bitStreamReadBitsIntoList!0 (_2!417 lt!8371) (_1!419 lt!8383) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!8399 () Unit!472)

(declare-fun Unit!496 () Unit!472)

(assert (=> b!6320 (= lt!8399 Unit!496)))

(assert (=> b!6320 (= lt!8403 (appendBitsMSBFirstLoop!0 (_2!417 lt!8371) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!8392 () Unit!472)

(assert (=> b!6320 (= lt!8392 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!417 lt!8371) (_2!417 lt!8403)))))

(assert (=> b!6320 (isPrefixOf!0 thiss!1486 (_2!417 lt!8403))))

(declare-fun lt!8357 () Unit!472)

(assert (=> b!6320 (= lt!8357 lt!8392)))

(assert (=> b!6320 (= (size!187 (buf!514 (_2!417 lt!8403))) (size!187 (buf!514 thiss!1486)))))

(declare-fun lt!8400 () Unit!472)

(declare-fun Unit!497 () Unit!472)

(assert (=> b!6320 (= lt!8400 Unit!497)))

(assert (=> b!6320 (= (bitIndex!0 (size!187 (buf!514 (_2!417 lt!8403))) (currentByte!1505 (_2!417 lt!8403)) (currentBit!1500 (_2!417 lt!8403))) (bvsub (bvadd (bitIndex!0 (size!187 (buf!514 thiss!1486)) (currentByte!1505 thiss!1486) (currentBit!1500 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!8368 () Unit!472)

(declare-fun Unit!498 () Unit!472)

(assert (=> b!6320 (= lt!8368 Unit!498)))

(assert (=> b!6320 (= (bitIndex!0 (size!187 (buf!514 (_2!417 lt!8403))) (currentByte!1505 (_2!417 lt!8403)) (currentBit!1500 (_2!417 lt!8403))) (bvsub (bvsub (bvadd (bitIndex!0 (size!187 (buf!514 (_2!417 lt!8371))) (currentByte!1505 (_2!417 lt!8371)) (currentBit!1500 (_2!417 lt!8371))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!8360 () Unit!472)

(declare-fun Unit!499 () Unit!472)

(assert (=> b!6320 (= lt!8360 Unit!499)))

(declare-fun lt!8402 () tuple2!794)

(assert (=> b!6320 (= lt!8402 (reader!0 thiss!1486 (_2!417 lt!8403)))))

(declare-fun lt!8393 () (_ BitVec 64))

(assert (=> b!6320 (= lt!8393 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!8361 () Unit!472)

(assert (=> b!6320 (= lt!8361 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!514 (_2!417 lt!8403)) lt!8393))))

(assert (=> b!6320 (validate_offset_bits!1 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!8403)))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486)) lt!8393)))

(declare-fun lt!8362 () Unit!472)

(assert (=> b!6320 (= lt!8362 lt!8361)))

(declare-fun lt!8394 () tuple2!794)

(assert (=> b!6320 (= lt!8394 (reader!0 (_2!417 lt!8371) (_2!417 lt!8403)))))

(declare-fun lt!8367 () (_ BitVec 64))

(assert (=> b!6320 (= lt!8367 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!8391 () Unit!472)

(assert (=> b!6320 (= lt!8391 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!417 lt!8371) (buf!514 (_2!417 lt!8403)) lt!8367))))

(assert (=> b!6320 (validate_offset_bits!1 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!8403)))) ((_ sign_extend 32) (currentByte!1505 (_2!417 lt!8371))) ((_ sign_extend 32) (currentBit!1500 (_2!417 lt!8371))) lt!8367)))

(declare-fun lt!8395 () Unit!472)

(assert (=> b!6320 (= lt!8395 lt!8391)))

(declare-fun lt!8378 () List!87)

(assert (=> b!6320 (= lt!8378 (byteArrayBitContentToList!0 (_2!417 lt!8403) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!8387 () List!87)

(assert (=> b!6320 (= lt!8387 (byteArrayBitContentToList!0 (_2!417 lt!8403) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!8363 () List!87)

(assert (=> b!6320 (= lt!8363 (bitStreamReadBitsIntoList!0 (_2!417 lt!8403) (_1!419 lt!8402) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!8365 () List!87)

(assert (=> b!6320 (= lt!8365 (bitStreamReadBitsIntoList!0 (_2!417 lt!8403) (_1!419 lt!8394) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!8401 () (_ BitVec 64))

(assert (=> b!6320 (= lt!8401 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!8364 () Unit!472)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!352 BitStream!352 BitStream!352 BitStream!352 (_ BitVec 64) List!87) Unit!472)

(assert (=> b!6320 (= lt!8364 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!417 lt!8403) (_2!417 lt!8403) (_1!419 lt!8402) (_1!419 lt!8394) lt!8401 lt!8363))))

(declare-fun tail!36 (List!87) List!87)

(assert (=> b!6320 (= (bitStreamReadBitsIntoList!0 (_2!417 lt!8403) (_1!419 lt!8394) (bvsub lt!8401 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!36 lt!8363))))

(declare-fun lt!8374 () Unit!472)

(assert (=> b!6320 (= lt!8374 lt!8364)))

(declare-fun lt!8373 () (_ BitVec 64))

(declare-fun lt!8380 () Unit!472)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!435 array!435 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!472)

(assert (=> b!6320 (= lt!8380 (arrayBitRangesEqImpliesEq!0 (buf!514 (_2!417 lt!8371)) (buf!514 (_2!417 lt!8403)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!8373 (bitIndex!0 (size!187 (buf!514 (_2!417 lt!8371))) (currentByte!1505 (_2!417 lt!8371)) (currentBit!1500 (_2!417 lt!8371)))))))

(declare-fun bitAt!0 (array!435 (_ BitVec 64)) Bool)

(assert (=> b!6320 (= (bitAt!0 (buf!514 (_2!417 lt!8371)) lt!8373) (bitAt!0 (buf!514 (_2!417 lt!8403)) lt!8373))))

(declare-fun lt!8377 () Unit!472)

(assert (=> b!6320 (= lt!8377 lt!8380)))

(declare-fun d!2082 () Bool)

(assert (=> d!2082 e!3978))

(declare-fun res!7290 () Bool)

(assert (=> d!2082 (=> (not res!7290) (not e!3978))))

(declare-fun lt!8379 () (_ BitVec 64))

(assert (=> d!2082 (= res!7290 (= (bitIndex!0 (size!187 (buf!514 (_2!417 lt!8375))) (currentByte!1505 (_2!417 lt!8375)) (currentBit!1500 (_2!417 lt!8375))) (bvsub lt!8379 from!367)))))

(assert (=> d!2082 (or (= (bvand lt!8379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!8379 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!8379 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!8381 () (_ BitVec 64))

(assert (=> d!2082 (= lt!8379 (bvadd lt!8381 from!367 nBits!460))))

(assert (=> d!2082 (or (not (= (bvand lt!8381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!8381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!8381 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!2082 (= lt!8381 (bitIndex!0 (size!187 (buf!514 thiss!1486)) (currentByte!1505 thiss!1486) (currentBit!1500 thiss!1486)))))

(assert (=> d!2082 (= lt!8375 e!3979)))

(assert (=> d!2082 (= c!326 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!8398 () Unit!472)

(declare-fun lt!8356 () Unit!472)

(assert (=> d!2082 (= lt!8398 lt!8356)))

(assert (=> d!2082 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!2082 (= lt!8356 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!2082 (= lt!8373 (bitIndex!0 (size!187 (buf!514 thiss!1486)) (currentByte!1505 thiss!1486) (currentBit!1500 thiss!1486)))))

(assert (=> d!2082 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!2082 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!8375)))

(declare-fun b!6321 () Bool)

(declare-fun lt!8369 () tuple2!794)

(assert (=> b!6321 (= e!3978 (= (bitStreamReadBitsIntoList!0 (_2!417 lt!8375) (_1!419 lt!8369) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!417 lt!8375) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!6321 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6321 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!8359 () Unit!472)

(declare-fun lt!8397 () Unit!472)

(assert (=> b!6321 (= lt!8359 lt!8397)))

(assert (=> b!6321 (validate_offset_bits!1 ((_ sign_extend 32) (size!187 (buf!514 (_2!417 lt!8375)))) ((_ sign_extend 32) (currentByte!1505 thiss!1486)) ((_ sign_extend 32) (currentBit!1500 thiss!1486)) lt!8376)))

(assert (=> b!6321 (= lt!8397 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!514 (_2!417 lt!8375)) lt!8376))))

(assert (=> b!6321 e!3980))

(declare-fun res!7292 () Bool)

(assert (=> b!6321 (=> (not res!7292) (not e!3980))))

(assert (=> b!6321 (= res!7292 (and (= (size!187 (buf!514 thiss!1486)) (size!187 (buf!514 (_2!417 lt!8375)))) (bvsge lt!8376 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6321 (= lt!8376 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!6321 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!6321 (= lt!8369 (reader!0 thiss!1486 (_2!417 lt!8375)))))

(assert (= (and d!2082 c!326) b!6320))

(assert (= (and d!2082 (not c!326)) b!6315))

(assert (= (or b!6320 b!6315) bm!71))

(assert (= (and d!2082 res!7290) b!6318))

(assert (= (and b!6318 res!7294) b!6319))

(assert (= (and b!6319 res!7289) b!6314))

(assert (= (and b!6314 res!7291) b!6317))

(assert (= (and b!6317 res!7293) b!6321))

(assert (= (and b!6321 res!7292) b!6316))

(declare-fun m!7953 () Bool)

(assert (=> b!6314 m!7953))

(declare-fun m!7955 () Bool)

(assert (=> b!6320 m!7955))

(declare-fun m!7957 () Bool)

(assert (=> b!6320 m!7957))

(assert (=> b!6320 m!7505))

(declare-fun m!7959 () Bool)

(assert (=> b!6320 m!7959))

(declare-fun m!7961 () Bool)

(assert (=> b!6320 m!7961))

(declare-fun m!7963 () Bool)

(assert (=> b!6320 m!7963))

(declare-fun m!7965 () Bool)

(assert (=> b!6320 m!7965))

(declare-fun m!7967 () Bool)

(assert (=> b!6320 m!7967))

(declare-fun m!7969 () Bool)

(assert (=> b!6320 m!7969))

(declare-fun m!7971 () Bool)

(assert (=> b!6320 m!7971))

(declare-fun m!7973 () Bool)

(assert (=> b!6320 m!7973))

(declare-fun m!7975 () Bool)

(assert (=> b!6320 m!7975))

(declare-fun m!7977 () Bool)

(assert (=> b!6320 m!7977))

(declare-fun m!7979 () Bool)

(assert (=> b!6320 m!7979))

(assert (=> b!6320 m!7979))

(declare-fun m!7981 () Bool)

(assert (=> b!6320 m!7981))

(declare-fun m!7983 () Bool)

(assert (=> b!6320 m!7983))

(declare-fun m!7985 () Bool)

(assert (=> b!6320 m!7985))

(declare-fun m!7987 () Bool)

(assert (=> b!6320 m!7987))

(declare-fun m!7989 () Bool)

(assert (=> b!6320 m!7989))

(declare-fun m!7991 () Bool)

(assert (=> b!6320 m!7991))

(assert (=> b!6320 m!7971))

(declare-fun m!7993 () Bool)

(assert (=> b!6320 m!7993))

(declare-fun m!7995 () Bool)

(assert (=> b!6320 m!7995))

(declare-fun m!7997 () Bool)

(assert (=> b!6320 m!7997))

(declare-fun m!7999 () Bool)

(assert (=> b!6320 m!7999))

(declare-fun m!8001 () Bool)

(assert (=> b!6320 m!8001))

(assert (=> b!6320 m!7607))

(declare-fun m!8003 () Bool)

(assert (=> b!6320 m!8003))

(declare-fun m!8005 () Bool)

(assert (=> b!6320 m!8005))

(declare-fun m!8007 () Bool)

(assert (=> b!6320 m!8007))

(assert (=> b!6320 m!7985))

(declare-fun m!8009 () Bool)

(assert (=> b!6320 m!8009))

(assert (=> b!6320 m!7607))

(declare-fun m!8011 () Bool)

(assert (=> b!6320 m!8011))

(declare-fun m!8013 () Bool)

(assert (=> b!6320 m!8013))

(declare-fun m!8015 () Bool)

(assert (=> d!2082 m!8015))

(assert (=> d!2082 m!7505))

(assert (=> d!2082 m!7671))

(assert (=> d!2082 m!7667))

(declare-fun m!8017 () Bool)

(assert (=> b!6318 m!8017))

(declare-fun m!8019 () Bool)

(assert (=> b!6321 m!8019))

(declare-fun m!8021 () Bool)

(assert (=> b!6321 m!8021))

(declare-fun m!8023 () Bool)

(assert (=> b!6321 m!8023))

(declare-fun m!8025 () Bool)

(assert (=> b!6321 m!8025))

(declare-fun m!8027 () Bool)

(assert (=> b!6321 m!8027))

(declare-fun m!8029 () Bool)

(assert (=> b!6315 m!8029))

(declare-fun m!8031 () Bool)

(assert (=> b!6315 m!8031))

(declare-fun m!8033 () Bool)

(assert (=> b!6316 m!8033))

(declare-fun m!8035 () Bool)

(assert (=> bm!71 m!8035))

(assert (=> b!6002 d!2082))

(push 1)

(assert (not b!6161))

(assert (not b!6318))

(assert (not b!6164))

(assert (not d!1994))

(assert (not bm!71))

(assert (not b!6183))

(assert (not b!6315))

(assert (not d!2012))

(assert (not b!6175))

(assert (not d!2028))

(assert (not b!6316))

(assert (not b!6081))

(assert (not b!6127))

(assert (not b!6197))

(assert (not d!2018))

(assert (not b!6314))

(assert (not b!6200))

(assert (not b!6195))

(assert (not b!6177))

(assert (not b!6163))

(assert (not b!6198))

(assert (not d!2074))

(assert (not b!6321))

(assert (not d!2072))

(assert (not d!2082))

(assert (not b!6125))

(assert (not b!6165))

(assert (not b!6320))

(assert (not d!2050))

(assert (not d!2004))

(assert (not d!2070))

(assert (not b!6176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

