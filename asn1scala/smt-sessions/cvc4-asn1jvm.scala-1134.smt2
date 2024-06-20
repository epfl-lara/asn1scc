; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32138 () Bool)

(assert start!32138)

(declare-fun b!159059 () Bool)

(declare-fun e!108495 () Bool)

(declare-datatypes ((array!7543 0))(
  ( (array!7544 (arr!4338 (Array (_ BitVec 32) (_ BitVec 8))) (size!3417 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6002 0))(
  ( (BitStream!6003 (buf!3875 array!7543) (currentByte!7100 (_ BitVec 32)) (currentBit!7095 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6002)

(declare-fun array_inv!3164 (array!7543) Bool)

(assert (=> b!159059 (= e!108495 (array_inv!3164 (buf!3875 thiss!1602)))))

(declare-fun b!159060 () Bool)

(declare-fun e!108493 () Bool)

(declare-fun e!108492 () Bool)

(assert (=> b!159060 (= e!108493 (not e!108492))))

(declare-fun res!132764 () Bool)

(assert (=> b!159060 (=> res!132764 e!108492)))

(declare-datatypes ((Unit!10759 0))(
  ( (Unit!10760) )
))
(declare-datatypes ((tuple3!736 0))(
  ( (tuple3!737 (_1!7716 Unit!10759) (_2!7716 (_ BitVec 8)) (_3!485 BitStream!6002)) )
))
(declare-fun lt!250918 () tuple3!736)

(declare-fun lt!250921 () array!7543)

(declare-fun arrayRangesEq!468 (array!7543 array!7543 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159060 (= res!132764 (not (arrayRangesEq!468 (buf!3875 thiss!1602) lt!250921 #b00000000000000000000000000000000 (bvsub (currentByte!7100 (_3!485 lt!250918)) #b00000000000000000000000000000001))))))

(declare-fun lt!250925 () (_ BitVec 8))

(assert (=> b!159060 (arrayRangesEq!468 (buf!3875 thiss!1602) (array!7544 (store (arr!4338 (buf!3875 thiss!1602)) (bvsub (currentByte!7100 (_3!485 lt!250918)) #b00000000000000000000000000000001) lt!250925) (size!3417 (buf!3875 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7100 (_3!485 lt!250918)) #b00000000000000000000000000000001))))

(declare-fun lt!250919 () Unit!10759)

(declare-fun arrayUpdatedAtPrefixLemma!76 (array!7543 (_ BitVec 32) (_ BitVec 8)) Unit!10759)

(assert (=> b!159060 (= lt!250919 (arrayUpdatedAtPrefixLemma!76 (buf!3875 thiss!1602) (bvsub (currentByte!7100 (_3!485 lt!250918)) #b00000000000000000000000000000001) lt!250925))))

(assert (=> b!159060 (= lt!250925 (select (arr!4338 (buf!3875 (_3!485 lt!250918))) (bvsub (currentByte!7100 (_3!485 lt!250918)) #b00000000000000000000000000000001)))))

(declare-fun lt!250922 () (_ BitVec 8))

(declare-fun lt!250927 () (_ BitVec 32))

(declare-fun lt!250923 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!250920 () (_ BitVec 32))

(declare-fun lt!250929 () (_ BitVec 8))

(declare-fun lt!250924 () (_ BitVec 8))

(declare-fun Unit!10761 () Unit!10759)

(declare-fun Unit!10762 () Unit!10759)

(assert (=> b!159060 (= lt!250918 (ite (bvsgt lt!250927 #b00000000000000000000000000000000) (let ((bdg!9279 ((_ extract 7 0) (bvnot lt!250920)))) (let ((bdg!9280 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4338 (buf!3875 thiss!1602)) (currentByte!7100 thiss!1602) lt!250922) (currentByte!7100 thiss!1602) lt!250929) (bvadd #b00000000000000000000000000000001 (currentByte!7100 thiss!1602)))) ((_ sign_extend 24) bdg!9279))))) (tuple3!737 Unit!10761 bdg!9279 (BitStream!6003 (array!7544 (store (arr!4338 (array!7544 (store (arr!4338 lt!250921) (bvadd #b00000000000000000000000000000001 (currentByte!7100 thiss!1602)) bdg!9280) (size!3417 lt!250921))) (bvadd #b00000000000000000000000000000001 (currentByte!7100 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9280) (bvshl ((_ sign_extend 24) v!222) lt!250923)))) (size!3417 (array!7544 (store (arr!4338 lt!250921) (bvadd #b00000000000000000000000000000001 (currentByte!7100 thiss!1602)) bdg!9280) (size!3417 lt!250921)))) (bvadd #b00000000000000000000000000000001 (currentByte!7100 thiss!1602)) (currentBit!7095 thiss!1602))))) (tuple3!737 Unit!10762 lt!250924 (BitStream!6003 lt!250921 (bvadd #b00000000000000000000000000000001 (currentByte!7100 thiss!1602)) (currentBit!7095 thiss!1602)))))))

(declare-fun e!108491 () Bool)

(assert (=> b!159060 e!108491))

(declare-fun res!132767 () Bool)

(assert (=> b!159060 (=> res!132767 e!108491)))

(assert (=> b!159060 (= res!132767 (bvsge (currentByte!7100 thiss!1602) (size!3417 (buf!3875 thiss!1602))))))

(assert (=> b!159060 (= lt!250921 (array!7544 (store (store (arr!4338 (buf!3875 thiss!1602)) (currentByte!7100 thiss!1602) lt!250922) (currentByte!7100 thiss!1602) lt!250929) (size!3417 (buf!3875 thiss!1602))))))

(assert (=> b!159060 (= lt!250929 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!250922) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!250927))))))

(assert (=> b!159060 (= lt!250922 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4338 (buf!3875 thiss!1602)) (currentByte!7100 thiss!1602))) lt!250920)))))

(assert (=> b!159060 (= lt!250920 ((_ sign_extend 24) lt!250924))))

(assert (=> b!159060 (= lt!250924 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!250923)))))))

(assert (=> b!159060 (= lt!250923 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!250927))))))

(assert (=> b!159060 (= lt!250927 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7095 thiss!1602))))))

(declare-fun b!159062 () Bool)

(assert (=> b!159062 (= e!108492 true)))

(assert (=> b!159062 (arrayRangesEq!468 lt!250921 (array!7544 (store (store (store (arr!4338 (buf!3875 thiss!1602)) (currentByte!7100 thiss!1602) lt!250922) (currentByte!7100 thiss!1602) lt!250929) (currentByte!7100 (_3!485 lt!250918)) (select (arr!4338 (buf!3875 (_3!485 lt!250918))) (currentByte!7100 (_3!485 lt!250918)))) (size!3417 (buf!3875 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7100 (_3!485 lt!250918)))))

(declare-fun lt!250926 () Unit!10759)

(assert (=> b!159062 (= lt!250926 (arrayUpdatedAtPrefixLemma!76 lt!250921 (currentByte!7100 (_3!485 lt!250918)) (select (arr!4338 (buf!3875 (_3!485 lt!250918))) (currentByte!7100 (_3!485 lt!250918)))))))

(assert (=> b!159062 (arrayRangesEq!468 (buf!3875 thiss!1602) (array!7544 (store (arr!4338 (buf!3875 thiss!1602)) (currentByte!7100 (_3!485 lt!250918)) (select (arr!4338 (buf!3875 (_3!485 lt!250918))) (currentByte!7100 (_3!485 lt!250918)))) (size!3417 (buf!3875 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7100 (_3!485 lt!250918)))))

(declare-fun lt!250928 () Unit!10759)

(assert (=> b!159062 (= lt!250928 (arrayUpdatedAtPrefixLemma!76 (buf!3875 thiss!1602) (currentByte!7100 (_3!485 lt!250918)) (select (arr!4338 (buf!3875 (_3!485 lt!250918))) (currentByte!7100 (_3!485 lt!250918)))))))

(declare-fun b!159063 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!159063 (= e!108491 (byteRangesEq!0 (select (arr!4338 (buf!3875 thiss!1602)) (currentByte!7100 thiss!1602)) lt!250929 #b00000000000000000000000000000000 (currentBit!7095 thiss!1602)))))

(declare-fun b!159061 () Bool)

(declare-fun res!132765 () Bool)

(assert (=> b!159061 (=> res!132765 e!108492)))

(assert (=> b!159061 (= res!132765 (bvsle lt!250927 #b00000000000000000000000000000000))))

(declare-fun res!132766 () Bool)

(assert (=> start!32138 (=> (not res!132766) (not e!108493))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32138 (= res!132766 (validate_offset_byte!0 ((_ sign_extend 32) (size!3417 (buf!3875 thiss!1602))) ((_ sign_extend 32) (currentByte!7100 thiss!1602)) ((_ sign_extend 32) (currentBit!7095 thiss!1602))))))

(assert (=> start!32138 e!108493))

(declare-fun inv!12 (BitStream!6002) Bool)

(assert (=> start!32138 (and (inv!12 thiss!1602) e!108495)))

(assert (=> start!32138 true))

(assert (= (and start!32138 res!132766) b!159060))

(assert (= (and b!159060 (not res!132767)) b!159063))

(assert (= (and b!159060 (not res!132764)) b!159061))

(assert (= (and b!159061 (not res!132765)) b!159062))

(assert (= start!32138 b!159059))

(declare-fun m!250137 () Bool)

(assert (=> b!159060 m!250137))

(declare-fun m!250139 () Bool)

(assert (=> b!159060 m!250139))

(declare-fun m!250141 () Bool)

(assert (=> b!159060 m!250141))

(declare-fun m!250143 () Bool)

(assert (=> b!159060 m!250143))

(declare-fun m!250145 () Bool)

(assert (=> b!159060 m!250145))

(declare-fun m!250147 () Bool)

(assert (=> b!159060 m!250147))

(declare-fun m!250149 () Bool)

(assert (=> b!159060 m!250149))

(declare-fun m!250151 () Bool)

(assert (=> b!159060 m!250151))

(declare-fun m!250153 () Bool)

(assert (=> b!159060 m!250153))

(declare-fun m!250155 () Bool)

(assert (=> b!159060 m!250155))

(declare-fun m!250157 () Bool)

(assert (=> b!159060 m!250157))

(declare-fun m!250159 () Bool)

(assert (=> b!159060 m!250159))

(declare-fun m!250161 () Bool)

(assert (=> b!159059 m!250161))

(declare-fun m!250163 () Bool)

(assert (=> b!159062 m!250163))

(declare-fun m!250165 () Bool)

(assert (=> b!159062 m!250165))

(assert (=> b!159062 m!250139))

(declare-fun m!250167 () Bool)

(assert (=> b!159062 m!250167))

(assert (=> b!159062 m!250163))

(declare-fun m!250169 () Bool)

(assert (=> b!159062 m!250169))

(declare-fun m!250171 () Bool)

(assert (=> b!159062 m!250171))

(declare-fun m!250173 () Bool)

(assert (=> b!159062 m!250173))

(assert (=> b!159062 m!250153))

(assert (=> b!159062 m!250163))

(declare-fun m!250175 () Bool)

(assert (=> b!159062 m!250175))

(assert (=> b!159063 m!250147))

(assert (=> b!159063 m!250147))

(declare-fun m!250177 () Bool)

(assert (=> b!159063 m!250177))

(declare-fun m!250179 () Bool)

(assert (=> start!32138 m!250179))

(declare-fun m!250181 () Bool)

(assert (=> start!32138 m!250181))

(push 1)

(assert (not b!159059))

(assert (not b!159062))

(assert (not b!159060))

(assert (not b!159063))

(assert (not start!32138))

(check-sat)

(pop 1)

