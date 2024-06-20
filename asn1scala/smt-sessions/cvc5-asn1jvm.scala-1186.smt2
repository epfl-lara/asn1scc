; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33700 () Bool)

(assert start!33700)

(declare-fun b!161286 () Bool)

(declare-fun e!111004 () Bool)

(declare-datatypes ((array!7957 0))(
  ( (array!7958 (arr!4492 (Array (_ BitVec 32) (_ BitVec 8))) (size!3571 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6310 0))(
  ( (BitStream!6311 (buf!4029 array!7957) (currentByte!7512 (_ BitVec 32)) (currentBit!7507 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11054 0))(
  ( (Unit!11055) )
))
(declare-datatypes ((tuple3!870 0))(
  ( (tuple3!871 (_1!7786 Unit!11054) (_2!7786 (_ BitVec 8)) (_3!552 BitStream!6310)) )
))
(declare-fun lt!253912 () tuple3!870)

(declare-fun thiss!1602 () BitStream!6310)

(assert (=> b!161286 (= e!111004 (and (bvsle #b00000000000000000000000000000000 (currentByte!7512 (_3!552 lt!253912))) (bvslt (currentByte!7512 (_3!552 lt!253912)) (size!3571 (buf!4029 thiss!1602)))))))

(declare-fun arrayRangesEq!523 (array!7957 array!7957 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161286 (arrayRangesEq!523 (buf!4029 thiss!1602) (array!7958 (store (arr!4492 (buf!4029 thiss!1602)) (currentByte!7512 (_3!552 lt!253912)) (select (arr!4492 (buf!4029 (_3!552 lt!253912))) (currentByte!7512 (_3!552 lt!253912)))) (size!3571 (buf!4029 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7512 (_3!552 lt!253912)))))

(declare-fun lt!253915 () Unit!11054)

(declare-fun arrayUpdatedAtPrefixLemma!131 (array!7957 (_ BitVec 32) (_ BitVec 8)) Unit!11054)

(assert (=> b!161286 (= lt!253915 (arrayUpdatedAtPrefixLemma!131 (buf!4029 thiss!1602) (currentByte!7512 (_3!552 lt!253912)) (select (arr!4492 (buf!4029 (_3!552 lt!253912))) (currentByte!7512 (_3!552 lt!253912)))))))

(declare-fun b!161287 () Bool)

(declare-fun e!111003 () Bool)

(assert (=> b!161287 (= e!111003 (not e!111004))))

(declare-fun res!134440 () Bool)

(assert (=> b!161287 (=> res!134440 e!111004)))

(declare-fun lt!253906 () array!7957)

(assert (=> b!161287 (= res!134440 (not (arrayRangesEq!523 (buf!4029 thiss!1602) lt!253906 #b00000000000000000000000000000000 (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001))))))

(declare-fun lt!253908 () (_ BitVec 8))

(assert (=> b!161287 (arrayRangesEq!523 (buf!4029 thiss!1602) (array!7958 (store (arr!4492 (buf!4029 thiss!1602)) (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001) lt!253908) (size!3571 (buf!4029 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001))))

(declare-fun lt!253907 () Unit!11054)

(assert (=> b!161287 (= lt!253907 (arrayUpdatedAtPrefixLemma!131 (buf!4029 thiss!1602) (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001) lt!253908))))

(assert (=> b!161287 (= lt!253908 (select (arr!4492 (buf!4029 (_3!552 lt!253912))) (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001)))))

(declare-fun lt!253916 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253913 () (_ BitVec 32))

(declare-fun lt!253911 () (_ BitVec 8))

(declare-fun lt!253910 () (_ BitVec 32))

(declare-fun lt!253914 () (_ BitVec 8))

(declare-fun lt!253909 () (_ BitVec 32))

(declare-fun Unit!11056 () Unit!11054)

(declare-fun Unit!11057 () Unit!11054)

(assert (=> b!161287 (= lt!253912 (ite (bvsgt lt!253909 #b00000000000000000000000000000000) (let ((bdg!9622 ((_ extract 7 0) (bvnot lt!253910)))) (let ((bdg!9623 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4492 (buf!4029 thiss!1602)) (currentByte!7512 thiss!1602) lt!253914) (currentByte!7512 thiss!1602) lt!253911) (bvadd #b00000000000000000000000000000001 (currentByte!7512 thiss!1602)))) ((_ sign_extend 24) bdg!9622))))) (tuple3!871 Unit!11056 bdg!9622 (BitStream!6311 (array!7958 (store (arr!4492 (array!7958 (store (arr!4492 lt!253906) (bvadd #b00000000000000000000000000000001 (currentByte!7512 thiss!1602)) bdg!9623) (size!3571 lt!253906))) (bvadd #b00000000000000000000000000000001 (currentByte!7512 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9623) (bvshl ((_ sign_extend 24) v!222) lt!253913)))) (size!3571 (array!7958 (store (arr!4492 lt!253906) (bvadd #b00000000000000000000000000000001 (currentByte!7512 thiss!1602)) bdg!9623) (size!3571 lt!253906)))) (bvadd #b00000000000000000000000000000001 (currentByte!7512 thiss!1602)) (currentBit!7507 thiss!1602))))) (tuple3!871 Unit!11057 lt!253916 (BitStream!6311 lt!253906 (bvadd #b00000000000000000000000000000001 (currentByte!7512 thiss!1602)) (currentBit!7507 thiss!1602)))))))

(declare-fun e!111007 () Bool)

(assert (=> b!161287 e!111007))

(declare-fun res!134441 () Bool)

(assert (=> b!161287 (=> res!134441 e!111007)))

(assert (=> b!161287 (= res!134441 (bvsge (currentByte!7512 thiss!1602) (size!3571 (buf!4029 thiss!1602))))))

(assert (=> b!161287 (= lt!253906 (array!7958 (store (store (arr!4492 (buf!4029 thiss!1602)) (currentByte!7512 thiss!1602) lt!253914) (currentByte!7512 thiss!1602) lt!253911) (size!3571 (buf!4029 thiss!1602))))))

(assert (=> b!161287 (= lt!253911 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253914) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253909))))))

(assert (=> b!161287 (= lt!253914 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4492 (buf!4029 thiss!1602)) (currentByte!7512 thiss!1602))) lt!253910)))))

(assert (=> b!161287 (= lt!253910 ((_ sign_extend 24) lt!253916))))

(assert (=> b!161287 (= lt!253916 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253913)))))))

(assert (=> b!161287 (= lt!253913 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253909))))))

(assert (=> b!161287 (= lt!253909 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7507 thiss!1602))))))

(declare-fun b!161288 () Bool)

(declare-fun e!111006 () Bool)

(declare-fun array_inv!3318 (array!7957) Bool)

(assert (=> b!161288 (= e!111006 (array_inv!3318 (buf!4029 thiss!1602)))))

(declare-fun b!161290 () Bool)

(declare-fun res!134439 () Bool)

(assert (=> b!161290 (=> res!134439 e!111004)))

(assert (=> b!161290 (= res!134439 (bvsle lt!253909 #b00000000000000000000000000000000))))

(declare-fun b!161289 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161289 (= e!111007 (byteRangesEq!0 (select (arr!4492 (buf!4029 thiss!1602)) (currentByte!7512 thiss!1602)) lt!253911 #b00000000000000000000000000000000 (currentBit!7507 thiss!1602)))))

(declare-fun res!134442 () Bool)

(assert (=> start!33700 (=> (not res!134442) (not e!111003))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33700 (= res!134442 (validate_offset_byte!0 ((_ sign_extend 32) (size!3571 (buf!4029 thiss!1602))) ((_ sign_extend 32) (currentByte!7512 thiss!1602)) ((_ sign_extend 32) (currentBit!7507 thiss!1602))))))

(assert (=> start!33700 e!111003))

(declare-fun inv!12 (BitStream!6310) Bool)

(assert (=> start!33700 (and (inv!12 thiss!1602) e!111006)))

(assert (=> start!33700 true))

(assert (= (and start!33700 res!134442) b!161287))

(assert (= (and b!161287 (not res!134441)) b!161289))

(assert (= (and b!161287 (not res!134440)) b!161290))

(assert (= (and b!161290 (not res!134439)) b!161286))

(assert (= start!33700 b!161288))

(declare-fun m!255275 () Bool)

(assert (=> b!161286 m!255275))

(declare-fun m!255277 () Bool)

(assert (=> b!161286 m!255277))

(declare-fun m!255279 () Bool)

(assert (=> b!161286 m!255279))

(assert (=> b!161286 m!255275))

(declare-fun m!255281 () Bool)

(assert (=> b!161286 m!255281))

(declare-fun m!255283 () Bool)

(assert (=> b!161287 m!255283))

(declare-fun m!255285 () Bool)

(assert (=> b!161287 m!255285))

(declare-fun m!255287 () Bool)

(assert (=> b!161287 m!255287))

(declare-fun m!255289 () Bool)

(assert (=> b!161287 m!255289))

(declare-fun m!255291 () Bool)

(assert (=> b!161287 m!255291))

(declare-fun m!255293 () Bool)

(assert (=> b!161287 m!255293))

(declare-fun m!255295 () Bool)

(assert (=> b!161287 m!255295))

(declare-fun m!255297 () Bool)

(assert (=> b!161287 m!255297))

(declare-fun m!255299 () Bool)

(assert (=> b!161287 m!255299))

(declare-fun m!255301 () Bool)

(assert (=> b!161287 m!255301))

(declare-fun m!255303 () Bool)

(assert (=> b!161287 m!255303))

(declare-fun m!255305 () Bool)

(assert (=> b!161287 m!255305))

(declare-fun m!255307 () Bool)

(assert (=> start!33700 m!255307))

(declare-fun m!255309 () Bool)

(assert (=> start!33700 m!255309))

(declare-fun m!255311 () Bool)

(assert (=> b!161288 m!255311))

(assert (=> b!161289 m!255287))

(assert (=> b!161289 m!255287))

(declare-fun m!255313 () Bool)

(assert (=> b!161289 m!255313))

(push 1)

(assert (not start!33700))

(assert (not b!161286))

(assert (not b!161287))

(assert (not b!161289))

(assert (not b!161288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!55143 () Bool)

(assert (=> d!55143 (= (byteRangesEq!0 (select (arr!4492 (buf!4029 thiss!1602)) (currentByte!7512 thiss!1602)) lt!253911 #b00000000000000000000000000000000 (currentBit!7507 thiss!1602)) (or (= #b00000000000000000000000000000000 (currentBit!7507 thiss!1602)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4492 (buf!4029 thiss!1602)) (currentByte!7512 thiss!1602))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7507 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!253911) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (currentBit!7507 thiss!1602)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!13723 () Bool)

(assert (= bs!13723 d!55143))

(declare-fun m!255395 () Bool)

(assert (=> bs!13723 m!255395))

(declare-fun m!255397 () Bool)

(assert (=> bs!13723 m!255397))

(assert (=> b!161289 d!55143))

(declare-fun d!55145 () Bool)

(assert (=> d!55145 (= (array_inv!3318 (buf!4029 thiss!1602)) (bvsge (size!3571 (buf!4029 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!161288 d!55145))

(declare-fun d!55147 () Bool)

(declare-fun res!134471 () Bool)

(declare-fun e!111042 () Bool)

(assert (=> d!55147 (=> res!134471 e!111042)))

(assert (=> d!55147 (= res!134471 (= #b00000000000000000000000000000000 (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001)))))

(assert (=> d!55147 (= (arrayRangesEq!523 (buf!4029 thiss!1602) lt!253906 #b00000000000000000000000000000000 (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001)) e!111042)))

(declare-fun b!161325 () Bool)

(declare-fun e!111043 () Bool)

(assert (=> b!161325 (= e!111042 e!111043)))

(declare-fun res!134472 () Bool)

(assert (=> b!161325 (=> (not res!134472) (not e!111043))))

(assert (=> b!161325 (= res!134472 (= (select (arr!4492 (buf!4029 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4492 lt!253906) #b00000000000000000000000000000000)))))

(declare-fun b!161326 () Bool)

(assert (=> b!161326 (= e!111043 (arrayRangesEq!523 (buf!4029 thiss!1602) lt!253906 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001)))))

(assert (= (and d!55147 (not res!134471)) b!161325))

(assert (= (and b!161325 res!134472) b!161326))

(declare-fun m!255399 () Bool)

(assert (=> b!161325 m!255399))

(declare-fun m!255401 () Bool)

(assert (=> b!161325 m!255401))

(declare-fun m!255403 () Bool)

(assert (=> b!161326 m!255403))

(assert (=> b!161287 d!55147))

(declare-fun d!55149 () Bool)

(declare-fun res!134473 () Bool)

(declare-fun e!111044 () Bool)

(assert (=> d!55149 (=> res!134473 e!111044)))

(assert (=> d!55149 (= res!134473 (= #b00000000000000000000000000000000 (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001)))))

(assert (=> d!55149 (= (arrayRangesEq!523 (buf!4029 thiss!1602) (array!7958 (store (arr!4492 (buf!4029 thiss!1602)) (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001) lt!253908) (size!3571 (buf!4029 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001)) e!111044)))

(declare-fun b!161327 () Bool)

(declare-fun e!111045 () Bool)

(assert (=> b!161327 (= e!111044 e!111045)))

(declare-fun res!134474 () Bool)

(assert (=> b!161327 (=> (not res!134474) (not e!111045))))

(assert (=> b!161327 (= res!134474 (= (select (arr!4492 (buf!4029 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4492 (array!7958 (store (arr!4492 (buf!4029 thiss!1602)) (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001) lt!253908) (size!3571 (buf!4029 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161328 () Bool)

(assert (=> b!161328 (= e!111045 (arrayRangesEq!523 (buf!4029 thiss!1602) (array!7958 (store (arr!4492 (buf!4029 thiss!1602)) (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001) lt!253908) (size!3571 (buf!4029 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001)))))

(assert (= (and d!55149 (not res!134473)) b!161327))

(assert (= (and b!161327 res!134474) b!161328))

(assert (=> b!161327 m!255399))

(declare-fun m!255405 () Bool)

(assert (=> b!161327 m!255405))

(declare-fun m!255407 () Bool)

(assert (=> b!161328 m!255407))

(assert (=> b!161287 d!55149))

(declare-fun d!55151 () Bool)

(declare-fun e!111048 () Bool)

(assert (=> d!55151 e!111048))

(declare-fun res!134477 () Bool)

(assert (=> d!55151 (=> (not res!134477) (not e!111048))))

(assert (=> d!55151 (= res!134477 (and (bvsge (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001) (size!3571 (buf!4029 thiss!1602)))))))

(declare-fun lt!253985 () Unit!11054)

(declare-fun choose!160 (array!7957 (_ BitVec 32) (_ BitVec 8)) Unit!11054)

(assert (=> d!55151 (= lt!253985 (choose!160 (buf!4029 thiss!1602) (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001) lt!253908))))

(assert (=> d!55151 (and (bvsle #b00000000000000000000000000000000 (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001)) (bvslt (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001) (size!3571 (buf!4029 thiss!1602))))))

(assert (=> d!55151 (= (arrayUpdatedAtPrefixLemma!131 (buf!4029 thiss!1602) (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001) lt!253908) lt!253985)))

(declare-fun b!161331 () Bool)

(assert (=> b!161331 (= e!111048 (arrayRangesEq!523 (buf!4029 thiss!1602) (array!7958 (store (arr!4492 (buf!4029 thiss!1602)) (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001) lt!253908) (size!3571 (buf!4029 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000001)))))

(assert (= (and d!55151 res!134477) b!161331))

(declare-fun m!255409 () Bool)

(assert (=> d!55151 m!255409))

(assert (=> b!161331 m!255299))

(assert (=> b!161331 m!255303))

(assert (=> b!161287 d!55151))

(declare-fun d!55153 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!55153 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3571 (buf!4029 thiss!1602))) ((_ sign_extend 32) (currentByte!7512 thiss!1602)) ((_ sign_extend 32) (currentBit!7507 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3571 (buf!4029 thiss!1602))) ((_ sign_extend 32) (currentByte!7512 thiss!1602)) ((_ sign_extend 32) (currentBit!7507 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13724 () Bool)

(assert (= bs!13724 d!55153))

(declare-fun m!255411 () Bool)

(assert (=> bs!13724 m!255411))

(assert (=> start!33700 d!55153))

(declare-fun d!55155 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!55155 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7507 thiss!1602) (currentByte!7512 thiss!1602) (size!3571 (buf!4029 thiss!1602))))))

(declare-fun bs!13725 () Bool)

(assert (= bs!13725 d!55155))

(declare-fun m!255413 () Bool)

(assert (=> bs!13725 m!255413))

(assert (=> start!33700 d!55155))

(declare-fun d!55157 () Bool)

(declare-fun res!134478 () Bool)

(declare-fun e!111049 () Bool)

(assert (=> d!55157 (=> res!134478 e!111049)))

(assert (=> d!55157 (= res!134478 (= #b00000000000000000000000000000000 (currentByte!7512 (_3!552 lt!253912))))))

(assert (=> d!55157 (= (arrayRangesEq!523 (buf!4029 thiss!1602) (array!7958 (store (arr!4492 (buf!4029 thiss!1602)) (currentByte!7512 (_3!552 lt!253912)) (select (arr!4492 (buf!4029 (_3!552 lt!253912))) (currentByte!7512 (_3!552 lt!253912)))) (size!3571 (buf!4029 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7512 (_3!552 lt!253912))) e!111049)))

(declare-fun b!161332 () Bool)

(declare-fun e!111050 () Bool)

(assert (=> b!161332 (= e!111049 e!111050)))

(declare-fun res!134479 () Bool)

(assert (=> b!161332 (=> (not res!134479) (not e!111050))))

(assert (=> b!161332 (= res!134479 (= (select (arr!4492 (buf!4029 thiss!1602)) #b00000000000000000000000000000000) (select (arr!4492 (array!7958 (store (arr!4492 (buf!4029 thiss!1602)) (currentByte!7512 (_3!552 lt!253912)) (select (arr!4492 (buf!4029 (_3!552 lt!253912))) (currentByte!7512 (_3!552 lt!253912)))) (size!3571 (buf!4029 thiss!1602)))) #b00000000000000000000000000000000)))))

(declare-fun b!161333 () Bool)

(assert (=> b!161333 (= e!111050 (arrayRangesEq!523 (buf!4029 thiss!1602) (array!7958 (store (arr!4492 (buf!4029 thiss!1602)) (currentByte!7512 (_3!552 lt!253912)) (select (arr!4492 (buf!4029 (_3!552 lt!253912))) (currentByte!7512 (_3!552 lt!253912)))) (size!3571 (buf!4029 thiss!1602))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!7512 (_3!552 lt!253912))))))

(assert (= (and d!55157 (not res!134478)) b!161332))

(assert (= (and b!161332 res!134479) b!161333))

(assert (=> b!161332 m!255399))

(declare-fun m!255415 () Bool)

(assert (=> b!161332 m!255415))

(declare-fun m!255417 () Bool)

(assert (=> b!161333 m!255417))

(assert (=> b!161286 d!55157))

(declare-fun d!55159 () Bool)

(declare-fun e!111051 () Bool)

(assert (=> d!55159 e!111051))

(declare-fun res!134480 () Bool)

(assert (=> d!55159 (=> (not res!134480) (not e!111051))))

(assert (=> d!55159 (= res!134480 (and (bvsge (currentByte!7512 (_3!552 lt!253912)) #b00000000000000000000000000000000) (bvslt (currentByte!7512 (_3!552 lt!253912)) (size!3571 (buf!4029 thiss!1602)))))))

(declare-fun lt!253986 () Unit!11054)

(assert (=> d!55159 (= lt!253986 (choose!160 (buf!4029 thiss!1602) (currentByte!7512 (_3!552 lt!253912)) (select (arr!4492 (buf!4029 (_3!552 lt!253912))) (currentByte!7512 (_3!552 lt!253912)))))))

(assert (=> d!55159 (and (bvsle #b00000000000000000000000000000000 (currentByte!7512 (_3!552 lt!253912))) (bvslt (currentByte!7512 (_3!552 lt!253912)) (size!3571 (buf!4029 thiss!1602))))))

(assert (=> d!55159 (= (arrayUpdatedAtPrefixLemma!131 (buf!4029 thiss!1602) (currentByte!7512 (_3!552 lt!253912)) (select (arr!4492 (buf!4029 (_3!552 lt!253912))) (currentByte!7512 (_3!552 lt!253912)))) lt!253986)))

(declare-fun b!161334 () Bool)

(assert (=> b!161334 (= e!111051 (arrayRangesEq!523 (buf!4029 thiss!1602) (array!7958 (store (arr!4492 (buf!4029 thiss!1602)) (currentByte!7512 (_3!552 lt!253912)) (select (arr!4492 (buf!4029 (_3!552 lt!253912))) (currentByte!7512 (_3!552 lt!253912)))) (size!3571 (buf!4029 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7512 (_3!552 lt!253912))))))

(assert (= (and d!55159 res!134480) b!161334))

(assert (=> d!55159 m!255275))

(declare-fun m!255419 () Bool)

(assert (=> d!55159 m!255419))

(assert (=> b!161334 m!255277))

(assert (=> b!161334 m!255279))

(assert (=> b!161286 d!55159))

(push 1)

(assert (not b!161331))

(assert (not b!161333))

(assert (not b!161326))

(assert (not d!55155))

(assert (not d!55153))

(assert (not b!161328))

(assert (not d!55159))

(assert (not d!55151))

(assert (not b!161334))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

