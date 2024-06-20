; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3674 () Bool)

(assert start!3674)

(declare-datatypes ((Unit!1317 0))(
  ( (Unit!1318) )
))
(declare-datatypes ((tuple2!1956 0))(
  ( (tuple2!1957 (_1!1039 Unit!1317) (_2!1039 (_ BitVec 32))) )
))
(declare-fun lt!24385 () tuple2!1956)

(declare-fun e!9987 () tuple2!1956)

(assert (=> start!3674 (= lt!24385 e!9987)))

(declare-fun c!1060 () Bool)

(declare-fun v!288 () (_ BitVec 64))

(assert (=> start!3674 (= c!1060 (= (not (= (bvand v!288 #b0100000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand v!288 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> start!3674 false))

(assert (=> start!3674 true))

(declare-fun b!15985 () Bool)

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!1956)

(assert (=> b!15985 (= e!9987 (GetBitCountSignedWhile!0 v!288 #b00000000000000000000000001000000))))

(declare-fun b!15986 () Bool)

(declare-fun Unit!1319 () Unit!1317)

(assert (=> b!15986 (= e!9987 (tuple2!1957 Unit!1319 #b00000000000000000000000001000000))))

(assert (= (and start!3674 c!1060) b!15985))

(assert (= (and start!3674 (not c!1060)) b!15986))

(declare-fun m!22767 () Bool)

(assert (=> b!15985 m!22767))

(push 1)

(assert (not b!15985))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

