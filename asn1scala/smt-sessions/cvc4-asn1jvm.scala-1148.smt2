; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32528 () Bool)

(assert start!32528)

(declare-fun res!133735 () Bool)

(declare-fun e!109641 () Bool)

(assert (=> start!32528 (=> (not res!133735) (not e!109641))))

(declare-datatypes ((array!7646 0))(
  ( (array!7647 (arr!4380 (Array (_ BitVec 32) (_ BitVec 8))) (size!3459 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6086 0))(
  ( (BitStream!6087 (buf!3917 array!7646) (currentByte!7172 (_ BitVec 32)) (currentBit!7167 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6086)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!32528 (= res!133735 (validate_offset_byte!0 ((_ sign_extend 32) (size!3459 (buf!3917 thiss!1602))) ((_ sign_extend 32) (currentByte!7172 thiss!1602)) ((_ sign_extend 32) (currentBit!7167 thiss!1602))))))

(assert (=> start!32528 e!109641))

(declare-fun e!109639 () Bool)

(declare-fun inv!12 (BitStream!6086) Bool)

(assert (=> start!32528 (and (inv!12 thiss!1602) e!109639)))

(assert (=> start!32528 true))

(declare-fun lt!252927 () array!7646)

(declare-datatypes ((Unit!10954 0))(
  ( (Unit!10955) )
))
(declare-datatypes ((tuple3!820 0))(
  ( (tuple3!821 (_1!7761 Unit!10954) (_2!7761 (_ BitVec 8)) (_3!527 BitStream!6086)) )
))
(declare-fun lt!252924 () tuple3!820)

(declare-fun b!160246 () Bool)

(declare-fun arrayRangesEq!510 (array!7646 array!7646 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160246 (= e!109641 (not (arrayRangesEq!510 (buf!3917 thiss!1602) lt!252927 #b00000000000000000000000000000000 (bvsub (currentByte!7172 (_3!527 lt!252924)) #b00000000000000000000000000000001))))))

(declare-fun lt!252930 () (_ BitVec 8))

(assert (=> b!160246 (arrayRangesEq!510 (buf!3917 thiss!1602) (array!7647 (store (arr!4380 (buf!3917 thiss!1602)) (bvsub (currentByte!7172 (_3!527 lt!252924)) #b00000000000000000000000000000001) lt!252930) (size!3459 (buf!3917 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7172 (_3!527 lt!252924)) #b00000000000000000000000000000001))))

(declare-fun lt!252925 () Unit!10954)

(declare-fun arrayUpdatedAtPrefixLemma!118 (array!7646 (_ BitVec 32) (_ BitVec 8)) Unit!10954)

(assert (=> b!160246 (= lt!252925 (arrayUpdatedAtPrefixLemma!118 (buf!3917 thiss!1602) (bvsub (currentByte!7172 (_3!527 lt!252924)) #b00000000000000000000000000000001) lt!252930))))

(assert (=> b!160246 (= lt!252930 (select (arr!4380 (buf!3917 (_3!527 lt!252924))) (bvsub (currentByte!7172 (_3!527 lt!252924)) #b00000000000000000000000000000001)))))

(declare-fun lt!252929 () (_ BitVec 32))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!252922 () (_ BitVec 8))

(declare-fun lt!252928 () (_ BitVec 8))

(declare-fun lt!252926 () (_ BitVec 32))

(declare-fun lt!252921 () (_ BitVec 8))

(declare-fun lt!252923 () (_ BitVec 32))

(declare-fun Unit!10956 () Unit!10954)

(declare-fun Unit!10957 () Unit!10954)

(assert (=> b!160246 (= lt!252924 (ite (bvsgt lt!252923 #b00000000000000000000000000000000) (let ((bdg!9489 ((_ extract 7 0) (bvnot lt!252926)))) (let ((bdg!9490 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4380 (buf!3917 thiss!1602)) (currentByte!7172 thiss!1602) lt!252928) (currentByte!7172 thiss!1602) lt!252921) (bvadd #b00000000000000000000000000000001 (currentByte!7172 thiss!1602)))) ((_ sign_extend 24) bdg!9489))))) (tuple3!821 Unit!10956 bdg!9489 (BitStream!6087 (array!7647 (store (arr!4380 (array!7647 (store (arr!4380 lt!252927) (bvadd #b00000000000000000000000000000001 (currentByte!7172 thiss!1602)) bdg!9490) (size!3459 lt!252927))) (bvadd #b00000000000000000000000000000001 (currentByte!7172 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9490) (bvshl ((_ sign_extend 24) v!222) lt!252929)))) (size!3459 (array!7647 (store (arr!4380 lt!252927) (bvadd #b00000000000000000000000000000001 (currentByte!7172 thiss!1602)) bdg!9490) (size!3459 lt!252927)))) (bvadd #b00000000000000000000000000000001 (currentByte!7172 thiss!1602)) (currentBit!7167 thiss!1602))))) (tuple3!821 Unit!10957 lt!252922 (BitStream!6087 lt!252927 (bvadd #b00000000000000000000000000000001 (currentByte!7172 thiss!1602)) (currentBit!7167 thiss!1602)))))))

(declare-fun e!109640 () Bool)

(assert (=> b!160246 e!109640))

(declare-fun res!133736 () Bool)

(assert (=> b!160246 (=> res!133736 e!109640)))

(assert (=> b!160246 (= res!133736 (bvsge (currentByte!7172 thiss!1602) (size!3459 (buf!3917 thiss!1602))))))

(assert (=> b!160246 (= lt!252927 (array!7647 (store (store (arr!4380 (buf!3917 thiss!1602)) (currentByte!7172 thiss!1602) lt!252928) (currentByte!7172 thiss!1602) lt!252921) (size!3459 (buf!3917 thiss!1602))))))

(assert (=> b!160246 (= lt!252921 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!252928) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!252923))))))

(assert (=> b!160246 (= lt!252928 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4380 (buf!3917 thiss!1602)) (currentByte!7172 thiss!1602))) lt!252926)))))

(assert (=> b!160246 (= lt!252926 ((_ sign_extend 24) lt!252922))))

(assert (=> b!160246 (= lt!252922 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!252929)))))))

(assert (=> b!160246 (= lt!252929 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!252923))))))

(assert (=> b!160246 (= lt!252923 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7167 thiss!1602))))))

(declare-fun b!160247 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!160247 (= e!109640 (byteRangesEq!0 (select (arr!4380 (buf!3917 thiss!1602)) (currentByte!7172 thiss!1602)) lt!252921 #b00000000000000000000000000000000 (currentBit!7167 thiss!1602)))))

(declare-fun b!160248 () Bool)

(declare-fun array_inv!3206 (array!7646) Bool)

(assert (=> b!160248 (= e!109639 (array_inv!3206 (buf!3917 thiss!1602)))))

(assert (= (and start!32528 res!133735) b!160246))

(assert (= (and b!160246 (not res!133736)) b!160247))

(assert (= start!32528 b!160248))

(declare-fun m!252971 () Bool)

(assert (=> start!32528 m!252971))

(declare-fun m!252973 () Bool)

(assert (=> start!32528 m!252973))

(declare-fun m!252975 () Bool)

(assert (=> b!160246 m!252975))

(declare-fun m!252977 () Bool)

(assert (=> b!160246 m!252977))

(declare-fun m!252979 () Bool)

(assert (=> b!160246 m!252979))

(declare-fun m!252981 () Bool)

(assert (=> b!160246 m!252981))

(declare-fun m!252983 () Bool)

(assert (=> b!160246 m!252983))

(declare-fun m!252985 () Bool)

(assert (=> b!160246 m!252985))

(declare-fun m!252987 () Bool)

(assert (=> b!160246 m!252987))

(declare-fun m!252989 () Bool)

(assert (=> b!160246 m!252989))

(declare-fun m!252991 () Bool)

(assert (=> b!160246 m!252991))

(declare-fun m!252993 () Bool)

(assert (=> b!160246 m!252993))

(declare-fun m!252995 () Bool)

(assert (=> b!160246 m!252995))

(declare-fun m!252997 () Bool)

(assert (=> b!160246 m!252997))

(assert (=> b!160247 m!252987))

(assert (=> b!160247 m!252987))

(declare-fun m!252999 () Bool)

(assert (=> b!160247 m!252999))

(declare-fun m!253001 () Bool)

(assert (=> b!160248 m!253001))

(push 1)

(assert (not b!160248))

(assert (not b!160247))

(assert (not b!160246))

(assert (not start!32528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

