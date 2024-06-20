; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32210 () Bool)

(assert start!32210)

(declare-fun b!159341 () Bool)

(declare-fun res!133004 () Bool)

(declare-fun e!108776 () Bool)

(assert (=> b!159341 (=> res!133004 e!108776)))

(declare-fun lt!251504 () (_ BitVec 32))

(assert (=> b!159341 (= res!133004 (bvsle lt!251504 #b00000000000000000000000000000000))))

(declare-fun res!133003 () Bool)

(declare-fun e!108775 () Bool)

(assert (=> start!32210 (=> (not res!133003) (not e!108775))))

(declare-datatypes ((array!7576 0))(
  ( (array!7577 (arr!4353 (Array (_ BitVec 32) (_ BitVec 8))) (size!3432 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6032 0))(
  ( (BitStream!6033 (buf!3890 array!7576) (currentByte!7118 (_ BitVec 32)) (currentBit!7113 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6032)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32210 (= res!133003 (validate_offset_byte!0 ((_ sign_extend 32) (size!3432 (buf!3890 thiss!1602))) ((_ sign_extend 32) (currentByte!7118 thiss!1602)) ((_ sign_extend 32) (currentBit!7113 thiss!1602))))))

(assert (=> start!32210 e!108775))

(declare-fun e!108777 () Bool)

(declare-fun inv!12 (BitStream!6032) Bool)

(assert (=> start!32210 (and (inv!12 thiss!1602) e!108777)))

(assert (=> start!32210 true))

(declare-fun b!159342 () Bool)

(assert (=> b!159342 (= e!108775 (not e!108776))))

(declare-fun res!133002 () Bool)

(assert (=> b!159342 (=> res!133002 e!108776)))

(declare-datatypes ((Unit!10819 0))(
  ( (Unit!10820) )
))
(declare-datatypes ((tuple3!766 0))(
  ( (tuple3!767 (_1!7731 Unit!10819) (_2!7731 (_ BitVec 8)) (_3!500 BitStream!6032)) )
))
(declare-fun lt!251501 () tuple3!766)

(declare-fun lt!251500 () array!7576)

(declare-fun arrayRangesEq!483 (array!7576 array!7576 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159342 (= res!133002 (not (arrayRangesEq!483 (buf!3890 thiss!1602) lt!251500 #b00000000000000000000000000000000 (bvsub (currentByte!7118 (_3!500 lt!251501)) #b00000000000000000000000000000001))))))

(declare-fun lt!251507 () (_ BitVec 8))

(assert (=> b!159342 (arrayRangesEq!483 (buf!3890 thiss!1602) (array!7577 (store (arr!4353 (buf!3890 thiss!1602)) (bvsub (currentByte!7118 (_3!500 lt!251501)) #b00000000000000000000000000000001) lt!251507) (size!3432 (buf!3890 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7118 (_3!500 lt!251501)) #b00000000000000000000000000000001))))

(declare-fun lt!251510 () Unit!10819)

(declare-fun arrayUpdatedAtPrefixLemma!91 (array!7576 (_ BitVec 32) (_ BitVec 8)) Unit!10819)

(assert (=> b!159342 (= lt!251510 (arrayUpdatedAtPrefixLemma!91 (buf!3890 thiss!1602) (bvsub (currentByte!7118 (_3!500 lt!251501)) #b00000000000000000000000000000001) lt!251507))))

(assert (=> b!159342 (= lt!251507 (select (arr!4353 (buf!3890 (_3!500 lt!251501))) (bvsub (currentByte!7118 (_3!500 lt!251501)) #b00000000000000000000000000000001)))))

(declare-fun lt!251505 () (_ BitVec 32))

(declare-fun lt!251509 () (_ BitVec 32))

(declare-fun lt!251502 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!251499 () (_ BitVec 8))

(declare-fun lt!251508 () (_ BitVec 8))

(declare-fun Unit!10821 () Unit!10819)

(declare-fun Unit!10822 () Unit!10819)

(assert (=> b!159342 (= lt!251501 (ite (bvsgt lt!251504 #b00000000000000000000000000000000) (let ((bdg!9350 ((_ extract 7 0) (bvnot lt!251509)))) (let ((bdg!9351 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4353 (buf!3890 thiss!1602)) (currentByte!7118 thiss!1602) lt!251502) (currentByte!7118 thiss!1602) lt!251499) (bvadd #b00000000000000000000000000000001 (currentByte!7118 thiss!1602)))) ((_ sign_extend 24) bdg!9350))))) (tuple3!767 Unit!10821 bdg!9350 (BitStream!6033 (array!7577 (store (arr!4353 (array!7577 (store (arr!4353 lt!251500) (bvadd #b00000000000000000000000000000001 (currentByte!7118 thiss!1602)) bdg!9351) (size!3432 lt!251500))) (bvadd #b00000000000000000000000000000001 (currentByte!7118 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9351) (bvshl ((_ sign_extend 24) v!222) lt!251505)))) (size!3432 (array!7577 (store (arr!4353 lt!251500) (bvadd #b00000000000000000000000000000001 (currentByte!7118 thiss!1602)) bdg!9351) (size!3432 lt!251500)))) (bvadd #b00000000000000000000000000000001 (currentByte!7118 thiss!1602)) (currentBit!7113 thiss!1602))))) (tuple3!767 Unit!10822 lt!251508 (BitStream!6033 lt!251500 (bvadd #b00000000000000000000000000000001 (currentByte!7118 thiss!1602)) (currentBit!7113 thiss!1602)))))))

(declare-fun e!108774 () Bool)

(assert (=> b!159342 e!108774))

(declare-fun res!133001 () Bool)

(assert (=> b!159342 (=> res!133001 e!108774)))

(assert (=> b!159342 (= res!133001 (bvsge (currentByte!7118 thiss!1602) (size!3432 (buf!3890 thiss!1602))))))

(assert (=> b!159342 (= lt!251500 (array!7577 (store (store (arr!4353 (buf!3890 thiss!1602)) (currentByte!7118 thiss!1602) lt!251502) (currentByte!7118 thiss!1602) lt!251499) (size!3432 (buf!3890 thiss!1602))))))

(assert (=> b!159342 (= lt!251499 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!251502) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!251504))))))

(assert (=> b!159342 (= lt!251502 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4353 (buf!3890 thiss!1602)) (currentByte!7118 thiss!1602))) lt!251509)))))

(assert (=> b!159342 (= lt!251509 ((_ sign_extend 24) lt!251508))))

(assert (=> b!159342 (= lt!251508 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!251505)))))))

(assert (=> b!159342 (= lt!251505 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!251504))))))

(assert (=> b!159342 (= lt!251504 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7113 thiss!1602))))))

(declare-fun b!159343 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159343 (= e!108774 (byteRangesEq!0 (select (arr!4353 (buf!3890 thiss!1602)) (currentByte!7118 thiss!1602)) lt!251499 #b00000000000000000000000000000000 (currentBit!7113 thiss!1602)))))

(declare-fun b!159344 () Bool)

(assert (=> b!159344 (= e!108776 (or (bvsgt #b00000000000000000000000000000000 (currentByte!7118 thiss!1602)) (bvsle (size!3432 (buf!3890 thiss!1602)) (size!3432 (buf!3890 (_3!500 lt!251501))))))))

(assert (=> b!159344 (arrayRangesEq!483 (buf!3890 thiss!1602) (buf!3890 (_3!500 lt!251501)) #b00000000000000000000000000000000 (bvsub (currentByte!7118 (_3!500 lt!251501)) #b00000000000000000000000000000001))))

(declare-fun lt!251511 () Unit!10819)

(declare-fun arrayRangesEqTransitive!126 (array!7576 array!7576 array!7576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10819)

(assert (=> b!159344 (= lt!251511 (arrayRangesEqTransitive!126 (buf!3890 thiss!1602) lt!251500 (buf!3890 (_3!500 lt!251501)) #b00000000000000000000000000000000 (bvsub (currentByte!7118 (_3!500 lt!251501)) #b00000000000000000000000000000001) (currentByte!7118 (_3!500 lt!251501))))))

(assert (=> b!159344 (arrayRangesEq!483 lt!251500 (array!7577 (store (store (store (arr!4353 (buf!3890 thiss!1602)) (currentByte!7118 thiss!1602) lt!251502) (currentByte!7118 thiss!1602) lt!251499) (currentByte!7118 (_3!500 lt!251501)) (select (arr!4353 (buf!3890 (_3!500 lt!251501))) (currentByte!7118 (_3!500 lt!251501)))) (size!3432 (buf!3890 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7118 (_3!500 lt!251501)))))

(declare-fun lt!251506 () Unit!10819)

(assert (=> b!159344 (= lt!251506 (arrayUpdatedAtPrefixLemma!91 lt!251500 (currentByte!7118 (_3!500 lt!251501)) (select (arr!4353 (buf!3890 (_3!500 lt!251501))) (currentByte!7118 (_3!500 lt!251501)))))))

(assert (=> b!159344 (arrayRangesEq!483 (buf!3890 thiss!1602) (array!7577 (store (arr!4353 (buf!3890 thiss!1602)) (currentByte!7118 (_3!500 lt!251501)) (select (arr!4353 (buf!3890 (_3!500 lt!251501))) (currentByte!7118 (_3!500 lt!251501)))) (size!3432 (buf!3890 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7118 (_3!500 lt!251501)))))

(declare-fun lt!251503 () Unit!10819)

(assert (=> b!159344 (= lt!251503 (arrayUpdatedAtPrefixLemma!91 (buf!3890 thiss!1602) (currentByte!7118 (_3!500 lt!251501)) (select (arr!4353 (buf!3890 (_3!500 lt!251501))) (currentByte!7118 (_3!500 lt!251501)))))))

(declare-fun b!159345 () Bool)

(declare-fun array_inv!3179 (array!7576) Bool)

(assert (=> b!159345 (= e!108777 (array_inv!3179 (buf!3890 thiss!1602)))))

(assert (= (and start!32210 res!133003) b!159342))

(assert (= (and b!159342 (not res!133001)) b!159343))

(assert (= (and b!159342 (not res!133002)) b!159341))

(assert (= (and b!159341 (not res!133004)) b!159344))

(assert (= start!32210 b!159345))

(declare-fun m!250973 () Bool)

(assert (=> start!32210 m!250973))

(declare-fun m!250975 () Bool)

(assert (=> start!32210 m!250975))

(declare-fun m!250977 () Bool)

(assert (=> b!159343 m!250977))

(assert (=> b!159343 m!250977))

(declare-fun m!250979 () Bool)

(assert (=> b!159343 m!250979))

(declare-fun m!250981 () Bool)

(assert (=> b!159345 m!250981))

(declare-fun m!250983 () Bool)

(assert (=> b!159342 m!250983))

(declare-fun m!250985 () Bool)

(assert (=> b!159342 m!250985))

(declare-fun m!250987 () Bool)

(assert (=> b!159342 m!250987))

(assert (=> b!159342 m!250977))

(declare-fun m!250989 () Bool)

(assert (=> b!159342 m!250989))

(declare-fun m!250991 () Bool)

(assert (=> b!159342 m!250991))

(declare-fun m!250993 () Bool)

(assert (=> b!159342 m!250993))

(declare-fun m!250995 () Bool)

(assert (=> b!159342 m!250995))

(declare-fun m!250997 () Bool)

(assert (=> b!159342 m!250997))

(declare-fun m!250999 () Bool)

(assert (=> b!159342 m!250999))

(declare-fun m!251001 () Bool)

(assert (=> b!159342 m!251001))

(declare-fun m!251003 () Bool)

(assert (=> b!159342 m!251003))

(declare-fun m!251005 () Bool)

(assert (=> b!159344 m!251005))

(assert (=> b!159344 m!250985))

(declare-fun m!251007 () Bool)

(assert (=> b!159344 m!251007))

(declare-fun m!251009 () Bool)

(assert (=> b!159344 m!251009))

(declare-fun m!251011 () Bool)

(assert (=> b!159344 m!251011))

(declare-fun m!251013 () Bool)

(assert (=> b!159344 m!251013))

(declare-fun m!251015 () Bool)

(assert (=> b!159344 m!251015))

(assert (=> b!159344 m!251013))

(declare-fun m!251017 () Bool)

(assert (=> b!159344 m!251017))

(declare-fun m!251019 () Bool)

(assert (=> b!159344 m!251019))

(assert (=> b!159344 m!251013))

(declare-fun m!251021 () Bool)

(assert (=> b!159344 m!251021))

(assert (=> b!159344 m!250991))

(push 1)

(assert (not b!159345))

(assert (not b!159343))

(assert (not start!32210))

(assert (not b!159342))

(assert (not b!159344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

