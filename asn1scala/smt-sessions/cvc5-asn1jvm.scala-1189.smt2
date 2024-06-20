; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33812 () Bool)

(assert start!33812)

(declare-fun res!134672 () Bool)

(declare-fun e!111261 () Bool)

(assert (=> start!33812 (=> (not res!134672) (not e!111261))))

(declare-datatypes ((array!7983 0))(
  ( (array!7984 (arr!4501 (Array (_ BitVec 32) (_ BitVec 8))) (size!3580 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6328 0))(
  ( (BitStream!6329 (buf!4038 array!7983) (currentByte!7529 (_ BitVec 32)) (currentBit!7524 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6328)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33812 (= res!134672 (validate_offset_byte!0 ((_ sign_extend 32) (size!3580 (buf!4038 thiss!1602))) ((_ sign_extend 32) (currentByte!7529 thiss!1602)) ((_ sign_extend 32) (currentBit!7524 thiss!1602))))))

(assert (=> start!33812 e!111261))

(declare-fun e!111260 () Bool)

(declare-fun inv!12 (BitStream!6328) Bool)

(assert (=> start!33812 (and (inv!12 thiss!1602) e!111260)))

(assert (=> start!33812 true))

(declare-fun b!161543 () Bool)

(declare-fun res!134670 () Bool)

(declare-fun e!111263 () Bool)

(assert (=> b!161543 (=> res!134670 e!111263)))

(declare-fun lt!254268 () (_ BitVec 32))

(assert (=> b!161543 (= res!134670 (bvsle lt!254268 #b00000000000000000000000000000000))))

(declare-fun b!161544 () Bool)

(declare-datatypes ((Unit!11090 0))(
  ( (Unit!11091) )
))
(declare-datatypes ((tuple3!888 0))(
  ( (tuple3!889 (_1!7795 Unit!11090) (_2!7795 (_ BitVec 8)) (_3!561 BitStream!6328)) )
))
(declare-fun lt!254261 () tuple3!888)

(assert (=> b!161544 (= e!111263 (or (bvsgt #b00000000000000000000000000000000 (bvsub (currentByte!7529 (_3!561 lt!254261)) #b00000000000000000000000000000001)) (bvsgt (bvsub (currentByte!7529 (_3!561 lt!254261)) #b00000000000000000000000000000001) (currentByte!7529 (_3!561 lt!254261))) (bvsle (size!3580 (buf!4038 thiss!1602)) (size!3580 (buf!4038 (_3!561 lt!254261))))))))

(declare-fun lt!254264 () array!7983)

(declare-fun lt!254260 () (_ BitVec 8))

(declare-fun lt!254262 () (_ BitVec 8))

(declare-fun arrayRangesEq!532 (array!7983 array!7983 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161544 (arrayRangesEq!532 lt!254264 (array!7984 (store (store (store (arr!4501 (buf!4038 thiss!1602)) (currentByte!7529 thiss!1602) lt!254262) (currentByte!7529 thiss!1602) lt!254260) (currentByte!7529 (_3!561 lt!254261)) (select (arr!4501 (buf!4038 (_3!561 lt!254261))) (currentByte!7529 (_3!561 lt!254261)))) (size!3580 (buf!4038 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7529 (_3!561 lt!254261)))))

(declare-fun lt!254259 () Unit!11090)

(declare-fun arrayUpdatedAtPrefixLemma!140 (array!7983 (_ BitVec 32) (_ BitVec 8)) Unit!11090)

(assert (=> b!161544 (= lt!254259 (arrayUpdatedAtPrefixLemma!140 lt!254264 (currentByte!7529 (_3!561 lt!254261)) (select (arr!4501 (buf!4038 (_3!561 lt!254261))) (currentByte!7529 (_3!561 lt!254261)))))))

(assert (=> b!161544 (arrayRangesEq!532 (buf!4038 thiss!1602) (array!7984 (store (arr!4501 (buf!4038 thiss!1602)) (currentByte!7529 (_3!561 lt!254261)) (select (arr!4501 (buf!4038 (_3!561 lt!254261))) (currentByte!7529 (_3!561 lt!254261)))) (size!3580 (buf!4038 thiss!1602))) #b00000000000000000000000000000000 (currentByte!7529 (_3!561 lt!254261)))))

(declare-fun lt!254265 () Unit!11090)

(assert (=> b!161544 (= lt!254265 (arrayUpdatedAtPrefixLemma!140 (buf!4038 thiss!1602) (currentByte!7529 (_3!561 lt!254261)) (select (arr!4501 (buf!4038 (_3!561 lt!254261))) (currentByte!7529 (_3!561 lt!254261)))))))

(declare-fun b!161545 () Bool)

(assert (=> b!161545 (= e!111261 (not e!111263))))

(declare-fun res!134669 () Bool)

(assert (=> b!161545 (=> res!134669 e!111263)))

(assert (=> b!161545 (= res!134669 (not (arrayRangesEq!532 (buf!4038 thiss!1602) lt!254264 #b00000000000000000000000000000000 (bvsub (currentByte!7529 (_3!561 lt!254261)) #b00000000000000000000000000000001))))))

(declare-fun lt!254258 () (_ BitVec 8))

(assert (=> b!161545 (arrayRangesEq!532 (buf!4038 thiss!1602) (array!7984 (store (arr!4501 (buf!4038 thiss!1602)) (bvsub (currentByte!7529 (_3!561 lt!254261)) #b00000000000000000000000000000001) lt!254258) (size!3580 (buf!4038 thiss!1602))) #b00000000000000000000000000000000 (bvsub (currentByte!7529 (_3!561 lt!254261)) #b00000000000000000000000000000001))))

(declare-fun lt!254266 () Unit!11090)

(assert (=> b!161545 (= lt!254266 (arrayUpdatedAtPrefixLemma!140 (buf!4038 thiss!1602) (bvsub (currentByte!7529 (_3!561 lt!254261)) #b00000000000000000000000000000001) lt!254258))))

(assert (=> b!161545 (= lt!254258 (select (arr!4501 (buf!4038 (_3!561 lt!254261))) (bvsub (currentByte!7529 (_3!561 lt!254261)) #b00000000000000000000000000000001)))))

(declare-fun v!222 () (_ BitVec 8))

(declare-fun lt!254263 () (_ BitVec 32))

(declare-fun lt!254267 () (_ BitVec 8))

(declare-fun lt!254257 () (_ BitVec 32))

(declare-fun Unit!11092 () Unit!11090)

(declare-fun Unit!11093 () Unit!11090)

(assert (=> b!161545 (= lt!254261 (ite (bvsgt lt!254268 #b00000000000000000000000000000000) (let ((bdg!9663 ((_ extract 7 0) (bvnot lt!254263)))) (let ((bdg!9664 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (store (store (arr!4501 (buf!4038 thiss!1602)) (currentByte!7529 thiss!1602) lt!254262) (currentByte!7529 thiss!1602) lt!254260) (bvadd #b00000000000000000000000000000001 (currentByte!7529 thiss!1602)))) ((_ sign_extend 24) bdg!9663))))) (tuple3!889 Unit!11092 bdg!9663 (BitStream!6329 (array!7984 (store (arr!4501 (array!7984 (store (arr!4501 lt!254264) (bvadd #b00000000000000000000000000000001 (currentByte!7529 thiss!1602)) bdg!9664) (size!3580 lt!254264))) (bvadd #b00000000000000000000000000000001 (currentByte!7529 thiss!1602)) ((_ extract 7 0) (bvor ((_ sign_extend 24) bdg!9664) (bvshl ((_ sign_extend 24) v!222) lt!254257)))) (size!3580 (array!7984 (store (arr!4501 lt!254264) (bvadd #b00000000000000000000000000000001 (currentByte!7529 thiss!1602)) bdg!9664) (size!3580 lt!254264)))) (bvadd #b00000000000000000000000000000001 (currentByte!7529 thiss!1602)) (currentBit!7524 thiss!1602))))) (tuple3!889 Unit!11093 lt!254267 (BitStream!6329 lt!254264 (bvadd #b00000000000000000000000000000001 (currentByte!7529 thiss!1602)) (currentBit!7524 thiss!1602)))))))

(declare-fun e!111262 () Bool)

(assert (=> b!161545 e!111262))

(declare-fun res!134671 () Bool)

(assert (=> b!161545 (=> res!134671 e!111262)))

(assert (=> b!161545 (= res!134671 (bvsge (currentByte!7529 thiss!1602) (size!3580 (buf!4038 thiss!1602))))))

(assert (=> b!161545 (= lt!254264 (array!7984 (store (store (arr!4501 (buf!4038 thiss!1602)) (currentByte!7529 thiss!1602) lt!254262) (currentByte!7529 thiss!1602) lt!254260) (size!3580 (buf!4038 thiss!1602))))))

(assert (=> b!161545 (= lt!254260 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!254262) (bvlshr (bvand ((_ sign_extend 24) v!222) #b00000000000000000000000011111111) lt!254268))))))

(assert (=> b!161545 (= lt!254262 ((_ extract 7 0) (bvand ((_ sign_extend 24) (select (arr!4501 (buf!4038 thiss!1602)) (currentByte!7529 thiss!1602))) lt!254263)))))

(assert (=> b!161545 (= lt!254263 ((_ sign_extend 24) lt!254267))))

(assert (=> b!161545 (= lt!254267 ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!254257)))))))

(assert (=> b!161545 (= lt!254257 ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 lt!254268))))))

(assert (=> b!161545 (= lt!254268 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!7524 thiss!1602))))))

(declare-fun b!161546 () Bool)

(declare-fun array_inv!3327 (array!7983) Bool)

(assert (=> b!161546 (= e!111260 (array_inv!3327 (buf!4038 thiss!1602)))))

(declare-fun b!161547 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!161547 (= e!111262 (byteRangesEq!0 (select (arr!4501 (buf!4038 thiss!1602)) (currentByte!7529 thiss!1602)) lt!254260 #b00000000000000000000000000000000 (currentBit!7524 thiss!1602)))))

(assert (= (and start!33812 res!134672) b!161545))

(assert (= (and b!161545 (not res!134671)) b!161547))

(assert (= (and b!161545 (not res!134669)) b!161543))

(assert (= (and b!161543 (not res!134670)) b!161544))

(assert (= start!33812 b!161546))

(declare-fun m!255921 () Bool)

(assert (=> b!161546 m!255921))

(declare-fun m!255923 () Bool)

(assert (=> b!161547 m!255923))

(assert (=> b!161547 m!255923))

(declare-fun m!255925 () Bool)

(assert (=> b!161547 m!255925))

(declare-fun m!255927 () Bool)

(assert (=> start!33812 m!255927))

(declare-fun m!255929 () Bool)

(assert (=> start!33812 m!255929))

(declare-fun m!255931 () Bool)

(assert (=> b!161544 m!255931))

(declare-fun m!255933 () Bool)

(assert (=> b!161544 m!255933))

(declare-fun m!255935 () Bool)

(assert (=> b!161544 m!255935))

(declare-fun m!255937 () Bool)

(assert (=> b!161544 m!255937))

(declare-fun m!255939 () Bool)

(assert (=> b!161544 m!255939))

(declare-fun m!255941 () Bool)

(assert (=> b!161544 m!255941))

(declare-fun m!255943 () Bool)

(assert (=> b!161544 m!255943))

(assert (=> b!161544 m!255931))

(assert (=> b!161544 m!255931))

(declare-fun m!255945 () Bool)

(assert (=> b!161544 m!255945))

(declare-fun m!255947 () Bool)

(assert (=> b!161544 m!255947))

(declare-fun m!255949 () Bool)

(assert (=> b!161545 m!255949))

(declare-fun m!255951 () Bool)

(assert (=> b!161545 m!255951))

(declare-fun m!255953 () Bool)

(assert (=> b!161545 m!255953))

(declare-fun m!255955 () Bool)

(assert (=> b!161545 m!255955))

(assert (=> b!161545 m!255923))

(declare-fun m!255957 () Bool)

(assert (=> b!161545 m!255957))

(declare-fun m!255959 () Bool)

(assert (=> b!161545 m!255959))

(assert (=> b!161545 m!255935))

(assert (=> b!161545 m!255937))

(declare-fun m!255961 () Bool)

(assert (=> b!161545 m!255961))

(declare-fun m!255963 () Bool)

(assert (=> b!161545 m!255963))

(declare-fun m!255965 () Bool)

(assert (=> b!161545 m!255965))

(push 1)

(assert (not start!33812))

(assert (not b!161546))

(assert (not b!161545))

(assert (not b!161547))

(assert (not b!161544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

