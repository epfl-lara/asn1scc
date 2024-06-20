; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3858 () Bool)

(assert start!3858)

(declare-fun res!15260 () Bool)

(declare-fun e!10614 () Bool)

(assert (=> start!3858 (=> (not res!15260) (not e!10614))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!25146 () Bool)

(declare-fun v!291 () (_ BitVec 64))

(assert (=> start!3858 (= res!15260 (and (bvsge i!803 #b00000000000000000000000000000001) (bvsle i!803 #b00000000000000000000000001000000) (bvsge i!803 #b00000000000000000000000000000010) (= (not (= (bvand v!291 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub i!803 #b00000000000000000000000000000010)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!25146) (bvsge (bvsub i!803 #b00000000000000000000000000000001) #b00000000000000000000000000000010) (= (not (= (bvand v!291 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub i!803 #b00000000000000000000000000000011)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!25146)))))

(assert (=> start!3858 (= lt!25146 (not (= (bvand v!291 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3858 e!10614))

(assert (=> start!3858 true))

(declare-fun b!16889 () Bool)

(declare-datatypes ((Unit!1549 0))(
  ( (Unit!1550) )
))
(declare-datatypes ((tuple2!2032 0))(
  ( (tuple2!2033 (_1!1077 Unit!1549) (_2!1077 (_ BitVec 32))) )
))
(declare-fun lt!25147 () tuple2!2032)

(assert (=> b!16889 (= e!10614 (or (bvslt (_2!1077 lt!25147) #b00000000000000000000000000000001) (bvsgt (_2!1077 lt!25147) #b00000000000000000000000001000000)))))

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!2032)

(assert (=> b!16889 (= lt!25147 (GetBitCountSignedWhile!0 v!291 (bvsub i!803 #b00000000000000000000000000000001)))))

(assert (= (and start!3858 res!15260) b!16889))

(declare-fun m!23143 () Bool)

(assert (=> b!16889 m!23143))

(push 1)

(assert (not b!16889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

