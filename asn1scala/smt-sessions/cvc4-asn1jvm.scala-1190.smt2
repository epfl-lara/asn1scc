; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33822 () Bool)

(assert start!33822)

(declare-fun b!161618 () Bool)

(declare-fun res!134731 () Bool)

(declare-fun e!111338 () Bool)

(assert (=> b!161618 (=> res!134731 e!111338)))

(declare-fun lt!254439 () (_ BitVec 32))

(assert (=> b!161618 (= res!134731 (bvsle lt!254439 #b00000000000000000000000000000000))))

(declare-fun res!134732 () Bool)

(declare-fun e!111339 () Bool)

(assert (=> start!33822 (=> (not res!134732) (not e!111339))))

(declare-datatypes ((array!7993 0))(
  ( (array!7994 (arr!4506 (Array (_ BitVec 32) (_ BitVec 8))) (size!3585 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6338 0))(
  ( (BitStream!6339 (buf!4043 array!7993) (currentByte!7534 (_ BitVec 32)) (currentBit!7529 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6338)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33822 (= res!134732 (validate_offset_byte!0 ((_ sign_extend 32) (size!3585 (buf!4043 thiss!1602))) ((_ sign_extend 32) (currentByte!7534 thiss!1602)) ((_ sign_extend 32) (currentBit!7529 thiss!1602))))))

(assert (=> start!33822 e!111339))

(declare-fun e!111336 () Bool)

(declare-fun inv!12 (BitStream!6338) Bool)

(assert (=> start!33822 (and (inv!12 thiss!1602) e!111336)))

(assert (=> start!33822 true))

(declare-fun b!161619 () Bool)

(declare-fun e!111337 () Bool)

(declare-fun lt!254438 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161619 (= e!111337 (byteRangesEq!0 (select (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 thiss!1602)) lt!254438 #b00000000000000000000000000000000 (currentBit!7529 thiss!1602)))))

(declare-fun b!161620 () Bool)

(declare-fun array_inv!3332 (array!7993) Bool)

(assert (=> b!161620 (= e!111336 (array_inv!3332 (buf!4043 thiss!1602)))))

(declare-fun b!161621 () Bool)

(assert (=> b!161621 (= e!111339 (not e!111338))))

(declare-fun res!134730 () Bool)

(assert (=> b!161621 (=> res!134730 e!111338)))

(declare-datatypes ((Unit!11110 0))(
  ( (Unit!11111) )
))
(declare-datatypes ((tuple3!898 0))(
  ( (tuple3!899 (_1!7800 Unit!11110) (_2!7800 (_ BitVec 8)) (_3!566 BitStream!6338)) )
))
(declare-fun lt!254448 () tuple3!898)

(declare-fun lt!254442 () array!7993)

(declare-fun arrayRangesEq!537 (array!7993 array!7993 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161621 (= res!134730 (not (arrayRangesEq!537 (buf!4043 thiss!1602) lt!254442 #b00000000000000000000000000000000 (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001))))))

(declare-fun lt!254446 () (_ BitVec 8))

(assert (=> b!161621 (arrayRangesEq!537 (buf!4043 thiss!1602) (array!7994 (store (arr!4506 (buf!4043 thiss!1602)) (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) lt!254446) (size!3585 (buf!4043 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001))))

(declare-fun lt!254447 () Unit!11110)

(declare-fun arrayUpdatedAtPrefixLemma!145 (array!7993 (_ BitVec 32) (_ BitVec 8)) Unit!11110)

(assert (=> b!161621 (= lt!254447 (arrayUpdatedAtPrefixLemma!145 (buf!4043 thiss!1602) (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) lt!254446))))

(assert (=> b!161621 (= lt!254446 (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001)))))

(declare-fun lt!254440 () (_ BitVec 32))

(declare-fun lt!254437 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254445 () (_ BitVec 8))

(declare-fun lt!254444 () (_ BitVec 8))

(declare-fun Unit!11112 () Unit!11110)

(declare-fun Unit!11113 () Unit!11110)

(assert (=> b!161621 (= lt!254448 (ite (bvsgt lt!254439 #b00000000000000000000000000000000) (let ((bdg!9677 ((_ extract 7 0) (bvnot lt!254440)))) (let ((bdg!9678 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 thiss!1602) lt!254444) (currentByte!7534 thiss!1602) lt!254438) (bvadd #b00000000000000000000000000000001 (currentByte!7534 thiss!1602)))) ((_ sign_extend 24) bdg!9677))))) (tuple3!899 Unit!11112 bdg!9677 (BitStream!6339 (array!7994 (store (arr!4506 (array!7994 (store (arr!4506 lt!254442) (bvadd #b00000000000000000000000000000001 (currentByte!7534 thiss!1602)) bdg!9678) (size!3585 lt!254442))) (bvadd #b00000000000000000000000000000001 (currentByte!7534 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9678) (bvshl ((_ sign_extend 24) v!222) lt!254437)))) (size!3585 (array!7994 (store (arr!4506 lt!254442) (bvadd #b00000000000000000000000000000001 (currentByte!7534 thiss!1602)) bdg!9678) (size!3585 lt!254442)))) (bvadd #b00000000000000000000000000000001 (currentByte!7534 thiss!1602)) (currentBit!7529 thiss!1602))))) (tuple3!899 Unit!11113 lt!254445 (BitStream!6339 lt!254442 (bvadd #b00000000000000000000000000000001 (currentByte!7534 thiss!1602)) (currentBit!7529 thiss!1602)))))))

(assert (=> b!161621 e!111337))

(declare-fun res!134729 () Bool)

(assert (=> b!161621 (=> res!134729 e!111337)))

(assert (=> b!161621 (= res!134729 (bvsge (currentByte!7534 thiss!1602) (size!3585 (buf!4043 thiss!1602))))))

(assert (=> b!161621 (= lt!254442 (array!7994 (store (store (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 thiss!1602) lt!254444) (currentByte!7534 thiss!1602) lt!254438) (size!3585 (buf!4043 thiss!1602))))))

(assert (=> b!161621 (= lt!254438 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254444) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254439))))))

(assert (=> b!161621 (= lt!254444 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 thiss!1602))) lt!254440)))))

(assert (=> b!161621 (= lt!254440 ((_ sign_extend 24) lt!254445))))

(assert (=> b!161621 (= lt!254445 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254437)))))))

(assert (=> b!161621 (= lt!254437 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254439))))))

(assert (=> b!161621 (= lt!254439 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7529 thiss!1602))))))

(declare-fun b!161622 () Bool)

(assert (=> b!161622 (= e!111338 (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001)) (bvsgt (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) (currentByte!7534 (_3!566 lt!254448))) (bvsgt (size!3585 (buf!4043 thiss!1602)) (size!3585 (buf!4043 (_3!566 lt!254448)))) (and (bvsle (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) (size!3585 (buf!4043 thiss!1602))) (bvsle (currentByte!7534 (_3!566 lt!254448)) (size!3585 (buf!4043 thiss!1602))))))))

(assert (=> b!161622 (arrayRangesEq!537 lt!254442 (array!7994 (store (store (store (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 thiss!1602) lt!254444) (currentByte!7534 thiss!1602) lt!254438) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) (size!3585 (buf!4043 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7534 (_3!566 lt!254448)))))

(declare-fun lt!254443 () Unit!11110)

(assert (=> b!161622 (= lt!254443 (arrayUpdatedAtPrefixLemma!145 lt!254442 (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))))))

(assert (=> b!161622 (arrayRangesEq!537 (buf!4043 thiss!1602) (array!7994 (store (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) (size!3585 (buf!4043 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7534 (_3!566 lt!254448)))))

(declare-fun lt!254441 () Unit!11110)

(assert (=> b!161622 (= lt!254441 (arrayUpdatedAtPrefixLemma!145 (buf!4043 thiss!1602) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))))))

(assert (= (and start!33822 res!134732) b!161621))

(assert (= (and b!161621 (not res!134729)) b!161619))

(assert (= (and b!161621 (not res!134730)) b!161618))

(assert (= (and b!161618 (not res!134731)) b!161622))

(assert (= start!33822 b!161620))

(declare-fun m!256151 () Bool)

(assert (=> b!161619 m!256151))

(assert (=> b!161619 m!256151))

(declare-fun m!256153 () Bool)

(assert (=> b!161619 m!256153))

(declare-fun m!256155 () Bool)

(assert (=> b!161620 m!256155))

(declare-fun m!256157 () Bool)

(assert (=> start!33822 m!256157))

(declare-fun m!256159 () Bool)

(assert (=> start!33822 m!256159))

(declare-fun m!256161 () Bool)

(assert (=> b!161621 m!256161))

(declare-fun m!256163 () Bool)

(assert (=> b!161621 m!256163))

(declare-fun m!256165 () Bool)

(assert (=> b!161621 m!256165))

(declare-fun m!256167 () Bool)

(assert (=> b!161621 m!256167))

(declare-fun m!256169 () Bool)

(assert (=> b!161621 m!256169))

(declare-fun m!256171 () Bool)

(assert (=> b!161621 m!256171))

(declare-fun m!256173 () Bool)

(assert (=> b!161621 m!256173))

(declare-fun m!256175 () Bool)

(assert (=> b!161621 m!256175))

(declare-fun m!256177 () Bool)

(assert (=> b!161621 m!256177))

(assert (=> b!161621 m!256151))

(declare-fun m!256179 () Bool)

(assert (=> b!161621 m!256179))

(declare-fun m!256181 () Bool)

(assert (=> b!161621 m!256181))

(declare-fun m!256183 () Bool)

(assert (=> b!161622 m!256183))

(declare-fun m!256185 () Bool)

(assert (=> b!161622 m!256185))

(declare-fun m!256187 () Bool)

(assert (=> b!161622 m!256187))

(assert (=> b!161622 m!256185))

(assert (=> b!161622 m!256173))

(assert (=> b!161622 m!256185))

(declare-fun m!256189 () Bool)

(assert (=> b!161622 m!256189))

(declare-fun m!256191 () Bool)

(assert (=> b!161622 m!256191))

(declare-fun m!256193 () Bool)

(assert (=> b!161622 m!256193))

(declare-fun m!256195 () Bool)

(assert (=> b!161622 m!256195))

(assert (=> b!161622 m!256181))

(push 1)

(assert (not start!33822))

(assert (not b!161622))

(assert (not b!161620))

(assert (not b!161621))

(assert (not b!161619))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55345 () Bool)

(assert (=> d!55345 (= (byteRangesEq!0 (select (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 thiss!1602)) lt!254438 #b00000000000000000000000000000000 (currentBit!7529 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7529 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7529 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!254438) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7529 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13764 () Bool)

(assert (= bs!13764 d!55345))

(declare-fun m!256265 () Bool)

(assert (=> bs!13764 m!256265))

(declare-fun m!256267 () Bool)

(assert (=> bs!13764 m!256267))

(assert (=> b!161619 d!55345))

(declare-fun d!55357 () Bool)

(assert (=> d!55357 (= (array_inv!3332 (buf!4043 thiss!1602)) (bvsge (size!3585 (buf!4043 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161620 d!55357))

(declare-fun d!55359 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55359 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3585 (buf!4043 thiss!1602))) ((_ sign_extend 32) (currentByte!7534 thiss!1602)) ((_ sign_extend 32) (currentBit!7529 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3585 (buf!4043 thiss!1602))) ((_ sign_extend 32) (currentByte!7534 thiss!1602)) ((_ sign_extend 32) (currentBit!7529 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13765 () Bool)

(assert (= bs!13765 d!55359))

(declare-fun m!256269 () Bool)

(assert (=> bs!13765 m!256269))

(assert (=> start!33822 d!55359))

(declare-fun d!55361 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55361 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7529 thiss!1602) (currentByte!7534 thiss!1602) (size!3585 (buf!4043 thiss!1602))))))

(declare-fun bs!13766 () Bool)

(assert (= bs!13766 d!55361))

(declare-fun m!256271 () Bool)

(assert (=> bs!13766 m!256271))

(assert (=> start!33822 d!55361))

(declare-fun d!55363 () Bool)

(declare-fun res!134771 () Bool)

(declare-fun e!111378 () Bool)

(assert (=> d!55363 (=> res!134771 e!111378)))

(assert (=> d!55363 (= res!134771 (= #b00000000000000000000000000000000 (currentByte!7534 (_3!566 lt!254448))))))

(assert (=> d!55363 (= (arrayRangesEq!537 lt!254442 (array!7994 (store (store (store (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 thiss!1602) lt!254444) (currentByte!7534 thiss!1602) lt!254438) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) (size!3585 (buf!4043 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7534 (_3!566 lt!254448))) e!111378)))

(declare-fun b!161661 () Bool)

(declare-fun e!111379 () Bool)

(assert (=> b!161661 (= e!111378 e!111379)))

(declare-fun res!134772 () Bool)

(assert (=> b!161661 (=> (not res!134772) (not e!111379))))

(assert (=> b!161661 (= res!134772 (= (select (arr!4506 lt!254442) #b00000000000000000000000000000000) (select (arr!4506 (array!7994 (store (store (store (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 thiss!1602) lt!254444) (currentByte!7534 thiss!1602) lt!254438) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) (size!3585 (buf!4043 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161662 () Bool)

(assert (=> b!161662 (= e!111379 (arrayRangesEq!537 lt!254442 (array!7994 (store (store (store (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 thiss!1602) lt!254444) (currentByte!7534 thiss!1602) lt!254438) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) (size!3585 (buf!4043 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7534 (_3!566 lt!254448))))))

(assert (= (and d!55363 (not res!134771)) b!161661))

(assert (= (and b!161661 res!134772) b!161662))

(declare-fun m!256277 () Bool)

(assert (=> b!161661 m!256277))

(declare-fun m!256279 () Bool)

(assert (=> b!161661 m!256279))

(declare-fun m!256281 () Bool)

(assert (=> b!161662 m!256281))

(assert (=> b!161622 d!55363))

(declare-fun d!55365 () Bool)

(declare-fun e!111382 () Bool)

(assert (=> d!55365 e!111382))

(declare-fun res!134775 () Bool)

(assert (=> d!55365 (=> (not res!134775) (not e!111382))))

(assert (=> d!55365 (= res!134775 (and (bvsge (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000000) (bvslt (currentByte!7534 (_3!566 lt!254448)) (size!3585 lt!254442))))))

(declare-fun lt!254461 () Unit!11110)

(declare-fun choose!169 (array!7993 (_ BitVec 32) (_ BitVec 8)) Unit!11110)

(assert (=> d!55365 (= lt!254461 (choose!169 lt!254442 (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))))))

(assert (=> d!55365 (and (bvsle #b00000000000000000000000000000000 (currentByte!7534 (_3!566 lt!254448))) (bvslt (currentByte!7534 (_3!566 lt!254448)) (size!3585 lt!254442)))))

(assert (=> d!55365 (= (arrayUpdatedAtPrefixLemma!145 lt!254442 (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) lt!254461)))

(declare-fun b!161665 () Bool)

(assert (=> b!161665 (= e!111382 (arrayRangesEq!537 lt!254442 (array!7994 (store (arr!4506 lt!254442) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) (size!3585 lt!254442)) #b00000000000000000000000000000000 (currentByte!7534 (_3!566 lt!254448))))))

(assert (= (and d!55365 res!134775) b!161665))

(assert (=> d!55365 m!256185))

(declare-fun m!256283 () Bool)

(assert (=> d!55365 m!256283))

(declare-fun m!256285 () Bool)

(assert (=> b!161665 m!256285))

(declare-fun m!256287 () Bool)

(assert (=> b!161665 m!256287))

(assert (=> b!161622 d!55365))

(declare-fun d!55367 () Bool)

(declare-fun res!134776 () Bool)

(declare-fun e!111383 () Bool)

(assert (=> d!55367 (=> res!134776 e!111383)))

(assert (=> d!55367 (= res!134776 (= #b00000000000000000000000000000000 (currentByte!7534 (_3!566 lt!254448))))))

(assert (=> d!55367 (= (arrayRangesEq!537 (buf!4043 thiss!1602) (array!7994 (store (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) (size!3585 (buf!4043 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7534 (_3!566 lt!254448))) e!111383)))

(declare-fun b!161666 () Bool)

(declare-fun e!111384 () Bool)

(assert (=> b!161666 (= e!111383 e!111384)))

(declare-fun res!134777 () Bool)

(assert (=> b!161666 (=> (not res!134777) (not e!111384))))

(assert (=> b!161666 (= res!134777 (= (select (arr!4506 (buf!4043 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4506 (array!7994 (store (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) (size!3585 (buf!4043 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161667 () Bool)

(assert (=> b!161667 (= e!111384 (arrayRangesEq!537 (buf!4043 thiss!1602) (array!7994 (store (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) (size!3585 (buf!4043 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7534 (_3!566 lt!254448))))))

(assert (= (and d!55367 (not res!134776)) b!161666))

(assert (= (and b!161666 res!134777) b!161667))

(declare-fun m!256289 () Bool)

(assert (=> b!161666 m!256289))

(declare-fun m!256291 () Bool)

(assert (=> b!161666 m!256291))

(declare-fun m!256293 () Bool)

(assert (=> b!161667 m!256293))

(assert (=> b!161622 d!55367))

(declare-fun d!55369 () Bool)

(declare-fun e!111385 () Bool)

(assert (=> d!55369 e!111385))

(declare-fun res!134778 () Bool)

(assert (=> d!55369 (=> (not res!134778) (not e!111385))))

(assert (=> d!55369 (= res!134778 (and (bvsge (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000000) (bvslt (currentByte!7534 (_3!566 lt!254448)) (size!3585 (buf!4043 thiss!1602)))))))

(declare-fun lt!254462 () Unit!11110)

(assert (=> d!55369 (= lt!254462 (choose!169 (buf!4043 thiss!1602) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))))))

(assert (=> d!55369 (and (bvsle #b00000000000000000000000000000000 (currentByte!7534 (_3!566 lt!254448))) (bvslt (currentByte!7534 (_3!566 lt!254448)) (size!3585 (buf!4043 thiss!1602))))))

(assert (=> d!55369 (= (arrayUpdatedAtPrefixLemma!145 (buf!4043 thiss!1602) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) lt!254462)))

(declare-fun b!161668 () Bool)

(assert (=> b!161668 (= e!111385 (arrayRangesEq!537 (buf!4043 thiss!1602) (array!7994 (store (arr!4506 (buf!4043 thiss!1602)) (currentByte!7534 (_3!566 lt!254448)) (select (arr!4506 (buf!4043 (_3!566 lt!254448))) (currentByte!7534 (_3!566 lt!254448)))) (size!3585 (buf!4043 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7534 (_3!566 lt!254448))))))

(assert (= (and d!55369 res!134778) b!161668))

(assert (=> d!55369 m!256185))

(declare-fun m!256295 () Bool)

(assert (=> d!55369 m!256295))

(assert (=> b!161668 m!256195))

(assert (=> b!161668 m!256191))

(assert (=> b!161622 d!55369))

(declare-fun d!55371 () Bool)

(declare-fun res!134779 () Bool)

(declare-fun e!111386 () Bool)

(assert (=> d!55371 (=> res!134779 e!111386)))

(assert (=> d!55371 (= res!134779 (= #b00000000000000000000000000000000 (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001)))))

(assert (=> d!55371 (= (arrayRangesEq!537 (buf!4043 thiss!1602) lt!254442 #b00000000000000000000000000000000 (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001)) e!111386)))

(declare-fun b!161669 () Bool)

(declare-fun e!111387 () Bool)

(assert (=> b!161669 (= e!111386 e!111387)))

(declare-fun res!134780 () Bool)

(assert (=> b!161669 (=> (not res!134780) (not e!111387))))

(assert (=> b!161669 (= res!134780 (= (select (arr!4506 (buf!4043 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4506 lt!254442) #b00000000000000000000000000000000)))))

(declare-fun b!161670 () Bool)

(assert (=> b!161670 (= e!111387 (arrayRangesEq!537 (buf!4043 thiss!1602) lt!254442 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001)))))

(assert (= (and d!55371 (not res!134779)) b!161669))

(assert (= (and b!161669 res!134780) b!161670))

(assert (=> b!161669 m!256289))

(assert (=> b!161669 m!256277))

(declare-fun m!256297 () Bool)

(assert (=> b!161670 m!256297))

(assert (=> b!161621 d!55371))

(declare-fun d!55373 () Bool)

(declare-fun res!134781 () Bool)

(declare-fun e!111388 () Bool)

(assert (=> d!55373 (=> res!134781 e!111388)))

(assert (=> d!55373 (= res!134781 (= #b00000000000000000000000000000000 (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001)))))

(assert (=> d!55373 (= (arrayRangesEq!537 (buf!4043 thiss!1602) (array!7994 (store (arr!4506 (buf!4043 thiss!1602)) (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) lt!254446) (size!3585 (buf!4043 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001)) e!111388)))

(declare-fun b!161671 () Bool)

(declare-fun e!111389 () Bool)

(assert (=> b!161671 (= e!111388 e!111389)))

(declare-fun res!134782 () Bool)

(assert (=> b!161671 (=> (not res!134782) (not e!111389))))

(assert (=> b!161671 (= res!134782 (= (select (arr!4506 (buf!4043 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4506 (array!7994 (store (arr!4506 (buf!4043 thiss!1602)) (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) lt!254446) (size!3585 (buf!4043 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161672 () Bool)

(assert (=> b!161672 (= e!111389 (arrayRangesEq!537 (buf!4043 thiss!1602) (array!7994 (store (arr!4506 (buf!4043 thiss!1602)) (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) lt!254446) (size!3585 (buf!4043 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001)))))

(assert (= (and d!55373 (not res!134781)) b!161671))

(assert (= (and b!161671 res!134782) b!161672))

(assert (=> b!161671 m!256289))

(declare-fun m!256299 () Bool)

(assert (=> b!161671 m!256299))

(declare-fun m!256301 () Bool)

(assert (=> b!161672 m!256301))

(assert (=> b!161621 d!55373))

(declare-fun d!55375 () Bool)

(declare-fun e!111390 () Bool)

(assert (=> d!55375 e!111390))

(declare-fun res!134783 () Bool)

(assert (=> d!55375 (=> (not res!134783) (not e!111390))))

(assert (=> d!55375 (= res!134783 (and (bvsge (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) (size!3585 (buf!4043 thiss!1602)))))))

(declare-fun lt!254463 () Unit!11110)

(assert (=> d!55375 (= lt!254463 (choose!169 (buf!4043 thiss!1602) (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) lt!254446))))

(assert (=> d!55375 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) (size!3585 (buf!4043 thiss!1602))))))

(assert (=> d!55375 (= (arrayUpdatedAtPrefixLemma!145 (buf!4043 thiss!1602) (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) lt!254446) lt!254463)))

(declare-fun b!161673 () Bool)

(assert (=> b!161673 (= e!111390 (arrayRangesEq!537 (buf!4043 thiss!1602) (array!7994 (store (arr!4506 (buf!4043 thiss!1602)) (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001) lt!254446) (size!3585 (buf!4043 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7534 (_3!566 lt!254448)) #b00000000000000000000000000000001)))))

(assert (= (and d!55375 res!134783) b!161673))

(declare-fun m!256303 () Bool)

(assert (=> d!55375 m!256303))

(assert (=> b!161673 m!256171))

(assert (=> b!161673 m!256177))

(assert (=> b!161621 d!55375))

(push 1)

(assert (not b!161673))

(assert (not b!161662))

(assert (not b!161667))

(assert (not d!55359))

(assert (not d!55375))

(assert (not b!161672))

(assert (not d!55369))

(assert (not b!161665))

(assert (not b!161668))

(assert (not b!161670))

(assert (not d!55361))

(assert (not d!55365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

