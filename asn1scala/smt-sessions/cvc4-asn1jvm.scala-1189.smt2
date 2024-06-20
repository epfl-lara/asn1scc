; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33816 () Bool)

(assert start!33816)

(declare-fun b!161573 () Bool)

(declare-fun e!111293 () Bool)

(declare-fun e!111294 () Bool)

(assert (=> b!161573 (= e!111293 (not e!111294))))

(declare-fun res!134696 () Bool)

(assert (=> b!161573 (=> res!134696 e!111294)))

(declare-datatypes ((array!7987 0))(
  ( (array!7988 (arr!4503 (Array (_ BitVec 32) (_ BitVec 8))) (size!3582 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6332 0))(
  ( (BitStream!6333 (buf!4040 array!7987) (currentByte!7531 (_ BitVec 32)) (currentBit!7526 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11098 0))(
  ( (Unit!11099) )
))
(declare-datatypes ((tuple3!892 0))(
  ( (tuple3!893 (_1!7797 Unit!11098) (_2!7797 (_ BitVec 8)) (_3!563 BitStream!6332)) )
))
(declare-fun lt!254335 () tuple3!892)

(declare-fun thiss!1602 () BitStream!6332)

(declare-fun lt!254333 () array!7987)

(declare-fun arrayRangesEq!534 (array!7987 array!7987 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161573 (= res!134696 (not (arrayRangesEq!534 (buf!4040 thiss!1602) lt!254333 #b00000000000000000000000000000000 (bvsub (currentByte!7531 (_3!563 lt!254335)) #b00000000000000000000000000000001))))))

(declare-fun lt!254332 () (_ BitVec 8))

(assert (=> b!161573 (arrayRangesEq!534 (buf!4040 thiss!1602) (array!7988 (store (arr!4503 (buf!4040 thiss!1602)) (bvsub (currentByte!7531 (_3!563 lt!254335)) #b00000000000000000000000000000001) lt!254332) (size!3582 (buf!4040 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7531 (_3!563 lt!254335)) #b00000000000000000000000000000001))))

(declare-fun lt!254338 () Unit!11098)

(declare-fun arrayUpdatedAtPrefixLemma!142 (array!7987 (_ BitVec 32) (_ BitVec 8)) Unit!11098)

(assert (=> b!161573 (= lt!254338 (arrayUpdatedAtPrefixLemma!142 (buf!4040 thiss!1602) (bvsub (currentByte!7531 (_3!563 lt!254335)) #b00000000000000000000000000000001) lt!254332))))

(assert (=> b!161573 (= lt!254332 (select (arr!4503 (buf!4040 (_3!563 lt!254335))) (bvsub (currentByte!7531 (_3!563 lt!254335)) #b00000000000000000000000000000001)))))

(declare-fun lt!254334 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254337 () (_ BitVec 32))

(declare-fun lt!254339 () (_ BitVec 8))

(declare-fun lt!254336 () (_ BitVec 32))

(declare-fun lt!254329 () (_ BitVec 8))

(declare-fun lt!254330 () (_ BitVec 8))

(declare-fun Unit!11100 () Unit!11098)

(declare-fun Unit!11101 () Unit!11098)

(assert (=> b!161573 (= lt!254335 (ite (bvsgt lt!254337 #b00000000000000000000000000000000) (let ((bdg!9663 ((_ extract 7 0) (bvnot lt!254336)))) (let ((bdg!9664 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4503 (buf!4040 thiss!1602)) (currentByte!7531 thiss!1602) lt!254339) (currentByte!7531 thiss!1602) lt!254330) (bvadd #b00000000000000000000000000000001 (currentByte!7531 thiss!1602)))) ((_ sign_extend 24) bdg!9663))))) (tuple3!893 Unit!11100 bdg!9663 (BitStream!6333 (array!7988 (store (arr!4503 (array!7988 (store (arr!4503 lt!254333) (bvadd #b00000000000000000000000000000001 (currentByte!7531 thiss!1602)) bdg!9664) (size!3582 lt!254333))) (bvadd #b00000000000000000000000000000001 (currentByte!7531 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9664) (bvshl ((_ sign_extend 24) v!222) lt!254334)))) (size!3582 (array!7988 (store (arr!4503 lt!254333) (bvadd #b00000000000000000000000000000001 (currentByte!7531 thiss!1602)) bdg!9664) (size!3582 lt!254333)))) (bvadd #b00000000000000000000000000000001 (currentByte!7531 thiss!1602)) (currentBit!7526 thiss!1602))))) (tuple3!893 Unit!11101 lt!254329 (BitStream!6333 lt!254333 (bvadd #b00000000000000000000000000000001 (currentByte!7531 thiss!1602)) (currentBit!7526 thiss!1602)))))))

(declare-fun e!111290 () Bool)

(assert (=> b!161573 e!111290))

(declare-fun res!134695 () Bool)

(assert (=> b!161573 (=> res!134695 e!111290)))

(assert (=> b!161573 (= res!134695 (bvsge (currentByte!7531 thiss!1602) (size!3582 (buf!4040 thiss!1602))))))

(assert (=> b!161573 (= lt!254333 (array!7988 (store (store (arr!4503 (buf!4040 thiss!1602)) (currentByte!7531 thiss!1602) lt!254339) (currentByte!7531 thiss!1602) lt!254330) (size!3582 (buf!4040 thiss!1602))))))

(assert (=> b!161573 (= lt!254330 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254339) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254337))))))

(assert (=> b!161573 (= lt!254339 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4503 (buf!4040 thiss!1602)) (currentByte!7531 thiss!1602))) lt!254336)))))

(assert (=> b!161573 (= lt!254336 ((_ sign_extend 24) lt!254329))))

(assert (=> b!161573 (= lt!254329 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254334)))))))

(assert (=> b!161573 (= lt!254334 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254337))))))

(assert (=> b!161573 (= lt!254337 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7526 thiss!1602))))))

(declare-fun b!161574 () Bool)

(assert (=> b!161574 (= e!111294 (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7531 (_3!563 lt!254335)) #b00000000000000000000000000000001)) (bvsgt (bvsub (currentByte!7531 (_3!563 lt!254335)) #b00000000000000000000000000000001) (currentByte!7531 (_3!563 lt!254335))) (bvsle (size!3582 (buf!4040 thiss!1602)) (size!3582 (buf!4040 (_3!563 lt!254335))))))))

(assert (=> b!161574 (arrayRangesEq!534 lt!254333 (array!7988 (store (store (store (arr!4503 (buf!4040 thiss!1602)) (currentByte!7531 thiss!1602) lt!254339) (currentByte!7531 thiss!1602) lt!254330) (currentByte!7531 (_3!563 lt!254335)) (select (arr!4503 (buf!4040 (_3!563 lt!254335))) (currentByte!7531 (_3!563 lt!254335)))) (size!3582 (buf!4040 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7531 (_3!563 lt!254335)))))

(declare-fun lt!254331 () Unit!11098)

(assert (=> b!161574 (= lt!254331 (arrayUpdatedAtPrefixLemma!142 lt!254333 (currentByte!7531 (_3!563 lt!254335)) (select (arr!4503 (buf!4040 (_3!563 lt!254335))) (currentByte!7531 (_3!563 lt!254335)))))))

(assert (=> b!161574 (arrayRangesEq!534 (buf!4040 thiss!1602) (array!7988 (store (arr!4503 (buf!4040 thiss!1602)) (currentByte!7531 (_3!563 lt!254335)) (select (arr!4503 (buf!4040 (_3!563 lt!254335))) (currentByte!7531 (_3!563 lt!254335)))) (size!3582 (buf!4040 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7531 (_3!563 lt!254335)))))

(declare-fun lt!254340 () Unit!11098)

(assert (=> b!161574 (= lt!254340 (arrayUpdatedAtPrefixLemma!142 (buf!4040 thiss!1602) (currentByte!7531 (_3!563 lt!254335)) (select (arr!4503 (buf!4040 (_3!563 lt!254335))) (currentByte!7531 (_3!563 lt!254335)))))))

(declare-fun b!161575 () Bool)

(declare-fun res!134693 () Bool)

(assert (=> b!161575 (=> res!134693 e!111294)))

(assert (=> b!161575 (= res!134693 (bvsle lt!254337 #b00000000000000000000000000000000))))

(declare-fun b!161576 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161576 (= e!111290 (byteRangesEq!0 (select (arr!4503 (buf!4040 thiss!1602)) (currentByte!7531 thiss!1602)) lt!254330 #b00000000000000000000000000000000 (currentBit!7526 thiss!1602)))))

(declare-fun res!134694 () Bool)

(assert (=> start!33816 (=> (not res!134694) (not e!111293))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33816 (= res!134694 (validate_offset_byte!0 ((_ sign_extend 32) (size!3582 (buf!4040 thiss!1602))) ((_ sign_extend 32) (currentByte!7531 thiss!1602)) ((_ sign_extend 32) (currentBit!7526 thiss!1602))))))

(assert (=> start!33816 e!111293))

(declare-fun e!111292 () Bool)

(declare-fun inv!12 (BitStream!6332) Bool)

(assert (=> start!33816 (and (inv!12 thiss!1602) e!111292)))

(assert (=> start!33816 true))

(declare-fun b!161577 () Bool)

(declare-fun array_inv!3329 (array!7987) Bool)

(assert (=> b!161577 (= e!111292 (array_inv!3329 (buf!4040 thiss!1602)))))

(assert (= (and start!33816 res!134694) b!161573))

(assert (= (and b!161573 (not res!134695)) b!161576))

(assert (= (and b!161573 (not res!134696)) b!161575))

(assert (= (and b!161575 (not res!134693)) b!161574))

(assert (= start!33816 b!161577))

(declare-fun m!256013 () Bool)

(assert (=> b!161574 m!256013))

(declare-fun m!256015 () Bool)

(assert (=> b!161574 m!256015))

(declare-fun m!256017 () Bool)

(assert (=> b!161574 m!256017))

(declare-fun m!256019 () Bool)

(assert (=> b!161574 m!256019))

(declare-fun m!256021 () Bool)

(assert (=> b!161574 m!256021))

(declare-fun m!256023 () Bool)

(assert (=> b!161574 m!256023))

(assert (=> b!161574 m!256019))

(declare-fun m!256025 () Bool)

(assert (=> b!161574 m!256025))

(assert (=> b!161574 m!256019))

(declare-fun m!256027 () Bool)

(assert (=> b!161574 m!256027))

(declare-fun m!256029 () Bool)

(assert (=> b!161574 m!256029))

(declare-fun m!256031 () Bool)

(assert (=> b!161576 m!256031))

(assert (=> b!161576 m!256031))

(declare-fun m!256033 () Bool)

(assert (=> b!161576 m!256033))

(declare-fun m!256035 () Bool)

(assert (=> b!161573 m!256035))

(assert (=> b!161573 m!256015))

(declare-fun m!256037 () Bool)

(assert (=> b!161573 m!256037))

(declare-fun m!256039 () Bool)

(assert (=> b!161573 m!256039))

(declare-fun m!256041 () Bool)

(assert (=> b!161573 m!256041))

(declare-fun m!256043 () Bool)

(assert (=> b!161573 m!256043))

(assert (=> b!161573 m!256031))

(declare-fun m!256045 () Bool)

(assert (=> b!161573 m!256045))

(declare-fun m!256047 () Bool)

(assert (=> b!161573 m!256047))

(declare-fun m!256049 () Bool)

(assert (=> b!161573 m!256049))

(assert (=> b!161573 m!256029))

(declare-fun m!256051 () Bool)

(assert (=> b!161573 m!256051))

(declare-fun m!256053 () Bool)

(assert (=> start!33816 m!256053))

(declare-fun m!256055 () Bool)

(assert (=> start!33816 m!256055))

(declare-fun m!256057 () Bool)

(assert (=> b!161577 m!256057))

(push 1)

(assert (not b!161576))

(assert (not start!33816))

(assert (not b!161573))

(assert (not b!161574))

(assert (not b!161577))

(check-sat)

(pop 1)

(push 1)

(check-sat)

