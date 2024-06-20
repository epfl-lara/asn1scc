; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3850 () Bool)

(assert start!3850)

(declare-fun res!15248 () Bool)

(declare-fun e!10602 () Bool)

(assert (=> start!3850 (=> (not res!15248) (not e!10602))))

(declare-fun lt!25122 () Bool)

(declare-fun v!291 () (_ BitVec 64))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> start!3850 (= res!15248 (and (bvsge i!803 #b00000000000000000000000000000001) (bvsle i!803 #b00000000000000000000000001000000) (bvsge i!803 #b00000000000000000000000000000010) (= (not (= (bvand v!291 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub i!803 #b00000000000000000000000000000010)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!25122) (bvsge (bvsub i!803 #b00000000000000000000000000000001) #b00000000000000000000000000000010) (= (not (= (bvand v!291 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub i!803 #b00000000000000000000000000000011)))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!25122)))))

(assert (=> start!3850 (= lt!25122 (not (= (bvand v!291 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3850 e!10602))

(assert (=> start!3850 true))

(declare-fun b!16877 () Bool)

(declare-datatypes ((Unit!1541 0))(
  ( (Unit!1542) )
))
(declare-datatypes ((tuple2!2024 0))(
  ( (tuple2!2025 (_1!1073 Unit!1541) (_2!1073 (_ BitVec 32))) )
))
(declare-fun lt!25123 () tuple2!2024)

(assert (=> b!16877 (= e!10602 (and (bvsge (_2!1073 lt!25123) #b00000000000000000000000000000001) (bvsle (_2!1073 lt!25123) #b00000000000000000000000001000000) (bvsge (_2!1073 lt!25123) #b00000000000000000000000000000010) (let ((bdg!564 ((_ sign_extend 32) (bvsub (_2!1073 lt!25123) #b00000000000000000000000000000010)))) (or (bvslt bdg!564 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt bdg!564 #b0000000000000000000000000000000000000000000000000000000001000000)))))))

(declare-fun GetBitCountSignedWhile!0 ((_ BitVec 64) (_ BitVec 32)) tuple2!2024)

(assert (=> b!16877 (= lt!25123 (GetBitCountSignedWhile!0 v!291 (bvsub i!803 #b00000000000000000000000000000001)))))

(assert (= (and start!3850 res!15248) b!16877))

(declare-fun m!23135 () Bool)

(assert (=> b!16877 m!23135))

(check-sat (not b!16877))
(check-sat)
