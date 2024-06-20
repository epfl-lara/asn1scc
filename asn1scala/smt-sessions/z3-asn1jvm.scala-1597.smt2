; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45366 () Bool)

(assert start!45366)

(declare-fun res!185378 () Bool)

(declare-fun e!149440 () Bool)

(assert (=> start!45366 (=> (not res!185378) (not e!149440))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45366 (= res!185378 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45366 e!149440))

(assert (=> start!45366 true))

(declare-datatypes ((array!10707 0))(
  ( (array!10708 (arr!5633 (Array (_ BitVec 32) (_ BitVec 8))) (size!4703 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8514 0))(
  ( (BitStream!8515 (buf!5250 array!10707) (currentByte!9853 (_ BitVec 32)) (currentBit!9848 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8514)

(declare-fun e!149441 () Bool)

(declare-fun inv!12 (BitStream!8514) Bool)

(assert (=> start!45366 (and (inv!12 bs!62) e!149441)))

(declare-fun b!220045 () Bool)

(declare-fun res!185377 () Bool)

(assert (=> b!220045 (=> (not res!185377) (not e!149440))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220045 (= res!185377 (validate_offset_bits!1 ((_ sign_extend 32) (size!4703 (buf!5250 bs!62))) ((_ sign_extend 32) (currentByte!9853 bs!62)) ((_ sign_extend 32) (currentBit!9848 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220046 () Bool)

(assert (=> b!220046 (= e!149440 (bvsgt #b00000000000000000000000000000000 (bvsub #b00000000000000000000000001000000 i!541)))))

(declare-fun b!220047 () Bool)

(declare-fun array_inv!4444 (array!10707) Bool)

(assert (=> b!220047 (= e!149441 (array_inv!4444 (buf!5250 bs!62)))))

(assert (= (and start!45366 res!185378) b!220045))

(assert (= (and b!220045 res!185377) b!220046))

(assert (= start!45366 b!220047))

(declare-fun m!338779 () Bool)

(assert (=> start!45366 m!338779))

(declare-fun m!338781 () Bool)

(assert (=> b!220045 m!338781))

(declare-fun m!338783 () Bool)

(assert (=> b!220047 m!338783))

(check-sat (not b!220047) (not start!45366) (not b!220045))
(check-sat)
