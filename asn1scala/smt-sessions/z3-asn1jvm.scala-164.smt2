; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3712 () Bool)

(assert start!3712)

(declare-datatypes ((Unit!1356 0))(
  ( (Unit!1357) )
))
(declare-datatypes ((tuple2!1982 0))(
  ( (tuple2!1983 (_1!1052 Unit!1356) (_2!1052 (_ BitVec 32))) )
))
(declare-fun lt!24424 () tuple2!1982)

(declare-fun e!10026 () tuple2!1982)

(assert (=> start!3712 (= lt!24424 e!10026)))

(declare-fun c!1099 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3712 (= c!1099 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3712 (and (bvsle #b00000000000000000000000000000000 (_2!1052 lt!24424)) (bvsle (_2!1052 lt!24424) #b00000000000000000000000001000000) (bvslt v!288 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= #b00000000000000000000000000000000 (bvand (_2!1052 lt!24424) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 (_2!1052 lt!24424)) #b10000000000000000000000000000000))))))

(assert (=> start!3712 true))

(declare-fun b!16063 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1982)

(assert (=> b!16063 (= e!10026 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!16064 () Bool)

(declare-fun Unit!1358 () Unit!1356)

(assert (=> b!16064 (= e!10026 (tuple2!1983 Unit!1358 #b00000000000000000000000001000000))))

(assert (= (and start!3712 c!1099) b!16063))

(assert (= (and start!3712 (not c!1099)) b!16064))

(declare-fun m!22793 () Bool)

(assert (=> b!16063 m!22793))

(check-sat (not b!16063))
(check-sat)
