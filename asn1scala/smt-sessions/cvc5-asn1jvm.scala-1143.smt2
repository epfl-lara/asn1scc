; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32308 () Bool)

(assert start!32308)

(declare-fun b!159561 () Bool)

(declare-fun e!109017 () Bool)

(declare-fun e!109016 () Bool)

(assert (=> b!159561 (= e!109017 (not e!109016))))

(declare-fun res!133191 () Bool)

(assert (=> b!159561 (=> res!133191 e!109016)))

(declare-datatypes ((array!7602 0))(
  ( (array!7603 (arr!4363 (Array (_ BitVec 32) (_ BitVec 8))) (size!3442 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6052 0))(
  ( (BitStream!6053 (buf!3900 array!7602) (currentByte!7134 (_ BitVec 32)) (currentBit!7129 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6052)

(declare-datatypes ((Unit!10859 0))(
  ( (Unit!10860) )
))
(declare-datatypes ((tuple3!786 0))(
  ( (tuple3!787 (_1!7741 Unit!10859) (_2!7741 (_ BitVec 8)) (_3!510 BitStream!6052)) )
))
(declare-fun lt!251889 () tuple3!786)

(declare-fun lt!251888 () array!7602)

(declare-fun arrayRangesEq!493 (array!7602 array!7602 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159561 (= res!133191 (not (arrayRangesEq!493 (buf!3900 thiss!1602) lt!251888 #b00000000000000000000000000000000 (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001))))))

(declare-fun lt!251887 () (_ BitVec 8))

(assert (=> b!159561 (arrayRangesEq!493 (buf!3900 thiss!1602) (array!7603 (store (arr!4363 (buf!3900 thiss!1602)) (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001) lt!251887) (size!3442 (buf!3900 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001))))

(declare-fun lt!251884 () Unit!10859)

(declare-fun arrayUpdatedAtPrefixLemma!101 (array!7602 (_ BitVec 32) (_ BitVec 8)) Unit!10859)

(assert (=> b!159561 (= lt!251884 (arrayUpdatedAtPrefixLemma!101 (buf!3900 thiss!1602) (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001) lt!251887))))

(assert (=> b!159561 (= lt!251887 (select (arr!4363 (buf!3900 (_3!510 lt!251889))) (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001)))))

(declare-fun lt!251883 () (_ BitVec 8))

(declare-fun lt!251882 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251886 () (_ BitVec 8))

(declare-fun lt!251885 () (_ BitVec 32))

(declare-fun lt!251890 () (_ BitVec 32))

(declare-fun lt!251891 () Bool)

(declare-fun Unit!10861 () Unit!10859)

(declare-fun Unit!10862 () Unit!10859)

(assert (=> b!159561 (= lt!251889 (ite lt!251891 (let ((bdg!9407 ((_ extract 7 0) (bvnot lt!251885)))) (let ((bdg!9408 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4363 (buf!3900 thiss!1602)) (currentByte!7134 thiss!1602) lt!251882) (currentByte!7134 thiss!1602) lt!251886) (bvadd #b00000000000000000000000000000001 (currentByte!7134 thiss!1602)))) ((_ sign_extend 24) bdg!9407))))) (tuple3!787 Unit!10861 bdg!9407 (BitStream!6053 (array!7603 (store (arr!4363 (array!7603 (store (arr!4363 lt!251888) (bvadd #b00000000000000000000000000000001 (currentByte!7134 thiss!1602)) bdg!9408) (size!3442 lt!251888))) (bvadd #b00000000000000000000000000000001 (currentByte!7134 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9408) (bvshl ((_ sign_extend 24) v!222) lt!251890)))) (size!3442 (array!7603 (store (arr!4363 lt!251888) (bvadd #b00000000000000000000000000000001 (currentByte!7134 thiss!1602)) bdg!9408) (size!3442 lt!251888)))) (bvadd #b00000000000000000000000000000001 (currentByte!7134 thiss!1602)) (currentBit!7129 thiss!1602))))) (tuple3!787 Unit!10862 lt!251883 (BitStream!6053 lt!251888 (bvadd #b00000000000000000000000000000001 (currentByte!7134 thiss!1602)) (currentBit!7129 thiss!1602)))))))

(declare-fun lt!251892 () (_ BitVec 32))

(assert (=> b!159561 (= lt!251891 (bvsgt lt!251892 #b00000000000000000000000000000000))))

(declare-fun e!109015 () Bool)

(assert (=> b!159561 e!109015))

(declare-fun res!133192 () Bool)

(assert (=> b!159561 (=> res!133192 e!109015)))

(assert (=> b!159561 (= res!133192 (bvsge (currentByte!7134 thiss!1602) (size!3442 (buf!3900 thiss!1602))))))

(assert (=> b!159561 (= lt!251888 (array!7603 (store (store (arr!4363 (buf!3900 thiss!1602)) (currentByte!7134 thiss!1602) lt!251882) (currentByte!7134 thiss!1602) lt!251886) (size!3442 (buf!3900 thiss!1602))))))

(assert (=> b!159561 (= lt!251886 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251882) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251892))))))

(assert (=> b!159561 (= lt!251882 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4363 (buf!3900 thiss!1602)) (currentByte!7134 thiss!1602))) lt!251885)))))

(assert (=> b!159561 (= lt!251885 ((_ sign_extend 24) lt!251883))))

(assert (=> b!159561 (= lt!251883 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251890)))))))

(assert (=> b!159561 (= lt!251890 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251892))))))

(assert (=> b!159561 (= lt!251892 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7129 thiss!1602))))))

(declare-fun b!159562 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159562 (= e!109015 (byteRangesEq!0 (select (arr!4363 (buf!3900 thiss!1602)) (currentByte!7134 thiss!1602)) lt!251886 #b00000000000000000000000000000000 (currentBit!7129 thiss!1602)))))

(declare-fun b!159564 () Bool)

(declare-fun e!109013 () Bool)

(declare-fun array_inv!3189 (array!7602) Bool)

(assert (=> b!159564 (= e!109013 (array_inv!3189 (buf!3900 thiss!1602)))))

(declare-fun res!133193 () Bool)

(assert (=> start!32308 (=> (not res!133193) (not e!109017))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32308 (= res!133193 (validate_offset_byte!0 ((_ sign_extend 32) (size!3442 (buf!3900 thiss!1602))) ((_ sign_extend 32) (currentByte!7134 thiss!1602)) ((_ sign_extend 32) (currentBit!7129 thiss!1602))))))

(assert (=> start!32308 e!109017))

(declare-fun inv!12 (BitStream!6052) Bool)

(assert (=> start!32308 (and (inv!12 thiss!1602) e!109013)))

(assert (=> start!32308 true))

(declare-fun b!159563 () Bool)

(assert (=> b!159563 (= e!109016 (or lt!251891 (bvsgt #b00000000000000000000000000000000 (currentByte!7134 thiss!1602)) (bvsgt (size!3442 (buf!3900 thiss!1602)) (size!3442 (buf!3900 (_3!510 lt!251889)))) (bvsle (currentByte!7134 thiss!1602) (size!3442 (buf!3900 thiss!1602)))))))

(assert (= (and start!32308 res!133193) b!159561))

(assert (= (and b!159561 (not res!133192)) b!159562))

(assert (= (and b!159561 (not res!133191)) b!159563))

(assert (= start!32308 b!159564))

(declare-fun m!251551 () Bool)

(assert (=> b!159561 m!251551))

(declare-fun m!251553 () Bool)

(assert (=> b!159561 m!251553))

(declare-fun m!251555 () Bool)

(assert (=> b!159561 m!251555))

(declare-fun m!251557 () Bool)

(assert (=> b!159561 m!251557))

(declare-fun m!251559 () Bool)

(assert (=> b!159561 m!251559))

(declare-fun m!251561 () Bool)

(assert (=> b!159561 m!251561))

(declare-fun m!251563 () Bool)

(assert (=> b!159561 m!251563))

(declare-fun m!251565 () Bool)

(assert (=> b!159561 m!251565))

(declare-fun m!251567 () Bool)

(assert (=> b!159561 m!251567))

(declare-fun m!251569 () Bool)

(assert (=> b!159561 m!251569))

(declare-fun m!251571 () Bool)

(assert (=> b!159561 m!251571))

(declare-fun m!251573 () Bool)

(assert (=> b!159561 m!251573))

(assert (=> b!159562 m!251561))

(assert (=> b!159562 m!251561))

(declare-fun m!251575 () Bool)

(assert (=> b!159562 m!251575))

(declare-fun m!251577 () Bool)

(assert (=> b!159564 m!251577))

(declare-fun m!251579 () Bool)

(assert (=> start!32308 m!251579))

(declare-fun m!251581 () Bool)

(assert (=> start!32308 m!251581))

(push 1)

(assert (not b!159561))

(assert (not start!32308))

(assert (not b!159564))

(assert (not b!159562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!53673 () Bool)

(declare-fun res!133220 () Bool)

(declare-fun e!109056 () Bool)

(assert (=> d!53673 (=> res!133220 e!109056)))

(assert (=> d!53673 (= res!133220 (= #b00000000000000000000000000000000 (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001)))))

(assert (=> d!53673 (= (arrayRangesEq!493 (buf!3900 thiss!1602) lt!251888 #b00000000000000000000000000000000 (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001)) e!109056)))

(declare-fun b!159597 () Bool)

(declare-fun e!109057 () Bool)

(assert (=> b!159597 (= e!109056 e!109057)))

(declare-fun res!133221 () Bool)

(assert (=> b!159597 (=> (not res!133221) (not e!109057))))

(assert (=> b!159597 (= res!133221 (= (select (arr!4363 (buf!3900 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4363 lt!251888) #b00000000000000000000000000000000)))))

(declare-fun b!159598 () Bool)

(assert (=> b!159598 (= e!109057 (arrayRangesEq!493 (buf!3900 thiss!1602) lt!251888 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001)))))

(assert (= (and d!53673 (not res!133220)) b!159597))

(assert (= (and b!159597 res!133221) b!159598))

(declare-fun m!251653 () Bool)

(assert (=> b!159597 m!251653))

(declare-fun m!251655 () Bool)

(assert (=> b!159597 m!251655))

(declare-fun m!251657 () Bool)

(assert (=> b!159598 m!251657))

(assert (=> b!159561 d!53673))

(declare-fun d!53681 () Bool)

(declare-fun res!133224 () Bool)

(declare-fun e!109060 () Bool)

(assert (=> d!53681 (=> res!133224 e!109060)))

(assert (=> d!53681 (= res!133224 (= #b00000000000000000000000000000000 (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001)))))

(assert (=> d!53681 (= (arrayRangesEq!493 (buf!3900 thiss!1602) (array!7603 (store (arr!4363 (buf!3900 thiss!1602)) (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001) lt!251887) (size!3442 (buf!3900 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001)) e!109060)))

(declare-fun b!159601 () Bool)

(declare-fun e!109061 () Bool)

(assert (=> b!159601 (= e!109060 e!109061)))

(declare-fun res!133225 () Bool)

(assert (=> b!159601 (=> (not res!133225) (not e!109061))))

(assert (=> b!159601 (= res!133225 (= (select (arr!4363 (buf!3900 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4363 (array!7603 (store (arr!4363 (buf!3900 thiss!1602)) (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001) lt!251887) (size!3442 (buf!3900 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!159602 () Bool)

(assert (=> b!159602 (= e!109061 (arrayRangesEq!493 (buf!3900 thiss!1602) (array!7603 (store (arr!4363 (buf!3900 thiss!1602)) (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001) lt!251887) (size!3442 (buf!3900 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001)))))

(assert (= (and d!53681 (not res!133224)) b!159601))

(assert (= (and b!159601 res!133225) b!159602))

(assert (=> b!159601 m!251653))

(declare-fun m!251665 () Bool)

(assert (=> b!159601 m!251665))

(declare-fun m!251667 () Bool)

(assert (=> b!159602 m!251667))

(assert (=> b!159561 d!53681))

(declare-fun d!53685 () Bool)

(declare-fun e!109069 () Bool)

(assert (=> d!53685 e!109069))

(declare-fun res!133233 () Bool)

(assert (=> d!53685 (=> (not res!133233) (not e!109069))))

(assert (=> d!53685 (= res!133233 (and (bvsge (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001) (size!3442 (buf!3900 thiss!1602)))))))

(declare-fun lt!251964 () Unit!10859)

(declare-fun choose!134 (array!7602 (_ BitVec 32) (_ BitVec 8)) Unit!10859)

(assert (=> d!53685 (= lt!251964 (choose!134 (buf!3900 thiss!1602) (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001) lt!251887))))

(assert (=> d!53685 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001) (size!3442 (buf!3900 thiss!1602))))))

(assert (=> d!53685 (= (arrayUpdatedAtPrefixLemma!101 (buf!3900 thiss!1602) (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001) lt!251887) lt!251964)))

(declare-fun b!159610 () Bool)

(assert (=> b!159610 (= e!109069 (arrayRangesEq!493 (buf!3900 thiss!1602) (array!7603 (store (arr!4363 (buf!3900 thiss!1602)) (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001) lt!251887) (size!3442 (buf!3900 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7134 (_3!510 lt!251889)) #b00000000000000000000000000000001)))))

(assert (= (and d!53685 res!133233) b!159610))

(declare-fun m!251677 () Bool)

(assert (=> d!53685 m!251677))

(assert (=> b!159610 m!251551))

(assert (=> b!159610 m!251557))

(assert (=> b!159561 d!53685))

(declare-fun d!53695 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!53695 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3442 (buf!3900 thiss!1602))) ((_ sign_extend 32) (currentByte!7134 thiss!1602)) ((_ sign_extend 32) (currentBit!7129 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3442 (buf!3900 thiss!1602))) ((_ sign_extend 32) (currentByte!7134 thiss!1602)) ((_ sign_extend 32) (currentBit!7129 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13310 () Bool)

(assert (= bs!13310 d!53695))

(declare-fun m!251681 () Bool)

(assert (=> bs!13310 m!251681))

(assert (=> start!32308 d!53695))

(declare-fun d!53699 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!53699 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7129 thiss!1602) (currentByte!7134 thiss!1602) (size!3442 (buf!3900 thiss!1602))))))

(declare-fun bs!13313 () Bool)

(assert (= bs!13313 d!53699))

(declare-fun m!251689 () Bool)

(assert (=> bs!13313 m!251689))

(assert (=> start!32308 d!53699))

(declare-fun d!53703 () Bool)

(assert (=> d!53703 (= (array_inv!3189 (buf!3900 thiss!1602)) (bvsge (size!3442 (buf!3900 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!159564 d!53703))

(declare-fun d!53705 () Bool)

(assert (=> d!53705 (= (byteRangesEq!0 (select (arr!4363 (buf!3900 thiss!1602)) (currentByte!7134 thiss!1602)) lt!251886 #b00000000000000000000000000000000 (currentBit!7129 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7129 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4363 (buf!3900 thiss!1602)) (currentByte!7134 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7129 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!251886) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7129 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13314 () Bool)

(assert (= bs!13314 d!53705))

(declare-fun m!251701 () Bool)

(assert (=> bs!13314 m!251701))

(declare-fun m!251703 () Bool)

(assert (=> bs!13314 m!251703))

(assert (=> b!159562 d!53705))

(push 1)

(assert (not d!53695))

(assert (not b!159598))

(assert (not b!159602))

(assert (not d!53699))

(assert (not d!53685))

(assert (not b!159610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

