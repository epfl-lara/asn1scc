; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64554 () Bool)

(assert start!64554)

(declare-fun b!289598 () Bool)

(declare-fun res!239273 () Bool)

(declare-fun e!206056 () Bool)

(assert (=> b!289598 (=> (not res!239273) (not e!206056))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289598 (= res!239273 (bvslt from!505 to!474))))

(declare-fun b!289599 () Bool)

(declare-fun res!239271 () Bool)

(assert (=> b!289599 (=> (not res!239271) (not e!206056))))

(declare-datatypes ((array!17143 0))(
  ( (array!17144 (arr!8417 (Array (_ BitVec 32) (_ BitVec 8))) (size!7415 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12840 0))(
  ( (BitStream!12841 (buf!7481 array!17143) (currentByte!13888 (_ BitVec 32)) (currentBit!13883 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12840)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289599 (= res!239271 (validate_offset_bits!1 ((_ sign_extend 32) (size!7415 (buf!7481 thiss!1728))) ((_ sign_extend 32) (currentByte!13888 thiss!1728)) ((_ sign_extend 32) (currentBit!13883 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-datatypes ((Unit!20071 0))(
  ( (Unit!20072) )
))
(declare-datatypes ((tuple3!1574 0))(
  ( (tuple3!1575 (_1!12553 Unit!20071) (_2!12553 BitStream!12840) (_3!1201 array!17143)) )
))
(declare-fun lt!419992 () tuple3!1574)

(declare-fun b!289600 () Bool)

(declare-fun e!206055 () Bool)

(declare-fun arr!273 () array!17143)

(assert (=> b!289600 (= e!206055 (and (= (buf!7481 thiss!1728) (buf!7481 (_2!12553 lt!419992))) (= (size!7415 arr!273) (size!7415 (_3!1201 lt!419992)))))))

(declare-fun b!289601 () Bool)

(assert (=> b!289601 (= e!206056 (not true))))

(assert (=> b!289601 e!206055))

(declare-fun res!239270 () Bool)

(assert (=> b!289601 (=> (not res!239270) (not e!206055))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289601 (= res!239270 (= (bvsub (bvadd (bitIndex!0 (size!7415 (buf!7481 thiss!1728)) (currentByte!13888 thiss!1728) (currentBit!13883 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7415 (buf!7481 (_2!12553 lt!419992))) (currentByte!13888 (_2!12553 lt!419992)) (currentBit!13883 (_2!12553 lt!419992)))))))

(declare-fun lt!419990 () (_ BitVec 32))

(declare-fun lt!419994 () (_ BitVec 32))

(declare-datatypes ((tuple2!22704 0))(
  ( (tuple2!22705 (_1!12554 Bool) (_2!12554 BitStream!12840)) )
))
(declare-fun lt!419991 () tuple2!22704)

(declare-fun readBitsLoop!0 (BitStream!12840 (_ BitVec 64) array!17143 (_ BitVec 64) (_ BitVec 64)) tuple3!1574)

(assert (=> b!289601 (= lt!419992 (readBitsLoop!0 (_2!12554 lt!419991) nBits!523 (array!17144 (store (arr!8417 arr!273) lt!419994 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8417 arr!273) lt!419994)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419990)))) ((_ sign_extend 24) (ite (_1!12554 lt!419991) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!419990) #b00000000))))) (size!7415 arr!273)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(assert (=> b!289601 (validate_offset_bits!1 ((_ sign_extend 32) (size!7415 (buf!7481 (_2!12554 lt!419991)))) ((_ sign_extend 32) (currentByte!13888 (_2!12554 lt!419991))) ((_ sign_extend 32) (currentBit!13883 (_2!12554 lt!419991))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!419993 () Unit!20071)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12840 BitStream!12840 (_ BitVec 64) (_ BitVec 64)) Unit!20071)

(assert (=> b!289601 (= lt!419993 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12554 lt!419991) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!289601 (= lt!419990 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!289601 (= lt!419994 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!12840) tuple2!22704)

(assert (=> b!289601 (= lt!419991 (readBit!0 thiss!1728))))

(declare-fun res!239272 () Bool)

(assert (=> start!64554 (=> (not res!239272) (not e!206056))))

(assert (=> start!64554 (= res!239272 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7415 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64554 e!206056))

(declare-fun e!206054 () Bool)

(declare-fun inv!12 (BitStream!12840) Bool)

(assert (=> start!64554 (and (inv!12 thiss!1728) e!206054)))

(assert (=> start!64554 true))

(declare-fun array_inv!7027 (array!17143) Bool)

(assert (=> start!64554 (array_inv!7027 arr!273)))

(declare-fun b!289602 () Bool)

(assert (=> b!289602 (= e!206054 (array_inv!7027 (buf!7481 thiss!1728)))))

(assert (= (and start!64554 res!239272) b!289599))

(assert (= (and b!289599 res!239271) b!289598))

(assert (= (and b!289598 res!239273) b!289601))

(assert (= (and b!289601 res!239270) b!289600))

(assert (= start!64554 b!289602))

(declare-fun m!422679 () Bool)

(assert (=> b!289599 m!422679))

(declare-fun m!422681 () Bool)

(assert (=> b!289601 m!422681))

(declare-fun m!422683 () Bool)

(assert (=> b!289601 m!422683))

(declare-fun m!422685 () Bool)

(assert (=> b!289601 m!422685))

(declare-fun m!422687 () Bool)

(assert (=> b!289601 m!422687))

(declare-fun m!422689 () Bool)

(assert (=> b!289601 m!422689))

(declare-fun m!422691 () Bool)

(assert (=> b!289601 m!422691))

(declare-fun m!422693 () Bool)

(assert (=> b!289601 m!422693))

(declare-fun m!422695 () Bool)

(assert (=> b!289601 m!422695))

(declare-fun m!422697 () Bool)

(assert (=> b!289601 m!422697))

(declare-fun m!422699 () Bool)

(assert (=> start!64554 m!422699))

(declare-fun m!422701 () Bool)

(assert (=> start!64554 m!422701))

(declare-fun m!422703 () Bool)

(assert (=> b!289602 m!422703))

(check-sat (not b!289602) (not b!289601) (not b!289599) (not start!64554))
