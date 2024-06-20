; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33772 () Bool)

(assert start!33772)

(declare-fun b!161462 () Bool)

(declare-fun e!111180 () Bool)

(declare-fun e!111183 () Bool)

(assert (=> b!161462 (= e!111180 (not e!111183))))

(declare-fun res!134595 () Bool)

(assert (=> b!161462 (=> res!134595 e!111183)))

(declare-datatypes ((array!7976 0))(
  ( (array!7977 (arr!4499 (Array (_ BitVec 32) (_ BitVec 8))) (size!3578 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6324 0))(
  ( (BitStream!6325 (buf!4036 array!7976) (currentByte!7524 (_ BitVec 32)) (currentBit!7519 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6324)

(declare-datatypes ((Unit!11082 0))(
  ( (Unit!11083) )
))
(declare-datatypes ((tuple3!884 0))(
  ( (tuple3!885 (_1!7793 Unit!11082) (_2!7793 (_ BitVec 8)) (_3!559 BitStream!6324)) )
))
(declare-fun lt!254175 () tuple3!884)

(declare-fun lt!254173 () array!7976)

(declare-fun arrayRangesEq!530 (array!7976 array!7976 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161462 (= res!134595 (not (arrayRangesEq!530 (buf!4036 thiss!1602) lt!254173 #b00000000000000000000000000000000 (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001))))))

(declare-fun lt!254172 () (_ BitVec 8))

(assert (=> b!161462 (arrayRangesEq!530 (buf!4036 thiss!1602) (array!7977 (store (arr!4499 (buf!4036 thiss!1602)) (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) lt!254172) (size!3578 (buf!4036 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001))))

(declare-fun lt!254177 () Unit!11082)

(declare-fun arrayUpdatedAtPrefixLemma!138 (array!7976 (_ BitVec 32) (_ BitVec 8)) Unit!11082)

(assert (=> b!161462 (= lt!254177 (arrayUpdatedAtPrefixLemma!138 (buf!4036 thiss!1602) (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) lt!254172))))

(assert (=> b!161462 (= lt!254172 (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254170 () (_ BitVec 8))

(declare-fun lt!254176 () (_ BitVec 8))

(declare-fun lt!254171 () (_ BitVec 32))

(declare-fun lt!254179 () (_ BitVec 32))

(declare-fun lt!254178 () (_ BitVec 8))

(declare-fun lt!254181 () (_ BitVec 32))

(declare-fun Unit!11084 () Unit!11082)

(declare-fun Unit!11085 () Unit!11082)

(assert (=> b!161462 (= lt!254175 (ite (bvsgt lt!254179 #b00000000000000000000000000000000) (let ((bdg!9649 ((_ extract 7 0) (bvnot lt!254171)))) (let ((bdg!9650 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 thiss!1602) lt!254170) (currentByte!7524 thiss!1602) lt!254176) (bvadd #b00000000000000000000000000000001 (currentByte!7524 thiss!1602)))) ((_ sign_extend 24) bdg!9649))))) (tuple3!885 Unit!11084 bdg!9649 (BitStream!6325 (array!7977 (store (arr!4499 (array!7977 (store (arr!4499 lt!254173) (bvadd #b00000000000000000000000000000001 (currentByte!7524 thiss!1602)) bdg!9650) (size!3578 lt!254173))) (bvadd #b00000000000000000000000000000001 (currentByte!7524 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9650) (bvshl ((_ sign_extend 24) v!222) lt!254181)))) (size!3578 (array!7977 (store (arr!4499 lt!254173) (bvadd #b00000000000000000000000000000001 (currentByte!7524 thiss!1602)) bdg!9650) (size!3578 lt!254173)))) (bvadd #b00000000000000000000000000000001 (currentByte!7524 thiss!1602)) (currentBit!7519 thiss!1602))))) (tuple3!885 Unit!11085 lt!254178 (BitStream!6325 lt!254173 (bvadd #b00000000000000000000000000000001 (currentByte!7524 thiss!1602)) (currentBit!7519 thiss!1602)))))))

(declare-fun e!111182 () Bool)

(assert (=> b!161462 e!111182))

(declare-fun res!134596 () Bool)

(assert (=> b!161462 (=> res!134596 e!111182)))

(assert (=> b!161462 (= res!134596 (bvsge (currentByte!7524 thiss!1602) (size!3578 (buf!4036 thiss!1602))))))

(assert (=> b!161462 (= lt!254173 (array!7977 (store (store (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 thiss!1602) lt!254170) (currentByte!7524 thiss!1602) lt!254176) (size!3578 (buf!4036 thiss!1602))))))

(assert (=> b!161462 (= lt!254176 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254170) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254179))))))

(assert (=> b!161462 (= lt!254170 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 thiss!1602))) lt!254171)))))

(assert (=> b!161462 (= lt!254171 ((_ sign_extend 24) lt!254178))))

(assert (=> b!161462 (= lt!254178 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254181)))))))

(assert (=> b!161462 (= lt!254181 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254179))))))

(assert (=> b!161462 (= lt!254179 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7519 thiss!1602))))))

(declare-fun b!161463 () Bool)

(assert (=> b!161463 (= e!111183 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001)) (bvsle (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) (currentByte!7524 (_3!559 lt!254175)))))))

(assert (=> b!161463 (arrayRangesEq!530 lt!254173 (array!7977 (store (store (store (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 thiss!1602) lt!254170) (currentByte!7524 thiss!1602) lt!254176) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) (size!3578 (buf!4036 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7524 (_3!559 lt!254175)))))

(declare-fun lt!254180 () Unit!11082)

(assert (=> b!161463 (= lt!254180 (arrayUpdatedAtPrefixLemma!138 lt!254173 (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))))))

(assert (=> b!161463 (arrayRangesEq!530 (buf!4036 thiss!1602) (array!7977 (store (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) (size!3578 (buf!4036 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7524 (_3!559 lt!254175)))))

(declare-fun lt!254174 () Unit!11082)

(assert (=> b!161463 (= lt!254174 (arrayUpdatedAtPrefixLemma!138 (buf!4036 thiss!1602) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))))))

(declare-fun b!161464 () Bool)

(declare-fun e!111181 () Bool)

(declare-fun array_inv!3325 (array!7976) Bool)

(assert (=> b!161464 (= e!111181 (array_inv!3325 (buf!4036 thiss!1602)))))

(declare-fun res!134597 () Bool)

(assert (=> start!33772 (=> (not res!134597) (not e!111180))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33772 (= res!134597 (validate_offset_byte!0 ((_ sign_extend 32) (size!3578 (buf!4036 thiss!1602))) ((_ sign_extend 32) (currentByte!7524 thiss!1602)) ((_ sign_extend 32) (currentBit!7519 thiss!1602))))))

(assert (=> start!33772 e!111180))

(declare-fun inv!12 (BitStream!6324) Bool)

(assert (=> start!33772 (and (inv!12 thiss!1602) e!111181)))

(assert (=> start!33772 true))

(declare-fun b!161465 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161465 (= e!111182 (byteRangesEq!0 (select (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 thiss!1602)) lt!254176 #b00000000000000000000000000000000 (currentBit!7519 thiss!1602)))))

(declare-fun b!161466 () Bool)

(declare-fun res!134594 () Bool)

(assert (=> b!161466 (=> res!134594 e!111183)))

(assert (=> b!161466 (= res!134594 (bvsle lt!254179 #b00000000000000000000000000000000))))

(assert (= (and start!33772 res!134597) b!161462))

(assert (= (and b!161462 (not res!134596)) b!161465))

(assert (= (and b!161462 (not res!134595)) b!161466))

(assert (= (and b!161466 (not res!134594)) b!161463))

(assert (= start!33772 b!161464))

(declare-fun m!255721 () Bool)

(assert (=> b!161463 m!255721))

(declare-fun m!255723 () Bool)

(assert (=> b!161463 m!255723))

(declare-fun m!255725 () Bool)

(assert (=> b!161463 m!255725))

(assert (=> b!161463 m!255723))

(declare-fun m!255727 () Bool)

(assert (=> b!161463 m!255727))

(declare-fun m!255729 () Bool)

(assert (=> b!161463 m!255729))

(declare-fun m!255731 () Bool)

(assert (=> b!161463 m!255731))

(declare-fun m!255733 () Bool)

(assert (=> b!161463 m!255733))

(declare-fun m!255735 () Bool)

(assert (=> b!161463 m!255735))

(declare-fun m!255737 () Bool)

(assert (=> b!161463 m!255737))

(assert (=> b!161463 m!255723))

(declare-fun m!255739 () Bool)

(assert (=> b!161464 m!255739))

(declare-fun m!255741 () Bool)

(assert (=> b!161465 m!255741))

(assert (=> b!161465 m!255741))

(declare-fun m!255743 () Bool)

(assert (=> b!161465 m!255743))

(declare-fun m!255745 () Bool)

(assert (=> start!33772 m!255745))

(declare-fun m!255747 () Bool)

(assert (=> start!33772 m!255747))

(assert (=> b!161462 m!255721))

(declare-fun m!255749 () Bool)

(assert (=> b!161462 m!255749))

(declare-fun m!255751 () Bool)

(assert (=> b!161462 m!255751))

(declare-fun m!255753 () Bool)

(assert (=> b!161462 m!255753))

(assert (=> b!161462 m!255741))

(declare-fun m!255755 () Bool)

(assert (=> b!161462 m!255755))

(assert (=> b!161462 m!255731))

(declare-fun m!255757 () Bool)

(assert (=> b!161462 m!255757))

(declare-fun m!255759 () Bool)

(assert (=> b!161462 m!255759))

(declare-fun m!255761 () Bool)

(assert (=> b!161462 m!255761))

(declare-fun m!255763 () Bool)

(assert (=> b!161462 m!255763))

(declare-fun m!255765 () Bool)

(assert (=> b!161462 m!255765))

(check-sat (not b!161464) (not b!161463) (not b!161465) (not b!161462) (not start!33772))
(check-sat)
(get-model)

(declare-fun d!55265 () Bool)

(declare-fun res!134637 () Bool)

(declare-fun e!111226 () Bool)

(assert (=> d!55265 (=> res!134637 e!111226)))

(assert (=> d!55265 (= res!134637 (= #b00000000000000000000000000000000 (currentByte!7524 (_3!559 lt!254175))))))

(assert (=> d!55265 (= (arrayRangesEq!530 lt!254173 (array!7977 (store (store (store (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 thiss!1602) lt!254170) (currentByte!7524 thiss!1602) lt!254176) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) (size!3578 (buf!4036 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7524 (_3!559 lt!254175))) e!111226)))

(declare-fun b!161509 () Bool)

(declare-fun e!111227 () Bool)

(assert (=> b!161509 (= e!111226 e!111227)))

(declare-fun res!134638 () Bool)

(assert (=> b!161509 (=> (not res!134638) (not e!111227))))

(assert (=> b!161509 (= res!134638 (= (select (arr!4499 lt!254173) #b00000000000000000000000000000000) (select (arr!4499 (array!7977 (store (store (store (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 thiss!1602) lt!254170) (currentByte!7524 thiss!1602) lt!254176) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) (size!3578 (buf!4036 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161510 () Bool)

(assert (=> b!161510 (= e!111227 (arrayRangesEq!530 lt!254173 (array!7977 (store (store (store (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 thiss!1602) lt!254170) (currentByte!7524 thiss!1602) lt!254176) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) (size!3578 (buf!4036 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7524 (_3!559 lt!254175))))))

(assert (= (and d!55265 (not res!134637)) b!161509))

(assert (= (and b!161509 res!134638) b!161510))

(declare-fun m!255855 () Bool)

(assert (=> b!161509 m!255855))

(declare-fun m!255857 () Bool)

(assert (=> b!161509 m!255857))

(declare-fun m!255859 () Bool)

(assert (=> b!161510 m!255859))

(assert (=> b!161463 d!55265))

(declare-fun d!55269 () Bool)

(declare-fun e!111236 () Bool)

(assert (=> d!55269 e!111236))

(declare-fun res!134647 () Bool)

(assert (=> d!55269 (=> (not res!134647) (not e!111236))))

(assert (=> d!55269 (= res!134647 (and (bvsge (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000000) (bvslt (currentByte!7524 (_3!559 lt!254175)) (size!3578 lt!254173))))))

(declare-fun lt!254229 () Unit!11082)

(declare-fun choose!165 (array!7976 (_ BitVec 32) (_ BitVec 8)) Unit!11082)

(assert (=> d!55269 (= lt!254229 (choose!165 lt!254173 (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))))))

(assert (=> d!55269 (and (bvsle #b00000000000000000000000000000000 (currentByte!7524 (_3!559 lt!254175))) (bvslt (currentByte!7524 (_3!559 lt!254175)) (size!3578 lt!254173)))))

(assert (=> d!55269 (= (arrayUpdatedAtPrefixLemma!138 lt!254173 (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) lt!254229)))

(declare-fun b!161519 () Bool)

(assert (=> b!161519 (= e!111236 (arrayRangesEq!530 lt!254173 (array!7977 (store (arr!4499 lt!254173) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) (size!3578 lt!254173)) #b00000000000000000000000000000000 (currentByte!7524 (_3!559 lt!254175))))))

(assert (= (and d!55269 res!134647) b!161519))

(assert (=> d!55269 m!255723))

(declare-fun m!255875 () Bool)

(assert (=> d!55269 m!255875))

(declare-fun m!255877 () Bool)

(assert (=> b!161519 m!255877))

(declare-fun m!255879 () Bool)

(assert (=> b!161519 m!255879))

(assert (=> b!161463 d!55269))

(declare-fun d!55279 () Bool)

(declare-fun res!134648 () Bool)

(declare-fun e!111237 () Bool)

(assert (=> d!55279 (=> res!134648 e!111237)))

(assert (=> d!55279 (= res!134648 (= #b00000000000000000000000000000000 (currentByte!7524 (_3!559 lt!254175))))))

(assert (=> d!55279 (= (arrayRangesEq!530 (buf!4036 thiss!1602) (array!7977 (store (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) (size!3578 (buf!4036 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7524 (_3!559 lt!254175))) e!111237)))

(declare-fun b!161520 () Bool)

(declare-fun e!111238 () Bool)

(assert (=> b!161520 (= e!111237 e!111238)))

(declare-fun res!134649 () Bool)

(assert (=> b!161520 (=> (not res!134649) (not e!111238))))

(assert (=> b!161520 (= res!134649 (= (select (arr!4499 (buf!4036 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4499 (array!7977 (store (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) (size!3578 (buf!4036 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161521 () Bool)

(assert (=> b!161521 (= e!111238 (arrayRangesEq!530 (buf!4036 thiss!1602) (array!7977 (store (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) (size!3578 (buf!4036 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7524 (_3!559 lt!254175))))))

(assert (= (and d!55279 (not res!134648)) b!161520))

(assert (= (and b!161520 res!134649) b!161521))

(declare-fun m!255881 () Bool)

(assert (=> b!161520 m!255881))

(declare-fun m!255883 () Bool)

(assert (=> b!161520 m!255883))

(declare-fun m!255885 () Bool)

(assert (=> b!161521 m!255885))

(assert (=> b!161463 d!55279))

(declare-fun d!55281 () Bool)

(declare-fun e!111239 () Bool)

(assert (=> d!55281 e!111239))

(declare-fun res!134650 () Bool)

(assert (=> d!55281 (=> (not res!134650) (not e!111239))))

(assert (=> d!55281 (= res!134650 (and (bvsge (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000000) (bvslt (currentByte!7524 (_3!559 lt!254175)) (size!3578 (buf!4036 thiss!1602)))))))

(declare-fun lt!254230 () Unit!11082)

(assert (=> d!55281 (= lt!254230 (choose!165 (buf!4036 thiss!1602) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))))))

(assert (=> d!55281 (and (bvsle #b00000000000000000000000000000000 (currentByte!7524 (_3!559 lt!254175))) (bvslt (currentByte!7524 (_3!559 lt!254175)) (size!3578 (buf!4036 thiss!1602))))))

(assert (=> d!55281 (= (arrayUpdatedAtPrefixLemma!138 (buf!4036 thiss!1602) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) lt!254230)))

(declare-fun b!161522 () Bool)

(assert (=> b!161522 (= e!111239 (arrayRangesEq!530 (buf!4036 thiss!1602) (array!7977 (store (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 (_3!559 lt!254175)) (select (arr!4499 (buf!4036 (_3!559 lt!254175))) (currentByte!7524 (_3!559 lt!254175)))) (size!3578 (buf!4036 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7524 (_3!559 lt!254175))))))

(assert (= (and d!55281 res!134650) b!161522))

(assert (=> d!55281 m!255723))

(declare-fun m!255889 () Bool)

(assert (=> d!55281 m!255889))

(assert (=> b!161522 m!255735))

(assert (=> b!161522 m!255737))

(assert (=> b!161463 d!55281))

(declare-fun d!55285 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55285 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3578 (buf!4036 thiss!1602))) ((_ sign_extend 32) (currentByte!7524 thiss!1602)) ((_ sign_extend 32) (currentBit!7519 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3578 (buf!4036 thiss!1602))) ((_ sign_extend 32) (currentByte!7524 thiss!1602)) ((_ sign_extend 32) (currentBit!7519 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13748 () Bool)

(assert (= bs!13748 d!55285))

(declare-fun m!255891 () Bool)

(assert (=> bs!13748 m!255891))

(assert (=> start!33772 d!55285))

(declare-fun d!55287 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55287 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7519 thiss!1602) (currentByte!7524 thiss!1602) (size!3578 (buf!4036 thiss!1602))))))

(declare-fun bs!13750 () Bool)

(assert (= bs!13750 d!55287))

(declare-fun m!255901 () Bool)

(assert (=> bs!13750 m!255901))

(assert (=> start!33772 d!55287))

(declare-fun d!55295 () Bool)

(declare-fun res!134656 () Bool)

(declare-fun e!111245 () Bool)

(assert (=> d!55295 (=> res!134656 e!111245)))

(assert (=> d!55295 (= res!134656 (= #b00000000000000000000000000000000 (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001)))))

(assert (=> d!55295 (= (arrayRangesEq!530 (buf!4036 thiss!1602) lt!254173 #b00000000000000000000000000000000 (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001)) e!111245)))

(declare-fun b!161528 () Bool)

(declare-fun e!111246 () Bool)

(assert (=> b!161528 (= e!111245 e!111246)))

(declare-fun res!134657 () Bool)

(assert (=> b!161528 (=> (not res!134657) (not e!111246))))

(assert (=> b!161528 (= res!134657 (= (select (arr!4499 (buf!4036 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4499 lt!254173) #b00000000000000000000000000000000)))))

(declare-fun b!161529 () Bool)

(assert (=> b!161529 (= e!111246 (arrayRangesEq!530 (buf!4036 thiss!1602) lt!254173 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001)))))

(assert (= (and d!55295 (not res!134656)) b!161528))

(assert (= (and b!161528 res!134657) b!161529))

(assert (=> b!161528 m!255881))

(assert (=> b!161528 m!255855))

(declare-fun m!255905 () Bool)

(assert (=> b!161529 m!255905))

(assert (=> b!161462 d!55295))

(declare-fun d!55299 () Bool)

(declare-fun res!134658 () Bool)

(declare-fun e!111247 () Bool)

(assert (=> d!55299 (=> res!134658 e!111247)))

(assert (=> d!55299 (= res!134658 (= #b00000000000000000000000000000000 (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001)))))

(assert (=> d!55299 (= (arrayRangesEq!530 (buf!4036 thiss!1602) (array!7977 (store (arr!4499 (buf!4036 thiss!1602)) (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) lt!254172) (size!3578 (buf!4036 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001)) e!111247)))

(declare-fun b!161530 () Bool)

(declare-fun e!111248 () Bool)

(assert (=> b!161530 (= e!111247 e!111248)))

(declare-fun res!134659 () Bool)

(assert (=> b!161530 (=> (not res!134659) (not e!111248))))

(assert (=> b!161530 (= res!134659 (= (select (arr!4499 (buf!4036 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4499 (array!7977 (store (arr!4499 (buf!4036 thiss!1602)) (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) lt!254172) (size!3578 (buf!4036 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161531 () Bool)

(assert (=> b!161531 (= e!111248 (arrayRangesEq!530 (buf!4036 thiss!1602) (array!7977 (store (arr!4499 (buf!4036 thiss!1602)) (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) lt!254172) (size!3578 (buf!4036 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001)))))

(assert (= (and d!55299 (not res!134658)) b!161530))

(assert (= (and b!161530 res!134659) b!161531))

(assert (=> b!161530 m!255881))

(declare-fun m!255907 () Bool)

(assert (=> b!161530 m!255907))

(declare-fun m!255909 () Bool)

(assert (=> b!161531 m!255909))

(assert (=> b!161462 d!55299))

(declare-fun d!55301 () Bool)

(declare-fun e!111249 () Bool)

(assert (=> d!55301 e!111249))

(declare-fun res!134660 () Bool)

(assert (=> d!55301 (=> (not res!134660) (not e!111249))))

(assert (=> d!55301 (= res!134660 (and (bvsge (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) (size!3578 (buf!4036 thiss!1602)))))))

(declare-fun lt!254232 () Unit!11082)

(assert (=> d!55301 (= lt!254232 (choose!165 (buf!4036 thiss!1602) (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) lt!254172))))

(assert (=> d!55301 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) (size!3578 (buf!4036 thiss!1602))))))

(assert (=> d!55301 (= (arrayUpdatedAtPrefixLemma!138 (buf!4036 thiss!1602) (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) lt!254172) lt!254232)))

(declare-fun b!161532 () Bool)

(assert (=> b!161532 (= e!111249 (arrayRangesEq!530 (buf!4036 thiss!1602) (array!7977 (store (arr!4499 (buf!4036 thiss!1602)) (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001) lt!254172) (size!3578 (buf!4036 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7524 (_3!559 lt!254175)) #b00000000000000000000000000000001)))))

(assert (= (and d!55301 res!134660) b!161532))

(declare-fun m!255911 () Bool)

(assert (=> d!55301 m!255911))

(assert (=> b!161532 m!255757))

(assert (=> b!161532 m!255751))

(assert (=> b!161462 d!55301))

(declare-fun d!55303 () Bool)

(assert (=> d!55303 (= (byteRangesEq!0 (select (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 thiss!1602)) lt!254176 #b00000000000000000000000000000000 (currentBit!7519 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7519 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4499 (buf!4036 thiss!1602)) (currentByte!7524 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7519 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!254176) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7519 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13752 () Bool)

(assert (= bs!13752 d!55303))

(declare-fun m!255917 () Bool)

(assert (=> bs!13752 m!255917))

(declare-fun m!255919 () Bool)

(assert (=> bs!13752 m!255919))

(assert (=> b!161465 d!55303))

(declare-fun d!55305 () Bool)

(assert (=> d!55305 (= (array_inv!3325 (buf!4036 thiss!1602)) (bvsge (size!3578 (buf!4036 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161464 d!55305))

(check-sat (not d!55285) (not d!55287) (not b!161522) (not b!161519) (not b!161532) (not b!161521) (not b!161510) (not b!161531) (not b!161529) (not d!55301) (not d!55281) (not d!55269))
(check-sat)
