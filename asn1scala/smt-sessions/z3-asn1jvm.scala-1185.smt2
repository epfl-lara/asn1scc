; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33672 () Bool)

(assert start!33672)

(declare-fun b!161228 () Bool)

(declare-fun e!110947 () Bool)

(declare-fun e!110946 () Bool)

(assert (=> b!161228 (= e!110947 (not e!110946))))

(declare-fun res!134387 () Bool)

(assert (=> b!161228 (=> res!134387 e!110946)))

(declare-datatypes ((array!7951 0))(
  ( (array!7952 (arr!4490 (Array (_ BitVec 32) (_ BitVec 8))) (size!3569 (_ BitVec 32))) )
))
(declare-fun lt!253834 () array!7951)

(declare-datatypes ((BitStream!6306 0))(
  ( (BitStream!6307 (buf!4027 array!7951) (currentByte!7508 (_ BitVec 32)) (currentBit!7503 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11046 0))(
  ( (Unit!11047) )
))
(declare-datatypes ((tuple3!866 0))(
  ( (tuple3!867 (_1!7784 Unit!11046) (_2!7784 (_ BitVec 8)) (_3!550 BitStream!6306)) )
))
(declare-fun lt!253833 () tuple3!866)

(declare-fun thiss!1602 () BitStream!6306)

(declare-fun arrayRangesEq!521 (array!7951 array!7951 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161228 (= res!134387 (not (arrayRangesEq!521 (buf!4027 thiss!1602) lt!253834 #b00000000000000000000000000000000 (bvsub (currentByte!7508 (_3!550 lt!253833)) #b00000000000000000000000000000001))))))

(declare-fun lt!253835 () (_ BitVec 8))

(assert (=> b!161228 (arrayRangesEq!521 (buf!4027 thiss!1602) (array!7952 (store (arr!4490 (buf!4027 thiss!1602)) (bvsub (currentByte!7508 (_3!550 lt!253833)) #b00000000000000000000000000000001) lt!253835) (size!3569 (buf!4027 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7508 (_3!550 lt!253833)) #b00000000000000000000000000000001))))

(declare-fun lt!253840 () Unit!11046)

(declare-fun arrayUpdatedAtPrefixLemma!129 (array!7951 (_ BitVec 32) (_ BitVec 8)) Unit!11046)

(assert (=> b!161228 (= lt!253840 (arrayUpdatedAtPrefixLemma!129 (buf!4027 thiss!1602) (bvsub (currentByte!7508 (_3!550 lt!253833)) #b00000000000000000000000000000001) lt!253835))))

(assert (=> b!161228 (= lt!253835 (select (arr!4490 (buf!4027 (_3!550 lt!253833))) (bvsub (currentByte!7508 (_3!550 lt!253833)) #b00000000000000000000000000000001)))))

(declare-fun lt!253842 () (_ BitVec 8))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!253841 () (_ BitVec 8))

(declare-fun lt!253836 () (_ BitVec 32))

(declare-fun lt!253837 () (_ BitVec 32))

(declare-fun lt!253839 () (_ BitVec 32))

(declare-fun lt!253838 () (_ BitVec 8))

(declare-fun Unit!11048 () Unit!11046)

(declare-fun Unit!11049 () Unit!11046)

(assert (=> b!161228 (= lt!253833 (ite (bvsgt lt!253837 #b00000000000000000000000000000000) (let ((bdg!9609 ((_ extract 7 0) (bvnot lt!253839)))) (let ((bdg!9610 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4490 (buf!4027 thiss!1602)) (currentByte!7508 thiss!1602) lt!253838) (currentByte!7508 thiss!1602) lt!253841) (bvadd #b00000000000000000000000000000001 (currentByte!7508 thiss!1602)))) ((_ sign_extend 24) bdg!9609))))) (tuple3!867 Unit!11048 bdg!9609 (BitStream!6307 (array!7952 (store (arr!4490 (array!7952 (store (arr!4490 lt!253834) (bvadd #b00000000000000000000000000000001 (currentByte!7508 thiss!1602)) bdg!9610) (size!3569 lt!253834))) (bvadd #b00000000000000000000000000000001 (currentByte!7508 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9610) (bvshl ((_ sign_extend 24) v!222) lt!253836)))) (size!3569 (array!7952 (store (arr!4490 lt!253834) (bvadd #b00000000000000000000000000000001 (currentByte!7508 thiss!1602)) bdg!9610) (size!3569 lt!253834)))) (bvadd #b00000000000000000000000000000001 (currentByte!7508 thiss!1602)) (currentBit!7503 thiss!1602))))) (tuple3!867 Unit!11049 lt!253842 (BitStream!6307 lt!253834 (bvadd #b00000000000000000000000000000001 (currentByte!7508 thiss!1602)) (currentBit!7503 thiss!1602)))))))

(declare-fun e!110945 () Bool)

(assert (=> b!161228 e!110945))

(declare-fun res!134389 () Bool)

(assert (=> b!161228 (=> res!134389 e!110945)))

(assert (=> b!161228 (= res!134389 (bvsge (currentByte!7508 thiss!1602) (size!3569 (buf!4027 thiss!1602))))))

(assert (=> b!161228 (= lt!253834 (array!7952 (store (store (arr!4490 (buf!4027 thiss!1602)) (currentByte!7508 thiss!1602) lt!253838) (currentByte!7508 thiss!1602) lt!253841) (size!3569 (buf!4027 thiss!1602))))))

(assert (=> b!161228 (= lt!253841 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!253838) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!253837))))))

(assert (=> b!161228 (= lt!253838 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4490 (buf!4027 thiss!1602)) (currentByte!7508 thiss!1602))) lt!253839)))))

(assert (=> b!161228 (= lt!253839 ((_ sign_extend 24) lt!253842))))

(assert (=> b!161228 (= lt!253842 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!253836)))))))

(assert (=> b!161228 (= lt!253836 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!253837))))))

(assert (=> b!161228 (= lt!253837 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7503 thiss!1602))))))

(declare-fun b!161229 () Bool)

(assert (=> b!161229 (= e!110946 (and (bvsge (currentByte!7508 (_3!550 lt!253833)) #b00000000000000000000000000000000) (bvslt (currentByte!7508 (_3!550 lt!253833)) (size!3569 (buf!4027 (_3!550 lt!253833))))))))

(assert (=> b!161229 (arrayRangesEq!521 (buf!4027 thiss!1602) (array!7952 (store (arr!4490 (buf!4027 thiss!1602)) (currentByte!7508 (_3!550 lt!253833)) (select (arr!4490 (buf!4027 (_3!550 lt!253833))) (currentByte!7508 (_3!550 lt!253833)))) (size!3569 (buf!4027 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7508 (_3!550 lt!253833)))))

(declare-fun lt!253832 () Unit!11046)

(assert (=> b!161229 (= lt!253832 (arrayUpdatedAtPrefixLemma!129 (buf!4027 thiss!1602) (currentByte!7508 (_3!550 lt!253833)) (select (arr!4490 (buf!4027 (_3!550 lt!253833))) (currentByte!7508 (_3!550 lt!253833)))))))

(declare-fun res!134390 () Bool)

(assert (=> start!33672 (=> (not res!134390) (not e!110947))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33672 (= res!134390 (validate_offset_byte!0 ((_ sign_extend 32) (size!3569 (buf!4027 thiss!1602))) ((_ sign_extend 32) (currentByte!7508 thiss!1602)) ((_ sign_extend 32) (currentBit!7503 thiss!1602))))))

(assert (=> start!33672 e!110947))

(declare-fun e!110948 () Bool)

(declare-fun inv!12 (BitStream!6306) Bool)

(assert (=> start!33672 (and (inv!12 thiss!1602) e!110948)))

(assert (=> start!33672 true))

(declare-fun b!161230 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161230 (= e!110945 (byteRangesEq!0 (select (arr!4490 (buf!4027 thiss!1602)) (currentByte!7508 thiss!1602)) lt!253841 #b00000000000000000000000000000000 (currentBit!7503 thiss!1602)))))

(declare-fun b!161231 () Bool)

(declare-fun res!134388 () Bool)

(assert (=> b!161231 (=> res!134388 e!110946)))

(assert (=> b!161231 (= res!134388 (bvsle lt!253837 #b00000000000000000000000000000000))))

(declare-fun b!161232 () Bool)

(declare-fun array_inv!3316 (array!7951) Bool)

(assert (=> b!161232 (= e!110948 (array_inv!3316 (buf!4027 thiss!1602)))))

(assert (= (and start!33672 res!134390) b!161228))

(assert (= (and b!161228 (not res!134389)) b!161230))

(assert (= (and b!161228 (not res!134387)) b!161231))

(assert (= (and b!161231 (not res!134388)) b!161229))

(assert (= start!33672 b!161232))

(declare-fun m!255143 () Bool)

(assert (=> b!161228 m!255143))

(declare-fun m!255145 () Bool)

(assert (=> b!161228 m!255145))

(declare-fun m!255147 () Bool)

(assert (=> b!161228 m!255147))

(declare-fun m!255149 () Bool)

(assert (=> b!161228 m!255149))

(declare-fun m!255151 () Bool)

(assert (=> b!161228 m!255151))

(declare-fun m!255153 () Bool)

(assert (=> b!161228 m!255153))

(declare-fun m!255155 () Bool)

(assert (=> b!161228 m!255155))

(declare-fun m!255157 () Bool)

(assert (=> b!161228 m!255157))

(declare-fun m!255159 () Bool)

(assert (=> b!161228 m!255159))

(declare-fun m!255161 () Bool)

(assert (=> b!161228 m!255161))

(declare-fun m!255163 () Bool)

(assert (=> b!161228 m!255163))

(declare-fun m!255165 () Bool)

(assert (=> b!161228 m!255165))

(declare-fun m!255167 () Bool)

(assert (=> b!161232 m!255167))

(declare-fun m!255169 () Bool)

(assert (=> b!161229 m!255169))

(declare-fun m!255171 () Bool)

(assert (=> b!161229 m!255171))

(declare-fun m!255173 () Bool)

(assert (=> b!161229 m!255173))

(assert (=> b!161229 m!255169))

(declare-fun m!255175 () Bool)

(assert (=> b!161229 m!255175))

(assert (=> b!161230 m!255153))

(assert (=> b!161230 m!255153))

(declare-fun m!255177 () Bool)

(assert (=> b!161230 m!255177))

(declare-fun m!255179 () Bool)

(assert (=> start!33672 m!255179))

(declare-fun m!255181 () Bool)

(assert (=> start!33672 m!255181))

(check-sat (not b!161232) (not b!161228) (not b!161229) (not start!33672) (not b!161230))
(check-sat)
(get-model)

